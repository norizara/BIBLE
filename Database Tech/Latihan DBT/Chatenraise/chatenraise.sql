-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2022 at 06:55 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatenraise`
--

-- --------------------------------------------------------

--
-- Table structure for table `mscake`
--

CREATE TABLE `mscake` (
  `CakeID` char(5) NOT NULL,
  `CakeName` varchar(50) DEFAULT NULL,
  `CakeDescription` varchar(100) DEFAULT NULL,
  `CakePrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mscake`
--

INSERT INTO `mscake` (`CakeID`, `CakeName`, `CakeDescription`, `CakePrice`) VALUES
('CK001', 'Legendary Fresh Cream Cake', 'Cake for sad people', 60000),
('CK002', 'Crispy Chocolate Cake', 'For rejected people from confese', 65000),
('CK003', 'Souffle Cheese Cake', 'EN favorite cake when sad', 55000),
('CK004', 'White Zebra', 'For broken heart guy', 70000),
('CK005', 'Baked Cheese Cake', 'Classic cheese cake', 65000),
('CK006', 'Happy Little Bear Cake', 'Cute bear that accompanies you to eat cake', 75000),
('CK007', 'Dorayaki Pancake', 'Doraemon\'s favorite food', 30000),
('CK008', 'Baked Cheese Tart', 'Mom\'s favorite cheese tart', 45000),
('CK009', 'Swiss Roll', 'Rolled cake with cream', 15000),
('CK010', 'Cube Cake', 'Sponge cake with mixed fruits', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerPhone` varchar(15) NOT NULL,
  `CustomerGender` varchar(10) NOT NULL,
  `CustomerAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mscustomer`
--

INSERT INTO `mscustomer` (`CustomerID`, `CustomerName`, `CustomerEmail`, `CustomerPhone`, `CustomerGender`, `CustomerAddress`) VALUES
('CU001', 'Clarissa Salim', 'Clarissa@gmail.com', '082183921834', 'Female', 'Sandang Street'),
('CU002', 'Erwin', 'Erwin@binus.ac.id', '082122221939', 'Male', 'Vikamas Street'),
('CU003', 'Martha Julieta', 'Julietalukas@binus.ac.id', '081239481029', 'Female', 'Cawang Street'),
('CU004', 'Hansen Artajaya', 'Pisanghansen@binus.ac.id', '081391832913', 'Male', 'Keluarga Street'),
('CU005', 'Andre Setiawan', 'Andrebuaya@gmail.com', '081939271028', 'Male', 'Cengkareng Street'),
('CU006', 'Setiawan Wijaya', 'Setiaterhadapmu@gmail.com', '081928371028', 'Male', 'Panjang Street'),
('CU007', 'Felix Novando', 'Sapifelix@gmail.com', '081923012983', 'Male', 'Mangga Street'),
('CU008', 'Skolastika Gabriella', 'Sgab@gmail.com', '081938191273', 'Female', 'Square Street'),
('CU009', 'Johanes Peter', 'JP@gmail.com', '082918301923', 'Male', 'Pinangsia Street'),
('CU010', 'Jose Giancarlos', 'JGcarls@gmail.com', '082913012938', 'Male', 'Anggur Street');

-- --------------------------------------------------------

--
-- Table structure for table `msstaff`
--

