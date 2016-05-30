 % Inner defect (N-B1) and AC - time 
clc; clear all; close all;
ExpName='dimer_exp11';
skip=10;
span=11;
FilePath=['C:/Users/user/Dropbox/Exp/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.pnumber;
defectmax=30;defectmin=0;
acmax=1;acmin=0.5;
figure
for iwind=1:length(wind)
    
    load([FilePath num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([FilePath num2str(wind(iwind)) '/Bdefect.mat'],'NumB1DF*');
    load([FilePath num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
    tempdefect5=th5(1:skip:end)-NumB1DF5(1:skip:end);
    tempdefect7=th7(1:skip:end)-NumB1DF7(1:skip:end);
    tempAC=AvgAC(1:skip:end);
    smdefect5=smooth(tempdefect5,span);
    smdefect7=smooth(tempdefect7,span);
    smAC=smooth(tempAC,span);
    time=(1:length(smAC))*skip/30;  
   
    %% set the data limit
   % [defectmax defectmin]=myLimit(tempdefect5,tempdefect7,5);
   % [acmax acmin]=m_Limit(tempAC,0.05);
   xlimit=round(time(end))+5;
    
   %% plot defect5 and AC
    plot(time,tempdefect7,'Color',[0 0.8 0.4],'LineWidth',1);hold on
    [hAx hdefect5 hAC]=plotyy(time,tempdefect5,time,tempAC);
    
   %% set the position of figure 
    axposition=get(hAx(1),'Position');
    newposition=[axposition(1) axposition(2) axposition(3)-0.06 axposition(4)-0.04];
    
   %% set the axis   
    set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',1);
    set(hAC,'Color',[1 0.2 0.2],'LineWidth',1);
    grid on
    
    set(hAx(1),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(1),'xlim',[0 xlimit],'XTick',0:100:xlimit);
    set(hAx(1),'ylim',[defectmin defectmax],'YTick',defectmin:5:defectmax)
    set(hAx(2),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(2),'ylim',[acmin acmax],'YTick',acmin:0.05:acmax);
    set(hAx(2),'xlim',[0 xlimit]);
    
    hl=legend('Defect7','Defect5','AC'); box off;
    set(hl,'FontSize',10);
    
    title('Inner Defect and AC ','fontsize',22);
    xlabel('time(s) ','fontsize',18);
    ylabel(hAx(1),'IDF Number ','fontsize',18,'Color','k');
    ylabel(hAx(2),'Angle Correlation ','fontsize',18,'Color','k');
    saveas(gcf,[Located 'AC_Defect/' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'AC_Defect/' num2str(wind(iwind)) '.png']);
    clf;clear h* axposition
    
    %% plot smooth defect5 and smooth AC
    plot(time,smdefect7,'Color',[0 0.8 0.4],'LineWidth',2);hold on
    [hAx hdefect5 hAC]=plotyy(time,smdefect5,time,smAC);
   
   %% set the axis    
    set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',2);
    set(hAC,'Color',[1 0.2 0.2],'LineWidth',2);
    grid on
    
    set(hAx(1),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(1),'xlim',[0 xlimit],'XTick',0:100:xlimit);
    set(hAx(1),'ylim',[defectmin defectmax],'YTick',defectmin:5:defectmax);
    set(hAx(2),'FontSize',18,'YColor','k','Position',newposition);
    set(hAx(2),'ylim',[acmin acmax],'YTick',acmin:0.05:acmax);
    set(hAx(2),'xlim',[0 xlimit]);
    
    hl=legend('Defect7','Defect5','AC');box off;
    set(hl,'FontSize',10);
    
    title('Inner Defect - Smooth AC','fontsize',22);
    xlabel('time(s) ','fontsize',18);
    ylabel(hAx(1),'IDF Number ','fontsize',18,'Color','k');
    ylabel(hAx(2),'Angle Correlation ','fontsize',18,'Color','k');
    saveas(gcf,[Located 'AC_Defect/sm' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'AC_Defect/sm' num2str(wind(iwind)) '.png']);
    clf;clear h* *position
    %}
end

