clc;clear all;close all;
ExpName='dimer_exp11';
FilePath=['J:/Granule/' ExpName '/'];
load([FilePath 'ref/exp_parameter.mat'],'Exp_info');

wind=Exp_info.Pnumber;
for iwind=1:length(wind)
    pnumber=Exp_info.Pnumber(iwind);
    files=dir([FilePath 'triangular/TriAngle/' num2str(wind(iwind)) '/*.mat']);
    Faicos=zeros(length(files),pnumber);
    Faisin=zeros(length(files),pnumber);
    FaiR=zeros(length(files),pnumber);
    
    for iframe=1:length(files)
        load([FilePath 'triangular/TriAngle/' num2str(wind(iwind)) '/' files(iframe).name],'triAng');
        for ipar=1:pnumber
            fai=nonzeros(triAng(ipar,:))'; 
            theta=cumsum(fai); % cumsum=[x1 x1+x2 x1+x2+x3 ....]
            cospart=cos(6*theta);
            sinpart=sin(6*theta);
            Faicos(iframe,ipar)=mean(cospart);
            Faisin(iframe,ipar)=mean(sinpart);
            FaiR(iframe,ipar)=sqrt(Faicos(iframe,ipar)^2+Faisin(iframe,ipar)^2);
            clear fai theta *part
        end
    end
    
description=struct('variable1',...
    ['[Faicos] is 100x(frame number) array. It recorded the real part of '...
    'Fai6 of every particle in ench frame'],...
    'variable2',...
    ['[Faisin] is 100x(frame number) array. It recorded the imaginary part'...
    ' of Fai6 of every particle in ench frame'],...
    'variable3',...
    ['[FaiR] is 100x(frame number) array. It recorded the magnitude'...
    ' of Fai6 of every particle in ench frame']);
save([FilePath 'ref/' num2str(wind(iwind)) '/Fai6.mat'],'Fai*','description');
    %}
end
