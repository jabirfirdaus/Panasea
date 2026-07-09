-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2026 at 09:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panasea`
--

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `aturan_pakai` varchar(200) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `harga`, `deskripsi`, `aturan_pakai`, `foto`) VALUES
(1, 'Paracetamol', 5000, 'Obat untuk menurunkan demam dan meredakan nyeri ringan hingga sedang.', '3x sehari 1 tablet setelah makan', NULL),
(2, 'Ibuprofen', 8000, 'Obat anti-inflamasi non-steroid (NSAID) untuk nyeri dan demam.', '3x sehari 1 tablet setelah makan', NULL),
(3, 'OBH Combi', 15000, 'Sirup obat batuk hitam yang mengandung succus liquiritiae untuk meredakan batuk berdahak.', '3x sehari 1 sendok makan', NULL),
(4, 'Promag', 3000, 'Antasida untuk menetralkan asam lambung berlebih.', '3x sehari 1-2 tablet sebelum makan', NULL),
(5, 'Bodrex', 4000, 'Obat untuk sakit kepala dan demam.', '3x sehari 1 tablet setelah makan', NULL),
(6, 'Amoxicillin', 12000, 'Antibiotik untuk infeksi bakteri. Harus dengan resep dokter.', '3x sehari 1 kapsul setelah makan', NULL),
(7, 'Decolgen', 7000, 'Obat untuk meredakan gejala flu seperti hidung tersumbat, demam, dan nyeri.', '3x sehari 1 tablet setelah makan', NULL),
(8, 'Antangin', 3000, 'Obat herbal untuk masuk angin dan perut kembung.', '3x sehari 1 tablet', NULL),
(9, 'Ponstan', 10000, 'Obat pereda nyeri termasuk sakit gigi.', '3x sehari 1 tablet setelah makan', NULL),
(10, 'Actifed', 12000, 'Obat untuk meredakan batuk tidak berdahak dan hidung tersumbat.', '3x sehari 1 sendok teh', NULL),
(11, 'Cetirizine', 6000, 'Obat antihistamin untuk meredakan gejala alergi kulit dan saluran pernapasan.', '1x sehari 1 tablet setelah makan', NULL),
(12, 'Betahistine', 15000, 'Obat untuk memperbaiki aliran darah telinga dalam guna meredakan pusing berputar.', '3x sehari 1 tablet setelah makan', NULL),
(13, 'Dimenhydrinate', 4000, 'Obat anti-mual untuk mengatasi gangguan keseimbangan dan mabuk perjalanan.', '3x sehari 1 tablet setelah makan', NULL),
(14, 'Allopurinol', 12000, 'Obat penurun kadar asam urat dalam darah untuk mencegah serangan sendi.', '1x sehari 1 tablet setelah makan', NULL),
(15, 'Hydrocortisone Salep', 8000, 'Salep kulit kortikosteroid untuk meredakan gatal, kemerahan, dan radang eksim.', 'Oleskan tipis 2-3 kali sehari pada area gatal', NULL),
(16, 'Degirol', 14000, 'Tablet isap antiseptik untuk membunuh kuman dan meredakan nyeri tenggorokan.', 'Isap 1 tablet tiap 3-4 jam, maks 8 tablet sehari', NULL),
(17, 'Oralit', 2000, 'Bubuk rehidrasi untuk menggantikan cairan tubuh dan elektrolit yang hilang akibat diare.', 'Larutkan 1 saset ke dalam 200ml air tiap habis BAB', NULL),
(18, 'Attapulgite', 7000, 'Obat penyerap racun dan bakteri penyebab diare di dalam usus.', '2 tablet setiap setelah buang air besar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `nama`) VALUES
(1, 'Demam'),
(2, 'Flu'),
(3, 'Batuk'),
(4, 'Sakit Kepala'),
(5, 'Maag'),
(6, 'Sakit Gigi'),
(7, 'Diare'),
(8, 'Vertigo'),
(9, 'Biduran'),
(10, 'Rhinitis Alergi'),
(11, 'Asam Urat'),
(12, 'Eksim'),
(13, 'Radang Tenggorokan'),
(14, 'Mabuk Perjalanan');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id` int(11) NOT NULL,
  `obat_id` int(11) NOT NULL,
  `penyakit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id`, `obat_id`, `penyakit_id`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 1),
(4, 2, 4),
(5, 2, 6),
(6, 3, 3),
(7, 4, 5),
(8, 5, 4),
(9, 5, 1),
(10, 6, 6),
(11, 7, 2),
(12, 7, 1),
(13, 8, 2),
(14, 8, 5),
(15, 9, 6),
(16, 9, 4),
(17, 10, 3),
(18, 10, 2),
(19, 11, 9),
(20, 11, 10),
(21, 12, 8),
(22, 13, 8),
(23, 13, 14),
(24, 14, 11),
(25, 15, 12),
(26, 16, 13),
(27, 17, 7),
(28, 18, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `is_admin`) VALUES
(1, 'admin', 'admin@panasea.com', 'scrypt:32768:8:1$zU6msm7CHyfIcL8q$5424e2adb9e0ec8aa2beecd134bb1ce527718155a73b75ccdb7a072ada06682cc292621e20ae5c16fce325808c292f6d2f67184e01dc6c0e8acf010a47505581', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_id` (`obat_id`),
  ADD KEY `penyakit_id` (`penyakit_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`penyakit_id`) REFERENCES `penyakit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
