clc;
clear all;
close all;

DFT_points = 8;
j = sqrt(-1);
Fs = 8e3;
ts = 1/Fs;
N = DFT_points;
m = 0:N-1;
x_seq1 = sin(2*pi*1000*m*ts);
x_seq2 = 0.5*sin(2*pi*2000*m*ts+(3*pi/4));
x_comb = sin(2*pi*1000*m*ts)+0.5*sin(2*pi*2000*m*ts+(3*pi/4));
figure; plot(x_seq1,'b--o'); title('x-seq1 signal'); grid on;
figure; plot(x_seq2,'b--o'); title('x-seq2 signal'); grid on;
figure; plot(x_comb,'b--o'); title('x-comb signal'); grid on;
X_exp_seq1 = zeros(1,N);
X_exp_seq2 = zeros(1,N);
X_exp_comb = zeros(1,N);

for m=0:N-1;
    X_1 = 0;
    for n = 0:N-1;
        X = x_seq1(n+1)*exp(-j*2*pi*n*m/N);
        X_1 = X_1+X;
    end;
    X_exp_seq1(m+1) = X_1;
end;
for m=0:N-1;
    X_1 = 0;
    for n = 0:N-1;
        X = x_seq2(n+1)*exp(-j*2*pi*n*m/N);
        X_1 = X_1+X;
    end;
    X_exp_seq2(m+1) = X_1;
end;
for m=0:N-1;
    X_1 = 0;
    for n = 0:N-1;
        X = x_comb(n+1)*exp(-j*2*pi*n*m/N);
        X_1 = X_1+X;
    end;
    X_exp_comb(m+1) = X_1;
end;

X_exp_seq_sum = X_exp_seq1 + X_exp_seq2;
DFT_Linearity_error  = max(abs(X_exp_seq_sum-X_exp_comb));
if abs(DFT_Linearity_error) < 1e-12;
    DFT_Linearity_error = 0;
end;



