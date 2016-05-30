% plot defect fraction - total exp time 
clc; clear all; close all;
ExpName='dimer_exp19';
File=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/ref/'];
Located=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/Datanalysis/defect/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
pnumber=127;%Exp_info.Pnumber;
frame=zeros(1,length(wind));
ylimit=[0 0.5];
wind5color=[0 0.5 0.8;1 0.2 0.2];
wind7color=[0 0.2 0.5;0.4 0.1 0.1];
figure
for iwind=1:length(wind)
    remainder=rem(iwind,2)+1;
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([File num2str(wind(iwind)) '/Bdefect.mat'],'NumB1*');
    if iwind==1
        frame(iwind+1)=length(th5);
    else
        frame(iwind+1)=frame(iwind)+length(th5);
    end
    time=frame(iwind)+1:frame(iwind+1);
    time=time/30;
    DFraction=(th5+th7-NumB1DF5-NumB1DF7)/pnumber;
    plot(time, DFraction,'Color',wind5color(remainder,:));hold on
end
set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 14 10]);
set(gca,'FontSize',14,'xlim',[0 time(end)+10],'ylim',ylimit);
xlabel('time(s) ','fontsize',14);
ylabel('Defect Fraction ','fontsize',14);
saveas(gcf,[Located 'DF_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'DF_TotalTime.png']);
print(gcf,'-depsc','-tiff','-r300', [Located 'DF_TotalTime.eps']);