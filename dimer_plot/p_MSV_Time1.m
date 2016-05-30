% plot <v^2> vesus time
clc;clear all;close all;
ExpName='monomer_exp5';
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
ProcessFile = ['J:/Granule/' ExpName '/ref/'];
%load([ProcessFile 'exp_parameter.mat'],'Exp_info');
%str=Exp_info.wind;
str=[135 140 150 155 160 170:5:190 200 205 210 220 225 230];
figure

for file=1:length(str)
    load([ProcessFile num2str(str(file)) '/velocity.mat'],'Vx','Vy');
    Vtemp=(Vx).^2+(Vy).^2;
    Vrtemp=nanmean(Vtemp');
    %check=Vrtemp>25;
     % delete the infinitesimal value
    %Vr=Vrtemp(check)/(14^2);
    Vr=Vrtemp/(14^2);
    timescale=length(Vr)/length(Vrtemp);
    clear Vx Vy *temp
    %Vr(Vr>6)=[];
     % delete the extreme large value
    time=(0:(length(Vr)-1))/(30*timescale);
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
    %set(gca,'xlim',[0 time(end)],'ylim',[0 ylimit]);
    title(' <v^2> - time','fontsize',24,'fontweight','b');
    xlabel('Time(s) ','fontsize',20);
    ylabel('MSV (D/s)^2 ','fontsize',20);
    saveas(gcf,[Located 'MSV\' num2str(str(file)) '.fig']);
    print(gcf,'-dpng', '-r200', [Located 'MSV/' num2str(str(file)) '.png']);

end
