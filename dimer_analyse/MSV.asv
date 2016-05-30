% Added MSV in velocity.mat
% The program is composed on 2014/11/17
clc;clear all;close all;
ExpName='monomer_exp2';
ProcessFile = ['J:/Granule/' ExpName '/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
str=Exp_info.Number;

for file=1:length(str)
    load([ProcessFile 'ref/' num2str(str(file)) '/velocity.mat'],'Vx','Vy');
    MSVx=mean((Vx).^2,2)';
    MSVy=mean((Vy).^2,2)';
    description=struct('variable1',...
    ['[V*] is velocity of every particle in each frame, the number is'...
    ' scaled as mm'],...
    'variable2',...
    '[MSV*] is MSV of particle of X or Y direction of each frame.');
    save([ProcessFile 'ref/' num2str(str(file)) '/velocity.mat'],...
        '-append','MSV*','description');
end
    
    