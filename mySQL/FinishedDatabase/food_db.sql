-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 10:01 AM
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
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Benutzername` varchar(50) NOT NULL,
  `Passwort_Hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Benutzername`, `Passwort_Hash`) VALUES
(1, 'admin1', 'hashed_password_1'),
(2, 'admin2', 'hashed_password_2');

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `AdresseID` int(11) NOT NULL,
  `Strasse` varchar(100) DEFAULT NULL,
  `Hausnummer` varchar(10) DEFAULT NULL,
  `Postleitzahl` varchar(10) DEFAULT NULL,
  `Stadt` varchar(50) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`AdresseID`, `Strasse`, `Hausnummer`, `Postleitzahl`, `Stadt`, `Land`) VALUES
(1, 'Main Street', '123', '10115', 'Berlin', 'Germany'),
(2, 'Oak Road', '456', '10234', 'Munich', 'Germany'),
(3, 'Elm Street', '789', '10345', 'Hamburg', 'Germany');

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
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

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
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bestellung`
--

CREATE TABLE `bestellung` (
  `BestellID` int(11) NOT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bestelldatum` datetime NOT NULL,
  `Gesamtbetrag` decimal(10,2) NOT NULL,
  `AdresseID` int(11) DEFAULT NULL,
  `Zahlungsart` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellung`
--

INSERT INTO `bestellung` (`BestellID`, `KundenID`, `Bestelldatum`, `Gesamtbetrag`, `AdresseID`, `Zahlungsart`) VALUES
(1, 1, '2025-02-04 12:00:00', 15.99, 1, 'Credit Card'),
(2, 2, '2025-02-04 14:00:00', 12.99, 2, 'PayPal'),
(3, 3, '2025-02-04 16:00:00', 19.99, 3, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `bewertung`
--

CREATE TABLE `bewertung` (
  `BewertungsID` int(11) NOT NULL,
  `BildID` int(11) DEFAULT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bewertungspunkte` int(11) DEFAULT NULL CHECK (`Bewertungspunkte` between 1 and 5),
  `Bewertungsdatum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bewertung`
--

INSERT INTO `bewertung` (`BewertungsID`, `BildID`, `KundenID`, `Bewertungspunkte`, `Bewertungsdatum`) VALUES
(1, 1, 1, 5, '2025-02-04 12:45:00'),
(2, 2, 2, 4, '2025-02-04 14:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `bild`
--

CREATE TABLE `bild` (
  `BildID` int(11) NOT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `Bilddatei` varchar(255) NOT NULL,
  `Titel` varchar(100) DEFAULT NULL,
  `Hochladedatum` datetime NOT NULL,
  `Freigabestatus` tinyint(1) DEFAULT 0,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bild`
--

INSERT INTO `bild` (`BildID`, `KundenID`, `Bilddatei`, `Titel`, `Hochladedatum`, `Freigabestatus`, `AdminID`) VALUES
(1, 1, 'image_data_1', 'Funny Dinner 1', '2025-02-04 12:30:00', 1, 1),
(2, 2, 'image_data_2', 'Funny Dinner 2', '2025-02-04 14:30:00', 0, 2);

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
(3, 'John', 'Doe', 'john@example.com', 'hashed_password_3', '1122334455', 3);

-- --------------------------------------------------------

--
-- Table structure for table `menue`
--

CREATE TABLE `menue` (
  `MenueID` int(11) NOT NULL,
  `Menuename` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Preis` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menue`
--

INSERT INTO `menue` (`MenueID`, `Menuename`, `Beschreibung`, `Preis`) VALUES
(1, 'Dinner Set 1', 'Includes Pizza Margherita and a drink', 12.99),
(2, 'Dinner Set 2', 'Includes Burger and fries', 10.99),
(3, 'Dinner Set 3', 'Includes Pasta Bolognese and salad', 11.99);

-- --------------------------------------------------------

--
-- Table structure for table `menue_produkt`
--

CREATE TABLE `menue_produkt` (
  `MenueID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menue_produkt`
--

INSERT INTO `menue_produkt` (`MenueID`, `ProduktID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `ProduktID` int(11) NOT NULL,
  `Produktname` varchar(100) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Energiewert` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`ProduktID`, `Produktname`, `Beschreibung`, `Preis`, `Energiewert`) VALUES
(1, 'Pizza Margherita', 'Classic pizza with tomato, mozzarella, and basil', 8.99, 200),
(2, 'Burger', 'Juicy beef burger with lettuce and cheese', 5.99, 400),
(3, 'Pasta Bolognese', 'Pasta with rich bolognese sauce', 7.99, 350);

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
(2, 2),
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
(2, 2, '2025-02-04 14:05:00', 12.99),
(3, 3, '2025-02-04 16:05:00', 19.99);

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
(3, 'Beef', 'Premium beef patty');

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
  ADD KEY `KundenID` (`KundenID`),
  ADD KEY `LieferadresseID` (`AdresseID`);

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
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `AdresseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `BestellID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bewertung`
--
ALTER TABLE `bewertung`
  MODIFY `BewertungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bild`
--
ALTER TABLE `bild`
  MODIFY `BildID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kunde`
--
ALTER TABLE `kunde`
  MODIFY `KundenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menue`
--
ALTER TABLE `menue`
  MODIFY `MenueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `ProduktID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `RechnungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zutat`
--
ALTER TABLE `zutat`
  MODIFY `ZutatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KundenID`) REFERENCES `kunde` (`KundenID`),
  ADD CONSTRAINT `bestellung_ibfk_2` FOREIGN KEY (`AdresseID`) REFERENCES `adresse` (`AdresseID`);

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
