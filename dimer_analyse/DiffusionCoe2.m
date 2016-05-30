% The programe is for DC of inner particle
% or I call it Sub-Diffusion
clc;clear all;close all;
ExpName='TestExp/exp4';
File=['J:/Granule/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
scale=Exp_info.scale(2);
clear Exp_info
%%
for iwind=1:length(wind)
    load([File 'ref/' num2str(wind(iwind)) '/SBtra.mat'],'DX','DY','extraP');
    MeanSqrSubD=zeros(extraP,fix(size(DX,2)*4/5));
    for ipar=1:extraP
        X=nonzeros(DX(ipar,:))';
        Y=nonzeros(DY(ipar,:))';
        timescale=round(length(X)*4/5);
        %%
        for DeltaT=1:timescale
            tempx=(X(DeltaT+1:1:end)-X(1:1:end-DeltaT))*scale;
            tempy=(Y(DeltaT+1:1:end)-Y(1:1:end-DeltaT))*scale;
            MeanSqrSubD(ipar,DeltaT)=mean(tempx.^2+tempy.^2);
        end
        clear X Y timescale
    end
    clear D*
    AvgSubMSD=zeros(1,size(MeanSqrSubD,2));
    iDeltaT=1;
    check_term=[0 0];
    while sum(check_term)==0
        AvgSubMSD(iDeltaT)=mean(nonzeros(MeanSqrSubD(:,iDeltaT)));
        check_term=[isempty(nonzeros(MeanSqrSubD(:,iDeltaT))) isequal(iDeltaT,length(AvgSubMSD))];
        iDeltaT=iDeltaT+1;
    end
    AvgSubMSD=nonzeros(AvgSubMSD)';
    save([File 'ref/' num2str(wind(iwind)) '/SBDiffusionCoe.mat'],'MeanSqrSubD','AvgSubMSD');
end

