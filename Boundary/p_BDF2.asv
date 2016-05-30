% check whether the B1/2DF is coorect
% plot B1DF5/7 B2DF7
% the program is written on Augest 15 2014.
clc;clear all;close all;
ExpName='dimer_exp8';
FilePath=['J:\Granule\' ExpName '\'];
load([FilePath 'exp_parameter.mat'],'w','h')
load([FilePath 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
iwind=4;
load([FilePath 'ref\' num2str(wind(iwind)) '\Bdefect.mat']c);
load([FilePath 'ref\' num2str(wind(iwind)) '\tra.mat'],'BX','BY');
load([FilePath 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');

for frame=1:400:8000
    %% plot lattice line
    X=BX(frame,:);
    Y=BY(frame,:);
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',2,'Color',[180/255 180/255 180/255]);
    hold on
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    %% plot Defect
    tempDF5=nonzeros(defect5(frame,:));
    tempDF7=nonzeros(defect7(frame,:));
    plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',10,'MarkerFaceColor',...
        [0.9 0.5 0],'MarkerEdgeColor',[0.9 0.5 0]);hold on
    plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',10,'MarkerFaceColor',...
        [0 0.5 0],'MarkerEdgeColor',[0 0.5 0]);hold on
    %% plot 1th and 2th layer BDF
    tempB1DF5=nonzeros(B1DF5(frame,:))';
    tempB1DF7=nonzeros(B1DF7(frame,:))';
    tempB2DF5=nonzeros(B2DF5(frame,:))';
    tempB2DF7=nonzeros(B2DF7(frame,:))';
    plot(X(tempB1DF5),Y(tempB1DF5),'kx','MarkerSize',8,'LineWidth',2);hold on;
    plot(X(tempB1DF7),Y(tempB1DF7),'k^','MarkerSize',8,'LineWidth',2);hold on;
    plot(X(tempB2DF5),Y(tempB2DF5),'rx','MarkerSize',8,'LineWidth',2);hold on;
    plot(X(tempB2DF7),Y(tempB2DF7),'r^','MarkerSize',8,'LineWidth',2);
    print(gcf,'-dpng','-r100',[FilePath 'temp\' num2str(frame) '.png']);
    clf
    clear temp* X Y
end