% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_exp1218';
File = ['/Users/yvette/GoogleDrive/Data/' ExpName '/'];
Located=[File 'Datanalysis/MSV/'];
%load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=12:18;
span=9; skip=10;
windcolor=[1 0.2 0.8; 0.4 0.4 0.4;...
           1 0.6 0  ; 0 0.4 0.8  ;...
           1 0.2 0.2; 0.4 0.7 0.7];
figure
%%
itickx=[0 60:75:600];
iticklabel={'4.2','4','','3.5','','3','','2.5',''};
ylimit=[0 4];
for iwind=1:5
    icolor=windcolor(iwind,:);
    load([File 'ref/' num2str(wind(iwind)) '/velocity.mat'],'MSV*');
    tempMSV=(MSVx+MSVy)/14^2;
    time=(0:length(tempMSV)-1)/30;
    tempMSV=smooth(tempMSV,span);
    tempMSV=tempMSV(1:skip:end);
    time=time(1:skip:end);
    plot(time,tempMSV,'Color',icolor);
    hold on
end

set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 12 7]);
set(gca,'FontSize',12,'ylim',ylimit)
set(gca,'XTick',itickx,'XTickLabel',iticklabel);
text(3,3.8,'(a)','FontSize',12);
xlabel('Input voltage(volts) ','FontSize',12);
ylabel('MSV(D_m/s)^2','FontSize',12);
print(gcf,'-dpng', '-r100', [Located 'MSV1.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'MSV1.eps']);
%saveas(gcf, [Located 'MSV1.fig'])
clf
%{
itickx=0:75:1200;
iticklabel={'7','','6.5','','6','','5.5','','5','','4.5','','4','','3.5','','3'};
ylimit=[0 2.5];

for iwind=6:length(wind)
    icolor=windcolor(iwind-5,:);
    load([File 'ref/' num2str(wind(iwind)) '/velocity.mat'],'MSV*');
    tempMSV=(MSVx+MSVy)/14^2;
    time=(0:length(tempMSV)-1)/30;
    tempMSV=smooth(tempMSV,3);
    tempMSV=tempMSV(1:skip:end);
    time=time(1:skip:end);
    plot(time,tempMSV,'Color',icolor);
    hold on
end

set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 12 7]);
set(gca,'FontSize',12,'ylim',ylimit);
set(gca,'XTick',itickx,'XTickLabel',iticklabel)
text(5,2.3,'(b)','FontSize',12);
xlabel('Input voltage(volts) ','FontSize',12);
ylabel('MSV(D_m/s)^2','FontSize',12);
print(gcf,'-dpng', '-r100', [Located 'MSV2.png']);
print(gcf,'-depsc','-tiff','-r100', [Located 'MSV2.eps']);
%saveas(gcf, [Located 'MSV2.fig'])
%}


