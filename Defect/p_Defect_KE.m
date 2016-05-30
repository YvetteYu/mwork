% plot AC number - KE
clc; clear all; close all;
exp='dimer_exp9';
FilePath=['J:\Granule\' exp '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' exp '\Datanalysis\ACorre\'];
load([FilePath 'AvgDefect.mat'],'Exp_info');
%wind=Exp_info.wind;
wind=[80:10:120];
figure
for iwind=1:length(wind)
load([FilePath num2str(wind(iwind)) '\AvgAC.mat'],'AvgAC');
load([FilePath num2str(wind(iwind)) '\velocity.mat'],'Vx','Vy');
KE=mean(Vx.^2+Vy.^2,2);
clear V*
AvgAC(end)=[];
ind=find(KE>300);
AvgAC(ind)=[];
KE(ind)=[];
plot(KE,AvgAC,'.')

set(gca,'FontSize',20)
title('KE - Angle Correlation','fontsize',24,'fontweight','b');
xlabel('MSV (mm^2/s) ','fontsize',20);
ylabel('Angle Correlation ','fontsize',20);
saveas(gcf,[Located 'AC_KE_' num2str(wind(iwind)) '.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC_KE_' num2str(wind(iwind)) '.png']);
clf
clear ind KE AvgAC
end