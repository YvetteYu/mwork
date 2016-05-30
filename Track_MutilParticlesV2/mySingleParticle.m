function [Xcm,Ycm,extra_avg]=mySingleParticle(ProcessFile,nowframe)
% output lostX and lostY, avoid to open the txt file 
strpic=sprintf('first_star%03d.jpg',nowframe);

img=imread([ProcessFile strpic]);
figure
imshow(img);hold on
text(0,0,'draw a particle region')
bw=roipoly(img);

xposition=[1:1:size(bw,2)]';
Xcm=sum(bw*xposition)/sum(sum(bw));
yposition=[1:1:size(bw,1)];
Ycm=sum(yposition*bw)/sum(sum(bw));
extra_avg=mean(bw);
clear img bw;
close
end