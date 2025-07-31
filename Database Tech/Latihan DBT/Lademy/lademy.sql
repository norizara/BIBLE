-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 07:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lademy`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` char(5) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `AmountOfSession` int(11) NOT NULL,
  `CoursePrice` int(11) NOT NULL,
  `CourseTutorID` char(5) NOT NULL,
  `CourseCategoryID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `AmountOfSession`, `CoursePrice`, `CourseTutorID`, `CourseCategoryID`) VALUES
('CO001', 'Database Technology', 7, 230000, 'TU004', 'CRT02'),
('CO002', 'Artificial Neural Network', 12, 470000, 'TU007', 'CRT04'),
('CO003', 'Operating System', 8, 210000, 'TU001', 'CRT03'),
('CO004', 'Object Oriented Programming', 14, 360000, 'TU005', 'CRT01'),
('CO005', 'Data Mining', 10, 400000, 'TU010', 'CRT03'),
('CO006', 'Data Structures', 9, 350000, 'TU009', 'CRT01'),
('CO007', 'Pattern Software Design', 12, 500000, 'TU002', 'CRT03'),
('CO008', 'Computer Graphics', 7, 270000, 'TU008', 'CRT02'),
('CO009', 'Web Design', 5, 130000, 'TU009', 'CRT02'),
('CO010', 'Framework Layer Architecture', 13, 520000, 'TU006', 'CRT04'),
('CO011', 'Computer Network', 11, 300000, 'TU003', 'CRT02'),
('CO012', 'Deep Learning', 12, 550000, 'TU002', 'CRT04');

-- --------------------------------------------------------

--
-- Table structure for table `coursecategory`
--

CREATE TABLE `coursecategory` (
  `CourseCategoryID` char(5) NOT NULL,
  `CourseCategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coursecategory`
--

INSERT INTO `coursecategory` (`CourseCategoryID`, `CourseCategoryName`) VALUES
('CRT01', 'Beginner'),
('CRT02', 'Intermediate'),
('CRT03', 'Medium'),
('CRT04', 'Advanced');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `ParticipantID` char(5) NOT NULL,
  `ParticipantName` varchar(100) NOT NULL,
  `ParticipantGender` varchar(10) NOT NULL,
  `ParticipantEmail` varchar(100) NOT NULL,
  `ParticipantPhoneNumber` varchar(15) NOT NULL,
  `ParticipantDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`ParticipantID`, `ParticipantName`, `ParticipantGender`, `ParticipantEmail`, `ParticipantPhoneNumber`, `ParticipantDOB`) VALUES
