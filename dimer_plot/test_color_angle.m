clc;clear all;close all;

X=0:10:180; Y=0:10:180;
theta=0:10:180;

for k=1:length(theta)
    if theta(k)<60 && theta(k)>=0
        Rcolor=1;
        Gcolor=theta(k)/60;
        Bcolor=1-theta(k)/60;
    elseif theta(k)>=60 && theta(k)<=120
        Rcolor=1-(theta(k)-60)/60;
        Gcolor=1;
        Bcolor=(theta(k)-60)/60;
    else
        Rcolor=(theta(k)-120)/60;
        Gcolor=1-(theta(k)-120)/60;
        Bcolor=1;
    end
    fprintf('R is %f\nG is %f\nB is %f\n',Rcolor,Gcolor,Bcolor);
    plot(X(k),Y(k),'o','MarkerSize',5,'Color',[Rcolor Gcolor Bcolor],...
        'MarkerFaceColor',[Rcolor Gcolor Bcolor])
    hold on
end