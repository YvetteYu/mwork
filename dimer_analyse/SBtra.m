clc;clear all;close all;
ExpName='TestExp\exp4';
File=['J:\Granule\' ExpName '\'];
load([File 'ref\exp_parameter.mat'],'Exp_info');
load([File 'ref\suboundary.mat'],'SBroi');
wind=Exp_info.wind;

%%
for iwind=1:length(wind)
    load([File 'ref\' num2str(wind(iwind)) '\tra.mat'],'BX','BY');
    index=zeros(size(BX));
    for iframe=1:size(BX,1)
        X=BX(iframe,:); Y=BY(iframe,:);
        index(iframe,:)=round(Y)+size(SBroi,1)*(round(X)-1);
    end
    CX=(BX.*SBroi(index))';
    CY=(BY.*SBroi(index))';
    clear B* iframe X Y
    DX=zeros(size(CX,1)*35,size(CX,2));
    DY=zeros(size(CX,1)*35,size(CX,2));
    
    %%
    extraP=0;
    for ipar=1:Exp_info.Pnumber
        X=CX(ipar,:); Y=CY(ipar,:);
        [Labels,numbers]=bwlabel(X);
        for inumber=1:numbers
            tempX=X(Labels==inumber);
            tempY=Y(Labels==inumber);
            DX(extraP+inumber,1:length(tempX))=tempX;
            DY(extraP+inumber,1:length(tempY))=tempY;
        end
        extraP=extraP+numbers;
    end
    DX(extraP+1:end,:)=[]; DY(extraP+1:end,:)=[];
    save([File 'ref\' num2str(wind(iwind)) '\SBtra.mat'],'DX','DY','extraP');
    clear C* D*
end