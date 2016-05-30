clc;close all;clear all;
exp='monomer_exp3';
File=['J:\Granule\OriginalData\' exp '\' ]; 
w=984;
h=900;
x=516;
y=50;
wind=[130 140 150 155 160 170 175 180 185 190 200 205 210 220 225 235 240];
VidNum=dir([File '*.MTS']);
fp=fopen([ File 'CropVideo.txt'],'w');
for n=1:length(VidNum)
    VidName=wind(n);
fprintf(fp,'ffmpeg -i %d.MTS -an -ss 00:00:00 -vf crop=%d:%d:%d:%d -y ..\\movie\\%d.mp4\r\n'...
    ,VidName,w,h,x,y,VidName);
end
fclose(fp)