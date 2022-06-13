-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 13, 2022 at 02:30 PM
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

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Manufacturing'),
(2, 'Other'),
(3, 'Service');

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

--
-- Dumping data for table `category_class`
--

INSERT INTO `category_class` (`category_class_id`, `category_group_id`, `category_class_name`, `category_id`) VALUES
(1, NULL, 'Construction materials', 1),
(2, NULL, 'Electronics and Optics', 1),
(3, 1, 'Food and Beverage', 1),
(4, 2, 'Furniture', 1),
(5, 3, 'Machinery', 1),
(6, 4, 'Metalworking', 1),
(7, 5, 'Plastic and Rubber', 1),
(8, 6, 'Printing', 1),
(9, 7, 'Textile and Clothing', 1),
(10, 8, 'Wood', 1),
(11, NULL, 'Creative industries', 2),
(12, NULL, 'Energy technology', 2),
(13, NULL, 'Environment', 2),
(14, NULL, 'Business services', 3),
(15, NULL, 'Engineering', 3),
(16, 9, 'Information  Technology and Telecommunications', 3),
(17, NULL, 'Tourism', 3),
(18, NULL, 'Translation services', 3),
(19, 10, 'Transport and Logistics', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category_group`
--

CREATE TABLE `category_group` (
  `id` int NOT NULL,
  `category_group_name` varchar(255) NOT NULL,
  `category_group_id` int NOT NULL,
  `category_group_item_id` int DEFAULT NULL,
  `category_class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category_group`
--

INSERT INTO `category_group` (`id`, `category_group_name`, `category_group_id`, `category_group_item_id`, `category_class_id`) VALUES
(1, 'Bakery & confectionery products', 1, NULL, 3),
(2, 'Beverages', 1, NULL, 3),
(3, 'Fish & fish products', 1, NULL, 3),
(4, 'Meat & meat products', 1, NULL, 3),
(5, 'Milk & dairy products', 1, NULL, 3),
(6, 'Other', 1, NULL, 3),
(7, 'Sweets & snack food', 1, NULL, 3),
(8, 'Bathroom/sauna', 2, NULL, 4),
(9, 'Bedroom', 2, NULL, 4),
(10, 'Children\'s room', 2, NULL, 4),
(11, 'Kitchen', 2, NULL, 4),
(12, 'Living room', 2, NULL, 4),
(13, 'Office', 2, NULL, 4),
(14, 'Other (Furniture)', 2, NULL, 4),
(15, 'Outdoor', 2, NULL, 4),
(16, 'Project furniture', 2, NULL, 4),
(17, 'Machinery components', 3, NULL, 5),
(18, 'Machinery equipment/tools', 3, NULL, 5),
(19, 'Manufacture of machinery', 3, NULL, 5),
(20, 'Maritime', 3, 1, 5),
(21, 'Metal structures', 3, NULL, 5),
(22, 'Other', 3, NULL, 5),
(23, 'Repair and maintenance service', 3, NULL, 5),
(24, 'Construction of metal structures', 4, NULL, 6),
(25, 'Houses and buildings', 4, NULL, 6),
(26, 'Metal products', 4, NULL, 6),
(27, 'Metal works', 4, 2, 6),
(28, 'Packaging', 5, NULL, 7),
(29, 'Plastic goods', 5, NULL, 7),
(30, 'Plastic processing technology', 5, 3, 7),
(31, 'Plastic profiles', 5, NULL, 7),
(32, 'Advertising', 6, NULL, 8),
(33, 'Book/Periodicals printing', 6, NULL, 8),
(34, 'Labelling and packaging printing', 6, NULL, 8),
(35, 'Clothing', 7, NULL, 9),
(36, 'Textile', 7, NULL, 9),
(37, 'Other (Wood)', 8, NULL, 10),
(38, 'Wooden building materials', 8, NULL, 10),
(39, 'Wooden houses', 8, NULL, 10),
(40, 'Data processing, Web portals, E-marketing', 9, NULL, 16),
(41, 'Programming, Consultancy', 9, NULL, 16),
(42, 'Software, Hardware', 9, NULL, 16),
(43, 'Telecommunications', 9, NULL, 16),
(44, 'Air', 10, NULL, 19),
(45, 'Rail', 10, NULL, 19),
(46, 'Road', 10, NULL, 19),
(47, 'Water', 10, NULL, 19);

-- --------------------------------------------------------

--
-- Table structure for table `category_group_item`
--

CREATE TABLE `category_group_item` (
  `id` int NOT NULL,
  `group_item_name` varchar(255) NOT NULL,
  `group_item_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category_group_item`
--

INSERT INTO `category_group_item` (`id`, `group_item_name`, `group_item_id`, `group_id`) VALUES
(1, 'Aluminium and steel workboats', 1, 20),
(2, 'Boat/Yacht building', 1, 20),
(3, 'Ship repair and conversion', 1, 20),
(4, 'CNC-machining', 2, 27),
(5, 'Forgings, Fasteners', 2, 27),
(6, 'Gas, Plasma, Laser cutting', 2, 27),
(7, 'MIG, TIG, Aluminum welding', 2, 27),
(8, 'Blowing', 3, 30),
(9, 'Moulding', 3, 30),
(10, 'Plastic welding and processing', 3, 30);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `username_id` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `accepted`, `username_id`, `username`, `date_created`) VALUES
(3, 1, NULL, 'test', '2022-06-13 14:22:19'),
(4, 1, NULL, 'test', '2022-06-13 14:22:19'),
(5, 1, NULL, 'aaaaa', '2022-06-13 14:22:48'),
(6, 1, NULL, 'aaaaa', '2022-06-13 14:22:48'),
(7, 1, NULL, '12', '2022-06-13 14:24:14'),
(8, 1, NULL, '12', '2022-06-13 14:24:14'),
(9, 1, NULL, 't', '2022-06-13 14:27:59'),
(10, 1, NULL, 't', '2022-06-13 14:27:59');

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

--
-- Dumping data for table `username`
--

INSERT INTO `username` (`id`, `username`, `sector_id`, `date_created`) VALUES
(24, 'test', NULL, '2022-06-13 14:17:35'),
(25, 'aaaaa', NULL, '2022-06-13 14:22:42'),
(26, '33', NULL, '2022-06-13 14:23:40'),
(27, '12', NULL, '2022-06-13 14:24:07'),
(28, 't', NULL, '2022-06-13 14:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_category_preference`
--

CREATE TABLE `user_category_preference` (
  `id` int NOT NULL,
  `username` varchar(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_category_preference`
--

INSERT INTO `user_category_preference` (`id`, `username`, `category_name`, `date_created`) VALUES
(4, 't', 'Kitchen', '2022-06-13 14:27:59'),
(5, 't', 'Kitchen', '2022-06-13 14:27:59'),
(6, 't', 'Living room', '2022-06-13 14:27:59'),
(7, 't', 'Living room', '2022-06-13 14:27:59'),
(8, 't', 'Beverages', '2022-06-13 14:29:51'),
(9, 't', 'Beverages', '2022-06-13 14:29:51');

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
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_id` (`username_id`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sector_id` (`sector_id`);

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
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `username`
--
ALTER TABLE `username`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_category_preference`
--
ALTER TABLE `user_category_preference`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `category_group_item`
--
ALTER TABLE `category_group_item`
  ADD CONSTRAINT `fk_category_group_category_group_item` FOREIGN KEY (`group_item_id`) REFERENCES `category_group` (`category_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_ibfk_1` FOREIGN KEY (`username_id`) REFERENCES `username` (`id`);

--
-- Constraints for table `username`
--
ALTER TABLE `username`
  ADD CONSTRAINT `username_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `user_category_preference` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
