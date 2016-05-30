% compare 8.0 Angle Correlation
clc;clear all;close all;
exp='dimer_exp8';
File=['J:\Granule\' exp '\ref\'];
Located='C:\Users\user\Dropbox\Exp\compare\AngleCorre\';
load([File 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
fignum=5;
%%

meanAC=zeros(1,length(wind));
AvgKE=zeros(1,length(wind));
for w=1:length(wind)
   load([File num2str(wind(w)) '\AvgAC.mat'],'AvgAC');
   meanAC(w)=mean(AvgAC);
   load([File num2str(wind(w)) '\velocity.mat'],'KEavg');
   AvgKE(w)=KEavg;
end

open([Located 'o' num2str(fignum-1) '.fig']);
hold on
plot(AvgKE,meanAC,'s','LineStyle','none','MarkerSize',10,'Color',...
     [0.1 0.5 0.5],'LineWidth',2);
legend('D-Exp3','D-Exp5','D-Exp6','D-Exp7','D-Exp8');
title('Angle Correlation','fontsize',24,'fontweight','b');
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'o' num2str(fignum) '.fig']);
print(gcf,'-dpng', '-r200', [Located 'o' num2str(fignum) '.png']);

%% inner
limit=length(find(AvgKE<=40));
open([Located 'o' num2str(fignum-1) '_inner.fig']);
hold on
plot(AvgKE(1:limit),meanAC(1:limit),'s','LineStyle','none','MarkerSize',...
    10,'Color',[0.5 0.9 0.5],'LineWidth',2);
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'o' num2str(fignum) '_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'o' num2str(fignum) '_inner.png']);

