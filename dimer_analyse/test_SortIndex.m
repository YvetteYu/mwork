clc;clear all;close all;
test=[1:100;1:100];
index=randi([1 100],[1 5]);
index=sort(index)
test(:,index)=[];
for i=1:length(index)
    j=i-1;
    test(:,(index(i)-j):end)=test(:,(index(i)-j):end)-1;
end