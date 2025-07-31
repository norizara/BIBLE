-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2023 at 01:51 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppti_lajexgym`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` char(5) NOT NULL,
  `trainer` char(5) NOT NULL,
  `location` char(5) NOT NULL,
  `type` char(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `duration` int(3) NOT NULL,
  `cost` int(10) NOT NULL,
  `canceled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `trainer`, `location`, `type`, `name`, `duration`, `cost`, `canceled`) VALUES
('CL001', 'TR017', 'LO003', 'TY002', 'Strength Training', 180, 25, 0),
('CL002', 'TR005', 'LO002', 'TY003', 'Hatha Yoga', 150, 15, 0),
('CL003', 'TR008', 'LO005', 'TY004', 'CrossFit Workout', 240, 20, 1),
('CL004', 'TR014', 'LO001', 'TY001', 'Zumba Dance', 120, 12, 0),
('CL005', 'TR019', 'LO004', 'TY005', 'Pilates Fusion', 200, 18, 0),
('CL006', 'TR010', 'LO002', 'TY002', 'Weight Circuit', 160, 22, 0),
('CL007', 'TR006', 'LO003', 'TY003', 'Vinyasa Flow', 210, 20, 0),
('CL008', 'TR002', 'LO005', 'TY004', 'HIIT Blast', 250, 30, 0),
('CL009', 'TR018', 'LO004', 'TY001', 'Indoor Cycling', 300, 25, 0),
('CL010', 'TR011', 'LO001', 'TY005', 'Barre Sculpt', 180, 18, 0),
('CL011', 'TR012', 'LO003', 'TY002', 'Body Pump', 220, 20, 0),
('CL012', 'TR016', 'LO004', 'TY003', 'Yin Yoga', 190, 17, 0),
('CL013', 'TR003', 'LO002', 'TY004', 'Tabata Burn', 270, 25, 0),
('CL014', 'TR007', 'LO001', 'TY001', 'Latin Dance', 140, 12, 0),
('CL015', 'TR020', 'LO005', 'TY005', 'Reformer Pilates', 240, 22, 0),
('CL016', 'TR015', 'LO003', 'TY002', 'Kettlebell Blast', 200, 20, 0),
('CL017', 'TR004', 'LO004', 'TY003', 'Ashtanga Yoga', 240, 25, 0),
('CL018', 'TR013', 'LO002', 'TY004', 'Bootcamp Challenge', 300, 28, 0),
('CL019', 'TR001', 'LO005', 'TY001', 'Spinning Ride', 180, 15, 0),
('CL020', 'TR009', 'LO001', 'TY005', 'Flexibility Flow', 130, 12, 1),
('CL021', 'TR005', 'LO004', 'TY002', 'Pilates Circuit', 220, 20, 0),
('CL022', 'TR011', 'LO003', 'TY003', 'Power Yoga', 190, 18, 0),
('CL023', 'TR012', 'LO001', 'TY004', 'Functional Training', 210, 22, 0),
('CL024', 'TR006', 'LO005', 'TY001', 'Aqua Zumba', 160, 15, 0),
('CL025', 'TR016', 'LO002', 'TY005', 'Flex and Stretch', 180, 12, 0),
('CL026', 'TR003', 'LO004', 'TY002', 'Core Strength', 240, 20, 0),
('CL027', 'TR019', 'LO001', 'TY003', 'Mindful Meditation', 130, 12, 1),
('CL028', 'TR004', 'LO003', 'TY004', 'Circuit Boxing', 250, 25, 0),
('CL029', 'TR014', 'LO005', 'TY001', 'Cardio Kickboxing', 200, 18, 0),
('CL030', 'TR002', 'LO002', 'TY005', 'Dance Cardio', 190, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_participants`
--

CREATE TABLE `class_participants` (
  `class` char(5) NOT NULL,
  `participant` char(5) NOT NULL,
  `present` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_participants`
--

INSERT INTO `class_participants` (`class`, `participant`, `present`) VALUES
('CL001', 'PR004', 1),
('CL001', 'PR008', 1),
('CL001', 'PR009', 1),
('CL001', 'PR011', 0),
('CL001', 'PR012', 1),
('CL001', 'PR013', 1),
('CL001', 'PR014', 1),
('CL001', 'PR015', 1),
('CL001', 'PR017', 1),
('CL001', 'PR020', 1),
('CL002', 'PR001', 1),
('CL002', 'PR009', 1),
('CL002', 'PR010', 1),
('CL002', 'PR011', 1),
('CL002', 'PR012', 1),
('CL002', 'PR014', 1),
('CL002', 'PR015', 1),
('CL002', 'PR017', 1),
('CL002', 'PR019', 1),
('CL002', 'PR020', 1),
('CL003', 'PR001', 1),
('CL003', 'PR002', 1),
('CL003', 'PR003', 1),
('CL003', 'PR004', 1),
('CL003', 'PR007', 1),
('CL003', 'PR010', 1),
('CL003', 'PR013', 1),
('CL003', 'PR014', 1),
('CL003', 'PR017', 1),
('CL003', 'PR019', 1),
('CL004', 'PR004', 1),
('CL004', 'PR005', 1),
('CL004', 'PR006', 1),
('CL004', 'PR008', 1),
('CL004', 'PR011', 1),
('CL004', 'PR014', 1),
('CL004', 'PR015', 1),
('CL004', 'PR019', 1),
('CL005', 'PR001', 1),
('CL005', 'PR005', 1),
('CL005', 'PR007', 1),
('CL005', 'PR009', 1),
('CL005', 'PR010', 1),
('CL005', 'PR011', 1),
('CL005', 'PR012', 1),
('CL005', 'PR013', 1),
('CL005', 'PR019', 1),
('CL005', 'PR020', 1),
('CL006', 'PR003', 1),
('CL006', 'PR004', 1),
('CL006', 'PR006', 1),
('CL006', 'PR007', 1),
('CL006', 'PR008', 1),
('CL006', 'PR011', 1),
('CL006', 'PR012', 0),
('CL006', 'PR013', 0),
('CL006', 'PR016', 1),
('CL006', 'PR017', 1),
('CL006', 'PR018', 1),
('CL007', 'PR001', 1),
('CL007', 'PR002', 1),
('CL007', 'PR004', 1),
('CL007', 'PR005', 1),
('CL007', 'PR009', 1),
('CL007', 'PR010', 1),
('CL007', 'PR012', 1),
('CL007', 'PR014', 1),
('CL007', 'PR017', 1),
('CL007', 'PR020', 1),
('CL008', 'PR001', 1),
('CL008', 'PR004', 1),
('CL008', 'PR006', 1),
('CL008', 'PR007', 1),
('CL008', 'PR011', 0),
('CL008', 'PR012', 1),
('CL008', 'PR017', 1),
('CL008', 'PR018', 1),
('CL008', 'PR019', 1),
('CL009', 'PR002', 1),
('CL009', 'PR005', 1),
('CL009', 'PR006', 1),
('CL009', 'PR007', 1),
('CL009', 'PR008', 1),
('CL009', 'PR010', 1),
('CL009', 'PR012', 1),
('CL009', 'PR013', 1),
('CL009', 'PR017', 1),
('CL009', 'PR018', 1),
('CL010', 'PR004', 1),
('CL010', 'PR005', 1),
('CL010', 'PR006', 1),
('CL010', 'PR007', 0),
('CL010', 'PR009', 1),
('CL010', 'PR010', 1),
('CL010', 'PR013', 1),
('CL010', 'PR014', 1),
('CL010', 'PR018', 1),
('CL011', 'PR002', 1),
('CL011', 'PR004', 1),
('CL011', 'PR005', 1),
('CL011', 'PR006', 1),
('CL011', 'PR007', 1),
('CL011', 'PR008', 1),
('CL011', 'PR012', 1),
('CL011', 'PR013', 1),
('CL011', 'PR014', 1),
('CL011', 'PR019', 1),
('CL012', 'PR005', 1),
('CL012', 'PR007', 1),
('CL012', 'PR009', 1),
('CL012', 'PR010', 1),
('CL012', 'PR011', 1),
('CL012', 'PR015', 1),
('CL012', 'PR016', 1),
('CL013', 'PR005', 1),
('CL013', 'PR006', 1),
('CL013', 'PR007', 1),
('CL013', 'PR009', 1),
('CL013', 'PR010', 1),
('CL013', 'PR011', 1),
('CL013', 'PR012', 1),
('CL013', 'PR013', 1),
('CL013', 'PR014', 1),
('CL013', 'PR019', 1),
('CL014', 'PR001', 1),
('CL014', 'PR002', 1),
('CL014', 'PR004', 1),
('CL014', 'PR007', 1),
('CL014', 'PR008', 1),
('CL014', 'PR009', 1),
('CL014', 'PR011', 1),
('CL014', 'PR016', 1),
('CL014', 'PR017', 1),
('CL014', 'PR018', 1),
('CL015', 'PR001', 1),
('CL015', 'PR002', 1),
('CL015', 'PR003', 0),
('CL015', 'PR010', 1),
('CL015', 'PR012', 1),
('CL015', 'PR014', 1),
('CL015', 'PR015', 1),
('CL015', 'PR017', 1),
('CL015', 'PR020', 1),
('CL016', 'PR003', 1),
('CL016', 'PR004', 1),
('CL016', 'PR006', 1),
('CL016', 'PR009', 1),
('CL016', 'PR010', 1),
('CL016', 'PR011', 1),
('CL016', 'PR014', 1),
('CL016', 'PR015', 1),
('CL017', 'PR002', 1),
('CL017', 'PR004', 1),
('CL017', 'PR005', 1),
('CL017', 'PR009', 1),
('CL017', 'PR010', 1),
('CL017', 'PR014', 1),
('CL017', 'PR015', 1),
('CL017', 'PR016', 0),
('CL017', 'PR018', 1),
('CL017', 'PR019', 1),
('CL018', 'PR003', 1),
('CL018', 'PR004', 1),
('CL018', 'PR006', 1),
('CL018', 'PR007', 1),
('CL018', 'PR011', 1),
('CL018', 'PR012', 1),
('CL018', 'PR016', 1),
('CL018', 'PR017', 1),
('CL018', 'PR018', 1),
('CL018', 'PR019', 1),
('CL019', 'PR001', 1),
('CL019', 'PR004', 1),
('CL019', 'PR006', 1),
('CL019', 'PR009', 1),
('CL019', 'PR010', 1),
('CL019', 'PR011', 1),
('CL019', 'PR013', 1),
('CL019', 'PR014', 1),
('CL019', 'PR015', 1),
('CL019', 'PR017', 1),
('CL020', 'PR001', 1),
('CL020', 'PR003', 1),
('CL020', 'PR004', 1),
('CL020', 'PR008', 1),
('CL020', 'PR010', 1),
('CL020', 'PR013', 0),
('CL020', 'PR016', 1),
('CL020', 'PR017', 1),
('CL020', 'PR019', 1),
('CL021', 'PR003', 1),
('CL021', 'PR004', 1),
('CL021', 'PR007', 1),
('CL021', 'PR008', 1),
('CL021', 'PR013', 1),
('CL021', 'PR015', 1),
('CL021', 'PR018', 1),
('CL021', 'PR020', 1),
('CL022', 'PR001', 1),
('CL022', 'PR005', 1),
('CL022', 'PR007', 1),
('CL022', 'PR008', 1),
('CL022', 'PR009', 1),
('CL022', 'PR013', 1),
('CL022', 'PR014', 0),
('CL022', 'PR015', 1),
('CL022', 'PR018', 1),
('CL023', 'PR001', 1),
('CL023', 'PR002', 1),
('CL023', 'PR005', 1),
('CL023', 'PR008', 1),
('CL023', 'PR011', 1),
('CL023', 'PR012', 1),
('CL023', 'PR013', 1),
('CL023', 'PR018', 1),
('CL023', 'PR019', 1),
('CL023', 'PR020', 1),
('CL024', 'PR001', 1),
('CL024', 'PR002', 1),
('CL024', 'PR004', 1),
('CL024', 'PR005', 1),
('CL024', 'PR010', 1),
('CL024', 'PR013', 1),
('CL024', 'PR014', 1),
('CL024', 'PR015', 1),
('CL024', 'PR016', 1),
('CL024', 'PR017', 1),
('CL025', 'PR001', 1),
('CL025', 'PR002', 1),
('CL025', 'PR004', 1),
('CL025', 'PR007', 1),
('CL025', 'PR008', 0),
('CL025', 'PR010', 1),
('CL025', 'PR011', 1),
('CL025', 'PR012', 1),
('CL025', 'PR014', 1),
('CL025', 'PR020', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` char(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`) VALUES
('LO001', 'Central Park'),
('LO002', 'Oceanfront Resort'),
('LO003', 'Green Valley Fitness'),
('LO004', 'Sunset Hills Gym'),
('LO005', 'Riverside Athletic');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` char(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `joined_date` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `name`, `gender`, `joined_date`, `status`) VALUES
('PR001', 'Olivia Davis', 'Female', '2022-02-15', 1),
('PR002', 'Liam Johnson', 'Male', '2022-03-05', 1),
('PR003', 'Ava Smith', 'Female', '2022-01-28', 1),
('PR004', 'Noah Martinez', 'Male', '2022-02-20', 1),
('PR005', 'Emma Wilson', 'Female', '2022-03-02', 1),
('PR006', 'William Taylor', 'Male', '2022-01-12', 1),
('PR007', 'Sophia Anderson', 'Female', '2022-03-15', 1),
('PR008', 'Benjamin Brown', 'Male', '2022-01-25', 1),
('PR009', 'Isabella Johnson', 'Female', '2022-02-10', 1),
('PR010', 'James Robinson', 'Male', '2022-02-28', 1),
('PR011', 'Mia Thompson', 'Female', '2022-03-09', 1),
('PR012', 'Alexander Davis', 'Male', '2022-01-20', 1),
('PR013', 'Charlotte Martin', 'Female', '2022-02-05', 1),
('PR014', 'Ethan White', 'Male', '2022-01-08', 1),
('PR015', 'Amelia Hall', 'Female', '2022-03-11', 1),
('PR016', 'Daniel Johnson', 'Male', '2022-02-22', 1),
('PR017', 'Harper Williams', 'Female', '2022-01-18', 1),
('PR018', 'Michael Davis', 'Male', '2022-02-08', 1),
('PR019', 'Grace Hernandez', 'Female', '2022-03-07', 1),
('PR020', 'Samuel Martinez', 'Male', '2022-01-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` char(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `gender`, `status`) VALUES
('TR001', 'Adam Johnson', 'Male', 1),
('TR002', 'Laura Williams', 'Female', 1),
('TR003', 'Christopher Smith', 'Male', 1),
('TR004', 'Natalie Martinez', 'Female', 1),
('TR005', 'Benjamin Davis', 'Male', 1),
('TR006', 'Emma Thompson', 'Female', 1),
('TR007', 'Daniel Anderson', 'Male', 1),
('TR008', 'Jessica Carter', 'Female', 1),
('TR009', 'William Taylor', 'Male', 1),
('TR010', 'Mia Rivera', 'Female', 1),
('TR011', 'Alexander Wright', 'Male', 1),
('TR012', 'Lily Morgan', 'Female', 1),
('TR013', 'David Robinson', 'Male', 1),
('TR014', 'Olivia Lee', 'Female', 1),
('TR015', 'Ethan Hall', 'Male', 1),
('TR016', 'Harper Gonzalez', 'Female', 1),
('TR017', 'Michael White', 'Male', 1),
('TR018', 'Grace Hernandez', 'Female', 1),
('TR019', 'Joseph Moore', 'Male', 0),
('TR020', 'Lillian Adams', 'Female', 1);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` char(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
('TY001', 'Cardio'),
('TY002', 'Weight Training'),
('TY003', 'Yoga'),
('TY004', 'CrossFit'),
('TY005', 'Pilates');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainer` (`trainer`),
  ADD KEY `location` (`location`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `class_participants`
--
ALTER TABLE `class_participants`
  ADD PRIMARY KEY (`class`,`participant`),
  ADD KEY `participant` (`participant`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`trainer`) REFERENCES `trainers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`type`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_participants`
--
ALTER TABLE `class_participants`
  ADD CONSTRAINT `class_participants_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_participants_ibfk_2` FOREIGN KEY (`participant`) REFERENCES `participants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
