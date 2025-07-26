-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 21, 2024 at 03:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(21) NOT NULL,
  `PASS` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `PASS`) VALUES
('sandesh', 'sonu@1085'),
('yogesh', 'yogesh@123');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `ID` int(11) NOT NULL,
  `Atten` varchar(21) NOT NULL,
  `Adate` date NOT NULL,
  `name` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `dname` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`ID`, `Atten`, `Adate`, `name`, `email`, `dname`) VALUES
(1, 'absent', '2024-10-12', 'sonu ', 'sonu@123', 'somnath'),
(2, 'present', '2024-10-12', 'yogesh kadam ', 'yogesh@123', 'somnath'),
(3, 'present', '2024-10-12', 'Rimzim G ', 'rimzim@123', 'somnath'),
(4, 'present', '2024-10-12', 'tejas ', 'tejas123@gmail.com', 'somnath'),
(5, 'present', '2024-10-12', 'omkar ', 'khamkar@gmail.com', 'somnath'),
(6, 'present', '2024-10-12', 'sonu ', 'sonu@123', 'somnath@123'),
(7, 'present', '2024-10-12', 'yogesh kadam ', 'yogesh@123', 'somnath@123'),
(8, 'present', '2024-10-12', 'Rimzim G ', 'rimzim@123', 'somnath@123'),
(9, 'absent', '2024-10-12', 'tejas ', 'tejas123@gmail.com', 'somnath@123'),
(10, 'present', '2024-10-12', 'omkar ', 'khamkar@gmail.com', 'somnath@123'),
(11, 'present', '2024-10-12', 'sonu ', 'sonu@123', 'somnath@123'),
(12, 'absent', '2024-10-12', 'yogesh kadam ', 'yogesh@123', 'somnath@123'),
(13, 'present', '2024-10-12', 'Rimzim G ', 'rimzim@123', 'somnath@123'),
(14, 'present', '2024-10-12', 'tejas ', 'tejas123@gmail.com', 'somnath@123'),
(15, 'present', '2024-10-12', 'omkar ', 'khamkar@gmail.com', 'somnath@123'),
(16, 'present', '2024-10-13', 'sonu ', 'sonu@123', 'tanaji@gmail.com'),
(17, 'present', '2024-10-13', 'yogesh kadam ', 'yogesh@123', 'tanaji@gmail.com'),
(18, 'present', '2024-10-13', 'Rimzim G ', 'rimzim@123', 'tanaji@gmail.com'),
(19, 'present', '2024-10-13', 'tejas ', 'tejas123@gmail.com', 'tanaji@gmail.com'),
(20, 'present', '2024-10-13', 'omkar ', 'khamkar@gmail.com', 'tanaji@gmail.com'),
(21, 'present', '2024-10-14', 'sonu ', 'sonu@123', 'somnath@123'),
(22, 'present', '2024-10-14', 'yogesh kadam ', 'yogesh@123', 'somnath@123'),
(23, 'absent', '2024-10-14', 'Rimzim G ', 'rimzim@123', 'somnath@123'),
(24, 'present', '2024-10-14', 'tejas ', 'tejas123@gmail.com', 'somnath@123'),
(25, 'present', '2024-10-14', 'omkar ', 'khamkar@gmail.com', 'somnath@123'),
(26, 'present', '2024-10-15', 'sonu ', 'sonu@123', 'tanaji@gmail.com'),
(27, 'present', '2024-10-15', 'yogesh kadam ', 'yogesh@123', 'tanaji@gmail.com'),
(28, 'absent', '2024-10-15', 'Rimzim G ', 'rimzim@123', 'tanaji@gmail.com'),
(29, 'present', '2024-10-15', 'tejas ', 'tejas123@gmail.com', 'tanaji@gmail.com'),
(30, 'present', '2024-10-15', 'omkar ', 'khamkar@gmail.com', 'tanaji@gmail.com'),
(31, 'present', '2024-10-16', 'sonu ', 'sonu@123', 'mahadev@gmail.com'),
(32, 'absent', '2024-10-16', 'yogesh kadam ', 'yogesh@123', 'mahadev@gmail.com'),
(33, 'present', '2024-10-16', 'Rimzim G ', 'rimzim@123', 'mahadev@gmail.com'),
(34, 'absent', '2024-10-16', 'tejas ', 'tejas123@gmail.com', 'mahadev@gmail.com'),
(35, 'present', '2024-10-16', 'omkar ', 'khamkar@gmail.com', 'mahadev@gmail.com'),
(36, 'present', '2024-10-18', 'sonu ', 'sonu@123', 'tanaji@gmail.com'),
(37, 'present', '2024-10-18', 'yogesh kadam ', 'yogesh@123', 'tanaji@gmail.com'),
(38, 'present', '2024-10-18', 'Rimzim G ', 'rimzim@123', 'tanaji@gmail.com'),
(39, 'absent', '2024-10-18', 'tejas ', 'tejas123@gmail.com', 'tanaji@gmail.com'),
(40, 'absent', '2024-10-18', 'omkar ', 'khamkar@gmail.com', 'tanaji@gmail.com'),
(51, 'absent', '2024-10-19', 'sonu ', 'sonu@123', 'mahadev@gmail.com'),
(52, 'present', '2024-10-19', 'yogesh kadam ', 'yogesh@123', 'mahadev@gmail.com'),
(53, 'present', '2024-10-19', 'Rimzim G ', 'rimzim@123', 'mahadev@gmail.com'),
(54, 'absent', '2024-10-19', 'tejas ', 'tejas123@gmail.com', 'mahadev@gmail.com'),
(55, 'absent', '2024-10-19', 'omkar ', 'khamkar@gmail.com', 'mahadev@gmail.com'),
(56, 'present', '2024-10-20', 'sonu ', 'sonu@123', 'somnath@123'),
(57, 'absent', '2024-10-20', 'yogesh kadam ', 'yogesh@123', 'somnath@123'),
(58, 'absent', '2024-10-20', 'Rimzim G ', 'rimzim@123', 'somnath@123'),
(59, 'present', '2024-10-20', 'tejas ', 'tejas123@gmail.com', 'somnath@123'),
(60, 'absent', '2024-10-20', 'omkar ', 'khamkar@gmail.com', 'somnath@123');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `name` varchar(21) NOT NULL,
  `lname` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`name`, `lname`, `email`, `subject`, `msg`) VALUES
