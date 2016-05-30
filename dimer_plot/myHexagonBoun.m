function myHexaginBoun(CenterX,CenterY,Radius)

BoundX=CenterX+Radius*cos(0:pi/3:2*pi);
BoundY=CenterY+Radius*sin(0:pi/3:2*pi);
hold on
plot(BoundX,BoundY,'Color',[180/255 180/255 180/255])
end