% when tracing some specified frames goes worng and we don't notice,
% after use single pic/GrabCM.mat, we ues this program to modify tra.mat.
clc;clear all;close all;
wind='230';
wrongX=2245;
OriginalFile=['J:\Granule\dimer_exp5\CM\' wind '\'];
ProcessFile=['J:\Granule\dimer_exp5\ref\' wind '\'];
Originaltxt = dir([OriginalFile '*.mat']);
load([ProcessFile  'tra.mat']);
load('J:\Granule\dimer_exp5\exp_parameter.mat','inputnum');
%%
for iframe=wrongX:length(Originaltxt)
    load([OriginalFile  Originaltxt(iframe).name ],'X','Y');
    Xindex=find(isnan(X)==1);
    Yindex=find(isnan(Y)==1);
    X(Xindex)=[];
    Y(Yindex)=[];    
    for k=1:inputnum
         [distance]=mydistance(BX(iframe-1,k),BY(iframe-1,k),X,Y);
    [value index]=min(distance);
        BX(iframe,k)=X(index);
        BY(iframe,k)=Y(index);
        X(index)=0;
        Y(index)=0;
    end
end
save([ProcessFile 'tra.mat'],'BX','BY');

