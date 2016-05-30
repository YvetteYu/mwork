clear all;close all;

File='/Users/missyvetteyu/Dropbox/Exp/';
load([File 'monomer_exp6/exp_parameter.mat'],'Exp_info');
img=imread([File 'monomer_exp6/00001.png']);
imshow(img)

%% measure particle diameter in pixel
hl=imdistline(gca);
pause;
api=iptgetapi(hl);
parLength=api.getDistance*Exp_info.scale
%{
%% measure particle area in (pixel)^2
par=roipoly(img);
pause;
pararea=sum(sum(par))

%% measure core of particle area in (pixel)^2
core=roipoly(img);
pause;
corearea=sum(sum(core))
%}
pause;close;clear img

