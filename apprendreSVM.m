%function [w,d] = apprendreSVM(X,Y,C)
%APPRENDRESVM Summary of this function goes here
%   Detailed explanation goes here

% w = marge - a maximiser )
clc
load defautsrails.mat

C = 1

un = ones(140,1);
d = 0;

xi = 0.25;

un = 1 - 0.25;

un = -un;

X;

xi = 0.25

%h = zeros(141,141);
%h(1,1) = 1
%h  = 1 
%f = 1%ones(141,1);
%A = X'% ones(141,1) 
%b = ones(1,141)-xi

%h = [1 0 ; 0 0]
%f = [0 1]*c*xi
h = zeros(141)
h(1,1)=1
f = ones(141,1)
a = X.*Y.+Y
b = ones(141,1)

size(a)
size(b)
[w,bb] = quadprog(h,f,a,b);
%w
%bb
%end