% compare 5.0 DC
clc;close all;clear all;
Located='/Users/missyvetteyu/Dropbox/Exp/compare/';
ProcessFile = '/Users/missyvetteyu/Dropbox/Exp/';
exp1='monomer_exp2/';
exp2='dimer_exp3/';

figure('visible','off')
%%
load([ProcessFile exp1 'ref/AvgDefect.mat'],'Exp_info');
str=Exp_info.wind;
for wind=1:length(str)
    load([ProcessFile exp1 'ref/' num2str(str(wind)) '/DiffusionCOe.mat'],'AvgMSD');
    load([ProcessFile exp1 'ref/' num2str(str(wind)) '/velocity.mat'],'KEavg');
    hcolor=KEavg/1000;
    time=1:length(AvgMSD);
    time=time/30;
    subplot(2,1,1)
    plot(time,AvgMSD,'LineWidth',2,'Color',hsv2rgb([hcolor 75/100 80/100]));
    hold on
    clear AvgMSD KEavg hcolor time
end
box on
%colorbar
set(gca,'FontSize',20)
title('Difussion Coefficient','fontsize',24,'fontweight','b');
xlabel('Time interval (s) ','fontsize',22);
ylabel('MSD (D mm)^2 ','fontsize',22);
clear wind str

load([ProcessFile exp2 'ref/AvgDefect.mat'],'Exp_info');
str=Exp_info.wind;
for wind=1:length(str)
    load([ProcessFile exp2 'ref/' num2str(str(wind)) '/DiffusionCOe.mat'],'AvgMSD');
    load([ProcessFile exp2 'ref/' num2str(str(wind)) '/velocity.mat'],'KEavg');
    hcolor=KEavg/1000;
    time=1:length(AvgMSD);
    time=time/30;
    subplot(2,1,2)
    plot(time,AvgMSD,'LineWidth',2,'Color',hsv2rgb([hcolor 75/100 80/100]))
    hold on
    clear AvgMSD KEavg hcolor time
end
box on
%colorbar
%%
set(gca,'FontSize',20)
xlabel('Time interval (s) ','fontsize',22);
ylabel('MSD (D mm)^2 ','fontsize',22);
saveas(gcf,[Located 'DC_m2d3.fig']);
print(gcf,'-dpng', '-r200', [Located 'DC_m2d3.png']);