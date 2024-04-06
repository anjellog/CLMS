-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 10:43 AM
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
-- Database: `clms`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `date_borrow` datetime NOT NULL DEFAULT current_timestamp(),
  `borrowcode` bigint(50) NOT NULL,
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_assigned` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `time_limit` datetime NOT NULL,
  `date_return` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`id`, `date_borrow`, `borrowcode`, `member_id`, `item_id`, `stock_id`, `user_id`, `room_assigned`, `status`, `time_limit`, `date_return`) VALUES
(14, '2024-04-06 16:14:47', 40620241014471, 16, 34, 33, 1, 11, 1, '2024-04-06 05:00:00', NULL),
(15, '2024-04-06 16:14:48', 40620241014471, 16, 35, 34, 1, 11, 1, '2024-04-06 05:00:00', NULL),
(16, '2024-04-06 16:15:02', 40620241015021, 15, 36, 37, 1, 4, 1, '2024-04-06 05:00:00', NULL),
(17, '2024-04-06 16:15:12', 40620241015121, 18, 35, 34, 1, 11, 2, '2024-04-06 05:00:00', '2024-04-06 10:16:27'),
(18, '2024-04-06 16:15:25', 40620241015251, 21, 34, 33, 1, 5, 1, '2024-04-06 05:45:00', NULL),
(19, '2024-04-06 16:15:45', 40620241015451, 23, 36, 37, 1, 11, 1, '2024-04-06 05:45:00', NULL),
(20, '2024-04-06 16:15:45', 40620241015451, 23, 39, 40, 1, 11, 1, '2024-04-06 05:45:00', NULL),
(21, '2024-04-06 16:15:45', 40620241015451, 23, 40, 41, 1, 11, 1, '2024-04-06 05:45:00', NULL),
(22, '2024-04-06 16:18:10', 40620241018101, 17, 37, 38, 1, 1, 1, '2024-04-06 04:17:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `e_deviceid` varchar(50) NOT NULL,
  `e_model` varchar(50) NOT NULL,
  `e_category` varchar(50) NOT NULL,
  `e_brand` varchar(50) NOT NULL,
  `e_description` text NOT NULL,
  `e_stock` int(11) NOT NULL,
  `e_stockleft` int(11) NOT NULL,
  `e_type` varchar(50) NOT NULL,
  `e_status` varchar(50) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_inventory`
--

CREATE TABLE `equipment_inventory` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_logs`
--

CREATE TABLE `history_logs` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `status_name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history_logs`
--

INSERT INTO `history_logs` (`id`, `description`, `table_name`, `status_name`, `user_id`, `user_type`, `date_created`) VALUES
(0, 'add 3items toPowerLite 2250Uquantity', 'equipment', '', 1, 1, '2024-04-06 15:58:21'),
(0, 'add new equipmentUniversal Remote , Remote', 'equipment', '', 1, 1, '2024-04-06 16:00:08'),
(0, 'add new equipmentNighthawk AC1900 , Router', 'equipment', '', 1, 1, '2024-04-06 16:02:23'),
(0, 'add new equipmentSoundLink Revolve+ , Speaker', 'equipment', '', 1, 1, '2024-04-06 16:03:49'),
(0, 'add new equipmentOptiPlex 7080 , System Unit', 'equipment', '', 1, 1, '2024-04-06 16:06:00'),
(0, 'add new equipmentHeight Adjustable , Table', 'equipment', '', 1, 1, '2024-04-06 16:07:07'),
(0, 'add new equipmentBravia 4K HDR , TV', 'equipment', '', 1, 1, '2024-04-06 16:08:13'),
(0, 'add new equipmentBack-UPS Pro 1500 , UPS', 'equipment', '', 1, 1, '2024-04-06 16:09:07'),
(0, 'edit room room 301 to room 101', 'room', '', 1, 1, '2024-04-06 16:09:50'),
(0, 'edit room room 302 to room 102', 'room', '', 1, 1, '2024-04-06 16:09:59'),
(0, 'edit room room 303 to room 103', 'room', '', 1, 1, '2024-04-06 16:10:07'),
(0, 'edit room room 304 to room 201', 'room', '', 1, 1, '2024-04-06 16:10:16'),
(0, 'edit room room 305 to room 104', 'room', '', 1, 1, '2024-04-06 16:10:51'),
(0, 'edit room room 306 to room 202', 'room', '', 1, 1, '2024-04-06 16:10:59'),
(0, 'edit room room 310 to room 203', 'room', '', 1, 1, '2024-04-06 16:11:06'),
(0, 'edit room room 311 to room 204', 'room', '', 1, 1, '2024-04-06 16:11:14'),
(0, 'edit room room 312 to room 301', 'room', '', 1, 1, '2024-04-06 16:11:24'),
(0, 'edit room room 313 to room 302', 'room', '', 1, 1, '2024-04-06 16:11:31'),
(0, 'edit room room 402 to room 401', 'room', '', 1, 1, '2024-04-06 16:11:42'),
(0, 'edit room room 403 to room 402', 'room', '', 1, 1, '2024-04-06 16:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(5) NOT NULL,
  `i_deviceID` varchar(50) NOT NULL,
  `i_model` varchar(50) NOT NULL,
  `i_category` varchar(50) NOT NULL,
  `i_brand` varchar(50) NOT NULL,
  `i_description` text NOT NULL,
  `i_type` varchar(50) NOT NULL,
  `item_rawstock` int(11) NOT NULL,
  `i_status` int(11) NOT NULL DEFAULT 1,
  `i_mr` varchar(50) NOT NULL,
  `i_price` decimal(10,2) NOT NULL,
  `i_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `i_deviceID`, `i_model`, `i_category`, `i_brand`, `i_description`, `i_type`, `item_rawstock`, `i_status`, `i_mr`, `i_price`, `i_photo`) VALUES
