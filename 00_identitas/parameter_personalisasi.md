# Parameter Personalisasi

* **Nama:** Khairista Akemi Suryana
* **NIM:** 2510514019

## Tabel Parameter
| Simbol | Definisi | Rumus | Perhitungan | Hasil |
| :---: | :--- | :--- | :--- | :--- |
| **N** | Dua digit terakhir NIM | NIM mod 100 | 19 mod 100 | **19** |
| **a** | Digit puluhan NIM | floor(N / 10) | floor(19 / 10) | **1** |
| **b** | Digit satuan NIM | N mod 10 | 19 mod 10 | **9** |
| **K** | Konstanta skala data | (a + b + 1) | (1 + 9 + 1) | **11** |
| **θ₀** | Sudut awal (derajat) | (a · 30) + (b · 5) | (1 · 30) + (9 · 5) | **75°** |
| **α** | Learning rate | 0.001 · (b + 1) | 0.001 · (9 + 1) | **0.01** |
