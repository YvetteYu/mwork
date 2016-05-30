function []=myExtraParticles(X,Y,extra,ProcessFile,nowframe)

strtxt=sprintf('%03d.txt',nowframe);
disable=zeros(1,extra);

for t=1:length(X)
    for k=1:length(X)
        if k==t
            continue
        else
            d=sqrt((X(t)-X(k))^2+(Y(t)-Y(k))^2);
        end
        if d<30
            disable=k;
        end
    end
end

X(disable)=[];
Y(disable)=[];

fp=fopen([ProcessFile strtxt],'w');
for t=1:length(X)
    fprintf(fp,'%f %f\t',X(t),Y(t));
end
fclose(fp);

end