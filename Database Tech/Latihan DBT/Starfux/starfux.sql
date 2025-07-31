-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 05:40 AM
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
-- Database: `starfux`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderType` varchar(255) DEFAULT NULL,
  `StaffID` char(5) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `OrderDate`, `OrderType`, `StaffID`, `CustomerName`) VALUES
(1, '2021-01-07', 'Dine In', 'ST001', 'Reynaldy'),
(2, '2021-02-14', 'Dine In', 'ST002', 'Douglas'),
(3, '2021-02-16', 'GoZek', 'ST003', 'Devinca'),
(4, '2021-03-12', 'Dine In', 'ST004', 'Danny'),
(5, '2021-03-20', 'Dine In', 'ST005', 'Reynaldy'),
(6, '2021-04-04', 'GrapPood', 'ST006', 'Danny'),
(7, '2021-04-18', 'Dine In', 'ST007', 'Douglas'),
(8, '2021-05-04', 'GrapPood', 'ST008', 'Hansen'),
(9, '2021-05-07', 'Dine In', 'ST009', 'Devinca'),
(10, '2021-06-01', 'Dine In', 'ST001', 'Reynaldy'),
(11, '2021-06-25', 'GoZek', 'ST001', 'Douglas'),
(12, '2021-07-13', 'Dine In', 'ST002', 'Devinca'),
(13, '2021-08-07', 'GrapPood', 'ST003', 'Danny'),
(14, '2021-08-31', 'Dine In', 'ST004', 'Reynaldy'),
(15, '2021-09-07', 'GoZek', 'ST005', 'Devinca'),
(16, '2021-09-19', 'Dine In', 'ST006', 'Douglas'),
(17, '2021-10-11', 'Dine In', 'ST007', 'Danny'),
(18, '2021-11-15', 'Dine In', 'ST008', 'Devinca'),
(19, '2021-11-17', 'GoZek', 'ST009', 'Reynaldy'),
(20, '2021-12-12', 'Dine In', 'ST002', 'Danny'),
(21, '2021-12-28', 'Dine In', 'ST001', 'Douglas');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` char(5) NOT NULL,
  `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderID`, `ProductID`, `Qty`) VALUES
(1, 'PR001', 1),
(1, 'PR002', 1),
(2, 'PR003', 2),
(3, 'PR004', 1),
(4, 'PR005', 3),
(5, 'PR006', 2),
(5, 'PR007', 3),
(6, 'PR008', 1),
(7, 'PR009', 1),
(8, 'PR001', 1),
(8, 'PR010', 1),
(9, 'PR002', 2),
(10, 'PR003', 1),
(11, 'PR004', 2),
(12, 'PR005', 1),
(12, 'PR006', 1),
(12, 'PR007', 1),
(13, 'PR008', 2),
(14, 'PR009', 1),
(15, 'PR010', 1),
(16, 'PR001', 1),
(16, 'PR002', 2),
(17, 'PR003', 2),
(18, 'PR004', 1),
(19, 'PR005', 2),
(19, 'PR006', 1),
(19, 'PR007', 1),
(19, 'PR008', 1),
(20, 'PR009', 2),
(21, 'PR010', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ordertoppingdetail`
--

CREATE TABLE `ordertoppingdetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` char(5) NOT NULL,
  `ToppingID` char(5) NOT NULL,
  `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordertoppingdetail`
--

INSERT INTO `ordertoppingdetail` (`OrderID`, `ProductID`, `ToppingID`, `Qty`) VALUES
(1, 'PR002', 'TP002', 1),
(3, 'PR004', 'TP007', 1),
(4, 'PR005', 'TP001', 1),
(5, 'PR006', 'TP008', 2),
(5, 'PR007', 'TP009', 3),
(6, 'PR008', 'TP006', 1),
(7, 'PR009', 'TP001', 1),
(7, 'PR009', 'TP002', 1),
(8, 'PR001', 'TP002', 3),
(8, 'PR010', 'TP006', 1),
(9, 'PR002', 'TP003', 2),
(10, 'PR003', 'TP004', 1),
(11, 'PR004', 'TP005', 2),
(12, 'PR005', 'TP001', 1),
(12, 'PR005', 'TP007', 1),
(12, 'PR006', 'TP001', 1),
(12, 'PR006', 'TP007', 1),
(12, 'PR007', 'TP001', 1),
(12, 'PR007', 'TP007', 1),
(13, 'PR008', 'TP006', 2),
(14, 'PR009', 'TP010', 1),
(15, 'PR010', 'TP006', 2),
(16, 'PR002', 'TP008', 2),
(17, 'PR003', 'TP005', 1),
(17, 'PR003', 'TP007', 1),
(18, 'PR004', 'TP001', 1),
(19, 'PR005', 'TP007', 1),
(19, 'PR006', 'TP007', 1),
(19, 'PR007', 'TP007', 1),
(20, 'PR009', 'TP001', 1),
(20, 'PR009', 'TP007', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` char(5) NOT NULL CHECK (`ProductID` regexp 'PR[0-9][0-9][0-9]'),
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `ProductPrice`) VALUES
('PR001', 'Americano', 35000),
('PR002', 'Caffe Latte', 44000),
('PR003', 'Hazelnut Latte', 50000),
('PR004', 'Java Chip Frappuccino', 55000),
('PR005', 'Caramel Java Chip Frappuccino', 55000),
('PR006', 'Greentea Frappuccino', 56000),
('PR007', 'Caramel Macchiato Frappuccino', 57000),
('PR008', 'Raspberry Blackcurrant Frappuccino', 42000),
('PR009', 'Hazelnut Signature Chocolate', 58000),
('PR010', 'Ice Shaken Lemonade Tea', 39000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` char(5) NOT NULL CHECK (`StaffID` regexp 'ST[0-9][0-9][0-9]'),
  `StaffName` varchar(255) DEFAULT NULL,
  `StaffEmail` varchar(255) DEFAULT NULL,
  `StaffPhone` varchar(20) DEFAULT NULL,
  `StaffGender` varchar(10) DEFAULT NULL,
  `StaffAddress` varchar(255) DEFAULT NULL,
  `StaffPosition` varchar(255) DEFAULT NULL,
  `StaffSalary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `StaffEmail`, `StaffPhone`, `StaffGender`, `StaffAddress`, `StaffPosition`, `StaffSalary`) VALUES
