% output specific frame of  bond angle distribution figure by color
clc;close all;clear all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/'];
wind='235';
vol=((235-140)/5-1)*0.08+2.3;
addtime=0;
%startime=[1];
%frame=myRange(startime*30,1);
frame=[6000];
%%
Located=['/Users/yvette/GoogleDrive/thesis/pic/Ch3/dimer/color/'];
%fp=fopen([Located wind '.txt'],'w');
load([File 'ref/exp_parameter.mat'],'Exp_info');
pairnum=120/2;
%pairnum=Exp_info.Pnumber/2;
Center=Exp_info.BCenter;
Radius=Exp_info.BRadius;
load([File 'ref/' wind '/inf_orientation.mat'],'S','theta')
load([File 'ref/' wind '/tra.mat'],'BX','BY');
load([File 'ref/' wind '/pair.mat'],'index');
load([File 'ref/' wind '/fixpoint.mat'],'fixX','fixY');
figure%('visible','off')
%%
for iframe=1:length(frame) 
    myHexagonBoun(Center(1),Center(2),Radius);
    %myCircularBoun(Center(1),Center(2),Radius);
    tempframe=frame(iframe);
    %fprintf(fp,['frame = ' num2str(tempframe) ...
    %             ', S=' num2str(S(tempframe)) '/r/n']);
            
    %% plot dimers
    for pair=1:pairnum

        tempx=[BX(tempframe,index(1,pair)) BX(tempframe,index(2,pair))];
        tempy=[BY(tempframe,index(1,pair)) BY(tempframe,index(2,pair))];
        Oangle=theta(tempframe,pair);
        [Tangle]=myarc2degree(Oangle);
        [Rcolor Gcolor Bcolor]=myangle2color(Tangle);
        clear *angle
        plot(tempx(1),tempy(1),...
            'Marker','o','MarkerSize',10,...
            'Color',[Rcolor Gcolor Bcolor],...
            'MarkerFaceColor',[Rcolor Gcolor Bcolor]);
        hold on
        line(tempx,tempy,'Color',0.6*ones(1,3),'LineWidth',2);
        hold on
        plot(tempx(2),tempy(2),...
            'Marker','o','MarkerSize',10,...
            'Color',[Rcolor Gcolor Bcolor],...
            'MarkerFaceColor',[Rcolor Gcolor Bcolor]);
        hold on
    end
    
%% plot fix points    

[fixX fixY]=ginput(7);
    for ifix=1:7
        plot(fixX(ifix),fixY(ifix),'Marker','o','MarkerSize',10,...
            'Color','k','MarkerFaceColor','k');
        hold on
    end
    pause
  
%% write avgerage S on textfile    
    if rem(iframe,11)==0 
        avgS=mean(S(tempframe-10:tempframe));
        stdS=std(S(tempframe-10:tempframe));
        fprintf(fp,['AvgS= ' num2str(avgS) '  StdS= ' num2str(stdS) '/r/n'...
            '---------------------------------------/r/n']);
    end
    %}
%% set axis
    h=Exp_info.height; w=Exp_info.width;
    daspect([1 1 1]); axis off
    set(gca,'YDir','reverse','xlim',[0 w],'ylim',[0 h]);
    time=sprintf('%3.2f',tempframe/30+addtime);
    text(25,h-5,['t=' time ' s'],'FontSize',20);
    text(w/2-35,h-5,['vol=' num2str(vol)],'FontSize',20);
    text(w*3/4-5,h-5,['S=' num2str(S(tempframe),'%0.2f')],'FontSize',20)
    print(gcf,'-depsc','-tiff','-r150', [Located wind '_' num2str(tempframe) '.eps']);
    print(gcf,'-dpng','-r100',[Located wind '_'  num2str(tempframe) '.png']);
    clf
    %}
end
