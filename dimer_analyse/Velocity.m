% 4.save average KE of total particle of each frame and Vx (each frame and
% each particle) and Vy. and all of they are real scale (mm)
clc;clear all;close all;
ExpName='dimer_Cooling';
framerate=30;
File=['/Users/yvette/GoogleDrive/CircleBoundary/dimer/' ExpName '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
%%
wind=Exp_info.wind;
%scale=Exp_info.scale(2);
for iwind=1:length(wind)
    if iwind<4
        scale=Exp_info.scale(1);
    elseif iwind>=4 && iwind<7
        scale=Exp_info.scale(2);
    else
        scale=Exp_info.scale(3);
    end  
    load([File num2str(wind(iwind)) '/tra.mat'],'BX','BY');
    
    %%
    Vx=(BX(2:end,:)-BX(1:(end-1),:))*framerate*scale;
    Vy=(BY(2:end,:)-BY(1:(end-1),:))*framerate*scale;
    % V*scale=real unit scale
    clear B*
    %%
     % the part is added in 2014 11 17
    MSVx=mean((Vx).^2,2)';
    MSVy=mean((Vy).^2,2)';
    description=struct('variable1',...
    ['[V*] is velocity of every particle in each frame, the number is'...
    ' scaled as mm'],...
    'variable2',...
    '[MSV*] is MSV of particle of X or Y direction of each frame.');
    save([File num2str(wind(iwind)) '/velocity.mat'],'Vx','Vy','MSV*','description');
    clear *V*
end