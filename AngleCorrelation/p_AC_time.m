% Plot AC varies with time(frames)
clc; clear all; close all;
ExpName='dimer_exp19';
File=['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
Located=['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/Acorre/'];
load([File 'exp_parameter.mat'],'Exp_info');

%% plot one wind in one picture
%figure('visible','off')
wind=Exp_info.wind;
for iwind=11%:length(wind)
load([File num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
frame=(1:1:length(AvgAC))/30;
plot(frame,AvgAC,'-','Color',[0.15 0.6 0.3])
set(gca,'xlim',[0 frame(end)],'ylim',[0.35 1],'FontSize',20);
title(num2str(wind(iwind)),'fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('Angle Correlation ','fontsize',20);
print(gcf,'-dpng', '-r200', [Located num2str(wind(iwind)) '.png']);
clf
end

