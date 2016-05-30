clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
Located=[File '/Datanalysis/Fai6/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
span=11;
figure('visible','off')
for iwind=11:length(wind)
 
    load([File 'ref/' num2str(wind(iwind)) '/Fai6.mat'],'FaiR');
    AvgFaiR=smooth(mean(FaiR,2),span);
    time=(1:length(AvgFaiR))/30;
    clear FaiR
    AvgFaiR=AvgFaiR(1:3:end);
    time=time(1:3:end);
    plot(time,AvgFaiR,'.','Color',[0 0 0.6]);
    hold on
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
    set(gca,'FontSize',14,'xlim',[0 time(end)+10]);
    title( num2str(wind(iwind)),'fontsize',12,'fontweight','b');
    xlabel('Time(s) ','fontsize',14);
    ylabel('\Phi_6 ','fontsize',14);
    print(gcf,'-dpng', '-r200', [Located num2str(wind(iwind)) '.png']);
    clf
end


