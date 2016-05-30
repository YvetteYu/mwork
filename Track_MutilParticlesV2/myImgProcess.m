function [afterimg]=myImgProcess(orimg,target,other1,other2)

afterimg=orimg(:,:,target)-0.5*orimg(:,:,other1)-0.5*orimg(:,:,other2);
%afterimg=0.5*orimg(:,:,other1)+0.5*orimg(:,:,other2)-0.1*orimg(:,:,target);

clear orimg
end
