clc;clear all;close all;
ExpName='dimer_exp19';
FilePath=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
Located=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/Lindemann/'];
load([FilePath 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
ylimbottom=0.00008;
ylimtop=10;

%%
for iwind=1:length(wind)
    icolor=iwind/length(wind);
    load([FilePath 'ref/' num2str(wind(iwind)) '/InnerLparameter.mat'],'InnerL');
    time=0:(length(InnerL)-1);
    Lconstant=Exp_info.Lconstant_pixel;
    InnerL=InnerL/(2*Lconstant^2);
    if iwind<8
        loglog(time,InnerL,'Color',[icolor 0.4 1-icolor],'Marker','+',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    elseif 8<=iwind && iwind<10
        loglog(time,InnerL,'Color',[icolor 0.4 1-icolor],'Marker','^',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    else
        loglog(time,InnerL,'Color',[icolor 0.4 1-icolor],'Marker','o',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    end
    hold on
    clear InnerL
end

set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',14);
set(gca,'xlim',[0 7000],'ylim',[ylimbottom ylimtop]);
set(gca,'XTick',[0 0.1 1 10 100 1000 7000],'YTick',[0.0001 0.001 0.01 0.1 1 10]);
xlabel('Time interval(s) ','fontsize',14);
ylabel('r_{L} ','fontsize',14);
saveas(gcf,[Located 'LindemannP.fig']);
print(gcf,'-depsc','-tiff','-r100', [Located 'LindemannP.eps']);
print(gcf,'-dpng', '-r100', [Located 'LindemannP.png']);