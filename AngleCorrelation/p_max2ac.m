% Plot AC varies with time(frames)
clc; clear all; close all;
exp='dimer_exp5';
File=['/Users/missyvetteyu/Dropbox/Exp/' exp '/ref/'];
Located=['/Users/missyvetteyu/Dropbox/Exp/' exp '/Datanalysis/max_Ac/'];
load([File 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;

frame=(1:1:18000)/30;
%% plot the AvgAC in one picture

figure
for w=1:length(wind)
    windcolor=hsv2rgb([w*230/(360*length(wind)) 0.8 0.9]);
    load([File num2str(wind(w)) '/max_ac.mat'],'max2AvgAC');
    tempAvgAC=max2AvgAC(1:30:end);
    tempframe=frame(1:30:end);
    plot(tempframe,tempAvgAC,'Marker','.','MarkerSize',10,'LineStyle','none',...
        'Color',windcolor)
    hold on
   
end

legend('110','120','130','140','150','160','170','180'...
    ,'190','200','210','220',...
  'Location','EastOutside');
set(gca,'ylim',[0.5 1])
title('Angle Correlation','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('value of correlation ','fontsize',20);
saveas(gcf,[Located 'max2AC.fig']);
print(gcf,'-dpng', '-r200', [Located 'max2AC.png']);
%}
%% plot one wind in one picture

figure
for w=1:length(wind)
load([File num2str(wind(w)) '/max_ac.mat'],'max2AvgAC');
plot(frame,max2AvgAC,'.','LineStyle','none','Color',[100/255 150/255 1])

set(gca,'xlim',[0 frame(end)],'ylim',[0.5 1]);
title('Angle Correlation','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('value of correlation ','fontsize',20);
saveas(gcf,[Located 'max2AC' num2str(wind(w)) '.fig']);
print(gcf,'-dpng', '-r200', [Located 'max2AC' num2str(wind(w)) '.png']);
clf
clear max2AvgAC
end
%}