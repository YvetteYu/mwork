clc;clear all;close all;
ExpName='monomer_exp710';
File = ['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/DC/'];
load([File 'Exp_parameter.mat'],'Exp_info');
ExpNum=Exp_info.Number;
ylimbottom=0.01; ylimtop=10000;
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
        'MarkerSize',3,'MarkerFaceColor',[icolor 0.5 1-icolor]);
        hold on       
    end
    loglog(DCref(1,:),DCref(2,:),'Color','k','LineWidth',2)
    set(gca,'FontSize',20);
    set(gca,'xlim',[0 time(end)+10],'ylim',[ylimbottom ylimtop]);
    set(gca,'YTick',[0.01 0.1 1 10 100 1000 10000])
    title('DC of average 100 particles','fontsize',24,'fontweight','b');
    xlabel('Time interval (s) ','fontsize',22);
    ylabel('MSD (mm)^2 ','fontsize',22);
    print(gcf,'-dpng', '-r200', [Located 'AvgDC_' num2str(ExpNum(iExpNum)) '.png']);
    clf   
end