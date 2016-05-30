% plot <v^2> vesus time
clc;clear all;close all;
ExpName='dimer_cooling';
File = ['/Users/yvette/GoogleDrive/Data/' ExpName '/'];
Located=[File 'Datanalysis/MSV/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
span=5;
figure('visible','off')
%%
for iwind=1:length(wind)
    
    load([File 'ref/' num2str(wind(iwind)) '/velocity.mat'],'MSV*');
    tempMSV=(MSVx+MSVy)/14^2;
    if iwind==5 
        tempMSV(tempMSV>0.8)=[];
    elseif iwind==6
        tempMSV(tempMSV>1)=[];
    end
    tempMSV=smooth(tempMSV,span);
    time=(0:length(tempMSV)-1)/30;
    plot(time,tempMSV);
    print(gcf,'-dpng', '-r100', [Located num2str(wind(iwind),'%04d') '.png']);
    clf
end

