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
framenum=length(AvgAC);
time=1:0.33:framenum/3;
n=length(time);

if n>framenum
    time(framenum+1:end)=[];
elseif n<framenum
    while n<framenum
        time(n+1)=time(n)+0.33;
        n=n+1;
    end
end
plot(time,AvgAC,'.','LineStyle','none')
hold on
clear framenum time n AvgAC
end

saveas(gcf,[Located 'AC2.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC2.png']);