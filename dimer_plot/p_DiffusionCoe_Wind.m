% plot DC under respective wind strength in one exp.
clc;clear all;close all;
ExpName='dimer_exp19';
Located= ['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/Datanalysis/DC/'];
ProcessFile = ['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/ref/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
ylimbottom=0.01;
ylimtop=10000;
DCref=[1 10;200 2000];
figure%('Visible','off');
for iwind=1:length(wind)   
    filename=num2str(wind(iwind));
    load([ProcessFile filename '/SBDiffusionCoe.mat'],'AvgSubMSD');
    time=1:length(AvgSubMSD);
    time=time/30;
    icolor=iwind/length(wind)-0.025;
    %% for average 100 particles

    loglog(time,AvgSubMSD,'Color',[icolor 0.5 1-icolor],'Marker','o',...
        'MarkerSize',3,'MarkerFaceColor',[icolor 0.5 1-icolor]);
    hold on
    loglog(DCref(1,:),DCref(2,:),'Color','k','LineWidth',2)
    set(gca,'FontSize',20,'ylim',[ylimbottom ylimtop])
    title(['DC of average 100 particles' filename],'fontsize',24,'fontweight','b');
    xlabel('Time interval (s) ','fontsize',22);
    ylabel('MSD (mm)^2 ','fontsize',22);
    %print(gcf,'-dpng', '-r200', [Located filename '.png']);
    %clf

end