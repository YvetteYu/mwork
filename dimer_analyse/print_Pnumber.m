% output pic with assigning a number and mark * with some specify particles
% to check the tracing is correct.
%clear all;close all;clc
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/' ExpName '/Datanalysis/trajectory/'];
File = ['J:/Granule/' ExpName '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind='180';
load([File wind '/tra.mat'],'BX','BY');
frame=[1 14250];
figure
myHexagonBoun(Exp_info.BCenter(1),Exp_info.BCenter(2),Exp_info.BRadius);
hold on
for ipar=1:Exp_info.Pnumber
    ParticleNo=sprintf('%d',ipar);
    text(BX(frame(1),ipar)+1,BY(frame(1),ipar)+1,ParticleNo,'Color','k');
   hold on
   text(BX(frame(2),ipar)+5,BY(frame(2),ipar)+1,ParticleNo,'Color','r');
end
axis off;
set(gca,'YDir','reverse');