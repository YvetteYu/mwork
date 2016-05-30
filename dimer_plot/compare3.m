% compare 3.0 S
clc;clear all;close all;
Located='/Users/missyvetteyu/Dropbox/Exp/compare/S_trimer/';
AFile='/Users/missyvetteyu/Dropbox/Exp/dimer_exp1/Datanalysis/';
BFile='/Users/missyvetteyu/Dropbox/Exp/trimer_exp2/ref/';

file=12:25;
for t=1:length(file)
load([BFile num2str(file(t)) '/inf_orientation.mat'],'S');
AvgS(t)=mean(S);
load([BFile num2str(file(t)) '/velocity.mat'],'KEavg');
AvgKE(t)=KEavg;
StdS(t)=std(S);
end
open([Located 'DT_S2.fig']);
hold on
h=errorbar(AvgKE,AvgS,StdS);
set(h,'Color',[0.8 0.75 0],'Marker','^','LineWidth',2,'LineStyle','none','MarkerSize',6);
legend('D-Exp3','T-Exp1','T-Exp2');
saveas(gcf,[Located 'DT_S3.fig']);
print(gcf,'-dpng', '-r200', [Located 'DT_S3.png']);