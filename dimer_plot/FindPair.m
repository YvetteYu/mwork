%for dimer. Plot trajectory with short time with lattice line and defect
clc;clear all;close all;
ExpName='dimer_exp19';
File = ['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
w=Exp_info.width; h=Exp_info.height;
wind='200';
addtime=0;
startime=85;
delaytime=8; % unit is second
frame=fix(startime*30);
%%


%%
load([File 'ref/' wind '/tra.mat'],'B*');
load([File 'ref/' wind '/fixpoint.mat'],'fixX','fixY');
load([File 'ref/' wind '/Bdefect.mat'],'B1DF*');
load([File 'ref/' wind '/DefectNum.mat'],'defect5','defect7');
load([File 'ref/' wind '/pair.mat'],'index');
%%
figure
   iframe=1
     %% plot Lattice Line
    X=[BX(frame(iframe),:) fixX'];
    Y=[BY(frame(iframe),:) fixY'];
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',1,'Color',[180/255 180/255 180/255]);
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    hold on 
    %% plot the dimer chain
    for pair=1:60
    tempx=[BX(frame(iframe),index(1,pair)) BX(frame(iframe),index(2,pair))];
    tempy=[BY(frame(iframe),index(1,pair)) BY(frame(iframe),index(2,pair))];
    line(tempx,tempy,'Color',[1 0 0.3],'LineWidth',1);
    clear tempx tempy
    hold on
    end
    %% set trajectory
    traX=BX((frame(iframe)-delaytime*30):frame(iframe),:);
    traY=BY((frame(iframe)-delaytime*30):frame(iframe),:);
    %% plot trajectory
    plot(traX,traY,'k','LineWidth',1)
    clear traX traY
    %% set innerDefects
    tempDF5=nonzeros( setdiff( defect5(frame(iframe),:),B1DF5(frame(iframe),:)))';
    tempDF7=nonzeros( setdiff( defect7(frame(iframe),:),B1DF7(frame(iframe),:)))';
    %% plot inner defects
    plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',5,'MarkerFaceColor',...
        [0.9 0.5 0],'MarkerEdgeColor',[0.9 0.5 0]); hold on
    plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',5,'MarkerFaceColor',...
        [0 0.5 0],'MarkerEdgeColor',[0 0.5 0]); hold on
    set(gca,'YDir','reverse'); axis off;
a=6;
[targetX targetY]=ginput(a);
targetp=zeros(1,a);
for i=1:a
[value tempair]=min(mydistance(targetX(i),targetY(i),X,Y));
[temp targetp(i)]=find(index(:,:)==tempair);
end