(16, 'AVR002', 'PowerGuard 5000', 'AVR', 'APC', 'Automatic Voltage Regulator', 'Non-consumable', 25, 1, 'Staff', 2500.00, '1712388420.png'),
(18, 'HD001', 'HighSpeed+', 'Cable', 'Belkin', 'High-Speed HDMI Cable', 'Non-consumable', 3, 1, 'Staff', 500.00, '1712388867.png'),
(20, '----', 'OM-130006A/K', 'Keyboard', 'Acer', 'Slim Compact Keyboard, Black USB Wired, 98 Keys', 'Consumable', 60, 1, 'Sir Cadagat', 250.00, '1487647678.png'),
(21, '----', 'OM-130006A/K', 'Keyboard', 'Acer', 'Slim Compact Keyboard, Black USB Wired, 98 Keys', 'Consumable', 60, 1, 'Sir Cadagat', 250.00, '1487647679.png'),
(23, '----', 'OM-130006A/K', 'Keyboard', 'Acer', 'Slim Compact Keyboard, Black USB Wired, 98 Keys', 'Consumable', 60, 1, 'Sir Cadagat', 250.00, '1487647681.png'),
(24, 'CT004', 'Nylon-50', 'Cable', '3M', 'Cable ties for organizing cables', 'Non-consumable', 60, 1, 'Staff', 250.00, '1712388996.png'),
(25, 'EC005', 'Cat6-10', 'Cable', 'D-Link', 'Ethernet Cable (Cat6)', 'Non-consumable', 10, 1, 'Staff', 300.00, '1712389057.png'),
(26, 'CH006', 'ErgoComfort', 'Chair', 'Herman Miller', 'Ergonomic Office Chair', 'Consumable', 5, 1, 'Staff', 8000.00, '1712389137.png'),
(27, 'DLP007', 'ViewSonic DLP', 'DLP Screen', 'ViewSonic', 'Digital Light Processing Screen', 'Non-consumable', 3, 1, 'Staff', 15000.00, '1712389229.png'),
(28, 'EXT008', 'PowerStrip-6', 'Extension', 'Belkin', '6-outlet Power Strip', 'Non-consumable', 5, 1, 'Staff', 700.00, '1712389470.png'),
(29, 'KB009', 'ErgoPro', 'Keyboard', 'Logitech', 'Ergonomic Keyboard', 'Non-consumable', 15, 1, 'Staff', 1200.00, '1712389646.png'),
(30, 'LT010', 'Inspiron 15', 'Laptop', 'Dell', '15-inch Laptop', 'Non-consumable', 8, 1, 'Staff', 30000.00, '1712389757.png'),
(31, 'MON011', 'Ultrasharp 27', 'Monitor', 'Dell', '27-inch Monitor', 'Non-consumable', 13, 1, 'Staff', 12000.00, '1712389924.png'),
(32, 'MS012', 'MX Master 3', 'Mouse', 'Logitech', 'Mouse', 'Non-consumable', 24, 1, 'Staff', 1999.00, '1712390001.png'),
(33, 'PR013', 'LaserJet Pro', 'Printer', 'Samsung', 'Laser Printer', 'Non-consumable', 4, 1, 'Staff', 8000.00, '1712390109.png'),
(34, 'PJ014', 'PowerLite 2250U', 'Projector', 'Epson', 'Multimedia Projector', 'Non-consumable', 7, 1, 'Staff', 50000.00, '1712390165.png'),
(35, '1', 'XYZ-123', 'Aircon', 'Panasonic', 'Split-type air conditioner', 'Non-consumable', 1, 1, 'Staff', 25000.00, '1712388288.png'),
(36, 'RM015', 'Universal Remote', 'Remote', 'Logitech', 'Universal Remote Control', 'Non-consumable', 10, 1, 'Staff', 1.00, '1712390408.png'),
(37, 'RT016', 'Nighthawk AC1900', 'Router', 'Netgear', 'Netgear', 'Non-consumable', 4, 1, 'Staff', 3.00, '1712390543.png'),
(38, 'SP017', 'SoundLink Revolve+', 'Speaker', 'Bose', 'Portable Bluetooth ', 'Non-consumable', 5, 1, 'Staff', 15500.00, '1712390628.png'),
(39, 'SU018', 'OptiPlex 7080', 'System Unit', 'Dell', 'Desktop Computer', 'Non-consumable', 10, 1, 'Staff', 4000.00, '1712390760.png'),
(40, 'TB019', 'Height Adjustable', 'Table', 'IKEA', 'Office Table', 'Non-consumable', 10, 1, 'Staff', 4000.00, '1712390827.png'),
(41, 'TV020', 'Bravia 4K HDR', 'TV', 'Sony', '55-inch Smart TV', 'Non-consumable', 1, 1, 'Staff', 40000.00, '1712390893.png'),
(42, 'UPS021', 'Back-UPS Pro 1500', 'UPS', 'APC', 'Uninterruptible Power Supply', 'Non-consumable', 6, 1, 'Staff', 12000.00, '1712390947.png');

