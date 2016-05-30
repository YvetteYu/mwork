% In content AneleCorrelation, I have dimer's every neibors value of AC(acorre) 
% and the average AC of the neibors(Avgacorre) in each mat file(= each frame)
% Now through this program, I'll get the avgerage AC of 50 dimers(AvgAC) 
% in each frame. And the data will be save in /ref/AvgAC.mat
clc; clear all; close all;
ExpName='dimer_exp6';
FilePath=['J:/Granule/' ExpName '/triangular/AngleCorrelation/'];
RefFile=['J:/Granule/' ExpName '/ref/'];
load([RefFile 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;

for iwind=1:length(wind)
    file=dir([FilePath num2str(wind(iwind)) '/*mat']);
    AvgAC=zeros(1,length(file));
    for frame=1:length(file)
        load([FilePath num2str(wind(iwind)) '/' file(frame).name],'Avgacorre')
        AvgAC(frame)=mean(Avgacorre);
    end
    save([RefFile  num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');
    clear AvgAC
end