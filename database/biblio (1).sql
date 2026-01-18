-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 18, 2026 at 01:59 AM
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
-- Database: `biblio`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `_id` int(11) NOT NULL,
  `name` char(100) NOT NULL,
  `bio` char(255) DEFAULT NULL,
  `nationality` char(50) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `death_day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`_id`, `name`, `bio`, `nationality`, `birth_day`, `death_day`) VALUES
(1, 'Haruki Murakami', 'Japanese novelist', 'Japanese', '1949-01-12', NULL),
(2, 'Osamu Dazai', 'Japanese writer', 'Japanese', '1909-06-19', '1948-06-13'),
(3, 'V. E. Schwab', 'American fantasy author', 'American', '1987-07-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `biblio`
--

CREATE TABLE `biblio` (
  `_id` int(11) NOT NULL,
  `name` char(100) NOT NULL,
  `location` char(100) DEFAULT NULL,
  `tel` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biblio`
--

INSERT INTO `biblio` (`_id`, `name`, `location`, `tel`, `email`) VALUES
(1, 'Amougar_Compus1', 'Agadir', '0528000001', 'agadir@amougar.ma'),
(2, 'Amougar_Compus2', 'Inezgane', '0528000002', 'inezgane@amougar.ma'),
(3, 'Amougar_Compus3', 'Tikiouine', '0528000003', 'tikiouine@amougar.ma'),
(4, 'Amougar_Compus4', 'Ait Melloul', '0528000004', 'aitmelloul@amougar.ma'),
(5, 'Amougar_Compus5', 'Dcheira', '0528000005', 'dcheira@amougar.ma');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `isbn` int(11) NOT NULL,
  `title` char(150) NOT NULL,
  `status` enum('available','checkout','reserved','under_maintenance') NOT NULL,
  `publication_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`isbn`, `title`, `status`, `publication_year`) VALUES
(1, 'Norwegian Wood', 'available', '1987'),
(2, 'No Longer Human', 'checkout', '1948'),
(3, 'The Invisible Life of Addie LaRue', 'reserved', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `id_book` int(11) NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`id_book`, `id_author`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_catg`
--

CREATE TABLE `book_catg` (
  `id_catg` int(11) NOT NULL,
  `id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_catg`
--

INSERT INTO `book_catg` (`id_catg`, `id_book`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `biblio_id` int(11) DEFAULT NULL,
  `available_copies` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`_id`, `book_id`, `biblio_id`, `available_copies`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 3),
(3, 3, 3, 4),
(4, 1, 4, 2),
(5, 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrowed`
--

CREATE TABLE `borrowed` (
  `borrow_id` int(11) NOT NULL,
  `book_copy_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `borrow_date` date DEFAULT curdate(),
  `due_date` date DEFAULT NULL,
  `actual_return_date` date DEFAULT NULL,
  `late_fee` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowed`
--

INSERT INTO `borrowed` (`borrow_id`, `book_copy_id`, `member_id`, `borrow_date`, `due_date`, `actual_return_date`, `late_fee`) VALUES
(1, 1, 1, '2024-01-01', '2024-01-10', '2024-01-15', 10.5),
(2, 2, 2, '2024-01-05', '2024-01-15', '2024-01-20', 7),
(3, 3, 1, '2024-01-08', '2024-01-18', '2024-01-25', 12),
(4, 4, 2, '2024-01-10', '2024-01-20', '2024-01-21', 1),
(5, 5, 1, '2024-01-12', '2024-01-22', '2024-01-30', 8),
(6, 1, 2, '2024-02-01', '2024-02-10', '2024-02-14', 4),
(7, 2, 1, '2024-02-05', '2024-02-15', '2024-02-19', 4.5),
(8, 3, 2, '2024-02-07', '2024-02-17', '2024-02-25', 11),
(9, 4, 1, '2024-02-10', '2024-02-20', '2024-02-22', 2),
(10, 5, 2, '2024-02-12', '2024-02-22', '2024-03-01', 9.5),
(11, 1, 1, '2024-03-01', '2024-03-10', '2024-03-18', 8),
(12, 2, 2, '2024-03-05', '2024-03-15', '2024-03-16', 1),
(13, 3, 1, '2024-03-08', '2024-03-18', '2024-03-28', 15),
(14, 4, 2, '2024-03-10', '2024-03-20', '2024-03-25', 5),
(15, 5, 1, '2024-03-12', '2024-03-22', '2024-03-29', 7.5),
(16, 1, 2, '2024-04-01', '2024-04-10', '2024-04-20', 12),
(17, 2, 1, '2024-04-05', '2024-04-15', '2024-04-17', 2),
(18, 3, 2, '2024-04-07', '2024-04-17', '2024-04-30', 18),
(19, 4, 1, '2024-04-10', '2024-04-20', '2024-04-23', 3),
(20, 5, 2, '2024-04-12', '2024-04-22', '2024-05-01', 10);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `_id` int(11) NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`_id`, `name`) VALUES
(3, 'Fantasy'),
(1, 'Fiction'),
(2, 'Philosophy');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `_id` int(11) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `current_borrowed` int(11) DEFAULT NULL,
  `total_borrowed` int(11) DEFAULT NULL,
  `membership_start` date DEFAULT NULL,
  `membership_end` date DEFAULT NULL,
  `role` enum('studentMemb','facultyMemb') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`_id`, `name`, `email`, `current_borrowed`, `total_borrowed`, `membership_start`, `membership_end`, `role`) VALUES
(1, 'Tariq', 'tariq@student.ma', 2, 10, '2023-01-10', '2026-01-10', 'studentMemb'),
(2, 'Hajar', 'hajar@faculty.ma', 1, 25, '2022-09-01', '2027-09-01', 'facultyMemb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `biblio`
--
ALTER TABLE `biblio`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id_book`,`id_author`),
  ADD KEY `id_author` (`id_author`);

--
-- Indexes for table `book_catg`
--
ALTER TABLE `book_catg`
  ADD PRIMARY KEY (`id_catg`,`id_book`),
  ADD KEY `id_book` (`id_book`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `biblio_id` (`biblio_id`);

--
-- Indexes for table `borrowed`
--
ALTER TABLE `borrowed`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `book_copy_id` (`book_copy_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `biblio`
--
ALTER TABLE `biblio`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `isbn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrowed`
--
ALTER TABLE `borrowed`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`_id`);

--
-- Constraints for table `book_catg`
--
ALTER TABLE `book_catg`
  ADD CONSTRAINT `book_catg_ibfk_1` FOREIGN KEY (`id_catg`) REFERENCES `category` (`_id`),
  ADD CONSTRAINT `book_catg_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `book` (`isbn`);

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`biblio_id`) REFERENCES `biblio` (`_id`);

--
-- Constraints for table `borrowed`
--
ALTER TABLE `borrowed`
  ADD CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`_id`),
  ADD CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
