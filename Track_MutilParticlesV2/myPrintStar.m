function []= myPrintStar(nowframe,OriImg,th2Pnumber,X,Y,processfile)

%--------------------------------------------------------------------------
% print '*' on the original pic to check the CM is correct.
% save the CM into a txt file
%--------------------------------------------------------------------------
%txtName=sprintf('%04d.txt',nowframe);
%fp=fopen([processfile txtName],'w');

%{
for t=1:th2Pnumber
    fprintf(fp,'%f %f\t',X(t),Y(t));       
end
fclose(fp);
%}
        figure('visible','off')
        imshow(OriImg);hold on
        for t=1:th2Pnumber
        plot(X(t),Y(t),'y*');    
        end
        saveas(gcf, sprintf([processfile 'after%03d'],nowframe),'jpg');
        close
        pause(0.1)
        clear OriImg 
end


