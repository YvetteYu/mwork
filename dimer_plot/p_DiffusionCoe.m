% plot DC with defferent wind strngth in one picture.
clc;clear all;close all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/Datanalysis/DC/'];
ProcessFile = ['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
ylimbottom=0.05;
ylimtop=20000;

%%
figure
for iwind=1:length(wind)
    icolor=iwind/length(wind);
    
    load([ProcessFile num2str(wind(iwind)) '/SBDiffusionCoe.mat'],'AvgSubMSD');
    
    if iwind==12
        AvgSubMSD(4500:end)=[];
    elseif iwind==13
        AvgSubMSD(3100:end)=[];
    end
    
    AvgSubMSD(isnan(AvgSubMSD))=[];
    time=(0:(length(AvgSubMSD)-1))/30;
    if iwind<11
        loglog(time,AvgSubMSD,'Color',[icolor 0.4 1-icolor],'Marker','+',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    elseif 11<=iwind && iwind<16
        loglog(time,AvgSubMSD,'Color',[icolor 0.4 1-icolor],'Marker','^',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    else
        loglog(time,AvgSubMSD,'Color',[icolor 0.4 1-icolor],'Marker','o',...
            'MarkerSize',2,'MarkerFaceColor',[icolor 0.4 1-icolor]);
    end
    hold on
end
%% Fitting Line

refx=1:0.1:80;
alpha=[0.8 1 1.1];
DC=[5 25 50];
for islope=1:length(alpha)
    refy=DC(islope)*(refx.^alpha(islope));
    loglog(refx,refy,'--m','LineWidth',1)
    hold on
end
%}
%%
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',12); box on;
set(gca,'xlim',[0 100],'ylim',[ylimbottom ylimtop]);
set(gca,'XTick',[0 0.1 1 10 100],'YTick',[0.05 0.1 1 10 100 1000 10000]);
text(0.05,10000,'(a)','FontSize',12);
text(0.2,200,'slope=1.1','FontSize',12);
text(9,200,'slope=1','FontSize',12);
text(18,30,'slope=0.8','FontSize',12);
xlabel('Time Interval(s) ','fontsize',12);
ylabel('MSD(mm^2) ','fontsize',12);
saveas(gcf,[Located 'AvgSubMSD2.fig']);
print(gcf,'-dpng', '-r150', [Located 'AvgSubMSD2.png']);
print(gcf,'-depsc','-tiff','-r200', [Located 'AvgSubMSD2.eps']);

