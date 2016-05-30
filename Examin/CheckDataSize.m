clc; clear all; close all;
FilePath='J:\Granule\dimer_exp3\';
load([FilePath  'ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
fp=fopen([FilePath 'ref\CheckDataSize.txt'],'w');

for iwind=1:length(wind)
    expnum=num2str(wind(iwind));
    triFile=dir([FilePath 'triangular\LatticeLine\' expnum '\*mat']);
    load([FilePath 'ref\' expnum '\tra.mat'],'BX');
    if length(triFile)~=size(BX,1)
        fprintf(fp,['The wind is %s\r\n'...
            'length of tri is %d, length of BX is %d\r\n'],...
            expnum,length(triFile),size(BX,1));
    end
end
fclose(fp)