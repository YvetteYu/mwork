clc;clear all;close all;
ExpName='monomer_exp710';
Located=['C:/Users/user/Dropbox/Exp/' ExpName '/Datanalysis/trajectory/slow/'];
File = ['J:/Granule/' ExpName '/'];

load([File 'exp_parameter.mat'],'Exp_info');
wind=7:10;
count=5;
t=0:0.01:2*pi;

figure
for iwind=1:length(wind)
    fprintf(fp,'The wind is %d\r\n',wind(iwind));
    load([File 'ref/' num2str(wind(iwind)) '/tra.mat'],'B*');
    displacement=mydistance(BX(end,:),BY(end,:),BX(1,:),BY(1,:));
    [value index]=sort(displacement,'descend'); %fast
    % [value index]=sort(displacement); %slow
    index=index(1:count);
  
    clear displacement value
    
    cx=Exp_info.BCenter(1)+Exp_info.BRadius*cos(t);
    cy=Exp_info.BCenter(2)+Exp_info.BRadius*sin(t);
    plot(cx,cy,'k.','MarkerSize',3)
    hold on
    plot(BX(:,index),BY(:,index))
    daspect([1 1 1]);
    set(gca,'YDir','reverse');
    print(gcf,'-dpng','-r100',[Located num2str(wind(iwind)) '.png'])
    clf
end
fclose(fp)