-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2017 at 08:37 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knjiznica`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `naziv_autora` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_autora`, `naziv_autora`) VALUES
(1, 'Ivo Andric'),
(2, 'Miroslav Krleza'),
(3, 'John Tolkien'),
(4, 'Antun Branko Simic'),
(5, 'Ivana Brlic Mazuranic'),
(6, 'Ivan Gundulic');

-- --------------------------------------------------------

--
-- Table structure for table `clanarina`
--

CREATE TABLE `clanarina` (
  `id_clanarine` int(11) NOT NULL,
  `iznos_clanarine` varchar(50) NOT NULL,
  `datum_uplate` date NOT NULL,
  `id_studenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clanarina`
--

INSERT INTO `clanarina` (`id_clanarine`, `iznos_clanarine`, `datum_uplate`, `id_studenta`) VALUES
(1, '10 KM', '2017-05-08', 1),
(2, '15 KM', '2017-05-17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fakultet`
--

CREATE TABLE `fakultet` (
  `id_fakulteta` int(11) NOT NULL,
  `naziv_fakulteta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultet`
--

INSERT INTO `fakultet` (`id_fakulteta`, `naziv_fakulteta`) VALUES
(1, 'FSR'),
(2, 'FFMO'),
(3, 'PMF');

-- --------------------------------------------------------

--
-- Table structure for table `izdavac`
--

CREATE TABLE `izdavac` (
  `id_izdavaca` int(11) NOT NULL,
  `naziv_izdavaca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `izdavac`
--

INSERT INTO `izdavac` (`id_izdavaca`, `naziv_izdavaca`) VALUES
(1, 'Skolska knjiga'),
(2, 'Matica hrvatske');

-- --------------------------------------------------------

--
-- Table structure for table `knjiga`
--

CREATE TABLE `knjiga` (
  `id_knjige` int(11) NOT NULL,
  `naziv_knjige` varchar(50) NOT NULL,
  `id_izdavaca` int(11) NOT NULL,
  `id_autora` int(11) NOT NULL,
  `id_vrstaknjige` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knjiga`
--

INSERT INTO `knjiga` (`id_knjige`, `naziv_knjige`, `id_izdavaca`, `id_autora`, `id_vrstaknjige`) VALUES
(1, 'Na Drini cuprija', 1, 1, 1),
(2, 'Gospoda Glembajevi', 2, 2, 2),
(3, 'Gospodar prstenova', 2, 3, 3),
(4, 'Suma Striborova', 1, 5, 6),
(5, 'Moja preobrazenja', 2, 4, 4),
(6, 'Osman', 1, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `korisnicko_ime` varchar(55) NOT NULL,
  `lozinka` varchar(55) NOT NULL,
  `id_studenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`korisnicko_ime`, `lozinka`, `id_studenta`) VALUES
('admin', 'admin', 3),
('miamia', 'mostar', 1),
('peropero', 'mostar', 2);

-- --------------------------------------------------------

--
-- Table structure for table `posudba`
--

CREATE TABLE `posudba` (
  `id_posudbe` int(11) NOT NULL,
  `datum_posudbe` date NOT NULL,
  `datum_povratka` date NOT NULL,
  `id_knjige` int(11) NOT NULL,
  `id_studenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posudba`
--

INSERT INTO `posudba` (`id_posudbe`, `datum_posudbe`, `datum_povratka`, `id_knjige`, `id_studenta`) VALUES
(1, '2017-05-01', '2017-05-09', 1, 1),
(2, '2017-05-09', '2017-05-12', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_student` int(11) NOT NULL,
  `ime_studenta` varchar(50) NOT NULL,
  `prezime_studenta` varchar(50) NOT NULL,
  `id_fakulteta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id_student`, `ime_studenta`, `prezime_studenta`, `id_fakulteta`) VALUES
(1, 'Mia ', 'Milic', 1),
(2, 'Pero', 'Peric', 2),
(3, 'Arya', 'Stark', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vrsta_knjiga`
--

CREATE TABLE `vrsta_knjiga` (
  `id_vrstaknjige` int(11) NOT NULL,
  `vrsta_knjige` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vrsta_knjiga`
--

INSERT INTO `vrsta_knjiga` (`id_vrstaknjige`, `vrsta_knjige`) VALUES
(1, 'Proza'),
(2, 'Drama'),
(3, 'Roman'),
(4, 'Poezija'),
(5, 'Ep'),
(6, 'Bajka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indexes for table `clanarina`
--
ALTER TABLE `clanarina`
  ADD PRIMARY KEY (`id_clanarine`),
  ADD KEY `id_studenta` (`id_studenta`);

--
-- Indexes for table `fakultet`
--
ALTER TABLE `fakultet`
  ADD PRIMARY KEY (`id_fakulteta`);

--
-- Indexes for table `izdavac`
--
ALTER TABLE `izdavac`
  ADD PRIMARY KEY (`id_izdavaca`);

--
-- Indexes for table `knjiga`
--
ALTER TABLE `knjiga`
  ADD PRIMARY KEY (`id_knjige`),
  ADD KEY `id_izdavaca` (`id_izdavaca`),
  ADD KEY `id_autora` (`id_autora`),
  ADD KEY `id_vrstaknjige` (`id_vrstaknjige`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`korisnicko_ime`),
  ADD KEY `id_studenta` (`id_studenta`);

--
-- Indexes for table `posudba`
--
ALTER TABLE `posudba`
  ADD PRIMARY KEY (`id_posudbe`),
  ADD KEY `id_knjige` (`id_knjige`),
  ADD KEY `id_studenta` (`id_studenta`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`),
  ADD KEY `id_fakulteta` (`id_fakulteta`);

--
-- Indexes for table `vrsta_knjiga`
--
ALTER TABLE `vrsta_knjiga`
  ADD PRIMARY KEY (`id_vrstaknjige`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `clanarina`
--
ALTER TABLE `clanarina`
  MODIFY `id_clanarine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fakultet`
--
ALTER TABLE `fakultet`
  MODIFY `id_fakulteta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `izdavac`
--
ALTER TABLE `izdavac`
  MODIFY `id_izdavaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `knjiga`
--
ALTER TABLE `knjiga`
  MODIFY `id_knjige` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posudba`
--
ALTER TABLE `posudba`
  MODIFY `id_posudbe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vrsta_knjiga`
--
ALTER TABLE `vrsta_knjiga`
  MODIFY `id_vrstaknjige` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clanarina`
--
ALTER TABLE `clanarina`
  ADD CONSTRAINT `id_studenta` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id_student`);

--
-- Constraints for table `knjiga`
--
ALTER TABLE `knjiga`
  ADD CONSTRAINT `id_autora` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`),
  ADD CONSTRAINT `id_izdavaca` FOREIGN KEY (`id_izdavaca`) REFERENCES `izdavac` (`id_izdavaca`),
  ADD CONSTRAINT `id_vrstaknjige` FOREIGN KEY (`id_vrstaknjige`) REFERENCES `vrsta_knjiga` (`id_vrstaknjige`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id_student`);

--
-- Constraints for table `posudba`
--
ALTER TABLE `posudba`
  ADD CONSTRAINT `posudba_ibfk_1` FOREIGN KEY (`id_knjige`) REFERENCES `knjiga` (`id_knjige`),
  ADD CONSTRAINT `posudba_ibfk_2` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id_student`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `id_fakulteta` FOREIGN KEY (`id_fakulteta`) REFERENCES `fakultet` (`id_fakulteta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
