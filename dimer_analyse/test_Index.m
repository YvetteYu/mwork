% test index
clc;clear cll;close all;

str=num2str(23);
frame=200;
ProcessFile = '/Users/missyvetteyu/Desktop/temp/dimer/dimers_exp1/';
load([ProcessFile 'ref/' str '/tra.mat'],'BX','BY');
load([ProcessFile 'ref/' str '/pair.mat'],'index');
pic=dir([ProcessFile 'pic/v' str '/*.jpg']);
%%

img=imread([ProcessFile 'pic/v' str '/' pic(frame).name]);
Xtemp=BX(frame,:);
Ytemp=BY(frame,:);
figure
imshow(img)
hold on
for t=1:5:50
    plot(Xtemp(index(1,t)),Ytemp(index(1,t)),'Marker','*','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    plot(Xtemp(index(2,t)),Ytemp(index(2,t)),'Marker','*','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    
    plot(Xtemp(index(1,t+1)),Ytemp(index(1,t+1)),'Marker','+','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    plot(Xtemp(index(2,t+1)),Ytemp(index(2,t+1)),'Marker','+','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    
    plot(Xtemp(index(1,t+2)),Ytemp(index(1,t+2)),'Marker','o','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    plot(Xtemp(index(2,t+2)),Ytemp(index(2,t+2)),'Marker','o','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    
    plot(Xtemp(index(1,t+3)),Ytemp(index(1,t+3)),'Marker','x','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    plot(Xtemp(index(2,t+3)),Ytemp(index(2,t+3)),'Marker','x','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100]));
    hold on
    
    plot(Xtemp(index(1,t+4)),Ytemp(index(1,t+4)),'Marker','s','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100])); 
    hold on
    plot(Xtemp(index(2,t+4)),Ytemp(index(2,t+4)),'Marker','s','LineWidth',2,'LineStyle','none',...
        'MarkerSize',10,'Color',hsv2rgb([30*(t/5)/359 75/100 80/100])); 
    hold on
end