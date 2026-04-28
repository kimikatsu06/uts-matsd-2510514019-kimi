% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 - Forecasting Penjualan dengan barisan, Deret, dan Notasi Sigma
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-27 
% =====================================================

clear; clc; close all;

%% Parameter Personalisasi
a = 1; 
b = 9;
K = a + b + 1; % K = 11

% Inisialisasi n (1 sampai 12 bulan)
n = 1:12;

% Persamaan Penjualan Sn
% Sn = 50 + (K*n) + (-1)^n * (a + 1)
S = 50 + (K .* n) + ((-1).^n .* (a + 1));

%% --- Bagian 7.2 (c): Verifikasi Sigma Manual ---
T1_matlab = sum(S);
T2_matlab = sum(S.^2);

fprintf('=== Verifikasi Operasi Sigma (7.2c) ===\n');
fprintf('Total Penjualan (T1): %.2f juta\n', T1_matlab);
fprintf('Sum of Squares (T2) : %.2f\n\n', T2_matlab);

%% --- Bagian 7.4 (e): Forecasting 6 Bulan ke Depan ---
t = 1:12; % Data historis

% 1. Mencari garis tren linear menggunakan polyfit orde 1
% p(1) adalah slope (kemiringan), p(2) adalah intercept
p = polyfit(t, S, 1);
slope = p(1);
intercept = p(2);

% 2. Prediksi S13 sampai S18
t_pred = 13:18;
S_pred = polyval(p, t_pred);

fprintf('=== Hasil Forecasting (7.4e) ===\n');
fprintf('Slope (Koefisien): %.4f\n', slope);
fprintf('Intercept        : %.4f\n', intercept);

% 3. Plotting
figure('Color', 'w');
hold on;

% Data Historis (Biru, Titik)
plot(t, S, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Data Historis');

% Garis Tren (Merah, Putus-putus)
plot(t, polyval(p, t), 'r--', 'LineWidth', 1.5, 'DisplayName', 'Garis Tren Linear');

% Prediksi 6 Bulan (Hijau, Segitiga)
plot(t_pred, S_pred, 'g^', 'MarkerFaceColor', 'g', 'DisplayName', 'Prediksi (S13-S18)');

% Pengaturan Grafik
title('Analisis Tren dan Prediksi Penjualan');
xlabel('Bulan ke-n');
ylabel('Penjualan (Juta Rupiah)');
legend('Location', 'northwest');
grid on;
hold off;