('tejas', 'gaikwad', 'tejas@gmail.com', 'test', 'jhdghgfhj'),
('', '', '', '', ''),
('Dajiba', 'gatkul', 'Gatkul@gmail.com', 'test', 'sjdhsaidghjsk'),
('Dajiba', 'gatkul', 'gatkul@gmail.com', 'test', 'he hello'),
('', '', '', '', ''),
('tejas', 'gaikwad', 'tejas@gmail.com', 'test', 'hellow'),
('tejas', 'gaikwad', 'tejas@gmail.com', 'contact me', 'etSGE');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `add` varchar(40) NOT NULL,
  `no` varchar(10) NOT NULL,
  `dob` varchar(21) NOT NULL,
  `gen` varchar(12) NOT NULL,
  `pass` varchar(21) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `email`, `add`, `no`, `dob`, `gen`, `pass`, `img`) VALUES
(1, 'somath gatkul', 'somnath@123', 'hasapsar', '3243525328', '30-23-2929', 'male', 'somnath123', 'somnath.jpeg'),
(2, 'tanaji lawand', 'tanaji@gmail.com', 'lay lambcha ahe ha', '2313322322', '2024-10-13', 'Male', 'tanaji123', 'tanaji.jpeg'),
(3, 'mahadev padalkar', 'mahadev@gmail.com', 'ha bhekraila rahto', '3252823823', '2024-10-01', 'Male', 'mahadev123', 'mahadev.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `sender_name` varchar(50) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `msg` varchar(400) NOT NULL,
  `msgdate` varchar(21) NOT NULL,
  `op` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`sender_name`, `receiver_name`, `msg`, `msgdate`, `op`) VALUES
