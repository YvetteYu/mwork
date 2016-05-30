clc;clear all;close all;
ExpName={'monomer_exp11','dimer_exp19'};
% cell array
VarableA={[0.8 0.8 1 1 1.1 1.2 1.2 1.25 1.3 1.3 1.3 1.3 1.35 1.38 1.38]
    [0.9 1.05 1 0.85 1.1 1.2 1.15 1.15 1.15 1.25 1.25 1.2 1.25 1.25 1.25]};
%VarableA={[5 6 25 35 50 60 80 95 110 135 175 180 195 200 220]/2
%    [2.1 12 12 6 20 29 28 48 52 53 58 58 65 78 80]/2};
icolor=['b' 'm']; imarker=['o' '+'];
wstart=[8 11]; % you can choose which wind you want satrt
wend=[22 25];  % you can choose which wind you want end
iMS=[5 8];
%%
xlimit=[0 0];
for iexp=1%:2
    
    Located=['/Users/yvette/GoogleDrive/Data/' ExpName{iexp} '/'];
    File = ['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName{iexp} '/ref/'];
    load([File 'exp_parameter.mat'],'Exp_info');
    wind=Exp_info.wind;
    
    %%

    if iexp==1
        [KE,KEt,KEr]=myKE('monomer',File,wind,wstart(iexp),wend(iexp));
        tempA=VarableA{iexp}(1:(wend(iexp)-wstart(iexp)+1));
        plot(KE(1:2),tempA(1:2),'Marker',imarker(iexp),'Color',icolor(1),...
            'LineStyle','none','MarkerSize',iMS(iexp),...
            'LineWidth',2,'MarkerFaceColor',icolor(1));
        hold on
        plot(KE(3:13),tempA(3:13),'Marker',imarker(iexp),'Color',icolor(2),...
            'LineStyle','none','MarkerSize',iMS(iexp),...
            'LineWidth',2,'MarkerFaceColor',icolor(2));
        hold on
    else
        [KE,KEt,KEr]=myKE('monomer',File,wind,wstart(iexp),wend(iexp));
        tempA=VarableA{iexp}(1:(wend(iexp)-wstart(iexp)+1));
        plot(KE(1:5),tempA(1:5),'Marker',imarker(iexp),'Color',icolor(1),...
            'LineStyle','none','MarkerSize',iMS(iexp),...
            'LineWidth',2,'MarkerFaceColor',icolor(1));
        hold on
        plot(KE(6:15),tempA(6:15),'Marker',imarker(iexp),'Color',icolor(2),...
            'LineStyle','none','MarkerSize',iMS(iexp),...
            'LineWidth',2,'MarkerFaceColor',icolor(2));
        hold on
    end
    xlimit(iexp)=max(KE);
end
lg=legend('stage2','stage3','D-stage2','D-stage3','Location','southeast');
set(lg,'Box','off')

set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 8 6]);
set(gca,'FontSize',12)
set(gca,'xlim',[0 max(xlimit)],'ylim',[0.8 1.45])
xlabel('MSV (mm/s)^2 ','FontSize',12);
%ylabel('DC (mm^2/t^\alpha)','FontSize',12);
ylabel('\alpha','FontSize',12);
print(gcf,'-dpng', '-r100', [Located 'alpha.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'alpha.eps']);
saveas(gcf, [Located 'alpha.fig'])
%}