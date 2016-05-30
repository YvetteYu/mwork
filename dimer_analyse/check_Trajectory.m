clc;clear all;close all;

ExpName='monomer_exp5';
ProcessFile = ['J:/Granule/' ExpName '/'];
wind='230';
fp=fopen([ProcessFile 'CM/' wind '/check_tra1.txt'],'w');
fname=dir([ProcessFile 'CM/' wind '/*mat']);
for iframe=1:length(fname)
    load([ProcessFile 'CM/' wind '/' fname(iframe).name],'X','Y');
    if length(X)~=100 || length(Y)~=100  
        fprintf(fp,'The X or Y is wrong when frame is %s\r\n',fname(iframe).name);
    end
    clear X Y ind*
end
fclose(fp);
