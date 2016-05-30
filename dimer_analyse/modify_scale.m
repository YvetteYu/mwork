clc;clear all;close all;
ExpName='monomer_exp11';
load(['J:/Granule/' ExpName '/ref/exp_parameter.mat'],'Exp_info');
dis=zeros(1,3);
img=imread(['J:/Granule/OriginalData/' ExpName '/pic/145/00001.png']);
imshow(img)
hl=imdistline(gca);
pause
for i=1:3
dis(i)=getDistance(hl);
pause;
end
scale=296/mean(dis)
Exp_info.scale=[Exp_info.scale scale]
save(['J:/Granule/' ExpName '/ref/exp_parameter.mat'],'Exp_info');