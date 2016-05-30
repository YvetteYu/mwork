% calculate particles' mean square displacement by input position(t=0) and 
% position(t=a) 
function [MSD]=myMeanSqrDisp(X,Xt,Y,Yt)
MSD=mean((X-Xt).^2+(Y-Yt).^2);
end
