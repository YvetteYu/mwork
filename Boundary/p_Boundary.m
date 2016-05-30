clc;clear all;close all;
ExpName='monomer_exp3';
ProcessFile=['J:\Granule\' ExpName '\'];
load([ProcessFile 'exp_parameter.mat'],'w','h')
load([ProcessFile 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
%figure('visible','off')
for file=1:1%length(wind)
    load([ProcessFile 'ref\' num2str(wind(file)) '\tra.mat'],'BX','BY');
    load([ProcessFile 'ref\' num2str(wind(file)) '\BoundaryPar.mat'],...
        'Bparticle','B2particle');
    
    for k=1:1%size(Bparticle,1)
        frame=1+(k-1)*300;
        X=BX(frame,:);
        Y=BY(frame,:);
        dt= DelaunayTri(X',Y');
        triplot(dt)
        hold on
        Btemp=nonzeros(Bparticle(k,:))';
        plot(X(Btemp),Y(Btemp),'ro','MarkerFaceColor','r')
        hold on 
        Btemp=nonzeros(B2particle(k,:))';
        plot(X(Btemp),Y(Btemp),'go','MarkerFaceColor','b')
        set(gca,'xlim',[0 w],'ylim',[0 h]);
        daspect([1 1 1]);
        %print(gcf,'-dpng','-r100',[ProcessFile 'triangular\BoundaryPic\' ...
        %    num2str(wind(file)) '\' num2str(frame,'%05d') '.png']);
        %clf
    end
end