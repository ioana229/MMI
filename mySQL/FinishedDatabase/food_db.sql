-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 11:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Benutzername` varchar(50) NOT NULL,
  `Passwort_Hash` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Benutzername`, `Passwort_Hash`, `created_on`) VALUES
(1, 'admin1', 'hashed_password_1', '2025-02-04 09:59:08'),
(2, 'admin2', 'hashed_password_2', '2025-02-04 09:59:08'),
(3, 'admin_user', 'new_hashed_password_123', '2025-02-04 10:52:11'),
(5, 'admin', '$2y$10$3/NjTSdKB7b4iupp/8LMl.Ls81HWhvmXq55figV4m70pnnSt5ses6', '2025-02-07 11:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `AdresseID` int(11) NOT NULL,
  `Strasse` varchar(100) DEFAULT NULL,
  `Hausnummer` varchar(10) DEFAULT NULL,
  `Postleitzahl` varchar(10) DEFAULT NULL,
  `Stadt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`AdresseID`, `Strasse`, `Hausnummer`, `Postleitzahl`, `Stadt`) VALUES
(1, 'Main Street jjjj', '123', '10115', 'Munich'),
(2, 'Oak Road', '456', '10234', 'Munich'),
(3, 'hshshshshs', '111', '90517', 'fuerth'),
(9, 'test', '1', '90517', 'fuerth'),
(10, 'hshshshshs', '111', '90517', 'fuerth'),
(11, 'afaf', '1', '9093', 'fdwd');

-- --------------------------------------------------------

--
-- Table structure for table `bestellposten_menue`
--

CREATE TABLE `bestellposten_menue` (
  `BestellID` int(11) NOT NULL,
  `MenueID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellposten_menue`
--

INSERT INTO `bestellposten_menue` (`BestellID`, `MenueID`, `Menge`) VALUES
(2, 2, 1),
(19, 2, 1),
(20, 2, 2),
(21, 3, 1),
(22, 3, 1),
(23, 3, 1),
(24, 3, 1),
(25, 3, 1),
(26, 3, 1),
(33, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bestellposten_produkt`
--

CREATE TABLE `bestellposten_produkt` (
  `BestellID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellposten_produkt`
--

INSERT INTO `bestellposten_produkt` (`BestellID`, `ProduktID`, `Menge`) VALUES
(1, 1, 1),
(2, 2, 1),
(17, 3, 1),
(21, 2, 1),
(21, 3, 1),
(28, 2, 1),
(28, 3, 1),
(31, 3, 1),
(32, 3, 1),
(33, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bestellung`
--

CREATE TABLE `bestellung` (
  `BestellID` int(11) NOT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bestelldatum` timestamp NOT NULL DEFAULT current_timestamp(),
  `Gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `Zahlungsart` enum('Credit Card','Master Card','Barzahlung') DEFAULT NULL,
  `Status` enum('Bestellt','In Zubereitung','Abgeschlossen','Stoniert') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellung`
--

INSERT INTO `bestellung` (`BestellID`, `KundenID`, `Bestelldatum`, `Gesamtbetrag`, `Zahlungsart`, `Status`) VALUES
(1, 1, '2025-02-10 08:49:47', 120.00, 'Credit Card', 'Abgeschlossen'),
(2, 2, '2025-02-10 08:55:02', 12.99, 'Master Card', 'In Zubereitung'),
(4, 1, '2025-02-10 08:52:25', 99.99, 'Credit Card', 'Abgeschlossen'),
(5, 2, '2025-02-04 11:15:07', 150.50, 'Barzahlung', 'Abgeschlossen'),
(6, 3, '2025-02-04 11:15:07', 200.75, '', 'In Zubereitung'),
(7, 15, '2025-02-13 09:48:24', NULL, 'Credit Card', 'Bestellt'),
(8, 15, '2025-02-13 09:52:35', 29.79, 'Credit Card', 'Bestellt'),
(9, 15, '2025-02-13 09:54:14', 19.48, 'Barzahlung', 'Bestellt'),
(10, 15, '2025-02-13 09:55:33', 29.79, 'Credit Card', 'Bestellt'),
(11, 15, '2025-02-13 09:57:31', 29.79, 'Credit Card', 'Bestellt'),
(12, 15, '2025-02-13 09:58:19', 29.79, 'Credit Card', 'Bestellt'),
(13, 15, '2025-02-13 09:59:10', 29.79, 'Credit Card', 'Bestellt'),
(14, 15, '2025-02-13 10:01:04', 29.79, 'Credit Card', 'Bestellt'),
(15, 15, '2025-02-13 10:30:24', 5.99, 'Credit Card', 'Bestellt'),
(16, 15, '2025-02-13 10:30:46', 14.98, 'Credit Card', 'Bestellt'),
(17, 15, '2025-02-13 10:31:43', 7.99, 'Credit Card', 'Bestellt'),
(18, 15, '2025-02-13 10:32:34', 13.49, 'Credit Card', 'Bestellt'),
(19, 15, '2025-02-13 10:33:46', 13.49, 'Credit Card', 'Bestellt'),
(20, 15, '2025-02-13 10:34:13', 26.98, 'Credit Card', 'Bestellt'),
(21, 15, '2025-02-13 10:34:44', 43.77, 'Credit Card', 'Bestellt'),
(22, 15, '2025-02-13 10:49:17', 29.79, 'Credit Card', 'Bestellt'),
(23, 15, '2025-02-13 10:51:15', 29.79, 'Credit Card', 'Bestellt'),
(24, 15, '2025-02-13 10:52:23', 29.79, 'Credit Card', 'Bestellt'),
(25, 15, '2025-02-13 10:54:22', 29.79, 'Credit Card', 'Bestellt'),
(26, 15, '2025-02-13 10:54:58', 29.79, 'Credit Card', 'Bestellt'),
(27, 15, '2025-02-13 10:57:07', 13.98, 'Credit Card', 'Bestellt'),
(28, 15, '2025-02-13 10:57:24', 13.98, 'Credit Card', 'Bestellt'),
(29, 15, '2025-02-14 10:29:25', 29.79, 'Barzahlung', 'Bestellt'),
(30, 15, '2025-02-14 10:29:37', 29.79, 'Barzahlung', 'Bestellt'),
(31, 15, '2025-02-14 10:30:43', 37.78, 'Credit Card', 'Bestellt'),
(32, 15, '2025-02-14 10:31:19', 37.78, 'Credit Card', 'Bestellt'),
(33, 15, '2025-02-14 10:32:46', 37.78, 'Credit Card', 'Bestellt');

-- --------------------------------------------------------

--
-- Table structure for table `bewertung`
--

CREATE TABLE `bewertung` (
  `BewertungsID` int(11) NOT NULL,
  `BildID` int(11) DEFAULT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bewertungsdatum` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IstAktiv` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bewertung`
--

INSERT INTO `bewertung` (`BewertungsID`, `BildID`, `KundenID`, `Bewertungsdatum`, `IstAktiv`) VALUES
(25, 2, 15, '2025-02-14 10:30:07', 0),
(26, 1, 15, '2025-02-14 10:30:01', 1),
(27, 3, 15, '2025-02-14 10:30:06', 0),
(28, 4, 15, '2025-02-13 08:05:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bild`
--

CREATE TABLE `bild` (
  `BildID` int(11) NOT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bilddatei` varchar(255) NOT NULL,
  `Titel` varchar(100) DEFAULT NULL,
  `Hochladedatum` timestamp NOT NULL DEFAULT current_timestamp(),
  `Freigabestatus` tinyint(1) NOT NULL DEFAULT 0,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bild`
--

INSERT INTO `bild` (`BildID`, `KundenID`, `Bilddatei`, `Titel`, `Hochladedatum`, `Freigabestatus`, `AdminID`) VALUES
(1, 1, 'image_data_1', 'Funny Dinner 1', '2025-02-04 11:30:00', 1, 1),
(2, 2, 'image_data_2', 'Funny Dinner 2', '2025-02-04 13:30:00', 1, 5),
(3, 11, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'wow crazy', '2025-02-06 10:42:07', 1, 5),
(4, 15, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'wow crazy', '2025-02-06 10:42:10', 1, 5),
(5, NULL, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'wow crazy', '2025-02-06 10:59:44', 0, NULL),
(6, NULL, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'wow crazy', '2025-02-06 11:00:24', 0, NULL),
(7, NULL, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'wow crazy', '2025-02-06 11:00:27', 0, NULL),
(8, NULL, 'https://th.bing.com/th/id/OIP.mbZihwjVbGtcHBhGFRR5cQHaF3?w=193&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 'ioanan', '2025-02-06 11:12:56', 0, NULL),
(9, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'burger', '2025-02-13 11:15:43', 0, NULL),
(10, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'jsdf', '2025-02-13 11:16:20', 0, NULL),
(11, 15, 'https://png.pngtaddree.cadom/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.pnqdg', 'wow crazy', '2025-02-13 11:16:39', 0, NULL),
(12, 15, 'https://png.pngtaddree.cadom/pnadg-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.pnadadqdg', 'wow crazy', '2025-02-13 11:17:10', 0, NULL),
(13, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'wow crazy', '2025-02-13 11:40:59', 0, NULL),
(14, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'wow crazy', '2025-02-13 11:42:52', 0, NULL),
(15, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'wow crazy', '2025-02-13 11:44:58', 0, NULL),
(16, 15, 'https://png.pngtree.com/png-clipart/20221001/original/pngtree-fast-food-big-ham-burger-png-image_8648590.png', 'wow crazy', '2025-02-14 10:30:18', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kunde`
--

CREATE TABLE `kunde` (
  `KundenID` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `EMail` varchar(100) NOT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `AdresseID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunde`
--

INSERT INTO `kunde` (`KundenID`, `Vorname`, `Nachname`, `EMail`, `Password_Hash`, `Telefon`, `AdresseID`) VALUES
(1, 'Max', 'Mustermann', 'max@example.com', 'hashed_password_1', '1234567890', 1),
(2, 'Anna', 'Müller', 'anna@example.com', 'hashed_password_2', '0987654321', 2),
(3, 'John', 'Doe', 'john@example.com', 'hashed_password_3', '1122334455', 3),
(7, 'test', 'test', 'test@test.test', '$2y$10$bYnyBe3TUyXmTFeMzVcc2.Atf/ZssudsE89edY3MBYF8CKAiDT7O6', NULL, NULL),
(8, 'test', 'test', 'test1@test.test', '$2y$10$tUjHc7dNIl4gENSUtFwIeOLqMAAxxKNU.PMXdzEaC3.mNHYElxXv2', NULL, NULL),
(9, 'test', 'test', 'test2@test.test', '$2y$10$LUgbcy5UtijAWmbMJSI7Ye4oIIACWwadw9x0FkjfQudo5y/vCQsHK', NULL, NULL),
(10, 'ere', 'wrwr', 'tester2@test.test', '$2y$10$bkvXjYA7OnTnyH.fAY8.Le7s7GX3db60BqjGkKnq5XbA74jKx/Xmi', NULL, NULL),
(11, 'test', 'test', 'testwer2@test.test', '$2y$10$ME/ExqbsSv6N95eOYeoPWOWchjdAQTdPLc8HBFfiS0fNYO8v6G42q', NULL, NULL),
(12, 'test', 'test', 'tq234est2@test.test', '$2y$10$DG6s8RzGRNqHNAxjoZsmKO9o.Op/KMDqlhcQZzROQD2h/ogkPBVOy', NULL, NULL),
(13, 'test', 'test', 'tq2343rest2@test.test', '$2y$10$Qe5H/WKecR986jJusLv8UeRL8p.bEy.cxcfEJXMcmBDlfNKhfRdFi', NULL, NULL),
(14, 'wfkjegjk', 'kgniegn', 'qwsdfse@zsdfsfz.de', '$2y$10$AmtLOC9Pwy45ecarFy67/.8eWqcYhWl.k6jIDGjEc1MNTG1J77tdO', NULL, NULL),
(15, 'user', 'user', 'user@user.user', '$2y$10$/.y2KwEe.enPGXM9SHtKIuIFy3TEvuQ8j5qATtUyFRc9aCGH7hWpa', NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `menue`
--

CREATE TABLE `menue` (
  `MenueID` int(11) NOT NULL,
  `Menuename` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `DiscountPreis` decimal(10,2) NOT NULL,
  `NormalPreis` decimal(10,2) NOT NULL,
  `BildURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menue`
--

INSERT INTO `menue` (`MenueID`, `Menuename`, `Beschreibung`, `DiscountPreis`, `NormalPreis`, `BildURL`) VALUES
(2, 'Dinner Set 2', 'Includes Burger and fries', 13.49, 14.98, ''),
(3, 'Dinner Set 3', 'Includes Pasta Bolognese and salad', 29.79, 34.95, '');

-- --------------------------------------------------------

--
-- Table structure for table `menue_produkt`
--

CREATE TABLE `menue_produkt` (
  `MenueID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL,
  `Menge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menue_produkt`
--

INSERT INTO `menue_produkt` (`MenueID`, `ProduktID`, `Menge`) VALUES
(2, 1, 1),
(2, 2, 1),
(3, 1, 1),
(3, 2, 3),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `ProduktID` int(11) NOT NULL,
  `Produktname` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Energiewert` int(11) DEFAULT NULL,
  `BildURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`ProduktID`, `Produktname`, `Beschreibung`, `Preis`, `Energiewert`, `BildURL`) VALUES
(1, 'Pizza Margherita', 'Classic pizza with tomato, mozzarella, and basil', 8.99, 200, ''),
(2, 'Burger', 'Juicy beef burger with lettuce and cheese', 5.99, 400, ''),
(3, 'Pasta Bolognese', 'Pasta with rich bolognese sauce', 7.99, 350, 'https://raw.githubusercontent.com/ioana229/MMI/refs/heads/main/Pics/pommes.webp');

-- --------------------------------------------------------

--
-- Table structure for table `produkt_zutat`
--

CREATE TABLE `produkt_zutat` (
  `ProduktID` int(11) NOT NULL,
  `ZutatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkt_zutat`
--

INSERT INTO `produkt_zutat` (`ProduktID`, `ZutatID`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 3),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rechnung`
--

CREATE TABLE `rechnung` (
  `RechnungsID` int(11) NOT NULL,
  `BestellID` int(11) DEFAULT NULL,
  `Rechnungsdatum` datetime NOT NULL,
  `Betrag` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rechnung`
--

INSERT INTO `rechnung` (`RechnungsID`, `BestellID`, `Rechnungsdatum`, `Betrag`) VALUES
(1, 1, '2025-02-04 12:05:00', 15.99),
(2, 2, '2025-02-04 14:05:00', 12.99);

-- --------------------------------------------------------

--
-- Table structure for table `zutat`
--

CREATE TABLE `zutat` (
  `ZutatID` int(11) NOT NULL,
  `Zutatenname` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zutat`
--

INSERT INTO `zutat` (`ZutatID`, `Zutatenname`, `Beschreibung`) VALUES
(1, 'Tomato', 'Fresh red tomato'),
(2, 'Cheese', 'Mozzarella cheese'),
(3, 'Beef', 'Premium beef patty'),
(4, 'reis', 'reis'),
(5, '123', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Benutzername` (`Benutzername`);

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`AdresseID`);

--
-- Indexes for table `bestellposten_menue`
--
ALTER TABLE `bestellposten_menue`
  ADD PRIMARY KEY (`BestellID`,`MenueID`),
  ADD KEY `MenueID` (`MenueID`);

--
-- Indexes for table `bestellposten_produkt`
--
ALTER TABLE `bestellposten_produkt`
  ADD PRIMARY KEY (`BestellID`,`ProduktID`),
  ADD KEY `ProduktID` (`ProduktID`);

--
-- Indexes for table `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`BestellID`),
  ADD KEY `KundenID` (`KundenID`);

--
-- Indexes for table `bewertung`
--
ALTER TABLE `bewertung`
  ADD PRIMARY KEY (`BewertungsID`),
  ADD KEY `BildID` (`BildID`),
  ADD KEY `KundenID` (`KundenID`);

--
-- Indexes for table `bild`
--
ALTER TABLE `bild`
  ADD PRIMARY KEY (`BildID`),
  ADD KEY `KundenID` (`KundenID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`KundenID`),
  ADD UNIQUE KEY `EMail` (`EMail`),
  ADD KEY `AdresseID` (`AdresseID`);

--
-- Indexes for table `menue`
--
ALTER TABLE `menue`
  ADD PRIMARY KEY (`MenueID`);

--
-- Indexes for table `menue_produkt`
--
ALTER TABLE `menue_produkt`
  ADD PRIMARY KEY (`MenueID`,`ProduktID`),
  ADD KEY `ProduktID` (`ProduktID`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`ProduktID`);

--
-- Indexes for table `produkt_zutat`
--
ALTER TABLE `produkt_zutat`
  ADD PRIMARY KEY (`ProduktID`,`ZutatID`),
  ADD KEY `ZutatID` (`ZutatID`);

--
-- Indexes for table `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`RechnungsID`),
  ADD KEY `BestellID` (`BestellID`);

--
-- Indexes for table `zutat`
--
ALTER TABLE `zutat`
  ADD PRIMARY KEY (`ZutatID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `AdresseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `BestellID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `bewertung`
--
ALTER TABLE `bewertung`
  MODIFY `BewertungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `bild`
--
ALTER TABLE `bild`
  MODIFY `BildID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kunde`
--
ALTER TABLE `kunde`
  MODIFY `KundenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menue`
--
ALTER TABLE `menue`
  MODIFY `MenueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `ProduktID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `RechnungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zutat`
--
ALTER TABLE `zutat`
  MODIFY `ZutatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestellposten_menue`
--
ALTER TABLE `bestellposten_menue`
  ADD CONSTRAINT `bestellposten_menue_ibfk_1` FOREIGN KEY (`BestellID`) REFERENCES `bestellung` (`BestellID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bestellposten_menue_ibfk_2` FOREIGN KEY (`MenueID`) REFERENCES `menue` (`MenueID`) ON DELETE CASCADE;

--
-- Constraints for table `bestellposten_produkt`
--
ALTER TABLE `bestellposten_produkt`
  ADD CONSTRAINT `bestellposten_produkt_ibfk_1` FOREIGN KEY (`BestellID`) REFERENCES `bestellung` (`BestellID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bestellposten_produkt_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`) ON DELETE CASCADE;

--
-- Constraints for table `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KundenID`) REFERENCES `kunde` (`KundenID`);

--
-- Constraints for table `bewertung`
--
ALTER TABLE `bewertung`
  ADD CONSTRAINT `bewertung_ibfk_1` FOREIGN KEY (`BildID`) REFERENCES `bild` (`BildID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bewertung_ibfk_2` FOREIGN KEY (`KundenID`) REFERENCES `kunde` (`KundenID`) ON DELETE CASCADE;

--
-- Constraints for table `bild`
--
ALTER TABLE `bild`
  ADD CONSTRAINT `bild_ibfk_1` FOREIGN KEY (`KundenID`) REFERENCES `kunde` (`KundenID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bild_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`) ON DELETE SET NULL;

--
-- Constraints for table `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `kunde_ibfk_1` FOREIGN KEY (`AdresseID`) REFERENCES `adresse` (`AdresseID`);

--
-- Constraints for table `menue_produkt`
--
ALTER TABLE `menue_produkt`
  ADD CONSTRAINT `menue_produkt_ibfk_1` FOREIGN KEY (`MenueID`) REFERENCES `menue` (`MenueID`) ON DELETE CASCADE,
  ADD CONSTRAINT `menue_produkt_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`) ON DELETE CASCADE;

--
-- Constraints for table `produkt_zutat`
--
ALTER TABLE `produkt_zutat`
  ADD CONSTRAINT `produkt_zutat_ibfk_1` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`) ON DELETE CASCADE,
  ADD CONSTRAINT `produkt_zutat_ibfk_2` FOREIGN KEY (`ZutatID`) REFERENCES `zutat` (`ZutatID`) ON DELETE CASCADE;

--
-- Constraints for table `rechnung`
--
ALTER TABLE `rechnung`
  ADD CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`BestellID`) REFERENCES `bestellung` (`BestellID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
