% plot AC - total time 
clc; clear all; close all;
ExpName='dimer_exp19';
FilePath=['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
Located=['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
ylimit=[0.55 1.05]
frame=zeros(1,length(wind));
figure
for iwind=1:length(wind)
    windcolor=[0.5 0.9 0.2;0.2 0.6 0.9];
    index=rem(iwind,2)+1;
    load([FilePath num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
    if iwind==1
        frame(iwind+1)=length(AvgAC);
         % Because the time start from 0.
    else
        frame(iwind+1)=frame(iwind)+length(AvgAC);
    end
    temptime=[frame(iwind):frame(iwind+1)-1];
    temptime=temptime/30;
    time=temptime(1:10:end);
    AC=AvgAC(1:10:end);
    plot(time,AC,'Color',windcolor(index,:));
    hold on
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',14,'xlim',[0 time(end)+10],'ylim',ylimit);
ylabel('Angle Correlation','fontsize',14);
xlabel('time(s) ','fontsize',14);
print(gcf,'-depsc','-tiff','-r300', [Located 'Acorre/AC_TotalTime.eps']);
saveas(gcf,[Located 'Acorre/AC_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'Acorre/AC_TotalTime.png']);
clear defect* temp*