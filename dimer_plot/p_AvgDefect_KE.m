% plot Average of defect number with air rate increasing
% please build AvgDefect.m before you build this program.
clc;clear all;close all;
exp='dimer_exp7';
File=['C:\Users\user\Dropbox\Exp\' exp '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' exp '\Datanalysis\'];
load([File 'AvgDefect.mat'],'Exp_info','AvgDefect');

%%
str=Exp_info.wind;
for n=1:length(str)
    load([File num2str(str(n)) '\velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
figure
plot(AvgKE,AvgDefect,'Marker','x','Color',[0.2 0.6 1],'LineStyle','none','LineWidth',2,'MarkerSize',5);


set(gca,'FontSize',22);
title('Average of defect number ','fontsize',24,'fontweight','b');
xlabel('<v^2> (mm/s)^2 ','fontsize',20);
ylabel('Average of Defect Number ','fontsize',20);
saveas(gcf,[Located 'KE_AvgDefect.fig']);
print(gcf,'-dpng', '-r200', [Located 'KE_AvgDefect.png']);
 