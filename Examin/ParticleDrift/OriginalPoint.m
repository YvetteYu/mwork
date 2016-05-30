clc;close all;clear all;
FilePath='/Users/missyvetteyu/Dropbox/Exp/dimer_exp5/';
imgfile='b190/001';
img=imread([FilePath 'pic/' imgfile '.png']);
imshow(img)
[OPX OPY]=ginput(1);
save([FilePath 'after/exp_parameter3.mat'],'-append','OPX','OPY');