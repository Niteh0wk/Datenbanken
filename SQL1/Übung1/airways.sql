-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Aug 2024 um 11:30
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `airways`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `actualflight`
--

CREATE TABLE `actualflight` (
  `ActualFlightID` int(11) NOT NULL,
  `ActualTakeOffTime` time DEFAULT NULL,
  `ActualLandingTime` time DEFAULT NULL,
  `FlightNR` int(11) DEFAULT NULL,
  `AircraftNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `actualflight`
--

INSERT INTO `actualflight` (`ActualFlightID`, `ActualTakeOffTime`, `ActualLandingTime`, `FlightNR`, `AircraftNR`) VALUES
(2020, '17:00:00', '19:00:00', 2222, 1111),
(2021, '14:15:00', '18:15:00', 2223, 1112),
(2022, '13:25:00', '01:25:00', 2224, 1113),
(2023, '06:05:00', '20:10:00', 2225, 1114);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aircraft`
--

CREATE TABLE `aircraft` (
  `AircraftNR` int(11) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  `InternationalRegistrationNumber` int(11) DEFAULT NULL,
  `DateOfEntryInService` date DEFAULT NULL,
  `FlightRange` int(11) DEFAULT NULL,
  `Manifacturer` varchar(32) DEFAULT NULL,
  `AirlineCode` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `aircraft`
--

INSERT INTO `aircraft` (`AircraftNR`, `Name`, `InternationalRegistrationNumber`, `DateOfEntryInService`, `FlightRange`, `Manifacturer`, `AirlineCode`) VALUES
(1111, 'Deathjet7', 25470398, '2014-01-01', 2000, 'Röhring', 'RYA'),
(1112, 'Boeing 737', 25978043, '2012-05-14', 2000, 'Boeing', 'BAW'),
(1113, 'Airbus A320', 25094783, '2009-11-17', 2500, 'Airbus', 'SPA'),
(1114, 'Boeing 747', 9872543, '2016-09-25', 3500, 'Boeing', 'ACA'),
(1115, 'Airbus A321', 20938457, '2014-12-24', 3000, 'Airbus', 'SWA');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airline`
--

CREATE TABLE `airline` (
  `AirlineCode` varchar(3) NOT NULL,
  `HeadQuarters` varchar(32) DEFAULT NULL,
  `Name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `airline`
--

INSERT INTO `airline` (`AirlineCode`, `HeadQuarters`, `Name`) VALUES
('ACA', 'Fort Worth', 'American Airlines'),
('BAW', 'London', 'British Airways'),
('RYA', 'London', 'Ryanair'),
('SPA', 'Singapore', 'Singapore Airlines'),
('SWA', 'Dallas', 'Southwest Airlines');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport`
--

CREATE TABLE `airport` (
  `AirportCode` varchar(3) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `Country` varchar(32) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `airport`
--

INSERT INTO `airport` (`AirportCode`, `Name`, `City`, `Country`, `Capacity`) VALUES
('LAP', 'Linz Airport', 'Linz', 'Austria', 2000),
('NYC', 'New York Airport', 'New York', 'United States of America', 5000),
('SYA', 'Sydney Airport', 'Sydney', 'Australia', 3000),
('VEA', 'Vienna Airport', 'Vienna', 'Austria', 1500);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `boardingcard`
--

CREATE TABLE `boardingcard` (
  `BoardingCardID` int(11) NOT NULL,
  `BoardingDate` date DEFAULT NULL,
  `SeatLetter` char(1) DEFAULT NULL,
  `RowNR` int(11) DEFAULT NULL,
  `TicketNR` int(11) DEFAULT NULL,
  `AircraftNR` int(11) DEFAULT NULL,
  `ActualFlightID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `boardingcard`
--

INSERT INTO `boardingcard` (`BoardingCardID`, `BoardingDate`, `SeatLetter`, `RowNR`, `TicketNR`, `AircraftNR`, `ActualFlightID`) VALUES
(1010, '2024-09-12', 'D', 3, 1000, 1111, 2020),
(1011, '2024-09-12', 'A', 1, 1001, 1114, 2021),
(1012, '2024-09-12', 'B', 9, 1002, 1113, 2022),
(1013, '2024-09-12', 'F', 7, 1003, 1112, 2023);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passenger`
--

CREATE TABLE `passenger` (
  `PassengerID` int(11) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  `MrMrs` varchar(3) DEFAULT NULL,
  `Title` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `passenger`
--

INSERT INTO `passenger` (`PassengerID`, `Name`, `MrMrs`, `Title`) VALUES
(1, 'Philipp', 'Mr', 'Doctor'),
(2, 'Ramona', 'Mrs', ''),
(3, 'Robert', 'Mr', 'Academian'),
(4, 'Anna-Lena', 'Mrs', ''),
(5, 'Christopher', 'Mr', 'Noob'),
(6, 'Selina', 'Mrs', 'Crazy Cook'),
(7, 'Leonie', 'Mrs', 'Stapler Sauser');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `scheduledflight`
--

CREATE TABLE `scheduledflight` (
  `DaysOfOperation` tinyint(1) DEFAULT NULL,
  `FlightNR` int(11) NOT NULL,
  `ScheduledDepatureTime` time DEFAULT NULL,
  `ScheduledArrivalTime` time DEFAULT NULL,
  `TicketNR` int(11) DEFAULT NULL,
  `AirlineCode` varchar(3) DEFAULT NULL,
  `DepatureAirport` varchar(3) DEFAULT NULL,
  `ArrivalAirport` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `scheduledflight`
--

INSERT INTO `scheduledflight` (`DaysOfOperation`, `FlightNR`, `ScheduledDepatureTime`, `ScheduledArrivalTime`, `TicketNR`, `AirlineCode`, `DepatureAirport`, `ArrivalAirport`) VALUES
(3, 2222, '16:30:00', '18:30:00', 1000, 'RYA', 'LAP', 'VEA'),
(4, 2223, '14:00:00', '18:00:00', 1001, 'BAW', 'LAP', 'VEA'),
(2, 2224, '13:00:00', '01:00:00', 1002, 'SWA', 'SYA', 'VEA'),
(4, 2225, '06:00:00', '20:00:00', 1003, 'ACA', 'NYC', 'VEA');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seat`
--

CREATE TABLE `seat` (
  `SeatLetter` char(1) NOT NULL,
  `SeatFunction` varchar(32) DEFAULT NULL,
  `RowNR` int(11) NOT NULL,
  `AircraftNR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `seat`
--

INSERT INTO `seat` (`SeatLetter`, `SeatFunction`, `RowNR`, `AircraftNR`) VALUES
('A', 'nothing', 1, 1114),
('B', 'nothing', 9, 1113),
('D', 'nothing', 3, 1111),
('F', 'nothing', 7, 1112);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seatrow`
--

CREATE TABLE `seatrow` (
  `RowNR` int(11) NOT NULL,
  `Class` varchar(32) DEFAULT NULL,
  `AircraftNR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `seatrow`
--

INSERT INTO `seatrow` (`RowNR`, `Class`, `AircraftNR`) VALUES
(1, 'Economy', 1114),
(3, 'Economy', 1111),
(7, 'Business', 1112),
(9, 'Economy', 1113);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `TicketNR` int(11) NOT NULL,
  `PassengerID` int(11) DEFAULT NULL,
  `Currency` char(3) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `DateOfIssue` date DEFAULT NULL,
  `SalesOffice` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ticket`
--

INSERT INTO `ticket` (`TicketNR`, `PassengerID`, `Currency`, `Price`, `DateOfIssue`, `SalesOffice`) VALUES
(1000, 1, 'EUR', 24.99, '2024-08-21', 'Ticketsales.org'),
(1001, 2, 'USD', 89.99, '2024-08-01', 'CheapFlights.com'),
(1002, 3, 'EUR', 49.99, '2024-06-05', 'Ryanair.com'),
(1003, 4, 'GBP', 99.99, '2023-12-12', 'Ticketsales.org'),
(1004, 5, 'GBP', 129.99, '2024-01-25', 'CheapFlights.com');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `actualflight`
--
ALTER TABLE `actualflight`
  ADD PRIMARY KEY (`ActualFlightID`),
  ADD KEY `FlightNR` (`FlightNR`),
  ADD KEY `AircraftNR` (`AircraftNR`);

--
-- Indizes für die Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`AircraftNR`),
  ADD KEY `AirlineCode` (`AirlineCode`);

--
-- Indizes für die Tabelle `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AirlineCode`);

--
-- Indizes für die Tabelle `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AirportCode`);

--
-- Indizes für die Tabelle `boardingcard`
--
ALTER TABLE `boardingcard`
  ADD PRIMARY KEY (`BoardingCardID`),
  ADD KEY `SeatLetter` (`SeatLetter`,`RowNR`),
  ADD KEY `AircraftNR` (`AircraftNR`),
  ADD KEY `ActualFlightID` (`ActualFlightID`);

--
-- Indizes für die Tabelle `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PassengerID`);

