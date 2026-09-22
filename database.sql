-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 22 sep 2026 om 07:27
-- Serverversie: 9.1.0
-- PHP-versie: 8.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_buddy_systeem`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `berichten`
--

CREATE TABLE `berichten` (
  `id` int NOT NULL,
  `buddy_id` int NOT NULL,
  `naam` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefoon` varchar(20) DEFAULT NULL,
  `bericht` text NOT NULL,
  `gelezen` tinyint(1) DEFAULT '0',
  `verstuurd_op` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `buddies`
--

CREATE TABLE `buddies` (
  `id` int NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `achternaam` varchar(50) NOT NULL,
  `woonplaats` varchar(100) DEFAULT NULL,
  `bio` text,
  `beschikbaarheid` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefoon` varchar(20) DEFAULT NULL,
  `actief` tinyint(1) DEFAULT '1',
  `aangemaakt_op` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `buddies`
--

INSERT INTO `buddies` (`id`, `voornaam`, `achternaam`, `woonplaats`, `bio`, `beschikbaarheid`, `email`, `telefoon`, `actief`, `aangemaakt_op`) VALUES
(5, 'kobe', 'amerika', 'afrika\r\n', '', '', '', '', 1, '2026-09-21 12:20:15');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `buddy_onderwerpen`
--

CREATE TABLE `buddy_onderwerpen` (
  `buddy_id` int NOT NULL,
  `onderwerp_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `buddy_onderwerpen`
--

INSERT INTO `buddy_onderwerpen` (`buddy_id`, `onderwerp_id`) VALUES
(5, 5),
(5, 7);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `buddy_talen`
--

CREATE TABLE `buddy_talen` (
  `buddy_id` int NOT NULL,
  `taal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `buddy_talen`
--

INSERT INTO `buddy_talen` (`buddy_id`, `taal_id`) VALUES
(5, 1),
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderwerpen`
--

CREATE TABLE `onderwerpen` (
  `id` int NOT NULL,
  `naam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `onderwerpen`
--

INSERT INTO `onderwerpen` (`id`, `naam`) VALUES
(1, 'Gemeente & documenten'),
(2, 'Zorg & dokter'),
(3, 'Werk zoeken'),
(4, 'Onderwijs & school'),
(5, 'Belasting & toeslagen'),
(6, 'Huisvesting'),
(7, 'Bank & verzekering');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `buddy_id` int NOT NULL,
  `naam` varchar(100) NOT NULL,
  `sterren` tinyint NOT NULL DEFAULT '5',
  `tekst` text,
  `datum` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `talen`
--

CREATE TABLE `talen` (
  `id` int NOT NULL,
  `naam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `talen`
--

INSERT INTO `talen` (`id`, `naam`) VALUES
(1, 'Nederlands'),
(2, 'Engels'),
(3, 'Arabisch'),
(4, 'Turks'),
(5, 'Farsi'),
(6, 'Spaans'),
(7, 'Frans'),
(8, 'Tigrinya'),
(9, 'Urdu'),
(10, 'Portugees');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `berichten`
--
ALTER TABLE `berichten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buddy_id` (`buddy_id`);

--
-- Indexen voor tabel `buddies`
--
ALTER TABLE `buddies`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `buddy_onderwerpen`
--
ALTER TABLE `buddy_onderwerpen`
  ADD PRIMARY KEY (`buddy_id`,`onderwerp_id`),
  ADD KEY `onderwerp_id` (`onderwerp_id`);

--
-- Indexen voor tabel `buddy_talen`
--
ALTER TABLE `buddy_talen`
  ADD PRIMARY KEY (`buddy_id`,`taal_id`),
  ADD KEY `taal_id` (`taal_id`);

--
-- Indexen voor tabel `onderwerpen`
--
ALTER TABLE `onderwerpen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buddy_id` (`buddy_id`);

--
-- Indexen voor tabel `talen`
--
ALTER TABLE `talen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `berichten`
--
ALTER TABLE `berichten`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `buddies`
--
ALTER TABLE `buddies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `onderwerpen`
--
ALTER TABLE `onderwerpen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `talen`
--
ALTER TABLE `talen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `berichten`
--
ALTER TABLE `berichten`
  ADD CONSTRAINT `berichten_ibfk_1` FOREIGN KEY (`buddy_id`) REFERENCES `buddies` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `buddy_onderwerpen`
--
ALTER TABLE `buddy_onderwerpen`
  ADD CONSTRAINT `buddy_onderwerpen_ibfk_1` FOREIGN KEY (`buddy_id`) REFERENCES `buddies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buddy_onderwerpen_ibfk_2` FOREIGN KEY (`onderwerp_id`) REFERENCES `onderwerpen` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `buddy_talen`
--
ALTER TABLE `buddy_talen`
  ADD CONSTRAINT `buddy_talen_ibfk_1` FOREIGN KEY (`buddy_id`) REFERENCES `buddies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buddy_talen_ibfk_2` FOREIGN KEY (`taal_id`) REFERENCES `talen` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`buddy_id`) REFERENCES `buddies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
