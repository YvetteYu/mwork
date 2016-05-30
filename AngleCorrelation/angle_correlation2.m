% This is for dimer exp program.
% The version 2 was rewrited by version 1.
% I calculate the "dimer"'s neibors instead "particle"'s neibors
% The fore part of program is same as version 1 : took out the neibors from
% Tripair. And the second for-loop recognized the dimer's neibors.
clc;clear all;close all;
ExpName='dimer_exp6';
File=['J:\Granule\' ExpName];
load([File '\ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
inputnum=Exp_info.Pnumber;
%%

for str=1:length(wind)
   % inputnum=wind(str);
    load([File '\ref\' num2str(wind(str)) '\inf_orientation.mat'],'theta');
    load([File '\ref\' num2str(wind(str)) '\pair.mat'],'index');
    filedefect=dir([File '\triangular\defect\' num2str(wind(str)) '\*mat']);
    
    
    for frame=1:length( filedefect)
        acorre=zeros(inputnum/2,10);
        Avgacorre=zeros(inputnum/2,1);
        dimerneibor=zeros(inputnum/2,10);
        temptheta=theta(frame,:);
        load([File '\triangular\defect\' num2str(wind(str)) '\' filedefect(frame).name],'neibor');
        
        for dimer=1:length(index)
            tempdnei=[neibor(index(1,dimer),:) neibor(index(2,dimer),:)];
             % take out the all neibors of particles of first dimer in pairs
            tempdnei(tempdnei==0)=[];
             % delete the zero number
            tempdnei=unique(tempdnei);
             % delete the repeats.
            tempx=zeros(1,length(tempdnei));
            tempy=zeros(1,length(tempdnei));
            
            for n=1:length(tempdnei)
                [tempx(n) tempy(n)]=find(index(:,:)==tempdnei(n));
                % tempy are the columns of the neibors, so that we can use the
                % column number to find the relative theta.
            end
            
            clear tempx
            tempy=unique(tempy);
             %sometimes both of particles in one dimer can be the other one
             %particle's neibors in the meantimes. two particles of one dimer have
             %same column number, so we use column number to cancel the repeat.
            tempy(tempy==dimer)=[];
             % cancel the partner in one dimer situation.
            dimerneibor(dimer,1:length(tempy))=tempy;
             % to save the dimer's neibor in dimerneibor.
            acorre(dimer,1:length(tempy))=abs(cos(temptheta(dimer)-temptheta(tempy)));
            Avgacorre(dimer)=mean(acorre(dimer,1:length(tempy)));
            clear tempy tempnei
        end
        
        save([File '\triangular\defect\' num2str(wind(str)) '\' ...
        filedefect(frame).name],'-append','dimerneibor');
        save([File '\triangular\AngleCorrelation\' num2str(wind(str)) ...
            '\' filedefect(frame).name],'acorre','Avgacorre');
    end
    
    clear temp*
end
exit
