% plot 2 pictures
% B1 - total exp time and B2 -total exp time
% the program is written on Augest 15 2014.
clc; clear all; close all;
ExpName='dimer_exp8';
FilePath=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\'];
load([FilePath 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
frame=zeros(1,length(wind));
figure
for iwind=1:length(wind)
    wind5color=hsv2rgb([iwind*230/(360*length(wind)) 0.8 0.9]);
    wind7color=hsv2rgb([iwind*230/(360*length(wind)) 0.5 0.6]); 
    load([FilePath num2str(wind(iwind)) '\Bdefect.mat'],'NumB1DF*');
    if iwind==1
        frame(iwind+1)=length(NumB1DF5);
         % Because the time start from 0.
    else
        frame(iwind+1)=frame(iwind)+length(NumB1DF5);
    end
    temptime=[frame(iwind):frame(iwind+1)-1];
    temptime=temptime/30;
    time=temptime(1:10:end);
    defect5=NumB1DF5(1:10:end);
    defect7=NumB1DF7(1:10:end); 
    plot(time,defect5,'Color',wind5color);
    hold on
    plot(time,defect7,'Color',wind7color);
    hold on 
end
set(gca,'FontSize',20);
title('B1DF on first outer layer','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('B1DF Number ','fontsize',20);
saveas(gcf,[Located 'BDF\B1DF_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'BDF\B1DF_TotalTime.png']);
clear defect* temp*
%%
clf
for iwind=1:length(wind)
    load([FilePath num2str(wind(iwind)) '\Bdefect.mat'],'NumB2DF*');
    wind5color=hsv2rgb([iwind*230/(360*length(wind)) 0.8 0.9]);
    wind7color=hsv2rgb([iwind*230/(360*length(wind)) 0.5 0.6]); 
    temptime=[frame(iwind):frame(iwind+1)-1];
    temptime=temptime/30;
    time=temptime(1:10:end);
    defect5=NumB2DF5(1:10:end);
    defect7=NumB2DF7(1:10:end); 
    plot(time,defect5,'Color',wind5color);
    hold on
    plot(time,defect7,'Color',wind7color);
    hold on 
end
set(gca,'FontSize',20);
title('B2DF on second outer layer','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('B2DF Number ','fontsize',20);
saveas(gcf,[Located 'BDF\B2DF_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'BDF\B2DF_TotalTime.png']);
%}