-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 12:15 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whytewaters_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `page_meta_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`id`, `page_meta_data_id`) VALUES
(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 48);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `date_posted` datetime DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `date_posted`, `page_meta_data_id`) VALUES
(1, '2017-08-01 00:00:00', 20),
(2, '2017-10-06 00:00:00', 21),
(3, '2017-10-06 00:00:00', 22),
(4, '2017-10-07 00:00:00', 23),
(5, '2016-12-16 00:00:00', 24),
(6, '2017-10-06 00:00:00', 25),
(7, '2017-10-03 00:00:00', 32),
(8, '2017-06-14 00:00:00', 49),
(9, NULL, 59),
(10, '2017-12-06 00:00:00', 61);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_has_category`
--

CREATE TABLE `blog_post_has_category` (
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post_has_category`
--

INSERT INTO `blog_post_has_category` (`category_id`, `post_id`) VALUES
(1, 1),
(3, 1),
(2, 2),
(3, 2),
(2, 3),
(4, 3),
(1, 4),
(4, 4),
(1, 6),
(2, 6),
(1, 7),
(1, 8),
(2, 8),
(5, 8),
(2, 10),
(3, 5),
(4, 5),
(1, 5),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone_number` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `message` text,
  `tour_datetime` datetime NOT NULL,
  `promo_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tour_subtotal` double(10,2) DEFAULT NULL,
  `tour_total` double(10,2) DEFAULT NULL,
  `rtbs_payment_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rtbs_booking_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rtbs_booking_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `booking_date` datetime NOT NULL,
  `booking_status` varchar(255) CHARACTER SET utf8 NOT NULL,
  `booking_expiry` datetime NOT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `first_name`, `last_name`, `email_address`, `phone_number`, `message`, `tour_datetime`, `promo_code`, `tour_subtotal`, `tour_total`, `rtbs_payment_url`, `rtbs_booking_token`, `rtbs_booking_id`, `booking_date`, `booking_status`, `booking_expiry`, `ip_address`, `tour_id`) VALUES
(1, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'TEST Booking', '2017-11-10 09:00:00', 'PROMO5', 653.00, 578.00, 'https://dev.rtbstraining.com/api/booking/R6ISDEQrB9ZaTCyAayfSFA.3UhdcMeu/payment?apikey=ovrnpblu39', 'R6ISDEQrB9ZaTCyAayfSFA.3UhdcMeu', 'CKYBTJ', '2017-11-01 23:12:33', 'UNCONFIRMED', '2017-11-11 09:00:00', '114.23.241.67', 1),
(2, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'TEST', '2017-11-04 09:00:00', 'PROMO2', 1306.00, 1206.00, 'https://dev.rtbstraining.com/api/booking/VNN58Y73-0X6fTzB-7ivjw.PVdTGaoI/payment?apikey=ovrnpblu39', 'VNN58Y73-0X6fTzB-7ivjw.PVdTGaoI', 'C7F3UK', '2017-11-01 23:13:55', 'UNCONFIRMED', '2017-11-05 09:00:00', '114.23.241.67', 1),
(3, 'Alan', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Tomahawk Testing', '2017-11-03 09:00:00', '', 2904.00, 2904.00, 'https://dev.rtbstraining.com/api/booking/vSi9D7JkAigFztH5XIjyQg.1f1beNc-/payment?apikey=ovrnpblu39', 'vSi9D7JkAigFztH5XIjyQg.1f1beNc-', 'DQ3A6M', '2017-11-01 23:32:22', 'UNCONFIRMED', '2017-11-04 09:00:00', '114.23.241.67', 1),
(4, 'Arnold', 'Schwarzenegger', 'alan@tomahawk.co.nz', '0211111111', 'Tomahawk Testing', '2017-11-04 14:00:00', '', 2515.00, 2515.00, 'https://dev.rtbstraining.com/api/booking/3_imcUrN7OmyTe-uid-K-A.QcwzL5FT/payment?apikey=ovrnpblu39', '3_imcUrN7OmyTe-uid-K-A.QcwzL5FT', 'YVNQ8E', '2017-11-01 23:48:23', 'UNCONFIRMED', '2017-11-05 14:00:00', '114.23.241.67', 1),
(5, 'Kirsten', 'Whittington', 'kirsten@tomahawk.co.nz', '0211234567', 'TEST', '2017-11-04 09:00:00', '', 264.00, 264.00, 'https://dev.rtbstraining.com/api/booking/C9jXB2OKgCBXTqygknaSvQ.s81ME_xG/payment?apikey=ovrnpblu39', 'C9jXB2OKgCBXTqygknaSvQ.s81ME_xG', 'JZ8F4X', '2017-11-02 00:00:41', 'UNCONFIRMED', '2017-11-05 09:00:00', '114.23.241.67', 1),
(6, 'Emma', 'Test', 'emma@tomahawk.co.nz', '0272124919', 'Test', '2017-11-03 14:00:00', 'PROMO1', 2487.00, 1989.60, 'https://dev.rtbstraining.com/api/booking/xFZS5HkFY3YnjmusP_uCgw.jiceozPX/payment?apikey=ovrnpblu39', 'xFZS5HkFY3YnjmusP_uCgw.jiceozPX', 'U3DZBJ', '2017-11-02 00:02:35', 'UNCONFIRMED', '2017-11-04 14:00:00', '114.23.241.67', 1),
(7, 'Kirsten', 'Whittington', 'kirsten@tomahawk.co.nz', '0211234566', 'TEST', '2017-11-18 09:00:00', 'PROMO2', 3960.00, 3660.00, 'https://dev.rtbstraining.com/api/booking/y3JvVluvcjkNU4uqzwuO-g.zU63cW_M/payment?apikey=ovrnpblu39', 'y3JvVluvcjkNU4uqzwuO-g.zU63cW_M', 'CRX7EZ', '2017-11-02 00:11:48', 'UNCONFIRMED', '2017-11-19 09:00:00', '114.23.241.67', 1),
(8, 'Emma', 'Test', 'emma@tomahawk.co.nz', '0288783897483', 'Test', '2017-11-20 14:00:00', 'PROMO3', 389.00, 379.00, 'https://dev.rtbstraining.com/api/booking/JN3FDVmJL_ZHCHWZ3F9reA.JKRgGerm/payment?apikey=ovrnpblu39', 'JN3FDVmJL_ZHCHWZ3F9reA.JKRgGerm', 'K7864P', '2017-11-02 00:14:22', 'UNCONFIRMED', '2017-11-21 14:00:00', '114.23.241.67', 1),
(9, 'Kirsten', 'Whittington', 'kirsten@tomahawk.co.nz', '0211234567', 'TEST', '2017-11-18 09:00:00', 'PROMO4', 2626.00, 2475.88, 'https://dev.rtbstraining.com/api/booking/SEofkty0zVyTHaYP6TeFZg.j5fDPAV8/payment?apikey=ovrnpblu39', 'SEofkty0zVyTHaYP6TeFZg.j5fDPAV8', 'UJS7W4', '2017-11-02 00:16:35', 'UNCONFIRMED', '2017-11-19 09:00:00', '114.23.241.67', 1),
(10, 'Emma', 'Test', 'emma@tomahawk.co.nz', '027675656897', 'Test', '2017-11-20 14:00:00', 'PROMO5', 1834.00, 1634.00, 'https://dev.rtbstraining.com/api/booking/05jxIIWEjR3Ry9bxxfaCzw._-ZquJGV/payment?apikey=ovrnpblu39', '05jxIIWEjR3Ry9bxxfaCzw._-ZquJGV', 'MA9H4S', '2017-11-02 00:16:48', 'UNCONFIRMED', '2017-11-21 14:00:00', '114.23.241.67', 1),
(11, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing Chrome', '2018-03-01 09:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/SNCL3TCat8QEp7m1CBCJpg.Tu1QzhP7/payment?apikey=ovrnpblu39', 'SNCL3TCat8QEp7m1CBCJpg.Tu1QzhP7', '58Q4VT', '2017-11-03 02:39:46', 'UNCONFIRMED', '2018-03-02 09:00:00', '114.23.241.67', 1),
(12, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing Firefox', '2017-11-13 09:00:00', 'Promo1', 2640.00, 2112.00, 'https://dev.rtbstraining.com/api/booking/pGIGID_AvR6F0sLpt3n64A.Sf6DUAjd/payment?apikey=ovrnpblu39', 'pGIGID_AvR6F0sLpt3n64A.Sf6DUAjd', 'CV4Q5X', '2017-11-03 03:09:51', 'UNCONFIRMED', '2017-11-14 09:00:00', '114.23.241.67', 1),
(13, 'PINAL', 'DESAI', 'PINAL@TOMAHAWK.CO.NZ', '0273988446', '', '2017-11-04 14:00:00', '', 5560.00, 5560.00, 'https://dev.rtbstraining.com/api/booking/9lsVb5Xd1Vf29yGF-y7LTQ.Tth-8ui0/payment?apikey=ovrnpblu39', '9lsVb5Xd1Vf29yGF-y7LTQ.Tth-8ui0', 'HBMXNQ', '2017-11-03 03:15:20', 'UNCONFIRMED', '2017-11-05 14:00:00', '114.23.241.67', 1),
(14, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing IE9', '2017-11-14 09:00:00', 'promo2', 2640.00, 2440.00, 'https://dev.rtbstraining.com/api/booking/PhC1Upgm52orwfQSJdtbcw.4KbP2vBz/payment?apikey=ovrnpblu39', 'PhC1Upgm52orwfQSJdtbcw.4KbP2vBz', '6C3TG5', '2017-11-03 03:22:14', 'UNCONFIRMED', '2017-11-15 09:00:00', '114.23.241.67', 1),
(15, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing Edge', '2017-11-16 09:00:00', 'Promo5', 2640.00, 2390.00, 'https://dev.rtbstraining.com/api/booking/HSgtddpPEGtxsl2YmErAmA.dA_HAHFk/payment?apikey=ovrnpblu39', 'HSgtddpPEGtxsl2YmErAmA.dA_HAHFk', 'SXWT5J', '2017-11-03 03:31:38', 'UNCONFIRMED', '2017-11-17 09:00:00', '114.23.241.67', 1),
(16, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing Safari', '2017-11-16 14:00:00', 'promo4', 2640.00, 2473.20, 'https://dev.rtbstraining.com/api/booking/3F8F8M3sNICRvgCgExj0Fw.mKm-ZQGJ/payment?apikey=ovrnpblu39', '3F8F8M3sNICRvgCgExj0Fw.mKm-ZQGJ', '6324YJ', '2017-11-03 03:40:28', 'UNCONFIRMED', '2017-11-17 14:00:00', '114.23.241.67', 1),
(17, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing Android', '2017-11-14 14:00:00', 'promo2', 2640.00, 2440.00, 'https://dev.rtbstraining.com/api/booking/_PePYg3FaAurA9zH4edjNQ.4vI-XzZh/payment?apikey=ovrnpblu39', '_PePYg3FaAurA9zH4edjNQ.4vI-XzZh', 'F8TC7K', '2017-11-03 03:48:24', 'UNCONFIRMED', '2017-11-15 14:00:00', '114.23.241.67', 1),
(18, 'Test', 'Test', 'Alan@tomahawk.co.nz', '0211111111', 'Testing ipad', '2017-11-13 14:00:00', 'Promo1', 2640.00, 2112.00, 'https://dev.rtbstraining.com/api/booking/Ts7pf3hHErLUvBQnNYBaKQ.RVbwAgw2/payment?apikey=ovrnpblu39', 'Ts7pf3hHErLUvBQnNYBaKQ.RVbwAgw2', 'NFZ5RH', '2017-11-03 04:04:27', 'UNCONFIRMED', '2017-11-14 14:00:00', '114.23.241.67', 1),
(19, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', '', '2017-11-12 09:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/-kR_IGRCx4heitLEs3-rzg.CuV3irml/payment?apikey=ovrnpblu39', '-kR_IGRCx4heitLEs3-rzg.CuV3irml', 'U9D5WZ', '2017-11-05 20:50:06', 'UNCONFIRMED', '2017-11-13 09:00:00', '114.23.241.67', 1),
(20, 'Pinal', 'Desai', 'Pinal@tomahawk.co.nz', '0273988446', 'Test', '2017-11-10 09:00:00', '', 278.00, 278.00, 'https://dev.rtbstraining.com/api/booking/nmT-J3NRZo6Llx4wqSrt7A.WPCgWIrj/payment?apikey=ovrnpblu39', 'nmT-J3NRZo6Llx4wqSrt7A.WPCgWIrj', 'H6UZC8', '2017-11-05 22:01:42', 'UNCONFIRMED', '2017-11-11 09:00:00', '114.23.241.67', 1),
(21, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing IE9', '2017-11-12 14:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/-NIGQ-iaAIyG0Dx6gqixcQ.vMzL8CSv/payment?apikey=ovrnpblu39', '-NIGQ-iaAIyG0Dx6gqixcQ.vMzL8CSv', 'CNB9HF', '2017-11-05 22:24:32', 'UNCONFIRMED', '2017-11-13 14:00:00', '114.23.241.67', 1),
(22, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing IE9', '2017-11-26 09:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/zIOgOzblEQ-YvUmU0qBOVQ.mLGigzvA/payment?apikey=ovrnpblu39', 'zIOgOzblEQ-YvUmU0qBOVQ.mLGigzvA', 'FC8NWK', '2017-11-05 22:26:10', 'UNCONFIRMED', '2017-11-27 09:00:00', '114.23.241.67', 1),
(23, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing CHROME', '2017-12-01 09:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/cj7cXDOPLkfdRz4RE5Z3sQ.QGviqXbv/payment?apikey=ovrnpblu39', 'cj7cXDOPLkfdRz4RE5Z3sQ.QGviqXbv', 'JD9BUW', '2017-11-05 22:31:10', 'UNCONFIRMED', '2017-12-02 09:00:00', '114.23.241.67', 1),
(24, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing CHROME', '2017-12-01 09:00:00', '', 2640.00, 2640.00, 'https://dev.rtbstraining.com/api/booking/TSP2mAOr-cg9q9EyLoftig.3MK66O3N/payment?apikey=ovrnpblu39', 'TSP2mAOr-cg9q9EyLoftig.3MK66O3N', 'VBZSNH', '2017-11-05 22:31:43', 'UNCONFIRMED', '2017-12-02 09:00:00', '114.23.241.67', 1),
(25, 'Test', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Testing family Floats Chrome', '2017-11-11 10:30:00', '', 1740.00, 1740.00, 'https://dev.rtbstraining.com/api/booking/0CAxJuoSbMmTcsNVYoWWWA.v0G5h4fV/payment?apikey=ovrnpblu39', '0CAxJuoSbMmTcsNVYoWWWA.v0G5h4fV', 'PDZ3M2', '2017-11-05 23:26:52', 'UNCONFIRMED', '2017-11-12 10:30:00', '114.23.241.67', 2),
(26, 'Geri', 'Test', 'geri@tomahawk.co.nz', '0277549471', '', '2017-11-23 14:00:00', 'save40', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/NOpCsWVeF_Z2_vKPob7lKw.pXzyiK-M/payment?apikey=ovrnpblu39', 'NOpCsWVeF_Z2_vKPob7lKw.pXzyiK-M', '53RC8M', '2017-11-22 00:47:31', 'UNCONFIRMED', '2017-11-24 14:00:00', '222.154.225.157', 1),
(27, 'Geri', 'Fallon', 'geri@tomahawk.co.nz', '0277549471', '', '2017-11-28 14:00:00', 'Richard', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/KlwVqvb6H69t9P03kiic7g.1XEyNbux/payment?apikey=ovrnpblu39', 'KlwVqvb6H69t9P03kiic7g.1XEyNbux', 'ZE93U6', '2017-11-27 03:45:49', 'UNCONFIRMED', '2017-11-29 14:00:00', '118.149.64.156', 1),
(28, 'Geri', 'Fallon', 'geri@tomahawk.co.nz', '0277549471', '', '2017-12-01 14:00:00', '', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/oxhBjPpaQNKoI31omHGzpg.LSVift4U/payment?apikey=ovrnpblu39', 'oxhBjPpaQNKoI31omHGzpg.LSVift4U', '7UCBV3', '2017-11-28 00:43:38', 'UNCONFIRMED', '2017-12-02 14:00:00', '202.50.121.242', 1),
(29, 'Geri', 'Fallon', 'geri@tomahawk.co.nz', '0277549471', 'lksdjfslkjg', '2017-12-09 14:00:00', '', 389.00, 389.00, 'https://dev.rtbstraining.com/api/booking/y8-pGfy3LcsXloHMM1qhow.5kDbpqa8/payment?apikey=ovrnpblu39', 'y8-pGfy3LcsXloHMM1qhow.5kDbpqa8', 'AHEUR8', '2017-12-07 02:23:45', 'UNCONFIRMED', '2017-12-10 14:00:00', '114.23.241.67', 1),
(30, 'test', 'test', 'courtney@tomahawk.co.nz', '0273092288', 'test', '2017-12-08 14:00:00', '', 528.00, 528.00, 'https://dev.rtbstraining.com/api/booking/FUf2x0Q-IYvHBi_zUwGiqw.ZIChv59u/payment?apikey=ovrnpblu39', 'FUf2x0Q-IYvHBi_zUwGiqw.ZIChv59u', '7SRZGX', '2017-12-07 22:53:44', 'UNCONFIRMED', '2017-12-09 14:00:00', '114.23.241.67', 1),
(31, 'test', 'test', 'test@test.com', '4579003534345', '', '2017-12-11 14:00:00', '', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/3JIpa7uNtiN2fWQLVRyj7g.geMYPIC1/payment?apikey=ovrnpblu39', '3JIpa7uNtiN2fWQLVRyj7g.geMYPIC1', '7RWZSE', '2017-12-10 20:42:06', 'UNCONFIRMED', '2017-12-12 14:00:00', '114.23.241.67', 1),
(32, 'werwe', 'ewrwe', 'werwe@fsdf.com', '02996621322', 'rweewr', '2017-12-22 09:00:00', '', 931.00, 931.00, 'https://dev.rtbstraining.com/api/booking/BcLapxyzwyPsqByyIyLflA.V5FchhUv/payment?apikey=ovrnpblu39', 'BcLapxyzwyPsqByyIyLflA.V5FchhUv', 'R8TM5F', '2017-12-10 22:51:42', 'UNCONFIRMED', '2017-12-23 09:00:00', '114.23.241.67', 1),
(33, 'test', 'test', 'test@test.com', '01212312323', 'test - please ignore', '2017-12-14 09:00:00', '', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/kBTTxys7D3kG881P1t2fjw.QSwvJaAE/payment?apikey=ovrnpblu39', 'kBTTxys7D3kG881P1t2fjw.QSwvJaAE', 'TVUXW6', '2017-12-13 01:21:23', 'UNCONFIRMED', '2017-12-15 09:00:00', '114.23.241.67', 1),
(34, 'adf', 'asdf', 'ian@tomahawk.co.nz', '0202020202', 'test', '2018-02-20 14:00:00', 'PROMO3', 139.00, 139.00, 'https://dev.rtbstraining.com/api/booking/MI4H7iMd-pMnJBKpMB2ZGg.KHSia32E/payment?apikey=ovrnpblu39', 'MI4H7iMd-pMnJBKpMB2ZGg.KHSia32E', 'WRFDYC', '2018-02-19 03:21:49', 'UNCONFIRMED', '2018-02-21 14:00:00', '114.23.241.67', 1),
(35, 'Chrome', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'tomahawk testing. please ignore', '2018-04-01 00:00:00', 'PROMO1', 734.00, 734.00, 'https://dev.rtbstraining.com/api/booking/IEJH28NjifovN6yMR9no6Q.d9fNUTyk/payment?apikey=ovrnpblu39', 'IEJH28NjifovN6yMR9no6Q.d9fNUTyk', 'DWZUBN', '2018-02-21 02:32:21', 'UNCONFIRMED', '2018-04-02 00:00:00', '114.23.241.67', 6),
(36, 'Edge', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'tomahawk testing. please ignore.', '2018-04-01 00:00:00', 'PROMO3', 2040.00, 2040.00, 'https://dev.rtbstraining.com/api/booking/DNORgg0d5PGcB_UbBlaClg.vitBuCX-/payment?apikey=ovrnpblu39', 'DNORgg0d5PGcB_UbBlaClg.vitBuCX-', '4X6TBY', '2018-02-21 02:40:44', 'UNCONFIRMED', '2018-04-02 00:00:00', '114.23.241.67', 6),
(37, 'IE', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'tomahawk testing. Please ignore.', '2018-04-02 00:00:00', 'PROMO2', 1600.00, 1600.00, 'https://dev.rtbstraining.com/api/booking/Nu07nx-cegHRoUDnlsG5ng.2bYb-BPh/payment?apikey=ovrnpblu39', 'Nu07nx-cegHRoUDnlsG5ng.2bYb-BPh', 'YRFPWA', '2018-02-21 02:45:37', 'UNCONFIRMED', '2018-04-03 00:00:00', '114.23.241.67', 6),
(38, 'IE', 'Test', 'alan@tomahawk.co.nz', '02111111111', 'tomahawk testing. please ignore', '2018-04-03 00:00:00', 'MBike', 1700.00, 1700.00, 'https://dev.rtbstraining.com/api/booking/bd9-SLHAgrxiUS4UNg97-Q.txkYFhWs/payment?apikey=ovrnpblu39', 'bd9-SLHAgrxiUS4UNg97-Q.txkYFhWs', 'STJRBD', '2018-02-21 02:55:37', 'UNCONFIRMED', '2018-04-04 00:00:00', '114.23.241.67', 6),
(39, 'Safari', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Tomahawk testing. Please ignore', '2018-04-03 00:00:00', 'PROMO1', 1700.00, 1700.00, 'https://dev.rtbstraining.com/api/booking/f7hzCWd_UEmKB841LUmifQ.yeKEnWWt/payment?apikey=ovrnpblu39', 'f7hzCWd_UEmKB841LUmifQ.yeKEnWWt', 'NJGVRQ', '2018-02-21 03:12:25', 'UNCONFIRMED', '2018-04-04 00:00:00', '114.23.241.67', 6),
(40, 'Ipad', 'Test', 'Alan@tomahawk.co.nz', '0211111111', 'Tomahawk testing. Please ignore', '2018-04-06 00:00:00', 'Promo1', 1700.00, 1700.00, 'https://dev.rtbstraining.com/api/booking/Komfmh4lJwZHRTedJOh9NQ.OPTkZkw5/payment?apikey=ovrnpblu39', 'Komfmh4lJwZHRTedJOh9NQ.OPTkZkw5', 'ZFJM2B', '2018-02-21 03:18:59', 'UNCONFIRMED', '2018-04-07 00:00:00', '114.23.241.67', 6),
(41, 'Android', 'test', 'alan@tomahawk.co.nz', '0211111111', 'tomahawk testing. please ignore', '2018-04-07 00:00:00', 'PROMO1', 1700.00, 1700.00, 'https://dev.rtbstraining.com/api/booking/vyWCRYpkQRWV3bPYbuXX7A.ydWEy6RL/payment?apikey=ovrnpblu39', 'vyWCRYpkQRWV3bPYbuXX7A.ydWEy6RL', 'Z46EK5', '2018-02-21 03:24:11', 'UNCONFIRMED', '2018-04-08 00:00:00', '114.23.241.67', 6),
(42, 'IE', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Tomahawk testing. Please ignore.', '2018-04-12 00:00:00', 'PROMO1', 1700.00, 1700.00, 'https://dev.rtbstraining.com/api/booking/VpJvS31dHZD17K6byF1XcQ.8-xbpPtj/payment?apikey=ovrnpblu39', 'VpJvS31dHZD17K6byF1XcQ.8-xbpPtj', 'ZJNUR5', '2018-02-21 23:33:22', 'UNCONFIRMED', '2018-04-13 00:00:00', '114.23.241.67', 6),
(43, 'Chrome', 'Test', 'alan@tomahawk.co.nz', '0211111111', 'Tomahawk testing. Please ignore.', '2018-04-13 00:00:00', 'PROMO1', 550.00, 550.00, 'https://dev.rtbstraining.com/api/booking/AJuRShmgYJVFSLi3ALj1fQ.apwhPUSb/payment?apikey=ovrnpblu39', 'AJuRShmgYJVFSLi3ALj1fQ.apwhPUSb', 'WH6CKZ', '2018-02-21 23:36:25', 'UNCONFIRMED', '2018-04-14 00:00:00', '114.23.241.67', 6);

-- --------------------------------------------------------

--
-- Table structure for table `booking_accounts`
--

CREATE TABLE `booking_accounts` (
  `id` int(11) NOT NULL,
  `api_request_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `api_access_key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `api_supplier_key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_live` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_accounts`
--

INSERT INTO `booking_accounts` (`id`, `api_request_url`, `api_access_key`, `api_supplier_key`, `is_live`) VALUES
(1, 'https://dev.rtbstraining.com', 'ovrnpblu39', 'vfhck0o4fc', 'N'),
(2, 'https://dev.rtbstraining.com', 'kzsgytowxp', 'vfhck0o4fc', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `booking_has_tours`
--

CREATE TABLE `booking_has_tours` (
  `booking_id` int(11) DEFAULT NULL,
  `tour_rate` float DEFAULT NULL,
  `tour_rate_key` varchar(10) DEFAULT NULL,
  `tour_pax_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_has_tours`
--

INSERT INTO `booking_has_tours` (`booking_id`, `tour_rate`, `tour_rate_key`, `tour_pax_qty`) VALUES
(35, 170, '16960', 1),
(35, 129, '16961', 1),
(35, 80, '15060', 1),
(35, 35, '16956', 1),
(35, 25, '16955', 1),
(35, 90, '16958', 1),
(35, 150, '16959', 1),
(35, 55, '15062', 1),
(36, 170, '16960', 12),
(37, 80, '15060', 20),
(38, 170, '16960', 10),
(39, 170, '16960', 10),
(40, 170, '16960', 10),
(41, 170, '16960', 10),
(42, 170, '16960', 10),
(43, 55, '15062', 10);

-- --------------------------------------------------------

--
-- Table structure for table `cms_accessgroups`
--

CREATE TABLE `cms_accessgroups` (
  `access_id` int(11) NOT NULL,
  `access_name` varchar(100) NOT NULL,
  `access_users` char(1) NOT NULL DEFAULT 'N',
  `access_userpasswords` char(1) NOT NULL DEFAULT 'N',
  `access_useraccesslevel` char(1) NOT NULL DEFAULT 'N',
  `access_accessgroups` char(1) NOT NULL DEFAULT 'N',
  `access_cmssettings` char(1) NOT NULL DEFAULT 'N',
  `access_settings` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_accessgroups`
--

INSERT INTO `cms_accessgroups` (`access_id`, `access_name`, `access_users`, `access_userpasswords`, `access_useraccesslevel`, `access_accessgroups`, `access_cmssettings`, `access_settings`) VALUES
(1, 'Super Administrator', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'General Editor', 'Y', 'Y', 'N', 'N', 'N', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `cms_blacklist_user`
--

CREATE TABLE `cms_blacklist_user` (
  `id` int(11) NOT NULL,
  `first_failed_attempt_on` datetime DEFAULT NULL,
  `failed_login_attempt_count` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `disabled_on` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `recent_login_attempt_on` datetime DEFAULT NULL,
  `failed_hour_count` int(11) NOT NULL,
  `total_failed_attempt` int(11) NOT NULL,
  `is_notified` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_blacklist_user`
--

INSERT INTO `cms_blacklist_user` (`id`, `first_failed_attempt_on`, `failed_login_attempt_count`, `date_updated`, `is_disabled`, `disabled_on`, `username`, `recent_login_attempt_on`, `failed_hour_count`, `total_failed_attempt`, `is_notified`, `ip_address`) VALUES
(14, '2017-12-19 20:47:42', 1, '2017-12-19 20:47:42', 0, NULL, 'info', '2017-12-19 20:47:42', 0, 1, 0, '103.242.24.104'),
(16, '2017-12-19 21:26:43', 1, '2017-12-19 21:26:43', 0, NULL, 'info@tr.co.nz', '2017-12-19 21:26:43', 0, 1, 0, '103.242.24.104');

-- --------------------------------------------------------

--
-- Table structure for table `cms_login_attempt`
--

CREATE TABLE `cms_login_attempt` (
  `id` int(11) NOT NULL,
  `username` tinyblob NOT NULL,
  `access_key` tinyblob,
  `is_successful` enum('N','Y') NOT NULL DEFAULT 'N',
  `ip_address` varchar(255) NOT NULL,
  `record_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_login_attempt`
--

INSERT INTO `cms_login_attempt` (`id`, `username`, `access_key`, `is_successful`, `ip_address`, `record_date`) VALUES
(1, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-01 22:23:52'),
(2, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-01 22:24:02'),
(3, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-01 23:33:09'),
(4, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-02 02:21:00'),
(5, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-02 02:32:28'),
(6, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-02 20:55:57'),
(7, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-03 00:07:19'),
(8, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-05 19:53:56'),
(9, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-05 20:24:53'),
(10, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-05 22:10:14'),
(11, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-05 22:19:50'),
(12, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '122.57.179.207', '2017-11-11 09:25:39'),
(13, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '121.75.130.191', '2017-11-12 22:39:18'),
(14, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '121.75.130.191', '2017-11-12 22:39:33'),
(15, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-12 23:06:52'),
(16, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-12 23:06:57'),
(17, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-12 23:23:40'),
(18, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-13 02:56:15'),
(19, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-13 02:57:52'),
(20, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-19 22:02:08'),
(21, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-20 01:02:45'),
(22, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xa3676ce5f118b36011f035d178829a3a, 'N', '114.23.241.67', '2017-11-21 01:36:42'),
(23, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-21 01:39:24'),
(24, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-21 01:40:15'),
(25, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x5b6ede448fdc12d64085093549fc51cf, 'N', '114.23.241.67', '2017-11-21 01:41:08'),
(26, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x5b6ede448fdc12d64085093549fc51cf, 'N', '114.23.241.67', '2017-11-21 01:41:20'),
(27, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x5b6ede448fdc12d64085093549fc51cf, 'N', '114.23.241.67', '2017-11-21 01:41:39'),
(28, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-21 01:42:32'),
(29, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x9f34fcccc852a205d64b4b128cbbc5de, 'N', '121.75.130.191', '2017-11-22 03:40:48'),
(30, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '121.75.130.191', '2017-11-22 03:42:05'),
(31, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-22 19:46:11'),
(32, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '222.154.225.157', '2017-11-22 21:47:20'),
(33, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-11-26 20:53:38'),
(34, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-27 01:22:08'),
(35, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-11-27 19:49:20'),
(36, 0x33680c7682d7f8ec7958cf7946c22133, 0x6c2ccfae48fb93de7aba70b205a1d7dc, 'N', '114.23.241.67', '2017-11-27 21:01:44'),
(37, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '163.47.106.5', '2017-11-27 21:03:35'),
(38, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '202.50.121.242', '2017-11-28 01:03:10'),
(39, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x9f34fcccc852a205d64b4b128cbbc5de, 'N', '202.50.121.242', '2017-11-28 01:03:27'),
(40, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '202.50.121.242', '2017-11-28 01:04:01'),
(41, 0x33680c7682d7f8ec7958cf7946c22133, 0x6c2ccfae48fb93de7aba70b205a1d7dc, 'N', '115.189.133.47', '2017-11-29 22:25:58'),
(42, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '115.189.133.47', '2017-11-29 22:26:38'),
(43, 0x33680c7682d7f8ec7958cf7946c22133, 0x6c2ccfae48fb93de7aba70b205a1d7dc, 'N', '115.189.81.4', '2017-11-30 20:26:20'),
(44, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '115.189.81.4', '2017-11-30 20:28:36'),
(45, 0x8ffe4b932db059fa22b137100054a32d, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-06 20:58:32'),
(46, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-12-06 21:09:55'),
(47, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-06 21:10:10'),
(48, 0x8ffe4b932db059fa22b137100054a32d, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '115.189.128.233', '2017-12-06 22:26:22'),
(49, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-07 03:26:29'),
(50, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-07 03:32:45'),
(51, 0x8ffe4b932db059fa22b137100054a32d, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '103.242.24.104', '2017-12-08 00:39:38'),
(52, 0x8ffe4b932db059fa22b137100054a32d, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '101.98.52.169', '2017-12-10 18:14:11'),
(53, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-11 02:44:26'),
(54, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-13 18:47:11'),
(55, 0x2d4a3b34f0d819be2931bf408cb2d1bb, 0xab29fbee0fcaed127e5cbc85753a9dca, 'N', '103.242.24.104', '2017-12-19 20:47:42'),
(56, 0x33680c7682d7f8ec7958cf7946c22133, 0xda3298e33a24fdef6c67f2fdadbf0069, 'N', '103.242.24.104', '2017-12-19 20:47:51'),
(57, 0x33680c7682d7f8ec7958cf7946c22133, 0xda3298e33a24fdef6c67f2fdadbf0069, 'N', '103.242.24.104', '2017-12-19 20:48:19'),
(58, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '103.242.24.104', '2017-12-19 20:48:50'),
(59, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '103.242.24.104', '2017-12-19 21:18:51'),
(60, 0x8919e2f6477dd5d8d1c69932f9ac29d3, 0x6c2ccfae48fb93de7aba70b205a1d7dc, 'N', '103.242.24.104', '2017-12-19 21:26:43'),
(61, 0x33680c7682d7f8ec7958cf7946c22133, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '103.242.24.104', '2017-12-19 21:27:39'),
(62, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2017-12-20 01:39:41'),
(63, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2017-12-20 01:39:47'),
(64, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-01-08 21:33:11'),
(65, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-01-14 22:12:25'),
(66, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-01-15 01:00:38'),
(67, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-01 02:27:15'),
(68, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-06 21:03:32'),
(69, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-06 22:03:03'),
(70, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-07 20:52:22'),
(71, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2018-02-12 23:44:45'),
(72, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-12 23:44:50'),
(73, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-13 23:42:21'),
(74, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-21 02:23:46'),
(75, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-21 03:25:02'),
(76, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-02-21 23:30:29'),
(77, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-03-01 02:21:35'),
(78, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2018-03-01 02:51:19'),
(79, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-03-01 02:51:38'),
(80, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '114.23.241.67', '2018-03-08 21:00:55'),
(81, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '114.23.241.67', '2018-03-08 21:01:00'),
(82, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0x88a47d9dd79611f562a2d367d4cf5b1b, 'N', '127.0.0.1', '2018-03-13 22:47:41'),
(83, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '127.0.0.1', '2018-03-13 22:48:11'),
(84, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xf31031b3fb3ead91fd4e1cf2e408144e, 'N', '127.0.0.1', '2018-03-13 22:49:04'),
(85, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '127.0.0.1', '2018-03-13 22:50:56'),
(86, 0x5dd946d64029d62ed5093f93efcdf8b8cc7e05bda8449e6e9e93f94d12b2356b, 0xab29fbee0fcaed127e5cbc85753a9dca, 'Y', '127.0.0.1', '2018-03-14 20:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `cmsset_id` int(11) NOT NULL,
  `cmsset_name` varchar(100) NOT NULL,
  `cmsset_label` varchar(50) NOT NULL,
  `cmsset_explanation` varchar(255) NOT NULL,
  `cmsset_status` char(1) NOT NULL DEFAULT 'I',
  `cmsset_value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`cmsset_id`, `cmsset_name`, `cmsset_label`, `cmsset_explanation`, `cmsset_status`, `cmsset_value`) VALUES
(10, 'pages_maximum', 'Page Limit', '', 'I', '12'),
(2, 'pages_generations', 'Page Generation Limit', 'The number of levels of children pages that are allowed to be made.', 'A', '5');

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `user_id` int(11) NOT NULL COMMENT 'Primary key for user',
  `user_fname` varchar(45) DEFAULT NULL COMMENT 'User''s firstname',
  `user_lname` varchar(45) DEFAULT NULL COMMENT 'User''s lastname',
  `user_pass` varchar(255) DEFAULT NULL COMMENT 'User''s password (recommended as being sha256)',
  `user_email` varchar(100) DEFAULT NULL COMMENT 'User''s email address',
  `user_photo_path` varchar(255) DEFAULT NULL,
  `user_thumb_path` varchar(255) DEFAULT NULL,
  `user_introduction` text,
  `social_links` text,
  `last_login_date` datetime DEFAULT NULL,
  `access_id` int(11) DEFAULT '1' COMMENT 'User''s rights - whether they are admin, banned, general user etc. This is totally customisable and is up to the programmer.'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`user_id`, `user_fname`, `user_lname`, `user_pass`, `user_email`, `user_photo_path`, `user_thumb_path`, `user_introduction`, `social_links`, `last_login_date`, `access_id`) VALUES
(1, 'Website', 'Admin', '9bc129f7a46381be15f1329c4479e02c70d10d19', 'support@tomahawk.co.nz', '/library/authors/dexter.jpg', '/uploads/2015/11/img-563c1e061f186.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>', 'a:3:{s:11:\"google_plus\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Google+\";}s:8:\"facebook\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:8:\"Facebook\";}s:7:\"twitter\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Twitter\";}}', '2018-03-14 20:53:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_column`
--

CREATE TABLE `content_column` (
  `content` text NOT NULL,
  `css_class` varchar(255) NOT NULL,
  `span` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `content_row_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `content_column`
--

INSERT INTO `content_column` (`content`, `css_class`, `span`, `rank`, `content_row_id`) VALUES
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 50),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 50),
('<p><img alt=\"\" src=\"/library/family-photos/dscn8159.jpg\" /></p>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 51),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 2, 51),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 3, 51),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 1, 52),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 2, 52),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 3, 52),
('<p>Column 4</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 4, 52),
('<p>Column 1</p>', 'col-xs-12', 0, 1, 65),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 66),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 66),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 67),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 2, 67),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 3, 67),
('<p><img alt=\"\" src=\"/library/family-photos/dscn0016.jpg\" /></p>', 'col-xs-12 col-sm-6 col-md-3', 0, 1, 68),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 2, 68),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 3, 68),
('<p>Column 4</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 4, 68),
('<p><img alt=\"\" src=\"/library/Obi-Won_Diogo.jpg\" /></p>\r\n\r\n<p>Column 1</p>', 'col-xs-12', 0, 1, 81),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 82),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 82),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 83),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 2, 83),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 3, 83),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 1, 84),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 2, 84),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 3, 84),
('<p>Column 4</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 4, 84),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 98),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 2, 98),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 3, 98),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 99),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 99),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 100),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 100),
('', 'col-xs-12', 0, 1, 101),
('<p>Column 3Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.&nbsp;</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 2, 102),
('<p>Column 1Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.&nbsp;</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 3, 102),
('<p>Column 4Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.&nbsp;</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 4, 102),
('<p>Southern Lake Taupo has some of the best mountain bike country in New Zealand. We know trails that ride through ancient beech forests, alongside magnificent trout rivers and past huge volcanoes.</p>\r\n\r\n<p>We also have exclusive access to 3,800 hectares of trails including a genuine backcountry sheep station &ndash; some of the finest Taupo activities you&rsquo;ll experience.</p>\r\n\r\n<p>As we like to say &ldquo;Trails end but tales continue&hellip;&rdquo;</p>', 'col-xs-12', 0, 1, 112),
('<p>Column 1</p>', 'col-xs-12', 0, 1, 223),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 224),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 224),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 225),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 2, 225),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-4', 0, 3, 225),
('<p>Column 1</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 1, 226),
('<p>Column 2</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 2, 226),
('<p>Column 3</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 3, 226),
('<p>Column 4</p>', 'col-xs-12 col-sm-6 col-md-3', 0, 4, 226),
('<p style=\"text-align: center;\"><img alt=\"\" src=\"/library/download-1.jpg\" /></p>', 'col-xs-12', 0, 1, 597),
('<h1>Snow Play White Water Combo</h1>\r\n\r\n<p>This winter, bring your family along to experience two of the top winter activities in the Taupo district. &nbsp; Mix snow and white water to have the ultimate family adventure! This combo can be split over two days or completed in one full day if short on time.</p>\r\n\r\n<p>The Grade 2 Family Float Adventure is ideal for smaller children who love adventure. &nbsp;You&rsquo;ll&nbsp;follow the river on this leisurely 1.5 hour trip down the soft, tumbling waters of the Lower Tongariro. &nbsp;The magic of rafting comes alive for first time rafters, those who prefer a gentler pace and children. You still get to paddle and there are some small rapids to navigate but nothing too wet or wild.</p>\r\n\r\n<p>After your white water experience, you&rsquo;ll then head to Mt Ruapehu&rsquo;s Whakapapa Ski area, a scenic 45min drive from our base. &nbsp;At Happy Valley, you&rsquo;ll be receive a full day sledding pass which includes carpet lift access, free sightseeing return chairlift ride to Knoll Ridge cafe and a free sled.</p>', 'col-xs-12', 0, 1, 598),
('<h2>Includes</h2>\r\n\r\n<ul>\r\n	<li>Grade 2 Family Float Adventure with Tongariro River Rafting</li>\r\n	<li>Full day sledding pass at Mt Ruapehu</li>\r\n	<li>Carpet lift access in sledding zone</li>\r\n	<li>Free sled</li>\r\n	<li>Return sightseeing chairlift ride to Knoll Ridge Cafe</li>\r\n	<li>Can be done over one or two days</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Prices</h3>\r\n\r\n<p>1 Adult + 1 Child &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $219 &nbsp; &nbsp; &nbsp; &nbsp;(Save $14)</p>\r\n\r\n<p>2 Adults + 2 Children &nbsp;$439&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (Save $27)</p>\r\n\r\n<p>2 Adults + 3 Children &nbsp;$535&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;(Save $31)</p>\r\n\r\n<p>Minimum age for rafting is 3yrs</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 599),
('<h2>Departure point</h2>\r\n\r\n<p>The Rafting Centre 95 Atirau Rd Turangi</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 599),
('<h1 style=\"text-align: center;\">Snow White Combo</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Grade 2 Family Float Adventure is ideal for smaller children who love adventure. &nbsp;You&rsquo;ll&nbsp;follow the river on this leisurely 1.5 hour trip down the soft, tumbling waters of the Lower Tongariro. &nbsp;The magic of rafting comes alive for first time rafters, those who prefer a gentler pace and children. You still get to paddle and there are some small rapids to navigate but nothing too wet or wild.</p>\r\n\r\n<p>After your white water experience, you&rsquo;ll then head to Mt Ruapehu&rsquo;s Whakapapa Ski area, a scenic 45min drive from our base. &nbsp;At Happy Valley, you&rsquo;ll be receive a full day sledding pass which includes carpet lift access, free sightseeing return chairlift ride to Knoll Ridge cafe and a free sled.</p>\r\n\r\n<h3>Save up to $31</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h5><img alt=\"\" src=\"/library/download-1.jpg\" style=\"font-family: inherit; font-size: 1.1em;\" /></h5>\r\n\r\n<p style=\"text-align: center;\"><a class=\"btn btn__gold\" href=\"https://tongariroriver.netzone.nz/about/hot-deals-and-promotions/snow-white-combo-package\" title=\"Whitewater Rafting\">MORE INFO</a></p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 692),
('<h1 style=\"text-align: center;\">HOT Winter Deal</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>All rafting trips in winter include free entry to the&nbsp;Tokaanu&nbsp;Hot Pools. PLUS we have Granny&rsquo;s famous hot soup available back at base.</p>\r\n\r\n<p>A recent feature in the&nbsp;Herald On Sunday&nbsp;said, &ldquo;To wrap up over two hours on the water we were taken for a welcome soak in the&nbsp;Tokaanu&nbsp;thermal pools and in case that&nbsp;hadn&rsquo;t sufficiently warmed us, were fed hearty soup and bread back at the Rafting Co &ndash; serious Brownie points there.&rdquo;</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/library/64-tokaanu-public-pool-2-300x250.jpg\" /></p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 692),
('<h1>We are now GoPro Friendly!</h1>\r\n\r\n<p>You are now welcome to bring your own GoPro! &nbsp;We have the helmut attachments and have put together some stock footage for you to add to your own footage. &nbsp;Create stunning souvenir memories of your Tongariro River Rafting experience and share with your friends.</p>', 'col-xs-12', 0, 1, 693),
('<h1>AA Smartfuel</h1>\r\n\r\n<p><strong>Book online and save on fuel</strong></p>\r\n\r\n<p>Save 20 cents per litre per person.<br />\r\ne.g. Book four people and save 80 cents per litre.</p>\r\n\r\n<p>Even if you are not an AA smart Fuel Member we have cards here and you can start saving straight away.</p>\r\n\r\n<p><strong>Shop and earn fuel discounts that add up</strong></p>\r\n\r\n<p>Swipe your card to earn cents per litre fuel savings every time you meet the qualifying spend at a participating retailers.</p>\r\n\r\n<p>Get your free AA Smartfuel card in-store or use your AA Membership card.</p>\r\n\r\n<p><strong>Redeem your accumulated savings cents per litre</strong></p>\r\n\r\n<p>Swipe again to redeem your total combined cents per litre discount when you fuel-up at a participating BP or Caltex. Go to&nbsp;<a href=\"https://www.aa.co.nz/aasmartfuel/\">AA Smartfuel&nbsp;</a>for more information.</p>', 'col-xs-12', 0, 1, 694),
('<p>Includes:</p>\r\n\r\n<ul>\r\n	<li>12,000ft skydive with NZ&rsquo;s original operator</li>\r\n	<li>Grade 3 white water adventure with Tongariro River Rafting</li>\r\n	<li>Free photos from both activities</li>\r\n	<li>Free transportation from Taupo/Turangi return</li>\r\n</ul>', 'col-xs-12', 0, 1, 788),
('<h2>Dinner, bed and breakfast Tongariro River Rafting style</h2>\r\n\r\n<p>Not sure if this overnight thing is for you? Then try this little sampler.</p>\r\n\r\n<p>Raft down the Tongariro&rsquo;s Whitewaters to our campsite on the first afternoon and then relax beside the river with a good book, have a fish, or swim at the jump spot. Enjoy&nbsp;a hearty breakfast before breaking camp and rafting on down the river for another 1.5 hours to the take out.</p>', 'col-xs-12', 0, 1, 798),
('<h2>Upper Mohaka Wilderness trip</h2>\r\n\r\n<p>Explore the upper part of the Mohaka river with its crystal clear water, stunning native forest, and natural thermal hot springs. Fly, Raft, swim, fish, have a wander along the river bank read a book or just relax on this 4 day trip.</p>\r\n\r\n<p>The Ultimate Rafting vacation this trip has something for everyone. A great catch up for friends and the most amazing family vacation that you will ever have.</p>\r\n\r\n<p>We raft 40 kms over 4 days so there isn&rsquo;t too much pressure on getting down the river each day but your days will be full of fun and excitement.</p>\r\n\r\n<h6><a href=\"https://tongariroriver.netzone.nz/contact\">Please email for a trip itinerary.</a></h6>', 'col-xs-12', 0, 1, 799),
('<h1>Raft Fishing</h1>\r\n\r\n<p>The Tongariro River is world famous for its trout fishing. Most of the upper river however can only be reached by kayak or raft.</p>\r\n\r\n<p>This wilderness section of the river, with its crystal clear pools and unspoiled runs, gets minimal angling pressure compared to the lower Tongariro and can therefore deliver exceptional fishing.&nbsp;</p>\r\n\r\n<p>The upper river is open to anglers from December 1st to May 31st each year. For anglers seeking uncrowded waters and large numbers of quality fighting fish, this can be trout heaven.</p>', 'col-xs-12', 0, 1, 827),
('<p><strong>Departure Times</strong></p>\r\n\r\n<p>All Seasons:&nbsp;8am<br />\r\nTrip times are flexible for groups</p>\r\n\r\n<p><strong>Prices</strong></p>\r\n\r\n<p>Per raft:&nbsp;$700 - maximum of 3 people, minimum age 10 years</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 828),
('<h1>Fly Fishing</h1>\r\n\r\n<p>The lower Tongariro River can be fished year round. Fishing during the months of the winter spawning run allows anglers the opportunity to catch strong, fresh-run trout.</p>\r\n\r\n<p>Half or full day trips can be arranged with professional guides on the Tongariro, the Tauranga-Taupo, Rangitikei or any of the many other famous rivers on our doorstep</p>', 'col-xs-12', 0, 1, 829),
('<p><strong>Departure Times</strong></p>\r\n\r\n<p>All Seasons:&nbsp;8am<br />\r\nTrip times are flexible for&nbsp;groups</p>\r\n\r\n<p><strong>Prices</strong></p>\r\n\r\n<p>$700 for 1 or 2 people</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 830),
('<p><strong>Note:</strong>&nbsp;We&rsquo;re committed to preventing the spread of didymo and other waterborne pests. Please check, clean and dry your gear before you arrive, or we may need to put you through the&nbsp;didymo cleaning station.</p>', 'col-xs-12', 0, 1, 831),
('<p>Dash to the base of the spectacular Huka Falls onboard a twin engined V6 jet boat.</p>\r\n\r\n<p>Play in the tail of the mighty Huka Falls and slide past cliffs and trees at an amazing 80km/hr.</p>\r\n\r\n<p>Then get ready for Hukafalls Jet&rsquo;s trademark 360 degree spins, leaving you with a beaming smile and heart pumping with adrenaline.</p>\r\n\r\n<p>We&rsquo;ll then transfer you so you can continue your white water adventure by paddling and splashing your way along the Tongariro River, enjoying a rafting experience that combines the heart-pumping action of more than 60 rapids with sufficient lower grade water that enables the splendid scenery and ample wildlife to be enjoyed.</p>', 'col-xs-12', 0, 1, 835),
('<h1>Transport</h1>\r\n\r\n<p>From accommodation within Taupo or Turangi and to/from Turangi to Taupo.</p>\r\n\r\n<h1>Bungy Jump</h1>\r\n\r\n<p>Throw yourself from the highest water touch bungy platform in NZ, at Taupo Bungy. From 47metres high, above the Waikato River, you choose to stay dry or immerse yourself in the crystal clear waters below &ndash; from your fingertips to your ankles. Set in a spectacularly scenic location, this is a &lsquo;must-do&rsquo; activity whilst visiting the Taupo region.</p>\r\n\r\n<h1>Rafting Trip</h1>\r\n\r\n<p>Enjoy a grade 3+ whitewater rafting adventure that combines the heart-pumping action of more than 60 rapids (with an expert guide at the helm) and plenty of spectacular, unspoilt wilderness (a large part of this trip can only be accessed by raft or kayak). Challenge your limits by daring to do the cliff jump and take in the commentary from our knowledgeable and professional guides.</p>\r\n\r\n<h1>Trip time 2 to 2&frac12;hrs.</h1>\r\n\r\n<h1>Food</h1>\r\n\r\n<p>Granny&rsquo;s &ldquo;Secret Recipe&rdquo; Soup included in Winter.<br />\r\nDeli style dinner included in Summer.</p>\r\n\r\n<h1>Photos on a USB</h1>\r\n\r\n<p>2GB USB, complete with lanyard, with all your photographic memories loaded on. Receive a minimum of 5 professional photos of both your bungy and rafting experiences, as well as in-raft camera shots taken by you! Plenty of extra room to add on your own photos as well</p>', 'col-xs-12', 0, 1, 840),
('<p>Southern Lake Taupo has some of the best mountain bike country in New Zealand. We know trails that ride through ancient beech forests, alongside magnificent trout rivers and past huge volcanoes.</p>\r\n\r\n<p>We also have exclusive access to 3,800 hectares of trails including a genuine backcountry sheep station &ndash; some of the finest Taupo activities you&rsquo;ll experience.</p>\r\n\r\n<p>As we like to say &ldquo;Trails end but tales continue&hellip;&rdquo;</p>', 'col-xs-12', 0, 1, 841),
('<h3>Tongariro&nbsp;River Track</h3>\r\n\r\n<p>The&nbsp;Tongariro&nbsp;River track is a great trail for beginners or children. It follows this world famous trout river past rolling farmland, beach forests and fern glades with spectacular views at almost every bend.</p>\r\n\r\n<p><strong>Rating</strong>:&nbsp;Beginners</p>\r\n\r\n<p><strong>Distance</strong>:&nbsp;10 x km return</p>\r\n\r\n<p><strong>Time</strong>: Allow 1 to 2 hours</p>\r\n\r\n<p><strong>Price</strong>:</p>\r\n\r\n<p>Rental:&nbsp;$30<br />\r\nGuided:&nbsp;$50</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 1, 842),
('<h3>Tree Trunk Gorge</h3>\r\n\r\n<p>This is a short but beautiful track that weaves its way through native forest, with a short steep climb, a picturesque river ford and some wooden bridges en route.</p>\r\n\r\n<p>The track is only 10kms but along the way you can also check out the awesome site of the Pillars of Hercules before biking down to the Poutu Intake on the Tongariro River.</p>\r\n\r\n<p><strong>Rating</strong>: Beginner/Intermediate</p>\r\n\r\n<p><strong>Distance:</strong> 10km</p>\r\n\r\n<p><strong>Time</strong>: Allow 2.5 hours</p>\r\n\r\n<p><strong>Price:</strong></p>\r\n\r\n<p>Bike and Shuttle:&nbsp;$75 per person<br />\r\nGuided: $85 per person</p>', 'col-xs-12 col-sm-6 col-md-6', 0, 2, 842),
('<h2>Rentals, Guided Trails and Shuttles</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h5><strong>Bikes for Rent</strong></h5>\r\n\r\n<p>Bring your own bike or rent one of ours for two hours, a half-day or full day. All our rental mountain bikes are late models. Kid sized mountain bikes are available too. Helmets are included.</p>\r\n\r\n<h5><strong>Guided Trails or Freedom Rides</strong></h5>\r\n\r\n<p>Most of the Trails are clearly marked and require no guide, but you&#39;re welcome to have one accompany you if you wish. Some rides though have an experienced guide included in the group price.</p>\r\n\r\n<h5><strong>Shuttle Service</strong></h5>\r\n\r\n<p>Leave your vehicle safe and secure at our depot and we&#39;ll drop you at the start of the trail and pick you up at the end.</p>', 'col-xs-12', 0, 1, 843),
('<h1>Trip Details</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Mountain biking takes around 1&frac12; hours<br />\r\nThe rafting takes around 2&frac12; hours<br />\r\nTotal trip time 6 hours</p>', 'col-xs-12', 0, 1, 844),
('<p>To discover the land, follow the river in this leisurely 1.5 hour trip down the soft, tumbling waters of the Lower Tongariro.</p>\r\n\r\n<p>The magic of rafting comes alive for first time rafters, those who prefer a gentler pace and children. You still get to paddle and there are some small rapids to navigate but nothing too wet or wild.</p>\r\n\r\n<h3 style=\"text-align: center;\">Note: Trip times are flexible for groups.</h3>', 'col-xs-12', 0, 1, 847),
('<h3 style=\"text-align: center;\">Tongariro Access 14</h3>\r\n\r\n<h5 style=\"text-align: center;\"><strong>(above Tree Trunk Gorge)</strong></h5>\r\n\r\n<h5><br />\r\n2018&nbsp;Dates</h5>\r\n\r\n<p>11th February</p>\r\n\r\n<p>29th April</p>\r\n\r\n<p>16th September</p>\r\n\r\n<p><a class=\"btn btn__gold\" href=\"https://tongariroriver.netzone.nz/cms/?do=tours&amp;action=edit&amp;id=3\">Book Now</a></p>\r\n\r\n<h5><br />\r\nPrices: $145 per person</h5>', 'col-xs-12 col-sm-6 col-md-4', 0, 1, 854),
('<p>Access 14: The Big Daddy of the river. This grade 4 section of the river only flows on 3 days of the year. Come and experience the premier section of grade 4 whitewater in New Zealand. This steep continuous section of whitewater will have you grinning ear to ear the same as your guides. In fact guides from all over the place want to come and work when these flow days happen it is so good.&nbsp;</p>', 'col-xs-12', 0, 1, 855),
('<h3 style=\"text-align: center;\">Tongariro Access 14</h3>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><a class=\"btn btn__gold\" href=\"https:///rafting-adventures/tongariro-access-14\" tabindex=\"0\" title=\"Family Floats\">Explore</a></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/library/whitewater-photos/dscn7925.jpg\" /></p>', 'col-xs-12', 0, 1, 857),
('<h3 style=\"text-align: center;\">Address</h3>\r\n\r\n<p style=\"text-align: center;\"><br />\r\nTongariro River Rafting<br />\r\nThe Rafting Centre, Atirau Road<br />\r\nPO Box 281<br />\r\nTurangi<br />\r\nNew Zealand</p>', 'col-xs-12', 0, 1, 860),
('<p>In 2.5 hours you navigate over 60 heart-pounding, roller coaster rapids with an expert guide at the helm. Throughout the trip you&rsquo;ll be treated to sights only accessed by raft. If you&rsquo;re looking for things to do in Taupo, book with us and enjoy the spectacular unspoilt wilderness and adrenalin-pumping action!</p>', 'col-xs-12', 0, 1, 861),
('<h3 style=\"text-align: center;\">adadqwdqd</h3>\r\n\r\n<p>qwdqdqdqwd</p>\r\n\r\n<p>qdwqdqd</p>\r\n\r\n<p>qdwqdqd</p>', 'col-xs-12', 0, 1, 862),
('', 'col-xs-12', 0, 1, 863),
('<h3>What we do:</h3>\r\n\r\n<p>Pellentesque malesuada bibendum congue. Duis ornare purus ut est tempor, a convallis sapien viverra. Ut sagittis auctor feugiat. Donec varius risus in laoreet scelerisque. Donec a justo vitae ex commodo accumsan non in leo. Fusce sed eleifend nulla. Donec imperdiet vitae neque a malesuada. Quisque pulvinar congue leo ac pellentesque. Phasellus in tincidunt libero. Suspendisse sapien ante, fermentum imperdiet blandit non, tincidunt in quam.</p>\r\n\r\n<h3>How we do it</h3>\r\n\r\n<p>Pellentesque malesuada bibendum congue. Duis ornare purus ut est tempor, a convallis sapien viverra. Ut sagittis auctor feugiat. Donec varius risus in laoreet scelerisque. Donec a justo vitae ex commodo accumsan non in leo. Fusce sed eleifend nulla. Donec imperdiet vitae neque a malesuada. Quisque pulvinar congue leo ac pellentesque. Phasellus in tincidunt libero. Suspendisse sapien ante, fermentum imperdiet blandit non, tincidunt in quam.</p>\r\n\r\n<p>&nbsp;</p>', 'col-xs-12', 0, 1, 870),
('<p style=\"text-align: center;\"><strong>Owner/Operators</strong><br />\r\nGarth and Leigh Oakden</p>\r\n\r\n<p style=\"text-align: center;\"><strong>Telephone</strong>&nbsp;(07) 386 6409<br />\r\n<strong>Freephone</strong>&nbsp;0800 10 10 24<br />\r\n<strong>Fax&nbsp;</strong>(07) 386 6445<br />\r\n<strong>Email&nbsp;</strong><a href=\"mailto:info@trr.co.nz\">info@trr.co.nz</a></p>\r\n\r\n<p style=\"text-align: center;\"><strong>Address</strong><br />\r\nTongariro River Rafting<br />\r\nThe Rafting Centre, Atirau Road<br />\r\nPO Box 281<br />\r\nTurangi<br />\r\nNew Zealand</p>', 'col-xs-12', 0, 1, 872);

-- --------------------------------------------------------

--
-- Table structure for table `content_row`
--

CREATE TABLE `content_row` (
  `id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `page_meta_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `content_row`
--

INSERT INTO `content_row` (`id`, `rank`, `page_meta_data_id`) VALUES
(50, 2, 30),
(51, 3, 30),
(52, 4, 30),
(65, 1, 31),
(66, 2, 31),
(67, 3, 31),
(68, 4, 31),
(81, 1, 35),
(82, 2, 35),
(83, 3, 35),
(84, 4, 35),
(98, 1, 37),
(99, 2, 37),
(100, 3, 37),
(101, 1, 34),
(102, 4, 34),
(112, 1, 41),
(223, 1, 51),
(224, 2, 51),
(225, 3, 51),
(226, 4, 51),
(597, 1, 54),
(598, 2, 54),
(599, 3, 54),
(692, 3, 53),
(693, 4, 53),
(694, 5, 53),
(788, 1, 46),
(798, 1, 40),
(799, 2, 40),
(827, 1, 47),
(828, 2, 47),
(829, 3, 47),
(830, 4, 47),
(831, 5, 47),
(835, 1, 42),
(840, 1, 44),
(841, 1, 38),
(842, 2, 38),
(843, 3, 38),
(844, 1, 43),
(847, 1, 28),
(854, 1, 29),
(855, 2, 29),
(857, 1, 63),
(860, 1, 6),
(861, 2, 27),
(862, 2, 27),
(863, 1, 5),
(870, 1, 7),
(872, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comments` text,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  `date_of_enquiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `first_name`, `last_name`, `email_address`, `contact_number`, `subject`, `comments`, `status`, `date_of_enquiry`, `ip_address`) VALUES
(1, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:54:33', '127.0.0.1'),
(2, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:56:27', '127.0.0.1'),
(3, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:57:28', '127.0.0.1'),
(4, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:57:35', '127.0.0.1'),
(5, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:57:55', '127.0.0.1'),
(6, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:59:30', '127.0.0.1'),
(7, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:59:31', '127.0.0.1'),
(8, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 22:59:31', '127.0.0.1'),
(9, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:01:42', '127.0.0.1'),
(10, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:01:43', '127.0.0.1'),
(11, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:10', '127.0.0.1'),
(12, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:12', '127.0.0.1'),
(13, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:12', '127.0.0.1'),
(14, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:12', '127.0.0.1'),
(15, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:13', '127.0.0.1'),
(16, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:13', '127.0.0.1'),
(17, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:27', '127.0.0.1'),
(18, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:28', '127.0.0.1'),
(19, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:28', '127.0.0.1'),
(20, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:28', '127.0.0.1'),
(21, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:29', '127.0.0.1'),
(22, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:29', '127.0.0.1'),
(23, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:29', '127.0.0.1'),
(24, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:42', '127.0.0.1'),
(25, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:44', '127.0.0.1'),
(26, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:58', '127.0.0.1'),
(27, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:58', '127.0.0.1'),
(28, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:02:59', '127.0.0.1'),
(29, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', 'fromroot', 'D', '2017-10-19 23:03:39', '127.0.0.1'),
(30, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'Experience Japan Travel: Payment Request', '014B58', 'D', '2017-10-19 23:04:08', '127.0.0.1'),
(31, 'Pinal', 'Desai', 'pinal.j.desai@gmail.com', '0273988446', 'sfsdf', 'sdfsdfsdff', 'D', '2017-10-19 23:06:14', '127.0.0.1'),
(32, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Test', 'Test', 'D', '2017-10-24 22:11:23', '114.23.241.67'),
(33, 'kirsten', 'whittington', 'test@fish.com', '', 'test', 'test', 'D', '2017-10-26 19:08:27', '114.23.241.67'),
(34, 'kirsten', 'whittington', 'test@fish.com', '', 'test', 'test', 'D', '2017-10-26 19:11:58', '114.23.241.67'),
(35, 'Test', 'Test', 'alan@tomahawk.co.nz', '1324', 'Tomahawk Testing Chrome', 'Tomahawk Testing Chrome', 'D', '2017-10-27 01:47:44', '114.23.241.67'),
(36, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Tomahawk Testing Firefox', 'Tomahawk Testing Firefox', 'D', '2017-10-27 03:16:38', '114.23.241.67'),
(37, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Tomahawk Testing IE', 'Tomahawk Testing IE', 'D', '2017-10-27 03:26:05', '114.23.241.67'),
(38, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Tomahawk Testing Edge', 'Tomahawk Testing Edge', 'D', '2017-10-27 03:26:40', '114.23.241.67'),
(39, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Tomahawk Testing Safari', 'Tomahawk Testing Safari', 'D', '2017-10-27 03:43:39', '114.23.241.67'),
(40, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Test', 'Tomahawk testing android', 'D', '2017-10-28 08:14:45', '122.57.179.207'),
(41, 'Pinal', 'Desai', 'pinal@tomahawk.co.nz', '0273988446', 'TEST', 'TEST email', 'D', '2017-11-01 22:19:00', '114.23.241.67'),
(42, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Testing Chrome', 'Testing Chrome', 'A', '2017-11-03 01:05:51', '114.23.241.67'),
(43, 'Test', 'Test', 'alan@tomahawk.co.nz', '1234', 'Enquiry about tour Whitewater Rafting', 'Testing Whitewater rafting', 'A', '2017-11-03 02:19:21', '114.23.241.67');

-- --------------------------------------------------------

--
-- Table structure for table `general_importantpages`
--

CREATE TABLE `general_importantpages` (
  `imppage_id` int(11) NOT NULL,
  `imppage_name` varchar(150) NOT NULL,
  `page_id` int(11) NOT NULL,
  `imppage_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `is_mobile` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_importantpages`
--

INSERT INTO `general_importantpages` (`imppage_id`, `imppage_name`, `page_id`, `imppage_showincms`, `is_mobile`) VALUES
(1, 'Home', 1, 'N', 0),
(2, '404', 11, 'Y', 0),
(3, 'Reviews', 12, 'Y', 0),
(4, 'Contact', 8, 'Y', 0),
(5, 'Blog', 14, 'Y', 0),
(6, 'Booking', 13, 'Y', 0),
(8, 'Gallery', 5, 'Y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `general_pages`
--

CREATE TABLE `general_pages` (
  `id` int(11) NOT NULL COMMENT 'Primary key for pages',
  `access_level` enum('P','L') NOT NULL DEFAULT 'P' COMMENT 'P = Public, L = Private',
  `meta_cache` tinyint(1) NOT NULL DEFAULT '1',
  `slideshow_type` enum('C','D') NOT NULL DEFAULT 'D',
  `is_category` enum('Y','N') NOT NULL DEFAULT 'N',
  `parent_id` int(11) DEFAULT '0',
  `template_id` int(11) DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_pages`
--

INSERT INTO `general_pages` (`id`, `access_level`, `meta_cache`, `slideshow_type`, `is_category`, `parent_id`, `template_id`, `page_meta_data_id`) VALUES
(1, 'P', 1, 'D', 'N', 0, 1, 1),
(2, 'P', 1, 'D', 'Y', 0, 2, 2),
(3, 'P', 1, 'D', 'Y', 0, 2, 3),
(4, 'P', 1, 'D', 'Y', 0, 2, 4),
(5, 'P', 1, 'D', 'N', 7, 2, 5),
(6, 'P', 1, 'D', 'N', 7, 2, 6),
(7, 'P', 1, 'D', 'N', 0, 2, 7),
(8, 'P', 1, 'D', 'N', 0, 2, 8),
(9, 'P', 1, 'D', 'N', 0, 2, 9),
(10, 'P', 1, 'D', 'N', 0, 2, 10),
(11, 'P', 1, 'D', 'N', 0, 2, 11),
(12, 'P', 1, 'D', 'N', 0, 2, 12),
(13, 'P', 1, 'D', 'N', 0, 2, 13),
(14, 'P', 1, 'D', 'N', 7, 2, 14),
(15, 'P', 1, 'D', 'N', 7, 2, 15),
(16, 'P', 1, 'D', 'N', 7, 2, 30),
(17, 'P', 1, 'D', 'N', 0, NULL, 33),
(18, 'P', 1, 'D', 'N', 0, 2, 34),
(19, 'P', 1, 'D', 'N', 0, 2, 35),
(20, 'P', 1, 'D', 'N', 0, 2, 37),
(21, 'P', 1, 'D', 'N', 2, 2, 41),
(22, 'P', 1, 'D', 'Y', 0, 2, 50),
(23, 'P', 1, 'D', 'N', 7, 2, 53),
(24, 'P', 1, 'D', 'N', 23, 2, 54),
(25, 'P', 1, 'D', 'N', 0, 2, 58),
(26, 'P', 1, 'D', 'N', 0, 2, 60),
(27, 'P', 1, 'D', 'N', 0, NULL, 62),
(28, 'P', 1, 'D', 'N', 2, 2, 63),
(29, 'P', 1, 'D', 'N', 0, NULL, 64),
(30, 'P', 1, 'D', 'N', 0, NULL, 65);

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL COMMENT 'Company/Business/Website name	',
  `start_year` int(4) DEFAULT NULL,
  `email_address` text COMMENT 'Email Address',
  `phone_number` varchar(100) DEFAULT NULL,
  `free_phone_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `address` text,
  `booking_url` varchar(255) DEFAULT NULL,
  `js_code_head_close` text,
  `js_code_body_open` text,
  `js_code_body_close` text,
  `adwords_code` text,
  `mailchimp_api_key` varchar(100) DEFAULT NULL,
  `mailchimp_list_id` varchar(50) DEFAULT NULL,
  `map_latitude` float(10,6) DEFAULT NULL,
  `map_longitude` float(10,6) DEFAULT NULL,
  `map_address` text,
  `map_styles` longtext,
  `map_heading` varchar(255) DEFAULT NULL,
  `map_description` text,
  `map_zoom_level` smallint(6) NOT NULL,
  `map_marker_latitude` float(10,6) NOT NULL,
  `map_marker_longitude` float(10,6) NOT NULL,
  `slideshow_speed` int(11) DEFAULT '3000',
  `set_sitemapupdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `set_sitemapstatus` char(1) DEFAULT NULL,
  `homepage_slideshow_caption` varchar(255) DEFAULT NULL,
  `tripadvisor_widget_code` text,
  `youtube_id` varchar(20) DEFAULT NULL,
  `homepage_caption` varchar(225) DEFAULT NULL,
  `instagram_username` varchar(100) DEFAULT NULL,
  `instagram_client_id` varchar(100) DEFAULT NULL,
  `instagram_access_token` varchar(100) DEFAULT NULL,
  `photo_archive_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gopro_photo_archive_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `booking_terms_and_conditions` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `company_name`, `start_year`, `email_address`, `phone_number`, `free_phone_number`, `address`, `booking_url`, `js_code_head_close`, `js_code_body_open`, `js_code_body_close`, `adwords_code`, `mailchimp_api_key`, `mailchimp_list_id`, `map_latitude`, `map_longitude`, `map_address`, `map_styles`, `map_heading`, `map_description`, `map_zoom_level`, `map_marker_latitude`, `map_marker_longitude`, `slideshow_speed`, `set_sitemapupdated`, `set_sitemapstatus`, `homepage_slideshow_caption`, `tripadvisor_widget_code`, `youtube_id`, `homepage_caption`, `instagram_username`, `instagram_client_id`, `instagram_access_token`, `photo_archive_url`, `gopro_photo_archive_url`, `booking_terms_and_conditions`) VALUES
(1, 'RBS Whytewaters', 2017, 'info@test.co.nz', '0800 10 10 24', '0800 10 10 24', 'Test Address,\r\nAtirau Road PO Box 281\r\nTurangi\r\nNew Zealand', '', '', '', '', '', '6577a17dd0a66458981c0b4126a86b45-us15', '3919cd1845', 0.000000, 0.000000, '', '[{\"featureType\":\"administrative\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#a7a7a7\"}]},{\"featureType\":\"administrative\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#737373\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#efefef\"}]},{\"featureType\":\"poi\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#dadada\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#696969\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#b3b3b3\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d6d6d6\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#ffffff\"},{\"weight\":1.8}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d7d7d7\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#808080\"},{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#d3d3d3\"}]}]', '', '', 0, 0.000000, 0.000000, 3000, '2018-03-14 23:09:53', 'I', '', '', '', 'Book now for an amazing test experience!', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `highlights`
--

CREATE TABLE `highlights` (
  `id` int(11) NOT NULL,
  `heading` varchar(150) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `icon_photo_path` varchar(255) NOT NULL,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `highlights`
--

INSERT INTO `highlights` (`id`, `heading`, `short_description`, `icon_photo_path`, `status`, `rank`) VALUES
(1, 'Go Pro Friendly', 'We are the only Go Pro friendly adventure rafting provider in the region. We have cameras on board to capture all your moments.', '/library/icons/icon1.png', 'A', 1),
(2, 'Most experienced', 'We are the most experienced white water rafting providers in the Taupo region. So we are the best when it comes to fun, adventure and safety.', '/library/icons/icon2.png', 'A', 2),
(3, '100% Local', 'At Tongariro River Rafting, we\'re 100% Kiwi-owned and operated by local husband and wife team Garth and Leigh Oakden.', '/library/icons/icon3.png', 'A', 3),
(4, 'Blue Duck Project', 'We founded the Blue Duck Project to return the rare native Blue Duck or whio to its traditional habitat along the Tongariro River.', '/library/icons/icon4.png', 'A', 4);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `mod_id` int(11) NOT NULL COMMENT 'Primary key for include',
  `mod_name` varchar(255) DEFAULT NULL COMMENT 'Include name',
  `mod_path` varchar(255) DEFAULT NULL COMMENT 'Include URL/file path (exclude the extension)',
  `mod_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `mod_mobile` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`mod_id`, `mod_name`, `mod_path`, `mod_showincms`, `mod_mobile`) VALUES
(1, 'Slideshow', 'slideshow', 'N', NULL),
(2, 'Contact', 'contact', 'Y', NULL),
(3, 'Quicklinks', 'quicklinks', 'N', NULL),
(5, 'Reviews', 'reviews', 'N', NULL),
(4, 'Highlights', 'highlights', 'Y', NULL),
(6, 'Instagram', 'instagram', 'N', NULL),
(7, 'Google Map', 'map', 'Y', NULL),
(8, 'Gallery', 'gallery', 'Y', NULL),
(9, 'Blog', 'blog', 'N', NULL),
(11, 'Content', 'content', 'N', NULL),
(12, 'Booking', 'booking', 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_pages`
--

CREATE TABLE `module_pages` (
  `modpages_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `modpages_rank` int(4) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_pages`
--

INSERT INTO `module_pages` (`modpages_id`, `page_id`, `modpages_rank`, `mod_id`) VALUES
(149, 6, 2, 7),
(154, 5, 2, 8),
(148, 6, 3, 8),
(165, 8, 2, 2),
(39, 16, 1, 4),
(38, 16, 2, 7),
(37, 16, 3, 8),
(36, 16, 4, 2),
(106, 1, 3, 10),
(60, 18, 1, 8),
(59, 20, 2, 7),
(58, 20, 1, 8),
(153, 1, 2, 4),
(163, 7, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `module_templates`
--

CREATE TABLE `module_templates` (
  `tmplmod_id` int(11) NOT NULL,
  `tmpl_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `tmplmod_rank` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_templates`
--

INSERT INTO `module_templates` (`tmplmod_id`, `tmpl_id`, `mod_id`, `tmplmod_rank`) VALUES
(1, 1, 1, 15),
(2, 1, 3, 12),
(3, 1, 5, 13),
(4, 1, 6, 14),
(5, 1, 9, 11),
(6, 2, 1, 15),
(7, 2, 3, 12),
(8, 2, 5, 13),
(9, 2, 6, 14),
(10, 2, 9, 11),
(11, 2, 10, 2),
(12, 3, 1, 15),
(13, 3, 3, 12),
(14, 3, 5, 13),
(15, 3, 6, 14),
(16, 3, 9, 11),
(17, 3, 10, 2),
(18, 1, 11, 10),
(19, 2, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `page_has_quicklink`
--

CREATE TABLE `page_has_quicklink` (
  `page_id` int(11) NOT NULL,
  `quicklink_page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_has_quicklink`
--

INSERT INTO `page_has_quicklink` (`page_id`, `quicklink_page_id`) VALUES
(16, 4),
(20, 5),
(18, 5),
(23, 4);

-- --------------------------------------------------------

--
-- Table structure for table `page_meta_data`
--

CREATE TABLE `page_meta_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `footer_menu` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `quicklink_heading` varchar(255) DEFAULT NULL,
  `quicklink_menu_label` varchar(255) DEFAULT NULL,
  `quicklink_photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `quicklink_thumb_photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `introduction` text,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  `thumb_photo` varchar(255) DEFAULT NULL,
  `photo_caption_heading` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo_caption` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `og_title` varchar(255) DEFAULT NULL,
  `og_meta_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `time_based_publishing` enum('N','Y') NOT NULL DEFAULT 'N',
  `publish_on` datetime DEFAULT NULL,
  `hide_on` datetime DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('A','H','D') DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `slideshow_id` int(11) DEFAULT NULL,
  `page_meta_index_id` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_meta_data`
--

INSERT INTO `page_meta_data` (`id`, `name`, `menu_label`, `footer_menu`, `heading`, `sub_heading`, `quicklink_heading`, `quicklink_menu_label`, `quicklink_photo`, `quicklink_thumb_photo`, `url`, `full_url`, `introduction`, `short_description`, `description`, `photo`, `thumb_photo`, `photo_caption_heading`, `photo_caption`, `title`, `meta_description`, `og_title`, `og_meta_description`, `og_image`, `time_based_publishing`, `publish_on`, `hide_on`, `is_locked`, `status`, `rank`, `date_created`, `date_updated`, `date_deleted`, `created_by`, `updated_by`, `gallery_id`, `slideshow_id`, `page_meta_index_id`) VALUES
(1, 'Home', 'Home', '', 'RTBS - perfect online booking system designed for activity and tour operators', '', '', '', '', '', 'home', '/', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquam libero vel erat facilisis, aliquam tincidunt urna tempor. Suspendisse quis efficitur eros.', '', NULL, '/library/whytewater/3.jpg', '/uploads/2018/03/img-5aa98b55c1629.jpg', '', 'Real Time Booking System for Activity and Tour Operators', 'Home | RTBS', '', '', '', '', 'N', NULL, NULL, 1, 'A', 1, '2016-03-17 11:10:30', '2018-03-14 21:51:34', NULL, 1, 1, 0, 24, 1),
(2, 'Pricing', 'Pricing', '', 'Pricing', '', '', '', '', '', 'pricing', '/pricing', '', '', NULL, '/library/whytewater/1.jpg', '/uploads/2018/03/img-5aa9aa7cc347f.jpg', '', '', 'Pricing | RTBS', 'Prepare yourself for stunning white water rafting adventures in New Zealand. Contact Tongariro River Rafting for whitewater rafting, family floats, rafting vacations', '', '', '', 'N', NULL, NULL, 0, 'A', 2, '2017-10-16 22:22:37', '2018-03-15 00:04:29', NULL, 1, 1, 26, 0, 1),
(3, 'Case Studies', 'Case Studies', '', 'Case Studies', '', '', '', '', '', 'case-studies', '/case-studies', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 3, '2017-10-16 22:30:06', '2018-03-15 00:04:59', NULL, 1, 1, 0, 0, 1),
(4, 'Packages', 'Packages', '', 'Packages', '', 'Packages', 'Explore', '/library/general/dscn7656.jpg', '/uploads/2017/12/img-5a2e32362b86b.jpg', 'packages', '/packages', 'Look below to browse our packages.', 'Maecenas vel lacus facilisis, consequat augue nec, viverra nisi. Phasellus lacinia, eros dictum varius faucibus, nisi arcu aliquam sem, ut dignissim justo neque in quam.', NULL, '/library/trr/trr-basic-selection/m-interesting-pics_32.jpg', '/uploads/2017/12/img-5a2e3235e0a48.jpg', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'D', 4, '2017-10-16 22:38:13', '2017-12-11 07:22:30', '2018-03-15 12:03:53', 1, 7, 0, 20, 1),
(5, 'Gallery', 'Gallery', '', 'Gallery', '', 'Explore Gallery', 'Explore', '/library/general/c-safety_70.jpg', '/uploads/2018/03/img-5aa9927b7d382.jpg', 'gallery', '/about/gallery', 'Peruse a wide range of beautiful photos', 'Aenean diam quam, scelerisque eget lorem in, pretium auctor ipsum. Praesent nec enim diam. Sed iaculis porta eros, vitae ornare leo sagittis vitae.', NULL, '/library/whytewater/1.jpg', '/uploads/2018/03/img-5aa9927acde2b.jpg', '', '', 'Gallery', '', '', '', '', 'N', NULL, NULL, 0, 'A', 5, '2017-10-16 22:38:28', '2018-03-14 22:22:03', NULL, 1, 1, 26, 0, 1),
(6, 'Location', 'Location', '', 'Location', '', 'Location', 'Explore', '/library/general/cliff-face-raft_03.jpg', '/uploads/2018/03/img-5aa84d5f64bb3.jpg', 'location', '/about/location', 'Weï¿½re easy to find.', 'Aliquam venenatis lorem eget accumsan congue. Nunc eget tincidunt velit, sed pharetra urna. Fusce lobortis eleifend risus, quis convallis orci venenatis et.', NULL, '/library/photos-2/img_0066.jpg', '/uploads/2018/03/img-5aa84d5f4201c.jpg', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 6, '2017-10-16 22:38:44', '2018-03-13 23:14:55', NULL, 1, 1, 2, 0, 1),
(7, 'About', 'About', '', 'About Us', '', '', '', '', '', 'about', '/about', 'These days every traveler is free and independent. With mountains of information at everybody\'s fingertips, there\'s never been a more dominant spirit of autonomy among the tourism sector\'s end users.', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 7, '2017-10-16 22:38:54', '2018-03-14 22:56:55', NULL, 1, 1, 0, 0, 1),
(8, 'Contact', 'Contact', '', 'Contact', '', '', '', '', '', 'contact', '/contact', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 8, '2017-10-16 22:39:22', '2018-03-14 23:31:39', NULL, 1, 1, 0, 0, 1),
(9, 'Terms & Conditions', '', 'Terms & Conditions', 'Terms & Conditions', '', '', '', '', '', 'terms-conditions', '/terms-conditions', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 11, '2017-10-16 22:40:42', '2017-11-03 01:24:52', NULL, 1, 1, 0, 0, 1),
(10, 'Privacy Policy', '', 'Privacy Policy', 'Privacy Policy', '', '', '', '', '', 'privacy-policy', '/privacy-policy', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 12, '2017-10-16 22:41:31', '2017-10-16 22:41:47', NULL, 1, 1, 0, 0, 1),
(11, '404', '', '', '404', '', '', '', '', '', '404', '/404', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 13, '2017-10-16 22:42:05', '2017-10-16 22:42:15', NULL, 1, 1, 0, 0, 1),
(12, 'Reviews', '', '', 'Reviews', '', '', '', '', '', 'reviews', '/reviews', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 9, '2017-10-16 22:42:48', '2017-10-16 22:43:12', NULL, 1, 1, 0, 0, 1),
(13, 'Booking', '', '', 'Booking', '', '', '', '', '', 'booking', '/booking', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 10, '2017-10-16 23:26:09', '2017-10-16 23:26:21', NULL, 1, 1, 0, 0, 1),
(14, 'Blog', 'Blog', '', 'Blog', '', 'Blog', 'Explore', '/library/gallery/dscn0329.jpg', '/uploads/2018/03/img-5aa99bb461b54.jpg', 'blog', '/about/blog', 'Below are our blogs.', 'Read our blog', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'A', 1, '2017-10-17 01:03:52', '2018-03-14 23:01:24', NULL, 1, 1, 0, 0, 1),
(15, 'Our Team', 'Our Team', '', 'Our Team', '', '', '', '', '', 'our-team', '/about/our-team', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'D', 2, '2017-10-17 01:04:14', '2017-10-28 08:41:55', '2018-03-15 12:03:42', 1, 1, 0, 0, 1),
(16, 'Lake Taupo Region', 'Lake Taupo Region', NULL, 'Lake Taupo Region', NULL, NULL, NULL, '', '', 'lake-region', '/category/lake-region', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 1, '2017-10-19 02:20:33', '2017-11-28 01:18:13', NULL, 1, 1, NULL, NULL, 1),
(17, 'Tongariro National Park', 'Tongariro National Park', NULL, 'Tongariro National Park', NULL, NULL, NULL, '', '', 'tongariro-national-park', '/category/tongariro-national-park', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 2, '2017-10-19 02:21:54', '2017-11-22 22:16:03', NULL, 1, 1, NULL, NULL, 1),
(18, 'Category 3', 'Category 3', NULL, 'Category 3', NULL, NULL, NULL, '', '', 'category-3', '/category/category-3', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'H', 3, '2017-10-19 02:22:11', '2017-10-19 02:22:19', NULL, 1, 1, NULL, NULL, 1),
(19, 'Category 4', 'Category 4', NULL, 'Category 4', NULL, NULL, NULL, '', '', 'category-4', '/category/category-4', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'H', 4, '2017-10-19 02:22:21', '2017-10-19 02:22:29', NULL, 1, 1, NULL, NULL, 1),
(20, 'Lorem ipsum dolor sit amet', NULL, NULL, 'Lorem ipsum dolor sit amet', NULL, NULL, NULL, '', '', 'lorem-ipsum-dolor-sit-amet', '/post/lorem-ipsum-dolor-sit-amet', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse gravida dictum sapien vitae tempor. Fusce suscipit odio posuere dapibus dapibus. Praesent nec feugiat ex, in laoreet lectus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse gravida dictum sapien vitae tempor. Fusce suscipit odio posuere dapibus dapibus. Praesent nec feugiat ex, in laoreet lectus. Aliquam mollis nulla massa, sed faucibus enim vestibulum bibendum. Aliquam efficitur nec metus quis porttitor. Nunc venenatis justo eget mattis porta. Fusce efficitur, urna non tempus ullamcorper, tortor ligula dignissim arcu, ut luctus sem dolor nec lectus. Morbi massa nibh, ullamcorper varius erat rhoncus, accumsan vehicula dui. Etiam mollis finibus laoreet. Sed fringilla diam tellus, sed elementum purus vulputate sodales.</p>\r\n\r\n<ul>\r\n	<li>Integer pulvinar mi ligula, non egestas metus accumsan quis.</li>\r\n	<li>Donec vestibulum finibus condimentum.</li>\r\n	<li>Nullam efficitur diam sem, sed interdum enim condimentum eu.</li>\r\n	<li>In eu est rhoncus, maximus lectus eu, accumsan erat.</li>\r\n	<li>Nunc semper est at egestas euismod.</li>\r\n	<li>Sed finibus quis lectus ut bibendum.</li>\r\n</ul>\r\n\r\n<p>Sed suscipit velit id rutrum vehicula. Integer eu posuere nibh. Aliquam et nunc lacus. Sed egestas dui ligula, quis luctus elit mollis ut. Nunc scelerisque arcu tincidunt volutpat tincidunt. In hac habitasse platea dictumst. Donec velit velit, accumsan quis magna non, pulvinar accumsan ante. Sed viverra felis a tincidunt euismod. Morbi sit amet commodo lacus.</p>\r\n\r\n<p>Morbi ut lectus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent erat neque, lobortis sed urna at, facilisis rhoncus odio. Suspendisse elementum vitae mauris et fermentum. Phasellus convallis tempus bibendum. Cras cursus quam eu velit feugiat rutrum. Integer faucibus sem sed quam faucibus, quis rutrum lectus euismod. Proin faucibus turpis vel lacus faucibus accumsan. Phasellus a ante bibendum, pellentesque lacus ac, pharetra leo. Ut dolor felis, luctus a maximus sed, lacinia id nibh. Ut vehicula libero et lorem lacinia facilisis. Sed consectetur ultrices condimentum.</p>', '/library/general/c-safety_70.jpg', '/uploads/2017/10/img-59e7f0cee0c5a.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-19 02:22:31', '2017-10-19 02:24:47', '2017-11-03 01:22:25', 1, 1, NULL, NULL, 1),
(21, 'Integer pulvinar mi ligula', NULL, NULL, 'Integer pulvinar mi ligula', NULL, NULL, NULL, '', '', 'integer-pulvinar-mi-ligula', '/post/integer-pulvinar-mi-ligula', NULL, 'Integer pulvinar mi ligula, non egestas metus accumsan quis. Donec vestibulum finibus condimentum. Nullam efficitur diam sem, sed interdum enim condimentum eu.', '<p>Integer pulvinar mi ligula, non egestas metus accumsan quis. Donec vestibulum finibus condimentum. Nullam efficitur diam sem, sed interdum enim condimentum eu. In eu est rhoncus, maximus lectus eu, accumsan erat. Nunc semper est at egestas euismod. Sed finibus quis lectus ut bibendum. Sed suscipit velit id rutrum vehicula. Integer eu posuere nibh. Aliquam et nunc lacus. Sed egestas dui ligula, quis luctus elit mollis ut. Nunc scelerisque arcu tincidunt volutpat tincidunt. In hac habitasse platea dictumst. Donec velit velit, accumsan quis magna non, pulvinar accumsan ante. Sed viverra felis a tincidunt euismod. Morbi sit amet commodo lacus.</p>\r\n\r\n<p>Morbi ut lectus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent erat neque, lobortis sed urna at, facilisis rhoncus odio. Suspendisse elementum vitae mauris et fermentum. Phasellus convallis tempus bibendum. Cras cursus quam eu velit feugiat rutrum. Integer faucibus sem sed quam faucibus, quis rutrum lectus euismod. Proin faucibus turpis vel lacus faucibus accumsan. Phasellus a ante bibendum, pellentesque lacus ac, pharetra leo. Ut dolor felis, luctus a maximus sed, lacinia id nibh. Ut vehicula libero et lorem lacinia facilisis. Sed consectetur ultrices condimentum.</p>', '/library/general/dscn7651.jpg', '/uploads/2017/10/img-59e7f0fd68958.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-19 02:24:48', '2017-10-19 02:25:33', '2017-11-03 01:22:25', 1, 1, NULL, NULL, 1),
(22, 'Nam pharetra enim in velit efficitur', NULL, NULL, 'Nam pharetra enim in velit efficitur', NULL, NULL, NULL, '', '', 'nam-pharetra-enim-in-velit-efficitur', '/post/nam-pharetra-enim-in-velit-efficitur', NULL, 'Nam pharetra enim in velit efficitur, vitae rutrum elit sagittis. Nulla iaculis ligula id magna placerat blandit. Maecenas fermentum, augue ac scelerisque ornare, arcu libero dignissim ante, nec consequat lectus mi ac eros.', '<p>Nam pharetra enim in velit efficitur, vitae rutrum elit sagittis. Nulla iaculis ligula id magna placerat blandit. Maecenas fermentum, augue ac scelerisque ornare, arcu libero dignissim ante, nec consequat lectus mi ac eros. Quisque et risus at nulla lobortis dapibus. Proin id congue lacus, ut ultricies elit. Mauris sit amet odio volutpat, semper turpis nec, consequat dolor. Fusce cursus, lorem dapibus scelerisque tempor, ligula libero consequat quam, et feugiat lectus quam ut dolor. Fusce rutrum ex id ligula mollis condimentum fermentum nec justo. Nunc vestibulum, urna nec volutpat tempor, dolor quam condimentum dolor, ut malesuada ex sapien sit amet ex. Nam imperdiet elit magna, sed tincidunt felis pellentesque vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet mi sed arcu sagittis faucibus sit amet quis metus. Proin eu dapibus orci. Ut vel vestibulum magna, a laoreet arcu. Aliquam interdum nunc non sodales sollicitudin. Mauris molestie rutrum libero, pharetra faucibus justo aliquet efficitur.</p>\r\n\r\n<p>Fusce lacus elit, bibendum id viverra quis, dictum ac sem. Fusce dictum blandit elit, quis placerat elit sagittis id. Nam fringilla lectus at urna euismod rutrum. Phasellus blandit felis mi, congue maximus nisi iaculis et. Donec vel rhoncus ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed tincidunt ac lectus a imperdiet. Ut ullamcorper dictum justo, a commodo leo.</p>', '/library/gallery/h-main-image_37.jpg', '/uploads/2017/10/img-59e7f12aafa0d.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-19 02:25:34', '2017-10-19 02:26:18', '2017-11-03 01:22:25', 1, 1, NULL, NULL, 1),
(23, 'In hac habitasse platea dictumst', NULL, NULL, 'In hac habitasse platea dictumst', NULL, NULL, NULL, '', '', 'in-hac-habitasse-platea-dictumst', '/post/in-hac-habitasse-platea-dictumst', NULL, 'In hac habitasse platea dictumst. Praesent fermentum mi dui, a venenatis metus mollis non. Fusce placerat libero vel ligula lacinia maximus. Curabitur porttitor eros bibendum libero vehicula, ultricies tempor diam ultrices.', '<p>In hac habitasse platea dictumst. Praesent fermentum mi dui, a venenatis metus mollis non. Fusce placerat libero vel ligula lacinia maximus. Curabitur porttitor eros bibendum libero vehicula, ultricies tempor diam ultrices. Suspendisse sollicitudin commodo auctor. Vivamus posuere nulla quis diam tincidunt, et scelerisque erat congue. Praesent at ligula quis augue dapibus placerat. Phasellus ligula sapien, vestibulum a fringilla eget, feugiat sed tellus. Ut lacus massa, pharetra sollicitudin enim a, ultrices accumsan augue. Aliquam varius non mauris a semper. Vivamus volutpat velit a enim vulputate tristique. Proin et augue tincidunt, commodo ligula nec, pretium ante. Suspendisse magna tortor, egestas in eros et, gravida ultrices ante. Nullam fermentum metus et mi cursus viverra non id augue. Cras tristique id arcu ut commodo. Mauris a orci lacus.</p>\r\n\r\n<p>Proin in leo sed lectus varius aliquet. Donec sed cursus diam. Nam aliquet dolor a ipsum pharetra, vel posuere elit vulputate. Morbi tristique porttitor condimentum. Mauris pretium, tortor vitae facilisis euismod, ex metus tristique velit, non placerat est velit id mauris. Nam sit amet mauris varius dolor tempor aliquam vitae eu est. Sed felis nibh, vehicula sed blandit non, bibendum eget augue. Praesent id efficitur felis. Vestibulum lacinia neque eget leo mattis aliquam.</p>', '/library/general/jumping_40.jpg', '/uploads/2017/10/img-59e7f165379ac.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-19 02:26:25', '2017-10-19 02:27:17', '2017-11-03 01:22:25', 1, 1, NULL, NULL, 1),
(24, 'Some of our favourite things to do in Taupo', NULL, NULL, 'Some of our favourite things to do in Taupo', NULL, NULL, NULL, '', '', 'some-of-our-favourite-things-to-do-in-taupo', '/post/some-of-our-favourite-things-to-do-in-taupo', NULL, '', '<p>We&rsquo;re often asked by our visitors for our recommendations on what else they can do in Taupo and Turangi after they&rsquo;ve been rafting.&nbsp; We are super fortunate to live in suchTaupo Tandem Skydiving an amazing region that is blessed with not only an incredible array of natural beauty but also some pretty awesome tourism activities too.<br />\r\nMost of us love adventure (that&rsquo;s why we love rafting), so the adventure activities tend to rate pretty highly on our list.&nbsp; After all, you&rsquo;re on holidays so you may as well try something new right?</p>\r\n\r\n<p><br />\r\nSome of our favourites include:</p>\r\n\r\n<p><br />\r\nSkydiving:&nbsp; &nbsp;Yep, you can throw yourself out of a plane from up to 15,000ft (that&rsquo;s high!) with our friends at Taupo Tandem Skydiving.&nbsp; On a clear day, you can see coast to coast and it&rsquo;s probably the best perspective you&rsquo;ll get of just how big Great Lake Taupo is.&nbsp; It is tandem skydiving so you will have a jumpmaster strapped to your back pulling all the right strings to ensure you land back on the ground safely.&nbsp; &nbsp;These guys are highly professional, have been doing this for years and like us, they LOVE what they do.Taupo Bungy</p>\r\n\r\n<p><br />\r\nBungy:&nbsp; This crazy adventure was pioneered here in New Zealand and Taupo Bungy has the highest water touch in the country &ndash; but you don&rsquo;t have to touch the water if you don&rsquo;t want to.&nbsp; The setting over the Waikato River is stunning, it&rsquo;s worth a drive down just to watch if you&rsquo;re feeling a bit scared, but we reckon once you&rsquo;ve seen a few people have a go, you&rsquo;ll be lining up yourself.&nbsp; There was once a myth that international visitors weren&rsquo;t allowed to leave New Zealand until they had a bungy stamp in their passport &ndash; it&rsquo;s just what we do in NZ!</p>\r\n\r\n<p><br />\r\nHukafalls JetJet Boating:&nbsp; Another amazing NZ invention.&nbsp; These boats were designed to travel in just 10cms of water, and you can find them operating on most of the major rivers around the country. Hukafalls Jet is the only one that takes you to the base of Huka Falls &ndash; which is NZ&rsquo;s most visited natural attraction, so we think that&rsquo;s pretty cool.&nbsp; &nbsp;When you&rsquo;re at the base of the falls, you sit in the bubbles and feel the force of the 300,000 cubic litres of water per second pour over the drop.&nbsp; You&rsquo;ll do up to 14 (!!) 360 degree spins along the way and your jet boat pilot is bound to have a few stories to tell you.</p>\r\n\r\n<p><br />\r\nFloatplane: Take off and land on the Great Lake &ndash; this is a once in a lifetime experience that everyone should have.&nbsp; Taupo&rsquo;s Floatplane is located right on the lakefront and you will often hear it before you see it.&nbsp; They do some really cool scenic flights over the lake, there is also one that flies you over the Tongariro National Park mountains!&nbsp; They also combo with us so you can fly from Taupo and arrive in style by floatplane for your rafting trip.&nbsp; &lsquo;Oarsome&rsquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks for reading!</p>', '/library/whytewater/5.jpg', '/uploads/2018/03/img-5aa99ad19b686.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', NULL, '2017-10-19 02:27:19', '2018-03-14 22:57:37', NULL, 1, 1, NULL, NULL, 1),
(25, 'Morbi et quam nec nisi placerat aliquet', NULL, NULL, 'Morbi et quam nec nisi placerat aliquet', NULL, NULL, NULL, '', '', 'morbi-et-quam-nec-nisi-placerat-aliquet', '/post/morbi-et-quam-nec-nisi-placerat-aliquet', NULL, 'Morbi et quam nec nisi placerat aliquet. Aliquam elit risus, lobortis vitae lectus et, porttitor dapibus leo. Quisque rhoncus ultrices ornare. Cras non quam eu est placerat tincidunt.', '<p>Morbi et quam nec nisi placerat aliquet. Aliquam elit risus, lobortis vitae lectus et, porttitor dapibus leo. Quisque rhoncus ultrices ornare. Cras non quam eu est placerat tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam sagittis elementum massa, vitae ultricies dolor dignissim a. Nulla tristique sem vitae dolor lacinia varius. Aenean et consequat ex. In dictum vestibulum lectus, ut porta dolor varius at. Nullam a enim orci. Cras ullamcorper nibh vitae sodales eleifend. Quisque faucibus, neque sed scelerisque bibendum, nibh velit commodo justo, vitae iaculis augue purus sit amet lacus. Aenean tempus magna sit amet auctor auctor. Aenean eget rhoncus felis.</p>\r\n\r\n<p>Vivamus cursus, justo nec finibus mollis, ante diam scelerisque lorem, ac placerat ante magna quis neque. Pellentesque eu augue lacinia quam tempus fermentum id in arcu. Pellentesque eu metus eros. Curabitur vestibulum aliquet ullamcorper. Phasellus diam lacus, tempor in odio ut, placerat faucibus justo. Duis nec varius lectus, in ultrices purus. Fusce non magna vel dolor tempus fermentum. Ut in rutrum elit. Fusce et libero vestibulum, rutrum diam sit amet, posuere eros. In ligula ex, tristique quis metus interdum, condimentum mattis arcu. Cras imperdiet cursus tempor.</p>', '/library/general/img_0057.jpg', '/uploads/2017/10/img-59e7f1b6ab2a2.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-19 02:27:58', '2017-10-19 02:28:38', '2017-11-03 01:22:25', 1, 1, NULL, NULL, 1),
(26, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-10-19 22:20:23', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'H', NULL, '2017-10-19 22:20:23', '2017-10-19 22:20:23', NULL, 1, NULL, NULL, NULL, 1),
(27, 'Whitewater Rafting', 'Whitewater Rafting', NULL, 'Whitewater Rafting', NULL, NULL, NULL, '', '', 'whitewater-rafting', '/pricing/whitewater-rafting', 'You\'ll start your unforgettable adventure with an on-shore safety briefing and paddle instructions with one of our experienced guides. You and the rest of the crew will then begin your white water rafting journey on grade 3 rapids - an ideal grade for experienced paddlers or first-time rafters.', 'You\'ll start your unforgettable adventure with an on-shore safety briefing and paddle instructions with one of our experienced guides. You and the rest of the crew will then begin your white water rafting journey on grade 3 rapids - an ideal grade for exp', NULL, '/library/whitewater-photos/rapids_44-2.jpg', '/uploads/2018/03/img-5aa986f61ed42.jpg', '', '', 'White Water Rafting | Things to do in Taupo | Tongariro River Rafting', 'Experience world-class white water rafting, one of the most stunning water adventure to do in Taupo New Zealand, with Tongariro River Rafting', 'White Water Rafting | Things to do in Taupo and Turangi | Tongariro River Rafting', NULL, '/library/trr/trr-shoots-1-and-2/h-main-image_13.jpg', 'N', NULL, NULL, 0, 'A', 1, '2017-10-19 22:22:23', '2018-03-14 21:32:54', NULL, 1, 1, 7, 0, 1),
(28, 'Family Floats', 'Family Floats', NULL, 'Family Floats', NULL, NULL, NULL, '', '', 'family-floats', '/rafting-adventures/family-floats', 'Every rapid tells a story - you\'ve just got to know how to read it.', 'The magic of rafting comes alive for first time rafters, those who prefer a gentler pace and children. You still get to paddle and there are some small rapids to navigate but nothing too wet or wild.', NULL, '/library/family-photos/garth-ff/img_7351.jpg', '/uploads/2017/12/img-5a397feb69dec.jpg', '', '', 'Family Floats | Family Activities Taupo | Tongariro River Rafting', 'If you’d like a gentler, family-friendly experience join us for a leisurely water rafting experience on the calmer sections of the Tongariro river', 'Family Floats | Family Activities Taupo | Tongariro River Rafting', NULL, '', 'N', NULL, NULL, 0, 'A', 2, '2017-10-20 02:06:58', '2017-12-19 21:08:59', NULL, 1, 6, 6, 0, 1),
(29, 'Natural Flow days', 'Natural Flow days', NULL, 'Natural Flow days', NULL, NULL, NULL, '', '', 'natural-flow-days-tour', '/rafting-adventures/natural-flow-days-tour', 'On natural flow days, the power companies that control the hydro generation on these rivers stop diverting water to their power stations.', 'This extra flow of water down a river makes for a seriously exciting ride and gives you a taste of how awesome these rivers used to be. Traversing these natural flows for the ultimate Taupo activities.', NULL, '/library/trr/trr-shoots-1-and-2/access-14/img_5961.jpg', '/uploads/2018/01/img-5a5bd62ae9edf.jpg', '', 'Steep Fast Furious Fun Just the way it should be', 'Natural Flow days', '', '', NULL, '', 'N', NULL, NULL, 0, 'H', 3, '2017-10-20 04:09:37', '2018-01-14 22:14:03', NULL, 1, 1, 12, 0, 1),
(30, 'Test page', 'Test page', 'Test page', 'Test page', '', 'Test page', 'Discover', '/library/family-photos/dscn0010.jpg', '/uploads/2017/10/img-59efc1ec8e7df.jpg', 'test-page', '/about/test-page', 'Test page', 'Test page', NULL, '/library/family-photos/dscn0015.jpg', '/uploads/2017/10/img-59efc1ec5126f.jpg', '', 'Test page', 'Test page', '', '', '', '', 'N', NULL, NULL, 0, 'D', 14, '2017-10-24 22:38:15', '2017-10-24 22:42:52', '2017-10-24 22:43:27', 1, 1, 2, 8, 1),
(31, 'test tour', 'test tour', NULL, 'test tour', NULL, NULL, NULL, '', '', 'test-tour', '/rafting-adventures/test-tour', 'test tour', 'test tour', NULL, '/library/family-photos/dscn0010.jpg', '/uploads/2017/10/img-59efc3850218b.jpg', 'Test tour', 'Test tour', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', 4, '2017-10-24 22:43:56', '2017-10-24 22:49:41', '2017-10-24 23:06:10', 1, 1, 2, 8, 1),
(32, 'Test blog', NULL, NULL, 'Test blog', NULL, NULL, NULL, '', '', 'test-review', '/post/test-review', NULL, 'Test review', '<p>Test review</p>', '/library/photos-1/dscn7804.jpg', '/uploads/2017/10/img-59efc46e9c4ff.jpg', '', '', 'Test review', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-24 22:52:40', '2017-10-24 22:53:34', '2017-11-03 01:22:14', 1, 1, NULL, NULL, 1),
(33, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-10-24 23:00:06', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', NULL, '2017-10-24 23:00:06', '2017-10-24 23:00:06', '2017-10-24 23:00:17', 2, NULL, NULL, NULL, 1),
(34, 'Test Kirsten', 'Test Kirsten', '', 'Test Kirsten', '', '', '', '', '', 'test-kirsten', '/test-kirsten', 'Test Kirsten', '', NULL, '/library/whitewater-photos/dscn7942.jpg', '/uploads/2017/10/img-59f246b2ee071.jpg', '', 'Test Kirsten', 'Test Kirsten', 'Test Kirsten', '', '', '', 'N', NULL, NULL, 0, 'D', 0, '2017-10-26 20:14:32', '2017-10-26 20:33:55', '2017-10-26 20:34:14', 1, 1, 7, 0, 1),
(35, 'teste', 'teste', 'teste', 'TestE', '', 'Teste', '', '', '', 'teste', '/teste', 'testst', '', NULL, '', '', '', '', 'Teste', '', '', '', '', 'N', NULL, NULL, 0, 'D', 0, '2017-10-26 20:15:01', '2017-10-26 20:18:58', '2017-10-26 20:20:23', 1, 1, 0, 0, 1),
(36, 'Thurston C', 'Thurston C', NULL, 'Thurston C', NULL, NULL, NULL, '', '', 'thurston-c', '/rafting-adventures/thurston-c', 'Thurston C', 'Thurston C\r\nThurston C\r\nThurston C', NULL, '/library/family-photos/dscn0003.jpg', '/uploads/2017/10/img-59f2460eb3f5a.jpg', '', '', 'Thurston C', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', 0, '2017-10-26 20:28:48', '2017-10-26 20:31:10', '2017-10-26 20:31:30', 1, 1, 3, 0, 1),
(37, 'test e', 'test e', '', 'test e', '', 'test e', '', '', '', 'test-e', '/test-e', 'fgfghfhfh', '', NULL, '', '', '', '', 'test e', '', '', '', '', 'N', NULL, NULL, 0, 'D', 16, '2017-10-26 20:32:24', '2017-10-26 20:33:34', '2017-10-26 20:34:18', 1, 1, 0, 0, 1),
(38, 'Mountain Biking', 'Mountain Biking', NULL, 'Mountain Biking', NULL, NULL, NULL, '', '', 'mountain-biking', '/other-adventures/mountain-biking', 'We’re Southern Lake Taupo’s most experienced mountain bike operator. We’ve been doing this since retro helmets were just helmets!', 'Bring your own bike or rent one of ours for two hours, a half-day or full day. All our rental mountain bikes are late models. Kid sized mountain bikes are available too.', NULL, '/library/mountain-biking/tongariro-river-track.jpg', '/uploads/2017/12/img-5a3175d333605.jpg', '', '', 'Mountain Biking | Tongariro River Rafting', 'Mountain Biking', '', NULL, '', 'N', NULL, NULL, 0, 'A', 5, '2017-10-26 21:38:03', '2017-12-13 18:47:47', NULL, 1, 1, 13, 0, 1),
(39, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-10-26 22:03:03', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', 0, '2017-10-26 22:03:03', '2017-10-26 22:03:03', '2017-10-28 08:50:07', 1, NULL, NULL, NULL, 1),
(40, 'Rafting Vacations', 'Rafting Vacations', NULL, 'Rafting Vacations', NULL, NULL, NULL, '', '', 'rafting-vacations', '/rafting-adventures/rafting-vacations', 'There is something magical about an overnight rafting trip. Good friends, good food, plenty of laughs and the sound of a wilderness river burbling under the stars in the background. Memories are made of this.\r\n\r\nTrips can be put together to suit any size group on the Tongariro and Mohaka headwaters. Your white water rafting adventure can be anywhere from 2 half days to 4 days long depending on how intrepid you and your crew are!', 'There is something magical about an overnight rafting trip. Good friends, good food, plenty of laughs and the sound of a wilderness river burbling under the stars in the background. Memories are made of this.', NULL, '/library/rafting-vacations/_mg_2590.jpg', '/uploads/2017/12/img-5a2b18aac34ff.jpg', 'Rafting fun', 'Nothing better than taking a vacation with us!', 'Rafting Vacations New Zealand | Tongariro River Rafting', 'Check out the Rafting Vacation options offered by Tongariro River Rafting, that includes dinner, bed & breakfast, Upper Mohaka wilderness trip & more. Talk to us now!', 'Rafting Vacations New Zealand | Tongariro River Rafting', NULL, '', 'N', NULL, NULL, 0, 'A', 4, '2017-10-26 22:05:06', '2017-12-08 22:56:43', NULL, 1, 7, 14, 0, 1),
(41, 'Mountain Biking', 'Mountain Biking Adventures', '', 'Mountain Biking', '', '', '', '', '', 'mountain-biking-adventures', '/rafting-adventures/mountain-biking-adventures', 'We’re Southern Lake Taupo’s most experienced mountain bike operator. We’ve been doing this since retro helmets were just helmets!', '', NULL, '', '', '', '', 'Mountain Biking', '', '', '', '', 'N', NULL, NULL, 0, 'D', 1, '2017-10-26 22:27:44', '2017-10-26 22:32:17', '2017-10-26 22:43:59', 1, 1, 0, 0, 1),
(42, 'H2-OHH', 'H2-OHH', NULL, 'H2-OHH', NULL, NULL, NULL, '', '', 'h2-ohh', '/packages/h2-ohh', 'Lake Taupo\'s most exciting white water adventure. Hukafalls Jet and Rafting Combo', 'Lake Taupo\'s most exciting white water adventure. Hukafalls Jet and Rafting Combo', NULL, '/library/h2ohh-2.jpg', '/uploads/2017/12/img-5a2d7ca8471ae.jpg', 'H2-OHH', '', 'H2-OHH | Tongariro River Rafting', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 7, '2017-10-26 22:50:55', '2017-12-10 18:27:52', NULL, 1, 7, 16, 0, 1),
(43, 'Tongariro Duo', 'Tongariro Duo', NULL, 'Tongariro Duo', NULL, NULL, NULL, '', '', 'tongariro-duo', '/packages/tongariro-duo', 'Come and enjoy The Tree Trunk Gorge track, which is a beautiful track that weaves its way through native forest, with a short steep climb, a picturesque river ford and some wooden bridges en route. Once out of the bush you will bike down to the Poutu Intake on the Tongariro River where you will have lunch before enjoying a rafting experience that combines the heart pumping action of more than 60 rapids with sufficient lower grade water that enables the splendid scenery and ample wildlife to be enjoyed.', '', NULL, '/library/whitewater-photos/img_0016.jpg', '/uploads/2017/12/img-5a3176486eaa6.jpg', '', '', 'Tongariro Duo | Tongariro River Rafting', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 8, '2017-10-26 23:01:17', '2017-12-13 18:49:44', NULL, 1, 1, 17, 0, 1),
(44, 'The Big Splash', 'The Big Splash', NULL, 'The Big Splash', NULL, NULL, NULL, '', '', 'the-big-splash', '/packages/the-big-splash', 'The Big Splash is about being WET in the summer and COOL in the winter, by doing a wicked combination of bungy jumping and rafting. With two locally owned and operated companies, we offer an action-packed day, that’s on the wild side!', 'The Big Splash is about being WET in the summer and COOL in the winter, by doing a wicked combination of bungy jumping and rafting. With two locally owned and operated companies, we offer an action-packed day, that’s on the wild side!', NULL, '/library/big-splash-logo.png', '/uploads/2017/12/img-5a2e2d65ddaca.jpg', '', '', 'The Big Splash', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 9, '2017-10-26 23:08:22', '2017-12-11 07:01:57', NULL, 1, 7, 23, 0, 1),
(45, 'Fly ‘n Raft', 'Fly ‘n Raft', NULL, 'Fly \'n Raft', NULL, NULL, NULL, '', '', 'fly-n-raft', '/packages/fly-n-raft', 'Enjoy an exciting and scenic 20 minute flight in Taupo’s Floatplane to the southern end of Lake Taupo, taking in the awe inspiring scenery of the great lake (yes, it really is that big) and the central plateau, catching glimpses of the mighty mountains of Tongariro National Park. Spend the afternoon whitewater rafting on the Tongariro River—one of the best rafting adventures in New Zealand.', 'Enjoy an exciting and scenic 20 minute flight in Taupo’s Floatplane to the southern end of Lake Taupo, taking in the awe inspiring scenery of the great lake (yes, it really is that big) and the central plateau, catching glimpses of the mighty mountains of', NULL, '/library/flynraft_new-page-001.jpg', '/uploads/2017/12/img-5a2b149443f54.jpg', '', '', 'Fly ‘n Raft', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 10, '2017-10-26 23:20:06', '2017-12-08 22:39:16', NULL, 1, 7, 0, 0, 1),
(46, 'Duck N Dive', 'Duck N Dive', NULL, 'Duck N Dive', NULL, NULL, NULL, '', '', 'duck-n-dive', '/packages/duck-n-dive', 'The Ultimate Adrenalin rush – skydiving and white water rafting in the stunning Lake Taupo region.  Two of Lake Taupo’s iconic activities have come together to offer you an incredible day out. Experience 45 mind-blowing seconds of freefall and take in the awesome views of Lake Taupo and out to the coast (if you can open your eyes) at speeds of up to 200km/hr!  Skydiving in Taupo is world famous so it’s certainly on the must do list!  Combo that up with one of NZ’s unmissable aquatic adventures (named by Lonely Planet in May 2015) and raft the Tongariro River, and you can hardly go wrong.\r\n\r\nThese are two activities all visitors to Taupo should tick off and when you book them together, you save!', 'The Ultimate Adrenalin rush – skydiving and white water rafting in the stunning Lake Taupo region. Two of Lake Taupo’s iconic activities have come together to offer you an incredible day out.', NULL, '/library/duck-n-dive-logo.jpg', '/uploads/2017/12/img-5a2b127881e8e.jpg', '', '', 'Duck N Dive | Tongariro River Rafting', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', 11, '2017-10-27 00:23:52', '2017-12-08 22:30:16', NULL, 1, 7, 0, 0, 1),
(47, 'Fishing', 'Fishing', NULL, 'Fishing', NULL, NULL, NULL, '', '', 'fishing', '/other-adventures/fishing', '', 'The Tongariro River is world famous for its trout fishing. Most of the upper river however can only be reached by kayak or raft.', NULL, '/library/general/img_1897_cropped.jpg', '/uploads/2017/12/img-5a2b1a803456d.jpg', '', '', 'NZ Fishing | Trout, Raft, Fly fishing | Tongariro River Rafting', 'The Turangi/Taupo area is renowned for its trout fishing, we at Tongariro river rafting can help you out whether you’re after raft or fly fishing.', 'NZ Fishing | Trout, Raft, Fly fishing | Tongariro River Rafting', NULL, '', 'N', NULL, NULL, 0, 'A', 6, '2017-10-27 00:31:32', '2017-12-08 23:04:32', NULL, 1, 7, 4, 0, 1),
(48, 'Test Category', 'Test Category', NULL, 'Test Category', NULL, NULL, NULL, '', '', 'test-category', '/category/test-category', NULL, NULL, NULL, '', NULL, '', '', 'Test Category', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', 5, '2017-10-28 08:25:23', '2017-10-28 08:25:36', '2017-11-03 01:22:46', 1, 1, NULL, NULL, 1),
(49, 'Testing blog post', NULL, NULL, 'Testing blog post', NULL, NULL, NULL, '', '', 'testing-blog-post', '/post/testing-blog-post', NULL, 'Testing blog post', '<p>Testing blog post</p>\r\n\r\n<p><img alt=\"\" src=\"/library/whitewater-photos/img_0017.jpg\" /></p>', '/library/whitewater-photos/img_0002.jpg', '/uploads/2017/10/img-59f44072383f9.jpg', '', '', 'Testing blog post', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', NULL, '2017-10-28 08:30:55', '2017-10-28 08:31:46', '2017-11-03 01:22:10', 1, 1, NULL, NULL, 1),
(50, 'Testing page', 'Testing page', 'Testing page', 'Testing page', '', 'Testing page', 'Discover', '/library/whitewater-photos/img_0002.jpg', '/uploads/2017/10/img-59f446a56b02d.jpg', 'testing-page', '/testing-page', 'Intro', 'Testing page', NULL, '/library/whitewater-photos/img_0001.jpg', '/uploads/2017/10/img-59f446a52d270.jpg', '', 'Testing page caption', 'Testing page', '', '', '', '', 'N', NULL, NULL, 0, 'D', 15, '2017-10-28 08:45:54', '2017-10-28 08:58:13', '2017-10-28 08:58:46', 1, 1, 0, 0, 1),
(51, 'Testing Tour', 'Testing Tour', NULL, 'Testing Tour', NULL, NULL, NULL, '', '', 'testing-tour', '/testing-page/testing-tour', 'introduction', 'short description', NULL, '/library/whitewater-photos/img_0001.jpg', '/uploads/2017/10/img-59f4466560623.jpg', 'Heroshot heading', 'Heroshot caption', 'Testing Tour', '', '', NULL, '', 'N', NULL, NULL, 0, 'D', 15, '2017-10-28 08:50:12', '2017-10-28 08:57:09', '2017-10-28 08:58:41', 1, 1, 3, 0, 1),
(52, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-11-13 03:15:49', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'H', NULL, '2017-11-13 03:15:49', '2017-11-13 03:15:49', NULL, 1, NULL, NULL, NULL, 1),
(53, 'Hot Deals', 'Hot Deals', '', 'Hot Deals', '', 'Hot Deals', 'Current Promotions', '/library/photos-1/img_0026.jpg', '/uploads/2017/11/img-5a1c766f79652.jpg', 'hot-deals', '/about/hot-deals', 'Check out our current hot deals and promotions!', '', NULL, '', '', '', '', 'Hot Deals | Tongariro River Rafting', '', '', '', '', 'N', NULL, NULL, 0, 'D', 3, '2017-11-13 03:18:37', '2017-11-27 20:32:47', '2018-03-15 12:03:44', 1, 1, 0, 1, 1),
(54, 'Snow White Combo Package', '', '', '', '', '', '', '', '', 'snow-white-combo-package', '/about/hot-deals-and-promotions/snow-white-combo-package', '', '', NULL, '', '', '', '', 'Snow Play White Water Combo | Tongariro River Rafting NZ', 'This winter, bring your family along to experience two of the top winter activities in the Taupo district. Mix snow and white water to have the ultimate family adventure!', 'Snow Play White Water Combo | Tongariro River Rafting NZ', '', '', 'N', NULL, NULL, 0, 'D', 1, '2017-11-14 19:58:35', '2017-11-21 01:48:28', '2018-03-15 12:03:42', 1, 1, 0, 0, 1),
(55, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-11-14 20:51:38', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', NULL, '2017-11-14 20:51:38', '2017-11-14 20:51:38', '2017-11-14 20:55:06', 1, NULL, NULL, NULL, 1),
(56, 'Untitled', '', NULL, '', NULL, NULL, NULL, '', '', '2017-11-14-205500', '/2017-11-14-205500', '', '', NULL, '', '', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'H', NULL, '2017-11-14 20:55:00', '2017-11-14 20:55:02', NULL, 1, 1, 0, 0, 1),
(57, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2017-11-22 21:59:36', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'H', NULL, '2017-11-22 21:59:36', '2017-11-22 21:59:36', NULL, 1, NULL, NULL, NULL, 1),
(58, 'test', 'test', 'test', 'test', '', '', '', '', '', 'test-kirsten', '/test-kirsten', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'D', 14, '2017-11-27 20:34:14', '2017-11-27 20:34:26', '2018-03-15 12:03:53', 1, 1, 0, 0, 1),
(59, NULL, NULL, NULL, 'Untitled post', NULL, NULL, NULL, '', '', '2017-11-27 20:40:42', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'H', NULL, '2017-11-27 20:40:42', '2017-11-27 20:40:42', NULL, 1, NULL, NULL, NULL, 1),
(60, 'super secret deals', '', '', 'Super Secret Deals', '', '', '', '', '', 'super-secret-deals', '/super-secret-deals', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'D', 14, '2017-12-06 20:33:42', '2017-12-06 20:34:11', '2018-03-15 12:03:53', 1, 1, 0, 0, 1),
(61, 'Blog post', NULL, NULL, 'Blog post', NULL, NULL, NULL, '', '', 'blog-post', '/post/blog-post', NULL, '', '', '/library/whytewater/1.jpg', '/uploads/2018/03/img-5aa99acb986e5.jpg', '', '', '', '', '', NULL, '', 'N', NULL, NULL, 0, 'A', NULL, '2017-12-06 20:42:58', '2018-03-14 22:57:32', NULL, 1, 1, NULL, NULL, 1),
(62, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2018-01-14 22:13:28', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', 0, '2018-01-14 22:13:28', '2018-01-14 22:13:28', '2018-03-15 12:03:53', 1, NULL, NULL, NULL, 1),
(63, 'Natural Flow Days', 'Natural Flow Days', '', 'Natural Flow Days', '', '', '', '', '', 'natural-flow-days', '/rafting-adventures/natural-flow-days', '', '', NULL, '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, 0, 'D', 1, '2018-01-14 22:14:07', '2018-01-14 23:24:27', '2018-03-15 12:03:36', 1, 1, 0, 0, 1),
(64, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2018-01-14 23:13:16', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', NULL, '2018-01-14 23:13:16', '2018-01-14 23:13:16', '2018-03-15 12:03:53', 1, NULL, NULL, NULL, 1),
(65, 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2018-03-14 22:08:56', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 0, 'D', NULL, '2018-03-14 22:08:56', '2018-03-14 22:08:56', '2018-03-15 12:03:53', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_meta_index`
--

CREATE TABLE `page_meta_index` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_meta_index`
--

INSERT INTO `page_meta_index` (`id`, `name`, `value`, `title`) VALUES
(1, 'Index and Follow (Default)', 'all', 'Use this if you want to let search engines do their normal job.'),
(2, 'Do not Index or Follow', 'none', 'This is for sections of a site that shouldn\'t be indexed and shouldn\'t have links followed.'),
(3, 'Follow, but do not Index', 'noindex, follow', 'Search engine robots can follow any links on this page but will not include this page.'),
(4, 'Index but do not Follow', 'index, nofollow', 'Search engine robots should include this page but not follow any links on this page.'),
(5, 'Do not archive', 'noarchive', 'Useful if the content changes frequently: headlines, auctions, etc. The search engine still archives the information, but won\'t show it in the results.');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_transaction`
--

CREATE TABLE `paypal_transaction` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(15) DEFAULT NULL,
  `payer_id` varchar(50) NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL COMMENT 'Credit card transaction fee',
  `total_amount` decimal(10,2) NOT NULL COMMENT 'Sum of amount_excl_gst, gst_amount and processing_fee.',
  `mc_gross` decimal(10,2) NOT NULL COMMENT 'Final Total Amount transferred to receiver''s account',
  `mc_fee` decimal(10,2) NOT NULL,
  `mc_currency` varchar(5) NOT NULL,
  `description` text,
  `request_url` text NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `payment_type` varchar(50) NOT NULL,
  `payer_status` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `payment_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paypal_transaction`
--

INSERT INTO `paypal_transaction` (`id`, `txn_id`, `payer_id`, `processing_fee`, `total_amount`, `mc_gross`, `mc_fee`, `mc_currency`, `description`, `request_url`, `payment_status`, `payment_type`, `payer_status`, `created_on`, `payment_date_time`) VALUES
(1, '66515057HS85018', 'HCQPEEETYX8TG', '3.21', '131.21', '131.21', '4.91', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3D3750c66424&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3D3750c66424&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-24 14:06:44', '2016-05-24 14:10:27'),
(2, '1P3383572038757', 'HCQPEEETYX8TG', '8.63', '353.63', '353.63', '12.47', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26px-response%3Db373eabb80&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26ce-token%3Db373eabb80&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-26 18:25:13', '2016-05-26 18:25:49'),
(3, '5XX60241F038733', 'HCQPEEETYX8TG', '18.69', '766.19', '766.19', '26.50', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3Da4f7f8ea12%26px-response%3D8b3b1f544f&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3Da4f7f8ea12%26ce-token%3D8b3b1f544f&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Chris&last_name=Elliot&address1=&address2=&city=&state=&zip=&email=chris%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-27 09:43:43', '2016-05-27 09:45:35'),
(4, '48V461893A01661', 'HCQPEEETYX8TG', '68.11', '2792.11', '2792.11', '95.38', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Df8981d67da&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Df8981d67da&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Bob&last_name=Smith&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-27 10:00:55', '2016-05-27 10:01:47'),
(5, '60E89017R284009', 'HCQPEEETYX8TG', '8.63', '353.63', '353.63', '12.47', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26px-response%3Df7f8b3fb72&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26ce-token%3Df7f8b3fb72&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Thomas&last_name=Gates&address1=&address2=&city=&state=&zip=&email=tombhs7%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-27 14:04:26', '2016-05-27 14:15:03'),
(6, '8AC38424HH93710', 'HCQPEEETYX8TG', '4.11', '168.56', '168.56', '6.18', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D057707bfee%26px-response%3Dc23d399781&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D057707bfee%26ce-token%3Dc23d399781&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-27 14:45:25', '2016-05-27 14:46:18'),
(7, '0F323311F267343', 'HCQPEEETYX8TG', '2.96', '120.96', '120.96', '4.56', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Dee9c78abb6&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Dee9c78abb6&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Jack&last_name=Sparrow&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-05-28 15:23:17', '2016-05-28 15:24:06'),
(8, NULL, '', '1.23', '50.23', '0.00', '0.00', '', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Da9d1fb94ca&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Da9d1fb94ca&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Courtney&last_name=Tomahawk&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-06-02 11:59:31', NULL),
(9, NULL, '', '5.61', '229.86', '0.00', '0.00', '', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3De8fb555287%26px-response%3D86ceb25a98&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3De8fb555287%26ce-token%3D86ceb25a98&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-06-08 11:48:07', NULL),
(10, '8RN18388DB12893', 'HCQPEEETYX8TG', '5.00', '205.00', '205.00', '7.42', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fstage.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fstage.first-training.co.nz%2Fregister%3Ftoken%3D2254c52cec%26px-response%3D24e8a8726b&cancel_return=http%3A%2F%2Fstage.first-training.co.nz%2Fregister%3Ftoken%3D2254c52cec%26ce-token%3D24e8a8726b&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-08-01 13:53:25', '2016-08-01 13:54:48'),
(11, NULL, '', '4.11', '168.56', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26px-response%3D0f00669bce&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26ce-token%3D0f00669bce&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Tomahawk&last_name=Test&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-19 09:32:43', NULL),
(12, NULL, '', '8.37', '343.02', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26px-response%3D85c298369d&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26ce-token%3D85c298369d&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Toby&last_name=Casey&address1=&address2=&city=&state=&zip=&email=tobycasey%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-20 11:06:04', NULL),
(13, NULL, '', '4.11', '168.56', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26px-response%3D2ef3f38ad1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26ce-token%3D2ef3f38ad1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Ariana&last_name=Andrews&address1=&address2=&city=&state=&zip=&email=Ariana.kathy.Andrews%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-21 08:28:03', NULL),
(14, NULL, '', '1.23', '50.23', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fcart%3Fpx-response%3Dbdfc8b5347&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fcart%3Ftoken%3Dbdfc8b5347&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Russel&last_name=Garlick&address1=&address2=&city=&state=&zip=&email=russel.garlick%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-21 20:36:24', NULL),
(15, NULL, '', '3.97', '162.67', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3D395b7bbb24&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3D395b7bbb24&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Kiarn&last_name=Couling&address1=&address2=&city=&state=&zip=&email=kiarndcouling%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-26 20:39:59', NULL),
(16, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26px-response%3D54123a4b37&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26ce-token%3D54123a4b37&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Grant&last_name=Lawrence&address1=&address2=&city=&state=&zip=&email=grant.lawrence%40aucklandcouncil.govt.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-28 14:51:06', NULL),
(17, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26px-response%3D9678f3cca9&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26ce-token%3D9678f3cca9&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=ANNETTE&last_name=BURGESS&address1=&address2=&city=&state=&zip=&email=annette%40leech.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-09-29 13:53:44', NULL),
(18, NULL, '', '5.61', '229.86', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd451b8949b%26px-response%3D416fe30626&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd451b8949b%26ce-token%3D416fe30626&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Martin&last_name=Burke&address1=&address2=&city=&state=&zip=&email=martin%407group.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-06 10:56:09', NULL),
(19, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26px-response%3D63984da4b7&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26ce-token%3D63984da4b7&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Brian&last_name=Walker&address1=&address2=&city=&state=&zip=&email=brian%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-07 11:51:44', NULL),
(20, NULL, '', '4.46', '182.71', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3D90a458faaf&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3D90a458faaf&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Mufti+Mahmud&last_name=Mollah&address1=&address2=&city=&state=&zip=&email=mufti26%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-10 11:51:15', NULL),
(21, NULL, '', '3.97', '162.67', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3De271898d83&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3De271898d83&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Purna+Bahadur&last_name=Gurung&address1=&address2=&city=&state=&zip=&email=staywithpurna%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-11 15:55:47', NULL),
(22, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D3e4a524fe1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D3e4a524fe1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Liza&last_name=Inglis&address1=&address2=&city=&state=&zip=&email=Linglis%40tonkintaylor.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-20 14:23:59', NULL),
(23, NULL, '', '4.11', '168.56', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De0136ad10f%26px-response%3D6a803de185&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De0136ad10f%26ce-token%3D6a803de185&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Diana&last_name=Austin&address1=&address2=&city=&state=&zip=&email=lp.dm.austin%40clear.net.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-24 15:50:56', NULL),
(24, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D981a3ebb7e&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D981a3ebb7e&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Andrew&last_name=Blackler&address1=&address2=&city=&state=&zip=&email=sitespecific%40xtra.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-25 14:29:13', NULL),
(25, NULL, '', '7.10', '291.15', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D604f64944c&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D604f64944c&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-25 14:32:36', NULL),
(26, NULL, '', '7.13', '292.33', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D22dfc0360f&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D22dfc0360f&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-25 14:36:54', NULL),
(27, '', '', '7.10', '291.15', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D164269feb3&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D164269feb3&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Courtney&last_name=Wymer&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', '', '', '', '2016-10-25 15:08:20', '2016-10-26 14:53:04'),
(28, NULL, '', '5.61', '229.86', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf7eb7031d%26px-response%3Db748c17138&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf7eb7031d%26ce-token%3Db748c17138&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=courtney&last_name=tomahawk&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-10-25 15:35:58', NULL),
(29, '8GE02889F846742', 'TZEX8DMHDLN2U', '7.10', '291.15', '291.15', '10.35', 'NZD', NULL, 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=team-facilitator%40first-training.co.nz&cmd=_cart&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D80db4f918e&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D80db4f918e&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Tomahawk&last_name=Test&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-10-25 16:02:11', '2016-10-26 15:18:30'),
(30, '9E619973P524130', 'URUA6KWSLCW78', '4.11', '168.56', '168.56', '6.18', 'NZD', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26px-response%3D8078547d7a&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26ce-token%3D8078547d7a&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Sue&last_name=Claridge&address1=&address2=&city=&state=&zip=&email=sueandbryan%40clear.net.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'unverified', '2016-10-27 12:00:41', '2016-10-27 12:03:16'),
(31, '3PX062336J36937', '58U7BV7DRGNRL', '4.11', '168.56', '168.56', '6.18', 'NZD', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26px-response%3Db97cb2dbe1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26ce-token%3Db97cb2dbe1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna+&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'unverified', '2016-10-27 12:17:29', '2016-10-27 12:19:52'),
(32, '3LN554577T91700', 'YP2Y392PTR6UQ', '3.97', '162.67', '162.67', '5.98', 'NZD', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26px-response%3D268e4ef5aa&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26ce-token%3D268e4ef5aa&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Gerald+&last_name=Moodley&address1=&address2=&city=&state=&zip=&email=delleservices%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'verified', '2016-10-27 16:58:32', '2016-10-27 16:59:02'),
(33, NULL, '', '3.97', '162.67', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26px-response%3D2885076b86&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26ce-token%3D2885076b86&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Kathleen&last_name=Mulligan&address1=&address2=&city=&state=&zip=&email=mark%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-11-08 12:04:52', NULL),
(34, '8LK29439AF47669', 'GSWBWGVX9W7XS', '8.19', '335.94', '335.94', '11.87', 'NZD', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D0a6774a189&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D0a6774a189&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Laura+&last_name=Iglesias&address1=&address2=&city=&state=&zip=&email=laura.iglesias.atilano%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Completed', 'instant', 'unverified', '2016-11-09 10:31:54', '2016-11-08 16:08:10'),
(35, NULL, '', '4.72', '193.32', '0.00', '0.00', '', NULL, 'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D7d4cfbd36b%26px-response%3D697b368811&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D7d4cfbd36b%26ce-token%3D697b368811&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Brian&last_name=Walker&address1=&address2=&city=&state=&zip=&email=brian%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-11-09 11:57:36', NULL),
(36, NULL, '', '21.39', '876.99', '0.00', '0.00', '', 'Course: Outdoor First Aid - 2 Day\nParticipant: Talwinder Singh\n Participant Email: talwinder@tomahawk.co.nz', 'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=team-facilitator%40first-training.co.nz&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Ffirsttraining.loc%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Ffirsttraining.loc%2Fregister%3Ftoken%3De23139e2ea%26px-response%3D09c06ad624&cancel_return=http%3A%2F%2Ffirsttraining.loc%2Fregister%3Ftoken%3De23139e2ea%26ce-token%3D09c06ad624&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12', 'Pending', '', '', '2016-11-18 14:32:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `full_path` varchar(255) DEFAULT NULL COMMENT 'URL to the slide-image relative to the public_html folder (recommended). ',
  `thumb_path` varchar(255) DEFAULT NULL,
  `caption_heading` varchar(255) DEFAULT NULL,
  `caption` mediumtext,
  `alt_text` varchar(255) DEFAULT NULL,
  `button_label` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `type` enum('N','P') NOT NULL DEFAULT 'N',
  `rank` int(11) DEFAULT NULL COMMENT 'Heirarchy/Order for the slides (lower is greater)',
  `photo_group_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to the slideshow group for this slide'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `full_path`, `thumb_path`, `caption_heading`, `caption`, `alt_text`, `button_label`, `url`, `width`, `height`, `type`, `rank`, `photo_group_id`) VALUES
(302, '/library/whytewater/3.jpg', NULL, '', 'Real Time Booking System for Activity and Tour Operators', '', NULL, NULL, 2331, 1554, 'N', 2, 24),
(301, '/library/whytewater/4.jpg', NULL, '', 'Real Time Booking System for Activity and Tour Operators', '', NULL, NULL, 2255, 1503, 'N', 1, 24),
(303, '/library/whytewater/1.jpg', NULL, '', 'Real Time Booking System for Activity and Tour Operators', '', NULL, NULL, 4928, 3264, 'N', 4, 24),
(304, '/library/whytewater/2.jpg', NULL, '', 'Real Time Booking System for Activity and Tour Operators', '', NULL, NULL, 6000, 4004, 'N', 3, 24),
(307, '/library/whytewater/5.jpg', NULL, '', 'Real Time Booking System for Activity and Tour Operators', '', NULL, NULL, 1301, 882, 'N', 0, 25),
(329, '/library/whytewater/4.jpg', '/uploads/2018/03/img-5aa992322fc2a.jpg', NULL, NULL, NULL, NULL, NULL, 2255, 1503, 'N', 0, 26),
(328, '/library/whytewater/1.jpg', '/uploads/2018/03/img-5aa9923187757.jpg', NULL, NULL, NULL, NULL, NULL, 4928, 3264, 'N', 0, 26),
(327, '/library/whytewater/5.jpg', '/uploads/2018/03/img-5aa9923172d97.jpg', NULL, NULL, NULL, NULL, NULL, 1301, 882, 'N', 0, 26),
(330, '/library/whytewater/3.jpg', '/uploads/2018/03/img-5aa992325e6c6.jpg', NULL, NULL, NULL, NULL, NULL, 2331, 1554, 'N', 0, 26);

-- --------------------------------------------------------

--
-- Table structure for table `photo_group`
--

CREATE TABLE `photo_group` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the slideshow/gallery group',
  `name` varchar(255) NOT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `type` enum('C','G','S') NOT NULL DEFAULT 'S' COMMENT 'C - Carousel, G - Gallery, S - Slideshow(Default)',
  `show_in_cms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `show_on_gallery_page` enum('N','Y') NOT NULL DEFAULT 'N',
  `rank` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo_group`
--

INSERT INTO `photo_group` (`id`, `name`, `menu_label`, `type`, `show_in_cms`, `show_on_gallery_page`, `rank`) VALUES
(24, 'RTBS Multiple Slideshow', NULL, 'S', 'Y', 'N', NULL),
(25, 'RTBS Single Page Slideshow', NULL, 'S', 'Y', 'N', NULL),
(26, 'RTBS Multiple Gallery', 'RTBS Multiple Gallery', 'G', 'Y', 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `redirect`
--

CREATE TABLE `redirect` (
  `id` int(11) NOT NULL,
  `old_url` mediumtext NOT NULL,
  `new_url` mediumtext NOT NULL,
  `status_code` int(11) NOT NULL,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `person_name` varchar(150) DEFAULT NULL,
  `person_location` varchar(150) DEFAULT NULL,
  `photo_path` varchar(225) DEFAULT NULL,
  `description` text,
  `date_posted` date DEFAULT NULL,
  `type` enum('P','A') DEFAULT 'P',
  `status` enum('A','D','H') NOT NULL DEFAULT 'H',
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `person_name`, `person_location`, `photo_path`, `description`, `date_posted`, `type`, `status`, `rank`) VALUES
(1, 'John Doe', 'Auckland, New Zealand', '/library/avatars/avatar1.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at accumsan leo. Maecenas eget lorem sit amet quam tempus faucibus. Nullam pellentesque vehicula elementum. Quisque pharetra sed turpis nec porta. Nulla facilisi. Proin at egestas leo. Aliquam eget eros magna.', '2017-10-04', 'P', 'D', 0),
(2, 'Jane Doe', 'Christchurch', '/library/avatars/avatar2.png', 'Maecenas vel lacus facilisis, consequat augue nec, viverra nisi. Phasellus lacinia, eros dictum varius faucibus, nisi arcu aliquam sem, ut dignissim justo neque in quam. Nullam hendrerit nulla sed blandit vehicula.', '2017-10-09', 'P', 'D', 0),
(3, 'Scott Doe', 'Auckland', '/library/avatars/avatar1.png', 'Aenean diam quam, scelerisque eget lorem in, pretium auctor ipsum. Praesent nec enim diam. Sed iaculis porta eros, vitae ornare leo sagittis vitae. Aliquam id tellus lobortis, faucibus ligula ut, accumsan nisi. Integer blandit iaculis neque ac accumsan. Morbi vitae nisi eleifend, ullamcorper tellus vel, lacinia sapien.', '2017-10-08', 'P', 'D', 0),
(4, 'Lucas Doe', 'Sydney', '/library/avatars/avatar2.png', 'Nunc semper orci nisl, vel sagittis nibh aliquam non. Curabitur mi justo, congue in ante a, auctor vehicula ipsum. Praesent sodales tellus vitae malesuada viverra. Integer mi eros, varius quis massa porta, imperdiet ullamcorper lacus.', '2017-10-13', 'P', 'D', 0),
(5, 'Ellie Doe', 'Perth', '', 'Suspendisse molestie imperdiet massa, porta sodales dolor elementum non. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam pretium consectetur leo, eget vulputate nibh pulvinar a. Aliquam erat volutpat.', '2017-10-12', 'P', 'D', 0),
(6, 'Test review', 'Test review', '/library/photos-1/dscn7788.jpg', 'Test review', '2017-11-09', 'P', 'D', 6),
(7, 'Thurston C', '', '', 'Great people who are warm and friendly, and take care of the details and add nice touches like making sure the wetsuits are dry and preparing hot soup for after the whitewater rafting trip on a cold, rainy day. Good stuff.', '0000-00-00', 'P', 'A', 0),
(8, 'Brenden E', '', '', 'Best experience in New Zealand. While we were on holidays there for two weeks, we tried almost everything, from bungy, open sea kayaking, helicopter flights, jet boating, skiing and even prawn fishing. Rafting with the team was by far the best experience we had. They made the day as comfortable as possible. Bringing hot chocolate to have on the rafts while we took a break, driving us to some hot springs afterwards to thaw out, and making us delicious tomato soup with bread for the end of the adventure. Extremely great value for the price and the team provided by far the best experience of our two week trip to NZ. Cheers', '0000-00-00', 'P', 'A', 0),
(9, 'M Maku', '', '', 'Highly recommended and fabulous activity for both students and adults. Great value for money and instructors go the \'extra mile\' to make the experience enjoyable for all participants.', '0000-00-00', 'P', 'A', 0),
(10, 'KJ', '', '', 'Awesome experience with the family float, fantastic team, and something doable for everyone! We had a blast and are definitely coming back again! Thanks for the wonderful day!', '0000-00-00', 'P', 'A', 0),
(11, 'Sarah B', '', '', 'Whether you\'ve rafted before or not, this trip down the river will meet and exceed all expectations! Friendly, knowledgeable and approachable team!!', '0000-00-00', 'P', 'A', 0),
(12, 'Taylor F', '', '', 'Had a great day out Mountain Biking and White water Rafting the guides were great and very helpful and had a lot of knowledge in their area of expertise. Very great day and I would highly recommend this activity/experience.', '0000-00-00', 'P', 'A', 0),
(13, 'Eunice H', '', '', 'This was a team bonding experience with work mates, including the boss. It sure was team work but a heck of a lot of fun, with the odd scary moment too. Eventually we were eagerly waiting for more rapids to come along so we could bounce around some more. It was very outside my comfort zone but never at any time did we feel unsafe or at risk. Our Guide was Awesome and gave very clear instruction so we knew what we needed to do at all times. I would definitely go again!', '0000-00-00', 'P', 'A', 0),
(14, 'John C', '', '', 'Have done the Grade 3 and Grade 4 recreational release with Tongariro River Rafting now, and cannot recommend them highly enough. The gear provided is top quality, the team who look after you are absolutely brilliant and the trip itself loads of fun. The lunch they serve back at the base after the trip is also great. We\'ll be back for sure.', '0000-00-00', 'P', 'A', 0),
(15, 'T Rover', '', '', 'We have never tried whitewater rafting before, my wife showed some reluctance initially, but now sees our trip as the highlight of our holiday in NZ. We both had a great time, and were looked after very well. It was raining, but no matter, we shot rapids, had a hot milo in a secluded gorge half way. Wetsuit and warm waterproof clothing was all provided. Now we are both 60+, but we had a great time Thanks to the team.', '0000-00-00', 'P', 'A', 0),
(16, 'Sarah Jane Smith', '', '', 'Tongariro River Rafting provided an exciting, exhilarating day for all in our raft! The highly capable guides made the day well worth the money and definitely something I would do again and again!!', '0000-00-00', 'P', 'A', 0),
(17, 'S Subaiah', '', '', 'Our experience with the team at Tongariro River Rafting was unforgettable. It is one thing to raft a beautiful river, it is quite another to do it in the company of professionals who make every effort to ensure your safety while generating all the thrills you can bargain for. I would advocate a turn with this company if you want to make your trip to Taupo complete.', '0000-00-00', 'P', 'A', 0),
(18, 'name', 'location', '/library/whitewater-photos/dscn7925.jpg', 'testing review', '2017-11-02', 'P', 'D', 1),
(19, 'Untitled', NULL, NULL, NULL, NULL, 'P', 'H', NULL),
(20, 'Untitled', '', '', '', '0000-00-00', 'P', 'A', NULL),
(21, 'Untitled', NULL, NULL, NULL, NULL, 'P', 'H', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_path` varchar(255) DEFAULT NULL,
  `second_icon_path` varchar(255) DEFAULT NULL,
  `icon_alt` varchar(255) DEFAULT NULL,
  `widget_blob` text,
  `placement` enum('L','R') DEFAULT 'L',
  `use_icon` enum('0','1') DEFAULT '0',
  `icon_cls` varchar(255) DEFAULT NULL,
  `element_class` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `has_widget` enum('0','1') DEFAULT '0',
  `is_external` enum('0','1') DEFAULT '0',
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `label`, `url`, `title`, `icon_path`, `second_icon_path`, `icon_alt`, `widget_blob`, `placement`, `use_icon`, `icon_cls`, `element_class`, `rank`, `has_widget`, `is_external`, `is_active`) VALUES
(1, 'Facebook URL', 'https://www.facebook.com', 'Join us on Facebook', NULL, NULL, 'Join us on Facebook', NULL, 'L', '1', 'fa fa-facebook', NULL, 1, '0', '1', '1'),
(2, 'Twitter URL', '', 'Follow us on Twitter', NULL, NULL, 'Follow us on Twitter', NULL, 'L', '1', 'fa fa-twitter', NULL, 4, '0', '1', '1'),
(3, 'Instagram URL', 'https://www.instagram.com', 'Follow us on Instagram', NULL, NULL, 'Follow us on Instagram', NULL, 'L', '1', 'fa fa-instagram', NULL, 2, '0', '1', '1'),
(4, 'Pinterest URL', '', 'Follow us on social Pinterest', NULL, NULL, 'Follow us on social Pinterest', NULL, 'L', '1', 'fa fa-pinterest', NULL, 3, '0', '1', '1'),
(5, 'Google+ URL', 'https://plus.google.com', 'Follow us on Google+', NULL, NULL, 'Follow us on Google+', NULL, 'L', '1', 'fa fa-google-plus', NULL, 5, '0', '1', '1'),
(6, 'Flickr URL', '', 'View our photos on Flickr', NULL, NULL, 'View our photos on Flickr', NULL, 'L', '1', 'fa fa-flickr', NULL, 6, '0', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `templates_normal`
--

CREATE TABLE `templates_normal` (
  `tmpl_id` int(11) NOT NULL COMMENT 'Primary key for template',
  `tmpl_name` varchar(100) DEFAULT NULL COMMENT 'Template name',
  `tmpl_path` varchar(100) DEFAULT NULL COMMENT 'Template URL (i.e. ''default'', ''shop'', ''googlemap'' etc). It is recommended that you leave the extension up to the application/code.',
  `tmpl_previewimg` varchar(100) DEFAULT NULL,
  `tmpl_nummoduletags` int(11) NOT NULL DEFAULT '0',
  `tmpl_showincms` varchar(1) NOT NULL DEFAULT 'Y',
  `tmpl_mobile` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templates_normal`
--

INSERT INTO `templates_normal` (`tmpl_id`, `tmpl_name`, `tmpl_path`, `tmpl_previewimg`, `tmpl_nummoduletags`, `tmpl_showincms`, `tmpl_mobile`) VALUES
(1, 'Home', 'home.html', NULL, 0, 'N', NULL),
(2, 'Default', 'index.html', NULL, 0, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the testimonial',
  `person` varchar(100) DEFAULT NULL COMMENT 'Who represents this testimonial',
  `company` varchar(100) NOT NULL,
  `detail` mediumtext COMMENT 'The testimonial itself',
  `status` enum('A','D','H') DEFAULT 'H' COMMENT 'Boolean for whether or not the current testimonial should be displayed. (0 = off, 1=on)',
  `rank` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `person`, `company`, `detail`, `status`, `rank`) VALUES
(1, 'Lisa Nørum', '', 'My experience with Olivia and all Diamond Laser staff was and is brilliant thank you so very much for making me feel so relaxed. I\'m in love with my feather brows and can\'t wait to see the healing result would definitely recommend to anybody who wants amazing and friendly service and a wonderful atmosphere. Thank you very much lady\'s keep up the good work', 'A', 1),
(2, 'Renee Smith', '', 'I trust Olivia completely with what ever treatment I have had done by her at Diamond Laser. She is very knowledgeable and thorough explaining the process before starting. Her products are top quality and what you dont see elsewhere. Olivia makes you feel important, she makes sure you\'re happy, wants to be the best and it shows. She doesn\'t seem to be there just for the money.', 'A', 2),
(3, 'Stacey Richards', '', 'Keren Christmas got me on to Diamond Laser and booked me in with Meredith for some O Cosmedics peels and products. Wow products are amazing and Merediths warm personality is inviting, her facials are something out of this world... faint! Highly recommend. Well done Olivia and Team', 'A', 3),
(6, 'Nicola Elliott', '', 'I have committed myself to a laser hair removal program...and have had two sessions so far. I cannot believe i have been wasting my money on other hair removal methods for so long. Two treatments down and i already have noticeably less hair...so stoked and can\'t wait to see the end results. Thank you so much Olivia xx', 'A', 6),
(4, 'Vanya Insull', '', 'I love getting facials from Diamond Laser, Olivia also does an amazing job of tinting my lashes and brows. I had a red mole (cherry angioma) on my forehead which always bothered me and on Olivia\'s recommendation she lasered off in two quick sessions, l wish I did it years ago.\r\nBest place for beauty treatments and skincare advice in Taupo.', 'A', 4),
(5, 'Craig Richard Oswald', '', 'i had the woman herselve the butiful Miss Olivia do a full and I mean a full body waxin and she was very professional and helped me with the right gel too cool me down after ward she has an amazing team very friendly I cant recommend her enough', 'D', 5),
(7, 'Shanna Bramley', '', 'Thank you so much Libby you didn\'t have to go to such extents to help me out but you made my problem your problem! Thank you so much. Would recommend Diamond Laser to anyone.', 'A', 7),
(8, 'Melissa Pol', '', 'I had acne scarring, pigmentation and dull tired skin until I started treatments with Olivia. I barely wear makeup now and am always getting compliments about how radiant my skin looks. Thank you so much Olivia. You\'ve given me back my sparkle.', 'A', 8),
(9, 'Karen Young', '', 'Such an awesome place to go, very professional, hygienic and safe. Had my nails done for the first time ever today and they look perfect! Highly recommended!', 'A', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_accounts`
--
ALTER TABLE `booking_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_accessgroups`
--
ALTER TABLE `cms_accessgroups`
  ADD PRIMARY KEY (`access_id`);

--
-- Indexes for table `cms_blacklist_user`
--
ALTER TABLE `cms_blacklist_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_login_attempt`
--
ALTER TABLE `cms_login_attempt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`cmsset_id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `content_column`
--
ALTER TABLE `content_column`
  ADD KEY `content_row_id` (`content_row_id`);

--
-- Indexes for table `content_row`
--
ALTER TABLE `content_row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_meta_data_id` (`page_meta_data_id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_importantpages`
--
ALTER TABLE `general_importantpages`
  ADD PRIMARY KEY (`imppage_id`);

--
-- Indexes for table `general_pages`
--
ALTER TABLE `general_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_parent` (`parent_id`),
  ADD KEY `page_meta_data_id` (`page_meta_data_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `module_pages`
--
ALTER TABLE `module_pages`
  ADD PRIMARY KEY (`modpages_id`);

--
-- Indexes for table `module_templates`
--
ALTER TABLE `module_templates`
  ADD PRIMARY KEY (`tmplmod_id`);

--
-- Indexes for table `page_meta_data`
--
ALTER TABLE `page_meta_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bsh_query_1` (`status`,`menu_label`,`heading`,`title`,`sub_heading`);

--
-- Indexes for table `page_meta_index`
--
ALTER TABLE `page_meta_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_transaction`
--
ALTER TABLE `paypal_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `txt_id` (`txn_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_group` (`photo_group_id`);

--
-- Indexes for table `photo_group`
--
ALTER TABLE `photo_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redirect`
--
ALTER TABLE `redirect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates_normal`
--
ALTER TABLE `templates_normal`
  ADD PRIMARY KEY (`tmpl_id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `booking_accounts`
--
ALTER TABLE `booking_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cms_accessgroups`
--
ALTER TABLE `cms_accessgroups`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cms_blacklist_user`
--
ALTER TABLE `cms_blacklist_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cms_login_attempt`
--
ALTER TABLE `cms_login_attempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `cmsset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for user', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `content_row`
--
ALTER TABLE `content_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=873;
--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `general_importantpages`
--
ALTER TABLE `general_importantpages`
  MODIFY `imppage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `general_pages`
--
ALTER TABLE `general_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for pages', AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `highlights`
--
ALTER TABLE `highlights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `mod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for include', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `module_pages`
--
ALTER TABLE `module_pages`
  MODIFY `modpages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `module_templates`
--
ALTER TABLE `module_templates`
  MODIFY `tmplmod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `page_meta_data`
--
ALTER TABLE `page_meta_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `page_meta_index`
--
ALTER TABLE `page_meta_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `paypal_transaction`
--
ALTER TABLE `paypal_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;
--
-- AUTO_INCREMENT for table `photo_group`
--
ALTER TABLE `photo_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the slideshow/gallery group', AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `redirect`
--
ALTER TABLE `redirect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `templates_normal`
--
ALTER TABLE `templates_normal`
  MODIFY `tmpl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for template', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the testimonial', AUTO_INCREMENT=10;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
