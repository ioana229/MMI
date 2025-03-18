-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 11:26 AM
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
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `AdresseID` int(11) NOT NULL,
  `Strasse` varchar(100) DEFAULT NULL,
  `Hausnummer` varchar(10) DEFAULT NULL,
  `Postleitzahl` varchar(10) DEFAULT NULL,
  `Stadt` varchar(50) DEFAULT NULL,
  `Land` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `bestellposten_menue`
--

CREATE TABLE `bestellposten_menue` (
  `BestellID` int(11) NOT NULL,
  `MenueID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `bestellposten_produkt`
--

CREATE TABLE `bestellposten_produkt` (
  `BestellID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `bewertung`
--

CREATE TABLE `bewertung` (
  `BewertungsID` int(11) NOT NULL,
  `BildID` int(11) DEFAULT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bewertungsdatum` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IstAktiv` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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
-- Table structure for table `kunde`
--

CREATE TABLE `kunde` (
  `KundenID` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `EMail` varchar(100) NOT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `AdresseID` int(11) DEFAULT NULL,
  `Status` enum('aktiv','gelöscht') NOT NULL DEFAULT 'aktiv'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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
-- Table structure for table `menue_produkt`
--

CREATE TABLE `menue_produkt` (
  `MenueID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL,
  `Menge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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

-- --------------------------------------------------------

--
-- Table structure for table `produkt_zutat`
--

CREATE TABLE `produkt_zutat` (
  `ProduktID` int(11) NOT NULL,
  `ZutatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `zutat`
--

CREATE TABLE `zutat` (
  `ZutatID` int(11) NOT NULL,
  `Zutatenname` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `BildID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
