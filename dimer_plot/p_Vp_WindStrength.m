clc;clear all;close all;
ExpName='monomer_exp11';
File = ['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\GoogleDrive\Exp\' ExpName '\Datanalysis\MSV\'];

%%
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
KEavg=zeros(1,length(wind));
for iwind=1:length(wind)
load([File num2str(wind(iwind)) '/velocity.mat'],'MSV*');
KEavg(iwind)=mean(MSVx+MSVy);
end

%%
open([Located 'MSV_wind.fig']);
hold on
plot(wind,KEavg,'--b^','LineWidth',2,'MarkerEdgeColor','k','MarkerSize',8);
box on
set(gca,'FontSize',18);
xlabel('wind strength','fontsize',20);
ylabel('< V^2 > ( mm/s )^2','fontsize',20);
%saveas(gcf,[Located 'MSV_wind.fig']);
print(gcf,'-dpng', '-r200', [Located 'MSV_wind2.png']);
 
