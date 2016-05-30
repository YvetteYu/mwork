function [theta]=myIncludedAngle(topx,topy,otherx1,othery1,otherx2,othery2)

r1dotr2=(otherx1-topx)*(otherx2-topx)+(othery1-topy)*(othery2-topy);
r1=mydistance(topx,topy,otherx1,othery1);
r2=mydistance(topx,topy,otherx2,othery2);
theta=acos(r1dotr2/(r1*r2));

end