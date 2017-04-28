-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2017 at 03:30 AM
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
  `naziv_autora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_autora`, `naziv_autora`) VALUES
(1000, 'Ivo Andric'),
(1001, 'Marko Marulic'),
(1002, 'Tin Ujevic'),
(1003, 'Edgar Allan Poe'),
(1004, 'Ernest Hemingway');

-- --------------------------------------------------------

--
-- Table structure for table `clanarina`
--

CREATE TABLE `clanarina` (
  `id_clanarine` int(11) NOT NULL,
  `datum_uplate` date NOT NULL,
  `iznos` int(11) NOT NULL,
  `id_studenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clanarina`
--

INSERT INTO `clanarina` (`id_clanarine`, `datum_uplate`, `iznos`, `id_studenta`) VALUES
(1, '2017-04-04', 10, 1),
(2, '2017-05-05', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fakultet`
--

CREATE TABLE `fakultet` (
  `id_fakulteta` int(11) NOT NULL,
  `naziv_fakulteta` varchar(255) NOT NULL,
  `adresa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultet`
--

INSERT INTO `fakultet` (`id_fakulteta`, `naziv_fakulteta`, `adresa`) VALUES
(4000, 'Pravni fakultet', 'Matice hrvatske b.b.'),
(4001, 'FSR', 'Matice hrvatske b.b.'),
(4002, 'Ekonomski fakultet', 'Matice hrvatske b.b.');

-- --------------------------------------------------------

--
-- Table structure for table `izdavac`
--

CREATE TABLE `izdavac` (
  `id_izdavaca` int(11) NOT NULL,
  `naziv_izdavaca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `izdavac`
--

INSERT INTO `izdavac` (`id_izdavaca`, `naziv_izdavaca`) VALUES
(2000, 'verbum'),
(2001, 'Matica Hrvatska'),
(2002, 'Skolska knjiga'),
(2003, 'Skolska naknada');

-- --------------------------------------------------------

--
-- Table structure for table `knjiga`
--

CREATE TABLE `knjiga` (
  `id_knjige` int(11) NOT NULL,
  `naziv_knjige` varchar(255) NOT NULL,
  `id_autora` int(11) DEFAULT NULL,
  `id_izdavaca` int(11) DEFAULT NULL,
  `id_vrste` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knjiga`
--

INSERT INTO `knjiga` (`id_knjige`, `naziv_knjige`, `id_autora`, `id_izdavaca`, `id_vrste`) VALUES
(1, 'Na Drini cuprija', 1000, 2000, 3001),
(2, 'Judita', 1001, 2001, 3000),
(3, 'Notturno', 1002, 2001, 3002),
(4, 'Gavran', 1003, 2003, 3000),
(5, 'Kome zvona zvone', 1004, 2000, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `posudba`
--

CREATE TABLE `posudba` (
  `id_posudbe` int(11) NOT NULL,
  `datum_posudbe` date NOT NULL,
  `datum_povratka` date NOT NULL,
  `id_knjige` int(11) DEFAULT NULL,
  `id_studenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posudba`
--

INSERT INTO `posudba` (`id_posudbe`, `datum_posudbe`, `datum_povratka`, `id_knjige`, `id_studenta`) VALUES
(1, '2017-04-05', '2017-04-20', 1, 2),
(2, '2017-04-12', '2017-03-13', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_studenta` int(11) NOT NULL,
  `ime_studenta` varchar(255) NOT NULL,
  `prezime_studenta` varchar(255) NOT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `id_fakulteta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id_studenta`, `ime_studenta`, `prezime_studenta`, `adresa`, `telefon`, `id_fakulteta`) VALUES
(1, 'Marta', 'Ivanic', 'Kralja Zvonimira 13 Mostar', '38763111111', NULL),
(2, 'Patrik', 'Radic', 'Kneza Viseslava 10 Mostar', '38763222222', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vrsta`
--

CREATE TABLE `vrsta` (
  `id_vrste` int(11) NOT NULL,
  `naziv_vrste` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vrsta`
--

INSERT INTO `vrsta` (`id_vrste`, `naziv_vrste`) VALUES
(3000, 'poezija'),
(3001, 'proza'),
(3002, 'drama');

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
  ADD KEY `id_autora` (`id_autora`),
  ADD KEY `id_izdavaca` (`id_izdavaca`),
  ADD KEY `id_vrste` (`id_vrste`);

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
  ADD PRIMARY KEY (`id_studenta`),
  ADD KEY `id_fakulteta` (`id_fakulteta`);

--
-- Indexes for table `vrsta`
--
ALTER TABLE `vrsta`
  ADD PRIMARY KEY (`id_vrste`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;
--
-- AUTO_INCREMENT for table `clanarina`
--
ALTER TABLE `clanarina`
  MODIFY `id_clanarine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fakultet`
--
ALTER TABLE `fakultet`
  MODIFY `id_fakulteta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4003;
--
-- AUTO_INCREMENT for table `izdavac`
--
ALTER TABLE `izdavac`
  MODIFY `id_izdavaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2004;
--
-- AUTO_INCREMENT for table `knjiga`
--
ALTER TABLE `knjiga`
  MODIFY `id_knjige` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `posudba`
--
ALTER TABLE `posudba`
  MODIFY `id_posudbe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id_studenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vrsta`
--
ALTER TABLE `vrsta`
  MODIFY `id_vrste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3003;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clanarina`
--
ALTER TABLE `clanarina`
  ADD CONSTRAINT `clanarina_ibfk_1` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id_studenta`);

--
-- Constraints for table `knjiga`
--
ALTER TABLE `knjiga`
  ADD CONSTRAINT `knjiga_ibfk_1` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`),
  ADD CONSTRAINT `knjiga_ibfk_2` FOREIGN KEY (`id_izdavaca`) REFERENCES `izdavac` (`id_izdavaca`),
  ADD CONSTRAINT `knjiga_ibfk_3` FOREIGN KEY (`id_vrste`) REFERENCES `vrsta` (`id_vrste`);

--
-- Constraints for table `posudba`
--
ALTER TABLE `posudba`
  ADD CONSTRAINT `posudba_ibfk_1` FOREIGN KEY (`id_knjige`) REFERENCES `knjiga` (`id_knjige`),
  ADD CONSTRAINT `posudba_ibfk_2` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id_studenta`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_fakulteta`) REFERENCES `fakultet` (`id_fakulteta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
