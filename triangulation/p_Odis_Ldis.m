% Plot the distribution of length(lattice line)
% x=Odis, y=Lids. Both of them are real scale.
clc;clear all;close all
FilePath='/Users/missyvetteyu/Desktop/temp/dimer/no_chains/';
Located='/Users/missyvetteyu/Dropbox/Exp/DataAnalyse/monomer/Ldis_Odis/';
wind=[11   13   14  15  16   17  19  21 23];
frame=[371 2701 301 481 1011 371 141 41 291];
figure('visible','off')
for file=1:length(wind)
str=num2str(wind(file));
load([FilePath 'triangular/LatticeLine/v' str '/' sprintf('%05d',frame(file)) '.mat'],'Odis','Ldis');

plot(Odis,Ldis,'b.','MarkerSize',8);
ylim([10 70]);
set(gca,'FontSize',22);
set(gca,'YTickLabel',{'10','20','30','40','50','60','70'})
title(['v' str],'fontsize',24,'fontweight','b');
xlabel('Distance from Original O(mm)','fontsize',20);
ylabel('Lattice Line Length(mm)','fontsize',20);

saveas(gcf,[Located str '.fig']);
print(gcf,'-dpng','-r200', [Located str '.png'])
clf
clear Odis Ldis
end