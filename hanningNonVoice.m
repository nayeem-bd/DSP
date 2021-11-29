clc;
clear all;
close all;

x = load('signals/plain');

M = 512;
ns = x(15001:15000+M);
subplot(221); plot(ns); title('Sample Signal'); grid;

% n = 0:M-1;
% ham = 0.54-0.46*cos(2*pi*n/(M-1));
for n = 0:M-1;
    han(n+1) = 0.5-0.5*cos(2*pi*n/(M-1));
end;

Os = ns.*han';
subplot(222); plot(Os); title('Frequency response of the Hanning window'); grid;

fx = fft(Os,M);
subplot(223); plot(fx); title('DFT'); grid;

ifx = ifft(fx,M);
subplot(224); plot(ifx); title('IDFT'); grid;
