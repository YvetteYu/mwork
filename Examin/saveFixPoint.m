clc;clear all;close all
ExpName='dimer_exp19';
OriginalFile =[ 'J:\Granule\OriginalData\' ExpName '\pic\'];
File = ['J:\Granule\' ExpName '\ref\'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
figure
for iwind=2:length(wind)
OriImg=imread([OriginalFile num2str(wind(iwind)) '\00001.png']);
%% click
imshow(OriImg);hold on
tempfix=ginput(7);
fixX=tempfix(:,1);
fixY=tempfix(:,2);
for n=1:size(tempfix,1)
    plot(fixX(n),fixY(n),'r^','MarkerFaceColor','r')
end
pause;clf;
%%
save([File num2str(wind(iwind)) '\fixpoint.mat'],'fixX','fixY')
end