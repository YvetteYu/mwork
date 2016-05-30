%2. connect the pair particles by manual click 100 times.  
clc;clear all;close all

str=10;
% ******** you have to manual change these parameter********
 File = '/Users/missyvetteyu/Desktop/temp/TimeSerial_DimerOrder/';
  %after processing, the data will be saved here.
 load([File 'CM/' num2str(str) '.mat'],'X','Y');
 OriImg=imread([File 'pic/' num2str(str) '_' num2str(str+1) 'pm.jpg']);
 pnumber=98;   
 first=50;
 second=30;
 third=10;
 forth=8;
%% click

figure
imshow(OriImg);hold on

text(500,0,'click 50,30,10,8 times');
text()
[Xtemp1 Ytemp1]=ginput(first);
for n=1:first
plot(round(Xtemp1(n)),round(Ytemp1(n)),'g+');
end
hold on
[Xtemp2 Ytemp2]=ginput(second);
for n=1:second
plot(round(Xtemp2(n)),round(Ytemp2(n)),'g+');
end
hold on
[Xtemp3 Ytemp3]=ginput(third);
for n=1:third
plot(round(Xtemp3(n)),round(Ytemp3(n)),'g+');
end
hold on
[Xtemp4 Ytemp4]=ginput(forth);
for n=1:forth
plot(round(Xtemp4(n)),round(Ytemp4(n)),'g+');
end

hold on
pause
close
%% combine the ginput points

Xhead=[Xtemp1(1:2:first);Xtemp2(1:2:second);Xtemp3(1:2:third);Xtemp4(1:2:forth)];
Yhead=[Ytemp1(1:2:first);Ytemp2(1:2:second);Ytemp3(1:2:third);Ytemp4(1:2:forth)];
Xtail=[Xtemp1(2:2:first);Xtemp2(2:2:second);Xtemp3(2:2:third);Xtemp4(2:2:forth)];
Ytail=[Ytemp1(2:2:first);Ytemp2(2:2:second);Ytemp3(2:2:third);Ytemp4(2:2:forth)];
clear Xtemp* Ytemp*
%% find and save index
for t=1:pnumber/2
[dishead(t) indhead(t)]=min((Xhead(t)-X(1,:)).^2+(Yhead(t)-Y(1,:)).^2);
[distail(t) indtail(t)]=min((Xtail(t)-X(1,:)).^2+(Ytail(t)-Y(1,:)).^2);
end
index=[indhead;indtail] % first pair=index(:,1);
                        % value of index = Pi = BX(1, Pi)
clear *head *tail
save([File 'ref/' num2str(str) 'pair.mat'],'index');

figure('visible','off')
imshow(OriImg);hold on

for t=1:pnumber
        ParticleNo=sprintf('%d',t);
    text(X(t)+1,Y(t)+1,ParticleNo);
end

print(gcf,'-dpng','-r200',['/Users/missyvetteyu/Desktop/temp/TimeSerial_DimerOrder/CM/' num2str(str) 'tracking.png']);


