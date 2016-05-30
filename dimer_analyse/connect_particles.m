% 2. connect the pair particles by manual click 100 times.  
% the numbers in index are the order in BX
clc;clear all;close all
ExpName='TestExp/exp6';
wind='250';
OriginalFile =[ 'J:/Granule/OriginalData/' ExpName '/pic/' wind '/'];
ProcessFile = ['J:/Granule/' ExpName '/ref/' wind '/'];
OriImg=imread([OriginalFile '00001.png']);
clicknum=[50 40 20 10];
load([ProcessFile 'tra.mat'],'BX','BY');
%% 
figure
imshow(OriImg);hold on
text(500,0,'click 50,40,20,10 times');
%% click
[Xtemp1 Ytemp1]=ginput(clicknum(1));
for n=1:2:clicknum(1)
plot(round(Xtemp1(n)),round(Ytemp1(n)),'g+');
hold on
plot(round(Xtemp1(n+1)),round(Ytemp1(n+1)),'m+');
end
hold on
[Xtemp2 Ytemp2]=ginput(clicknum(2));
for n=1:2:clicknum(2)
plot(round(Xtemp2(n)),round(Ytemp2(n)),'g+');
hold on
plot(round(Xtemp2(n+1)),round(Ytemp2(n+1)),'m+');
end
hold on
[Xtemp3 Ytemp3]=ginput(clicknum(3));
for n=1:2:clicknum(3)
plot(round(Xtemp3(n)),round(Ytemp3(n)),'g+');
hold on
plot(round(Xtemp3(n+1)),round(Ytemp3(n+1)),'m+');
end
hold on
[Xtemp4 Ytemp4]=ginput(clicknum(4));
for n=1:2:clicknum(4)
plot(round(Xtemp4(n)),round(Ytemp4(n)),'g+');
hold on
plot(round(Xtemp4(n+1)),round(Ytemp4(n+1)),'m+');
end
hold on
pause; close
%% combine the ginput points

Xhead=[Xtemp1(1:2:clicknum(1));Xtemp2(1:2:clicknum(2));Xtemp3(1:2:clicknum(3));Xtemp4(1:2:clicknum(4))];
Yhead=[Ytemp1(1:2:clicknum(1));Ytemp2(1:2:clicknum(2));Ytemp3(1:2:clicknum(3));Ytemp4(1:2:clicknum(4))];
Xtail=[Xtemp1(2:2:clicknum(1));Xtemp2(2:2:clicknum(2));Xtemp3(2:2:clicknum(3));Xtemp4(2:2:clicknum(4))];
Ytail=[Ytemp1(2:2:clicknum(1));Ytemp2(2:2:clicknum(2));Ytemp3(2:2:clicknum(3));Ytemp4(2:2:clicknum(4))];
clear Xtemp* Ytemp*
%% find and save index
dimernum=sum(clicknum)/2;
dishead=zeros(1,dimernum); indhead=zeros(1,dimernum); 
distail=zeros(1,dimernum); indtail=zeros(1,dimernum);

for t=1:dimernum
[dishead(t) indhead(t)]=min((Xhead(t)-BX(1,:)).^2+(Yhead(t)-BY(1,:)).^2);
[distail(t) indtail(t)]=min((Xtail(t)-BX(1,:)).^2+(Ytail(t)-BY(1,:)).^2);
end
 % I didn't use mydistance.m here because the squre root of distance would
 % too small to distinguish the minimum.
 
index=[indhead;indtail];                        
clear *head *tail
description=struct('variable1',...
       ['[index] is 2xPnumber array which tells two particles are '...
       'partners of dimer. It record the particle number from BX and its '...
       'arrangement are random by manual click. Y of first row is larger'...
       'than second row.']);
save([ProcessFile 'pair.mat'],'index');
