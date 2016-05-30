% The first version of particle's angle correlation.
% I calculate it by estimate the six or more neibors of each particles
% the difference of the version 2. The neibors of "particle" are changed 
% the neibors of "dimer"
clc;clear all;close all;
exp='dimer_exp3';
File=['J:\Granule\' exp];
load([File '\exp_parameter.mat'],'inputnum');
wind=11:22;
for str=1:length(wind)
load([File '\ref\' num2str(wind(str)) '\inf_orientation.mat'],'vector','theta');
load([File '\ref\' num2str(wind(str)) '\pair.mat'],'index');
fp=fopen([File '\triangular\AngleCorrelation\' num2str(wind(str)) '\check.txt'],'w');
fileLLine=dir([File '\triangular\LatticeLine\' num2str(wind(str)) '\*.mat']);
filedefect=dir([File '\triangular\defect\' num2str(wind(str)) '\*mat']);

for frame=1:length(fileLLine)
    load([File '\triangular\LatticeLine\' num2str(wind(str)) '\' fileLLine(frame).name],'Tripair');
    load([File '\triangular\defect\' num2str(wind(str)) '\' filedefect(frame).name],'NBNum');
    tripairNum=length(Tripair);
    fprintf(fp,'frame %d\r\n',frame);
    %%
    neibor=zeros(inputnum,max(NBNum));
    acorre=zeros(1,inputnum);
    for par=1:inputnum
        check=find(Tripair(:,:)==par);
        temptheta=theta(par,:);
        if length(check)~= NBNum(par)
            fprintf(fp,'%d\r\n',par);
        end
        tempA=Tripair(check(check<=tripairNum)+tripairNum);
        tempB=Tripair(check(check>tripairNum)-tripairNum);
        tempn=[tempA;tempB];
        %clear tempA tempB check
        neibor(par,1:length(tempn))=tempn';
        % neibor is array of (number of particle t's neibor)
        [ign tempar]=find(index(:,:)==par);
        
        for neib=1:length(tempn)
            [tempx,tempy]=find(index(:,:)==tempn(neib));
            tempacorre=abs(cos(temptheta(tempy)-temptheta(tempar)));
            acorre(par)=acorre(par)+tempacorre;
        end
        acorre(par)=(acorre(par)-1)/(length(tempn)-1);
    end
    
    save([File '\triangular\defect\' num2str(wind(str)) '\' ...
        filedefect(frame).name],'-append','neibor');
    save([File '\triangular\AngleCorrelation\' num2str(wind(str)) ...
        '\' num2str(frame,'%05d')],'acorre');
end
fclose(fp);
end
exit

