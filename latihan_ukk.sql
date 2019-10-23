-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 01:04 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `latihan_ukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `id_level` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_level` (`id_level`),
  UNIQUE KEY `id_level_2` (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_admin`, `id_level`) VALUES
(1, 'izqi', 'izqi', 'izqi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(10) NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `nama_level`) VALUES
(1, 'admin'),
(2, 'pimpinan');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nomor_kwh` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `id_tarif` int(11) NOT NULL,
  PRIMARY KEY (`id_pelanggan`),
  UNIQUE KEY `id_tarif` (`id_tarif`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `username`, `password`, `nomor_kwh`, `nama_pelanggan`, `alamat`, `id_tarif`) VALUES
(1, 'izqi', 'izqi', '900', 'izqi', 'Jl. Danau Kerinci', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_tagihan` int(11) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `bulan_pembayaran` varchar(20) NOT NULL,
  `biaya_admin` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `bukti` varchar(100) NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_pembayaran`,`id_tagihan`),
  KEY `id_tagihan` (`id_tagihan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan`
--

CREATE TABLE IF NOT EXISTS `penggunaan` (
  `id_penggunaan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `meter_awal` float NOT NULL,
  `meter_akhir` float NOT NULL,
  PRIMARY KEY (`id_penggunaan`),
  UNIQUE KEY `id_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pimpinan`
--

CREATE TABLE IF NOT EXISTS `pimpinan` (
  `id_pimpinan` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_pimpinan` varchar(50) NOT NULL,
  `id_level` int(11) NOT NULL,
  PRIMARY KEY (`id_pimpinan`),
  UNIQUE KEY `id_level` (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pimpinan`
--

INSERT INTO `pimpinan` (`id_pimpinan`, `username`, `password`, `nama_pimpinan`, `id_level`) VALUES
(1, 'wawa', 'wawa', 'wawa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE IF NOT EXISTS `tagihan` (
  `id_tagihan` int(11) NOT NULL AUTO_INCREMENT,
  `id_penggunaan` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `jumlah_meter` float NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tagihan`,`id_penggunaan`),
  KEY `id_penggunaan` (`id_penggunaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE IF NOT EXISTS `tarif` (
  `id_tarif` int(11) NOT NULL AUTO_INCREMENT,
  `daya` varchar(10) NOT NULL,
  `tarifperkwh` float NOT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD CONSTRAINT `penggunaan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pimpinan`
--
ALTER TABLE `pimpinan`
  ADD CONSTRAINT `pimpinan_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`id_penggunaan`) REFERENCES `penggunaan` (`id_penggunaan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`id_tarif`) REFERENCES `pelanggan` (`id_tarif`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
