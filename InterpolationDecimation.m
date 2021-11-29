clc;
clear all;
close all;

f1 = input('Enter first frequency: ');
f2 = input('Enter second frequency: ');
D = input('Factor of D: ');
L = input('Factor of L: ');
l = input('Length: ');
l = (l-1)/100;
n = 0:0.01:l;

x = sin(2*pi*f1*n) + sin(2*pi*f2*n);

subplot(211);
stem(x); title('Orginal Signal');

y = resample(x,L,D);
subplot(212);
stem(y); title('After L/D');