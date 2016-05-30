clc;clear all;close all;
%ExpName={'monomer_exp11','dimer_exp19'};
%wstart=[8 11];
%wend=[22 25];

File = ['/Users/yvette/GoogleDrive/HexagonBoundary/dimer_exp19/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
KEr=zeros(1,length(wind));
KEd=zeros(1,length(wind));
rodlength=Exp_info.Lconstant_pixel*Exp_info.scale(2); % unit:mm
inertial=rodlength^2/2;

for iwind=12%:length(wind)
load([File num2str(wind(iwind)) '/velocity.mat'],'MSVr');
KEr(iwind)=sqrt(mean(MSVr));
load([File num2str(wind(iwind)) '/inf_orientation.mat'],'theta');
Vangle=rad2deg(theta(2:end,:)-theta(1:end-1,:))*30;
temp=mean(abs(Vangle),2)';
KEd(iwind)=mean(temp);
end
plot(KEr);hold on
plot(KEd,'r')
%{
for iexp=2
File = ['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName{iexp} '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
if iexp==1
        [KE,KEt,KEr]=myKE('monomer',File,wind,wstart(iexp),wend(iexp));
else
        [KE,KEt,KEr]=myKE('dimer',File,wind,wstart(iexp),wend(iexp));
end
end
%}
    
    