-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 12, 2022 at 07:49 PM
-- Server version: 8.0.29
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sectors`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_class`
--

CREATE TABLE `category_class` (
  `category_class_id` int NOT NULL,
  `category_group_id` int DEFAULT NULL,
  `category_class_name` varchar(255) NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_group`
--

CREATE TABLE `category_group` (
  `id` int NOT NULL,
  `category_group_name` varchar(255) NOT NULL,
  `category_group_id` int NOT NULL,
  `category_group_item_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_group_item`
--

CREATE TABLE `category_group_item` (
  `id` int NOT NULL,
  `group_item_name` varchar(255) NOT NULL,
  `group_item_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cat_group`
--

CREATE TABLE `cat_group` (
  `id` int NOT NULL,
  `category_group_name` varchar(255) NOT NULL,
  `category_group_id` int NOT NULL,
  `category_group_item_id` int DEFAULT NULL,
  `category_class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `group_item`
--

CREATE TABLE `group_item` (
  `id` int NOT NULL,
  `group_item_name` varchar(255) NOT NULL,
  `group_item_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `id` int NOT NULL,
  `username` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `sector_id` int DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_category_preference`
--

CREATE TABLE `user_category_preference` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_class`
--
ALTER TABLE `category_class`
  ADD PRIMARY KEY (`category_class_id`) USING BTREE,
  ADD UNIQUE KEY `category_group_id` (`category_group_id`),
  ADD KEY `fk_category_category_class` (`category_id`);

--
-- Indexes for table `category_group`
--
ALTER TABLE `category_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_class_category_group` (`category_group_id`),
  ADD KEY `fk_category_group_item_category_group` (`category_group_item_id`);

--
-- Indexes for table `category_group_item`
--
ALTER TABLE `category_group_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_group_category_group_item` (`group_item_id`);

--
-- Indexes for table `cat_group`
--
ALTER TABLE `cat_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_class_category_group` (`category_group_id`),
  ADD KEY `fk_category_group_item_category_group` (`category_group_item_id`);

--
-- Indexes for table `group_item`
--
ALTER TABLE `group_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_group_category_group_item` (`group_item_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_id` (`user_id`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sector_id_2` (`sector_id`);

--
-- Indexes for table `user_category_preference`
--
ALTER TABLE `user_category_preference`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_group`
--
ALTER TABLE `category_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `category_group_item`
--
ALTER TABLE `category_group_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cat_group`
--
ALTER TABLE `cat_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `group_item`
--
ALTER TABLE `group_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `username`
--
ALTER TABLE `username`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `user_category_preference`
--
ALTER TABLE `user_category_preference`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_class`
--
ALTER TABLE `category_class`
  ADD CONSTRAINT `fk_category_category_class` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_group_category_class` FOREIGN KEY (`category_group_id`) REFERENCES `category_group` (`category_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_group`
--
ALTER TABLE `category_group`
  ADD CONSTRAINT `fk_category_class_category_group` FOREIGN KEY (`category_group_id`) REFERENCES `category_class` (`category_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_group_item_category_group` FOREIGN KEY (`category_group_item_id`) REFERENCES `category_group_item` (`group_item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `username` (`id`);

--
-- Constraints for table `username`
--
ALTER TABLE `username`
  ADD CONSTRAINT `username_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `user_category_preference` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
