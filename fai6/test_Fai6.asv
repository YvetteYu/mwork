clc;clear all;close all;

addtheta=0*2*pi/360;
fai=[0:60:300]*2*pi/360;
cospart=0;
sinpart=0;

for n=1:length(fai)
    if n==1
        theta=fai(n)+addtheta;
    else
        theta=fai(n)+theta;
    end
    cospart=cospart+cos(6*theta);
    sinpart=sinpart+sin(6*theta);
end

Faicos=cospart/6;
Faisin=sinpart/6;
FaiR=sqrt(Faicos^2+Faisin^2);