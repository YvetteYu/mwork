clc;clear all;close all;
ExpName='monomer_exp11';
File=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/ref/'];
wind='185';
load([File wind '/tra.mat'],'B*');
load([File wind '/velocity.mat'],'V*');
frame=randi([1 10000],1,5);
figure

for iframe=1:length(frame)
X=BX(frame(iframe),:);
Y=BY(frame(iframe),:);
Vel=sqrt(mean(Vx(frame(iframe):frame(iframe)+5,:).^2+Vy(frame(iframe):frame(iframe)+5,:).^2));
%%
avgX=mean(X);
avgY=mean(Y);
dis=mydistance(avgX,avgY,X,Y);
plot(dis,Vel,'.','LineStyle','none')
title(num2str(iframe),'FontSize',18)
pause;clf
end