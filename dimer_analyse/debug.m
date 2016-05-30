clc;clear all;close all;
wind= '19';
exp='dimer_exp3';
load(['H:\Granule\' exp '_131107\ref\' wind '\tra.mat']);
errorframe=13820;
X=BX(errorframe-1,:);
Y=BY(errorframe-1,:);
tempX=BX(errorframe,:);
tempY=BY(errorframe,:);
fp=fopen(['C:\Users\user\Desktop\debug_' exp '_' wind '2.txt'],'a');
fprintf(fp,'index  value\r\n');
for k=1:100
    [distance]=mydistance(X(k),Y(k),tempX,tempY);
    [value index]=min(distance);
    X(index)=0;
    Y(index)=0;
    fprintf(fp,'%d %f\r\n',index,value);
end
fclose(fp)

