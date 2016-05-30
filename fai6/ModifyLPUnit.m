% modufied the length unit of Lindemann Parameter
clc;clear all;close all;
ExpName='monomer_exp3';
FilePath=['J:/Granule/' ExpName '/'];
load([FilePath 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
for iwind=1:length(wind)
    load([FilePath 'ref/' num2str(wind(iwind)) '/Lindemannp.mat'],'lindpara');
    lindpara=lindpara*Exp_info.scale;
    description=struct('variable1',...
    ['[lindpara] is 1x(time interval) array. It recorded relative'...
    'displacement of the nrighbors varies with different time interval'....
    'The unit of relative displacement is (mm)']);
save([FilePath 'ref/' num2str(wind(iwind)) '/Lindemannp.mat'],'-append','description');
end