% output bond angle distribution figure by color
clc;close all;clear all;
ExpName='dimer_exp8';
File=['J:\Granule\' ExpName '\'];
HFile=[File '\triangular\defect\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\color\'];
load([File 'exp_parameter.mat'],'w','h','ox','oy','scale');
load([File 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
O1color=239/359;
O2color=1;
framerate=30;
pairnum=Exp_info.pnumber/2;

centerX=ox;
centerY=oy;
Radius=120/scale;
n = 0:0.01:2*pi;
cx = centerX+Radius*cos(n);
cy = centerY+Radius*sin(n);
clear ox oy Radius center* n

%%
for t=1:5%:length(wind)
    %pairnum=wind(t)/2;
    load([File 'ref\' num2str(wind(t)) '\inf_orientation.mat'],'theta');
    load([File 'ref\' num2str(wind(t)) '\tra.mat'],'BX','BY');
    load([File 'ref\' num2str(wind(t)) '\pair.mat'],'index');
    %{
    switch (wind(t))
       case {130, 140}
            load([File '\exp_parameter.mat'],'ox','oy','scale');
        otherwise
            load([File '\exp_parameter2.mat'],'ox','oy','scale');
    end
    %}
    defectfile=dir([HFile num2str(wind(t)) '\*.mat']);
    %%
    figure('visible','off')
    for frame=9601:framerate:size(BX,1)
        load([HFile num2str(wind(t)) '\' defectfile(frame).name],'NBNum');
        plot(cx,cy,'k.','MarkerSize',3)
        axis equal;
        hold on
        
        for pair=1:pairnum
            tempx=[BX(frame,index(1,pair)) BX(frame,index(2,pair))];
            tempy=[BY(frame,index(1,pair)) BY(frame,index(2,pair))];
            Tcolor = abs(theta(frame,pair)/1.58)+0.001;
            plot(tempx(1),tempy(1),...
                'Marker','o','MarkerSize',10,...
                'Color',hsv2rgb([O1color Tcolor O2color]),...
                'MarkerFaceColor',hsv2rgb([O1color Tcolor O2color]));
            hold on
            line(tempx,tempy,'Color','r','LineWidth',2);
            hold on
            plot(tempx(2),tempy(2),...
                'Marker','o','MarkerSize',10,...
                'Color',hsv2rgb([O1color Tcolor O2color]),...
                'MarkerFaceColor',hsv2rgb([O1color Tcolor O2color]));
            hold on
        end
        
        for k=1:2*pairnum
            ParticleNo=sprintf('%d',k);
            text(BX(frame,k)+1,BY(frame,k)+1,ParticleNo);
            hold on
            if NBNum(k)==5
                plot(BX(frame,k),BY(frame,k),'o','MarkerSize',5,...
                    'MarkerFaceColor',[1 0.4 0],'MarkerEdgeColor',[1 0.4 0]);
                hold on;
            elseif NBNum(k)==7
                plot(BX(frame,k),BY(frame,k),'^','MarkerSize',5,...
                    'MarkerFaceColor','g','MarkerEdgeColor','g');
                hold on;
            end
        end
        %}
        set(gca,'YDir','reverse');
        time=sprintf('time = %2.3f',(frame-1)/30);
        text(w-40,h-10,time,'FontSize',14);
        framename=1+((frame-1)/framerate);
        print(gcf,'-dpng','-r100',[Located num2str(wind(t)) '\' num2str(framename,'%04d') '.png']);
        clf
    end
    clear BX BY theta
end