CREATE TABLE `msstaff` (
  `StaffID` char(5) NOT NULL,
  `StaffPositionID` char(5) DEFAULT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `StaffEmail` varchar(50) DEFAULT NULL,
  `StaffPhone` varchar(15) DEFAULT NULL,
  `StaffGender` varchar(10) DEFAULT NULL,
  `StaffAddress` varchar(100) DEFAULT NULL,
  `StaffSalary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msstaff`
--

INSERT INTO `msstaff` (`StaffID`, `StaffPositionID`, `StaffName`, `StaffEmail`, `StaffPhone`, `StaffGender`, `StaffAddress`, `StaffSalary`) VALUES
('ST001', 'SP001', 'Renaldy', 'Renaldy@gmail.com', '082193841028', 'Male', 'Tanjung Duren Street', 2000000),
('ST002', 'SP001', 'Helena Ivan', 'Helenaivan@gmail.com', '082713942813', 'Female', 'Bungur Street', 3000000),
('ST003', 'SP002', 'Virgie Cecillia', 'Virgiececillia@gmail.com', '081238561927', 'Female', 'Bogor Street', 1500000),
('ST004', 'SP002', 'Christina Joceline', 'Christina@binus.ac.id', '081392340183', 'Female', 'Sunter Street', 2000000),
('ST005', 'SP003', 'Ivana Simanjuntak', 'Ivanasimanjuntak@binus.ac.id', '081293842018', 'Female', 'Tanjung Street', 3000000),
('ST006', 'SP004', 'Jose Armando', 'Josearmando@gmail.com', '081392830182', 'Male', 'Pluit Street', 1500000),
('ST007', 'SP003', 'Agustian Rinaldy', 'Agustianrinaldy@binus.ac.id', '081927382837', 'Male', 'Cawang Baru Street', 5000000),
('ST008', 'SP005', 'Lukas Teja', 'Lukas@binus.ac.id', '082937491182', 'Male', 'Kalimati Street', 6000000),
('ST009', 'SP003', 'Gratia Honestha', 'Gratia@gmail.com', '081938294019', 'Female', 'U28 Street', 2000000),
('ST010', 'SP005', 'Niko', 'Niko@gmail.com', '081832941029', 'Male', 'Jomblo Street', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `msstaffposition`
--

CREATE TABLE `msstaffposition` (
  `StaffPositionID` char(5) NOT NULL,
  `StaffPositionName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msstaffposition`
--

INSERT INTO `msstaffposition` (`StaffPositionID`, `StaffPositionName`) VALUES
('SP001', 'Kitchen Prep'),
('SP002', 'Specialty Chef'),
('SP003', 'Head Pastry'),
('SP004', 'Cake Decorator'),
('SP005', 'Pastry Chef');

-- --------------------------------------------------------

--
-- Table structure for table `mstransaction`
--

CREATE TABLE `mstransaction` (
  `TransactionID` char(5) NOT NULL,
  `CustomerID` char(5) DEFAULT NULL,
  `StaffID` char(5) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mstransaction`
--

INSERT INTO `mstransaction` (`TransactionID`, `CustomerID`, `StaffID`, `TransactionDate`) VALUES
('TR001', 'CU001', 'ST002', '2022-07-10'),
('TR002', 'CU002', 'ST001', '2022-07-11'),
('TR003', 'CU003', 'ST004', '2022-07-12'),
('TR004', 'CU004', 'ST005', '2022-07-13'),
('TR005', 'CU005', 'ST003', '2022-07-15'),
('TR006', 'CU006', 'ST006', '2022-07-16'),
('TR007', 'CU007', 'ST007', '2022-07-18'),
('TR008', 'CU008', 'ST008', '2022-07-20'),
('TR009', 'CU009', 'ST009', '2022-08-01'),
('TR010', 'CU010', 'ST010', '2022-08-03'),
('TR011', 'CU001', 'ST003', '2022-08-05'),
('TR012', 'CU003', 'ST005', '2022-08-07'),
('TR013', 'CU005', 'ST003', '2022-08-08'),
('TR014', 'CU006', 'ST002', '2022-08-10'),
('TR015', 'CU002', 'ST009', '2022-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `CakeID` char(5) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactiondetail`
--

INSERT INTO `transactiondetail` (`TransactionID`, `CakeID`, `Quantity`) VALUES
('TR001', 'CK001', 1),
('TR001', 'CK002', 2),
('TR002', 'CK003', 4),
('TR003', 'CK004', 5),
('TR004', 'CK005', 2),
('TR004', 'CK006', 3),
('TR005', 'CK007', 1),
('TR005', 'CK008', 4),
('TR006', 'CK009', 2),
('TR007', 'CK010', 5),
('TR008', 'CK001', 1),
('TR008', 'CK002', 2),
('TR008', 'CK003', 3),
('TR009', 'CK002', 2),
('TR009', 'CK004', 5),
('TR010', 'CK004', 1),
('TR010', 'CK006', 4),
('TR011', 'CK008', 3),
('TR012', 'CK009', 1),
('TR013', 'CK010', 2),
('TR014', 'CK001', 4),
('TR014', 'CK002', 1),
('TR014', 'CK010', 3),
('TR015', 'CK003', 3),
('TR015', 'CK004', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mscake`
--
ALTER TABLE `mscake`
  ADD PRIMARY KEY (`CakeID`);

--
-- Indexes for table `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `msstaff`
--
ALTER TABLE `msstaff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `fkPositionID` (`StaffPositionID`);

--
-- Indexes for table `msstaffposition`
--
ALTER TABLE `msstaffposition`
  ADD PRIMARY KEY (`StaffPositionID`);

--
-- Indexes for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `fkCust` (`CustomerID`),
  ADD KEY `fkStaff` (`StaffID`);

--
-- Indexes for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD PRIMARY KEY (`TransactionID`,`CakeID`),
  ADD KEY `fkCake` (`CakeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `msstaff`
--
ALTER TABLE `msstaff`
  ADD CONSTRAINT `fkPositionID` FOREIGN KEY (`StaffPositionID`) REFERENCES `msstaffposition` (`StaffPositionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD CONSTRAINT `fkCust` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkStaff` FOREIGN KEY (`StaffID`) REFERENCES `msstaff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `fkCake` FOREIGN KEY (`CakeID`) REFERENCES `mscake` (`CakeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkTrans` FOREIGN KEY (`TransactionID`) REFERENCES `mstransaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
