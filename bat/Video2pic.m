clear all; close all; clc;
exp='monomer_exp4';
File=['J:\Granule\OriginalData\' exp '\' ]; 
fp=fopen([ File 'Video2pic.txt'],'w');    
wind=[135 140 150 155 160 170 175 180 185 190 200 205 210 220 225 235 240];
VidNum=dir([File 'movie\*mp4']);
    %%
    for  n=1:length(VidNum)
        VidName=wind(n);
        fprintf(fp,['ffmpeg -i %s -filter:v yadif '...
            '-s 508x508 -ss 00:00:00 -r 30 -t 00:06:00 -y ..\\pic\\'...
            '%d\\%%%%05d.png\r\n'],VidNum(n).name,VidName);
    end
    fclose(fp);

