% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6 - Optimasi Harga Produk Via Gradient Descent Manual
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-27 
% =====================================================

clear; clc; close all;

%% 1. Parameter Personalisasi
a = 1;      
b = 9;      
K = 11;     
alpha = 0.01; 

% Fungsi Profit: pi(x) = -2x^3 + 154x^2 + 100x - 1210
pi_func = @(x) -(a+1)*x.^3 + (b+5)*K*x.^2 + 100*x - (K^2 * 10);

% Turunan Pertama: pi'(x) = -6x^2 + 308x + 100
grad_func = @(x) -3*(a+1)*x.^2 + 2*(b+5)*K*x + 100;

%% 2. Pengaturan Iterasi Gradient Descent
x_0 = 1;             
n_iter = 500;       
x_hist = zeros(n_iter, 1);
pi_hist = zeros(n_iter, 1);

x_curr = x_0;

% Algoritma Update: x_{k+1} = x_k + alpha * pi'(x_k)
for k = 1:n_iter
    x_hist(k) = x_curr;
    pi_hist(k) = pi_func(x_curr);
    
    % Menghitung gradien dan update posisi
    grad = grad_func(x_curr);
    x_curr = x_curr + alpha * grad;
end

x_final = x_curr;

%% 3. Solusi Analitik 
% Menggunakan rumus kuadrat untuk 3x^2 - 154x - 50 = 0
x_analitik = (154 + sqrt(154^2 - 4*3*(-50))) / (2*3);

%% 4. Visualisasi
figure('Color', 'w', 'Name', 'Analisis Gradient Descent');

% Plot 1: Grafik Konvergensi pi(x_k) vs k
subplot(2, 1, 1);
plot(1:n_iter, pi_hist, 'r', 'LineWidth', 2);
grid on;
title('Grafik Konvergensi Profit \pi(x_k) vs Iterasi (k)');
xlabel('Iterasi (k)');
ylabel('Profit \pi(x)');

% Plot 2: Kurva pi(x) dan Perbandingan Titik
subplot(2, 1, 2);
fplot(pi_func, [0, 80], 'b', 'LineWidth', 1.5); hold on;
grid on;

% Plot Titik-titik penting
plot(x_0, pi_func(x_0), 'go', 'MarkerFaceColor', 'g', 'DisplayName', 'Titik Awal x_0');
plot(x_final, pi_func(x_final), 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Titik Akhir x^* (GD)');
plot(x_analitik, pi_func(x_analitik), 'kx', 'LineWidth', 2, 'MarkerSize', 10, 'DisplayName', 'Analitik (Puncak)');

title('Posisi Solusi pada Kurva Profit \pi(x)');
xlabel('Harga Produk (x)');
ylabel('Profit');
legend('show', 'Location', 'best');

%% 5. Output Command Window
fprintf('=== Ringkasan Hasil ===\n');
fprintf('Titik Awal (x0)        : %.6f\n', x_0);
fprintf('Hasil GD (500 iterasi) : %.6f\n', x_final);
fprintf('Solusi Analitik        : %.6f\n', x_analitik);
fprintf('Profit Maksimum        : %.2f\n', pi_func(x_final));