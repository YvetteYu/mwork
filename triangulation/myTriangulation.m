% plot trigulations by using CM.txt
% It output pictures and triangle.mat
function []=myTriangulation(X,Y,nowframe,framerate,file,pnumber,afterfile,interval,h,w)
X=X';
Y=Y';
figure('visible','off')
dt = DelaunayTri(X,Y);
triplot(dt,'LineStyle','-','LineWidth',2,'Color',[180/255 180/255 180/255]);   
hold on
time=sprintf('%2.3f',(nowframe-1)/framerate);
text(1,1,'.');
hold on
xlim([0 w]);
ylim([0 h]);

%%
for t=1:pnumber
    check=dt.Triangulation(:,:,:) == t;
    term=sum(sum(check));
    if term==5
        plot(X(t),Y(t),'o','MarkerSize',10,'MarkerFaceColor',[0.9 0.5 0],...
            'MarkerEdgeColor',[0.9 0.5 0]);
        hold on;
    end
    if term==7
        plot(X(t),Y(t),'^','MarkerSize',10,'MarkerFaceColor',[0 0.5 0]...
            ,'MarkerEdgeColor',[0 0.5 0]);
        hold on;
    end
end
axis off; daspect([1 1 1]);
set(gca,'YDir','reverse','xlim',[0 w],'ylim',[0 h])
text(w-40,h-10,time,'FontSize',14);
imgnum=(nowframe-1)/interval+1;
imgname=sprintf('%05d',imgnum);
print(gcf,'-dpng','-r50',[afterfile 'triangular\pic\' file '\' imgname '.png']);
close all;
clear all;
end
