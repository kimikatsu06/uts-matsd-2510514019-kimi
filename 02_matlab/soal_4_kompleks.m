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

%% 1. Parameter Personalisasi
% Diambil dari dokumen data personalisasi 
a = 1; 
b = 9;
theta0_deg = 75; 
theta0_rad = deg2rad(theta0_deg);

%% 2. Bagian (b): Operasi Aljabar Kompleks
% Definisi fasor sesuai model pada gambar soal
% z1 = (a+2) + (b+1)i
% z2 = (b+1) - (a+2)i
z1 = (a + 2) + (b + 1)*1i;
z2 = (b + 1) - (a + 2)*1i;

% Perhitungan Operasi
hasil_jumlah   = z1 + z2;
hasil_kali     = z1 * z2;
hasil_bagi     = z1 / z2; % MATLAB melakukan rasionalisasi otomatis
hasil_abs_diff = abs(z1 - z2);

fprintf('--- HASIL BAGIAN (b) ---\n');
fprintf('z1 + z2       : %.0f + %.0fi\n', real(hasil_jumlah), imag(hasil_jumlah));
fprintf('z1 * z2       : %.0f + %.0fi\n', real(hasil_kali), imag(hasil_kali));
fprintf('z1 / z2       : %.4f + %.4fi\n', real(hasil_bagi), imag(hasil_bagi));
fprintf('|z1 - z2|     : %.4f\n\n', hasil_abs_diff);

%% 3. Bagian (e): Akar Kubik dan Plot Bidang Argand
% Mencari akar pangkat tiga dari w = 8 * cis(theta0)
r_w = 8;
n = 3;
r_root = r_w^(1/n); % r = 2

k = 0:2;
sudut_akar = (theta0_rad + 2*pi*k) / n;
akar_kubik = r_root * (cos(sudut_akar) + 1i*sin(sudut_akar));

fprintf('--- HASIL BAGIAN (e): Akar-Akar Kubik ---\n');
for i = 1:3
    fprintf('Akar ke-%d: %.4f + %.4fi\n', i, real(akar_kubik(i)), imag(akar_kubik(i)));
end

% Visualisasi menggunakan compass sesuai instruksi soal
figure('Color', 'w');
h = compass(akar_kubik, 'r');
set(h, 'LineWidth', 1.5);
hold on;

% Menghubungkan titik akar untuk membentuk segitiga sama sisi
% Menambahkan elemen pertama di akhir agar garis menutup (loop)
titik_segitiga = [akar_kubik, akar_kubik(1)];
plot(real(titik_segitiga), imag(titik_segitiga), 'b--', 'LineWidth', 2);

% Pengaturan Tampilan
grid on;
axis equal;
title(['Plot Akar Kubik w pada Bidang Argand (\theta_0 = ', num2str(theta0_deg), '^\circ)']);
legend('Fasor Akar (z_k)', 'Sisi Segitiga Sama Sisi', 'Location', 'bestoutside');
xlabel('Re (Sumbu Real)');
ylabel('Im (Sumbu Imajiner)');