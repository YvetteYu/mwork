% correcting program : for lost particles
clc;clear all; close all;
str=num2str(14);
frame='/06832.jpg';
er=sprintf('%04d',893);

img=imread(['/Users/missyvetteyu/Desktop/temp/dimer/no_chains/pic/v' str frame]);
load(['/Users/missyvetteyu/Desktop/temp/dimer/no_chains/process/v' str '/' er '.mat']);

%%
figure
imshow(img);hold on
for t=1:length(X)
    plot(X(t),Y(t),'y*')
end
pause
bw=roipoly(img);
%%

xposition=[1:1:size(bw,2)]';
Xcm=sum(bw*xposition)/sum(sum(bw));
yposition=[1:1:size(bw,1)];
Ycm=sum(yposition*bw)/sum(sum(bw));
plot(Xcm,Ycm,'y*');
pause;close;
X(100)=Xcm;
Y(100)=Ycm;
save(['/Users/missyvetteyu/Desktop/temp/dimer/no_chains/process/v' str '/' er '.mat'],'X','Y');