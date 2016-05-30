clc;clear all;close all;
ExpName='dimer_exp19';
load(['J:\Granule\' ExpName '\ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;

for iwind=20%:length(wind)
    File = ['J:\Granule\' ExpName '\ref\' num2str(wind(iwind)) '\'];
    load([File 'pair.mat'],'index','fixpoint');
    %%
    newindex=index;
    fixpoint=sort(fixpoint);
    for i=1:length(fixpoint)
        position=find(index>fixpoint(i));
        newindex(position)=newindex(position)-1;
    end
    img=imread(['J:\Granule\OriginalData\' ExpName '\pic\' num2str(wind(iwind)) '\00001.png']);
    load([File 'tra.mat'],'B*');
    X=BX(1,:); Y=BY(1,:);
    clear B*
    imshow(img); hold on
    for i=1:length(index)
        tempx=X(newindex(:,i));
        tempy=Y(newindex(:,i));
        line(tempx,tempy,'Color','r','LineWidth',2);
        hold on
    end
    pause
    save([File 'pair.mat'],'-append','newindex');
    print(gcf,'-dpng','-r100',['J:\Granule\' ExpName '\ref\' num2str(wind(iwind)) '.png'])
    clf
end