function []=myp_CircularBon(centerX,centerY,Radius)   
    n = 0:0.01:2*pi;
    cx = centerX+Radius*cos(n);
    cy = centerY+Radius*sin(n);
    hold on
    plot(cx,cy,'k.','MarkerSize',3)
    axis equal;
    hold on
end