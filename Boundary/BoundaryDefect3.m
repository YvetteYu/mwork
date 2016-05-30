% BoundaryDefect3.m is written on August 15 2014  
% Before this, please go "?" to modify the data. 
clc;clear all;close all;
ExpName='monomer_exp5';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\exp_parameter.mat'],'Exp_info');
wind=[170 175 185 190 200 205 210 220 225 230];
pnumber=Exp_info.Pnumber;

for iwind=1:length(wind)
defectfile=dir([File 'triangular\defect\' num2str(wind(iwind)) '\*.mat']);
load([File 'ref\' num2str(wind(iwind)) '\BoundaryPar.mat'],...
        'Bparticle','B2particle');
load([File 'ref\' num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');

B1DF5=zeros(length(defectfile),40);
B1DF7=zeros(length(defectfile),10);
B2DF5=zeros(length(defectfile),40);
B2DF7=zeros(length(defectfile),15);
framenum=size(B1DF5,1);
NumB1DF5=zeros(1,framenum);
NumB1DF7=zeros(1,framenum);
NumB2DF5=zeros(1,framenum);
NumB2DF7=zeros(1,framenum);
%%    
for frame=1:length(defectfile)
    load([File 'triangular\defect\' num2str(wind(iwind)) '\'...
         defectfile(frame).name],'NBNum');
    
    tempdefect5=nonzeros(defect5(frame,:))';
    tempdefect7=nonzeros(defect7(frame,:))';
    tempB1paticle=nonzeros(Bparticle(frame,:))';
    tempB2paticle=nonzeros(B2particle(frame,:))';
    
    tempB1DF5=tempB1paticle(ismember(tempB1paticle,tempdefect5));
    tempB1DF7=tempB1paticle(ismember(tempB1paticle,tempdefect7));
    tempB2DF5=tempB2paticle(ismember(tempB2paticle,tempdefect5));
    tempB2DF7=tempB2paticle(ismember(tempB2paticle,tempdefect7));
    B1DF5(frame,1:length(tempB1DF5))=tempB1DF5;
    B1DF7(frame,1:length(tempB1DF7))=tempB1DF7;
    B2DF5(frame,1:length(tempB2DF5))=tempB2DF5;
    B2DF7(frame,1:length(tempB2DF7))=tempB2DF7;
    %% calculate the number of B*DF*
    NumB1DF5(frame)=length(tempB1DF5);
    NumB1DF7(frame)=length(tempB1DF7);
    NumB2DF5(frame)=length(tempB2DF5);
    NumB2DF7(frame)=length(tempB2DF7);
    clear temp*
    
end

description=struct('variable1',...
    ['B1DF*] is (frame number)x n matrix which recorded first layer'...
    ' 5th/7th defect(by particle number) in each frame(row).'],...
    'variable2',...
    ['[B2DF*] is (frame number)x n matrix which recorded second layer'...
    ' 5th/7th defect(by particle number) in each frame(row).'],...
    'variable3',...
    ['[NumB*DF*]:1x (frame number) array. Each element is amount of B*DF*'...
    ' in each frame.']);
save([File 'ref\' num2str(wind(iwind)) '\Bdefect.mat'],'B*DF*','NumB*DF*',...
    'description');

clear defect* Boundefect
end
