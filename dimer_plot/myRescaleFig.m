function [Newfiguresize]=myRescaleFig(width,height)

set(gcf,'PaperUnit','centimeters')
papersize=get(gcf,'PaperSize');
left=(papersize(1)-width)/2;
bottom = (papersize(2)-height)/2;
Newfiguresize=[left,bottom,width,height];

end