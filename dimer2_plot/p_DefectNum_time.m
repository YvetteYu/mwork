% plot defect with time
clc;clear all;close all;
ExpName='dimer_exp1518';
File=['C:/Users/user/Dropbox/Exp/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/defect/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=15:18;
span=10;
figure
for iwind=1:length(wind)
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    time=(1:length(th5))/30;
    temptime=time(1:3:end);
    clear time
    tempth5=th5(1:3:end);
    tempth7=th7(1:3:end);
    smth5=smooth(tempth5,span);
    smth7=smooth(tempth7,span);
    plot(temptime,tempth5,'-','Color',[0.87 0.5 0]);
    hold on
    plot(temptime,tempth7,'-','Color',[0 0.6 0]);
    box on
    legend('th5','th7','Location','NorthEast');
    set(gca,'FontSize',20)
    title('Ndefect-time','fontsize',24,'fontweight','b');
    xlabel('Time(s) ','fontsize',20);
    ylabel('Numbers of Defect ','fontsize',20);
    saveas(gcf,[Located 'DefectNum' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'DefectNum' num2str(wind(iwind)) '.png']);
    clf
    
    plot(temptime,smth5,'-','Color',[0.87 0.5 0]);
    hold on
    plot(temptime,smth7,'-','Color',[0 0.6 0]);
    box on
    legend('th5','th7','Location','NorthEast');
    set(gca,'FontSize',20)
    title('Soomth Ndefect-time','fontsize',24,'fontweight','b');
    xlabel('Time(s) ','fontsize',20);
    ylabel('Numbers of Defect ','fontsize',20);
    saveas(gcf,[Located 'smooth/DefectNum' num2str(wind(iwind)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'smooth/DefectNum' num2str(wind(iwind)) '.png']);
    clf
    
end
