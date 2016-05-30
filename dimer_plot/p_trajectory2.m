% For monomer. Plot trajectory with short time with lattice line and defect
clc;clear all;close all;
ExpName='monomer_exp11';
Located=['C:/Users/user/GoogleDrive/oral/pic/monomer/trajectory/'];
File = ['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
w=Exp_info.width; h=Exp_info.height;
vol=((185-140)/5-1)*0.08+2.3;
wind='185';
addtime=0;
startime=[74:0.1:76];  % unit is second
delaytime=5; % unit is second
frame=fix(startime*30);
load([File 'ref/' wind '/tra.mat'],'B*');
load([File 'ref/' wind '/Bdefect.mat'],'B1DF*');
load([File 'ref/' wind '/DefectNum.mat'],'defect5','defect7');
%%
figure%('visible','off')
for iframe=1:length(frame)
   
     %% plot Lattice Line
    X=BX(frame(iframe),:);
    Y=BY(frame(iframe),:);
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',1,'Color',[180/255 180/255 180/255]);
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    hold on 
    %% set trajectory
    traX=BX((frame(iframe)-delaytime*30):frame(iframe),:);
    traY=BY((frame(iframe)-delaytime*30):frame(iframe),:);
    %% plot trajectory
    plot(traX,traY,'k','LineWidth',1)
    %% set innerDefects
    tempDF5=nonzeros( setdiff( defect5(frame(iframe),:),B1DF5(frame(iframe),:)))';
    tempDF7=nonzeros( setdiff( defect7(frame(iframe),:),B1DF7(frame(iframe),:)))';
    %% plot inner defects
    plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',5,'MarkerFaceColor',...
        [0.9 0.5 0],'MarkerEdgeColor',[0.9 0.5 0]); hold on
    plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',5,'MarkerFaceColor',...
        [0 0.5 0],'MarkerEdgeColor',[0 0.5 0]); hold on
    %% set axis
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 10 10]);
    set(gca,'YDir','reverse'); axis off;
    text(80,h-10,[num2str(startime(iframe)+addtime) 's'],'FontSize',14);
    %text(80,h-10,[num2str(startime(iframe)+addtime) 's-' ...
    %    num2str(startime(iframe)+delaytime+addtime) 's'],'FontSize',20)
    text(w*2/3,h-10,['vol=' num2str(vol)],'FontSize',14);
    
    print(gcf,'-dpng','-r200', [Located num2str(wind) ...
        '/' num2str(320+iframe,'%05d') '.png']);
    %print(gcf,'-depsc','-tiff','-r200', [Located num2str(wind) ...
    %    '/' num2str(delaytime) 's_' num2str(iframe) '.eps']);
    
    clf;
        %}
end