-- --------------------------------------------------------

--
-- Table structure for table `item_inventory`
--

CREATE TABLE `item_inventory` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `inventory_itemstock` int(11) NOT NULL,
  `inventory_status` int(11) NOT NULL,
  `item_remarks` text NOT NULL,
  `date_change` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_inventory`
--

INSERT INTO `item_inventory` (`id`, `item_id`, `inventory_itemstock`, `inventory_status`, `item_remarks`, `date_change`) VALUES
(8, 16, 2, 2, '', '2017-02-17 06:13:59'),
(9, 16, 2, 2, 'test', '2017-02-17 06:16:07'),
(10, 16, 1, 2, 'asd', '2024-04-06 02:02:40'),
(11, 16, 2, 2, 's', '2024-04-06 02:05:04'),
(12, 16, 2, 2, 'q', '2024-04-06 02:05:34'),
(13, 16, 1, 2, 'a', '2024-04-06 02:06:01'),
(14, 16, 6, 2, 'w', '2024-04-06 02:06:17'),
(15, 26, 4, 2, 'qw', '2024-04-06 02:06:43'),
(16, 16, 4, 2, 'r', '2024-04-06 02:09:17'),
(17, 16, 1, 2, 'a', '2024-04-06 07:18:57'),
(18, 27, 1, 2, 'a', '2024-04-06 07:25:27'),
(19, 16, 1, 3, 'q', '2024-04-06 07:27:34'),
(20, 16, 2, 2, 'lost', '2024-04-06 07:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `items_stock` int(11) NOT NULL,
  `item_status` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_stock`
--

INSERT INTO `item_stock` (`id`, `item_id`, `room_id`, `items_stock`, `item_status`, `status`) VALUES
(18, 16, 14, 5, 1, 1),
(21, 18, 14, 2, 1, 1),
(22, 24, 14, 58, 1, 1),
(23, 25, 14, 10, 1, 1),
(24, 26, 14, 1, 1, 1),
(25, 26, 14, 4, 2, 1),
(26, 27, 14, 2, 1, 1),
(27, 28, 14, 5, 1, 1),
(28, 29, 14, 15, 1, 1),
(29, 30, 14, 8, 1, 1),
(30, 31, 14, 13, 1, 1),
(31, 32, 14, 24, 1, 1),
(32, 33, 14, 4, 1, 1),
(33, 34, 14, 5, 1, 1),
(34, 35, 14, 0, 1, 1),
(35, 27, 14, 1, 2, 1),
(36, 16, 14, 2, 2, 1),
(37, 36, 14, 8, 1, 1),
(38, 37, 14, 3, 1, 1),
(39, 38, 14, 5, 1, 1),
(40, 39, 14, 9, 1, 1),
(41, 40, 14, 9, 1, 1),
(42, 41, 14, 1, 1, 1),
(43, 42, 14, 6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_transfer`
--

CREATE TABLE `item_transfer` (
  `id` int(11) NOT NULL,
  `t_itemID` int(11) NOT NULL,
  `t_roomID` int(11) NOT NULL,
  `t_stockID` int(11) NOT NULL,
  `t_quantity` int(11) NOT NULL,
  `date_transfer` timestamp NOT NULL DEFAULT current_timestamp(),
  `t_status` int(11) NOT NULL DEFAULT 1,
  `personincharge` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `m_school_id` int(11) NOT NULL,
  `m_fname` varchar(50) NOT NULL,
  `m_lname` varchar(50) NOT NULL,
  `m_gender` varchar(10) NOT NULL,
  `m_contact` varchar(15) NOT NULL,
  `m_department` varchar(50) NOT NULL,
  `m_year_section` varchar(20) NOT NULL,
  `m_type` varchar(50) NOT NULL,
  `m_password` varchar(50) NOT NULL,
  `m_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `m_school_id`, `m_fname`, `m_lname`, `m_gender`, `m_contact`, `m_department`, `m_year_section`, `m_type`, `m_password`, `m_status`) VALUES
