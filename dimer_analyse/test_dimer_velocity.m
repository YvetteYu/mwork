% 4.save average KE of total particle of each frame and Vx (each frame and
% each particle) and Vy. and all of they are real scale (mm)
clear all;close all;

framerate=0.5;
scale=1/10;
BX=[ones(1,20); 3*ones(1,20); 4*ones(1,20)];
Vx=(BX(2:end,:)-BX(1:(end-1),:))*framerate*scale;
%%

% V*scale=real unit scale
framenum=size(Vx,1);
MSVx=zeros(1,framenum);

for frames=1:framenum
    MSVx(frames)=mean(Vx(frames,:).^2);
    
    % <V^2>/frame : Vavg of total particles
end