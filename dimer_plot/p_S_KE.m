%5. S and KE
clc;clear all;close all;
ExpName='dimer_exp3';
File = ['/Users/missyvetteyu/Dropbox/Exp/' ExpName '/'];
load([File 'ref/AvgDefect.mat'],'Exp_info');
file=Exp_info.wind;

for t=1:length(file)
load([File 'ref/' num2str(file(t)) '/inf_orientation.mat'],'S');
AvgS(t)=mean(S);
load([File 'ref/' num2str(file(t)) '/velocity.mat'],'KEavg');
AvgKE(t)=KEavg;
StdS(t)=std(S);
end

%%
%AvgS(no)=[];
%AvgKE(no)=[];
%StdS(no)=[];
figure;hold on
%h=plot(AvgKE,AvgS)
h=errorbar(AvgKE,AvgS,StdS);
set(h,'Color',[0.2 0.6 1],'Marker','o','LineWidth',2,'LineStyle','none','MarkerSize',3);
box on
set(gca,'FontSize',22);
title('S-Pv','fontsize',24,'fontweight','b');
xlabel('<v^2> (mm^2)','fontsize',20);
ylabel('S','fontsize',20);
saveas(gcf,[File 'Datanalysis/SPv.fig']);
print(gcf,'-dpng', '-r200', [File 'Datanalysis/SPv.png']);