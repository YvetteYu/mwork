%for dimer. Plot trajectory with short time with lattice line and defect
clc;clear all;close all;
ExpName='dimer_exp1214';
Located=['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/color/'];
File = ['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
w=Exp_info.width; h=Exp_info.height;
wind='12';
frame=[1:30];
vol=((135-135)/5+1)*0.08+1.7;
load([File 'ref/' wind '/tra.mat'],'B*');
load([File 'ref/' wind '/Bdefect.mat'],'B1DF*');
load([File 'ref/' wind '/DefectNum.mat'],'defect5','defect7');
load([File 'ref/' wind '/pair.mat'],'index');
%%
figure('visible','off')
for iframe=1:length(frame)
   
     %% plot Lattice Line
    X=BX(frame(iframe),:);
    Y=BY(frame(iframe),:);
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',1,'Color',[180/255 180/255 180/255]);
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    hold on 
    %% plot the dimer chain
    for pair=1:50
    tempx=[BX(frame(iframe),index(1,pair)) BX(frame(iframe),index(2,pair))];
    tempy=[BY(frame(iframe),index(1,pair)) BY(frame(iframe),index(2,pair))];
    line(tempx,tempy,'Color',[1 0 0.3],'LineWidth',1);
    clear tempx tempy
    hold on
    end
   
    %% set innerDefects
    tempDF5=nonzeros( setdiff( defect5(frame(iframe),:),B1DF5(frame(iframe),:)))';
    tempDF7=nonzeros( setdiff( defect7(frame(iframe),:),B1DF7(frame(iframe),:)))';
    %% plot inner defects
    plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',8,'MarkerFaceColor',...
        [0.9 0.5 0],'MarkerEdgeColor',[0.9 0.5 0]); hold on
    plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',8,'MarkerFaceColor',...
        [0 0.5 0],'MarkerEdgeColor',[0 0.5 0]); hold on
    %% set axis
    set(gca,'YDir','reverse'); axis off;
    text(w*2/3,h-10,['vol=' num2str(vol)],'FontSize',20)
    print(gcf,'-dpng','-r100', [Located num2str(wind) '_' ...
        num2str(iframe) '.png']);
    %print(gcf,'-depsc','-tiff','-r100', [Located num2str(wind) ...
    %    '_' num2str(iframe) '.eps']);
    
    clf;
    
end
