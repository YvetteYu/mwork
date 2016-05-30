% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_exp19';
Located=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/'];
ProcessFile = ['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([ProcessFile 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
span=1; ythresh=[0.5 0.8];
time=3800;
figure
%%
for iwind=11:15
    load([ProcessFile 'ref/' num2str(wind(iwind)) '/Fai6.mat'],'FaiR');
    icolor=[0.2 0.5 0.9;0.9 0.5 0.2];
    AvgFaiR=mean(FaiR,2);
    smFaiR=smooth(AvgFaiR,span);
    clear AvgFaiR FaiR
    time=time(end)+(0:(length(smFaiR)-1))/30;
    plot(time,smFaiR,'Color',icolor(rem(iwind,2)+1,:),'LineWidth',1);   
    hold on
end
box on;
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 7 5]);
set(gca,'FontSize',12);
set(gca,'xlim',[3800 time(end)],'ylim',ythresh);
%xlabel('Time(s) ','fontsize',14);
%ylabel('\Phi_6 ','fontsize',14);
saveas(gcf,[Located 'Fai6_1.fig']);
print(gcf,'-dpng', '-r200', [Located 'Fai6_1.png']);
print(gcf,'-depsc','-tiff','-r300', [Located 'Fai6_1.eps']);