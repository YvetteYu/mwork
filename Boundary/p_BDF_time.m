clc;clear all;close all;
ExpName='monomer_exp3';
File=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\'];
load([File 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
figure('visible','off')
hold on
for iwind=1:length(wind)
    load([File num2str(wind(iwind)) '\Bdefect.mat'],'Boundefect');
    load([File num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');
    
    for frame=1:size(Boundefect,1)
        BDF=nonzeros(Boundefect(frame,:))';
        tempBDF5=BDF(ismember(BDF,defect5(frame,:)));
        tempBDF7=BDF(ismember(BDF,defect7(frame,:)));
        NumBDF5(frame)=length(tempBDF5);
        NumBDF7(frame)=length(tempBDF7);
        clear temp* BDF
    end
    tempNumBDF5=NumBDF5(1:3:end);
    tempNumBDF7=NumBDF7(1:3:end);
    
    %%
    open([ Located 'defect\DefectNum' num2str(wind(iwind)) '.fig' ]);
    hold on
    time=(0:1:(length(tempNumBDF5)-1))/10;
    plot(time,tempNumBDF5,'--r')
    hold on
    plot(time,tempNumBDF7,'--b')
    print(gcf,'-dpng','-r100',[Located 'BDF\' num2str(wind(iwind)) '.png']);
    clf
end