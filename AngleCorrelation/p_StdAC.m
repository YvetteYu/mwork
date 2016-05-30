%clc; clear all; close all;
AC_std=zeros(1,5);
for iexp=4
    ExpName=['TestExp/exp' num2str(iexp+2)];
    File=['J:/Granule/' ExpName '/ref/'];
    load([File 'exp_parameter.mat'],'Exp_info');
    wind=Exp_info.wind;
    
   for iwind=1:5%length(wind)
        load([File num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
        AC_std(1,iwind)=std(AvgAC);
    end
    
end