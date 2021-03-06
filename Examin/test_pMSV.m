clc;close all;clear all;
ExpName='monomer_exp5';
PathA=['J:/Granule/' ExpName '/ref/'];
PathB=['C:/Users/user/Dropbox/Exp/' ExpName '/'];
load([PathA 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
figure
rtime=0;btime=0; threshold=20;
%%
for iwind=1:length(wind)
    rcolor=[0.8 0.6 0.6;0.6 0.2 0.2]; 
    windfile=num2str(wind(iwind));
    load([PathA windfile '/velocity.mat'],'MSV*');
    Vnew=sqrt(MSVx+MSVy);
    Vnew(Vnew>threshold)=[];
    rtime=rtime(end)+(0:(length(Vnew)-1))/30;
    plot(rtime,Vnew,'.','Color',rcolor(rem(iwind,2)+1,:))
    hold on
    clear MSV*
end
set(gca,'ylim',[0 threshold],'YTick',0:2:20)
xlabel('time(s) ','fontsize',18);
ylabel('Velocity (mm/s)','fontsize',18,'Color','k');
print('-dpng', '-r200', [PathB 'Datanalysis/MSV/Vnew' windfile '.png']);
clf
iwind=1;
for iwind=1:length(wind)
    bcolor=[0.6 0.6 0.8;0.2 0.2 0.6];
    windfile=num2str(wind(iwind));
    load([PathB 'ref/' windfile '/velocity.mat'],'V*');
    Vold=sqrt(mean(Vx.^2+Vy.^2,2));
    Vold(Vold>threshold)=[];
    btime=btime(end)+(0:(length(Vold)-1))/30;
    plot(btime,Vold,'.','Color',bcolor(rem(iwind,2)+1,:));
    hold on
    clear Vx Vy
end
set(gca,'ylim',[0 threshold],'YTick',0:2:20)
xlabel('time(s) ','fontsize',18);
ylabel('Velocity (mm/s)','fontsize',18,'Color','k');
print('-dpng', '-r200', [PathB 'Datanalysis/MSV/Vold' windfile '.png']);

