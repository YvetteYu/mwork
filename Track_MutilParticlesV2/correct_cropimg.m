close all;clc;
%nowframe=27;
oriImg=imread([Filepath 'img005.jpg']);
%oriImg=imread([Filepath ImgName(nowframe).name]);
imshow(oriImg)
[tempX,tempY]=ginput(1);
lengthX=single(cropX(2)-cropX(1));
lengthY=single(cropY(2)-cropY(1));

close;
cropImg=imcrop(oriImg,[tempX tempY lengthX lengthY]);
figure
imshow(cropImg)
saveas(gcf, sprintf([afterFilepath 'crop%03d'],32),'jpg');  

