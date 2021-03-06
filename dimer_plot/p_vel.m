clc;close all;clear all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/Exp/' ExpName '/Pic/'];
File = ['J:/Granule/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
Zx=zeros(40,40);
Zy=zeros(40,40);
%%
figure('visible','off')
for iwind=9:length(wind)
[Y X velx]=textread([File 'PVelocity/' num2str(wind(iwind)) '/velx.txt'],'%f %f %f');
[Y X vely]=textread([File 'PVelocity/' num2str(wind(iwind)) '/vely.txt'],'%f %f %f');
clear X Y
for t=1:40
    Zx(t,:)=velx((t-1)*40+1:t*40);
    Zy(t,:)=vely((t-1)*40+1:t*40);
end
subplot(2,1,1)
surf(Zx)
set(gca,'ZLim',[-20 20]);
subplot(2,1,2)
surf(Zy)
set(gca,'ZLim',[-20 20]);
print(gcf,'-dpng', '-r200', [Located num2str(wind(iwind)) '.png']);
clf
end