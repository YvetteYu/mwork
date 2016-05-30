% compare 6.0 MSV and wind
clc;clear all;close all;

ExpName='monomer_exp3';
FromFile =['/Users/missyvetteyu/Dropbox/Exp/' ExpName '/ref/']; 
Located='/Users/missyvetteyu/Dropbox/Exp/compare/MSV_wind/';

%%
load([FromFile 'AvgDefect.mat'],'Exp_info');
file=Exp_info.wind;
xfile=Exp_info.wind;
for n=1:length(file)
load([FromFile num2str(xfile(n)) '/velocity.mat'],'KEavg');
Pvel(n)=KEavg;
end

%%
open([ Located 'MSVb2.fig'])
hold on
plot(file(:)/10,Pvel,'Color',[0.2 0.8 0.8],'LineStyle','--','LineWidth',2, ...
    'Marker','s','MarkerEdgeColor','k','MarkerSize',8);
legend('D-Exp5','D-Exp6','M-Exp3')
%legend('D-Exp1','M-Exp1','M-Exp2','D-Exp2','D-Exp3','D-Exp5','D-exp6','Location','NorthWest');
saveas(gcf,[Located 'MSVb3.fig']);
print(gcf,'-dpng', '-r200', [Located 'MSVb3.png']);

 