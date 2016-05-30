% modufied to remove the boundary particles in LindemannP2.m 
clc;clear all;close all;
ExpName='monomer_exp3';
FilePath=['J:/Granule/' ExpName '/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=Exp_info.wind;

for iwind=4:9%length(wind)
    
    load([FilePath 'ref/' num2str(wind(iwind)) '/NeastNeighbor.mat'],'NestNei');
    load([FilePath 'ref/' num2str(wind(iwind)) '/BoundaryPar.mat'],'B*particle');
    load([FilePath 'ref/' num2str(wind(iwind)) '/tra.mat'],'BX','BY');
    framenum=size(BX,1);
    timescale=framenum/2;
    InnerL=zeros(1,timescale);
    
    for DeltaT=1:timescale
        
        disX=(BX(DeltaT+1:1:end,:)-BX(1:1:end-DeltaT,:));
        disY=(BY(DeltaT+1:1:end,:)-BY(1:1:end-DeltaT,:));
            % dis* is Ui(t)-Ui(0) 
            % the first row is  t=2 - t=1
            % the second row is t=3 - t=2
        index=NestNei(1:(end-DeltaT),:);
         
        NewdisX=myNewSort(disX,index);
        NewdisY=myNewSort(disY,index);
            % Newdis* is Uj(t)-Uj(0)     
        tempL=(disX-NewdisX).^2+(disY-NewdisY).^2;
        [lindpara]=myNewRel(Bparticle,B2particle,tempL);
            % temp is (num of particle) x (interval frame number) 
        clear dis* Newdis* tempL
        InnerL(DeltaT)=mean(lindpara);
        
    end
    clear B* NestNei
    save([FilePath 'ref/' num2str(wind(iwind)) '/InnerLparameter.mat'],'InnerL');
end
