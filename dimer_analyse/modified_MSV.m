clc;clear all;close all;
ExpName='monomer_exp3';
File=['J:\Granule\' ExpName '\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\'];
load([File 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
uplimit=6000;
downlimit=1000;
iwind=18;
%%

load([File '\ref\' num2str(wind(iwind)) '\velocity.mat'],'Vx','Vy');
Vtemp=(Vx).^2+(Vy).^2;
  % each particle in each frame
Vrtemp=nanmean(Vtemp');
  % Avg particle in each frame
check=(Vrtemp>downlimit & Vrtemp<uplimit);
Vr=Vrtemp(check);
timescale=length(Vr)/length(Vrtemp);
clear Vx Vy Vtemp* Vrtemp
plot(Vr,'.','LineWidth',1,'Color',[0.2 0.5 0.9]);
KEavg_modi=mean(Vr);
save([File 'ref\' num2str(wind(iwind)) '\modifiedMSV.mat'],'Vr','KEavg_modi');
%%
Vr=Vr/(14^2);
time=(1:length(Vr))/(30*timescale);
figure
plot(time,Vr,'.','LineWidth',1,'Color',[0.2 0.5 0.9]);
    box on;
    set(gcf,'PaperUnit','centimeters')
    papersize=get(gcf,'PaperSize');
    width=20;
    height=15;
    left=(papersize(1)-width)/2;
    bottom = (papersize(2)-height)/2;
    myfiguresize=[left,bottom,width,height];
    ylimit=fix(nanmax(Vr))+1;
    if ylimit < 1
        ylimit=1;
    end
 set(gcf,'PaperPosition',myfiguresize);
    set(gca,'xlim',[0 time(end)],'ylim',[0 ylimit]);
    title(' <v^2> - time','fontsize',24,'fontweight','b');
    xlabel('Time(s) ','fontsize',20);
    ylabel('MSV (D/s)^2 ','fontsize',20);
    print(gcf,'-dpng', '-r200', [Located 'MSV/' num2str(wind(iwind)) '.png']);