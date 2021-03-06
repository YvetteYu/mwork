clc;clear all;close all;
ExpName='dimer_exp11';
frame=1200*30;
File=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\'];
load([Located 'exp_parameter1.mat'],'scale','w','h');
wind=120;
load([File num2str(wind) '\tra.mat'],'BX','BY');
load([File num2str(wind) '\inf_orientation.mat'],'theta');
load([File num2str(wind) '\pair.mat'],'index');
%%
X=BX(frame,:); Y=BY(frame,:);
angle=theta(frame,:);
clear B* theta

[index]=myNewIndex(index,X,Y);
Xhead=X(index(1,:)); Yhead=Y(index(1,:));
Xtail=Xhead-cos(angle)*14/scale;
if angle>0
    Ytail=Yhead+sin(angle)*14/scale;
else
    Ytail=Yhead-sin(angle)*14/scale;
end
Ytail2=Y(index(2,:));Xtail2=X(index(2,:));

figure
for dimer=1:length(Xhead)
    plot([Xhead(dimer) Xtail(dimer)],[Yhead(dimer) Ytail(dimer)],...
        'b-','LineWidth',2);
    hold on
    plot([Xhead(dimer) Xtail2(dimer)],[Yhead(dimer) Ytail2(dimer)],...
        'r--');
    hold on
    plot(Xhead(dimer),Yhead(dimer),'go','MarkerFaceColor','g')
    hold on
end
set(gca,'YDir','reverse','xlim',[0 w],'ylim',[0 h]);
daspect([1 1 1]);
print(gcf,'-dpng','-r200',[Located 'Datanalysis\' num2str(wind) '_' num2str(frame) '.png']);