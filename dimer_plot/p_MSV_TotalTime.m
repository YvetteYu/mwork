% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_exp20';
Located=['C:/Users/user/GoogleDrive/Exp/' ExpName '/Datanalysis/'];
ProcessFile = ['J:/Granule/' ExpName '/'];
load([ProcessFile 'ref/exp_parameter.mat'],'Exp_info');
str=Exp_info.wind;
ythresh=200;
span=11;time=0;
figure
%%
for file=1:length(str)
    load([ProcessFile 'ref/' num2str(str(file)) '/velocity.mat'],'MSV*');
    icolor=[0.2 0.5 0.9;0.9 0.5 0.2];
    Vrtemp=(MSVx+MSVy);
    Vrtemp(isnan(Vrtemp))=[];
    Vrtemp(Vrtemp>ythresh)=[];
     % delete the extreme large value
    Vr=smooth(Vrtemp,span);
    clear Vx Vy *temp
    
    time=time(end)+(0:(length(Vr)-1))/30;
    plot(time,Vr,'.','MarkerSize',5,'Color',icolor(rem(file,2)+1,:));
    hold on
end
box on;
[Newfiguresize]=myRescaleFig(20,15);
ylimit=fix(nanmax(Vr))+1;
if ylimit < 1
    ylimit=1;
end
text(20,ythresh-10,ExpName,'FontSize',14,'Color','k');
set(gca,'FontSize',16);
set(gcf,'PaperPosition',Newfiguresize);
%set(gca,'xlim',[0 time(end)],'ylim',[0 ythresh]);
title(' <v^2> - time','fontsize',24,'fontweight','b');
xlabel('Time(s) ','fontsize',20);
ylabel('MSV (mm/s)^2 ','fontsize',20);
saveas(gcf,[Located 'MSV/MSV.fig']);
print(gcf,'-dpng', '-r200', [Located 'MSV/MSV.png']);
