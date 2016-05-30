clc;clear all;close all;
File='C:\Users\user\GoogleDrive\thesis\apparatus\Boundary\';
filenum=dir([File '*.txt']);
imarker=['o' 's' 'v' '^' '^' '*'];
icolor=[1 0.2 0.8; 0.4 0.4 0.4; 1 0.6 0; 0 0.4 0.8; 1 0.2 0.2; 0.4 0.7 0.7];
for ifile=1:4%length(filenum)
    Bext=textread([ File num2str(ifile) '.txt'],'%f');
    dis=(0:length(Bext)-1)/14.5;
    
        plot(dis,Bext,'Marker',imarker(ifile),'Color',icolor(ifile,:),...
            'MarkerFaceColor',icolor(ifile,:),'LineStyle','none',...
            'MarkerSize',5);
       hold on
    clear Bext
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',12)
legend('data 1','data 2','data 3','data 4','Location','northwest')
xlabel('Distance from center (R) ','fontsize',12);
ylabel('Bext (Gauss) ','fontsize',12);
saveas(gcf,[File 'Bext.fig']);
print(gcf,'-dpng', '-r300', [File 'Bext.png']);
print(gcf,'-depsc','-tiff','-r300', [File 'Bext.eps']);