clc;clear all;close all;
ExpName='monomer_exp11';
load(['J:\Granule\' ExpName '\ref\exp_parameter2.mat'],'Exp_info');
ImgFile=['J:\Granule\OriginalData\' ExpName '\pic\temp\00001.png'];
load(['J:\Granule\' ExpName '\CM\temp\00001.mat' ],'X','Y');
Located=['J:\Granule\OriginalData\' ExpName '\pic\temp\'];
%%
myTriangulation(X,Y,ImgFile,1,30,Exp_info.Pnumber,Located);