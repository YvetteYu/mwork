clc;clear all;close all;
ExpName='dimer_exp1518';
ExpNum='18';
File=['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
load([File ExpNum '/DCFit.mat'],'DiffusionC','alfa')
load([File ExpNum '/DiffusionCoe.mat'],'AvgMSD');
wind=1:size(AvgMSD,1);
DCref=[0.1 1;10 100];
figure%('visible','off')
for iwind=1:length(wind)
    
    x=(0:size(AvgMSD(iwind,:),2)-1);
    time=x/30;
    loglog(time,AvgMSD((iwind),:),'b','LineWidth',1); hold on
    %% plot the fitting line
    fy=DiffusionC(iwind)*(x.^alfa(iwind));
    loglog(time,fy,'r','LineWidth',1);hold on
    %% plot the reference slope = 1
    loglog(DCref(1,:),DCref(2,:),'Color','k','LineWidth',2)
    legend('Data','Fitting','reference slope','FontSize',6,'Location','southeast');
    set(gca,'FontSize',20);
    set(gca,'xlim',[0 length(x)+5]);
    xlabel('time interval (frames)','fontsize',20);
    ylabel('MSD (mm^2) ) ','fontsize',20)
    print(gcf,'-dpng','-r200',[Located 'fitting/' ExpNum '/' num2str(iwind) '.png'])
    clf
    
end