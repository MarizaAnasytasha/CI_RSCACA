-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 11:19 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `poli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `poli`) VALUES
(1, 'Dr. Salsa', 'Poli Umum'),
(2, 'Dr. Budi', 'Poli Gigi'),
(3, 'Dr. Lestari', 'Poli Anak'),
(4, 'Dr. Bunga', 'Poli Jiwa'),
(5, 'Dr. Caca', 'Poli Kecantikan'),
(6, 'Dr. Salma', 'Poli Saraf');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `poli` varchar(100) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('menunggu','diterima','ditolak') DEFAULT 'menunggu',
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(20) DEFAULT NULL,
  `keluhan` text,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `user_id`, `nama`, `poli`, `dokter`, `tanggal`, `status`, `tgl_lahir`, `alamat`, `telepon`, `keluhan`, `jam`) VALUES
(8, 2, 'Destiana', 'Poli Umum', 'Dr. Salsa', '2025-06-21', 'diterima', '2000-06-19', 'tangerang 1', '1234567855', 'pusing', '13:50:00'),
(9, 16, 'mariza', 'Poli Anak', 'Dr. Lestari', '2025-06-13', 'diterima', '2005-03-06', 'bugel', '0876532468', 'pusing butuh uwang', '17:00:00'),
(10, 17, 'alvina', 'Poli Jiwa', 'Dr. Bunga', '2025-06-13', 'diterima', '2017-01-19', 'batavia', '08582345678', 'gangguan jiwa', '16:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role` enum('admin','pasien') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `role`, `created_at`) VALUES
(4, 'admin', '$2y$10$fco5zgoMP3GbzFNvKmln9uOVzgjAhugRbs8dw1DEZcuRjd6EJ4Y.y', 'Admin', 'admin', '2025-06-07 01:41:39'),
(16, 'cacamariza', '$2y$10$/9vXUpn3m62PkFpCv0olhuqUi8WAPy0Sm0DzrNjcZshZIeSR5nxa6', 'mariza', 'pasien', '2025-06-13 15:34:48'),
(17, 'pina', '$2y$10$Zta9uTW2J2Nrlztf7.0IKun1M.4sBMNoSeR0kgoQL/fsFmCPtNIwO', 'alvina', 'pasien', '2025-06-13 16:03:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
