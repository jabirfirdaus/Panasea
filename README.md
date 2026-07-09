# Panasea -- Website Rekomendasi Obat

Panasea adalah aplikasi web untuk merekomendasikan obat bebas berdasarkan gejala atau penyakit yang dialami pengguna. Dibangun menggunakan Flask (Python) sebagai tugas kuliah.

## Fitur

- **Rekomendasi Obat** -- Pilih gejala/penyakit dan dapatkan rekomendasi obat yang sesuai
- **Detail Obat** -- Lihat informasi lengkap obat (harga, deskripsi, aturan pakai)
- **Autentikasi** -- Sistem login dan registrasi pengguna
- **Dashboard Admin** -- CRUD data obat (Tambah, Edit, Hapus)
- **Responsive Design** -- Tampilan menyesuaikan di desktop dan mobile

## Tech Stack

| Komponen | Teknologi |
|----------|----------|
| Backend | Flask (Python) |
| Database | MySQL |
| ORM | Flask-SQLAlchemy |
| Auth | Flask-Login |
| Frontend | Bootstrap 5, Bootstrap Icons |
| Font | Google Fonts (Poppins) |

## Struktur Project

```
Panasea/
├── app.py                  # Entry point aplikasi
├── config.py               # Konfigurasi Flask
├── extensions.py           # Inisialisasi ekstensi (db, login_manager)
├── requirements.txt        # Daftar dependencies
├── database/
│   └── panasea.sql         # Schema & sample data
├── models/
│   ├── user.py             # Model User
│   ├── obat.py             # Model Obat
│   ├── penyakit.py         # Model Penyakit
│   └── relasi.py           # Model Relasi (obat-penyakit)
├── routes/
│   ├── admin.py            # Route admin (CRUD obat)
│   ├── auth.py             # Route autentikasi
│   └── user.py             # Route user (rekomendasi, detail)
├── templates/
│   ├── layout.html         # Base template
│   ├── navbar.html         # Navigasi
│   ├── footer.html         # Footer
│   ├── index.html          # Halaman beranda
│   ├── login.html          # Halaman login
│   ├── register.html       # Halaman registrasi
│   ├── rekomendasi.html    # Halaman rekomendasi obat
│   ├── detail_obat.html    # Halaman detail obat
│   └── admin/
│       ├── dashboard.html  # Dashboard admin
│       ├── tambah_obat.html
│       └── edit_obat.html
└── static/
    ├── css/style.css       # Custom stylesheet
    └── js/script.js        # Custom JavaScript
```

## Cara Menjalankan

### Prasyarat
- Python 3.8+
- MySQL / XAMPP

### Langkah-langkah

1. **Clone repository**
   ```bash
   git clone https://github.com/username/Panasea.git
   cd Panasea
   ```

2. **Buat virtual environment**
   ```bash
   python -m venv .venv
   .venv\Scripts\activate    # Windows
   source .venv/bin/activate  # macOS/Linux
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Setup database**
   - Buka phpMyAdmin atau MySQL CLI
   - Import file `database/panasea.sql`
   - Atau biarkan Flask membuat tabel secara otomatis saat pertama kali dijalankan

5. **Jalankan aplikasi**
   ```bash
   python app.py
   ```

6. **Buka browser**
   ```
   http://localhost:5000
   ```

### Default Admin
| Username | Password |
|----------|----------|
| admin    | admin123 |

## Lisensi

Project ini dibuat untuk keperluan tugas kuliah.

## kelompok 2
teguh dwiyana
jabir andika firdaus 
sayyid sabil sula
rijal
nova