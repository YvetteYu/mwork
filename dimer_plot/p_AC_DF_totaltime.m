% Ndefect-B1DF and AC - total exp time 
clc; clear all; close all;
ExpName='dimer_exp7';
FilePath=['J:/Granule/' ExpName '/ref/'];
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/'];
load([FilePath 'AvgDefect.mat'],'Exp_info');
wind=Exp_info.wind;
load([FilePath num2str(wind(1)) '/DefectNum.mat'],'th5');

skip=10; span=11; head=1;
defectmax=25;defectmin=0;
acmax=1;acmin=0.5;

framenum=length(th5)*length(wind)/skip;
defect5=zeros(1,framenum); defect7=zeros(1,framenum);
AC=zeros(1,framenum);
clear framenum th5

figure
for iwind=1:length(wind)
    load([FilePath num2str(wind(iwind)) '/DefectNum.mat'],'th5','th7');
    load([FilePath num2str(wind(iwind)) '/Bdefect.mat'],'NumB1DF*');
    load([FilePath num2str(wind(iwind)) '/AvgAC.mat'],'AvgAC');    
    tempdefect5=th5(1:skip:end)-NumB1DF5(1:skip:end);
    tempdefect7=th7(1:skip:end)-NumB1DF7(1:skip:end);
    tail=head+length(tempdefect5)-1;
    defect5(head:tail)=tempdefect5;
    defect7(head:tail)=tempdefect7;
    tempAC=AvgAC(1:skip:end);
    AC(head:tail)=tempAC; 
    head=1+tail;
    clear temp* th* AvgAC
end

smdefect5=smooth(defect5,span);
smdefect7=smooth(defect7,span);
smAC=smooth(AC,5);
time=(1:tail)*skip/30;

%% set the data limit
 %[defectmax defectmin]=myLimit(defect5,defect7,5);
 %[acmax acmin]=m_Limit(AC,0.05);

%% plot defect and AC
plot(time,defect7,'Color',[0 0.8 0.4],'LineWidth',1);hold on
[hAx hdefect5 hAC]=plotyy(time,defect5,time,AC);

%% set the position of figure
axposition=get(hAx(1),'Position');
newposition=[axposition(1) axposition(2) axposition(3)-0.06 axposition(4)-0.04];

%% set the axis

set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',1);
set(hAC,'Color',[1 0.2 0.2],'LineWidth',1);
grid on

set(hAx(1),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(1),'YLim',[defectmin defectmax],'YTick',defectmin:5:defectmax);
set(hAx(2),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(2),'YLim',[acmin acmax],'YTick',acmin:0.05:acmax);

hl=legend('Defect7','Defect5','AC');box off;
set(hl,'FontSize',10);

title('Defect and AC - Total Exp Time','fontsize',24);
xlabel('time(s) ','fontsize',20);
ylabel(hAx(1),'Defect Number ','fontsize',20,'Color','k');
ylabel(hAx(2),'Angle Correlation ','fontsize',20,'Color','k');

print(gcf,'-dpng', '-r200','test.png');
saveas(gcf,[Located 'AC_Defect/AC_Defect.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC_Defect/AC_Defect.png']);
%}
clf;clear h*
%{
%% plot soomth defect and AC
plot(time,smdefect7,'Color',[0 0.8 0.4],'LineWidth',2);hold on
[hAx hdefect5 hAC]=plotyy(time,smdefect5,time,AC);

%% set the axis
set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',2);
set(hAC,'Color',[1 0.2 0.2],'LineWidth',1);

set(hAx(1),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(1),'YLim',[defectmin defectmax],'YTick',defectmin:5:defectmax);
set(hAx(2),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(2),'YLim',[acmin acmax],'YTick',acmin:0.05:acmax);

hl=legend('Defect7','Defect5','AC');box off;
set(hl,'FontSize',10);

title('Smooth Defect- AC','fontsize',24);
xlabel('time(s) ','fontsize',20);
ylabel(hAx(1),'Defect Number ','fontsize',20,'Color','k');
ylabel(hAx(2),'Angle Correlation ','fontsize',20,'Color','k');

saveas(gcf,[Located 'AC_Defect/AC_smDefect.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC_Defect/AC_smDefect.png']);
clf;clear h*
%}
%% plot soomth defect and smooth AC
plot(time,smdefect7,'Color',[0 0.8 0.4],'LineWidth',2);hold on
[hAx,hdefect5,hAC]=plotyy(time,smdefect5,time,smAC);

%% set the axis
set(hdefect5,'Color',[0 0.4 0.8],'LineWidth',2);
set(hAC,'Color',[1 0.2 0.2],'LineWidth',2);
grid on

set(hAx(1),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(1),'YLim',[defectmin defectmax],'YTick',defectmin:5:defectmax);
set(hAx(2),'FontSize',20,'YColor','k','Position',newposition);
set(hAx(2),'YLim',[acmin acmax],'YTick',acmin:0.05:acmax);

hl=legend('Defect7','Defect5','AC');box off;
set(hl,'FontSize',10);

title('Smooth Defect - Smooth AC','fontsize',24);
xlabel('time(s) ','fontsize',20);
ylabel(hAx(1),'Defect Number ','fontsize',20,'Color','k');
ylabel(hAx(2),'Angle Correlation ','fontsize',20,'Color','k');

saveas(gcf,[Located 'AC_Defect/smAC_smDefect.fig']);
print(gcf,'-dpng', '-r200', [Located 'AC_Defect/smAC_smDefect.png']);
%}