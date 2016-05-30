clc;clear all;close all;
ExpName='monomer_exp710';
File=['/Users/missyvetteyu/Dropbox/Exp/' ExpName '/'];
load([File 'ref/7/tra.mat'],'B*');
X=BX(1,:);
Y=BY(1,:);
clear B*
for t=1:length(X)
plot(X(t),Y(t),'ro','MarkerSize',5,'MarkerFaceColor','r')
hold on
end

daspect([1 1 1])
figure(2)
for t=1:length(X)
plot(4*X(t),4*Y(t),'bo','MarkerSize',5,'MarkerFaceColor','b')
hold on
end
daspect([1 1 1])