--
-- Indizes für die Tabelle `scheduledflight`
--
ALTER TABLE `scheduledflight`
  ADD PRIMARY KEY (`FlightNR`),
  ADD KEY `scheduledflight_ticketnr` (`TicketNR`),
  ADD KEY `scheduledflight_airlinecode` (`AirlineCode`),
  ADD KEY `scheduledflight_dep_airport` (`DepatureAirport`),
  ADD KEY `scheduledflight_arr_airport` (`ArrivalAirport`);

--
-- Indizes für die Tabelle `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatLetter`,`RowNR`,`AircraftNR`),
  ADD KEY `RowNR` (`RowNR`),
  ADD KEY `AircraftNR` (`AircraftNR`);

--
-- Indizes für die Tabelle `seatrow`
--
ALTER TABLE `seatrow`
  ADD PRIMARY KEY (`RowNR`,`AircraftNR`),
  ADD KEY `AircraftNR` (`AircraftNR`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketNR`),
  ADD KEY `PassengerID` (`PassengerID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `actualflight`
--
ALTER TABLE `actualflight`
  ADD CONSTRAINT `actualflight_ibfk_1` FOREIGN KEY (`FlightNR`) REFERENCES `scheduledflight` (`FlightNR`),
  ADD CONSTRAINT `actualflight_ibfk_2` FOREIGN KEY (`AircraftNR`) REFERENCES `aircraft` (`AircraftNR`);

--
-- Constraints der Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`AirlineCode`) REFERENCES `airline` (`AirlineCode`);

