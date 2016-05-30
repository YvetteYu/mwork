clc;clear all;close all;
fp=fopen('/Users/missyvetteyu/Desktop/Voltage_test.txt','w');
interval=0.06;
begin=1.66;
terminate=2.62;
time=60;
Thend=(terminate-begin)/interval;
%%
for t=1:Thend
    NextStep=begin+interval;
    fprintf(fp,'change %0.2f %0.2f %d\n',begin,NextStep,time);
    if t<4
        fprintf(fp,'hold %0.2f %d\n',NextStep,8*time);
    else
        fprintf(fp,'hold %0.2f %d\n',NextStep,11*time);
    end
    begin=NextStep;
end
fclose(fp)