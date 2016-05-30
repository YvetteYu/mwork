% This program allow user try and error the DC and fitting slope
clc;clear all;close all
ExpName='dimer_exp19';
Located= ['C:/Users/user/GoogleDrive/Exp/' ExpName '/Datanalysis/Fitting/'];
ProcessFile = ['C:/Users/user/GoogleDrive/Exp/' ExpName '/ref/'];
load([ProcessFile 'exp_parameter.mat'],'Exp_info');
wind=260;
refx=0.1:0.1:500;
alpha=1.25;
DC=78;

%%
figure  
filename=num2str(wind);
%{
load([ProcessFile filename '/DiffusionCOe.mat'],'AvgMSD');
timea=1:length(AvgMSD);
timea=timea/30;
loglog(timea,AvgMSD,'Color',[0 0.5 0.3],'Marker','o',...
    'MarkerSize',3,'MarkerFaceColor',[0 0.5 0.3]);
hold on
%}
load([ProcessFile filename '/SBDiffusionCoe.mat'],'AvgSubMSD');
AvgSubMSD(isnan(AvgSubMSD))=[];
timeb=1:length(AvgSubMSD);
timeb=timeb/30;
loglog(timeb,AvgSubMSD,'Color','m','Marker','o',...
    'MarkerSize',3,'MarkerFaceColor','m');
hold on

refy=DC*(refx.^alpha);
loglog(refx,refy,'--b','LineWidth',2)

legend('SubMSD',['alpha=' num2str(alpha)],'Location','northwest');
text(100,5,[' D =' num2str(DC) ' '],'FontSize',14,'Color','b','EdgeColor','k')
set(gca,'YLim',[0.01 10000])
set(gca,'YTick',[ 0.01 0.1 1 10 100 1000 10000])
set(gca,'YGrid','on','YMinorGrid','off','FontSize',16)

title(['Fitting' filename],'fontsize',18,'fontweight','b');
xlabel('Time interval (s) ','fontsize',18);
ylabel('MSD (mm)^2 ','fontsize',20);
print(gcf,'-dpng', '-r200', [Located filename '.png']);
