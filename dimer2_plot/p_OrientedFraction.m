clc;clear all;close all;
ExpName='dimer_cooling';
File = ['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/'];
Located=[File 'Datanalysis/Accore/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
orientedimer=[7 14 7 10 12 20 8 11 5 17];
Pnumber=Exp_info.Pnumber;
ratio=orientedimer./Pnumber;

%%
tempAC=zeros(1,length(Pnumber));
for iwind=1:length(Pnumber)
    load([File 'ref/' num2str(Pnumber(iwind)) '/AvgAC.mat'],'AvgAC');
    tempAC(iwind)=mean(AvgAC(length(AvgAC)-100:end));
    clear AvgAC
end
rohn=Pnumber/100;
[hAx hdefect5 hAC]=plotyy(rohn,ratio,rohn,tempAC);



%plot(Pnumber,ratio,'o','MarkerFaceColor','b')
%plot(Pnumber,tempAC,'ro','MarkerFaceColor','r');