-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 28. 16:13
-- Kiszolgáló verziója: 10.1.38-MariaDB
-- PHP verzió: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zeneiskola_mysql`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bejelentkezesek`
--

CREATE TABLE `bejelentkezesek` (
  `id` int(11) NOT NULL,
  `fnev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `jelszo` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `jogosultsag` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bejelentkezesek`
--

INSERT INTO `bejelentkezesek` (`id`, `fnev`, `jelszo`, `jogosultsag`, `email`) VALUES
(1, 'admin1', 'admin123', 'admin', 'admin@zeneiskola.hu'),
(2, 'tanar1', 'tanar123', 'tanar', 'tanar.kiss@zeneiskola.hu'),
(3, 'diak1', 'diak123', 'diak', 'diak.nagy@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diakok`
--

CREATE TABLE `diakok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `telefonsz` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szulDatum` date NOT NULL,
  `sajatHangszer` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `diakok`
--

INSERT INTO `diakok` (`id`, `nev`, `telefonsz`, `email`, `szulDatum`, `sajatHangszer`) VALUES
(1, 'Nagy János', '+36301234567', 'nagy.janos@gmail.com', '2010-05-15', 'Yamaha gitár'),
(2, 'Kiss Anna', '+36209876543', 'kiss.anna@gmail.com', '2011-08-22', NULL),
(3, 'Szabó Péter', '+36301112233', 'szabo.peter@gmail.com', '2009-11-30', 'Casio billentyűzet');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hangszerek`
--

CREATE TABLE `hangszerek` (
  `id` int(11) NOT NULL,
  `katId` int(11) NOT NULL,
  `leltarId` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `hangszerek`
--

INSERT INTO `hangszerek` (`id`, `katId`, `leltarId`, `nev`) VALUES
(1, 1, 1, 'Yamaha C40 klasszikus gitár'),
(2, 2, 2, 'Yamaha YTR-2330 trombit'),
(3, 3, 3, 'Pearl RS525SC/C Export dobfelszerelés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int(11) NOT NULL,
  `katNev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `katNev`) VALUES
(1, 'Húros hangszerek'),
(2, 'Fúvós hangszerek'),
(3, 'Ütős hangszerek');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kimittud`
--

CREATE TABLE `kimittud` (
  `tanarId` int(11) NOT NULL,
  `hangszerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kimittud`
--

INSERT INTO `kimittud` (`tanarId`, `hangszerId`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzesek`
--

CREATE TABLE `kolcsonzesek` (
  `id` int(11) NOT NULL,
  `hangszerId` int(11) NOT NULL,
  `diakId` int(11) NOT NULL,
  `kolcsKezd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kolcsVeg` date NOT NULL,
  `megjegyzes` text COLLATE utf8_hungarian_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kolcsonzesek`
--

INSERT INTO `kolcsonzesek` (`id`, `hangszerId`, `diakId`, `kolcsKezd`, `kolcsVeg`, `megjegyzes`) VALUES
(1, 1, 1, '2024-01-09 23:00:00', '2024-06-10', 'Heti 1 óra gitár órára'),
(2, 2, 2, '2024-01-31 23:00:00', '2024-07-01', 'Versenyre készülés'),
(3, 3, 3, '2024-03-14 23:00:00', '2024-05-15', 'Rövid távú kölcsönzés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `leltarak`
--

CREATE TABLE `leltarak` (
  `id` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `elerhetoseg` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `leltarak`
--

INSERT INTO `leltarak` (`id`, `ar`, `elerhetoseg`) VALUES
(1, 150000, 1),
(2, 200000, 1),
(3, 80000, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orak`
--

CREATE TABLE `orak` (
  `id` int(11) NOT NULL,
  `tanarId` int(11) NOT NULL,
  `diakId` int(11) NOT NULL,
  `tema` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orak`
--

INSERT INTO `orak` (`id`, `tanarId`, `diakId`, `tema`) VALUES
(1, 1, 1, 'Gitár alapok - akkordok'),
(2, 2, 2, 'Dobolás technikák'),
(3, 3, 3, 'Trombita szólamok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanarok`
--

CREATE TABLE `tanarok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `telefonsz` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanarok`
--

INSERT INTO `tanarok` (`id`, `nev`, `telefonsz`, `email`) VALUES
(1, 'Kovács István', '+36201234567', 'kovacs.istvan@zeneiskola.hu'),
(2, 'Tóth Éva', '+36309876543', 'toth.eva@zeneiskola.hu'),
(3, 'Molnár Gábor', '+36201112233', 'molnar.gabor@zeneiskola.hu');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bejelentkezesek`
--
ALTER TABLE `bejelentkezesek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `diakok`
--
ALTER TABLE `diakok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hangszerek`
--
ALTER TABLE `hangszerek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `katId` (`katId`),
  ADD KEY `leltarId` (`leltarId`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kimittud`
--
ALTER TABLE `kimittud`
  ADD PRIMARY KEY (`tanarId`,`hangszerId`),
  ADD KEY `hangszerId` (`hangszerId`);

--
-- A tábla indexei `kolcsonzesek`
--
ALTER TABLE `kolcsonzesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hangszerId` (`hangszerId`),
  ADD KEY `diakId` (`diakId`);

--
-- A tábla indexei `leltarak`
--
ALTER TABLE `leltarak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orak`
--
ALTER TABLE `orak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanarId` (`tanarId`),
  ADD KEY `diakId` (`diakId`);

--
-- A tábla indexei `tanarok`
--
ALTER TABLE `tanarok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bejelentkezesek`
--
ALTER TABLE `bejelentkezesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `diakok`
--
ALTER TABLE `diakok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `hangszerek`
--
ALTER TABLE `hangszerek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kolcsonzesek`
--
ALTER TABLE `kolcsonzesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `leltarak`
--
ALTER TABLE `leltarak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `orak`
--
ALTER TABLE `orak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `tanarok`
--
ALTER TABLE `tanarok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `hangszerek`
--
ALTER TABLE `hangszerek`
  ADD CONSTRAINT `hangszerek_ibfk_1` FOREIGN KEY (`katId`) REFERENCES `kategoriak` (`id`),
  ADD CONSTRAINT `hangszerek_ibfk_2` FOREIGN KEY (`leltarId`) REFERENCES `leltarak` (`id`);

--
-- Megkötések a táblához `kimittud`
--
ALTER TABLE `kimittud`
  ADD CONSTRAINT `kimittud_ibfk_1` FOREIGN KEY (`tanarId`) REFERENCES `tanarok` (`id`),
  ADD CONSTRAINT `kimittud_ibfk_2` FOREIGN KEY (`hangszerId`) REFERENCES `hangszerek` (`id`);

--
-- Megkötések a táblához `kolcsonzesek`
--
ALTER TABLE `kolcsonzesek`
  ADD CONSTRAINT `kolcsonzesek_ibfk_1` FOREIGN KEY (`hangszerId`) REFERENCES `hangszerek` (`id`),
  ADD CONSTRAINT `kolcsonzesek_ibfk_2` FOREIGN KEY (`diakId`) REFERENCES `diakok` (`id`);

--
-- Megkötések a táblához `orak`
--
ALTER TABLE `orak`
  ADD CONSTRAINT `orak_ibfk_1` FOREIGN KEY (`tanarId`) REFERENCES `tanarok` (`id`),
  ADD CONSTRAINT `orak_ibfk_2` FOREIGN KEY (`diakId`) REFERENCES `diakok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
