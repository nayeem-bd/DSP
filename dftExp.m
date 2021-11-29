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
X_exp = zeros(1,N);
Xe_real = zeros(1,N);
Xe_imag = zeros(1,N);
Xe_mag = zeros(1,N);
Xe_ang_rad = zeros(1,N);
Xe_ang_deg = zeros(1,N);

for m=0:N-1;
    X_1 = 0;
    for n = 0:N-1;
        X = x(n+1)*exp(-j*2*pi*n*m/N);
        X_1 = X_1+X;
    end;
    X_exp(m+1) = X_1;
end;

for i = 1:N;
    Xe_real(i) = real(X_exp(i));
    if abs(Xe_real(i)) < 1e-10;
        Xe_real(i) = 0;
    end;
    Xe_imag(i) = imag(X_exp(i));
    if abs(Xe_imag(i)) < 1e-10;
        Xe_imag(i) = 0;
    end;
    Xe_mag(i) = sqrt(Xe_real(i)^2 + Xe_imag(i)^2);
    Xe_ang_rad(i) = atan(Xe_imag(i)/Xe_real(i));
    Xe_ang_rad(isnan(Xe_ang_rad)) = 0;
    Xe_ang_deg(i) = (180/pi)*Xe_ang_rad(i);
end;
    
    figure;    
    stem(Xe_real,'b--o');
    grid on;
    title('Real part');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(Xe_imag,'b--o');
    grid on;
    title('Imaginary part');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(Xe_mag,'b--o');
    grid on;
    title('Magnitude');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    figure;
    stem(Xe_ang_deg,'b--o');
    grid on;
    title('Phase angle');
    xlabel('m (KHz)');
    ylabel('Amplitude');
    
    