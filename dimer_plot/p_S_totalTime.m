clc; clear all; close all;
ExpName='dimer_exp8';
File=['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/ref/'];
Located=['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/Datanalysis/S/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
frame=zeros(1,length(wind));
ylimit=[0.2 1.1];
%windcolor=[0.4 0.7 0.7;1 0.2 0.2];
figure
for iwind=1:length(wind)
    remainder=rem(iwind,2)+1;
    if iwind<11
        windcolor=[1 0.2 0.8; 0.4 0.4 0.4];
    elseif iwind>=11 && iwind <16
        windcolor=[1 0.6 0; 0 0.4 0.8];
    else
        windcolor=[1 0.2 0.2; 0.4 0.7 0.7];
    end
    load([File num2str(wind(iwind)) '/inf_orientation.mat'],'S');
    if iwind==1
        frame(iwind+1)=length(S);
    else
        frame(iwind+1)=frame(iwind)+length(S);
    end
    time=frame(iwind)+1:frame(iwind+1);
    time=time/30;
    plot(time, S,'Color',windcolor(remainder,:));hold on
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',14,'xlim',[0 time(end)+10],'ylim',ylimit);
xlabel('time(s) ','fontsize',14);
ylabel('Orientation Parameter ','fontsize',14);
saveas(gcf,[Located 'S_TotalTime.fig']);
print(gcf,'-dpng', '-r100', [Located 'S_TotalTime.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'S_TotalTime.eps']);