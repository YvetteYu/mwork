clc;clear all;close all;
FilePath='J:\Granule\dimer_exp3\';
load([FilePath  'ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;

for iwind=1:length(wind)
     expnum=num2str(wind(iwind));
     load([FilePath 'ref\' expnum '\tra.mat'],'B*');
     BX(18001,:)=[];
     BY(18001,:)=[];
     save([FilePath 'ref\' expnum '\tra.mat'],'B*');
     clear B*
end