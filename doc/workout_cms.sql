-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 04:07 AM
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
-- Database: `workout_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bodybuilders`
--

CREATE TABLE `bodybuilders` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `height` float NOT NULL COMMENT 'Height in meters',
  `weight` float NOT NULL COMMENT 'Weight in kilograms',
  `competitions_won` text DEFAULT NULL COMMENT 'Comma-separated list of competitions',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `img_location` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_edited_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bodybuilders`
--

INSERT INTO `bodybuilders` (`id`, `full_name`, `height`, `weight`, `competitions_won`, `created_at`, `img_location`, `created_by`, `last_edited_by`) VALUES
(1, 'Arnold Schwarzenegger', 1.88, 107, 'Mr. Olympia 1970, Mr. Olympia 1971, Mr. Olympia 1972, Mr. Olympia 1973, Mr. Olympia 1974, Mr. Olympia 1975, Mr. Olympia 1980', '2024-12-05 03:18:54', '../data/arnold.png', NULL, NULL),
(2, 'Ronnie Coleman', 1.8, 135, 'Mr. Olympia 1998, Mr. Olympia 1999, Mr. Olympia 2000, Mr. Olympia 2001, Mr. Olympia 2002, Mr. Olympia 2003, Mr. Olympia 2004, Mr. Olympia 2005', '2024-12-05 03:18:54', '../data/ronnie.png', NULL, NULL),
(3, 'Dorian Yates', 1.78, 121, 'Mr. Olympia 1992, Mr. Olympia 1993, Mr. Olympia 1994, Mr. Olympia 1995, Mr. Olympia 1996, Mr. Olympia 1997', '2024-12-05 03:18:54', '../data/dorian.png', NULL, NULL),
(4, 'Jay Cutler', 1.75, 125, 'Mr. Olympia 2006, Mr. Olympia 2007, Mr. Olympia 2009, Mr. Olympia 2010', '2024-12-05 03:18:54', '../data/jay.png', NULL, NULL),
(5, 'Lee Haney', 1.8, 111, 'Mr. Olympia 1984, Mr. Olympia 1985, Mr. Olympia 1986, Mr. Olympia 1987, Mr. Olympia 1988, Mr. Olympia 1989, Mr. Olympia 1990, Mr. Olympia 1991', '2024-12-05 03:18:54', '../data/lee.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','member') NOT NULL DEFAULT 'member',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'admin1', 'password123', 'admin1@example.com', 'admin', '2024-12-05 03:17:06'),
(2, 'member1', 'password456', 'member1@example.com', 'member', '2024-12-05 03:17:06'),
(3, 'member2', 'password789', 'member2@example.com', 'member', '2024-12-05 03:17:06'),
(4, 'admin2', 'password987', 'admin2@example.com', 'admin', '2024-12-05 03:17:06'),
(5, 'member3', 'password654', 'member3@example.com', 'member', '2024-12-05 03:17:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodybuilders`
--
ALTER TABLE `bodybuilders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_created_by` (`created_by`),
  ADD KEY `fk_last_edited_by` (`last_edited_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bodybuilders`
--
ALTER TABLE `bodybuilders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bodybuilders`
--
ALTER TABLE `bodybuilders`
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_last_edited_by` FOREIGN KEY (`last_edited_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
