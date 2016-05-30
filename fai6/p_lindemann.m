clc;clear all;close all;
ExpName='monomer_exp6';
FilePath=['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/Lindemann/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=Exp_info.wind;
ylimbottom=0.1;
ylimtop=10000;
DCref=[1 10;200 2000];
%%
for iwind=1:length(wind)
    icolor=iwind/length(wind)-0.025;
    load([FilePath num2str(wind(iwind)) '/Lindemannp.mat'],'lindpara');
    time=0:(length(lindpara)-1);
    time=time(1:10:end)/30;
    tempara=lindpara(1:10:end);
    loglog(time,tempara,'Color',[icolor 0.5 1-icolor],'Marker','o',...
        'MarkerSize',3,'MarkerFaceColor',[icolor 0.5 1-icolor])
    hold on
    clear lindpara
end
loglog(DCref(1,:),DCref(2,:),'Color','k','LineWidth',2)
set(gca,'FontSize',18);
set(gca,'xlim',[0 time(end)+10],'ylim',[ylimbottom ylimtop]);
set(gca,'YTick',[0.1 1 10 100 1000 10000]);
title('Lindemann Parameter ','fontsize',24,'fontweight','b');
xlabel('Time (s) ','fontsize',20);
ylabel('r_{L}(t) ','fontsize',20);
%saveas(gcf,[Located 'Lindemann.fig']);
print(gcf,'-dpng', '-r300', [Located 'Lindemann.png']);

