-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Wrz 2022, 10:28
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `buildings`
--

INSERT INTO `buildings` (`id`, `name`) VALUES
(1, 'dol z gliny'),
(2, 'huta zelaza'),
(3, 'huta drwala');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resources`
--

CREATE TABLE `resources` (
  `resources_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `resources`
--

INSERT INTO `resources` (`resources_id`, `name`, `description`) VALUES
(1, 'drewno', NULL),
(2, 'glina', NULL),
(3, 'zelazo', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `troops`
--

CREATE TABLE `troops` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `damage` varchar(45) DEFAULT NULL,
  `distance.damage` varchar(45) DEFAULT NULL,
  `defense` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `troops`
--

INSERT INTO `troops` (`id`, `name`, `description`, `damage`, `distance.damage`, `defense`) VALUES
(1, 'lucznik', NULL, NULL, NULL, NULL),
(2, 'rycerz', NULL, NULL, NULL, NULL),
(3, 'miecznik', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villagers`
--

CREATE TABLE `villagers` (
  `id` int(11) NOT NULL,
  `nick` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villagers`
--

INSERT INTO `villagers` (`id`, `nick`, `email`, `password`) VALUES
(1, 'pawel', 'pawel@gmail.com', '123'),
(2, 'kacper', 'kacper@gmail.com', '1234'),
(3, 'kamil', 'kamil@gmail.com', 'kamil123');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages`
--

CREATE TABLE `villages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `x` varchar(45) DEFAULT NULL,
  `y` varchar(45) DEFAULT NULL,
  `playerid` int(11) DEFAULT NULL,
  `villagers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages`
--

INSERT INTO `villages` (`id`, `name`, `x`, `y`, `playerid`, `villagers_id`) VALUES
(3, 'wioska kamil', NULL, NULL, NULL, 3),
(4, 'wioska pawel', NULL, NULL, NULL, 1),
(5, 'wioska kacper', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_buildings`
--

CREATE TABLE `villages_has_buildings` (
  `villages_id` int(11) NOT NULL,
  `villages_villagers_id` int(11) NOT NULL,
  `buildings_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_buildings`
--

INSERT INTO `villages_has_buildings` (`villages_id`, `villages_villagers_id`, `buildings_id`) VALUES
(3, 0, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_resources`
--

CREATE TABLE `villages_has_resources` (
  `villages_id` int(11) NOT NULL,
  `villages_villagers_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_resources`
--

INSERT INTO `villages_has_resources` (`villages_id`, `villages_villagers_id`, `resources_id`, `value`) VALUES
(3, 0, 1, 500),
(4, 0, 1, 300),
(5, 0, 1, 300);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_troops`
--

CREATE TABLE `villages_has_troops` (
  `villages_id` int(11) NOT NULL,
  `villages_villagers_id` int(11) NOT NULL,
  `troops_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_troops`
--

INSERT INTO `villages_has_troops` (`villages_id`, `villages_villagers_id`, `troops_id`, `value`) VALUES
(3, 0, 2, 10);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resources_id`);

--
-- Indeksy dla tabeli `troops`
--
ALTER TABLE `troops`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `villagers`
--
ALTER TABLE `villagers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`,`villagers_id`),
  ADD KEY `fk_villages_villagers1` (`villagers_id`);

--
-- Indeksy dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD PRIMARY KEY (`villages_id`,`villages_villagers_id`,`buildings_id`),
  ADD KEY `fk_villages_has_buildings_buildings1` (`buildings_id`);

--
-- Indeksy dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD PRIMARY KEY (`villages_id`,`villages_villagers_id`,`resources_id`);

--
-- Indeksy dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD PRIMARY KEY (`villages_id`,`villages_villagers_id`,`troops_id`),
  ADD KEY `fk_villages_has_troops_troops1` (`troops_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `resources`
--
ALTER TABLE `resources`
  MODIFY `resources_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `troops`
--
ALTER TABLE `troops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villagers`
--
ALTER TABLE `villagers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages`
--
ALTER TABLE `villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `fk_villages_villagers1` FOREIGN KEY (`villagers_id`) REFERENCES `villagers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD CONSTRAINT `fk_villages_has_buildings_buildings1` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_buildings_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD CONSTRAINT `fk_villages_has_resources_resources1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`resources_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_resources_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD CONSTRAINT `fk_villages_has_troops_troops1` FOREIGN KEY (`troops_id`) REFERENCES `troops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_troops_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
