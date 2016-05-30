% I set the wrong size of 'acorre' in angle_correlation2.m in line 43
% This program the varible 'acorre' in the mat files.
clc;close all;clear all;
exp='dimer_exp3';
File=['J:\Granule\' exp '\triangular\AngleCorrelation\'];
load(['J:\Granule\' exp '\ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;

for w=1:length(wind)
    fileAccore=dir([File num2str(wind(w)) '\*.mat']);
    for frame=1:length(fileAccore)
        load([File num2str(wind(w)) '\' fileAccore(frame).name],'acorre','Avgacorre');
        acorre(:,11:end)=[];
        save([File num2str(wind(w)) '\' fileAccore(frame).name],'acorre','Avgacorre');
    end
end