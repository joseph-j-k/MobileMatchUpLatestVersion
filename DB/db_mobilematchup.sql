-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2024 at 09:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mobilematchup`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`) VALUES
(1, 'admin@gmail.com', 'admin@123', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_status` int(11) NOT NULL DEFAULT 0,
  `booking_date` varchar(50) NOT NULL,
  `booking_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `user_id`, `booking_status`, `booking_date`, `booking_amount`) VALUES
(1, 1, 5, '2024-09-28', 109990);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buyusedphone`
--

CREATE TABLE `tbl_buyusedphone` (
  `buyphone_id` int(11) NOT NULL,
  `usedphone_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `buydate` varchar(20) NOT NULL,
  `buy_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_buyusedphone`
--

INSERT INTO `tbl_buyusedphone` (`buyphone_id`, `usedphone_id`, `buyer_id`, `buydate`, `buy_status`) VALUES
(1, 1, 2, '2024-09-28', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `mobile_id` int(11) NOT NULL,
  `cart_status` int(11) NOT NULL DEFAULT 0,
  `cart_quantity` int(11) NOT NULL DEFAULT 1,
  `cart_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cart_id`, `booking_id`, `mobile_id`, `cart_status`, `cart_quantity`, `cart_date`) VALUES
(1, 1, 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chat`
--

CREATE TABLE `tbl_chat` (
  `chat_id` int(11) NOT NULL,
  `chat_datetime` varchar(30) NOT NULL,
  `from_userid` int(11) NOT NULL DEFAULT 0,
  `to_userid` int(11) NOT NULL DEFAULT 0,
  `chat_content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_chat`
--

INSERT INTO `tbl_chat` (`chat_id`, `chat_datetime`, `from_userid`, `to_userid`, `chat_content`) VALUES
(1, 'September 28 2024, 12:15 PM', 2, 1, 'hi adarsh i want to buy this phone'),
(2, 'September 28 2024, 12:16 PM', 2, 1, 'okk tel me ur address i will swend '),
(3, 'September 28 2024, 12:19 PM', 2, 1, 'ok ok '),
(4, 'September 28 2024, 12:20 PM', 2, 1, 'no negotiable');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chatlist`
--

CREATE TABLE `tbl_chatlist` (
  `chatlist_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `chat_content` varchar(500) NOT NULL,
  `chat_datetime` varchar(50) NOT NULL,
  `chat_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_chatlist`
--

INSERT INTO `tbl_chatlist` (`chatlist_id`, `from_id`, `to_id`, `chat_content`, `chat_datetime`, `chat_type`) VALUES
(1, 2, 1, 'no negotiable', '2024-09-28 12:20:15', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_comment` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile_id` int(11) NOT NULL,
  `comment_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_password` varchar(50) NOT NULL,
  `company_proof` varchar(80) NOT NULL,
  `company_contact` varchar(50) NOT NULL,
  `company_address` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `company_photo` varchar(50) NOT NULL,
  `company_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`company_id`, `company_name`, `company_email`, `company_password`, `company_proof`, `company_contact`, `company_address`, `place_id`, `company_photo`, `company_status`) VALUES
(1, 'Samsung', 'samsung@gmail.com', 'samsung', 'samsung.jpg', '9544640091', 'Muvattupuzha P.O Ernakulam', 1, 'samsung.jpg', 1),
(2, 'IPhone', 'iphone@gmail.com', 'iphone', 'iphone company.jfif', '9562594134', 'Palakkad P.O Chittur', 19, 'iphone company.jfif', 1),
(3, 'Redmi', 'Redmi@gmail.com', 'redmi', 'beijing-china-january-28-2017-260nw-627951437.webp', '1234567890', 'Pala P.O Kottayam', 11, 'beijing-china-january-28-2017-260nw-627951437.webp', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'Ernakulam'),
(2, 'Thiruvanathapuram'),
(3, 'Alappuzha'),
(4, 'Kottayam'),
(5, 'Kollam'),
(6, 'Pathanamthitta'),
(7, 'Thrissur'),
(8, 'Palakkad'),
(9, 'Idukki'),
(10, 'Malappuram'),
(11, 'Kozhikode'),
(12, 'Wayanad'),
(13, 'Kannur'),
(14, 'Kasargod');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mobile`
--

CREATE TABLE `tbl_mobile` (
  `mobile_id` int(11) NOT NULL,
  `mobile_name` varchar(50) NOT NULL,
  `mobile_price` int(11) NOT NULL,
  `mobile_model` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mobile`
--

INSERT INTO `tbl_mobile` (`mobile_id`, `mobile_name`, `mobile_price`, `mobile_model`, `company_id`) VALUES
(1, 'Samsung S23 ultra', 109990, 'Samsung', 1),
(2, 'Apple iPhone 15 Pro', 150000, 'Iphone', 2),
(3, 'Redmi 13 Pro', 25999, 'Redmi', 3),
(4, 'SAMSUNG Galaxy A14', 12500, 'Samsung', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mobiledetails`
--

CREATE TABLE `tbl_mobiledetails` (
  `mobiledetails_id` int(11) NOT NULL,
  `mobiledetails_name` varchar(50) NOT NULL,
  `mobiledetails_color` varchar(50) NOT NULL,
  `mobiledetails_storage` varchar(50) NOT NULL,
  `mobiledetails_ram` varchar(50) NOT NULL,
  `mobiledetails_rom` varchar(50) NOT NULL,
  `mobiledetails_processor` varchar(60) NOT NULL,
  `mobiledetails_rearcam` varchar(50) NOT NULL,
  `mobiledetails_frontcam` varchar(50) NOT NULL,
  `mobiledetails_display` varchar(50) NOT NULL,
  `mobiledetails_battery` varchar(50) NOT NULL,
  `mobiledetails_photo` varchar(50) NOT NULL,
  `mobiledetails_price` varchar(50) NOT NULL,
  `mobile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mobiledetails`
--

INSERT INTO `tbl_mobiledetails` (`mobiledetails_id`, `mobiledetails_name`, `mobiledetails_color`, `mobiledetails_storage`, `mobiledetails_ram`, `mobiledetails_rom`, `mobiledetails_processor`, `mobiledetails_rearcam`, `mobiledetails_frontcam`, `mobiledetails_display`, `mobiledetails_battery`, `mobiledetails_photo`, `mobiledetails_price`, `mobile_id`) VALUES
(1, 'SAMSUNG Galaxy S23 Ultra 5G', 'Cream', '512GB', '12GB', '512GB', 'Qualcomm Snapdragon 8 Gen 2|Octa Core|3.336 GHz', '200MP+10MP+12MP', '12Mp', '6.8 inch full HD+Dynamic AMLOED 2X', '5000mAh', 's23 ultra.jpg', '', 1),
(2, 'Apple iPhone Pro', 'Natural Titanium', '256 GB', '12GB', '256GB', 'A17 Pro Chip,6 Core Processor|Hexa core', '48MP+12MP+12MP', '12MP', '6.1inch All Screen OLED Display', '4000mAh', 'iphone15.webp', '', 2),
(3, 'REDMI Note 13 Pro 5G', 'Grey', '256GB', '12GB', '256GB', '7s Gen 2 Mobile Platform 5G|octa core', '200MP+MP', '16MP', '6.67 inch 120GHz Adaptive 1.5k AMOLED', '5100 mAh', 'redmi.jfif', '', 3),
(4, 'SAMSUNG Galaxy A14 5G', 'Light green', '128GB', '6GB', '128GB', 'Exynos 1330|Octacor|2GHz', '50MP+2MP+2MP', '13MP', '6.1inch All Screen OLED Display', '5000mAh', 'download.jfif', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `place_pincode` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `place_pincode`, `district_id`) VALUES
(1, 'Muvattupuzha', '686669', 1),
(2, 'Perumbaavoor', '686668', 1),
(3, 'Piravom', '686769', 1),
(4, 'Pattimattom', '686664', 1),
(5, 'Varkala', '556767', 2),
(6, 'Neyyaatinkara', '556677', 2),
(7, 'Attingal', '554433', 2),
(8, 'Cherthala', '443322', 3),
(9, 'Kuttanad', '445533', 3),
(10, 'Changanassery', '887766', 4),
(11, 'Pala', '776655', 4),
(12, 'Karunagappaly', '778899', 5),
(13, 'Eravipuram', '998877', 5),
(14, 'Adoor', '234455', 6),
(15, 'Thiruvalla', '225533', 6),
(16, 'Guruvayur', '556688', 7),
(17, 'Chavakkad', '336699', 7),
(18, 'Ottapalam', '553311', 8),
(19, 'Chittur', '771122', 8),
(20, 'Thodupuzha', '118866', 9),
(21, 'Munnar', '665566', 9),
(22, 'Kondotty', '884422', 10),
(23, 'Perinthalmanna', '141718', 10),
(24, 'Kappad', '449988', 11),
(25, 'Beypore', '667744', 11),
(26, 'Edakkal', '33443', 12),
(27, 'Chembra', '550099', 12),
(28, 'Thalassery', '224433', 13),
(29, 'Payyanur', '778877', 13),
(30, 'Kumbala', '886655', 14),
(31, 'Bekkal', '995544', 14),
(32, 'Bekkal', '995544', 14),
(33, 'Bekkal', '995544', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `request_id` int(11) NOT NULL,
  `request_date` varchar(100) NOT NULL,
  `request_status` int(11) NOT NULL,
  `user_Id` int(11) NOT NULL,
  `servicetype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_request`
--

INSERT INTO `tbl_request` (`request_id`, `request_date`, `request_status`, `user_Id`, `servicetype_id`) VALUES
(1, '2024-09-28', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` int(11) NOT NULL,
  `review_datetime` varchar(50) NOT NULL,
  `mobile_id` int(11) NOT NULL,
  `user_review` varchar(100) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_rating` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `review_datetime`, `mobile_id`, `user_review`, `user_name`, `user_rating`) VALUES
(1, '2024-09-28 11:52:23', 1, 'good', 'adarsh', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicecenter`
--

CREATE TABLE `tbl_servicecenter` (
  `servicecenter_id` int(11) NOT NULL,
  `servicecenter_name` varchar(50) NOT NULL,
  `servicecenter_email` varchar(50) NOT NULL,
  `servicecenter_proof` varchar(50) NOT NULL,
  `servicecenter_password` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `center_status` int(11) NOT NULL,
  `servicecenter_photo` varchar(50) NOT NULL,
  `servicecenter_contact` int(11) NOT NULL,
  `servicecenter_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_servicecenter`
--

INSERT INTO `tbl_servicecenter` (`servicecenter_id`, `servicecenter_name`, `servicecenter_email`, `servicecenter_proof`, `servicecenter_password`, `place_id`, `center_status`, `servicecenter_photo`, `servicecenter_contact`, `servicecenter_address`) VALUES
(1, 'Mobilecare', 'mobilecare@gmail.com', 'boy-flat-cartoon-character-illustration_620650-210', 'mobilecare', 21, 1, 'boy-flat-cartoon-character-illustration_620650-210', 2147483647, 'munnar P.O idduki'),
(2, 'Mobilecare', 'mobilecare1818@gmail.com', 'redmi.jfif', 'mobilecare', 21, 2, 'redmi.jfif', 2147483647, 'munnar P.O idduki'),
(3, 'Samsungcare', 'samsung1818@gmail.com', 'samsung.jpg', 'samsung', 1, 0, 'samsung.jpg', 2147483647, 'muvattupuzha p.o ernakulam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicetype`
--

CREATE TABLE `tbl_servicetype` (
  `servicetype_id` int(11) NOT NULL,
  `servicetype_type` varchar(50) NOT NULL,
  `servicetype_details` varchar(50) NOT NULL,
  `servicetype_rate` varchar(50) NOT NULL,
  `servicecenter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_servicetype`
--

INSERT INTO `tbl_servicetype` (`servicetype_id`, `servicetype_type`, `servicetype_details`, `servicetype_rate`, `servicecenter_id`) VALUES
(1, 'display issue', 'we will solve any display issue of any phone', '4300', 1),
(2, 'batteery issue', 'we will solve any battery issue of any phone', '2800', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `stock_id` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `stock_date` varchar(50) NOT NULL,
  `mobile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stock`
--

INSERT INTO `tbl_stock` (`stock_id`, `stock_quantity`, `stock_date`, `mobile_id`) VALUES
(1, 50, '2024-09-28', 1),
(2, 50, '2024-09-28', 3),
(3, 50, '2024-09-28', 3),
(4, 50, '2024-09-28', 4),
(5, 50, '2024-09-28', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usedphone`
--

CREATE TABLE `tbl_usedphone` (
  `usedphone_id` int(11) NOT NULL,
  `usedphone_name` varchar(50) NOT NULL,
  `usedphone_details` varchar(50) NOT NULL,
  `usedphone_price` varchar(20) NOT NULL,
  `usedphone_photo` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_usedphone`
--

INSERT INTO `tbl_usedphone` (`usedphone_id`, `usedphone_name`, `usedphone_details`, `usedphone_price`, `usedphone_photo`, `user_id`) VALUES
(1, 'iphone 12 pro max', 'good phone with good perfomance', '15000', 'iphone15.webp', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_gender` varchar(50) NOT NULL,
  `user_contact` varchar(50) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `user_photo` varchar(60) NOT NULL,
  `user_proof` varchar(60) NOT NULL,
  `user_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_gender`, `user_contact`, `user_email`, `user_password`, `place_id`, `user_photo`, `user_proof`, `user_address`) VALUES
(1, 'Adarsh manoj', 'Male', '9947445254', 'adarshmanoj1818@gmail.com', 'Adarsh@123', 1, 'boy-flat-cartoon-character-illustration_620650-2108.avif', 'boy-flat-cartoon-character-illustration_620650-2108.avif', 'Vettikakuzhiyil(H)Mazhuvannor P.O mangalathunada'),
(2, 'Arsha Balakrishnan', 'Female', '9778383911', 'arshabalakrishnan02@gmail.com', 'Arsha@123', 4, 'boy-flat-cartoon-character-illustration_620650-2108.avif', 'boy-flat-cartoon-character-illustration_620650-2108.avif', 'Puthenpurackal(H)\r\nKolenchery P.O Ernakulam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_buyusedphone`
--
ALTER TABLE `tbl_buyusedphone`
  ADD PRIMARY KEY (`buyphone_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `tbl_chatlist`
--
ALTER TABLE `tbl_chatlist`
  ADD PRIMARY KEY (`chatlist_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_mobile`
--
ALTER TABLE `tbl_mobile`
  ADD PRIMARY KEY (`mobile_id`);

--
-- Indexes for table `tbl_mobiledetails`
--
ALTER TABLE `tbl_mobiledetails`
  ADD PRIMARY KEY (`mobiledetails_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `tbl_servicecenter`
--
ALTER TABLE `tbl_servicecenter`
  ADD PRIMARY KEY (`servicecenter_id`);

--
-- Indexes for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  ADD PRIMARY KEY (`servicetype_id`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `tbl_usedphone`
--
ALTER TABLE `tbl_usedphone`
  ADD PRIMARY KEY (`usedphone_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_buyusedphone`
--
ALTER TABLE `tbl_buyusedphone`
  MODIFY `buyphone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_chatlist`
--
ALTER TABLE `tbl_chatlist`
  MODIFY `chatlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_mobile`
--
ALTER TABLE `tbl_mobile`
  MODIFY `mobile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_mobiledetails`
--
ALTER TABLE `tbl_mobiledetails`
  MODIFY `mobiledetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_servicecenter`
--
ALTER TABLE `tbl_servicecenter`
  MODIFY `servicecenter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  MODIFY `servicetype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_usedphone`
--
ALTER TABLE `tbl_usedphone`
  MODIFY `usedphone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
