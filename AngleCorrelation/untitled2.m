% plot AC varies wind strength
clc;clear all;close all;
exp='dimer_exp5';
File=['/Users/missyvetteyu/Dropbox/Exp/' exp '/ref/'];
Located=['/Users/missyvetteyu/Dropbox/Exp/' exp '/Datanalysis/max_Ac/'];
load([File 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;

%%
meanAC=zeros(1,length(wind));
AvgKE=zeros(1,length(wind));
for w=1:length(wind)
   load([File num2str(wind(w)) '\max_ac.mat'],'max2AvgAC');
   meanAC(w)=mean(AvgAC);
   load([File num2str(wind(w)) '\velocity.mat'],'KEavg');
   AvgKE(w)=KEavg;
end
%{
plot(AvgKE,meanAC,'s','LineStyle','none','MarkerSize',10,'LineWidth',2);
title('Angle Correlation','fontsize',24,'fontweight','b');
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'o1.fig']);
print(gcf,'-dpng', '-r200', [Located 'o1.png']);
%}
%% inner
limit=length(find(AvgKE<=40));
plot(AvgKE(1:limit),meanAC(1:limit),'s','LineStyle','none','MarkerSize',10,'LineWidth',2);
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'o1_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'o1_inner.png']);
