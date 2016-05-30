clear all;close all;clc;

Particle='dimer';
ExpNumber='TestExp/exp4';
ExpDate=20150401;
ParNum=120;
iwind=215:5:250;
TargetColor=3;  %(R-1 G-2 B-3)
%ExpName=[Particle '_exp' num2str(ExpNumber)];
ExpName=ExpNumber;          
%% Calculate
Img=imread(['/Users/yvette/Pictures/test/1.png']);
figure
imshow(Img);hold on
[px py]=ginput(4);
pause
roi=roipoly(Img);
%text(0,10,'pin 4 points for 2 diameter of boundary','FontSize',14,...
%   'FontWeight','bold');

PicWidth=size(roi,1);
PicHeight=size(roi,2);

ox=mean(px);oy=mean(py);    
D1=mydistance(px(1),py(1),px(2),py(2));
D2=mydistance(px(3),py(3),px(4),py(4));
R=mean([D1 D2])/2;
text(10,10,'press blank after measuring distance.')
pause;
dis=zeros(1,3);
hl=imdistline(gca);
pause
for i=1:3
dis(i)=getDistance(hl);
pause;
end
scale=296/mean(dis);
close
%%
Exp_info=struct('particle',Particle,...
                'Number',ExpNumber,...
                'Date',ExpDate,...
                'Pnumber',ParNum,...
                'wind',iwind,...
                'width',PicWidth,...
                'height',PicHeight,...
                'ParColor',TargetColor,...
                'roi',roi,...
                'BCenter',[ox oy],...
                'BRadius',R,...
                'scale',scale...
                );
save(['/Users/yvette/Pictures/test/exp_parameter.mat'],'Exp_info');
