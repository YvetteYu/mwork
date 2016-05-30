% modufied time into interval time in Lindemannp.m 
clc;clear all;close all;
ExpName='dimer_exp7';
FilePath=['J:/Granule/' ExpName '/ref/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=Exp_info.wind;
scale=Exp_info.scale;

%%
for iwind=9:length(wind)
    
    load([FilePath num2str(wind(iwind)) '/NeastNeighbor.mat'],'NestNei');
    load([FilePath num2str(wind(iwind)) '/tra.mat'],'BX','BY');
    framenum=size(BX,1);
    timescale=framenum/2;
    lindpara=zeros(1,timescale);
    
    for DeltaT=1:timescale
        disX=(BX(DeltaT+1:1:end,:)-BX(1:1:end-DeltaT,:))*scale;
        disY=(BY(DeltaT+1:1:end,:)-BY(1:1:end-DeltaT,:))*scale;
            % 2014/11/20 add the scale
            % dis* is Ui(t)-Ui(0) 
            % the first row is  t=2 - t=1
            % the second row is t=3 - t=2
        index=NestNei(1:(end-DeltaT),:);
        NewdisX=myNewSort(disX,index);
        NewdisY=myNewSort(disY,index);
            % Newdis* is Uj(t)-Uj(0) 
        lindpara(DeltaT)=mean(mean((disX-NewdisX).^2+(disY-NewdisY).^2));
            % L^2= { [Ui(t)-Ui(0)] - [Uj(t)-Uj(0)] }^2
            %    = {     dis*      -     Newdis*   }^2
    end
    
    save([FilePath num2str(wind(iwind)) '/Lindemannp.mat'],'lindpara');
end
exit