-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 11:49 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'Test@12345', '28-12-2016 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `Patient Name` varchar(20) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `Patient Name`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(3, 'Demo test', '', 7, 6, 600, '2019-06-29', '9:15 AM', '2019-06-23 18:31:28', 1, 0, '0000-00-00 00:00:00'),
(4, 'Ayurveda', '', 5, 5, 8050, '2019-11-08', '1:00 PM', '2019-11-05 10:28:54', 1, 1, '0000-00-00 00:00:00'),
(5, 'Dermatologist', '', 9, 7, 500, '2019-11-30', '5:30 PM', '2019-11-10 18:41:34', 1, 0, '2019-11-10 18:48:30'),
(6, 'Dermatologist', '', 0, 1, 0, '2022-04-28', '11:30 PM', '2022-04-22 17:52:00', 1, 1, NULL),
(7, 'Dermatologist', '', 0, 1, 0, '2022-04-28', '11:30 PM', '2022-04-22 17:52:30', 1, 1, NULL),
(8, 'Dermatologist', '', 0, 1, 0, '2022-04-28', '11:30 PM', '2022-04-22 17:52:44', 1, 1, NULL),
(9, 'Homeopath', '', 2, 2, 600, '2022-05-17', '5:00 PM', '2022-05-04 10:23:14', 1, 1, NULL),
(10, 'Ayurveda', '', 5, 2, 8050, '2022-06-02', '4:00 PM', '2022-05-04 10:25:40', 1, 1, NULL),
(11, 'Ayurveda', '', 5, 2, 8050, '2022-05-23', '9:15 PM', '2022-05-26 15:43:32', 1, 1, NULL),
(12, 'Ayurveda', '', 5, 2, 8050, '2022-05-23', '9:15 PM', '2022-05-26 15:48:13', 1, 1, NULL),
(13, 'General Physician', '', 3, 2, 1200, '2022-05-23', '9:30 PM', '2022-05-26 15:50:30', 1, 1, NULL),
(14, 'Ayurveda', '', 8, 2, 600, '2022-06-02', '9:30 PM', '2022-05-26 15:50:59', 1, 1, NULL),
(15, 'General Physician', '', 0, 1, 0, '2022-05-26', '9:45 PM', '2022-05-26 16:10:47', 1, 1, NULL),
(16, 'Ayurveda', '', 5, 2, 8050, '2022-05-24', '10:45 AM', '2022-05-27 05:15:04', 1, 1, NULL),
(17, 'General Physician', '', 6, 2, 2500, '2022-06-01', '10:45 AM', '2022-05-27 05:15:47', 1, 1, NULL),
(18, 'Ayurveda', '', 12, 2, 500, '2022-06-01', '11:45 AM', '2022-05-30 06:16:12', 1, 1, NULL),
(19, 'Ayurveda', '', 12, 2, 500, '2022-06-01', '11:45 AM', '2022-05-30 08:20:51', 1, 1, NULL),
(20, 'Ayurveda', '', 12, 2, 500, '2022-06-01', '11:45 AM', '2022-05-30 08:21:20', 1, 1, NULL),
(21, 'Homeopathy', '', 15, 2, 400, '2022-05-28', '2:00 PM', '2022-05-30 08:27:27', 1, 1, NULL),
(22, 'Ayurveda', '', 12, 1, 500, '2022-05-27', '3:00 PM', '2022-05-30 09:24:16', 1, 1, NULL),
(23, 'Naturopathy', '', 13, 1, 400, '2022-06-10', '3:00 PM', '2022-05-30 09:25:14', 1, 1, NULL),
(24, 'Ayurveda', '', 12, 1, 500, '2022-06-30', '3:15 PM', '2022-05-30 09:40:57', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(11, 'Homeopathy', 'Dr. Roshan Pinto', 'Alvas Niraamaya', '500', 123456789, 'roshan@gmail.com', 'd6dfb33a2052663df81c35e5496b3b1b', '2022-05-30 06:03:08', '2022-05-30 08:24:51'),
(12, 'Ayurveda', 'Dr. Surekha Pai', 'Alvas Niraamaya', '500', 69852146, 'surekha@gmail.com', '8442460f48338fe60a9497b8e0e9022f', '2022-05-30 06:05:40', '2022-05-30 08:25:24'),
(13, 'Naturopathy', 'Dr. Prajna', 'Alvas Niraamaya', '400', 1234, 'prajna@gmail.com', '5035b1804c3685cc51f7cad75a0d3d9f', '2022-05-30 06:11:02', '2022-05-30 08:25:39'),
(14, 'Naturopathy', 'Dr. Swathi K,V', 'Alvas Niraamaya', '600', 255566, 'swathi@gmail.com', '46eafc3f1b688c52837ef0c7fa2018f9', '2022-05-30 06:12:23', '2022-05-30 08:25:54'),
(15, 'Homeopathy', 'Dr. Manu Bhat', 'Alvas Niraamaya', '400', 123456, 'manu@gmail.com', 'f13bb1bed03db9d68a7d9a48aafeec78', '2022-05-30 08:26:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(20, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 03:46:58', NULL, 1),
(21, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 03:54:32', '21-04-2022 09:25:00 AM', 1),
(22, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 03:55:58', NULL, 1),
(23, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 04:00:21', NULL, 1),
(24, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 04:12:51', NULL, 1),
(25, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-21 04:14:05', '21-04-2022 09:46:05 AM', 1),
(26, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 12:17:00', NULL, 0),
(27, NULL, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 12:17:17', NULL, 0),
(28, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 12:17:29', '22-04-2022 06:07:44 PM', 1),
(29, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 12:52:55', '22-04-2022 06:23:16 PM', 1),
(30, NULL, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:11:43', NULL, 0),
(31, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:11:52', '22-04-2022 06:42:05 PM', 1),
(32, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:22:33', '22-04-2022 06:53:58 PM', 1),
(33, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:31:26', '22-04-2022 07:18:46 PM', 1),
(34, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 14:14:45', '22-04-2022 07:44:50 PM', 1),
(35, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-13 06:24:58', NULL, 0),
(36, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-13 06:25:07', '13-05-2022 12:00:42 PM', 1),
(37, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-26 15:56:23', '26-05-2022 09:26:56 PM', 1),
(38, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:17:23', NULL, 0),
(39, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:17:31', '27-05-2022 10:47:58 AM', 1),
(40, 6, 'amrita@test.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:20:30', '27-05-2022 10:54:10 AM', 1),
(41, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:24:21', '27-05-2022 10:58:11 AM', 1),
(42, 6, 'amrita@test.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:28:30', '27-05-2022 11:06:44 AM', 1),
(43, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:30:54', NULL, 0),
(44, NULL, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:31:10', NULL, 0),
(45, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:31:25', NULL, 0),
(46, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:31:36', NULL, 0),
(47, 11, 'roshan@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:33:26', '30-05-2022 02:06:46 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(5, 'Ayurveda', '2016-12-28 06:39:51', '0000-00-00 00:00:00'),
(11, 'Naturopathy', '2019-06-23 17:51:06', '2022-05-30 06:09:26'),
(13, 'Homeopathy', '2022-05-04 10:28:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recep`
--

CREATE TABLE `recep` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recep`
--

INSERT INTO `recep` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'recep', 'recep@123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(1, 'test user', 'test@gmail.com', 2523523522523523, ' This is sample text for the test.', '2019-06-29 19:03:08', 'Test Admin Remark', '2019-06-30 12:55:23', 1),
(2, 'Anuj kumar', 'phpgurukulofficial@gmail.com', 1111111111111111, ' This is sample text for testing.  This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing.', '2019-06-30 13:06:50', NULL, NULL, NULL),
(3, 'fdsfsdf', 'fsdfsd@ghashhgs.com', 3264826346, 'sample text   sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  ', '2019-11-10 18:53:48', 'vfdsfgfd', '2019-11-10 18:54:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(2, 3, '120/185', '80/120', '85 Kg', '101 degree', '#Fever, #BP high\r\n1.Paracetamol\r\n2.jocib tab\r\n', '2019-11-06 04:20:07'),
(3, 2, '90/120', '92/190', '86 kg', '99 deg', '#Sugar High\r\n1.Petz 30', '2019-11-06 04:31:24'),
(4, 1, '125/200', '86/120', '56 kg', '98 deg', '# blood pressure is high\r\n1.koil cipla', '2019-11-06 04:52:42'),
(5, 1, '96/120', '98/120', '57 kg', '102 deg', '#Viral\r\n1.gjgjh-1Ml\r\n2.kjhuiy-2M', '2019-11-06 04:56:55'),
(6, 4, '90/120', '120', '56', '98 F', '#blood sugar high\r\n#Asthma problem', '2019-11-06 14:38:33'),
(7, 5, '80/120', '120', '85', '98.6', 'Rx\r\n\r\nAbc tab\r\nxyz Syrup', '2019-11-10 18:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, 'Manisha Jha', 4558968789, 'test@gmail.com', 'Female', '\"\"J&K Block J-127, Laxmi Nagar New Delhi', 26, 'She is diabetic patient', '2019-11-04 21:38:06', '2019-11-06 06:48:05'),
(2, 5, 'Raghu Yadav', 9797977979, 'raghu@gmail.com', 'Male', 'ABC Apartment Mayur Vihar Ph-1 New Delhi', 39, 'No', '2019-11-05 10:40:13', '2019-11-05 11:53:45'),
(3, 7, 'Mansi', 9878978798, 'jk@gmail.com', 'Female', '\"fdghyj', 46, 'No', '2019-11-05 10:49:41', '2019-11-05 11:58:59'),
(4, 7, 'Manav Sharma', 9888988989, 'sharma@gmail.com', 'Male', 'L-56,Ashok Nagar New Delhi-110096', 45, 'He is long suffered by asthma', '2019-11-06 14:33:54', '2019-11-06 14:34:31'),
(5, 9, 'John', 1234567890, 'john@test.com', 'male', 'Test ', 25, 'THis is sample text for testing.', '2019-11-10 18:49:24', NULL),
(6, 6, 'ambika', 9538107274, 'hello@gmail.com', 'female', 'Manavi D/O Vegendra Murthy,Nehru Nagar,8th cross\r\nSagar,Shivamogga', 22, 'none', '2022-05-27 05:32:35', NULL),
(7, 11, 'ambika', 9538107274, 'anusha20219@gmail.com', 'female', '#84, Anugraha Nilaya,NTB Layout\r\nHosasiddapura,Bhadravathi,Shivamogga,Karnataka', 22, 'hhhh', '2022-05-30 08:34:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-21 03:43:44', '21-04-2022 09:16:30 AM', 1),
(25, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 11:45:38', NULL, 0),
(26, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 11:45:54', '22-04-2022 05:46:42 PM', 1),
(27, NULL, 'test@demo.comTest@123', 0x3a3a3100000000000000000000000000, '2022-04-22 12:45:34', NULL, 0),
(28, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 12:45:50', '22-04-2022 06:22:38 PM', 1),
(29, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:12:17', NULL, 0),
(30, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:12:30', NULL, 0),
(31, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 13:12:44', '22-04-2022 06:50:44 PM', 1),
(32, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-04-22 14:11:58', NULL, 0),
(33, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 14:12:11', '22-04-2022 07:44:37 PM', 1),
(34, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-04 10:20:59', '04-05-2022 03:51:07 PM', 1),
(35, NULL, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-04 10:21:53', NULL, 0),
(36, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-04 10:22:06', '04-05-2022 03:57:09 PM', 1),
(37, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-26 06:15:33', '26-05-2022 09:25:28 PM', 1),
(38, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-26 15:56:01', NULL, 0),
(39, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:11:50', NULL, 0),
(40, NULL, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:11:59', NULL, 0),
(41, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:12:14', NULL, 0),
(42, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-27 05:14:24', '27-05-2022 10:46:28 AM', 1),
(43, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 06:15:42', NULL, 0),
(44, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 06:15:52', '30-05-2022 01:52:14 PM', 1),
(45, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:22:25', NULL, 0),
(46, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:22:34', '30-05-2022 01:53:47 PM', 1),
(47, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:27:11', '30-05-2022 02:00:43 PM', 1),
(48, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2022-05-30 08:46:40', NULL, 0),
(49, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2022-05-30 08:46:54', NULL, 0),
(50, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2022-05-30 08:47:05', NULL, 0),
(51, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2022-05-30 08:47:30', NULL, 0),
(52, NULL, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:49:07', NULL, 0),
(53, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-30 08:49:15', '30-05-2022 02:23:17 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(2, 'Sarita pandey', 'New Delhi India', 'Delhi', 'female', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2016-12-30 05:34:39', '0000-00-00 00:00:00'),
(3, 'Amit', 'New Delhi', 'New delhi', 'male', 'amit@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2017-01-07 06:36:53', '0000-00-00 00:00:00'),
(4, 'Rahul Singh', 'New Delhi', 'New delhi', 'male', 'rahul@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2017-01-07 07:41:14', '0000-00-00 00:00:00'),
(5, 'Amit kumar', 'New Delhi India', 'Delhi', 'male', 'amit12@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2017-01-07 08:00:26', '0000-00-00 00:00:00'),
(6, 'Test user', 'New Delhi', 'Delhi', 'male', 'tetuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2019-06-23 18:24:53', '2019-06-23 18:36:09'),
(7, 'John', 'USA', 'Newyork', 'male', 'john@test.com', 'f925916e2754e5e03f75dd58a5733251', '2019-11-10 18:40:21', '2019-11-10 18:40:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recep`
--
ALTER TABLE `recep`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recep`
--
ALTER TABLE `recep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
