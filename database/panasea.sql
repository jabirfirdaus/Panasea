-- ====================================
-- DATABASE: Panasea
-- Website Rekomendasi Obat
-- ====================================

CREATE DATABASE IF NOT EXISTS panasea;
USE panasea;

-- Table: user
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB;

-- Table: obat
CREATE TABLE IF NOT EXISTS obat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    harga INT NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    deskripsi TEXT,
    aturan_pakai VARCHAR(200),
    foto VARCHAR(255)
) ENGINE=InnoDB;

-- Table: penyakit
CREATE TABLE IF NOT EXISTS penyakit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Table: relasi (obat <-> penyakit)
CREATE TABLE IF NOT EXISTS relasi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    obat_id INT NOT NULL,
    penyakit_id INT NOT NULL,
    FOREIGN KEY (obat_id) REFERENCES obat(id) ON DELETE CASCADE,
    FOREIGN KEY (penyakit_id) REFERENCES penyakit(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ====================================
-- SAMPLE DATA
-- ====================================

-- Penyakit
INSERT INTO penyakit (nama) VALUES
('Demam'),
('Flu'),
('Batuk'),
('Sakit Kepala'),
('Maag'),
('Sakit Gigi');

-- Obat
INSERT INTO obat (nama, harga, stok, deskripsi, aturan_pakai) VALUES
('Paracetamol', 5000, 100, 'Obat untuk menurunkan demam dan meredakan nyeri ringan hingga sedang.', '3x sehari 1 tablet setelah makan'),
('Ibuprofen', 8000, 80, 'Obat anti-inflamasi non-steroid (NSAID) untuk nyeri dan demam.', '3x sehari 1 tablet setelah makan'),
('OBH Combi', 15000, 50, 'Sirup obat batuk hitam yang mengandung succus liquiritiae untuk meredakan batuk berdahak.', '3x sehari 1 sendok makan'),
('Promag', 3000, 120, 'Antasida untuk menetralkan asam lambung berlebih.', '3x sehari 1-2 tablet sebelum makan'),
('Bodrex', 4000, 90, 'Obat untuk sakit kepala dan demam.', '3x sehari 1 tablet setelah makan'),
('Amoxicillin', 12000, 60, 'Antibiotik untuk infeksi bakteri. Harus dengan resep dokter.', '3x sehari 1 kapsul setelah makan'),
('Decolgen', 7000, 70, 'Obat untuk meredakan gejala flu seperti hidung tersumbat, demam, dan nyeri.', '3x sehari 1 tablet setelah makan'),
('Antangin', 3000, 100, 'Obat herbal untuk masuk angin dan perut kembung.', '3x sehari 1 tablet'),
('Ponstan', 10000, 40, 'Obat pereda nyeri termasuk sakit gigi.', '3x sehari 1 tablet setelah makan'),
('Actifed', 12000, 55, 'Obat untuk meredakan batuk tidak berdahak dan hidung tersumbat.', '3x sehari 1 sendok teh');

-- Relasi obat-penyakit
INSERT INTO relasi (obat_id, penyakit_id) VALUES
-- Paracetamol -> Demam, Sakit Kepala
(1, 1), (1, 4),
-- Ibuprofen -> Demam, Sakit Kepala, Sakit Gigi
(2, 1), (2, 4), (2, 6),
-- OBH Combi -> Batuk
(3, 3),
-- Promag -> Maag
(4, 5),
-- Bodrex -> Sakit Kepala, Demam
(5, 4), (5, 1),
-- Amoxicillin -> Sakit Gigi
(6, 6),
-- Decolgen -> Flu, Demam
(7, 2), (7, 1),
-- Antangin -> Flu, Maag
(8, 2), (8, 5),
-- Ponstan -> Sakit Gigi, Sakit Kepala
(9, 6), (9, 4),
-- Actifed -> Batuk, Flu
(10, 3), (10, 2);
