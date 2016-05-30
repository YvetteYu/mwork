%this is combined with DefectNumber.m
% The first version of particle's angle correlation.
% I calculate it by estimate the six or more neibors of each particles
% the difference of the version 2. The neibors of "particle" are changed 
% the neibors of "dimer"
clc;clear all;close all;
exp='monomer_exp3';
File=['J:\Granule\' exp];
load([File '\ref\AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
pnumber=Exp_info.pnumber;
%%
for str=7%:length(wind)
%fp=fopen([File '\triangular\AngleCorrelation\' num2str(wind(str)) '\check.txt'],'w');
fileLLine=dir([File '\triangular\LatticeLine\' num2str(wind(str)) '\*.mat']);
%filedefect=dir([File '\triangular\defect\' num2str(wind(str)) '\*mat']);

for frame=6910:length(fileLLine)
    load([File '\triangular\LatticeLine\' num2str(wind(str)) '\' fileLLine(frame).name],'Tripair');
    %load([File '\triangular\defect\' num2str(wind(str)) '\' filedefect(frame).name],'NBNum');
    tripairNum=length(Tripair);
    %fprintf(fp,'frame %d\r\n',frame);
    %%
    neibor=zeros(pnumber,12);
   
    for par=1:pnumber
        check=find(Tripair(:,:)==par);
        %if length(check)~= NBNum(par)
            %fprintf(fp,'%d\r\n',par);
        %end
        tempA=Tripair(check(check<=tripairNum)+tripairNum);
        tempB=Tripair(check(check>tripairNum)-tripairNum);
        tempn=[tempA;tempB];
        clear tempA tempB check
        neibor(par,1:length(tempn))=tempn';
        % neibor is array of (number of particle t's neibor)
     
    save([File '\triangular\defect\' num2str(wind(str)) '\' ...
        fileLLine(frame).name],'-append','neibor');
    end 
end
%fclose(fp);
end
exit

