%To write a matlab program of FIR low pass filter using rectangular,Hanning
%Hamming ,Blackman and Kaise window.

clc;
clear all;
close all;

wc = 0.5*pi;  %wc = normalized cutoff frequency ( 0 > wc < 1 )
N = 25;  % N = order of filter;
w = 0:0.1:pi;
b = fir1(N,wc/pi,blackman(N+1));
h = freqz(b,1,w);
subplot(321); plot(w/pi,abs(h)); grid;
xlabel('normalised frequency');
ylabel('magnitude in dB');
title('FIR LPF USING BLACKMAN WINDOW');
b = fir1(N,wc/pi,hamming(N+1));
h = freqz(b,1,w);
subplot(322); plot(w/pi,abs(h)); grid;
xlabel('normalised frequency');
ylabel('magnitude in dB');
title('FIR LPF USING HAMMING WINDOW');
b = fir1(N,wc/pi,hanning(N+1));
h = freqz(b,1,w);
subplot(323); plot(w/pi,abs(h)); grid;
xlabel('normalised frequency');
ylabel('magnitude in dB');
title('FIR LPF USING HANNING WINDOW');
b = fir1(N,wc/pi,kaiser(N+1,3.5));
h = freqz(b,1,w);
subplot(324); plot(w/pi,abs(h)); grid;
xlabel('normalised frequency');
ylabel('magnitude in dB');
title('FIR LPF USING KAISER WINDOW');
