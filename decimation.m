clc;
clear all;
close all;

f1 = input('Enter first frequency: ');
f2 = input('Enter second frequency: ');
D = input('Factor of D: ');
l = input('Length: ');
l = (l-1)/100;

n = 0:0.01:l;

x = sin(2*pi*f1*n) + sin(2*pi*f2*n);

subplot(211);
stem(x); title('Orginal Signal');

y = decimate(x,D,'fir');
subplot(212);
stem(y);
title('After Decimation');