--
-- Constraints der Tabelle `boardingcard`
--
ALTER TABLE `boardingcard`
  ADD CONSTRAINT `boardingcard_ibfk_1` FOREIGN KEY (`SeatLetter`,`RowNR`) REFERENCES `seat` (`SeatLetter`, `RowNR`),
  ADD CONSTRAINT `boardingcard_ibfk_2` FOREIGN KEY (`AircraftNR`) REFERENCES `seat` (`AircraftNR`),
  ADD CONSTRAINT `boardingcard_ibfk_3` FOREIGN KEY (`ActualFlightID`) REFERENCES `actualflight` (`ActualFlightID`);

--
-- Constraints der Tabelle `scheduledflight`
--
ALTER TABLE `scheduledflight`
  ADD CONSTRAINT `scheduledflight_airlinecode` FOREIGN KEY (`AirlineCode`) REFERENCES `airline` (`AirlineCode`),
  ADD CONSTRAINT `scheduledflight_arr_airport` FOREIGN KEY (`ArrivalAirport`) REFERENCES `airport` (`AirportCode`),
  ADD CONSTRAINT `scheduledflight_dep_airport` FOREIGN KEY (`DepatureAirport`) REFERENCES `airport` (`AirportCode`),
  ADD CONSTRAINT `scheduledflight_ticketnr` FOREIGN KEY (`TicketNR`) REFERENCES `ticket` (`TicketNR`);

--
-- Constraints der Tabelle `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`RowNR`) REFERENCES `seatrow` (`RowNR`),
  ADD CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`AircraftNR`) REFERENCES `seatrow` (`AircraftNR`);

--
-- Constraints der Tabelle `seatrow`
--
ALTER TABLE `seatrow`
  ADD CONSTRAINT `seatrow_ibfk_1` FOREIGN KEY (`AircraftNR`) REFERENCES `aircraft` (`AircraftNR`);

--
-- Constraints der Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
