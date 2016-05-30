% see numerical .... p.177 and p.150
function [slope intercept]=mylinreg(x,y)
sigmaTerm=std(y).^(-2);
s = sum(sigmaTerm);
sx = sum(x.*sigmaTerm);
sy = sum(y.*sigmaTerm);
sxy = sum(x.*y.*sigmaTerm);
sxx = sum(x.^2.*sigmaTerm);
denom = s*sxx - sx^2;
clear sigmaTerm
intercept=(sxx*sy - sx*sxy)/denom;
slope=(s*sxy-sx*sy)/denom;
end