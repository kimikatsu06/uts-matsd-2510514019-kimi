% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi  
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-26 
% =====================================================

clc; clear; close all;

%% Parameter Personalisasi 
N = 19;
a = 1;
b = 9;

clc; clear; close all;

%% --- 1. PARAMETER PERSONALISASI ---
% Berdasarkan data yang diberikan
N = 19; 
a = 1;  
b = 9;  

%% --- 2. PEMBENTUKAN MATRIKS ---
% Matriks Kunci A
A = [a+1,  b,    2;
     1,    a+2,  b;
     b,    1,    a+3];

% Matriks Piksel Asli P
P = [120,      (50 + N),  200;
     80,       (a + 2),   (10 + N);
     (30 + N), 90,        170];

%% --- 3. VERIFIKASI POIN C (EKSAK) ---
% Menggunakan symbolic untuk hasil pecahan agar sesuai perhitungan manual
A_sym = sym(A);
det_A = det(A_sym);

% Menghitung Kofaktor secara manual dengan loop
C_sym = sym(zeros(3,3));
for i = 1:3
    for j = 1:3
        sub_A = A_sym;
        sub_A(i,:) = [];
        sub_A(:,j) = [];
        C_sym(i,j) = (-1)^(i+j) * det(sub_A);
    end
end

% Adjoin dan Invers
adj_A = C_sym.'; 
A_inv_eksak = adj_A / det_A;

fprintf('--- HASIL POIN C (VERIFIKASI MANUAL) ---\n');
disp('Matriks Kofaktor (C):');
disp(C_sym);
disp('Matriks Adjoin (Adj(A)):');
disp(adj_A);
disp('Matriks Invers A^-1 (Bentuk Eksak):');
disp(A_inv_eksak);

%% --- 4. VERIFIKASI POIN D (ERROR FROBENIUS) ---
% Invers menggunakan fungsi internal MATLAB
A_inv_matlab = inv(A);

% Menghitung norma error Frobenius
error_fro = norm(double(A_inv_eksak) - A_inv_matlab, 'fro');

fprintf('--- HASIL POIN D (VERIFIKASI MATLAB) ---\n');
fprintf('Norma Error Frobenius: %.2e\n', error_fro);
if error_fro < 1e-10
    fprintf('Status: Verifikasi Berhasil (< 1e-10)\n\n');
else
    fprintf('Status: Periksa kembali perhitungan manual Anda.\n\n');
end

%% --- 5. VISUALISASI POIN F ---
% Enkripsi: E = A * P
E = A * P;

% Visualisasi Citra
figure('Color', 'w');
subplot(1, 2, 1);
imshow(uint8(P), []); 
title('Blok Piksel Asli (P)');
colormap(gray); axis on;

subplot(1, 2, 2);
imshow(uint8(E), []); 
title('Blok Piksel Enkripsi (E)');
colormap(gray); axis on;

fprintf('--- VISUALISASI SELESAI ---\n');