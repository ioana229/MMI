-- Prüft, ob die Datenbank "food_db" bereits existiert
-- Wenn sie nicht existiert, wird sie erstellt
CREATE DATABASE IF NOT EXISTS food_db;
USE food_db;

-- Prüft, ob die Tabelle "user" bereits existiert
-- Erstellen der Tabelle user
CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY, --   1.  Eindeutige Benutzer-ID _ NICHT NULL
    username VARCHAR(50) NOT NULL,           --  2.  Benutzername _ NICH NULL
    email VARCHAR(100) UNIQUE NOT NULL,      --  3.  E-Mail-Adresse _ EINMALIG und NICHT NULL
    password_hash VARCHAR(255) NOT NULL,     --  4.  Verschlüsseltes Passwort _ NICHT NULL
    first_name VARCHAR(50),                  --  5.  Vorname
    last_name VARCHAR(50),                   --  6.  Nachname
    phone_number VARCHAR(15),                --  7.  Telefonnummer
    address_id INT,                          --  8.  Verweis auf die Adresse des Benutzers _ FK
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 9.  Erstellungsdatum des Accounts

CREATE TABLE IF NOT EXISTS address (
    address_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,    -- 1. Eindeutige Adresse-ID _ NICHT NULL
    street VARCHAR(100) NOT NULL,                 -- 2. Straße _ NICHT NULL
    city VARCHAR(50) NOT NULL,                    -- 3. Stadt _ NICHT NULL
    state VARCHAR(50),                            -- 4. Bundesland
    postal_code VARCHAR(20) NOT NULL,             -- 5. Postleitzahl _ NICHT NULL
    country VARCHAR(50) NOT NULL,                 -- 6. Land _ NICHT NULL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 7. Erstellungsdatum der Adresse
    FOREIGN KEY (address_id) REFERENCES user(address_id) -- 8. Verknüpfung zur Benutzer-Tabelle
);
