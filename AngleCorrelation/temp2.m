clc;clear all;close all;
exp='dimer_exp9';
File=['J:\Granule\' exp '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' exp '\Datanalysis\ACorre\'];
wind=[110,120];
framerate=3;

open([Located 'AC.fig']);
hold on

for iwind=1:length(wind)
load([File num2str(wind(iwind)) '\AvgAC.mat'],'AvgAC');
tempAC=AvgAC(1:framerate:end);
time=1:length(tempAC);
plot(time,tempAC,'.','LineStyle','none')
hold on
clear framenum time n AvgAC
end

saveas(gcf,[Located 'AC2.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC2.png']);