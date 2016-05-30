clc;clear all;close all;
ExpName='monomer_exp6';
File = ['C:/Users/user/Dropbox/Exp/' ExpName '/'];
wind=[1 2];
start=53821;
stop=54000;
particle=1:100;
%% load A data
load([File 'exp_parameter.mat'],'Exp_info');
load([File 'ref/' num2str(wind(1)) '/tra.mat'],'B*');
AX=BX(start:stop,:); AY=BY(start:stop,:);
RX1=AX(2:end,particle)-AX(1:end-1,particle);
RY1=AY(2:end,particle)-AY(1:end-1,particle);
R1=sqrt(RX1.^2+RY1.^2)*Exp_info.scale;
clear A* B* Exp_info RX1 RY1

%% load B(contrast) data
load([File 'exp_parameter' num2str(wind(2)) '.mat'],'Exp_info');
load([File 'ref/' num2str(wind(2)) '/tra.mat'],'B*');
RX2=abs(BX(2:end,particle)-BX(1:end-1,particle))*Exp_info.scale;
RY2=abs(BY(2:end,particle)-BY(1:end-1,particle))*Exp_info.scale;
R2=sqrt(RX2.^2+RY2.^2)*Exp_info.scale;
clear B* Exp_info  RX2 RY2
%%
if size(R1,1)==size(R2,1)
fp=fopen([File 'ref/RelativeDis1.txt'],'w');
fprintf(fp,['The doc is recorded the displacement of random 20 particles between\r\n'...
    ' two frame in series 5s. The odd columns are A data, the even are B data\r\n'...
    'Unit:mm\r\n'...
    '------------------------------------------------------\r\n']);
RR=abs(R1-R2);
for iframe=1:size(R1,1)
    fprintf(fp,'%04.2f ',RR(iframe,:));
    fprintf(fp,'\r\n');
end
else
    printf('Data A and data B are not same size.\r\n');
end
fclose(fp)