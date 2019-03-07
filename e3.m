
clc

load defautsrails.mat

[w,b] = apprendreSVM(X,Y,0);

a = sprintf("%d %d" ,w,b);


disp(a);