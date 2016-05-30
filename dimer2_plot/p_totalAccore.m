% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_Cooling';
File = ['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/'];
Located=[File 'Datanalysis/Accore/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
Pnumber=Exp_info.Pnumber;
figure
%%
%
iYTick=0.5:0.1:0.8;
for iwind=1:length(wind)
    load([File 'ref/' num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
    frame=(1:1:length(AvgAC))/30;
    subplot(4,3,iwind)
    plot(frame,AvgAC,'-','Color',[0.15 0.3 0.8]);
    rhon=sprintf('%0.2f',Pnumber(iwind)/100);
    title(['\rho_n=' rhon]);
    ha=gca;
    set(ha,'xlim',[0 frame(end)],'ylim',[0.5 0.8])
     set(ha,'YTick',iYTick);
    set(ha,'FontSize',12); box on;
    if iwind==4
        ylabel('Correlation ','fontsize',12);
    elseif iwind==7
        ylabel('Angle ','fontsize',12);
    end
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 18]);
print(gcf,'-dpng', '-r100', [Located 'Accore.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'Accore.eps']);
saveas(gcf, [Located 'Accore.fig'])



