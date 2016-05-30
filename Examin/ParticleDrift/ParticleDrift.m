% print original points on after picture.
% confirm how far the particles move. 
clc;close all;clear all;
FilePath='/Users/missyvetteyu/Dropbox/Exp/dimer_exp5/';
Odfile='130';
%Compfile='b190';
load([FilePath 'after/' Odfile '_1.mat']);
load([FilePath 'after/exp_parameter.mat'],'scale');
S1=scale;

%img=imread([FilePath 'pic/' Odfile '_1.png']);
%imshow(img)
%[OPX OPY]=ginput(1);
load([FilePath 'after/exp_parameter.mat'],'OPX','OPY');
OPX1= OPX;
OPY1= OPY;
clear OPX OPY scale
Compfile=dir([FilePath 'pic/b190/*png']);
File=[FilePath 'after/exp_parameter3.mat'];
[OPX2,OPY2,S2]=myOPexist([FilePath 'pic/b190/'],File,Compfile(1).name)
ratio=S1/S2;
figure('visible','off')

for t=1:length(Compfile)
img=imread([FilePath 'pic/b190/' Compfile(t).name]);
imshow(img)
hold on

for par=1:100
    X2=(X-OPX1)*ratio+OPX2;
    Y2=(Y-OPY1)*ratio+OPY2;
    plot(X2(par),Y2(par),'yo','MarkerSize',13,'MarkerFaceColor','g');
    hold on
end
print(gcf,'-dpng','-r100',[FilePath 'after/b19/' Compfile(t).name]);
clf;clear img
end
