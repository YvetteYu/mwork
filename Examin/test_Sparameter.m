% for Orientational parameter test
clear all; close all;
RodNum=360;
order=0;
if order==1
    theta=zeros(1,RodNum);
else
    theta=0:(pi/RodNum):4*pi;
end
Sp=mean(3*cos(theta).^2-1)/2