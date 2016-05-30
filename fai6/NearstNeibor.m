clc;clear all;close all;
ExpName='monomer_exp6';
FilePath=['J:/Granule/' ExpName '/'];
load([FilePath 'ref/exp_parameter.mat'],'Exp_info');
pnumber=Exp_info.Pnumber;
wind=1%Exp_info.wind;
%%
for iwind=1:length(wind)
    %pnumber=Exp_info.Pnumber(iwind);
    load([FilePath 'ref/' num2str(wind(iwind)) '/tra.mat'],'BX','BY');
    framenum=size(BX,1);
    load([FilePath 'ref/' num2str(wind(iwind)) '/NeastNeighbor.mat'],'NestNei');
    %NestNei=zeros(framenum,pnumber);
    for iframe=1:framenum
        filename=sprintf('%05d.mat',iframe);
        load([FilePath 'triangular/defect/' num2str(wind(iwind)) '/' filename],'neibor');
        X=BX(1,:);Y=BY(1,:);
        for ipar=1:pnumber
            neighbor=nonzeros(neibor(ipar,:))';
            [ind]=myNearestNeighbor(X,Y,ipar,neighbor);
            NestNei(iframe,ipar)=ind;         
        end
    end
    save([FilePath 'ref/' num2str(wind(iwind)) '/NeastNeighbor2.mat'],'NestNei');
end
