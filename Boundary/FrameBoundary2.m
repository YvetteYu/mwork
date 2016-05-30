% pick up the particles on boundary
% the description is added on Agust 15 2014.
clc;clear all;close all;
ExpName='monomer_exp5';
ProcessFile=['J:\Granule\' ExpName '\'];
%load([ProcessFile 'exp_parameter.mat'],'Exp_info');
wind=[170 175 185 190 200 205 210 220 225 230];
anglethresh=150*2*pi/360;
% the angle threshold is 120 degrees

for iwind=1:length(wind)
    
    trifile=dir([ProcessFile 'triangular\TriAngle\' ...
        num2str(wind(iwind)) '\*.mat']);
    neibfile=dir([ProcessFile 'triangular\defect\' num2str(wind(iwind)) '\*.mat']);
    
    Bparticle=zeros(length(trifile),40);
    B2particle=zeros(length(trifile),40);
    
    for iframe=1:length(trifile)
        load([ProcessFile 'triangular\TriAngle\' num2str(wind(iwind)) '\'...
            trifile(iframe).name],'triAng');
        sigma_triang=sum(triAng,2);
        tempBoun=find(sigma_triang<(2*pi-0.2))';
        % 0.2 ~ 10 degrees
        [throw thrcol]=find(triAng(:,:)>anglethresh);
        tempBpar=[tempBoun throw'];
        tempBpar=unique(tempBpar);
        Bparticle(iframe,1:length(tempBpar))=tempBpar;
        
        load([ProcessFile 'triangular\defect\' num2str(wind(iwind)) '\' ...
            neibfile(iframe).name],'neibor');
        tempBpar2=nonzeros(unique(neibor(tempBpar,:)))';
        % tempBpar2 are particles which in first and second layers.
        tempBpar3=setdiff(tempBpar2,tempBpar);
        B2particle(iframe,1:length(tempBpar3))=tempBpar3;
        clear temp*
    end
    
    description=struct('variable1',...
    ['[Bparticle] is the first outer layer of particles which composed'...
    ' a closed circle. The definition is the union (sum of the lattice'...
    ' angle is < 360) and (one of the lattice angle is > 150)'],...
                    'variable2',...
    ['[B2particle] is the second outer layer of particles. The definition'...
    'is neighbors of Bparticle.'],...
                    'Note',...
    'you can run p_Boundary.mat to see the different of B/B2particle.');

    save([ProcessFile 'ref\' num2str(wind(iwind)) '\BoundaryPar.mat'],...
        'Bparticle','B2particle','description');
end

exit