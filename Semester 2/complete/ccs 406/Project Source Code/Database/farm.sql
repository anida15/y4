-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2024 at 02:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farm`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitieslogs`
--

CREATE TABLE `activitieslogs` (
  `id` int(11) NOT NULL,
  `tankpump` varchar(5) DEFAULT NULL,
  `sprinklers` varchar(5) DEFAULT NULL,
  `ac` varchar(5) DEFAULT NULL,
  `spray` varchar(5) DEFAULT NULL,
  `numberOfCows` varchar(11) NOT NULL,
  `robot` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activitieslogs`
--

INSERT INTO `activitieslogs` (`id`, `tankpump`, `sprinklers`, `ac`, `spray`, `numberOfCows`, `robot`) VALUES
(1, 'stop', 'start', 'stop', 'stop', '70', 'r');

--
-- Triggers `activitieslogs`
--
DELIMITER $$
CREATE TRIGGER `ac_start_stop_trigger` AFTER UPDATE ON `activitieslogs` FOR EACH ROW BEGIN
    IF OLD.ac != NEW.ac THEN
        IF NEW.ac = 'start' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('AC Started');
        ELSEIF NEW.ac = 'stop' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('AC Stopped');
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `robot_start_stop_trigger` AFTER UPDATE ON `activitieslogs` FOR EACH ROW BEGIN
    IF BINARY OLD.robot != BINARY NEW.robot THEN
        IF BINARY NEW.robot = 'R' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Robot Started');
        ELSEIF BINARY NEW.robot = 'r' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Robot Stopped');
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `spray_start_stop_trigger` AFTER UPDATE ON `activitieslogs` FOR EACH ROW BEGIN
    IF OLD.spray != NEW.spray THEN
        IF NEW.spray = 'start' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Spray Started');
        ELSEIF NEW.spray = 'stop' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Spray Stopped');
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sprinklers_start_stop_trigger` AFTER UPDATE ON `activitieslogs` FOR EACH ROW BEGIN
    IF OLD.sprinklers != NEW.sprinklers THEN
        IF NEW.sprinklers = 'start' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Sprinklers Started');
        ELSEIF NEW.sprinklers = 'stop' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Sprinklers Stopped');
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tankpump_start_stop_trigger` AFTER UPDATE ON `activitieslogs` FOR EACH ROW BEGIN
    IF OLD.tankpump != NEW.tankpump THEN
        IF NEW.tankpump = 'start' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Tank Pump Started');
        ELSEIF NEW.tankpump = 'stop' THEN
            INSERT INTO `activity_reports` (`activity_type`) VALUES ('Tank Pump Stopped');
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_reports`
--

CREATE TABLE `activity_reports` (
  `id` int(11) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_reports`
--

INSERT INTO `activity_reports` (`id`, `activity_type`, `timestamp`) VALUES
(1, 'Tank Pump Started', '2024-04-06 15:27:05'),
(2, 'Sprinklers Started', '2024-04-07 15:31:31'),
(3, 'Tank Pump Stopped', '2024-04-08 15:31:51'),
(4, 'Robot Started', '2024-04-10 15:33:57'),
(5, 'Tank Pump Started', '2024-04-10 15:35:47'),
(6, 'Tank Pump Stopped', '2024-04-10 15:35:56'),
(7, 'Robot Started', '2024-04-10 15:42:21'),
(8, 'Robot Started', '2024-04-10 15:45:14'),
(9, 'Robot Stopped', '2024-04-10 15:45:36'),
(10, 'Robot Started', '2024-04-10 15:45:47'),
(11, 'Robot Stopped', '2024-04-10 17:26:12'),
(12, 'Robot Started', '2024-04-10 18:17:27'),
(13, 'Robot Stopped', '2024-04-10 18:17:33'),
(14, 'Robot Started', '2024-04-10 18:17:43'),
(15, 'Robot Stopped', '2024-04-10 18:17:44'),
(16, 'Robot Started', '2024-04-10 18:17:46'),
(17, 'Robot Stopped', '2024-04-10 18:17:47'),
(18, 'Robot Started', '2024-04-11 10:08:59'),
(19, 'Robot Stopped', '2024-04-11 10:09:02'),
(20, 'Robot Started', '2024-04-11 10:09:05'),
(21, 'Robot Stopped', '2024-04-11 10:09:16'),
(22, 'Robot Started', '2024-04-11 14:26:27'),
(23, 'Robot Stopped', '2024-04-11 14:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `automatedspraysystem`
--

CREATE TABLE `automatedspraysystem` (
  `id` int(11) NOT NULL,
  `CowSprayStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `automatedspraysystem`
--

INSERT INTO `automatedspraysystem` (`id`, `CowSprayStatus`) VALUES
(1, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `greenhouserecords`
--

CREATE TABLE `greenhouserecords` (
  `id` int(11) NOT NULL,
  `soilMoistureReading` varchar(20) DEFAULT NULL,
  `sprinklerPumpStatus` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greenhouserecords`
--

INSERT INTO `greenhouserecords` (`id`, `soilMoistureReading`, `sprinklerPumpStatus`) VALUES
(1, '14.06', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `storerecords`
--

CREATE TABLE `storerecords` (
  `id` int(11) NOT NULL,
  `temperatureReading` varchar(20) DEFAULT NULL,
  `humidity` varchar(10) DEFAULT NULL,
  `storeFanAction` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storerecords`
--

INSERT INTO `storerecords` (`id`, `temperatureReading`, `humidity`, `storeFanAction`) VALUES
(1, '26', '77', 's');

-- --------------------------------------------------------

--
-- Table structure for table `tankrecords`
--

CREATE TABLE `tankrecords` (
  `id` int(11) NOT NULL,
  `waterLevel` varchar(20) DEFAULT NULL,
  `tankPumpStatus` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tankrecords`
--

INSERT INTO `tankrecords` (`id`, `waterLevel`, `tankPumpStatus`) VALUES
(1, '0.00', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_debug_log`
--

CREATE TABLE `trigger_debug_log` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trigger_debug_log`
--

INSERT INTO `trigger_debug_log` (`id`, `message`, `timestamp`) VALUES
(1, 'Trigger activated', '2024-04-10 15:42:21'),
(2, 'Robot value changed', '2024-04-10 15:42:21'),
(3, 'Robot Started', '2024-04-10 15:42:21'),
(4, 'Trigger activated', '2024-04-10 15:42:45'),
(5, 'Trigger activated', '2024-04-10 15:43:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitieslogs`
--
ALTER TABLE `activitieslogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_reports`
--
ALTER TABLE `activity_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automatedspraysystem`
--
ALTER TABLE `automatedspraysystem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `greenhouserecords`
--
ALTER TABLE `greenhouserecords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storerecords`
--
ALTER TABLE `storerecords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tankrecords`
--
ALTER TABLE `tankrecords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigger_debug_log`
--
ALTER TABLE `trigger_debug_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activitieslogs`
--
ALTER TABLE `activitieslogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `activity_reports`
--
ALTER TABLE `activity_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `automatedspraysystem`
--
ALTER TABLE `automatedspraysystem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trigger_debug_log`
--
ALTER TABLE `trigger_debug_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
