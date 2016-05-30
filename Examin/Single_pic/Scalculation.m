%3. define the angle of chain and calculate angle correction S


for str=3:10
% ******** you have to manual change these parameter********
 File = '/Users/missyvetteyu/Desktop/temp/TimeSerial_DimerOrder/';
  %after processing, the data will be saved here.
 load([File 'CM/' num2str(str) '.mat'],'X','Y');
 load([File 'ref/' num2str(str) 'pair.mat'],'index');

% first pair=index(:,1);
%%
dnumber=length(index);
cos_theta=zeros(1,dnumber);
sin_theta=zeros(1,dnumber);
sin_2theta=zeros(1,dnumber);
cos_2theta=zeros(1,dnumber);
theta=zeros(1,dnumber);
vector=zeros(1,2*dnumber);
%%   
    [index]=myNewIndex(index,X,Y);
     % made the angle in region [ pi/2, -pi/2 )
    [d]=mydistance(X(index(1,:)),Y(index(1,:)),X(index(2,:)),Y(index(2,:)));
    vector=[X(index(1,:))-X(index(2,:)) Y(index(1,:))-Y(index(2,:))];
     % vector=[X2-X1 X4-X3 .... X48-X47 Y2-Y1 Y4-Y3 ...]
    cos_theta= vector(1:dnumber)./d;
    sin_theta= vector(dnumber+1:2*dnumber)./d;
    theta=asin(sin_theta);
    cos_2theta= (cos_theta.^2 - sin_theta.^2);
    sin_2theta= (2*cos_theta.*sin_theta);
    tan_2alpha=sum(2*cos_theta.*sin_theta)/sum(cos_theta.^2 - sin_theta.^2);
    cos_2alpha=sqrt(1/(tan_2alpha^2+1)); 
    sin_2alpha=tan_2alpha/sqrt((tan_2alpha^2+1));
    S=sum(3*cos_2theta*cos_2alpha+3*sin_2theta*sin_2alpha+1)/(4*dnumber);

save([File 'ref/' num2str(str) 'inf_orientation.mat'],'vector','S','theta');
clc;clear all;close all;
end