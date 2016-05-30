clc;clear all;close all;
ExpName='monomer_exp11';
FilePath=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\GoogleDrive\HexagonBoundary\' ExpName '\ref\'];
load([Located 'exp_parameter.mat'],'Exp_info');
filename='inf_orientation.mat';
wind=Exp_info.wind;
fp=fopen([FilePath 'rmfile.txt'],'w');
for t=1:length(wind)
    placeA=[num2str(wind(t)) '\' ];
    placeB=[Located num2str(wind(t)) '\'];
    fprintf(fp,'cd %s\r\n',placeA);
   % fprintf(fp,'del %s\r\n',filename);
    fprintf(fp,'copy %s %s\r\n',filename,placeB);
    fprintf(fp,'cd ..\r\n');
end
fclose(fp)

