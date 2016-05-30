clc;clear all;close all;
ExpName='dimer_exp8';
FilePath=['J:/Granule/' ExpName '/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/Lindemann/'];
load([FilePath 'ref/exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=Exp_info.wind;
ylimbottom=0.1;
ylimtop=10000;
figure
%%
for iwind=1:length(wind)
    icolor=iwind/length(wind)-0.025;
    load([FilePath 'ref/' num2str(wind(iwind)) '/Lindemannp.mat'],'lindpara');
    time=0:(length(lindpara)-1);
    time=time(1:10:end)/30;
    tempara=lindpara(1:10:end);
    loglog(time,tempara,'Color',[icolor 0.5 1-icolor],'Marker','o',...
        'MarkerSize',3,'MarkerFaceColor',[icolor 0.5 1-icolor])
    clear lindpara
    set(gca,'FontSize',18);
    set(gca,'ylim',[ylimbottom ylimtop])
    title('Lindemann Parameter ','fontsize',24,'fontweight','b');
    xlabel('Time (s) ','fontsize',20);
    ylabel('r_{L}(t) ','fontsize',20);

    print(gcf,'-dpng', '-r300', [Located num2str(wind(iwind)) '.png']);
    clf
end



