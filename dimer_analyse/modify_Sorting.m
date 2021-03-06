% To conform with the index of old calculation                                                                                                                                           
clc;clear all;close all;
ExpName='monomer_exp5';
AFile=['J:/Granule/' ExpName '/CM/'];
BFile=['J:/Granule/' ExpName '/ref/'];
load([BFile 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
%%
x1scale=size(Exp_info.roi,1);y1scale=size(Exp_info.roi,2);
clear Exp_info

load(['J:/Granule/' ExpName '/exp_parameter_old.mat'],'Exp_info');
x2scale=size(Exp_info.roi,1);y2scale=size(Exp_info.roi,2);

for iwind=6:length(wind)
%% load old and new data respecitively
load([AFile num2str(wind(iwind)) '/00001.mat'],'X','Y');
load([BFile num2str(wind(iwind)) '/tra.mat'],'BX','BY');
Xtarget=BX(1,:)*x1scale/x2scale;
Ytarget=BY(1,:)*y1scale/y2scale;
clear BX BY
Xtemp=zeros(1,100);Ytemp=zeros(1,100);
figure('visible','off')
for ipar=100:-1:1
    [distance]=mydistance(Xtarget(ipar),Ytarget(ipar),X,Y);
    [value index]=min(distance);
    Xtemp(ipar)=X(index);
    Ytemp(ipar)=Y(index);
    
    plot(Xtarget(ipar),Ytarget(ipar),'ko')
    hold on
    %text(Xtarget(ipar)+5,Ytarget(ipar)+5,num2str(ipar),'Color','k')
    %hold on
    plot(X(index),Y(index),'ro')
    hold on
    %text(X(index),Y(index),num2str(ipar),'Color','r')
    %hold on
    X(index)=0;
    Y(index)=0;
end
print(gcf,'-dpng','-r100',[BFile num2str(wind(iwind)) '.png']);
clf
%X=Xtemp;Y=Ytemp;
%save([AFile num2str(wind(iwind)) '/test.mat'],'X','Y');
end

