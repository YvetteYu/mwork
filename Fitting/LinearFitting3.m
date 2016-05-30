clc;clear all;close all;
ExpName='dimer_exp1214';
ExpNum='14';
File=['J:\Granule\' ExpName '\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis'];
load([File 'ref\' ExpNum '\DiffusionCoe.mat'],'AvgMSD');
wind=1:size(AvgMSD,1);
alfa=zeros(1,size(AvgMSD,1)); 
logD=zeros(1,size(AvgMSD,1));
DiffusionC=zeros(1,size(AvgMSD,1));
startime=1; endtime=0;
%%
x=startime*30:size(AvgMSD,2);
figure
for iwind=1:length(wind)
    %% take out the data we want
    if endtime==0
        y=AvgMSD(iwind,startime*30:end);
    else
        y=AvgMSD(iwind,startime*30:endtime*30);
    end
    %% trandform the data as log  
    p = polyfit(log(x),log(y),1);
     % we want fitting log data.
    alfa(iwind)=p(1); logD(iwind)=p(2);
     % ployfit(x y,1), here 1 means linear fitting
     % p(1) is slpoe, p(2) is intercept
    DiffusionC(iwind)=exp(logD(iwind));
     % add this on May 6 2014. 
    %% plot the original segment of  data
   
    loglog(AvgMSD(iwind,:),'b'); hold on
    loglog(x,y,'g'); hold on
   
    %% plot the fitting line
    fy=DiffusionC(iwind)*(x.^alfa(iwind));
    loglog(x,fy,'r')
    
    legend('Data','Segment Data','Fitting','FontSize',6,'Location','southeast');
    set(gca,'FontSize',20);
    xlabel('time interval (frames)','fontsize',20);
    ylabel('MSD (mm^2) ) ','fontsize',20)
    print(gcf,'-dpng','-r200',[Located '\fitting\' ExpNum '\' num2str(iwind) '.png'])
    clf
    %}
end

save([File '\ref\' ExpNum '\DCFit.mat'],'alfa','logD','DiffusionC');


