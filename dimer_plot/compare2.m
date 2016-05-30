% compare 2.0 defect
% open the previous .fig and add new data.
clc;
Located='C:\Users\user\Dropbox\Exp\compare\Defect\';
File='J:\Granule\dimer_exp6\ref\';

%%
%{
load([File 'AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
AvgKE=zeros(1,length(str));
for n=1:length(str)
    load([File num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
open([Located 'KE6.fig']);
hold on
plot(AvgKE,AvgDefect,'Color',[0.8 0.5 0.2],'LineWidth',2,'Marker','o',...
   'LineStyle','none','MarkerSize',15); 
legend('M-Exp1','D-Exp1','M-Exp2','D-Exp3','D-Exp2','D-Exp5','D-Exp6');
saveas(gcf,[Located 'KE7.fig']);
print(gcf,'-dpng', '-r200', [Located 'KE7.png']);

%}
%%
%for inner-figure

load([File 'AvgDefect.mat'],'Exp_info','AvgDefect');
str=Exp_info.wind;
AvgKE=zeros(1,length(str));
for n=1:length(str)
    load([File num2str(str(n)) '/velocity.mat'],'KEavg');
    AvgKE(n)=KEavg;
end
open([Located 'KE6_inner.fig']);
hold on
plot(AvgKE,AvgDefect(1:length(str)),'Color',[0.8 0.5 0.2],'LineWidth',2,'Marker','o',...
    'LineStyle','none','MarkerSize',15); 
saveas(gcf,[Located 'KE7_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'KE7_inner.png']);
%}
