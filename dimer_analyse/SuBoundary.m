clear all;close all;clc
ExpName='TestExp/exp6';
wind='215';
File=['J:/Granule/' ExpName '/ref/'];
Img=imread(['J:/Granule/OriginalData/' ExpName '/pic/' wind '/00001.png']);

%%
figure
imshow(Img);
SBroi=roipoly(Img);
text(5,5,'enter any key to exit the window');
pause; close
save([File 'suboundary.mat'],'SBroi');