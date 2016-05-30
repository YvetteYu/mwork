% Under same airflow rate, print the first frame X Y on the other
% later frames,
clc;close all;clear all;
exp='dimer_exp5';
FilePath=['/Users/missyvetteyu/Dropbox/Exp/' exp '/'];
load([FilePath 'ref/AvgDefect'],'Exp_info');
wind=Exp_info.wind;

figure('visible','off')
for t=1:length(wind)
    load([FilePath 'CM/' num2str(wind(t)) '.mat']);
    frame=dir([FilePath 'pic2/' num2str(wind(t)) '/*png']);
    for iframe=1:length(frame)
        img=imread([FilePath 'pic2/' num2str(wind(t)) '/' frame(iframe).name]);
        imshow(img)
        hold on
        for par=1:100
            plot(X(par),Y(par),'yo','MarkerSize',13,'MarkerFaceColor','g');
            hold on
        end
        print(gcf,'-dpng','-r100',[FilePath 'shift_pic/' num2str(wind(t))...
            '/' frame(iframe).name]);
    end
    clf;clear img
end
