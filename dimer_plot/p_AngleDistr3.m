% output bond angle distribution figure by color
clc;close all;clear all;
ExpName='dimer_exp11';
File=['J:\Granule\' ExpName '\'];
Located=['J:\Granule\' ExpName '\color\'];
HFile=[File '\triangular\defect\'];
load([File 'ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.Pnumber;
framerate=6;
%pairnum=Exp_info.Pnumber/2;
Center=Exp_info.BCenter;
Radius=Exp_info.BRadius;
%%

for t=1:length(wind)
    pairnum=wind(t)/2;
    load([File 'ref\' num2str(wind(t)) '\inf_orientation.mat'],'theta','S');
    load([File 'ref\' num2str(wind(t)) '\tra.mat'],'BX','BY');
    load([File 'ref\' num2str(wind(t)) '\pair.mat'],'index')
    %%
    figure('visible','off')
    for iframe=1:framerate:size(BX,1)
        
        %% plot hexagon boundary
        %myHexagonBoun(Center(1),Center(2),Radius);
        myCircularBoun(Center(1),Center(2),Radius);
        %% plot dimers
        for pair=1:pairnum
            tempx=[BX(iframe,index(1,pair)) BX(iframe,index(2,pair))];
            tempy=[BY(iframe,index(1,pair)) BY(iframe,index(2,pair))];
            Oangle=theta(iframe,pair);
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
        %% text particle number and defect
       %{
        load([HFile num2str(wind(t)) '\' defectfile(iframe).name],'NBNum');
        for k=1:2*pairnum
            ParticleNo=sprintf('%d',k);
            text(BX(iframe,k)+1,BY(iframe,k)+1,ParticleNo);
            hold on
            if NBNum(k)==5
                plot(BX(iframe,k),BY(iframe,k),'kx','MarkerSize',9,...
                    'LineWidth',2);
                hold on;
            elseif NBNum(k)==7
                plot(BX(iframe,k),BY(iframe,k),'k^','MarkerSize',9,...
                    'LineWidth',2);
                hold on;
            end
        end
        %}
   %% set axis
    h=Exp_info.height; w=Exp_info.width;
    daspect([1 1 1]); axis off
    set(gca,'YDir','reverse','xlim',[0 w],'ylim',[0 h]);
    time=sprintf('%3.2f',iframe/30);
    text(80,h,['t=' time ' s'],'FontSize',20);
    text(w*2/3,h,['S=' num2str(S(iframe))],'FontSize',20)
    framename=sprintf('%05d',1+(iframe-1)/framerate);
    print(gcf,'-dpng','-r100',[Located num2str(wind(t)) '/'  framename '.png']);
    clf
    end
    clear BX BY theta
end
exit
