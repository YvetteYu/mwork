% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_Cooling';
File = ['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/'];
Located=[File 'Datanalysis/Accore/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
figure%('visible','off')
%%
for iwind=5%1:length(wind)
    
    load([File 'ref/' num2str(wind(iwind)) '/AvgAc.mat'],'AvgAC');
    frame=(1:1:length(AvgAC))/30;
    plot(frame,AvgAC,'-','Color','b');
    set(gca,'xlim',[0 frame(end)],'ylim',[0.5 0.95],'FontSize',20);    
    %print(gcf,'-dpng', '-r100', [Located num2str(wind(iwind),'%04d') '.png']);
    %clf
end
