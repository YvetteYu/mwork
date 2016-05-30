clc;clear all;close all;
ExpName='dimer_exp1214';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\exp_parameter.mat'],'Exp_info');

wind=Exp_info.Number;
toplimit=[40 40 20 25 10 9 0.5 0.15 0.35 0.3];
bottomlimit=[15 20 10 10 6 4.5 0.1 0.07 0.08 0.015];
figure

%%
for t=1:length(wind)
    load([File 'ref\' num2str(wind(t)) '\DiffusionCoe.mat'],'AvgMSD');
    tempAvgMSD=AvgMSD(t,:);
    check=tempAvgMSD>bottomlimit(t) & tempAvgMSD<toplimit(t);
    y=log(tempAvgMSD(check));
    ind=find(check,1,'first');
    x=log(ind:1:(ind+length(y)-1));
    [a_fit] = mylinreg2(x,y);
    Linreg_info=struct('slope',a_fit(2),...
                        'intercept',a_fit(1));
    DiffusionC=exp(a_fit(1));
     % add this on May 6. 
    save([File '/ref/' num2str(wind(t)) '/DCFit.mat'],'Linreg_info','DiffusionC');
    fx=(0:1:9000)/1000;
    fy=a_fit(2)*fx+a_fit(1);
    time=log(1:length(tempAvgMSD));
    
    plot(time,log(tempAvgMSD),'b')
    hold on
    plot(fx,fy,'r','LineWidth',1)
    set(gca,'FontSize',20);
    title('DC Linear Fitting','fontsize',24,'fontweight','b');
    xlabel('time interval( log(frames) )','fontsize',22);
    ylabel('MSD( log(D^2) ) ','fontsize',22)
    legend('Data','Fitting');
    print(gcf,'-dpng','-r200',[File '/Datanalysis/fitting/' num2str(wind(t)) '.png'])

    clear x y fx fy 
    clf
    
    fx=1:length(tempAvgMSD);
    fy=exp(log(fx)+a_fit(1));
    loglog(fx,fy,'g')
    hold on
    loglog(fx,tempAvgMSD,'b')
    print(gcf,'-dpng','-r200',[File '/Datanalysis/fitting/' num2str(wind(t)) '2.png'])
    clear tempAvgMSD
    clf
end