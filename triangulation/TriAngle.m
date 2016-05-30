% Calculate particle neibor triangle's angle.
clc;clear all; close all;
ExpName='monomer_exp5';
ProcessFile=['J:\Granule\' ExpName '\'];

load([ProcessFile 'ref\exp_parameter.mat'],'Exp_info');
wind=[170 175 185 190 200 205 210 220 225 230];
pnumber=Exp_info.Pnumber;

for file=1:length(wind)
    trifile=dir([ProcessFile 'triangular\LatticeLine\' ...
        num2str(wind(file)) '\*.mat']);
    load([ProcessFile 'ref\' num2str(wind(file)) '\tra.mat'],'BX','BY');
    
    
    for frame=1:length(trifile)
        load([ProcessFile 'triangular\LatticeLine\' num2str(wind(file)) '\'...
            trifile(frame).name],'triangle');
        X=BX(frame,:);
        Y=BY(frame,:);
        triAng=zeros(pnumber,10);
        
        for par=1:pnumber
            [row col]=find(triangle(:,:)==par);
            %%
            
            for k=1:length(row)
                % for particle's each neibor triangle
                switch col(k)
                    case 1
                        delta=[triangle(row(k),2) triangle(row(k),3)];
                    case 2
                        delta=[triangle(row(k),1) triangle(row(k),3)];
                    case 3
                        delta=[triangle(row(k),1) triangle(row(k),2)];
                end
                triAng(par,k)=myIncludedAngle(X(par),Y(par),X(delta(1)),Y(delta(1)),X(delta(2)),Y(delta(2)));
            end
        end
        save([ProcessFile 'triangular\TriAngle\'  num2str(wind(file)) '\' ...
                trifile(frame).name],'triAng');
        clear X Y delta
    end
    
end
exit