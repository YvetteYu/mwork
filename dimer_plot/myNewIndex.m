% define region is same as arc_cos
% but O(0,0) located on upper left corner
% no matter arc_cos or arc_sin, the S will be the same

function [index]=myNewIndex(index,X,Y)
 % X=BX(1,:), Y=BY(1,:) 
 %{
%% arc_cos ( 1th and 2th quadrants )
 for n=1:length(index)
 if Y(index(2,n))> Y(index(1,n))
     temp=index(2,n);
     index(2,n)=index(1,n);
     index(1,n)=temp;
 elseif Y(index(2,n)) == Y(index(1,n))
     if X(index(2,n))> X(index(1,n))
     temp=index(2,n);
     index(2,n)=index(1,n);
     index(1,n)=temp;
     end
 end
 
 end
 %}
 
%% arc_sin ( 1th and 4th quadrants )
 
 for n=1:length(index)
 if X(index(2,n))> X(index(1,n))
     temp=index(2,n);
     index(2,n)=index(1,n);
     index(1,n)=temp;
 elseif X(index(2,n)) == X(index(1,n))
     if Y(index(2,n))> Y(index(1,n))
     temp=index(2,n);
     index(2,n)=index(1,n);
     index(1,n)=temp;
     end
 end
 
 end

 end
 