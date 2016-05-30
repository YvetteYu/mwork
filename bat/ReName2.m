% Rename.txt for linux
clc;clear all;close all;

FilePath='C:\Users\user\GoogleDrive\oral\pic\monomer\trajectory\185\';
fp=fopen([FilePath 'rename.txt'],'w');
%load([FilePath 'ref/AvgDefect.mat'],'Exp_info');
%wind=Exp_info.wind;


%for t=1:length(wind)
    %fprintf(fp,'cd %d\\\n',wind(t));
    for k=361:680
        fprintf(fp,'rename "%05d.png" "%05d.png"\r\n',k,k-360);
    end
%    fprintf(fp,'cd ..\n');
%end
   fclose(fp);             
