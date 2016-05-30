%for dimer. Plot trajectory with short time with lattice line and defect
clc;clear all;close all;
ExpName='dimer_exp19';
Located=['C:/Users/user/GoogleDrive/oral/pic/dimer/trajectory/'];
File = ['C:/Users/user/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info');
w=Exp_info.width; h=Exp_info.height;
vol=((265-140)/5-1)*0.08+2.3;
wind='265';
addtime=0;
startime=[61:0.1:66];  % unit is second
delaytime=3; % unit is second
frame=fix(startime*30);
%%
%targetp=sort([47 17 20 23 21 30]);

%%
load([File 'ref/' wind '/tra.mat'],'B*');
load([File 'ref/' wind '/fixpoint.mat'],'fixX','fixY');
load([File 'ref/' wind '/Bdefect.mat'],'B1DF*');
load([File 'ref/' wind '/DefectNum.mat'],'defect5','defect7');
load([File 'ref/' wind '/pair.mat'],'index');
%%
figure('visible','off')
for iframe=1:length(frame)
    %i=1;
    %% plot Lattice Line
    X=[BX(frame(iframe),:) fixX'];
    Y=[BY(frame(iframe),:) fixY'];
    dt = DelaunayTri(X',Y');
    triplot(dt,'LineStyle','-','LineWidth',1,'Color',[180/255 180/255 180/255]);
    daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
    hold on
    %% plot the dimer chain 
    for pair=1:60 
      %{  
       if i<7
            if pair==targetp(i)
                icolor=[0.3 0 1];
                lw=3;
                i=i+1;
            else
                icolor=[1 0 0.3];
                lw=1;
            end
        else
            icolor=[1 0 0.3];
            lw=1;
        end
        %}
        tempx=[BX(frame(iframe),index(1,pair)) BX(frame(iframe),index(2,pair))];
        tempy=[BY(frame(iframe),index(1,pair)) BY(frame(iframe),index(2,pair))];
        line(tempx,tempy,'Color',[1 0 0.3],'LineWidth',1);
        clear tempx tempy
        hold on
    end
    %%
    %{
    for i=1:7
    plot(fixX(i),fixY(i),'Marker','o','MarkerSize',8,'Color',[0 0.6 1],...
        'MarkerFaceColor',[0 0.6 1]);
    hold on
    end
    %}
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
    %% set axis
    set(gcf,'Paperunits','centimeters','PaperPosition',[0 0 10 10]);
    set(gca,'YDir','reverse'); axis off;
    %pause
    text(80,h-10,[num2str(startime(iframe)+addtime) 's'],'FontSize',14)
    text(w*2/3,h-10,['vol=' num2str(vol)],'FontSize',14)
    
    print(gcf,'-dpng','-r200', [Located wind...
        '/' num2str(iframe,'%05d') '.png']);
    %print(gcf,'-depsc','-tiff','-r100', [Located num2str(wind) ...
    %    '/' num2str(delaytime) 's_' num2str(startime(iframe)) '.eps']);
    
    clf;
    
end
