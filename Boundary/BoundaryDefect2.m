% if you use DefectNum.m after 6/1 2014, you use this BoundaryDefect2.m 
% version BoundaryDefect.m would save defect5 and defect7 which are save 
% by DefectNum.m
clc;clear all;close all;
ExpName='dimer_exp7';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
pnumber=Exp_info.pnumber;
particleNo=1:pnumber;

for iwind=1:length(wind)
defectfile=dir([File 'triangular\defect\' num2str(wind(iwind)) '\*.mat']);
load([File 'ref\' num2str(wind(iwind)) '\BoundaryPar.mat'],...
        'Bparticle','B2particle');
load([File 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');
Boundefect=zeros(length(defectfile),60);
%%    
for frame=1:length(defectfile)
    load([File 'triangular\defect\' num2str(wind(iwind)) '\'...
         defectfile(frame).name],'NBNum');
    
    tempdefect5=nonzeros(defect5(frame,:))';
    tempdefect7=nonzeros(defect7(frame,:))';
    defect=[tempdefect5 tempdefect7];
    %defect=particleNo(NBNum==5 | NBNum==7);
     % modify this before test yet.
    Boundary=[Bparticle(frame,:) B2particle(frame,:)];
    tempBDF=Boundary(ismember(Boundary,defect));
    Boundefect(frame,1:length(tempBDF))=tempBDF;
    clear temp*
    
end

save([File 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'Boundefect');

clear defect* Boundefect
end
