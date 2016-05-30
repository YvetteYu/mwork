% The function return the ind of the nearest neighbor
function [ind]=myNearestNeighbor(X,Y,ipar,neighbor)

[value num]=min(mydistance(X(ipar),Y(ipar),X(neighbor),Y(neighbor)));
ind=neighbor(num);
end