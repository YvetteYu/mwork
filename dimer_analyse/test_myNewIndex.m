clear all;close all;clc;

index=[1 3 5 7 9 11;2 4 6 8 10 12];
X=[4 2 -5 -1 6 7 5 2.5 6 8 -3 -3];
Y=[5 2 1 2.5 4.5 2 -3 -1 -2 -2 -1.5 -5];

 [index]=myNewIndex(index,X,Y)
 
 %%
 
  vector=[X(index(1,:))-X(index(2,:)) Y(index(1,:))-Y(index(2,:))]