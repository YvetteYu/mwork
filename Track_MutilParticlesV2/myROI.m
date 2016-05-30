function [BW]=myROI(ImgPath)

Img=imread(ImgPath);
figure
imshow(Img);hold on
 text(500,0,['draw a region you want to process'],'FontSize',14,...
    'FontWeight','bold');
BW=roipoly(Img);
%imshow(BW)
clear Img;close;
end