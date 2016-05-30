% plot trajectory in different segement of time
clc; clear all; close all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/Exp/' ExpName '/Datanalysis/'];
ProcessFile = ['J:/Granule/' ExpName '/ref/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
scale=Exp_info.scale(2);
wind=185;
timeinval=[3];
IntvalFrame=[0 timeinval*30];
w=Exp_info.width; h=Exp_info.height;

%%
figure
load([ProcessFile num2str(wind) '/tra.mat'],'BX','BY');
startframe=0; endframe=0;
for ipic=1:length(timeinval)
    startframe=1+sum(IntvalFrame(1:ipic));
    endframe=sum(IntvalFrame(1:ipic+1));
  
    if endframe>size(BX,1)       
       endframe=size(BX,1);      
    end
    Xtemp=BX(startframe:endframe,:);
    Ytemp=BY(startframe:endframe,:);
    %% set the time
    startime=sprintf('%3.1f',(startframe-1)/30);
    endtime=sprintf('%3.1f',endframe/30);
    clear startframe endframe

    %% plot the boundary
   %myp_CircularBon(Exp_info.BCenter(1),Exp_info.BCenter(2),Exp_info.BRadius);
   myHexagonBoun(Exp_info.BCenter(1),Exp_info.BCenter(2),Exp_info.BRadius);  
   
    %% plot particles trajectory
    plot(Xtemp,Ytemp);
    %%
    myMonomer(200,50,7/scale)
    latline=22/scale;
    hold on
    line([200 200+latline],[50 50],'Color','r')
    myMonomer(200+latline,50,7/scale)
  %% set the figure 
    axis off; daspect([1 1 1]); 
    %set(gca,'xlim',([0 w]),'ylim',[0 h]);
    set(gca,'YDir','reverse');%,'XTick',[],'YTick',[],'TickLength',[0 0]);
    text(w-100,h-10,[startime 's - ' endtime 's'],'FontSize',14);
    print(gcf,'-dpng', '-r200', [Located 'trajectory/' num2str(wind) ...
        '/3s.png']);%num2str(ipic,'%02d') '.png']);
    pause
    clf
    clear *temp
end
