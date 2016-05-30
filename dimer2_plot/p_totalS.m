% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_Cooling';
File = ['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/'];
Located=[File 'Datanalysis/S/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
Pnumber=Exp_info.Pnumber;
figure
%%
%
iYTick=0.2:0.1:0.6;
for iwind=1:length(wind)
    load([File 'ref/' num2str(wind(iwind)) '/inf_orientation'],'S');
    frame=(1:1:length(S))/30;
        subplot(4,3,iwind)
    plot(frame,S,'-','Color',[0.15 0.8 0.3]);
    rhon=sprintf('%0.2f',Pnumber(iwind)/100);
    title(['\rho_n=' rhon]);
    ha=gca;
    set(ha,'xlim',[0 frame(end)],'ylim',[0.2 0.6])
     set(ha,'YTick',iYTick);
    set(ha,'FontSize',12); box on;
    if iwind==4
        ylabel('Parameter ','fontsize',12);
    elseif iwind==7
        ylabel('Orientation ','fontsize',12);
    end
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 18]);
print(gcf,'-dpng', '-r100', [Located 'S.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'S.eps']);
saveas(gcf, [Located 'S1.fig'])
