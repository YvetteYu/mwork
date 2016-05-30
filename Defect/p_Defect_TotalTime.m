% plot defect number - total exp time 
clc; clear all; close all;
ExpName='dimer_exp19';
File=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/ref/'];
Located=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/Datanalysis/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
frame=zeros(1,length(wind));
ylimit=[0 40];
wind5color=[0 0.5 0.8;1 0.2 0.2];
wind7color=[0 0.2 0.5;0.4 0.1 0.1];
figure
for iwind=1:length(wind)
    remainder=rem(iwind,2)+1;
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([File num2str(wind(iwind)) '/Bdefect.mat'],'NumB1*');

    if iwind==1
        frame(iwind+1)=length(th5);
    else
        frame(iwind+1)=frame(iwind)+length(th5);
    end
    temptime=frame(iwind)+1:frame(iwind+1);
    temptime=temptime/30;
    defect7=th7-NumB1DF7;
    defect5=th5-NumB1DF5; 
    plot(temptime,defect5,'Color',wind5color(remainder,:));hold on
    plot(temptime,defect7,'Color',wind7color(remainder,:));hold on
end
set(gca,'FontSize',20,'xlim',[0 temptime(end)+10],'ylim',ylimit);

title('Defect-Total Exp Time','fontsize',24,'fontweight','b');
xlabel('time(s) ','fontsize',20);
ylabel('Defect Number ','fontsize',20);
saveas(gcf,[Located 'defect/Defect_TotalTime.fig']);
print(gcf,'-dpng', '-r200', [Located 'defect/Defect_TotalTime.png']);
