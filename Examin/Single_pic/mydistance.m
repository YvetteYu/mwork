% function to return the distance between two points
function [d]=mydistance(x,y,otherx,othery)

d=(x-otherx).^2+(y-othery).^2;
d=sqrt(d);

end