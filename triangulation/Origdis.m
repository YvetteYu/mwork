% calculate dis(the middle point of each lattice line, Original point)
clc;clear all;close all;

FilePath='/Users/missyvetteyu/Desktop/temp/dimer/no_chains/';
load([FilePath 'CM/exp_parameter.mat'],'scale','ox','oy');
str=num2str(13);
load([FilePath 'CM/v' str '/ref/tra.mat']);

frame=2701;
%ImgList=dir([FilePath 'pic/v11/*jpg']);
%Img=imread([FilePath 'pic/v11/' ImgList(frame).name]);
%figure
%imshow(Img)
%[px py]=ginput(4);
%ox=mean(px);oy=mean(py);
load([FilePath 'triangular/LatticeLine/v' str '/' sprintf('%05d',frame) '.mat']);
%%
X=BX(frame,:);
Y=BY(frame,:);
mpx=zeros(1,length(Tripair));
mpy=zeros(1,length(Tripair));
Odis=zeros(1,length(Tripair));

for t=1:length(Tripair)
    mpx(t)=(X(Tripair(t,1))+X(Tripair(t,2)))/2;
    mpy(t)=(Y(Tripair(t,1))+Y(Tripair(t,2)))/2;
    Odis(t)=mydistance(mpx(t),mpy(t),ox,oy)*scale;
end

save([FilePath 'triangular/LatticeLine/v' str '/' sprintf('%05d',frame) '.mat'],'Odis','-append');