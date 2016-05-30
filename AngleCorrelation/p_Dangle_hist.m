clc;clear all;close all;
ExpName='dimer_exp11';
File=['C:\Users\user\Dropbox\Exp\\' ExpName '\ref\'];
Located=['C:\Users\user\Dropbox\Exp\' ExpName '\Datanalysis\AngleHist\'];
load([File 'AvgDefect.mat'],'Exp_info');

wind=76;
load([File num2str(wind) '\inf_orientation.mat'],'theta');
frame=[16500 17550];
binranges=-1.6:0.25:1.6;

figure
for iframe=1:length(frame)
    Dangle=theta(frame(iframe),:);
    [bincounts]=histc(Dangle,binranges);
    bincounts=bincounts/sum(bincounts);
    bar(binranges,bincounts,'histc')
    title('Dimer Angle Distribution','fontsize',24,'fontweight','b');
    xlabel('Arc Angle ','fontsize',20);
    ylabel('Probability(counts/sum) ','fontsize',20);
    print(gcf,'-dpng', '-r200', [Located num2str(wind+1) '_' num2str(frame(iframe)) '.png']);
    clf
end
%}
%{
wind=[80 110 120];
frame=[30 3 3]*450;
binranges=-1.6:0.2:1.6;
bincounts=zeros(length(binranges),3);
for iwind=1:length(wind)
    load([File num2str(wind(iwind)) '\inf_orientation.mat'],'theta')
    Dangle=theta(frame(iwind),:);
    [temp]=histc(Dangle,binranges);
    %bincounts(:,iwind)=temp\sum(temp);
    bincounts(:,iwind)=temp;
    clear temp theta Dangle
end

bar(binranges,bincounts,'histc')
set(gca,'FontSize',20);
hleg=legend('80','110','120');
set(hleg,'Location','NorthEast','FontSize',12);
title('Dimer Angle Distribution','fontsize',24,'fontweight','b');
xlabel('Arc Angle ','fontsize',20);
ylabel('Probability(counts\sum) ','fontsize',20);
print(gcf,'-dpng', '-r200', [Located 'hist.png']);
%}
    