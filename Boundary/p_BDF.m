clc;clear all;close all;
ExpName='dimer_exp7';
File=['J:\Granule\' ExpName '\'];
load([File 'exp_parameter.mat'],'w','h')
load([File '\ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
framerate=30;
interval=3;
figure('visible','off')
for iwind=1:length(wind)
    
    load([File 'ref\' num2str(wind(iwind)) '\tra.mat'],'BX','BY');
    load([File 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'Boundefect');
    load([File 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');
    
    for frame=1:interval:size(BX,1)
        %% plot Lattice Line
        X=BX(frame,:);
        Y=BY(frame,:);
        dt = DelaunayTri(X',Y');
        triplot(dt,'LineStyle','-','LineWidth',2,'Color',[180/255 180/255 180/255]);
        hold on
        
        text(1,1,'.');
        hold on
        daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
        
        %% plot Defects
        tempDF5=nonzeros(defect5(frame,:));
        
        plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',10,'MarkerFaceColor',[0.9 0.5 0],...
            'MarkerEdgeColor',[0.9 0.5 0]);
        hold on
        tempDF7=nonzeros(defect7(frame,:));
        
        plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',10,'MarkerFaceColor',[0 0.5 0]...
            ,'MarkerEdgeColor',[0 0.5 0]);
        %% plot BDF
        BDF=nonzeros(Boundefect(frame,:))';
        hold on
        plot(X(BDF),Y(BDF),'kx','MarkerSize',8,'LineWidth',2)
        %% 
        set(gca,'YDir','reverse');
        time=sprintf('%2.3f',(frame-1)/framerate);
        set(gca,'YDir','reverse');
        text(w-40,h-10,time,'FontSize',14);
        imgnum=(frame-1)/interval+1;
        imgname=sprintf('%05d',imgnum);
        print(gcf,'-dpng','-r100',[File 'triangular\BoundaryPic\' ...
            num2str(wind(iwind)) '\' imgname '.png']);
        clf
    end
end
exit;