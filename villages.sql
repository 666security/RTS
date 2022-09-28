-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Wrz 2022, 15:48
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
-- Struktura tabeli dla tabeli `villages`
--

CREATE TABLE `villages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `x` varchar(45) DEFAULT NULL,
  `y` varchar(45) DEFAULT NULL,
  `villagers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages`
--

INSERT INTO `villages` (`id`, `name`, `x`, `y`, `villagers_id`) VALUES
(3, 'wioska kamil', NULL, NULL, 3),
(4, 'wioska pawel', NULL, NULL, 1),
(5, 'wioska kacper', NULL, NULL, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`,`villagers_id`),
  ADD KEY `fk_villages_villagers1` (`villagers_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `villages`
--
ALTER TABLE `villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `fk_villages_villagers1` FOREIGN KEY (`villagers_id`) REFERENCES `villagers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
