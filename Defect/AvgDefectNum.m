% Avgerage th5+th7 of total frame
clc;clear all;close all;
File='J:\Granule\dimer_exp6\ref\';
Exp_info=struct('particle','dimer',...
                'ExpTime','exp6',...
                'pnumber',100,...
                'wind',[135:5:230],...
                'data_info','AvgDefect=mean(th5+th7)');

str=135:5:230;
AvgDefect=zeros(1,length(str));
for wind=1:length(str)
    load([File num2str(str(wind)) '\DefectNum.mat'],'th*');
    AvgDefect(wind)=mean(th5+th7);
    clear th*
end
save([File 'AvgDefect.mat'],'Exp_info','AvgDefect');