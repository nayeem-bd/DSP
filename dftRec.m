clc;
clear all;
close all;

DFT_points = 8;
j = sqrt(-1);
Fs = 8e3;
ts = 1/Fs;

for n = 1:DFT_points;
    m = n-1;
    x(n) = sin(2*pi*1000*m*ts)+0.5*sin(2*pi*2000*m*ts+(3*pi/4));
end;

N = DFT_points;
X = zeros(1,N);
X_real = zeros(1,N);
X_imag = zeros(1,N);
X_mag = zeros(1,N);
X_ang_rad = zeros(1,N);
X_ang_deg = zeros(1,N);

for m=0:N-1;
    X_1 = 0;
    for n = 0:N-1;
        Xx = x(n+1)*(cos(2*pi*n*m/N)-j*sin(2*pi*n*m/N));
        X_1 = X_1+Xx;
    end;
    X(m+1) = X_1;
end;

for i = 1:N;
    X_real(i) = real(X(i));
    if abs(X_real(i)) < 1e-10;
        X_real(i) = 0;
    end;
    X_imag(i) = imag(X(i));
    if abs(X_imag(i)) < 1e-10;
        X_imag(i) = 0;
    end;
    X_mag(i) = sqrt(X_real(i)^2 + X_imag(i)^2);
    X_ang_rad(i) = atan(X_imag(i)/X_real(i));
    X_ang_rad(isnan(X_ang_rad)) = 0;
    X_ang_deg(i) = (180/pi)*X_ang_rad(i);
end;
    
    mf = 0:N-1;
    figure;    
    stem(X_real,'b--o');
    grid on;
    title('Real part');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(X_imag,'b--o');
    grid on;
    title('Imaginary part');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(X_mag,'b--o');
    grid on;
    title('Magnitude');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(X_ang_deg,'b--o');
    grid on;
    title('Phase angle');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    