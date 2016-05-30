% The program is written on Aug.28 2014
% for the new 'Bdefect.mat' whose variables are B*DF*
% the p_BDF is for old Bdefect.mat
clc;clear all;close all;
ExpName='monomer_exp710';
File=['/Users/missyvetteyu/GoogleDrive/HexagonBoundary/' ExpName '/'];
load([File 'ref/exp_parameter.mat'],'Exp_info')
wind=Exp_info.Number;
w=Exp_info.width; h=Exp_info.height;
framerate=30;
interval=3;
figure('visible','off')
for iwind=1:length(wind)
    
    load([File 'ref\' num2str(wind(iwind)) '\tra.mat'],'BX','BY');
    load([File 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'B*DF*');
    load([File 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');
    for iframe=1:interval:size(BX,1)
        %% plot Lattice Line
        X=BX(iframe,:);
        Y=BY(iframe,:);
        dt = DelaunayTri(X',Y');
        triplot(dt,'LineStyle','-','LineWidth',2,'Color',[180/255 180/255 180/255]);
        daspect([1 1 1]);xlim([0 w]);ylim([0 h]);
        hold on
        %% plot Defects
        tempDF5=nonzeros(defect5(iframe,:)); 
        plot(X(tempDF5),Y(tempDF5),'o','MarkerSize',10,'MarkerFaceColor',[0.9 0.5 0],...
            'MarkerEdgeColor',[0.9 0.5 0]); hold on
        tempDF7=nonzeros(defect7(iframe,:));
        plot(X(tempDF7),Y(tempDF7),'^','MarkerSize',10,'MarkerFaceColor',[0 0.5 0]...
            ,'MarkerEdgeColor',[0 0.5 0]); hold on
        
        %% plot BDF
        BDF=nonzeros([B1DF5(iframe,:) B1DF7(iframe,:) B2DF5(iframe,:) B2DF7(iframe,:)])';
        plot(X(BDF),Y(BDF),'kx','MarkerSize',8,'LineWidth',2)
        %% 
        set(gca,'YDir','reverse','XTick',[],'YTick',[],'TickLength',[0 0]);
        time=sprintf('%2.3f',(iframe-1)/framerate);
        text(w-40,h-10,time,'FontSize',14);
        imgnum=(iframe-1)/interval+1;
        imgname=sprintf('%05d',imgnum);
        print(gcf,'-dpng','-r100',[File 'triangular\BoundaryPic\' ...
            num2str(wind(iwind)) '\' imgname '.png']);
        clf
    end
end
%exit;