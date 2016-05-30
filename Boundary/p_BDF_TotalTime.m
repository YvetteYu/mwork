% plot BDF number - total exp time 
clc; clear all; close all;
ExpName='dimer_exp8';
FilePath=['J:\Granule\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\'];
load([FilePath 'AvgDefect.mat'],'Exp_info');

wind=Exp_info.wind;
framenum=zeros(1,length(wind));
figure

for iwind=1:length(wind)
    load([FilePath num2str(wind(iwind)) '\velocity.mat'],'KEavg')
    hcolor=KEavg/800;
   
    load([FilePath num2str(wind(iwind)) '\Bdefect.mat'],'Boundefect');
    load([FilePath num2str(wind(iwind)) '\DefectNum.mat'],'defect5','defect7');
    NumBDF5=zeros(1,size(Boundefect,1));
    %NumBDF7=zeros(1,size(Boundefect,1));
    for frame=1:size(Boundefect,1)
        BDF=nonzeros(Boundefect(frame,:))';
        tempBDF5=BDF(ismember(BDF,defect5(frame,:)));
        %tempBDF7=BDF(ismember(BDF,defect7(frame,:)));
        NumBDF5(frame)=length(tempBDF5);
        %NumBDF7(frame)=length(tempBDF7);
        clear temp* BDF
    end
    tempNumBDF5=NumBDF5(1:10:end);
    %tempNumBDF7=NumBDF7(1:3:end);
    
    if iwind==1
        framenum(iwind+1)=length(tempNumBDF5);
    else
        framenum(iwind+1)=framenum(iwind)+length(tempNumBDF5);
    end
    
    time=[framenum(iwind)+1:framenum(iwind+1)];
    time=time/3;
    
    plot(time,tempNumBDF5,'Color',hsv2rgb([hcolor 75/100 80/100]));
    hold on
    %plot(time,defect5,'b');
    %hold on
end

%legend('th7','th5')
title('BDF-Total Exp Time','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('BDF Number ','fontsize',20);
saveas(gcf,[Located 'BDF_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'Defect_TotalTime.png']);
