% 99% is same with version 1, the only different is v1 use X,Y,
% and v2 use BX, BY
clc;clear all;close all;
ExpName='TestExp/exp6';
ProcessFile = ['J:\Granule\' ExpName '\'];
load([ProcessFile 'ref\exp_parameter.mat'],'Exp_info');
list=Exp_info.wind;
for n=1:length(list)
str=num2str(list(n));
fp=fopen([ProcessFile 'ref\' str '\check_tra.txt'],'w');
load([ProcessFile 'ref\' str '\tra.mat']);
for frame=1:size(BX,1)
    indx=find(BX(frame,:)==0);
    indy=find(BY(frame,:)==0);
    nanx=sum(isnan(BX(frame,:)));
    nany=sum(isnan(BY(frame,:)));
    if isempty(indx)~=1 || isempty(indy)~=1  
        fprintf(fp,'The BX or BY is wrong when frame is %d \r\n',frame);
    end
    if nanx~=0 || nany~=0  
        fprintf(fp,'The BX or BY is NaN when frame is %d \r\n',frame);
    end
    clear ind*
    nanx=0;nany=0;
end
clear B*
fclose(fp);
end
