% the program is already combined with FrameBoundary2.m
% pick up particles in the second layer
clc;clear all;close all;
ExpName='monomer_exp3';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
pnumber=Exp_info.pnumber;

iwind=17;
load([File 'ref\' num2str(wind(iwind)) '\BoundaryPar.mat'],'Bparticle');
neibfile=dir([File 'triangular\defect\' num2str(wind(iwind)) '\*.mat']);
%%
B2particle=zeros(length(neibfile),40);
for iframe=1:length(neibfile)
    load([File 'triangular\defect\' num2str(wind(iwind)) '\' ...
        neibfile(iframe).name],'neibor');
    tempBpar=nonzeros(Bparticle(iframe,:))';
    tempBpar2=nonzeros(unique(neibor(tempBpar,:)))';
     % tempBpar2 are particles which in first and second layers.
    tempBpar3=setdiff(tempBpar2,tempBpar);
    B2particle(iframe,1:length(tempBpar3))=tempBpar3;
    clear temp*
end  

