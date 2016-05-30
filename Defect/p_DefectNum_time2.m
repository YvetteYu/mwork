% plot defect with time
clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
Located=[File '/Datanalysis/DFraction/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
span=11;
figure('visible','off')
for iwind=11:length(wind)
    load([File 'ref/' num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([File 'ref/' num2str(wind(iwind)) '/Bdefect.mat'],'NumB1*');
    time=(1:length(th5))/30;
    tempdf5=smooth(th5-NumB1DF5,span);
    tempdf7=smooth(th7-NumB1DF7,span);
    tempDF=(tempdf5(1:3:end)+tempdf7(1:3:end))/Exp_info.Pnumber;
    time=time(1:3:end);
    plot(time,tempDF,'.','Color',[0 0.6 0]);
    hold on
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
    set(gca,'FontSize',14,'xlim',[0 time(end)+10]);
    title( num2str(wind(iwind)),'fontsize',12,'fontweight','b');
    xlabel('Time(s) ','fontsize',14);
    ylabel('Numbers of Defect ','fontsize',14);
    print(gcf,'-dpng', '-r200', [Located num2str(wind(iwind)) '.png']);
    clf
end
