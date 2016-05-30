% plot defect fraction
clc;clear all;close all;
ExpName='dimer_exp19';
File=[ '/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/ref/'];
Located=['/Users/missyvetteyu/GoogleDrive/Exp/' ExpName '/Datanalysis/defect/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
%%
for iwind=1:length(wind)
    load([File num2str(wind(iwind)) '/DefectNum.mat'],'th*');
    load([File num2str(wind(iwind)) '/Bdefect.mat'],'NumB1*');
    DFraction=(th5+th7-NumB1DF5-NumB1DF7);
    DFraction=DFraction/Exp_info.Pnumber;
    time=( 0:(length(DFraction)-1) )/30;
    plot(DFraction,'b.','LineStyle','none')
    set(gca,'FontSize',16,'Ylim',[0 1])
    title(num2str(wind(iwind)));
    xlabel('Time(s) ','fontsize',20);
    ylabel('Defect Fraction ','fontsize',20);
    print(gcf,'-dpng', '-r150', [Located 'DFraction' num2str(wind(iwind)) '.png']);
    pause
    clf
end