(14, 14300001, 'Student1', 'BA', 'Male', '09912345678', 'BA', '1st - A', 'Student', '', 1),
(15, 14300002, 'Student2', 'BEED', 'Female', '09912345678', 'BEED', '2nd - A', 'Student', '', 1),
(16, 14300003, 'Student3', 'BSED', 'Male', '09912345678', 'BSED', '3rd - B', 'Student', '', 1),
(17, 14300004, 'Student4', 'BSCS', 'Male', '09912345678', 'BSCS', '2nd - D', 'Student', '', 1),
(18, 14300005, 'Student5', 'ACT', 'Male', '09912345678', 'ACT', '2nd - C', 'Student', '', 1),
(19, 14300006, 'Student6', 'BCRIM', 'Male', '09912345678', 'BCRIM', '2nd - E', 'Student', '', 1),
(20, 14300007, 'Student7', 'BACOMM', 'Female', '09912345678', 'BACOMM', '1st - B', 'Student', '', 1),
(21, 24300001, 'Teacher1', 'CBA', 'Female', '09912345678', 'CBA', '', 'Faculty', '', 1),
(22, 24300002, 'Teacher2', 'CTE', 'Male', '09912345678', 'CTE', '', 'Faculty', '', 1),
(23, 24300003, 'Teacher3', 'CCS', 'Male', '09912345678', 'CCS', '', 'Faculty', '', 1),
(24, 24300004, 'Teacher4', 'CCA', 'Male', '09912345678', 'CCA', '', 'Faculty', '', 1),
(25, 24300005, 'Teacher4', 'CCJE', 'Male', '09912345678', 'CCJE', '', 'Faculty', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `rm_name` varchar(50) NOT NULL,
  `rm_date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `rm_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `rm_name`, `rm_date_added`, `rm_status`) VALUES
(1, 'room 301', '2016-11-16 21:21:42', 1),
(2, 'room 402', '2016-11-16 21:21:47', 1),
(3, 'room 204', '2016-11-16 21:21:53', 1),
(4, 'room 302', '2016-11-17 18:45:03', 1),
(5, 'room 401', '2016-11-17 20:51:30', 1),
(6, 'room 101', '2016-11-17 20:51:43', 1),
(7, 'room 102', '2016-11-17 20:51:54', 1),
(8, 'room 103', '2016-11-17 20:52:04', 1),
(9, 'room 201', '2016-11-17 20:52:20', 1),
(10, 'room 104', '2016-11-17 20:52:56', 1),
(11, 'room 202', '2016-11-17 20:53:20', 1),
(14, 'room 203', '2017-01-08 13:17:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_equipment`
--

CREATE TABLE `room_equipment` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `re_quantity` int(11) NOT NULL,
  `stats` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room_equipment`
--

INSERT INTO `room_equipment` (`id`, `equipment_id`, `room_id`, `re_quantity`, `stats`) VALUES
(1, 1, 14, 12, 1),
(2, 2, 14, 12, 1),
(3, 3, 14, 12, 1),
(4, 4, 14, 12, 1),
(5, 5, 14, 12, 1),
(6, 6, 14, 12, 1),
(7, 7, 14, 12, 1),
(8, 8, 14, 12, 1),
(9, 1, 14, 10, 1),
(10, 2, 14, 10, 1),
(11, 1, 14, 12, 1),
(12, 2, 14, 12, 1),
(13, 3, 14, 2, 1),
(14, 1, 14, 12, 1),
(15, 2, 14, 10, 1),
(16, 3, 14, 10, 1),
(17, 1, 14, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=admin, 2=stafff',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=active, 2=inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `type`, `status`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1, 1),
(6, 'Administrator 2', 'admin2', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `equipment_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `equipment_inventory`
--
ALTER TABLE `equipment_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_inventory`
--
ALTER TABLE `item_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_transfer`
--
ALTER TABLE `item_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_equipment`
--
ALTER TABLE `room_equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment_inventory`
--
ALTER TABLE `equipment_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `item_inventory`
--
ALTER TABLE `item_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `item_transfer`
--
ALTER TABLE `item_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `room_equipment`
--
ALTER TABLE `room_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
