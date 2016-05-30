clc;clear all;close all
Located='/Users/missyvetteyu/GoogleDrive/HexagonBoundary/dimer_exp19/Datanalysis/S/';
r = linspace(0.8,1,10);
theta = linspace(0, 2*pi, 100);
[rg, thg] = meshgrid(r,theta);
[x,y] = pol2cart(thg,rg);
pcolor(x,y,mod(thg, pi));
colormap(hsv);
shading flat;
axis equal;
axis off

r = 1.15;
theta = 0:30:330;
[x,y] = pol2cart(theta/180*pi,r);
for i = 1:length(theta)
    
    h = text(x(i)-0.06, y(i)+0.02, [num2str(theta(i))]);%, '^{\circ}']);
%     h = text(x(i), y(i), sprintf('%3i \circ', theta(i)));
    h.HorizontalAlignment = 'center';
    h.FontSize = 16;
%     h.Interpreter = 'none';        
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 8 8]);
print(gcf,'-depsc','-tiff','-r300', [Located 'color_wheel.eps']);
print(gcf,'-dpng','-r100',[Located 'color_wheel.png']);