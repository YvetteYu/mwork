% find moving particle in MSD
clc;clear all;close all;
exp='monomer_exp2';
wind='16';
stopframe=50*30;
limit=5;
uplimit=7;
load(['/Users/missyvetteyu/Dropbox/Exp/' exp '/ref/' wind '/DiffusionCOe.mat']);
%ind=find(MeanSqrDisr(stopframe,:)>limit)
ind=find(MeanSqrDisr(stopframe,:)>limit & MeanSqrDisr(stopframe,:)<uplimit)

