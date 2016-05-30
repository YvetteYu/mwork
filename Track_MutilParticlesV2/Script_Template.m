clear all;close all;clc;

ExpName='dimer_exp1518';
%% 
inputnum=input('how many particles do you have? (inpet a number.)');
w=input('what is the width of the original picture?');
h=input('what is the height of the original picture?');
target=input('Which color is your target? (R-1 G-2 B-3)');
switch target
    case 1
        other1=2;
        other2=3;
    case 2
        other1=1;
        other2=3;
    case 3
        other1=1;
        other2=2;
end

%% ROI

Img=imread(['J:\Granule\OriginalData\' ExpName '\pic\15\00001.png']);
figure
imshow(Img);hold on
[px py]=ginput(4);
pause
roi=roipoly(Img);
pause;
%text(0,10,'pin 4 points for 2 diameter of boundary','FontSize',14,...
%   'FontWeight','bold');

ox=mean(px);oy=mean(py);    
R=mean([abs(px(2)+px(1)) abs(py(3)+py(4))]);
pause;
text(10,10,'press blank after measuring distance.')
hl=imdistline(gca)
pause;
api=iptgetapi(hl)
d=api.getDistance;
scale=14/d;
save(['J:\Granule\' ExpName '\exp_parameter.mat'] ,'inputnum','target',...
    'other*','roi','scale','ox','oy','R','w','h');
clear all ;close all;