('PT001', 'Tore Soper', 'Male', 'toresoper@mail.co.id', '08123456789', '2002-02-02'),
('PT002', 'Vic Tomovic', 'Male', 'vicvic@email.com', '08123456393', '2001-01-01'),
('PT003', 'Jobyna Leggs', 'Female', 'jobynaa@gmail.com', '08123367178', '2002-05-03'),
('PT004', 'Barret Bremeyer', 'Male', 'barret.brem@mail.co.id', '08120128378', '2000-09-04'),
('PT005', 'Blair Sandiford', 'Female', 'blairsandiford11@email.com', '08123921678', '2002-10-12'),
('PT006', 'Findley Duxbury', 'Male', 'finduxx@gmail.com', '08123472978', '2001-11-10'),
('PT007', 'Kurtis McFetrich', 'Male', 'kurtis_mcfetrich@mail.co.id', '08430592178', '2002-08-10'),
('PT008', 'Alexandrina Pudney', 'Female', 'alx.pudney@email.com', '08101808378', '2000-09-29'),
('PT009', 'Iris McGlaughn', 'Female', 'iris.mcglaughn@gmail.com', '08142193678', '2001-06-19'),
('PT010', 'Shaughn Daldan', 'Male', 'shaughn@mail.co.id', '08123182038', '2002-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `CourseID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactiondetail`
--

INSERT INTO `transactiondetail` (`TransactionID`, `CourseID`) VALUES
('TR001', 'CO003'),
('TR002', 'CO001'),
('TR002', 'CO007'),
('TR003', 'CO004'),
('TR004', 'CO002'),
('TR004', 'CO006'),
('TR004', 'CO009'),
('TR005', 'CO005'),
('TR006', 'CO010'),
('TR007', 'CO002'),
('TR007', 'CO008'),
('TR008', 'CO011'),
('TR009', 'CO005'),
('TR010', 'CO007'),
('TR011', 'CO002'),
('TR011', 'CO012'),
('TR012', 'CO008'),
('TR013', 'CO004'),
('TR014', 'CO006'),
('TR015', 'CO010');

-- --------------------------------------------------------

--
-- Table structure for table `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL,
  `ParticipantID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactionheader`
--

INSERT INTO `transactionheader` (`TransactionID`, `ParticipantID`, `TransactionDate`) VALUES
('TR001', 'PT003', '2021-03-12'),
('TR002', 'PT007', '2021-05-18'),
('TR003', 'PT001', '2021-05-20'),
('TR004', 'PT002', '2021-06-07'),
('TR005', 'PT004', '2021-06-21'),
('TR006', 'PT006', '2021-07-11'),
('TR007', 'PT008', '2021-07-19'),
('TR008', 'PT005', '2021-08-29'),
('TR009', 'PT009', '2021-09-17'),
('TR010', 'PT001', '2022-01-11'),
('TR011', 'PT005', '2022-02-04'),
('TR012', 'PT010', '2022-03-08'),
('TR013', 'PT003', '2022-03-20'),
('TR014', 'PT007', '2022-04-01'),
('TR015', 'PT002', '2022-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `TutorID` char(5) NOT NULL,
  `TutorName` varchar(100) NOT NULL,
  `TutorGender` varchar(10) NOT NULL,
  `TutorEmail` varchar(100) NOT NULL,
  `TutorPhoneNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`TutorID`, `TutorName`, `TutorGender`, `TutorEmail`, `TutorPhoneNumber`) VALUES
('TU001', 'Lucias Attryde', 'Male', 'lucias.attryde@lademy.com', '08199202319'),
('TU002', 'Daniella Turfrey', 'Female', 'daniella.turfrey@lademy.com', '08132939204'),
('TU003', 'Merl Willoughey', 'Female', 'merl.willoughey@lademy.com', '08171994231'),
('TU004', 'Lorna Yerrington', 'Female', 'lorna.yerrington@lademy.com', '08193713813'),
('TU005', 'Nari Roderham', 'Female', 'nari.roderham@lademy.com', '08127493340'),
('TU006', 'Dorette Sirmond', 'Male', 'dorette.sirmond@lademy.com', '08139713733'),
('TU007', 'Jayme Rutgers', 'Male', 'jayme.rutgers@lademy.com', '08138402083'),
('TU008', 'Steffi Larcher', 'Female', 'steffi.larcher@lademy.com', '08147293924'),
('TU009', 'Algernon Boddam', 'Male', 'algernon.boddam@lademy.com', '08163837193'),
('TU010', 'Bendite Armand', 'Male', 'bendite.armand@lademy.com', '08129423023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `fk_tutor_reference` (`CourseTutorID`),
  ADD KEY `fk_category_reference` (`CourseCategoryID`);

--
-- Indexes for table `coursecategory`
--
ALTER TABLE `coursecategory`
  ADD PRIMARY KEY (`CourseCategoryID`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`ParticipantID`);

--
-- Indexes for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD PRIMARY KEY (`TransactionID`,`CourseID`),
  ADD KEY `fk_course_reference` (`CourseID`);

--
-- Indexes for table `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `fk_participant_reference` (`ParticipantID`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`TutorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_category_reference` FOREIGN KEY (`CourseCategoryID`) REFERENCES `coursecategory` (`CourseCategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tutor_reference` FOREIGN KEY (`CourseTutorID`) REFERENCES `tutor` (`TutorID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `fk_course_reference` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trans_reference` FOREIGN KEY (`TransactionID`) REFERENCES `transactionheader` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `fk_participant_reference` FOREIGN KEY (`ParticipantID`) REFERENCES `participant` (`ParticipantID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
