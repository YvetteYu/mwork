clc;clear all;close all;
ExpName='monomer_exp5';
fp=fopen(['J:\Granule\' ExpName '\CM\movefile.txt'],'w');
load(['J:\Granule\' ExpName '\exp_parameter_old.mat'],'Exp_info');
wind=Exp_info.wind;
%%
frame=0;
for iwind=1:length(wind)
     for iframe=1:4500
         frame=iframe+4500*(iwind-1);
         fprintf(fp,'move "%05d.mat" ..\\%d\\\r\n',frame,wind(iwind));
     end
end
fclose(fp);