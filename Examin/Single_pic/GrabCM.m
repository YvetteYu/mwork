%% crop image
clear all; clc; close all;
ExpName='';
Original=[ '/Users/yvette/Pictures/test/'];
Process=['/Users/yvette/Pictures/test/'];
load(['/Users/yvette/Pictures/test//exp_parameter.mat']);
wind='270';
frame=[1 2];
roi=Exp_info.roi;
inputnum=Exp_info.Pnumber;
figure%('visible','off')

for iframe=1:length(frame)
img=imread([Original wind '/' num2str(frame(iframe),'%05d') '.png']);

%% image process
tempimg=img(:,:,3)-0.5*img(:,:,1)-0.5*img(:,:,2);
afterimg(:,:)=single(tempimg(:,:));
r_mean=0;
r_std=27;
clear tempimg
% threshold
bw1=abs(afterimg(:,:)-r_mean)>r_std;
%bw1=abs(bw1-1);
% to erode and dilate

se=strel('disk',1);
bw0=imdilate(bw1 ,se);
bw0=imdilate(bw0 ,se);
%bw0=imdilate(bw0 ,se);
%bw0=imdilate(bw0 ,se);
%bw0=imerode(bw0 ,se);
bw0=imerode(bw0 ,se);
bw0=bw0.*roi;
imshow(bw0);
clear 'r_*' afterimg
print(gcf,'-dpng','-r200',[Process 'CM/temp/' num2str(frame(iframe),'%05d') 'bw.png']);
clf
%figure
%% calculate CM
[th1Labels,th1Pnumber]=bwlabel(bw0);
for k=1:th1Pnumber
    piece=th1Labels==k;
    % piece is logical matrix, size is same as label
    area=sum(sum(piece));
    if area<150
        th1Labels(th1Labels==k)=0;
        
    end
end
%%
bwlabels=th1Labels~=0;
[th2Labels,th2Pnumber]=bwlabel(bwlabels);
clear th1Labels th1Pnumber bw* bwlabels;

X=zeros(1,th2Pnumber);
Y=zeros(1,th2Pnumber);
R=zeros(1,th2Pnumber);

%--------------------------------------------------------------------------
% enter CM-loop to calculate CM position
%--------------------------------------------------------------------------
%%
t=0;

while t<th2Pnumber
    t=t+1;
    piece=th2Labels==t;    
    Xlimt=[1:length(th2Labels(1,:,1))]';
    Ylimt=1:length(th2Labels(:,1,1));
    total_mass=sum(sum(piece));
    R(t)=sqrt((total_mass)/pi);
    Y(t)=sum(sum(Ylimt*piece))/total_mass;
    X(t)=sum(sum(piece*Xlimt))/total_mass;
    
end
%%
extra=0;
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
    clear n m t
th2Pnumber=th2Pnumber-extra;
imshow(img);hold on
for t=1:th2Pnumber
    plot(X(t),(Y(t)),'y*','LineWidth',2);
    hold on
end

print(gcf,'-dpng','-r200',[Process 'CM/temp/' num2str(frame(iframe),'%05d') 'after.png']);
save([Process 'CM/temp/' num2str(frame(iframe),'%05d') '.mat'],'X','Y');
clear X Y th2* img
clf
end
