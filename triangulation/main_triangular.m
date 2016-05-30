clc; clear all; close all;
ExpName='monomer_exp11';
File =['J:\Granule\' ExpName '\'];
framerate=30;
interval=3;
load([File 'ref\exp_parameter.mat'],'Exp_info')
wind=Exp_info.wind;
w=Exp_info.width; h=Exp_info.height;
%%
for iwind=8:2:length(wind)
    file=num2str(wind(iwind));
    load([File '\ref\' file '\tra.mat']);
    for nowframe=1:interval:size(BX,1)
       myTriangulation(BX(nowframe,:),BY(nowframe,:),nowframe,framerate,...
            file, Exp_info.Pnumber, File, interval, w, h);
    end      
end
exit;