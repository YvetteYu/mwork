clc;clear all;close all;
exp='monomer_exp1';
File=['J:\Granule\OriginalData\' exp '\'];
fp=fopen([File 'pic\cropic.txt'],'w');
wid=896;
height=884;
x=0;
y=98;
wind=[140:10:170 190 210 230];
for w=1:length(wind)
picName=dir([File 'pic\' num2str(wind(w)) '\*jpg']);
fprintf(fp,'cd %d\\\r\n',wind(w));
for frame=1:length(picName)
    fprintf(fp,'ffmpeg -i %s -vf crop=%d:%d:%d:%d ..\\..\\process\\%d\\%05d.jpg\r\n'...
        ,picName(frame).name,wid,height,x,y,wind(w),frame);
end
    fprintf(fp,'cd ..\r\n');
end
fclose(fp);