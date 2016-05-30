clc;clear all;close all;
ExpName='dimer_exp19';
File = ['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
time=zeros(1,length(wind));
for iwind=1:length(wind)
    load([File 'ref/' num2str(wind(iwind)) '/tra.mat'],'B*');
    frame=size(BX,1);
    if iwind==1
     time(iwind)=frame/30;
    else
    time(iwind)=time(iwind-1)+frame/30;
    end
end