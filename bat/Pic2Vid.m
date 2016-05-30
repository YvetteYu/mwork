clear all; close all; clc;
ExpName='dimer_exp8';
File=['J:\Granule\' ExpName '\triangular\BoundaryPic\' ]; 
fp=fopen([ File 'Pic2Video.txt'],'w');    
load(['J:\Granule\' ExpName '\ref\AvgDefect.mat'],'Exp_info')
wind=Exp_info.wind;

    %%
    for  w=1:length(wind)
        fprintf(fp,'cd %d\\\r\n',wind(w));
    fprintf(fp,'ffmpeg -f image2 -r 10 -i %%%%05d.png -vcodec h264 ..\\bdf%d.mp4\r\n'...
        ,wind(w));
    fprintf(fp,'cd ..\r\n');
    end
    fclose(fp);

