%sub function:                  * Star_ori = Original image
% myROI   :                     *
% myImgProcess                  * Star_OneLayer = after image process, it
%                                      becomes single layer image
% myAbsorbColor                 *
% myGrobCM                      * Star_bwImg = after threshold
% myPrintStar :print * and save the .mat file  *

clc; clear all; close all;

figure('visible','off')
ExpName='TestExp/exp6';
load(['J:/Granule/' ExpName '/ref/exp_parameter.mat'],'Exp_info');
file=Exp_info.wind;
%%
for ft=6%:length(file)
    tic % start timer
    counter=0;
    %% set the parameter
    str=num2str(file(ft));
    OriginalFile = ['J:/Granule/OriginalData/' ExpName '/pic/' str '/'];
    % input the path where the file you want to process located.
    
    ProcessFile = ['J:/Granule/' ExpName '/CM/' str '/'];
    % after processing, the data will be saved here.
    
    R_value=0;
    Std_r=33;
    nowframe=1;   % which frame you want to start with?
 
    inputnum=127;%Exp_info.Pnumber;
    target=Exp_info.ParColor;
    [other1 other2]=mycolor(target);
    roi=Exp_info.roi;
    OriginalImg = dir([OriginalFile '*.png']);
    note=fopen([ProcessFile 'Note.txt'],'w');
    fprintf(note,'frame number\r\n');
    %% image process
    
    %while nowframe<=1000
    while nowframe<=length(OriginalImg)
        
        
        Star_oriImg = imread([OriginalFile OriginalImg(nowframe).name]);
        Star_OneLayerImg=myImgProcess(Star_oriImg,target,other1,other2);
         % Star_OneLayerImg is one single layer image.
        
        
        %% calculate CM
        
        [pnumber,X,Y,Star_bwImg]=myGrobCM(Star_OneLayerImg,...
            R_value,Std_r,roi,inputnum);
        
        if pnumber~=inputnum
            
            counter=counter+1;
            fprintf(note,'%d ',nowframe);
            imshow(Star_oriImg);hold on
            for t=1:pnumber
                plot(X(t),Y(t),'r*');
            end
            print(gcf,'-dpng', '-r200', [ProcessFile sprintf('wrong%05d.png',nowframe)]);
            
            clf
            imshow(Star_bwImg);hold on
            print(gcf,'-dpng', '-r200', [ProcessFile sprintf('bw%05d.png',nowframe)]);
            clf
        end
        matName=sprintf('%05d.mat',nowframe);
        save([ProcessFile matName],'X','Y');
        
        %if rem(nowframe,10)==0 % you save 1 picture per processing 10 pictures.
        %   myPrintStar(nowframe,Star_oriImg,pnumber,X,Y,ProcessFile)
        %end
        
        clear Star_OneLayerImg Star_oriImg Star_bwImg X Y;
        nowframe = nowframe+1;
        
    end
    total_time=toc;
    total_time=round(total_time);
    fprintf(note,['\r\n\r\n-------------------\r\n '...
        'data information\r\n'...
        'wrong frame number=%d\r\n'...
        'total frames=%d\r\n'...
        'total time:%d'],counter,nowframe,total_time);
    fclose(note);
   clc;close all
end
exit
