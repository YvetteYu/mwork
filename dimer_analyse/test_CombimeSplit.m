% to combine two split particles
clc; clear all; close all;

%str=sprintf('%04d',462);
load('/Users/missyvetteyu/Desktop/CM.mat');
pnumber=2;
%%

nanind=find(isnan(X)==1);
X(nanind)=[];
Y(nanind)=[];
extra=0;
if length(X)>pnumber
    for n=1:pnumber
        Xtemp=X(n);
        Ytemp=Y(n);
        [distance]=mydistance(Xtemp,Ytemp,X,Y);
        ind=find(distance~=0 & distance<40);
        if isempty(ind)==0
            extra=extra+length(ind);
            X(n)=(X(n)+sum(X(ind)))/(length(ind)+1);
            X(ind)=[];
            Y(ind)=[];
        end
    end
    %fp=fopen('/Users/missyvetteyu/Desktop/temp/dimer/no_chains/process/v16/correct.txt','a');
    %fprintf(fp,'%s\n',str);
    %fclose(fp);
    save('/Users/missyvetteyu/Desktop/CM.mat','X','Y');
else
    fprintf('the file can not be modified.\n');
end