% plot AC varies wind strength
clc;clear all;close all;
ExpName='dimer_exp3';
File=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\ACorre\'];
load([File 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;

%%
meanAC=zeros(1,length(wind));
AvgKE=zeros(1,length(wind));
for w=1:length(wind)
   load([File num2str(wind(w)) '\AvgAC.mat'],'AvgAC');
   meanAC(w)=mean(AvgAC);
   load([File num2str(wind(w)) '\velocity.mat'],'KEavg');
   AvgKE(w)=KEavg;
end

plot(AvgKE,meanAC,'s','Color',[1 0.36 0.65],'LineStyle','none',...
    'MarkerSize',10,'LineWidth',2);
set(gca,'ylim',[0.5 0.95],'FrontSize',20);
title('Angle Correlation','fontsize',24,'fontweight','b');
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'ACavg.fig']);
print(gcf,'-dpng', '-r200', [Located 'ACavg.png']);

%% inner
%{
limit=length(find(AvgKE<=40));
plot(AvgKE(1:limit),meanAC(1:limit),'s','Color',[1 0.36 0.65],...
'LineStyle','none','MarkerSize',10,'LineWidth',2);
xlabel('<v^2>(mm^2) ','fontsize',20);
ylabel('Average of correlation ','fontsize',20);
saveas(gcf,[Located 'o1_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'o1_inner.png']);
%}