# BARA

BARA adalah aplikasi marketplace bimbingan belajar antar-mahasiswa (peer-to-peer tutoring) untuk mahasiswa Fakultas Ilmu Komputer (FILKOM) Universitas Brawijaya. BARA mempertemukan mahasiswa sebagai mentor dan mentee untuk sesi bimbingan 1-on-1 maupun kelompok, dengan sistem pencocokan yang intuitif dan validasi kompetensi sebelum sesi belajar dimulai.

Dikembangkan oleh **Kelompok 4** untuk event **Androzon**.

## Fitur Utama

Berikut adalah fitur-fitur yang direncanakan tersedia di BARA:

* **Sistem Autentikasi**
  * Login & Registrasi Akun.
  * Login menggunakan SSO Universitas Brawijaya / email kampus (@student.ub.ac.id).
  * Lupa kata sandi & Reset kata sandi.
* **Matchmaking Mentor**
  * Antarmuka swipe untuk memilih mentor berdasarkan jurusan, ketertarikan, dan reputasi.
  * Profil mentor dengan tagline kompetensi dan rating dari sesi sebelumnya.
* **Validasi Kompetensi**
  * Kuis singkat sebelum sesi belajar untuk mengukur pemahaman dasar mentee.
  * Kurasi bank soal / kuis kustom oleh mentor sesuai topik.
* **Live Chat Diskusi**
  * Sesi diskusi real-time dengan durasi custom maupun preset (1 jam, 3 jam).
  * Lampiran file, gambar, dan tautan dalam sesi diskusi.
  * Live chat tersimpan sebagai postingan setelah sesi berakhir.
* **Materi & Postingan**
  * Unggah materi kuliah, dikelompokkan otomatis berdasarkan semester dan mata kuliah.
  * Postingan publik maupun privat (hanya dapat dilihat sendiri).
* **Profil Pengguna**
  * Tampilan publik/privat untuk postingan sendiri dan tampilan untuk pengguna lain (stranger view).
  * Edit profil (nama, username, tagline, bio, foto).
* **Sistem Pelaporan**
  * Halaman pelaporan insiden dengan kronologi dan bukti pendukung.

## Tech Stack

BARA dibangun dengan teknologi berikut:

* **Bahasa & Framework:** Flutter (Dart)
* **Backend-as-a-Service:** Supabase
  * PostgreSQL — penyimpanan data pengguna, materi, postingan, dan hasil kuis.
  * Auth — manajemen sesi dan autentikasi pengguna.
  * Storage — penyimpanan file materi dan lampiran live chat.
  * Realtime — sinkronisasi live chat diskusi.
* **State Management & Config:** flutter_dotenv untuk pengelolaan environment variable.

## Arsitektur Aplikasi

BARA mengikuti pola **feature-first architecture**, di mana kode diorganisasikan berdasarkan fitur, bukan berdasarkan layer teknis:

```
lib/
├── core/                 # Shared: config, theme, widget umum, Supabase client
│   ├── config/
│   └── widgets/
├── features/
│   ├── auth/
│   │   ├── data/         # Pemanggilan Supabase
│   │   ├── models/
│   │   └── screens/
│   ├── matching/         # Swipe mentor
│   ├── quiz/
│   └── report/
└── main.dart
```

Setiap fitur bersifat mandiri (self-contained), memudahkan navigasi kode dan pembagian kerja antar anggota tim tanpa banyak dependensi silang antar fitur.

## Setup Project

1. Clone repository ini.
2. Jalankan `flutter pub get` untuk menginstal dependencies.
3. Buat file `.env` di root project dengan isi:
   ```
   SUPABASE_URL=
   SUPABASE_ANON_KEY=
   ```
4. Jalankan `flutter run`.