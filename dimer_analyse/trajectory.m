% 1. find each particle's trajectory in every frame. 
clc; close all; clear all;
ExpName='TestExp/exp6';
load(['J:/Granule/' ExpName '/ref/exp_parameter.mat'],'Exp_info');
inputnum=127%Exp_info.Pnumber;
wind=Exp_info.wind;
%%
for iwind=2:length(wind)
OriginalFile = ['J:/Granule/' ExpName '/CM/' num2str(wind(iwind)) '/'];
ProcessFile = ['J:/Granule/' ExpName '/ref/' num2str(wind(iwind)) '/'];
Originaltxt = dir([OriginalFile '*.mat']);
txtnumber=length(Originaltxt);

%{
*************************************
         p1  p2  p3  ....
       -------------------
       | x1  x2  x3  ... | t1 
       | x1' x2' x3' ... | t2 
    X= |     .           | t3
       |     .           |  .
       |     .           |  .

    X(time,Pi)

*************************************
%}

%% for .mat file 
%permutation the CM

BX=zeros(txtnumber,inputnum);
BY=zeros(txtnumber,inputnum);
for iframe=1:txtnumber
    load([OriginalFile Originaltxt(iframe).name],'X','Y');
        Xindex=find(isnan(X)==1);
        Yindex=find(isnan(Y)==1);  
        X(Xindex)=[];
        Y(Yindex)=[];
        
  
            if iframe==1
                BX(iframe,:)=X;
                BY(iframe,:)=Y;
            else
                
        for k=1:inputnum
            [distance]=mydistance(BX(iframe-1,k),BY(iframe-1,k),X,Y);
            [value index]=min(distance);
            BX(iframe,k)=X(index);
            BY(iframe,k)=Y(index);
            X(index)=0;
            Y(index)=0;
            % I canged this part on 03/21/2014, the old program can read
            % from google drive
        end
    end
end
clear X Y
save([ProcessFile 'tra.mat'],'BX','BY');
clear B*
end
