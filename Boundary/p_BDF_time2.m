% plot B1DF5/7 B2DF7 varies with time.
% the program is written on Augest 15 2014.
clc;clear all;close all;
ExpName='dimer_exp3';
FilePath=['J:\Granule\' ExpName '\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\'];
load([FilePath 'ref\AvgDefect.mat'],'Exp_info');
span=11;
wind=Exp_info.wind;

for iwind=1:length(wind)
load([FilePath 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'NumB1DF*');
load([FilePath 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'th5','th7');
time=(0:(length(NumB1DF5)-1))/30;
xlimit=round(time(end))+1;
%defect5=smooth(NumB1DF5,span);
%defect7=smooth(NumB1DF7,span);
indefect5=smooth((th5-NumB1DF5),span);
indefect7=smooth((th7-NumB1DF7),span);

%{
%% plot BDF
plot(time,defect5,'Color',[0 0.4 0.8]);hold on
plot(time,defect7,'Color',[1 0.2 0.2])

%% set the axes
set(gca,'FontSize',20);
set(gca,'xlim',[0 xlimit],'ylim',[0 20])
title('BDF on first outer layer','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('B1DF Number ','fontsize',20);
print(gcf,'-dpng','-r100',[Located 'BDF\B1' num2str(wind(iwind)) '.png']);
clf
%}
%% plot inner defct
plot(time,indefect5,'Color',[0 0.4 0.8]);hold on
plot(time,indefect7,'Color',[1 0.2 0.2])

%% set the axes
set(gca,'FontSize',20);
set(gca,'xlim',[0 xlimit])
title('Inner Defect','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('IDF Number ','fontsize',20);
print(gcf,'-dpng','-r100',[Located 'BDF\IDF' num2str(wind(iwind)) '.png']);
clf
%% plot B2DF
%{
plot(time,NumB2DF5,'b');hold on
plot(time,NumB2DF7,'r')
set(gca,'FontSize',20);
title('BDF on second outer layer','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('B2DF Number ','fontsize',20);
print(gcf,'-dpng','-r100',[Located 'BDF\B2' num2str(wind(iwind)) '.png']);
clf
%}
end