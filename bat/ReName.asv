clear all; close all; clc;
FilePath=['C:\Users\BIG DATA\Documents\Apowersoft\Apowersoft Free Online Screen Recorder\DM01\'];
%%fp=fopen([FilePath 'ReName.txt'],'w');

%%
FrameNum=dir([FilePath '*.mp4']);

%{
for time=1:length(FrameNum)
    be4Name=FrameNum(time).name;
    afterName=sprintf('%05d.mat',time);
    fprintf(fp,'RENAME "%s" "%s" \r\n',be4Name,afterName);
end
%}


%%fclose(fp);
