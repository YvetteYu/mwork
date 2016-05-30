% 
function [slope intercept]=mylinreg2(x,y)
avg_y=mean(y);
avg_x=mean(x);
avg_xy=mean(x.*y);
avg_x2=mean(x.*x);

slope=(avg_x * avg_y - avg_xy) / (avg_x^2 - avg_x2);
intercept=avg_y - slope * avg_x;

end