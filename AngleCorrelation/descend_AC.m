clc; clear all; close all;
exp='dimer_exp6';
FilePath=['J:\Granule\' exp '\triangular\AngleCorrelation\'];
RefFile=['J:\Granule\' exp '\ref\'];
load([RefFile 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
dimernum=Exp_info.pnumber/2;

%%
for w=1:length(wind)
    file=dir([FilePath num2str(wind(w)) '\*mat']);
    max2AC=zeros(length(file),dimernum);    
    max2AvgAC=zeros(1,length(file)); 
    for frame=1:length(file)
        load([FilePath num2str(wind(w)) '\' file(frame).name],'acorre')
        acorre=sort(acorre,2,'descend');
        tempacorre=acorre(:,1:2);
        max2AC(frame,:)=mean(tempacorre');
        max2AvgAC(frame)=mean(max2AC(frame,:));
        clear tempacorre
    end
    save([RefFile  num2str(wind(w)) '\max_ac.mat'],'max2AC','max2AvgAC');
    
end
exit