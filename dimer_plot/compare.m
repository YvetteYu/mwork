% plot two or more exp data in one figure
% monomer_exp1 and exp2 AvgDefectNumber

clc;clear all;close all;
File='J:\Granule\';
Located='C:\Users\user\Dropbox\Exp\compare\Defect\';
exp1='dimer_exp5';
exp2='dimer_exp6';

%% 
%{
load([File exp1 '/ref/AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
AvgKE=zeros(1,length(str));
for n=1:length(str)
    load([File exp1 '/ref/' num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
figure
plot(AvgKE,AvgDefect,'Marker','o','Color',[0.2 0.5 0.8],...
    'LineWidth',2,'LineStyle','none','MarkerSize',15);
hold on 

load([File exp2 '/ref/AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
AvgKE=zeros(1,length(str));
for n=1:length(str)
    load([File exp2 '/ref/' num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
plot(AvgKE,AvgDefect,'Marker','o','Color',[0.8 0.5 0.2],...
    'LineWidth',2,'LineStyle','none','MarkerSize',15);
hold on

set(gca,'FontSize',22);
legend('D-Exp5','D-Exp6','Location','NorthWest');
xlabel('<v^2> (mm^2)','fontsize',18);
ylabel('Average of Defect Number ','fontsize',18);
title('Average Number of Defect with air flow rate')
saveas(gcf,[Located 'KE2_dimer.fig']);
print(gcf,'-dpng', '-r200', [Located 'KE2_dimer.png']);
%}
%% inner 

load([File exp1 '/ref/AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
dnum1=13;
dnum2=13;
for n=1:dnum1
    load([File exp1 '/ref/' num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
figure
plot(AvgKE(1:dnum1),AvgDefect(1:dnum1),'Marker','o','Color',[0.2 0.5 0.8],...
    'LineWidth',2,'LineStyle','none','MarkerSize',15);
hold on 

load([File exp2 '/ref/AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
for n=1:dnum2
    load([File exp2 '/ref/' num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
plot(AvgKE(1:dnum2),AvgDefect(1:dnum2),'Marker','o','Color',[0.8 0.5 0.2],...
    'LineWidth',2,'LineStyle','none','MarkerSize',15);
hold on

set(gca,'FontSize',22);
legend('D-Exp5','D-Exp6','Location','NorthWest');
xlabel('<v^2> (mm^2)','fontsize',18);
ylabel('Average of Defect Number ','fontsize',18);
saveas(gcf,[Located 'KE2_dimer_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'KE2_dimer_inner.png']);
%}