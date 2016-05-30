clc;clear all;close all;
ExpName='TestExp\exp6';
load(['J:\Granule\' ExpName '\ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
figure%('visible','off')
for iwind=1:length(wind)
    File = ['J:\Granule\' ExpName '\ref\' num2str(wind(iwind)) '\'];
    load([File 'pair.mat'],'index')
    img=imread(['J:\Granule\OriginalData\' ExpName '\pic\' num2str(wind(iwind)) '\00001.png']);
    load([File 'tra.mat'],'B*');
    X=BX(1,:); Y=BY(1,:);
    clear B*
    imshow(img); hold on
    %{
    for i=1:120
        plot(X(i),Y(i),'ro','MarkerFaceColor','r');hold on
    end
    %}
    for i=1:length(index)
        tempx=X(index(:,i));
        tempy=Y(index(:,i));
        plot(tempx(1),tempy(1),'ro','MarkerFaceColor','r'); hold on
        plot(tempx(2),tempy(2),'bo','MarkerFaceColor','b'); hold on
        line(tempx,tempy,'Color','r','LineWidth',2); hold on
    end
    %}
    pause
    print(gcf,'-dpng','-r100',['J:\Granule\' ExpName '\' num2str(wind(iwind)) '.png'])
    clf
    clear X Y
end