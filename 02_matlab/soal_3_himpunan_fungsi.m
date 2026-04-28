% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal-3 Segmentasi Pelanggan dan komposisi fungsi harga   
%  --------------------------------------------------- 
%  Nama  : Khairista Akemi Suryana
%  NIM   : 2510514019
%  Parameter: N=19, a=1, b=9, K=11, theta0=75°, alpha=0.01
%  Tanggal: 2026-04-27 
% =====================================================

%% Parameter Personalisasi
N = 19;
a = 1;
b = 9;
K = 11; % Berdasarkan a+b+1

%% Bagian (b): Operasi Himpunan
% Definisi Himpunan berdasarkan soal
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];
U = N:N+20; % Semesta

% Perhitungan Operasi Himpunan
A_u_B_u_C = union(A, union(B, C));
A_i_B_i_C = intersect(A, intersect(B, C));

% (A U B) ∩ C'
A_u_B = union(A, B);
C_komplemen = setdiff(U, C);
Hasil_C = intersect(A_u_B, C_komplemen);

% Simetris Difference |A ⊕ B|
A_xor_B = setxor(A, B);

% Display Output (b)
fprintf('--- HASIL POIN B ---\n');
fprintf('|A U B U C| : %d\n', length(A_u_B_u_C));
fprintf('|A ∩ B ∩ C| : %d\n', length(A_i_B_i_C));
fprintf('|(A U B) ∩ C''| : %d\n', length(Hasil_C));
fprintf('|A ⊕ B| : %d\n\n', length(A_xor_B));

%% Bagian (d): Verifikasi Fungsi Invers
% Persamaan: f(x) = K*x + (a+b)
% Target Pendapatan: Y = K*100 + a + b
syms x
f = K*x + (a+b);
pendapatan_target = K*100 + a + b;

% Mencari invers secara simbolik untuk f(x) = y -> x = (y - (a+b))/K
f_inv = (x - (a+b))/K;

% Mencari nilai x yang menghasilkan pendapatan_target
solusi_x = solve(f == pendapatan_target, x);

% Verifikasi dengan substitusi
verifikasi = subs(f, x, solusi_x);

% Display Output (d)
fprintf('--- HASIL POIN D ---\n');
fprintf('Fungsi f(x) = %s\n', char(f));
fprintf('Fungsi Invers f^-1(x) = %s\n', char(f_inv));
fprintf('Pendapatan Target: Rp %d ribu\n', pendapatan_target);
fprintf('Volume pembelian (x) yang dihasilkan: %s\n', char(solusi_x));
fprintf('Verifikasi (f(solusi_x)): %s\n', char(verifikasi));