% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi  
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-26 
% =====================================================

%% Parameter Personalisasi
a = 1;
b = 9;
K = 11;

%% 2. Pembentukan Data Toko (D_i)
% Rumus: D_i = 20 + (K*i) + mod(a*i, 7) - mod(b*i, 5)
i = 1:7;
D = 20 + (K.*i) + mod(a.*i, 7) - mod(b.*i, 5);

% hasil D1 sampai D7
fprintf('Data Penjualan Toko (D1 - D7):\n');
disp(D);

%% 1b Verifikasi Statistik
fungsi_mean = mean(D);
fungsi_median = median(D);
fungsi_modus = mode(D);
fungsi_range = range(D);
fungsi_std = std(D, 1); 

fprintf('--- Hasil Verifikasi MATLAB ---\n');
fprintf('Mean           : %.4f\n', fungsi_mean);
fprintf('Median         : %.4f\n', fungsi_median);
fprintf('Modus          : %.4f\n', fungsi_modus);
fprintf('Range          : %.4f\n', fungsi_range);
fprintf('Standar Deviasi: %.4f\n', fungsi_std);

%% 4. Visualisasi 
figure;
bar(i, D, 'FaceColor', [0.2 0.6 0.8]); 
hold on;

% Menambahkan garis rata-rata horizontal
yline(fungsi_mean, 'r--', 'Rata-rata', 'LineWidth', 2);

% Label dan Judul
xlabel('Toko Ke-i');
ylabel('Penjualan (Juta Rupiah)');
title('Grafik Penjualan Toko - NIM: 2510514019');
grid on;