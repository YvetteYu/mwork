% modified the error which is corrected on 2014 6 18
% the AvgAC.mat were saved all the varies.
clc;close all;clear all;
ExpName='dimer_exp8';
File=['J:\Granule\' ExpName '\ref\'];
load(['J:\Granule\' ExpName '\ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;

for w=1:length(wind)
        load([File num2str(wind(w)) '\AvgAC.mat']);
        save([File num2str(wind(w)) '\AvgAC.mat'],'AvgAC');
end