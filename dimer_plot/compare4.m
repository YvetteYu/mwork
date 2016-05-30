% compare 4.0 S
clear all;close all;clc

fignum=8;
ExpName=['dimer_exp' num2str(fignum)];
Located='/Users/missyvetteyu/Dropbox/Exp/compare/S_dimer/dimer5_/';
FromFile=['/Users/missyvetteyu/Dropbox/Exp/' ExpName '/'];
load([FromFile 'ref/AvgDefect.mat'],'Exp_info');
file=Exp_info.wind;

%%
for t=1:length(file)
load([FromFile 'ref/' num2str(file(t)) '/inf_orientation.mat'],'S');
AvgS(t)=mean(S);
load([FromFile 'ref/' num2str(file(t)) '/velocity.mat'],'KEavg');
AvgKE(t)=KEavg;
StdS(t)=std(S);
end
open([Located 'S' num2str(fignum-1) '.fig']);
hold on
h=errorbar(AvgKE,AvgS,StdS);
set(h,'Color',hsv2rgb([0.3 0.9 0.6]),'Marker','o','LineWidth',2,'LineStyle','none','MarkerSize',3);
legend('D-Exp3','D-Exp5','D-Exp6','D-Exp7','D-Exp8')
saveas(gcf,[Located 'S' num2str(fignum) '.fig']);
print(gcf,'-dpng', '-r200', [Located 'S' num2str(fignum) '.png']);