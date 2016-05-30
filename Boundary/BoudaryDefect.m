% if you use DefectNum.m after 6/1 2014, please use BoundaryDefect2.m 
clc;clear all;close all;
ExpName='monomer_exp3';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
pnumber=Exp_info.pnumber;
particleNo=1:pnumber;

for iwind=1:length(wind)
defectfile=dir([File 'triangular\defect\' num2str(wind(iwind)) '\*.mat']);
load([File 'ref\' num2str(wind(iwind)) '\BoundaryPar.mat'],...
        'Bparticle','B2particle');
defect5=zeros(length(defectfile),70);
defect7=zeros(length(defectfile),70);
Boundefect=zeros(length(defectfile),60);
%%    
for frame=1:length(defectfile)
    load([File 'triangular\defect\' num2str(wind(iwind)) '\'...
         defectfile(frame).name],'NBNum');
    
    tempdefect5=particleNo(NBNum==5); 
    tempdefect7=particleNo(NBNum==7); 
    defect5(frame,1:length(tempdefect5))=tempdefect5;
    defect7(frame,1:length(tempdefect7))=tempdefect7;
    defect=particleNo(NBNum==5 | NBNum==7);
    Boundary=[Bparticle(frame,:) B2particle(frame,:)];
    tempBDF=Boundary(ismember(Boundary,defect));
    Boundefect(frame,1:length(tempBDF))=tempBDF;
    clear temp*
    
end
save([File 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'-append','defect5','defect7');
save([File 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'Boundefect');

clear defect* Boundefect
end
