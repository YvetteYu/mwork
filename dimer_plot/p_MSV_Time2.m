% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_exp19';
Located=['C:/Users/user/GoogleDrive/Exp/' ExpName '/Datanalysis/'];
ProcessFile = ['J:/Granule/' ExpName '/'];
load([ProcessFile 'ref/exp_parameter.mat'],'Exp_info');
str=Exp_info.wind;
span=11;
figure

for file=12%1:length(str)
    load([ProcessFile 'ref/' num2str(str(file)) '/velocity.mat'],'MSV*');
    
    Vrtemp=(MSVx+MSVy);
    Vrtemp(isnan(Vrtemp))=[]; 
    plot(Vrtemp,'.','MarkerSize',5);
    pause;clf
    Vrtemp(Vrtemp>2000)=[];
     % delete the extreme large value
    Vr=smooth(Vrtemp,span);
    clear Vx Vy *temp
       
    time=(0:(length(Vr)-1))/30;
    plot(time,Vr,'.','MarkerSize',5,'Color',[0.2 0.5 0.9]);
    box on;
    [Newfiguresize]=myRescaleFig(20,15);
    ylimit=fix(nanmax(Vr))+1;
    if ylimit < 1
        ylimit=1;
    end
    set(gcf,'PaperPosition',Newfiguresize);
    set(gca,'xlim',[0 time(end)],'ylim',[0 ylimit]);
    title(' <v^2> - time','fontsize',24,'fontweight','b');
    xlabel('Time(s) ','fontsize',20);
    ylabel('MSV (mm/s)^2 ','fontsize',20);
    %saveas(gcf,[Located 'MSV/' num2str(str(file)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'MSV/' num2str(str(file)) '.png']);
end