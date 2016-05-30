clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
Located=[File '/Datanalysis/DF_Fai/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind='205';
span=11; skip=3;
%%
load([File 'ref/' wind '/DefectNum.mat'],'th5','th7');
load([File 'ref/' wind '/Bdefect.mat'],'NumB1*');
load([File 'ref/' wind '/Fai6.mat'],'FaiR');
load([File 'ref/' wind '/inf_orientation.mat'],'S');
time=(1:length(FaiR))/30;
tempS=smooth(S,span);
tempS=tempS(1:skip:end);
AvgFaiR=smooth(mean(FaiR,2),span);
AvgFaiR=AvgFaiR(1:skip:end);
time=time(1:skip:end);
tempdf5=smooth(th5-NumB1DF5,span);
tempdf7=smooth(th7-NumB1DF7,span);
DF=(tempdf5(1:skip:end)+tempdf7(1:skip:end))/Exp_info.Pnumber;
clear FaiR tempdf* th* NumB1* S
plot(time,tempS,'r.'); hold on
[hAx,hR,hdf]=plotyy(time,AvgFaiR,time,DF);
%%
axposition=get(hAx(1),'Position');
newposition=[axposition(1) axposition(2)+0.02 axposition(3)-0.02 axposition(4)];
%%
set(hR,'Color',[0 0 0.6],'Marker','.','LineStyle','none');
set(hdf,'Color',[0 0.6 0],'Marker','.','LineStyle','none');

set(hAx(1),'FontSize',14,'YColor','k','Position',newposition);
set(hAx(1),'ylim',[0.1 0.8],'YTick',0.1:0.1:0.8);
set(hAx(2),'FontSize',14,'YColor','k','Position',newposition);
set(hAx(2),'ylim',[0.1 0.8],'YTick',0.1:0.1:0.8);
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 14]);
title('vol=3.26')
xlabel('Time(s) ','fontsize',14);
ylabel(hAx(1),'\Phi_6 ','fontsize',14,'Color','k');
ylabel(hAx(2),'Defect Fraction ','fontsize',14,'Color','k');
print(gcf,'-dpng', '-r100', [Located wind '.png']);
print(gcf,'-depsc','-tiff','-r100', [Located wind '.eps']);

