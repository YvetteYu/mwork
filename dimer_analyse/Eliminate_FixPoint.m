clc;clear all;close all
ExpName='TestExp/exp6';
wind='250';
OriginalFile =[ 'J:\Granule\OriginalData\' ExpName '\pic\' wind '\'];
File = ['J:\Granule\' ExpName '\ref\' wind '\'];
OriImg=imread([OriginalFile '00001.png']);
%% click
figure
imshow(OriImg);hold on
tempfix=ginput(7);
for n=1:size(tempfix,1)
    plot(tempfix(n,1),tempfix(n,2),'r^','MarkerFaceColor','r')
end
pause;close;
%% find position of fixpoint
load([File '\tra.mat'],'BX','BY');
fixpoint=zeros(1,size(tempfix,1)); fixdist=zeros(1,size(tempfix,1));
for n=1:7
    [fixdist(n) fixpoint(n)]=min((tempfix(n,1)-BX(1,:)).^2+(tempfix(n,2)-BY(1,:)).^2);
end
%%
BX(:,fixpoint)=[]; BY(:,fixpoint)=[];
save([File '\tra.mat'],'BX','BY');
