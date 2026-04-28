% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 - Segmentasi Pelanggan dan komposisi fungsi harga
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-27 
% =====================================================

clear; clc;

N = 19;
a = 1;  
b = 9;  
K = 11; 

syms x

%% BAGIAN b: Verifikasi Limit L1, L2, L3
fprintf('=== VERIFIKASI LIMIT (Soal 5.1 b) ===\n');

% L1 = lim (x -> K) [ (x^2 - K^2) / (x - K) ]
L1_expr = (x^2 - K^2) / (x - K);
L1 = limit(L1_expr, x, K);

% L2 = lim (x -> 0) [ (sqrt(x + (K+1)^2) - (K+1)) / x ]
L2_expr = (sqrt(x + (K+1)^2) - (K+1)) / x;
L2 = limit(L2_expr, x, 0);

% L3 = lim (x -> inf) [ ((a+2)x^3 + b*x + 7) / (x^3 - x + K) ]
L3_expr = ((a+2)*x^3 + b*x + 7) / (x^3 - x + K);
L3 = limit(L3_expr, x, inf);

fprintf('L1 = %s\n', char(L1));
fprintf('L2 = %s\n', char(L2));
fprintf('L3 = %s\n\n', char(L3));


%% BAGIAN 5.4 (g): Plot Fungsi Biaya Piecewise C(x)
% Agar kontinu di x = K, maka:
% 1. Limit kiri harus sama dengan nilai fungsi (p): p = L1 = 2*K
% 2. Limit kanan harus sama dengan nilai fungsi (p): a*K + q = p
p = double(L1);      % p = 22
q = p - (a * K);     % q = 11

% Definisi fungsi untuk plot
c_kiri  = @(x) (x.^2 - K^2) ./ (x - K);
c_kanan = @(x) a.*x + q;

figure('Name', 'Analisis Kontinuitas C(x)');
hold on;

% Plot x < K (Garis Biru)
fplot(c_kiri, [0, K], 'b', 'LineWidth', 2);

% Plot x > K (Garis Merah)
fplot(c_kanan, [K, 2*K], 'r', 'LineWidth', 2);

% Plot Titik Sambungan p di x = K (Titik Hijau)
plot(K, p, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8);

% Garis vertikal tipis untuk highlight titik sambung
line([K K], [0, p*1.5], 'Color', [0.5 0.5 0.5], 'LineStyle', '--');

% Pengaturan Grafik
grid on;
title(['Plot Kontinu C(x) dengan K = ', num2str(K), ', p = ', num2str(p), ', q = ', num2str(q)]);
xlabel('Unit Produk (x)');
ylabel('Biaya Distribusi C(x)');
legend('x < K (Kuadratik/Rasional)', 'x > K (Linear)', 'Titik Kontinu (p)', 'Garis Sambungan x=K');
hold off;

fprintf('=== PARAMETER KEKONTINUAN (Soal 5.4 f) ===\n');
fprintf('Nilai p yang ditemukan: %d\n', p);
fprintf('Nilai q yang ditemukan: %d\n', q);