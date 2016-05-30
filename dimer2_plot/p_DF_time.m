 % Inner defect (N-B1) - time 
clc; clear all; close all;
ExpName='monomer_exp710';
skip=10;
span=11;
FilePath=['C:/Users/user/Dropbox/Exp/' ExpName '/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
wind=9:10;
defectmax=30;defectmin=0;
figure
for iwind=1:length(wind)
    
    load([FilePath 'ref/' num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([FilePath 'ref/' num2str(wind(iwind)) '/Bdefect.mat'],'NumB1DF*');
    tempdefect5=th5(1:skip:end)-NumB1DF5(1:skip:end);
    tempdefect7=th7(1:skip:end)-NumB1DF7(1:skip:end);
    smdefect5=smooth(tempdefect5,span);
    smdefect7=smooth(tempdefect7,span);
    time=(1:length(smdefect5))*skip/30;  
   
    %% set the data limit
   % [defectmax defectmin]=myLimit(tempdefect5,tempdefect7,5);
   % [acmax acmin]=m_Limit(tempAC,0.05);
   xlimit=round(time(end))+5;
    
   %% plot defect5 and AC
    hf=plot(time,tempdefect7,time,tempdefect5);hold on
    hAx=gca;   
   %% set the axis   
    set(hf(1),'Color',[0 0.4 0.8],'LineWidth',1);
    set(hf(2),'Color',[0 0.8 0.4],'LineWidth',1);
    grid on
    box on
    set(hAx,'FontSize',18,'YColor','k');
    set(hAx,'xlim',[0 xlimit],'XTick',0:100:xlimit);
    set(hAx,'ylim',[defectmin defectmax],'YTick',defectmin:5:defectmax)
  
    hl=legend('Defect7','Defect5');
    set(hl,'FontSize',10);
    
    title('Inner Defect (N-B1) ','fontsize',22);
    xlabel('time(s) ','fontsize',18);
    ylabel(hAx,'IDF Number ','fontsize',18,'Color','k');
    saveas(gcf,[Located 'Defect/' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'Defect/' num2str(wind(iwind)) '.png']);
    clf;clear h* axposition
    
    %% plot smooth defect5 and smooth AC
    hf=plot(time,smdefect7,time,smdefect5);hold on
    hAx=gca;
   %% set the axis    
    set(hf(1),'Color',[0 0.8 0.4],'LineWidth',2);
    set(hf(2),'Color',[0 0.4 0.8],'LineWidth',2);
    box on
    grid on 
    set(hAx,'FontSize',18,'YColor','k');
    set(hAx,'xlim',[0 xlimit],'XTick',0:100:xlimit);
    set(hAx,'ylim',[defectmin defectmax],'YTick',defectmin:5:defectmax);    
    
    hl=legend('Defect7','Defect5');box off;
    set(hl,'FontSize',10);
    
    title('Inner Defect','fontsize',22);
    xlabel('time(s) ','fontsize',18);
    ylabel(hAx(1),'IDF Number ','fontsize',18,'Color','k');
    saveas(gcf,[Located 'Defect/sm' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'Defect/sm' num2str(wind(iwind)) '.png']);
    clf;clear h* *position
    %}
end

