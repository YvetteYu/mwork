% plot Average of defect number with air rate increasing
% please build AvgDefect.m before you build this program.
clc;clear all;close all;
ExpName='monomer_exp2';
File=['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/defect/'];
load([File 'AvgDefect.mat'],'Exp_info');
ylimit=[0 35];
%%
%
wind=Exp_info.wind;
KE=zeros(1,length(wind));
defect5=zeros(1,length(wind)); defect7=zeros(1,length(wind));
for iwind=1:length(wind)
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    defect5(iwind)=mean(th5);
    defect7(iwind)=mean(th7);
    load([File num2str(wind(iwind)) '/velocity.mat'],'KEavg');
    KE(iwind)=KEavg;
    clear KEavg
end

figure
fh=plot(KE,defect5,KE,defect7)
set(fh(1),'Marker','+','Color',[0 0.4 0.8],'LineStyle','none','LineWidth',2,'MarkerSize',15);
set(fh(2),'Marker','+','Color',[0 0.8 0.4],'LineStyle','none','LineWidth',2,'MarkerSize',15)
set(gca,'FontSize',22,'ylim',ylimit);
legend('Location','NorthWest','th5','th7')
title('Average of defect under different airflow rate','fontsize',24,'fontweight','b');
xlabel('<v^2> (mm/s)^2 ','fontsize',20);
ylabel('Average of Defect ','fontsize',20);
saveas(gcf,[Located 'Ndefect_KE.fig']);
print(gcf,'-dpng', '-r200', [Located 'Ndefect_KE.png']);
%}

%% inner 
%{
limit=15;
str=Exp_info.wind;
KE=zeros(1,limit);
for wind=1:limit
    load([File num2str(str(wind)) '/velocity.mat'],'KEavg');
    KE(wind)=KEavg;
    clear KEavg
end

figure
plot(KE,AvgDefect(1:limit),'Marker','+','Color',[0.2 0.6 1],'LineStyle','none','LineWidth',2,'MarkerSize',15);
set(gca,'FontSize',22);
saveas(gcf,[Located 'Ndefect_KE_inner.fig']);
print(gcf,'-dpng', '-r200', [Located 'Ndefect_KE_inner.png']);
%}
