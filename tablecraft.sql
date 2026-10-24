-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 24, 2026 at 02:31 AM
-- Server version: 8.4.7
-- PHP Version: 8.5.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tablecraft`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_tables`
--

DROP TABLE IF EXISTS `data_tables`;
CREATE TABLE IF NOT EXISTS `data_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_mode` enum('bright','dark') COLLATE utf8mb4_unicode_ci DEFAULT 'bright',
  `accent_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#080E53',
  `font_family` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Figtree',
  `is_commercial` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_tables`
--

INSERT INTO `data_tables` (`id`, `user_id`, `category`, `title`, `theme_mode`, `accent_color`, `font_family`, `is_commercial`, `created_at`, `updated_at`) VALUES
(1, 1, 'student_record', 'GK & CK bosamia college student list ( new addmission )', 'bright', '#080E53', 'Roboto', 0, '2026-10-13 21:26:24', '2026-10-23 16:25:16'),
(2, 1, 'shop_order', 'Happines Grocery Shop', 'bright', '#080E53', 'Figtree', 0, '2026-10-14 21:02:41', '2026-10-23 16:39:40'),
(3, 1, 'employee_info', 'Rangoli Ice Cream pvt lmt.', 'bright', '#080E53', 'Figtree', 0, '2026-10-14 21:11:01', '2026-10-14 21:11:01'),
(4, 1, 'library_books', 'Alpha Library', 'bright', '#080E53', 'Figtree', 0, '2026-10-14 21:15:51', '2026-10-14 21:15:51'),
(5, 1, 'product_stock', 'Modern Sport', 'bright', '#080E53', 'Figtree', 0, '2026-10-23 17:08:01', '2026-10-23 17:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `table_cells`
--

DROP TABLE IF EXISTS `table_cells`;
CREATE TABLE IF NOT EXISTS `table_cells` (
  `id` int NOT NULL AUTO_INCREMENT,
  `row_id` int NOT NULL,
  `column_id` int NOT NULL,
  `cell_value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `row_id` (`row_id`),
  KEY `column_id` (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7857 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_cells`
--

INSERT INTO `table_cells` (`id`, `row_id`, `column_id`, `cell_value`) VALUES
(3367, 669, 975, '35'),
(3368, 669, 976, 'paras'),
(3369, 669, 977, 'tybca'),
(3370, 669, 978, '3443435543'),
(3371, 669, 979, 'Dhoraji'),
(3372, 669, 980, '50'),
(3373, 670, 975, '45'),
(3374, 670, 976, 'prince'),
(3375, 670, 977, 'sybca'),
(3376, 670, 978, '2424346463'),
(3377, 670, 979, 'Jetpur'),
(3378, 670, 980, '90'),
(3379, 671, 975, '36'),
(3380, 671, 976, 'raj'),
(3381, 671, 977, 'tybca'),
(3382, 671, 978, '7434557343'),
(3383, 671, 979, 'Dhoraji'),
(3384, 671, 980, '59'),
(3385, 672, 975, '46'),
(3386, 672, 976, 'keval'),
(3387, 672, 977, 'sybca'),
(3388, 672, 978, '3522222445'),
(3389, 672, 979, 'Upleta'),
(3390, 672, 980, '78'),
(3391, 673, 975, '39'),
(3392, 673, 976, 'asish'),
(3393, 673, 977, 'fybca'),
(3394, 673, 978, '4623236453'),
(3395, 673, 979, 'Dhoraji'),
(3396, 673, 980, '99'),
(3397, 674, 975, '40'),
(3398, 674, 976, 'jayesh'),
(3399, 674, 977, 'fybca'),
(3400, 674, 978, '3236745455'),
(3401, 674, 979, 'Jetpur'),
(3402, 674, 980, '67'),
(3403, 675, 975, '37'),
(3404, 675, 976, 'mihir'),
(3405, 675, 977, 'tybca'),
(3406, 675, 978, '3236345345'),
(3407, 675, 979, 'Junagadh'),
(3408, 675, 980, '75'),
(3409, 676, 975, '47'),
(3410, 676, 976, 'nidhi'),
(3411, 676, 977, 'sybca'),
(3412, 676, 978, '4463235664'),
(3413, 676, 979, 'Navagadh'),
(3414, 676, 980, '86'),
(3415, 677, 975, '41'),
(3416, 677, 976, 'mitali'),
(3417, 677, 977, 'fybca'),
(3418, 677, 978, '8456565443'),
(3419, 677, 979, 'dhoraji'),
(3420, 677, 980, '83'),
(5087, 916, 1266, '630.00'),
(5088, 916, 1261, '12202'),
(5089, 916, 1262, 'Ashish Patel'),
(5090, 916, 1263, 'Sugar Powder'),
(5091, 916, 1264, '3 pkt'),
(5092, 916, 1265, '210'),
(5093, 916, 1267, '12-10-26'),
(5094, 917, 1266, '125.00'),
(5095, 917, 1262, 'Ashish Patel'),
(5096, 917, 1261, '12202'),
(5097, 917, 1263, 'Dove Soap'),
(5098, 917, 1264, '5 nos'),
(5099, 917, 1265, '25'),
(5100, 917, 1267, '12-10-26'),
(5101, 918, 1266, '40.00'),
(5102, 918, 1261, '12202'),
(5103, 918, 1262, 'Ashish Patel'),
(5104, 918, 1263, 'Maggi'),
(5105, 918, 1264, '4 pkt'),
(5106, 918, 1265, '10'),
(5107, 918, 1267, '12-10-26'),
(5108, 919, 1261, '12203'),
(5109, 919, 1262, 'Krisha Sharma'),
(5110, 919, 1263, 'Oreo biscuit'),
(5111, 919, 1264, '5 pkt'),
(5112, 919, 1265, '20'),
(5113, 919, 1266, '100.00'),
(5114, 919, 1267, '12-10-26'),
(5115, 920, 1261, '12203'),
(5116, 920, 1262, 'Krisha Sharma'),
(5117, 920, 1263, 'Milk 500ml'),
(5118, 920, 1264, '1 pkt'),
(5119, 920, 1265, '60'),
(5120, 920, 1266, '60.00'),
(5121, 920, 1267, '12-10-26'),
(5122, 921, 1261, '12203'),
(5123, 921, 1262, 'Krisha Sharma'),
(5124, 921, 1263, 'Dairymilk Chocolate'),
(5125, 921, 1264, '2 nos'),
(5126, 921, 1265, '20'),
(5127, 921, 1266, '40.00'),
(5128, 921, 1267, '12-10-26'),
(5129, 922, 1261, '12203'),
(5130, 922, 1262, 'Krisha Sharma'),
(5131, 922, 1263, 'Tomato Ketchup'),
(5132, 922, 1264, '1 nos'),
(5133, 922, 1265, '25'),
(5134, 922, 1266, '25.00'),
(5135, 922, 1267, '12-10-26'),
(5136, 923, 1261, '12204'),
(5137, 923, 1262, 'Harsh Kumar'),
(5138, 923, 1263, 'Coffe'),
(5139, 923, 1264, '2 pkt'),
(5140, 923, 1265, '40'),
(5141, 923, 1266, '80.00'),
(5142, 923, 1267, '12-10-26'),
(5393, 974, 1323, '805'),
(5394, 974, 1324, 'Thumar Paras Dineshbhai'),
(5395, 974, 1325, 'Despath'),
(5396, 974, 1326, '12-10-26'),
(5397, 974, 1327, '12000'),
(5398, 975, 1323, '806'),
(5399, 975, 1324, 'Sharma Het Piyushbhai'),
(5400, 975, 1325, 'Machine Line 2'),
(5401, 975, 1326, '13-10-26'),
(5402, 975, 1327, '13000'),
(5403, 976, 1323, '807'),
(5404, 976, 1324, 'Patel Krisha Mehulbhai'),
(5405, 976, 1325, 'Store room'),
(5406, 976, 1326, '12-10-26'),
(5407, 976, 1327, '14000'),
(5408, 977, 1323, '808'),
(5409, 977, 1324, 'Vagadiya Subhash Rajeshbhai'),
(5410, 977, 1325, 'Account'),
(5411, 977, 1326, '14-10-26'),
(5412, 977, 1327, '16500'),
(5413, 978, 1323, '809'),
(5414, 978, 1324, 'Shah Nitin Maheshbhai'),
(5415, 978, 1325, 'Laboratory'),
(5416, 978, 1326, '14-10-26'),
(5417, 978, 1327, '15500'),
(7794, 1410, 1701, '12333'),
(7795, 1410, 1702, '1984'),
(7796, 1410, 1703, 'George Orwell'),
(7797, 1410, 1704, 'Novel'),
(7798, 1410, 1705, '12-10-26'),
(7799, 1410, 1706, '15-10-26'),
(7800, 1411, 1706, '15-10-26'),
(7801, 1411, 1701, '34221'),
(7802, 1411, 1702, 'Pride and Prejudice'),
(7803, 1411, 1703, 'Jane Austen'),
(7804, 1411, 1704, 'Romance'),
(7805, 1411, 1705, '13-10-26'),
(7806, 1412, 1701, '4222'),
(7807, 1412, 1702, 'The Silent Patient'),
(7808, 1412, 1703, 'Alex Michaelides'),
(7809, 1412, 1704, 'Mystery'),
(7810, 1412, 1705, '12-10-26'),
(7811, 1412, 1706, '15-10-26'),
(7812, 1413, 1701, '43222'),
(7813, 1413, 1702, 'To Kill a Mockingbird'),
(7814, 1413, 1703, 'Harper Lee'),
(7815, 1413, 1704, 'Justice'),
(7816, 1413, 1705, '14-10-26'),
(7817, 1413, 1706, '20-10-26'),
(7818, 1414, 1701, '5336'),
(7819, 1414, 1702, 'The Great Gatsby'),
(7820, 1414, 1703, 'F. Scott Fitzgeraid'),
(7821, 1414, 1704, 'Dramatic'),
(7822, 1414, 1705, '14-10-26'),
(7823, 1414, 1706, '20-10-26'),
(7824, 1415, 1701, '52275'),
(7825, 1415, 1702, 'In Search of Lost Time'),
(7826, 1415, 1703, 'Marcel Proust'),
(7827, 1415, 1704, 'Modernist'),
(7828, 1415, 1705, '15-10-26'),
(7829, 1415, 1706, '30-10-26'),
(7830, 1416, 1701, '2343'),
(7831, 1416, 1702, 'War and Peace'),
(7832, 1416, 1703, 'Leo Tolstoy'),
(7833, 1416, 1704, 'Historical'),
(7834, 1416, 1705, '15-10-26'),
(7835, 1416, 1706, '30-10-26'),
(7836, 1417, 1701, '32211'),
(7837, 1417, 1702, 'The Odyssey'),
(7838, 1417, 1703, 'Homer'),
(7839, 1417, 1704, 'Adventure'),
(7840, 1417, 1705, '15-10-26'),
(7841, 1417, 1706, '30-10-26'),
(7842, 1418, 1701, '43352'),
(7843, 1418, 1702, 'One Hundred Years of Solitude'),
(7844, 1418, 1703, 'Gabriel Garcia Marquez'),
(7845, 1418, 1704, 'Magical'),
(7846, 1418, 1705, '16-10-26'),
(7847, 1418, 1706, '30-10-26'),
(7848, 1419, 1701, '6345'),
(7849, 1419, 1702, 'Don Quixote'),
(7850, 1419, 1703, 'Miguel de Cervantes'),
(7851, 1419, 1704, 'Novel'),
(7852, 1419, 1705, '16-10-26'),
(7853, 1419, 1706, '30-10-26'),
(7854, 1423, 1717, '0.00'),
(7855, 1424, 1717, '0.00'),
(7856, 1425, 1717, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `table_columns`
--

DROP TABLE IF EXISTS `table_columns`;
CREATE TABLE IF NOT EXISTS `table_columns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  `column_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_type` enum('text','number','date','currency') COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `column_order` int DEFAULT '0',
  `is_formula` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1718 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_columns`
--

INSERT INTO `table_columns` (`id`, `table_id`, `column_name`, `column_type`, `column_order`, `is_formula`) VALUES
(975, 1, 'Roll No', 'number', 0, 0),
(976, 1, 'Student Name', 'text', 1, 0),
(977, 1, 'Year/Course', 'text', 2, 0),
(978, 1, 'Phone', 'text', 3, 0),
(979, 1, 'City', 'number', 4, 0),
(980, 1, '% ( 12th )', 'number', 5, 0),
(1261, 2, 'Order ID', 'text', 0, 0),
(1262, 2, 'Customer Name', 'text', 1, 0),
(1263, 2, 'Product', 'text', 2, 0),
(1264, 2, 'Quantity', 'number', 3, 0),
(1265, 2, 'Price', 'currency', 4, 0),
(1266, 2, 'Total', 'currency', 5, 1),
(1267, 2, 'Order Date', 'date', 6, 0),
(1323, 3, 'Employee ID', 'text', 0, 0),
(1324, 3, 'Full Name', 'text', 1, 0),
(1325, 3, 'Department', 'text', 2, 0),
(1326, 3, 'Joining Date', 'date', 3, 0),
(1327, 3, 'Salary', 'currency', 4, 0),
(1701, 4, 'Book ID', 'text', 0, 0),
(1702, 4, 'Title', 'text', 1, 0),
(1703, 4, 'Author', 'text', 2, 0),
(1704, 4, 'Category', 'text', 3, 0),
(1705, 4, 'Issue Date', 'date', 4, 0),
(1706, 4, 'Return Date', 'date', 5, 0),
(1713, 5, 'Product ID', 'text', 0, 0),
(1714, 5, 'Product Name', 'text', 1, 0),
(1715, 5, 'Quantity', 'number', 2, 0),
(1716, 5, 'Price', 'currency', 3, 0),
(1717, 5, 'Stock Value', 'currency', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_rows`
--

DROP TABLE IF EXISTS `table_rows`;
CREATE TABLE IF NOT EXISTS `table_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  `row_order` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_rows`
--

INSERT INTO `table_rows` (`id`, `table_id`, `row_order`) VALUES
(669, 1, 0),
(670, 1, 1),
(671, 1, 2),
(672, 1, 3),
(673, 1, 4),
(674, 1, 5),
(675, 1, 6),
(676, 1, 7),
(677, 1, 8),
(916, 2, 0),
(917, 2, 1),
(918, 2, 2),
(919, 2, 3),
(920, 2, 4),
(921, 2, 5),
(922, 2, 6),
(923, 2, 7),
(974, 3, 0),
(975, 3, 1),
(976, 3, 2),
(977, 3, 3),
(978, 3, 4),
(1410, 4, 0),
(1411, 4, 1),
(1412, 4, 2),
(1413, 4, 3),
(1414, 4, 4),
(1415, 4, 5),
(1416, 4, 6),
(1417, 4, 7),
(1418, 4, 8),
(1419, 4, 9),
(1423, 5, 0),
(1424, 5, 1),
(1425, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#1F50FF',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `avatar_color`, `created_at`) VALUES
(1, 'Demo User', 'demo@tablecraft.com', '$2b$10$GwNfOiVWVPjpaHTynDJe9uEcHpP/1kHc/PI1FFDRuQj4wJmD5G2b6', '#1F50FF', '2026-10-13 21:25:26'),
(2, 'Thumar Paras', 'paras21thumar@gmail.com', '$2y$12$A4ccxhYMDoV1XoiNwbl/O.LPKIyjy8m2fHgJxpGcaKNmjpHLBiUce', '#080E53', '2026-10-14 21:20:58');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_tables`
--
ALTER TABLE `data_tables`
  ADD CONSTRAINT `data_tables_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_cells`
--
ALTER TABLE `table_cells`
  ADD CONSTRAINT `table_cells_ibfk_1` FOREIGN KEY (`row_id`) REFERENCES `table_rows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `table_cells_ibfk_2` FOREIGN KEY (`column_id`) REFERENCES `table_columns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_columns`
--
ALTER TABLE `table_columns`
  ADD CONSTRAINT `table_columns_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `data_tables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_rows`
--
ALTER TABLE `table_rows`
  ADD CONSTRAINT `table_rows_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `data_tables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
