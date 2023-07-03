-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2023 pada 21.58
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwl_4219`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `harga` float DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `jumlah`, `keterangan`, `foto`) VALUES
(1, 'Indomie Goreng', 2500, 22, 'Indomie Seleraku', 'indomie-mi-goreng-special_detail_094906814 (1).png'),
(2, 'Sari Roti Kismis', 5000, 100, 'Roti Single', 'roti_tawar_raisin1.jpg'),
(3, 'Susu Ultra', 5000, 100, 'Susu UHT', 'e31f03c4-8216-425d-8279-b7cee6e75cf8.jpg'),
(4, 'Dji Sam Soe Refill', 20000, 24, 'Ududnya Orang NU', 'dji-sam-soe-234-premium-12-285587.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `username`, `total_harga`, `alamat`, `ongkir`, `status`, `created_by`, `created_date`) VALUES
(1, 'ilham', 0, '', 0, 0, 'ilham', '2023-07-02 15:32:40'),
(2, 'kurniawan', 160500, 'loeoeoeoeo', 18000, 0, 'kurniawan', '2023-07-02 15:49:59'),
(3, 'ilham', 40500, 'adsadawadqeq', 18000, 0, 'ilham', '2023-07-02 19:58:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `id_transaksi`, `id_barang`, `jumlah`, `diskon`, `subtotal_harga`, `created_by`, `created_date`) VALUES
(1, 1, 1, 5, 0, 12500, 'ilham', '2023-07-02 15:32:40'),
(2, 1, 3, 1, 0, 5000, 'ilham', '2023-07-02 15:32:40'),
(3, 1, 4, 1, 0, 20000, 'ilham', '2023-07-02 15:32:40'),
(4, 2, 1, 1, 0, 2500, 'kurniawan', '2023-07-02 15:49:59'),
(5, 2, 2, 3, 0, 15000, 'kurniawan', '2023-07-02 15:49:59'),
(6, 2, 4, 6, 0, 120000, 'kurniawan', '2023-07-02 15:49:59'),
(7, 2, 3, 1, 0, 5000, 'kurniawan', '2023-07-02 15:49:59'),
(8, 3, 1, 3, 0, 7500, 'ilham', '2023-07-02 19:58:16'),
(9, 3, 2, 2, 0, 10000, 'ilham', '2023-07-02 19:58:16'),
(10, 3, 3, 1, 0, 5000, 'ilham', '2023-07-02 19:58:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `role`, `password`, `is_aktif`) VALUES
(1, 'revrans', 'admin', '202cb962ac59075b964b07152d234b70', 1),
(2, 'ilham', 'user', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(3, 'kurniawan', 'user', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(5, 'rinso', 'user', '202cb962ac59075b964b07152d234b70', 1),
(6, 'yayan', 'user', 'b706835de79a2b4e80506f582af3676a', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
