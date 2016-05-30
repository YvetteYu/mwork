%3-2 calculate the angular velocity
clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
framerate=30;

for iwind=1:length(wind)
load([File num2str(wind(iwind)) '/inf_orientation.mat'],'theta');
omega=(theta(2:end,:)-theta(1:end-1,:))*framerate;
MSVr=mean((omega).^2,2)';
save([File num2str(wind(iwind)) '/Velocity.mat'],'-append','omega','MSVr');
end
