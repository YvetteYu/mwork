clc;clear all;close all;
ExpName='dimer_Cooling';
File = ['/Users/yvette/GoogleDrive/Data/' ExpName '/'];
Located=[File 'Datanalysis/S/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.Pnumber;
Pnumber=Exp_info.Pnumber;
skip=5;
figure
%%
iYTick=0.2:0.1:0.6;
ylimit=[0.2 0.6];
for iwind=10%:length(wind)
    if iwind<6
        % rho_n < 1
        iXTick=60:75:600;
        %iticklabel={'4', '','3.5','','3','','2.5'};
    else
        % rho_n > 1
        iXTick=0:150:1200;
        iticklabel={'7','6.5','6','5.5','5','4.5','4','3.5','3'};
    end
load([File 'ref/' num2str(wind(iwind)) '/inf_orientation'],'S');
frame=(1:1:length(S))/30;
frame=frame(1:skip:end);
tempS=S(1:skip:end);
plot(frame,tempS,'-','Color',[0.15 0.8 0.3]);
rhon=sprintf('%0.2f',wind(iwind)/100);
text(800,0.3,['\rho_n=' rhon],'fontsize',10);
ha=gca;
set(ha,'xlim',[0 frame(end)+20],'ylim',ylimit)
set(ha,'XTick',iXTick,'YTick',iYTick);
%set(ha,'XTickLabel',iticklabel);
set(ha,'XTickLabel',[])
set(ha,'YTickLabel',[])
box on;
%xlabel('Input voltage(volt) ','fontsize',12);
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 5 3.5]);
%print(gcf,'-dpng', '-r100', [Located num2str(wind(iwind)) '.png']);
print(gcf,'-depsc','-tiff','-r100', [Located num2str(wind(iwind)) '.eps']);
clf
end
