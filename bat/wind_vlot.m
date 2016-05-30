clc;clear all;close all;
fp=fopen('/Users/missyvetteyu/Desktop/test2.txt','w');
holdtime=30;
changetime=10;
for t=45:(-1):16
    fprintf(fp,['hold %1.1f %d\n' ...
    'change %1.1f %1.1f %d\n'],t/10,holdtime,t/10,(t-1)/10,changetime);
end
fclose(fp)
