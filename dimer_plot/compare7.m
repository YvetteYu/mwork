% compare 7.0 DC
clc;clear all;close all;

exp='dimer_exp3';
File=['/Users/missyvetteyu/Dropbox/Exp/'];
load([File exp '/ref/AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
DC=zeros(1,length(wind));
AvgKE=zeros(1,length(wind));
figure
for t=1:length(wind)
load([File exp '/ref/' num2str(wind(t)) '/DCFit.mat'],'Linreg_info')
DC(t)=Linreg_info.slope;
load([File exp '/ref/' num2str(wind(t)) '/velocity.mat'],'KEavg');
AvgKE(t)=KEavg;
end
plot(AvgKE,DC,'Marker','x','MarkerSize',10,'LineWidth',2,...
    'LineStyle','none','Color',[0 102/255 1])
hold on
clear all

exp='monomer_exp2';
File=['/Users/missyvetteyu/Dropbox/Exp/'];
load([File exp '/ref/AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
DC=zeros(1,length(wind));
AvgKE=zeros(1,length(wind));
for t=1:length(wind)
load([File exp '/ref/' num2str(wind(t)) '/DCFit.mat'],'Linreg_info')
DC(t)=Linreg_info.slope;
load([File exp '/ref/' num2str(wind(t)) '/velocity.mat'],'KEavg');
AvgKE(t)=KEavg;
end
plot(AvgKE,DC,'Marker','x','MarkerSize',10,'LineWidth',2,...
    'LineStyle','none','Color',[1 102/255 0])
hold on

box on
set(gca,'FontSize',20)
title('Difussion Coefficient','fontsize',24,'fontweight','b');
ylabel('Difussion Coefficient (D^2/s) ','fontsize',22);
xlabel('<v^2> (mm/sec)^2 ','fontsize',22);
legend('D-Exp3','M-Exp2')
saveas(gcf,[File 'compare/DC_KE.fig']);
print(gcf,'-dpng','-r100',[File 'compare/DC_KE.png'])



