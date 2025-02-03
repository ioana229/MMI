-- Prüft, ob die Datenbank "food_db" bereits existiert
-- Wenn sie nicht existiert, wird sie erstellt
CREATE DATABASE IF NOT EXISTS food_db;
USE food_db;

-- Prüft, ob die Tabelle "user" bereits existiert
-- Erstellen der Tabelle user
CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT PRIMARY KEY, --   1.  Eindeutige Benutzer-ID _ NICHT NULL
    username VARCHAR(50) NOT NULL,           --  2.  Benutzername _ NICH NULL
    email VARCHAR(100) UNIQUE NOT NULL,      --  3.  E-Mail-Adresse _ EINMALIG und NICHT NULL
    password_hash VARCHAR(255) NOT NULL,     --  4.  Verschlüsseltes Passwort _ NICHT NULL
    first_name VARCHAR(50),                  --  5.  Vorname
    last_name VARCHAR(50),                   --  6.  Nachname
    phone_number VARCHAR(15),                --  7.  Telefonnummer
    address TEXT,                            --  8.  Lieferadresse 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 9.  Erstellungsdatum des Accounts
