clc;clear all;close all;
ExpName='monomer_exp3';
FilePath=['J:/Granule/' ExpName '/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=Exp_info.wind;

for iwind=1:length(wind)
    
    load([FilePath 'ref/' num2str(wind(iwind)) '/NeastNeighbor.mat'],'NestNei');
    load([FilePath 'ref/' num2str(wind(iwind)) '/tra.mat'],'BX','BY');
    framenum=size(BX,1);
    lindpara=zeros(1,framenum);
    
    X=BX(1,:); Y=BY(1,:);
    nearest=NestNei(1,:);
    [secondterm]=myMeanSqrDisp(X,X(nearest),Y,Y(nearest));
    u0x=X-X(nearest); u0y=Y-Y(nearest);
    
    for iframe=2:framenum
        
        X=BX(iframe,:); Y=BY(iframe,:);
        nearest=NestNei(iframe,:);
        [firsterm]=myMeanSqrDisp(X,X(nearest),Y,Y(nearest));
        
        dotvalue=sum([(X-X(nearest))' (Y-Y(nearest))'].*[u0x' u0y'],2);
        % 100 X 1 dot value
        thirdterm=(-2)*mean(dotvalue);
        lindpara(iframe)=firsterm+secondterm+thirdterm;
        
    end
    save([FilePath 'ref/' num2str(wind(iwind)) '/Lindemannp.mat'],'lindpara');
end
