-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2025 at 12:45 PM
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
(1, 'admin', '$2y$10$b4Lkn0OFkZbvgglIyqy03ufJhltwpHzi2n2LgqD/J.BHxKpzrgZbi', '2025-03-18 09:32:43');

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
  `Land` enum('Deutschland') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`AdresseID`, `Strasse`, `Hausnummer`, `Postleitzahl`, `Stadt`, `Land`) VALUES
(1, 'Musterstrasse', '10', '12345', 'Musterstadt', 'Deutschland'),
(2, 'Beispielweg', '5B', '54321', 'Beispielstadt', 'Deutschland'),
(3, 'Hauptstraße', '99', '10115', 'Berlin', 'Deutschland'),
(4, 'Gartenweg', '7', '80331', 'München', 'Deutschland'),
(5, 'Sonnenallee', '45', '50667', 'Köln', 'Deutschland');

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
(1, 2, 1);

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
(1, 14, 1);

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
(1, 3, '2025-03-18 11:43:40', 68.38, 'Master Card', 'Bestellt');

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
(1, 1, 3, '2025-03-18 11:43:01', 1);

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
(1, 1, 'https://thumbs.dreamstime.com/b/food-sculpture-presented-th-annual-canstruction-competition-new-york-november-teams-build-sculptures-out-canned-79956631.jpg', 'Wow!!!', '2025-03-18 11:30:24', 1, 1),
(2, 1, 'https://th.bing.com/th/id/R.a898e7d372eb9850a8adf25bcbe0c0e6?rik=ahGUkk3LKi9Cpw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-9PMOqo1Hj14%2fTjg91yKR5JI%2fAAAAAAAAAmI%2fRgd2qZabd44%2fs1600%2fFunny%2bfood%2bimages%2bpics%2bphotos%2bface.jpg&ehk=NgUb6BGpKXk638SvjWLE', 'Ham-BURGER xD', '2025-03-18 11:31:21', 0, NULL),
(3, 1, 'https://4.bp.blogspot.com/-pdFd6TP_Pcg/T5Z-WSItkLI/AAAAAAAAD-o/wK6fLdRfsDw/s1600/+Funny+food+Pictures+(14).jpg', 'Lustige Birnen', '2025-03-18 11:32:12', 1, 1),
(4, 2, 'https://img.izismile.com/img/img3/20100311/art_food_47.jpg', 'I am Elmo ', '2025-03-18 11:36:27', 1, 1),
(5, 5, 'https://img.izismile.com/img/img13/20201112/640/these_funny_food_pictures_are_totally_gourmet_640_01.jpg', 'Kiwi', '2025-03-18 11:37:16', 1, 1),
(6, 4, 'https://nolink.no', 'I dont know how to use this, please help', '2025-03-18 11:38:39', 0, NULL),
(7, 3, 'https://img.izismile.com/img/img4/20111010/640/funny_food_640_02.jpg', 'WatttttaaarrrMELLOOONNNEE', '2025-03-18 11:41:59', 1, 1);

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
  `AdresseID` int(11) DEFAULT NULL,
  `Status` enum('aktiv','gelöscht') NOT NULL DEFAULT 'aktiv'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunde`
--

INSERT INTO `kunde` (`KundenID`, `Vorname`, `Nachname`, `EMail`, `Password_Hash`, `Telefon`, `AdresseID`, `Status`) VALUES
(1, 'Max', 'Mustermann', 'max.mustermann@muster.de', '$2y$10$Xe/A6zyllkIDMXYL.zsu8.POkrpF2Mu/nBHXhw/m2dD1WqStcg.7G', '+49 123456789', 1, 'aktiv'),
(2, 'Erika', 'Mustermann	', 'Erika.Mustermann@muster.de', '$2y$10$CeVHzcscrWQpKXO.CIuKrOXnNwnU4F/tXMIKKOBKOh6sAyn0o.1mi', '+49 123456789', 2, 'aktiv'),
(3, 'Hans', 'Müller', 'hans.mueller@muster.de', '$2y$10$4SoenRrxQYIefuo0VsP4i.7HOelRbJRetOEg1ZvQRAHWZ6v.ZRvAu', '+49 123456789', 3, 'aktiv'),
(4, 'Lisa', 'Schmidt', 'Lisa.Schmidt@muster.de', '$2y$10$mzgtU24JPj6yTSBU.bABz.KFJIJg92wqrdDFHc/vuaxc1G8YmIH6W', '+49 123456789', 4, 'aktiv'),
(5, 'Thomas', 'Becker', 'Thomas.Becker@muster.de', '$2y$10$e5iIO7ik3ZVDsJGZ0pQjRe/CLHK7GTsbwR1IKHfD71MHcsm7q4UeK', '+49 123456789', 5, 'aktiv');

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
(1, 'AvocadoHeaven', 'Unsere besten Avocado Speisen in einem Menü', 18.29, 21.47, 'https://raw.githubusercontent.com/ioana229/MMI/refs/heads/main/Pics/Nr1.png'),
(2, 'FamilyDinner', 'Eine grosse Auswahl für die ganze Familie', 62.39, 73.38, 'https://raw.githubusercontent.com/ioana229/MMI/refs/heads/main/Pics/Nr2.png'),
(3, 'DrinkMix', 'Alle unsere Erfrischungen in einem Menü', 33.09, 38.94, 'https://raw.githubusercontent.com/ioana229/MMI/refs/heads/main/Pics/Nr3.png'),
(4, 'MacApple Favorite', 'Unnsere Lieblingsprodukte in einem Menü', 21.29, 24.96, 'https://raw.githubusercontent.com/ioana229/MMI/refs/heads/main/Pics/Nr4.png');

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
(1, 1, 1),
(1, 9, 1),
(1, 16, 1),
(2, 1, 2),
(2, 4, 2),
(2, 5, 1),
(2, 7, 1),
(2, 12, 1),
(2, 13, 1),
(2, 14, 1),
(2, 15, 1),
(2, 16, 1),
(2, 17, 1),
(3, 9, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(3, 13, 1),
(3, 14, 1),
(4, 2, 1),
(4, 6, 1),
(4, 14, 1),
(4, 15, 1);

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
(1, 'Avocado-Tomaten-Toast', 'Vollkornbrot mit cremiger Avocado, frischen Tomaten und einem Hauch Zitronensaft.\r\nZutaten: Vollkornbrot, Avocado, Tomaten, Zitronensaft, Olivenöl, Salz, Pfeffer.', 7.99, 350, 'https://www.eatwholly.com/wp-content/uploads/2022/07/wholly-pan-roasted-tomato-avocado-toast-chunky.jpg'),
(2, 'Griechischer Salat', ' Ein klassischer griechischer Salat mit Gurke, Feta, Oliven und roten Zwiebeln.\r\nZutaten: Gurke, Tomaten, Feta, schwarze Oliven, rote Zwiebel, Olivenöl, Oregano.', 8.99, 300, 'https://cupfulofkale.com/wp-content/uploads/2023/05/Vegan-Greek-Salad.jpg.webp'),
(3, 'Veggie Wrap', 'Ein Wrap mit gegrilltem Gemüse, Salat und einer leichten Joghurt-Kräuter-Sauce.\r\nZutaten: Vollkornwrap, Zucchini, Paprika, Aubergine, Salat, Joghurt, Dill, Zitronensaft.', 6.99, 400, 'https://shopifyapp.teamiblends.com/assets/uploads/recipes-blogs/grilled%20veggie%20wrap.png'),
(4, 'Hummus mit Gemüsesticks', 'Cremiger Hummus, serviert mit frischen Gemüsesticks wie Karotten, Sellerie und Paprika.\r\nZutaten: Kichererbsen, Tahini, Olivenöl, Knoblauch, Zitronensaft, Karotten, Sellerie, Paprika.', 3.99, 250, 'https://rezept-db.womenshealth.de/image/rezept-db/jsonLd1x1/1619969398832-608ec576b415da0007c3ce6e.webp'),
(5, 'Hühnchen mit Honig-Senf-Dressing', 'Gegrilltes Hühnchen, serviert mit einem süß-sauren Honig-Senf-Dressing und einem Salat.\r\nZutaten: Hühnchenbrust, Honig, Senf, Olivenöl, Salat, Zitronensaft.', 11.99, 450, 'https://www.leckerschmecker.me/wp-content/uploads/sites/6/2024/10/honig-senf-haehnchen.jpeg?w=1200'),
(6, 'Gebackene Süßkartoffeln', 'Gebackene Süßkartoffeln, gewürzt mit Rosmarin und Knoblauch.\r\nZutaten: Süßkartoffeln, Rosmarin, Knoblauch, Olivenöl, Salz, Pfeffer.', 4.99, 300, 'https://cdn.gutekueche.de/media/recipe/72495/gebackene-suesskartoffel-mit-chili-con-carne.jpg'),
(7, 'Caesar Salad (leichte Version)', 'Ein klassischer Caesar Salad, leicht abgewandelt mit griechischem Joghurt statt Mayonnaise.\r\nZutaten: Römersalat, gegrilltes Hühnchen, Parmesan, Vollkorn-Croutons, Joghurt, Zitronensaft.', 6.99, 350, 'https://cookingwithayeh.com/wp-content/uploads/2023/11/Healthy-Caesar-Salad-Without-Anchovies-SQ-5.jpg'),
(8, 'Pesto-Zucchini-Nudeln', 'Zucchini-Nudeln mit frischem Basilikum-Pesto und Pinienkernen.\r\nZutaten: Zucchini, Basilikum, Pinienkerne, Parmesan, Olivenöl, Knoblauch.', 13.99, 400, 'https://images.eatsmarter.de/sites/default/files/styles/1600x1200/public/zucchininudeln-mit-rucola-pesto-und-haehnchenbrust-654643.jpg'),
(9, 'Avocado-Smoothie', 'Ein cremiger Smoothie aus Avocado, Banane und Mandelmilch.\r\nZutaten: Avocado, Banane, Mandelmilch, Honig, Eiswürfel.', 7.99, 250, 'https://drinkgoldthread.com/cdn/shop/articles/avocado-smoothie-blog-header.jpg?v=1689797311'),
(10, 'Grüne Smoothie Bowl', 'Eine erfrischende Smoothie Bowl aus Spinat, Banane und Mandelmilch, garniert mit Nüssen und Beeren.\r\nZutaten: Spinat, Banane, Mandelmilch, Beeren, Nüsse, Chiasamen.', 8.99, 300, 'https://images.lecker.de/green-smoothie-bowl/1x1,id=36e48ba8,b=lecker,w=1600,h=,ca=12.42,0,87.58,100,rm=sk.jpeg'),
(11, 'Grüner Detox-Smoothie', 'Ein erfrischender, nährstoffreicher Smoothie aus Spinat, Gurke, Apfel, Zitrone, Ingwer und Kokoswasser. Perfekt für einen Detox-Boost!', 5.99, 180, 'https://www.eat-this.org/wp-content/uploads/2012/11/gruener-smoothie.jpg'),
(12, 'Beeren-Smoothie mit Chia ', 'Eine fruchtige Vitaminbombe mit Erdbeeren, Blaubeeren, Banane, Chia-Samen und Mandelmilch – sättigend und gesund.', 6.49, 250, 'https://beamingbaker.com/wp-content/uploads/2017/05/Triple-Berry-Smoothie-5-Ingredient-Paleo-Vegan-Gluten-Free-Dairy-Free-1.jpg'),
(13, 'Erfrischendes Zitronen-Ingwer-Wasser', 'Ein leichtes, belebendes Getränk mit Zitronenscheiben, Ingwer und Minze – perfekt für den ganzen Tag.', 3.49, 15, 'https://img.chefkoch-cdn.de/rezepte/3024381455217556/bilder/1297047/crop-960x720/heisse-zitrone-mit-kurkuma-und-ingwer.jpg'),
(14, 'Matcha-Eistee mit Minze ', 'Ein wachmachender, gesunder Eistee mit Matcha, frischer Minze, Limette und Agavendicksaft – lecker und belebend.', 5.99, 90, 'https://happy-matcha.com/wp-content/uploads/2020/06/matcha-eistee_happy-matcha-600x600.jpg'),
(15, 'Chia-Pudding mit Beeren', 'Ein cremiger Chia-Pudding mit Kokosmilch, gesüßt mit Honig und getoppt mit frischen Beeren – ballaststoffreich und sättigend.', 4.99, 250, 'https://www.schlankefigur.at/wp-content/uploads/2023/03/Beta_Deckblatt_Chia_Pudding_mit_Beeren-2048x1535.jpg'),
(16, 'Avocado-Schoko-Mousse', 'Eine samtige Schokoladenmousse aus Avocado, Kakaopulver und Datteln – ohne Zucker, aber voller Geschmack!', 5.49, 280, ''),
(17, 'gebackenen Apfelringe mit Zimt', 'Saftige Apfelringe, schonend im Ofen gebacken und mit Zimt verfeinert. Sie sind außen leicht knusprig, innen weich und perfekt als gesunde Alternative zu frittierten Süßigkeiten.', 3.99, 150, 'https://www.gutekueche.at/storage/media/recipe/105701/conv/schnelle-gebackene-apfelringe-default.jpg');

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
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 2),
(2, 5),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 4),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(4, 4),
(4, 5),
(4, 15),
(4, 20),
(4, 21),
(4, 23),
(4, 24),
(4, 25),
(5, 4),
(5, 5),
(5, 17),
(5, 26),
(5, 27),
(5, 28),
(6, 5),
(6, 6),
(6, 7),
(6, 23),
(6, 29),
(6, 30),
(7, 4),
(7, 18),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
(8, 5),
(8, 14),
(8, 23),
(8, 35),
(8, 36),
(8, 37),
(9, 1),
(9, 27),
(9, 38),
(9, 39),
(9, 40),
(10, 38),
(10, 39),
(10, 41),
(10, 42),
(10, 43),
(10, 44),
(11, 4),
(11, 8),
(11, 41),
(11, 45),
(11, 46),
(11, 47),
(12, 38),
(12, 39),
(12, 42),
(12, 44),
(13, 4),
(13, 46),
(13, 48),
(14, 48),
(14, 49),
(14, 50),
(14, 51),
(14, 52),
(15, 27),
(15, 42),
(15, 53),
(16, 1),
(16, 54),
(16, 55),
(17, 45),
(17, 56);

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
(1, 'Avocado', ''),
(2, 'Tomaten', ''),
(3, 'Vollkornbrot', ''),
(4, 'Zitronensaft', ''),
(5, 'Olivenöl', ''),
(6, 'Salz', ''),
(7, 'Pfeffer', ''),
(8, 'Gurke', ''),
(9, 'Feta', ''),
(10, 'Schwarze Oliven', ''),
(11, 'Rote Zwiebeln', ''),
(12, 'Oregano', ''),
(13, 'Vollkornwrap', ''),
(14, 'Zuchini', ''),
(15, 'Paprika', ''),
(16, 'Aubergine', ''),
(17, 'Salat', ''),
(18, 'Joghurt', ''),
(19, 'Dill', ''),
(20, 'Kichererbsen', ''),
(21, 'Tahini', ''),
(23, 'Knoblauch', ''),
(24, 'Karotten', ''),
(25, 'Sellerie', ''),
(26, 'Hühnchenbrust', ''),
(27, 'Honig', ''),
(28, 'Senf', ''),
(29, 'Süßkartoffeln', ''),
(30, 'Rosmarin', ''),
(31, 'Knoblauch', ''),
(32, 'Römersalat', ''),
(33, 'gegrilltes Hühnchen', ''),
(34, 'Vollkorn-Croutons', ''),
(35, 'Parmesam', ''),
(36, 'Basilikum', ''),
(37, 'Pinienkerne', ''),
(38, 'Banane', ''),
(39, 'Mandelmilch', ''),
(40, 'Eiswürfel', ''),
(41, 'Spinat', ''),
(42, 'Beeren', ''),
(43, 'Nüsse', ''),
(44, 'Chiasamen', ''),
(45, 'Apfel', ''),
(46, 'Ingwer', ''),
(47, 'Kokoswasser', ''),
(48, 'Minze', ''),
(49, 'Eistee', ''),
(50, 'Matcha', ''),
(51, 'Limette', ''),
(52, 'Agavendicksaft', ''),
(53, 'Kokosmilch', ''),
(54, 'Kakaopulver', ''),
(55, 'Datteln', ''),
(56, 'Zimt', '');

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
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `AdresseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `BestellID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bewertung`
--
ALTER TABLE `bewertung`
  MODIFY `BewertungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bild`
--
ALTER TABLE `bild`
  MODIFY `BildID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kunde`
--
ALTER TABLE `kunde`
  MODIFY `KundenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menue`
--
ALTER TABLE `menue`
  MODIFY `MenueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `ProduktID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `RechnungsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zutat`
--
ALTER TABLE `zutat`
  MODIFY `ZutatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
