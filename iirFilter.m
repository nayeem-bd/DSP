%To implement LP IIR filter for a given sequence
%Show the magnitude response and phase response of IIR filter

clc;
clear all;
close all;

disp('Enter the IIR filter design specifications');
rp = input('Enter the passband ripple:');
rs = input('Enter the stopband ripple:');
wp = input('Enter the passband freq:');
ws = input('Enter the passband freq:');
fs = input('Enter the sampling freq:');
w1=2*wp/fs;
w2=2*ws/fs;
[n,wn] = buttord(w1,w2,rp,rs,'s');
disp('Frequency response of IIR LPF is:');
[b,a] = butter(n,wn,'low','s');
w = 0:0.1:pi;
[h,om] = freqs(b,a,w);
m = 20*log10(abs(h));
an = angle(h);
figure,subplot(211);plot(om/pi,m);
title('magnitude response of IIR filter is:');
xlabel('(a) Normalized freq.-->');
ylabel('Gain in dB-->');
subplot(212);
plot(om/pi,an);
title('phase response of IIR filter is:');
xlabel('(b) Normalized freq.-->');
ylabel('Phase in radians-->');

%INPUT
% passband ripple = 15
% stopband ripple = 60
% passband freq = 1500
% stopband freq = 3000
% sampling freq = 7000
