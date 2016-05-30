% to grab the central mass of particles.
function [th2Pnumber,X,Y,th2Labels] = myGrobCM(tempImg,...
    r_value,Std_r,roi,inputnum)
%--------------------------------------------------------------------------
% plus the ROI
%--------------------------------------------------------------------------
AfterImg(:,:)=single(tempImg(:,:));

%--------------------------------------------------------------------------
% threshold
%--------------------------------------------------------------------------
bw=abs(AfterImg(:,:)-r_value)>Std_r;
clear AfterImg;
%Bw=abs(Bw-1);
    % turn particle value=0 into 1
    
%--------------------------------------------------------------------------
% to erode and dilate
%--------------------------------------------------------------------------
se=strel('disk',1);
bw2=imdilate(bw ,se);
bw2=imdilate(bw2 ,se);
%bw2=imdilate(bw2 ,se);
%se=strel('disk',1);
bw2=imerode(bw2 ,se);

bw2=bw2.*roi;
%%

%--------------------------------------------------------------------------
% bwlabel to obtain a matrix and particles number
% there is an checking-area-loop
% if area is big enough it'll pass
% else the positions would be deleted (becomes 0)
% we do 'bwlabel' again, obtaining new matrix and particles number.
%--------------------------------------------------------------------------
[th1Labels,th1Pnumber]=bwlabel(bw2);
for k=1:th1Pnumber
    piece=th1Labels==k;
    % piece is logical matrix, size is same as label
    area=sum(sum(piece));
    if area<120
        th1Labels(th1Labels==k)=0;
    end
end
bwlabels=th1Labels~=0;
[th2Labels,th2Pnumber]=bwlabel(bwlabels);
%{
figure('visible','off')
imshow(th2Labels);hold on
saveas(gcf, sprintf([processfile 'bw%03d'],nowframe),'jpg');
close
%}
 
clear th1Labels th1Pnumber r_value Bw* bwlabels roi;

X=zeros(1,th2Pnumber);
Y=zeros(1,th2Pnumber);
R=zeros(1,th2Pnumber);

%--------------------------------------------------------------------------
% enter CM-loop to calculate CM position
%--------------------------------------------------------------------------
t=0;
for t=1:th2Pnumber
    piece=th2Labels==t;    
    xlimt=[1:length(th2Labels(1,:,1))]';
    ylimt=1:length(th2Labels(:,1,1));
    total_mass=sum(sum(piece));
    R(t)=sqrt((total_mass)/pi);
    Y(t)=sum(sum(ylimt*piece))/total_mass;
    X(t)=sum(sum(piece*xlimt))/total_mass;

end

extra=0;
% This part need to modify
    n=1;
    m=length(X);
    while m>inputnum & n==inputnum+1       
        Xtemp=X(n);
        Ytemp=Y(n);
        [distance]=mydistance(Xtemp,Ytemp,X,Y);
        ind=find(distance~=0 & distance<25);
        if isempty(ind)==0
            extra=extra+length(ind);
            X(n)=(X(n)+sum(X(ind)))/(length(ind)+1);
            X(ind)=[];
            Y(ind)=[];
        end
        m=length(X);
        n=n+1;
    end
th2Pnumber=th2Pnumber-extra;
clear piece tempImg; 
end
