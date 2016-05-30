clc;clear all;close all
wind=215:5:250;
Dexp=[0 0 13/16 5/8 3/4 1/2 5/8 7/8; ...
      0 0 72/480 198/480 0 1/3 1 15/16];

plot(wind,Dexp(1,:),'r^','LineStyle','none','MarkerSize',10,'MarkerFaceColor','r');
hold on
plot(wind,Dexp(2,:),'bo','LineStyle','none','MarkerSize',10,'MarkerFaceColor','b');

set(gca,'ylim',[0 1],'FontSize',18);
xlabel('wind','FontSize',18);
ylabel('time ratio of Moving/Frozen','FontSize',18);
