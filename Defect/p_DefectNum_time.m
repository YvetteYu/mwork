% plot defect with time
clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
Located=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/defect/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
span=11;
figure
for iwind=11%:length(wind)
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([File num2str(wind(iwind)) '/Bdefect.mat'],'NumB1*');
    time=(1:length(th5))/30;
    tempdf5=smooth(th5-NumB1DF5,span);
    tempdf7=smooth(th7-NumB1DF7,span);
    tempdf5=tempdf5(1:3:end);
    tempdf7=tempdf7(1:3:end);
    time=time(1:3:end);
    plot(time,tempdf5,'.','Color',[0 0.6 0]);
    hold on
    %plot(time,tempdf7,'.','Color',[0.87 0.5 0]);
    %box on
    %legend('th5','th7','Location','NorthEast');
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
    set(gca,'FontSize',14,'xlim',[0 time(end)+10]);
    title( num2str(wind(iwind)),'fontsize',12,'fontweight','b');
    xlabel('Time(s) ','fontsize',14);
    ylabel('Numbers of Defect ','fontsize',14);
    print(gcf,'-dpng', '-r200', [Located 'DefectNum' num2str(wind(iwind)) '.png']);
    clf
end