('omkar', 'dhsjh', 'sdfgads', '2024-10-17', 'admin'),
('khamkar@gmail.com', 'sandeshgaikwad3033@gmail.com', 'hi hello sir', '2024-10-17', 'admin'),
('yogesh', 'sonu@123', 'hellow sandesh gaikwad', '2024-10-17', 'user'),
('user', 'sandesh@gamil.com', 'hello sir', '2024-10-17', 'admin'),
('driver', 'somnath@123', 'hello i am driver', '2024-10-17', 'admin'),
('user', 'somnath@123', 'your system is very good', '2024-10-17', 'admin'),
('admin', 'sonu@123', 'hello sandesh ', '2024-10-17', 'user'),
('user', 'rimzim@123', 'hi i am rimzim', '2024-10-18', 'admin'),
('admin', 'rimzim@123', 'hello rimzim, how are you', '2024-10-18', 'user'),
('user', 'sonu@123', 'hellw data your driving is very good', '2024-10-18', 'driver'),
('admin', 'somnath@123', 'today is holidy', '2024-10-18', 'driver'),
('user', 'sonu@123', 'hi sir', '2024-10-18', 'admin'),
('user', 'sonu@123', 'hellow kaka i am sandesh gaiwkad', '2024-10-18', 'driver'),
('driver', 'sonu@123', 'hello sandesh', '2024-10-18', 'user'),
('user', 'sonu@123', 'i have one problem please help me', '2024-10-18', 'admin'),
('user', 'sonu@123', 'data wait for one mitnite ', '2024-10-18', 'driver'),
('admin', 'sonu@123', 'which problem sonu ', '2024-10-18', 'user'),
('admin', 'somnath@123', 'hello somnath your salary is only 7000 ok!', '2024-10-18', 'driver'),
('driver', 'sonu@123', 'yes sonu i am wating ', '2024-10-18', 'user'),
('driver', 'sandeshgaikwad3033@gmail.com', 'NO sir , letil bit incrise ', '2024-10-18', 'admin'),
('driver', 'sonu@123', 'today is holidy', '2024-10-19', 'user'),
('driver', 'somnath@123', 'attendance is completed.', '2024-10-20', 'admin'),
('admin', 'sonu@123', 'hello sonu ', '2024-10-20', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` varchar(20) NOT NULL,
  `email` varchar(31) NOT NULL,
  `Age` varchar(21) NOT NULL,
  `mono` varchar(10) NOT NULL,
  `add` varchar(40) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `name` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `age` varchar(12) NOT NULL,
  `mono` varchar(10) NOT NULL,
  `address` varchar(40) NOT NULL,
  `schoolname` varchar(21) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(21) NOT NULL,
  `name` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `age` varchar(12) NOT NULL,
  `mono` varchar(10) NOT NULL,
  `schoolname` varchar(21) NOT NULL,
  `address` varchar(40) NOT NULL,
  `location` varchar(200) NOT NULL,
  `pass` varchar(21) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `age`, `mono`, `schoolname`, `address`, `location`, `pass`, `img`) VALUES
(7, 'sonu ', 'sonu@123', '7219828429', '20', 'AM', 'wadki', 'https://maps.app.goo.gl/UxTnBs3PesXanfbE9', 'sonu123', 'sonu1.png'),
(8, 'yogesh kadam ', 'yogesh@123', '1232124323', '24', 'AM', 'ramtekadi pune', 'https://maps.app.goo.gl/UqGeFm5T7K9CTLQx8', 'yogesh123', 'yogesh1.jpeg'),
(9, 'Rimzim G ', 'rimzim@123', '3232323223', '20', 'AM', 'hadpsar ', 'https://maps.app.goo.gl/TjSyR4fcmJ65HJqQ9', 'rimzim123', 'rimzim.jpeg'),
(10, 'tejas ', 'tejas123@gmail.com', '7507268255', '20', 'AM', 'saswad', 'https://maps.app.goo.gl/BRQUA7DQKCbjBupz8', 'tejas123', 'tejas.jpeg'),
(11, 'omkar ', 'khamkar@gmail.com', '9657616269', '19', 'am', 'flatvar', 'https://maps.app.goo.gl/5GsKCRPd1REjaxtD9', 'khamkar123', 'omkar.jpeg'),
(12, 'ram thombre ', 'ram@123', '2312142372', '20', 'AM', 'yawat', 'https://maps.app.goo.gl/BzuSdGhZb6tup8yk8', 'ram123', 'ram.jpeg'),
(13, 'kunal ghadge ', 'kunal@123', '02313322322', '20', 'AM', 'bhekrai nager Pune', 'https://maps.app.goo.gl/qSKcE2DFsheNt6X6A', 'kunal123', 'kunal.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
