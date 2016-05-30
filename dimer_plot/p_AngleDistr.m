% output bond angle distribution figure by color
clc;close all;clear all;
exp='dimer_exp5';
File=['J:\Granule\' exp];
Located=[File '\color\'];
load([File '\ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
O1color=0;
O2color=1;
parnum=Exp_info.pnumber/2;
%%
for t=1:length(wind)
load([File '\ref\' num2str(wind(t)) '\inf_orientation.mat'],'theta');
load([File '\ref\' num2str(wind(t)) '\tra.mat'],'BX','BY');
load([File '\ref\' num2str(wind(t)) '\pair.mat'],'index');
%load([File '\exp_parameter.mat'],'scale','ox','oy');
switch (wind(t))
       case {130, 140}
            load([File '\exp_parameter.mat'],'ox','oy','scale');
        otherwise
            load([File '\exp_parameter2.mat'],'ox','oy','scale');
end
theta=-theta;
centerX=ox;
centerY=oy;
Radius=120/scale;
n = 0:0.01:2*pi;
cx = centerX+Radius*cos(n);
cy = centerY+Radius*sin(n);


%%
%{
figure('visible','off')
for frame=13820:1:13822
    plot(cx,cy,'k.','MarkerSize',3)
    axis equal;
    px=12+7*cos(n);
    py=60+7*sin(n);
    hold on
    
    for par=1:parnum
        tempx=[BX(frame,index(1,par)) BX(frame,index(2,par))];
        tempy=[BY(frame,index(1,par)) BY(frame,index(2,par))];
       
        if theta(frame,par)>0
            plot(tempx(1),tempy(1),...
                'Marker','o','MarkerSize',10,...
                'Color',[theta(frame,par)/1.58 O1color O2color],...
                'MarkerFaceColor',[theta(frame,par)/1.58 O1color O2color]);
            hold on
            line(tempx,tempy,'Color','r');
            hold on
            plot(tempx(2),tempy(2),...
                'Marker','o','MarkerSize',10,...
                'Color',[theta(frame,par)/1.58 O1color O2color],...
                'MarkerFaceColor',[theta(frame,par)/1.58 O1color O2color]);
            
        elseif theta(frame,par)<0
            plot(tempx(1),tempy(1),...
                'Marker','o','MarkerSize',10,...
                'Color',[O1color O2color abs(theta(frame,par)/1.58)],...
                'MarkerFaceColor',[O1color O2color abs(theta(frame,par)/1.58)]);
            hold on
            line(tempx,tempy,'Color','r');
            hold on
            plot(tempx(2),tempy(2),...
                'Marker','o','MarkerSize',10,...
                'Color',[O1color O2color abs(theta(frame,par)/1.58)],...
                'MarkerFaceColor',[O1color O2color abs(theta(frame,par)/1.58)]);
        else
            plot(tempx(1),tempy(1),...
                'Marker','o','MarkerSize',10,...
                'Color',[O1color O2color O2color],...
                'MarkerFaceColor',[O1color O2color O2color]);
            hold on
            line(tempx,tempy,'Color','r');
            hold on
            plot(tempx(2),tempy(2),...
                'Marker','o','MarkerSize',10,...
                'Color',[O1color O2color O2color],...
                'MarkerFaceColor',[O1color O2color O2color]);
        end
        hold on
        for k=1:100
         ParticleNo=sprintf('%d',k);
        text(BX(frame,k)+1,BY(frame,k)+1,ParticleNo);
        end
    hold on
    end
    print(gcf,'-dpng','-r150',[Located 'test_' num2str(wind(t)) '\' num2str(frame) '.png']);
    clf
end
%}
%%
figure('visible','off')
for frame=1:30:size(BX,1)
    plot(cx,cy,'k.','MarkerSize',3)
    axis equal;
    %px=12+7*cos(n);
    %py=60+7*sin(n);
    hold on
    
    for par=1:parnum
        tempx=[BX(frame,index(1,par)) BX(frame,index(2,par))];
        tempy=[BY(frame,index(1,par)) BY(frame,index(2,par))];
        Tcolor = abs(theta(frame,par)/1.58);
            plot(tempx(1),tempy(1),...
                'Marker','o','MarkerSize',10,...
                'Color',hsv2rgb([O1color Tcolor O2color]),...
                'MarkerFaceColor',hsv2rgb([O1color Tcolor O2color]));
            hold on
            line(tempx,tempy,'Color','r');
            hold on
            plot(tempx(2),tempy(2),...
                'Marker','o','MarkerSize',10,...
                'Color',hsv2rgb([O1color Tcolor O2color]),...
                'MarkerFaceColor',hsv2rgb([O1color Tcolor O2color]));       
        hold on
        for k=1:100
         ParticleNo=sprintf('%d',k);
        text(BX(frame,k)+1,BY(frame,k)+1,ParticleNo);
        end
    hold on
    end
    print(gcf,'-dpng','-r150',[Located '\' num2str(wind(t)) '\' num2str(frame) '.png']);
    clf
end
end
exit