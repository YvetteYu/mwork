clc;clear all;close all;
% check which particle is incorrect.
str=num2str(13);
%--------------------------------------------------------------------------
ProcessFile = ['/Users/missyvetteyu/Desktop/temp/dimer/no_chains/process/v' str '/ref/'];
%--------------------------------------------------------------------------

load([ProcessFile 'tra.mat']);
%load([ProcessFile 'inf_orientation.mat'],'theta');
load('/Users/missyvetteyu/Desktop/temp/dimer/no_chains/process/exp_parameter.mat','scale');
timescale=100;
ipar=100;
par=100;
%% 

totalFrames=length(BX);
MeanSqrDisr=zeros(timescale,100);
MeanSqrphase=zeros(timescale,50);
% ------- DeltaT=2 min-------------



%% displacement and angular difussion 
for DeltaT=1:timescale
displx=(BX(DeltaT+1:1:end,ipar:par)-BX(1:1:end-DeltaT,ipar:par))*scale;
disply=(BY(DeltaT+1:1:end,ipar:par)-BY(1:1:end-DeltaT,ipar:par))*scale;
%phase=theta(DeltaT+1:1:end,:)-theta(1:1:end-DeltaT,:);
%MeanSqrphase(DeltaT,:)=mean(phase.^2);
MeanSqrDisr(DeltaT,ipar:par)=mean(displx.^2+disply.^2);
end
StdSqrDisr=std(MeanSqrDisr);
save([ProcessFile 'DiffusionCOe.mat'],'MeanSqrDisr','MeanSqrphase');
clear phase dis* B*
%% for 100 particles
figure(1);hold on
h1=plot(MeanSqrDisr);
%axis([0 60 0 12]);
%set(gca,'XTick',0:3:60);set(gca,'XTickLabel',0:0.1:2);
% you need to set twice, cover 'XTick' with 'XTickLabel' 
title(['Difussion Coefficient ' str],'fontsize',14,'fontweight','b');
xlabel('Time interval (s)','fontsize',12);
ylabel('Mean Square Displacement (mm^2)','fontsize',12);
