clc;clear all;close all;
exp='monomer_exp2';
File=['/Users/missyvetteyu/Dropbox/Exp/' exp];
load([File '/ref/AvgDefect.mat'],'Exp_info');
%wind=Exp_info.wind;
wind=21:23;
time=0.2;
framerate=30;
figure('visible','off')
for t=1:length(wind)
    load([File '/ref/' num2str(wind(t)) '/DiffusionCOe.mat'],'AvgMSD');
    x=0:1/framerate:time;x(1)=[];
    y=AvgMSD(1:round(time*framerate));
    sigma=std(x,y);
    clear AvgMSD
    [a_fit,sig_a,yy,chisqr] = mylinreg(x,y,sigma);
    Linreg_info=struct('TotalTime',time,...
        'framerate',framerate,...
        'slope',a_fit(2),...
        'intercept',a_fit(1),...
        'fun_value',yy,...
        'Chisqrr',chisqr);
    save([File '/ref/' num2str(wind(t)) '/DCFit.mat'],'Linreg_info')
    clear Linreg_info
    plot(x,y,'Marker','x','MarkerSize',8,'LineStyle','none','LineWidth',2)
    hold on
    plot(x,yy,'r','LineWidth',2)
    set(gca,'ylim',[0 0.1],'FontSize',20);
    title('DC Linear Fitting','fontsize',24,'fontweight','b');
    xlabel('time interval(s)','fontsize',22);
    ylabel('MSD(D^2) ','fontsize',22)
    legend('Data','Fitting');
    print(gcf,'-dpng','-r200',[File '/Datanalysis/fitting/' num2str(wind(t)) '.png'])
    clf
end

