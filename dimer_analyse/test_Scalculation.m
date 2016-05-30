%test S calculation
clc;close all;clear all;

%% part1. Angle test   
 % a set of given "angle", test whether the S is correct.
  %-------------------------------------- 
    %theta=0.4*pi*ones(1,100);
    theta=[0.4*pi*ones(1,50) -0.4*pi*ones(1,50)];%zeros(1,20)];
    dnumber=length(theta);
  %--------------------------------------  
    cos_theta=cos(theta);
    sin_theta=sin(theta);
    cos_2theta= (cos_theta.^2 - sin_theta.^2);
    sin_2theta= (2*cos_theta.*sin_theta);
    tan_2alpha=sum(2*cos_theta.*sin_theta)/sum(cos_theta.^2 - sin_theta.^2);
    cos_2alpha=sqrt(1/(tan_2alpha^2+1)); 
    sin_2alpha=tan_2alpha/sqrt((tan_2alpha^2+1));
    tempS=sum(3*cos_2theta*cos_2alpha+3*sin_2theta*sin_2alpha)/(4*dnumber);
    S=abs(tempS)+0.25;
 % Still didn't figure it out yet. 
 % But test it with some different data(identical angle)
%%
Stest=mean(3*cos(theta).^2-1)/2;
%% part2. 
 %a set of given "position", test whether the vector is correct.
 clc;close all;clear all;
 
    index=[1:50;51:100];
        % index=[1 2 3 ....50
        %       51 52 .....100]
    BX=[1:50 4:53];
        % BX=[2 3 4...51 1 2 3 ...50]
    BY=[ones(1,100)];
        % BY=[2 2 2 ..... 1 1 1]
    %fi=0:0.125:2*pi;
    %fi(51)=[];
    %BX=[cos(fi) zeros(1,50)];
    %BY=[sin(fi) zeros(1,50)];
    [d]=mydistance(BX(index(1,:)),BY(index(1,:)),BX(index(2,:)),BY(index(2,:)));
    vector=[BX(index(1,:))-BX(index(2,:)) BY(index(1,:))-BY(index(2,:))];
     % value of index = Pi = BX(1, Pi)
     % vector = [ V1x~V50x V1y~v50y ] 
     % there is a problem : the O(0,0) located on upper left corner
    cos_theta= vector(1:50)./d;
    sin_theta= vector(51:100)./d;
    theta=asin(sin_theta);
    
    