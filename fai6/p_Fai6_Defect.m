 % Inner defect (N-B1) and AC - time 
clc; clear all; close all;
ExpName='monomer_exp710';
skip=5;
span=11;
FilePath=['C:/Users/user/Dropbox/Exp/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.Number;
defectmax=25;defectmin=0;
fai6max=0.9;fai6min=0.4;
figure
for iwind=1:length(wind)
    load([FilePath num2str(wind(iwind)) '/Fai6.mat'],'FaiR');
    load([FilePath num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([FilePath num2str(wind(iwind)) '/Bdefect.mat'],'NumB1DF*');

    AvgFaiR=mean(FaiR,2);
    AvgFaiR=AvgFaiR(1:skip:end);
    smFaiR=smooth(AvgFaiR,span);
    clear AvgFaiR FaiR   
    
    tempdefect5=th5(1:skip:end)-NumB1DF5(1:skip:end);
    tempdefect7=th7(1:skip:end)-NumB1DF7(1:skip:end);
    smdefect5=smooth(tempdefect5,span);
    smdefect7=smooth(tempdefect7,span);
    clear temp*
    
    time=(0:length(smFaiR)-1)*skip/30; 
   
    %% set the data limit
   xlimit=round(time(end))+10;
    
   %% plot defect5 and AC
    plot(time,smdefect7,'Color',[0 0.8 0.4],'LineWidth',1);hold on
    [hAx hdefect5 hfai6]=plotyy(time,smdefect5,time,smFaiR);
    
   %% set the position of figure 
    axposition=get(hAx(1),'Position');
    newposition=[axposition(1) axposition(2) axposition(3)-0.06 axposition(4)-0.04];
    
   %% set the axis   
    set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',1);
    set(hfai6,'Color',[1 0.2 0.2],'LineWidth',1);
    grid on
    
    set(hAx(1),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(1),'xlim',[0 xlimit],'XTick',0:100:xlimit);
    set(hAx(1),'ylim',[defectmin defectmax],'YTick',defectmin:5:defectmax)
    set(hAx(2),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(2),'ylim',[fai6min fai6max],'YTick',fai6min:0.05:fai6max);
    set(hAx(2),'xlim',[0 xlimit]);
    
    hl=legend('Defect7','Defect5','Fai6'); box off;
    set(hl,'FontSize',10);
    
    title('Inner Defect and Fai6 ','fontsize',22);
    xlabel('time(s) ','fontsize',18);
    ylabel(hAx(1),'IDF Number ','fontsize',18,'Color','k');
    ylabel(hAx(2),'Fai6 ','fontsize',18,'Color','k');
    saveas(gcf,[Located 'Fai6_Defect/' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'Fai6_Defect/' num2str(wind(iwind)) '.png']);
    clf;clear h* axposition

end

