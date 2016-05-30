% plot single pics
clc;clear all;close all;
ExpName='monomer_exp11';
File=['/Users/missyvetteyu/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info')
wind='185';
w=Exp_info.width; h=Exp_info.height;
framerate=30;
interval=3;
figure('visible','off')

load([File 'ref/' wind '/tra.mat'],'BX','BY');
load([File 'ref/' wind '/Bdefect.mat'],'B1DF*');
load([File 'ref/' wind '/DefectNum.mat'],'defect5','defect7');
frame=[76.4 112.7]*framerate;
%%
for iframe=1:length(frame)
    %% plot Lattice Line
    X=BX(frame(iframe),:);
    Y=BY(frame(iframe),:);
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',1,'Color',[180/255 180/255 180/255]);
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    hold on
    %% plot Defects
    tempDF5=nonzeros( setdiff( defect5(frame(iframe),:),B1DF5(frame(iframe),:)))';
    tempDF7=nonzeros( setdiff( defect7(frame(iframe),:),B1DF7(frame(iframe),:)))';
    
    plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',10,'MarkerFaceColor',[0.9 0.5 0],...
        'MarkerEdgeColor',[0.9 0.5 0]); hold on
    plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',10,'MarkerFaceColor',[0 0.5 0]...
        ,'MarkerEdgeColor',[0 0.5 0]); hold on
    
    %%
    set(gca,'YDir','reverse');axis off;
    print(gcf,'-dpng','-r100',['/Users/missyvetteyu/GoogleDrive/thesis/'...
        'pic/Ch3/monomer/sub_crystal/' wind '_' num2str(iframe) '.png']);
    print(gcf,'-depsc','-tiff','-r100', ['/Users/missyvetteyu/GoogleDrive/thesis/'...
        'pic/Ch3/monomer/sub_crystal/' wind '_' num2str(iframe) '.eps']);
    clf
end