('ST001', 'Felix Novando', 'felix.novando@gmail.com', '+6281318368712', 'Male', 'Jl Jend Sudirman Kav 58 Graha Niaga Lt 27-28 Senayan, Jakarta, Indonesia', 'Barista', 7000000),
('ST002', 'Andre Setiawan Wijaya', 'andre.wijaya@gmail.com', '+6287476695335', 'Male', 'Jl Panyawungan no. 48 rt. 07/03 cileunyi wetan, Bandung, Indonesia', 'Barista', 7000000),
('ST003', 'Julieta', 'julieta@gmail.com', '+6280101717568', 'Female', 'Jl Sumatera Kawasan Industri MM 2100 Bl C/1, Bekasi, Indonesia', 'Barista', 7200000),
('ST004', 'Erwin', 'erwin@yahoo.com', '+6288944138613', 'Male', 'Jl Jend Gatot Subroto Kav 23 Graha BIP Lt 9 Karet Semanggi, Jakarta, Indonesia', 'Cashier', 6900000),
('ST005', 'Louis Choules', 'louis.choules@gmail.com', '+6283173402953', 'Male', 'Jl Jend Sudirman Kav 32 Intiland Tower Lt 6 Karet Tengsin, Jakarta, Indonesia', 'Barista', 7100000),
('ST006', 'Sandyka Bala', 'sandyka.bala@yahoo.com', '+6288514458559', 'Male', 'Jl Angsana Raya 8-A Pejaten Barat, Jakarta, Indonesia', 'Supervisor', 8750000),
('ST007', 'Hanson Robertus', 'hanson.robertus@yahoo.com', '+6282358080839', 'Male', 'Jl Swadaya IV No4 Kel. Rawa Terate Cakung Jakarta Timur Jakarta Timur, Jakarta, Indonesia', 'Supervisor', 9000000),
('ST008', 'Christopher Limawan', 'christopher.limawan@gmail.com', '+6284942696175', 'Male', 'JL Jend Sudirman Kav 44-46 BRI 2 Building 9th Floor, Jakarta Indonesia', 'Cashier', 7800000),
('ST009', 'Andrew Reyner Wibowo Tjiptomongsoguno', 'andrew.reyner@gmail.com', '+6284958697100', 'Male', 'Jl Mampang Prapatan Raya 108 Perk Buncit Mas Bl B/3 Mampang Prapatan, Jakarta Indonesia', 'Store Manager', 10000000),
('ST010', 'Clarissa Chuardi', 'clarissa.chuardi@yahoo.com', '+6286922277222', 'Female', 'Jl Bukit Gading Raya 14240, Jakarta, Indonesia', 'Store Manager', 11000000);

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `ToppingID` char(5) NOT NULL CHECK (`ToppingID` regexp 'TP[0-9][0-9][0-9]'),
  `ToppingName` varchar(255) DEFAULT NULL,
  `ToppingPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`ToppingID`, `ToppingName`, `ToppingPrice`) VALUES
('TP001', 'Caramel Sauce', 6000),
('TP002', 'Expresso Shot', 5000),
('TP003', 'Vanilla Syrup', 6500),
('TP004', 'Hazelnut Syrup', 6500),
('TP005', 'Doice Syrup', 6000),
('TP006', 'Coffee Jelly', 10000),
('TP007', 'Whip Cream', 4000),
('TP008', 'Soy Milk', 8500),
('TP009', 'Almond Milk', 19000),
('TP010', 'Oat Milk', 19000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `ordertoppingdetail`
--
ALTER TABLE `ordertoppingdetail`
  ADD PRIMARY KEY (`OrderID`,`ProductID`,`ToppingID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `ToppingID` (`ToppingID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`ToppingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordertoppingdetail`
--
ALTER TABLE `ordertoppingdetail`
  ADD CONSTRAINT `ordertoppingdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordertoppingdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordertoppingdetail_ibfk_3` FOREIGN KEY (`ToppingID`) REFERENCES `topping` (`ToppingID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
