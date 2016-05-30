% 5.2 save Orientational MeanSqrDisr and AvgMSD
clc;clear all;close all;
exp='dimer_exp5';
file=[140:5:230];
load(['J:\Granule\' exp '\exp_parameter.mat'],'inputnum');
ProcessFile = ['J:\Granule\' exp '\ref\'];
%%
for t=1:length(file)
    str=num2str(file(t));
    load([ProcessFile str '\inf_orientation.mat'],'theta');
    totalFrames=length(theta);
    timescale=totalFrames/2;
    MeanSqrphase=zeros(timescale,inputnum/2);
    %% angular difussion
    for DeltaT=1:timescale
        phase=theta(DeltaT+1:1:end,:)-theta(1:1:end-DeltaT,:);
        MeanSqrPhase(DeltaT,:)=mean(phase.^2);    
    end
    MeanSqrPhase(DeltaT,:)=[];
    AvgMSP=mean(MeanSqrPhase');
    save([ProcessFile str '\PhaseDC.mat'],'AvgMSP','MeanSqrPhase');
    clear MeanSqrphase
end