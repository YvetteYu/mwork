clc;clear all;close all;
ExpName='dimer_Cooling';
File = ['/Users/yvette/GoogleDrive/Data/' ExpName '/'];
Located=[File 'Datanalysis/Accore/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.Pnumber;
Pnumber=Exp_info.Pnumber;
skip=5;
figure
%%
iYTick=0.5:0.1:0.8;
ylimit=[0.5 0.8];
for iwind=6:length(wind)
    if iwind<6
        % rho_n < 1
        iXTick=60:75:600;
        %iticklabel={'4', '','3.5','','3','','2.5'};
    else
        % rho_n > 1
        iXTick=0:150:1200;
        iticklabel={'7','6.5','6','5.5','5','4.5','4','3.5','3'};
    end
    load([File 'ref/' num2str(wind(iwind)) '/AvgAC'],'AvgAC');
    frame=(1:1:length(AvgAC))/30;
    frame=frame(1:skip:end);
    tempAC=AvgAC(1:skip:end);
    plot(frame,tempAC,'-','Color',[0.15 0.3 0.8]);
    rhon=sprintf('%0.2f',wind(iwind)/100);
    text(800,0.6,['\rho_n=' rhon],'fontsize',10);
    ha=gca;
    set(ha,'xlim',[0 1220],'ylim',ylimit)
    set(ha,'XTick',iXTick,'YTick',iYTick);
    %set(ha,'XTickLabel',iticklabel);
    set(ha,'XTickLabel',[])
    set(ha,'YTickLabel',[])
    set(ha,'TickLength',[0.015 0.01])
    box on;
    %xlabel('Input voltage(volt) ','fontsize',12);
    
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 5 3.5]);
    %print(gcf,'-dpng', '-r100', [Located num2str(wind(iwind)) '.png']);
    print(gcf,'-depsc','-tiff','-r100', [Located num2str(wind(iwind)) '.eps']);
    clf
end

