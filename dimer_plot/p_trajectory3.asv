clc;clear all;close all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/' ExpName '/Datanalysis/trajectory/'];
File = ['J:/Granule/' ExpName '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind='185';
load([File wind '/tra.mat'],'B*');
%% plot the trajectory
startime=1;
endtime=7*60+50;
%iparticle=randi([1 Exp_info.Pnumber],1,8);
iparticle=1:127;
plot(BX(startime*30:endtime*30,iparticle),BY(startime*30:endtime*30,iparticle))
myHexagonBoun(Exp_info.BCenter(1),Exp_info.BCenter(2),Exp_info.BRadius);
axis off;
set(gca,'YDir','reverse');