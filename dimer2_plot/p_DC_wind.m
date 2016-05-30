clc;clear all;close all;
ExpName='monomer_exp710';
File = ['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/DC/'];
load([File 'Exp_parameter.mat'],'Exp_info');
ExpNum=Exp_info.Number;
DCref=[0.1 1;10 100];
figure
for iExpNum=1:length(ExpNum)
    load([File num2str(ExpNum(iExpNum)) '/DiffusionCoe.mat'],'AvgMSD');
    for iwind=1:size(AvgMSD,1)
        icolor=iwind/size(AvgMSD,1)-0.015;
        tempDC=AvgMSD(iwind,:);
        time=1:length(tempDC);
        time=time/30;
        loglog(time,tempDC,'Color',[icolor 0.5 1-icolor],'Marker','o',...
        'MarkerSize',2,'MarkerFaceColor',[icolor 0.5 1-icolor]);
        hold on
        loglog(DCref(1,:),DCref(2,:),'Color','k','LineWidth',2)
        set(gca,'FontSize',20);
        set(gca,'ylim',[0.001 10000]);
        xlabel('Time interval (s) ','fontsize',22);
        ylabel('MSD (mm)^2 ','fontsize',22);
        windstr=num2str(ExpNum(iExpNum));
        print(gcf,'-dpng', '-r200', [Located windstr '/' num2str(iwind) '.png']);
        clf
    end
end