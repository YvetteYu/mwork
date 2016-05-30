% 5.1 save Positional MeanSqrDisr and AvgMSD
clc;clear all;close all;
ExpName='dimer_exp8';
load(['J:\Granule\' ExpName '\ref\exp_parameter.mat'],'Exp_info');
scale=Exp_info.scale;
inputnum=Exp_info.Pnumber;
wind=Exp_info.wind;
for iwind=6:length(wind)
    
    ProcessFile = ['J:\Granule\' ExpName '\ref\' num2str(wind(iwind)) '\'];
    load([ProcessFile 'tra.mat']);
    totalFrames=size(BX,1);
    timescale=round(totalFrames/2);
    MeanSqrDisr=zeros(timescale,inputnum);   
    %% displacement and angular difussion
    for DeltaT=1:timescale
        displx=(BX(DeltaT+1:1:end,:)-BX(1:1:end-DeltaT,:))*scale;
        disply=(BY(DeltaT+1:1:end,:)-BY(1:1:end-DeltaT,:))*scale;
         % change this on Dec 31 2014, canceled the normalized.
         % change this on Sep  4 2013, normalized by particle diameter
        MeanSqrDisr(DeltaT,:)=mean(displx.^2+disply.^2,1);
    end
    AvgMSD=mean(MeanSqrDisr,2)';
    save([ProcessFile 'DiffusionCOe.mat'],'MeanSqrDisr','AvgMSD');
     %add this on 6 Oct. 2013
end