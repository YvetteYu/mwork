% plot DC with defferent wind strngth in one picture.
clc;clear all;close all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/Exp/' ExpName '/Datanalysis/DC/'];
ProcessFile = ['C:/Users/user/GoogleDrive/Exp/' ExpName '/ref/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
ylimbottom=10;
ylimtop=35;
startframe=22;
endframe=151;
%%
figure
for iwind=8:9%length(wind)
    icolor=iwind/length(wind)-0.025;
    load([ProcessFile num2str(wind(iwind)) '/SBDiffusionCoe.mat'],'AvgSubMSD');
    AvgSubMSD(isnan(AvgSubMSD))=[];
    time=(0:(length(AvgSubMSD)-1))/30;
    loglog(time(startframe:endframe),AvgSubMSD(startframe:endframe),'Color',[icolor 0.5 1-icolor],'Marker','o',...
        'MarkerSize',3,'MarkerFaceColor',[icolor 0.5 1-icolor]);
    hold on
end
%%
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0.5 4 3]);
set(gca,'FontSize',12); box on;
set(gca,'xlim',[0.7 5],'ylim',[ylimbottom ylimtop]);
set(gca,'XTick',[0.7 5],'YTick',[10 35]);
saveas(gcf,[Located 'sub_MSD1.fig']);
print(gcf,'-dpng', '-r300', [Located 'sub_MSD1.png']);
print(gcf,'-depsc','-tiff','-r300', [Located 'sub_MSD1.eps']);
  %} 