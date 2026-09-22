-- ============================================
-- ETBC AT - Buddy Systeem Database
-- Importeer dit bestand in phpMyAdmin (tab Import)
-- ============================================

CREATE DATABASE IF NOT EXISTS etbc_buddy
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE etbc_buddy;

-- ---------- TABEL: buddies ----------
CREATE TABLE buddies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    voornaam VARCHAR(50) NOT NULL,
    achternaam VARCHAR(50) NOT NULL,
    woonplaats VARCHAR(100) DEFAULT NULL,
    bio TEXT,
    beschikbaarheid VARCHAR(255) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    telefoon VARCHAR(20) DEFAULT NULL,
    actief TINYINT(1) DEFAULT 1,
    aangemaakt_op TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- TABEL: talen ----------
CREATE TABLE talen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(50) NOT NULL
);

-- ---------- TABEL: onderwerpen ----------
CREATE TABLE onderwerpen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(100) NOT NULL
);

-- ---------- Koppeltabellen (many-to-many) ----------
CREATE TABLE buddy_talen (
    buddy_id INT NOT NULL,
    taal_id INT NOT NULL,
    PRIMARY KEY (buddy_id, taal_id),
    FOREIGN KEY (buddy_id) REFERENCES buddies(id) ON DELETE CASCADE,
    FOREIGN KEY (taal_id) REFERENCES talen(id) ON DELETE CASCADE
);

CREATE TABLE buddy_onderwerpen (
    buddy_id INT NOT NULL,
    onderwerp_id INT NOT NULL,
    PRIMARY KEY (buddy_id, onderwerp_id),
    FOREIGN KEY (buddy_id) REFERENCES buddies(id) ON DELETE CASCADE,
    FOREIGN KEY (onderwerp_id) REFERENCES onderwerpen(id) ON DELETE CASCADE
);

-- ---------- TABEL: reviews ----------
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buddy_id INT NOT NULL,
    naam VARCHAR(100) NOT NULL,
    sterren TINYINT NOT NULL DEFAULT 5,
    tekst TEXT,
    datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buddy_id) REFERENCES buddies(id) ON DELETE CASCADE
);

-- ---------- TABEL: berichten (contactformulieren) ----------
CREATE TABLE berichten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buddy_id INT NOT NULL,
    naam VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefoon VARCHAR(20) DEFAULT NULL,
    bericht TEXT NOT NULL,
    gelezen TINYINT(1) DEFAULT 0,
    verstuurd_op TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buddy_id) REFERENCES buddies(id) ON DELETE CASCADE
);

-- ============================================
-- VOORBEELD DATA (kan je later verwijderen)
-- ============================================

INSERT INTO talen (naam) VALUES
('Nederlands'), ('Engels'), ('Arabisch'), ('Turks'), ('Farsi'),
('Spaans'), ('Frans'), ('Tigrinya'), ('Urdu'), ('Portugees');

INSERT INTO onderwerpen (naam) VALUES
('Gemeente & documenten'),
('Zorg & dokter'),
('Werk zoeken'),
('Onderwijs & school'),
('Belasting & toeslagen'),
('Huisvesting'),
('Bank & verzekering');

INSERT INTO buddies (voornaam, achternaam, woonplaats, bio, beschikbaarheid, email, telefoon) VALUES
('Fatima', 'El Amrani', 'Amsterdam', 'Ik help je graag met al je vragen over de gemeente en documenten. Ik weet hoe overweldigend het kan zijn in een nieuw land en leg alles rustig en duidelijk uit.', 'Maandag & woensdag avond', 'fatima@etbcat.nl', '0612345678'),
('Yusuf', 'Demir', 'Rotterdam', 'Al 5 jaar help ik nieuwkomers met werk zoeken. Samen maken we je CV, oefenen we sollicitaties en zoeken we vacatures.', 'Dinsdag & donderdag middag', 'yusuf@etbcat.nl', '0698765432'),
('Selam', 'Tesfaye', 'Utrecht', 'Ik help je bij de dokter, het ziekenhuis of het verzekeringspapierwerk. Gezondheid is belangrijk en je moet alles goed begrijpen.', 'Vrijdag & zaterdag ochtend', 'selam@etbcat.nl', '0654321098'),
('Maria', 'Gonzalez', 'Eindhoven', 'Ik help ouders met schoolzaken van hun kinderen: inschrijving, gesprekken met leerkrachten en correspondentie van school.', 'Woensdag & vrijdag', 'maria@etbcat.nl', '0678901234'),
('Omar', 'Haddad', 'Den Haag', 'Belastingen en toeslagen zijn ingewikkeld, ook voor Nederlanders! Ik help je met belastingdienst, toeslagen en papieren.', 'Maandag t/m donderdag avond', 'omar@etbcat.nl', '0645678901');

-- Koppelingen: talen per buddy
INSERT INTO buddy_talen (buddy_id, taal_id) VALUES
(1, 1), (1, 3), (1, 2),
(2, 1), (2, 4), (2, 2),
(3, 1), (3, 8), (3, 2),
(4, 1), (4, 6), (4, 2),
(5, 1), (5, 3), (5, 2);

-- Koppelingen: onderwerpen per buddy
INSERT INTO buddy_onderwerpen (buddy_id, onderwerp_id) VALUES
(1, 1), (1, 6),
(2, 3),
(3, 2), (3, 7),
(4, 4),
(5, 5), (5, 7);

-- Voorbeeld reviews
INSERT INTO reviews (buddy_id, naam, sterren, tekst) VALUES
(1, 'Ahmed K.', 5, 'Fatima heeft me geholpen met mijn verblijfsvergunning papieren. Ze legt alles heel rustig uit. Echt een aanrader!'),
(1, 'Sara M.', 5, 'Zeer vriendelijk en geduldig. Dankzij haar snap ik nu de brieven van de gemeente.'),
(2, 'Mehmet A.', 4, 'Yusuf heeft me geholpen met mijn CV en binnen 2 weken had ik een sollicitatiegesprek.'),
(3, 'Hanna T.', 5, 'Selam is met me meegegaan naar het ziekenhuis. Wat een steun!'),
(5, 'Layla H.', 5, 'Omar heeft me geholpen met de toeslagen. Ik snap het nu eindelijk.');
