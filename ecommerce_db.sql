-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2025 at 08:25 PM
-- Server version: 11.8.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add test table', 7, 'add_testtable'),
(26, 'Can change test table', 7, 'change_testtable'),
(27, 'Can delete test table', 7, 'delete_testtable'),
(28, 'Can view test table', 7, 'view_testtable'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add order', 9, 'add_order'),
(34, 'Can change order', 9, 'change_order'),
(35, 'Can delete order', 9, 'delete_order'),
(36, 'Can view order', 9, 'view_order'),
(37, 'Can add shipping address', 10, 'add_shippingaddress'),
(38, 'Can change shipping address', 10, 'change_shippingaddress'),
(39, 'Can delete shipping address', 10, 'delete_shippingaddress'),
(40, 'Can view shipping address', 10, 'view_shippingaddress'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$lvDopbFOeiAKBItCZtIWOZ$i0psj/3Z4lCZGq14/v9EpmJnGFyEE1ejMhkSP4qqRew=', '2025-06-28 15:50:27.150855', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-06-24 19:25:11.979946'),
(2, 'pbkdf2_sha256$1000000$wOFaGglnAETEYi88svTOBf$Lqc4X9Dl7oY3O3NCXnKQRsd4iGZWQ6MS2eXsx7oUJJA=', '2025-06-29 17:15:45.883506', 0, 'test@gmail.com', '', '', 'test@gmail.com', 0, 1, '2025-06-24 19:27:41.160183');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-06-24 20:27:00.858507', '1', 'Sleevesless Shirt', 1, '[{\"added\": {}}]', 8, 1),
(2, '2025-06-25 05:17:41.369653', '2', 'Asta Wolf COBRA', 1, '[{\"added\": {}}]', 8, 1),
(3, '2025-06-25 05:36:57.992758', '3', 'Ultima Watch Flex', 1, '[{\"added\": {}}]', 8, 1),
(4, '2025-06-25 05:46:28.955356', '4', 'USB Type C To HDMI Adapter', 1, '[{\"added\": {}}]', 8, 1),
(5, '2025-06-26 09:24:50.564558', '5', 'Acer Aspire 14', 1, '[{\"added\": {}}]', 8, 1),
(6, '2025-06-26 14:30:06.707052', '6', 'HiFuture Gravity', 1, '[{\"added\": {}}]', 8, 1),
(7, '2025-06-26 14:30:15.966305', '1', 'Sleevesless Shirt', 3, '', 8, 1),
(8, '2025-06-26 14:30:27.147973', '2', 'Asta Wolf COBRA', 2, '[]', 8, 1),
(9, '2025-06-26 14:31:01.314364', '4', 'USB Type C To HDMI Adapter', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(10, '2025-06-26 14:31:09.409512', '5', 'Acer Aspire 14', 2, '[]', 8, 1),
(11, '2025-06-26 14:47:28.799535', '2', 'Asta Wolf COBRA', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(12, '2025-06-26 14:47:48.634580', '3', 'Ultima Watch Flex', 2, '[{\"changed\": {\"fields\": [\"Category\", \"Subcategory\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'ecommerce_app', 'order'),
(11, 'ecommerce_app', 'orderitem'),
(8, 'ecommerce_app', 'product'),
(10, 'ecommerce_app', 'shippingaddress'),
(7, 'ecommerce_app', 'testtable'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-24 18:33:54.414810'),
(2, 'auth', '0001_initial', '2025-06-24 18:33:54.713234'),
(3, 'admin', '0001_initial', '2025-06-24 18:33:54.792437'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-24 18:33:54.802573'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-24 18:33:54.816151'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-24 18:33:54.911346'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-24 18:33:54.966989'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-24 18:33:54.999101'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-24 18:33:55.008307'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-24 18:33:55.039983'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-24 18:33:55.044381'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-24 18:33:55.055825'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-24 18:33:55.088666'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-24 18:33:55.129991'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-24 18:33:55.161147'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-24 18:33:55.171661'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-24 18:33:55.197460'),
(19, 'sessions', '0001_initial', '2025-06-24 18:33:55.261757'),
(20, 'ecommerce_app', '0001_initial', '2025-06-24 20:24:08.656656'),
(21, 'ecommerce_app', '0002_order_orderitem_shippingaddress', '2025-06-28 15:47:24.514056');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dt6cabll0i86628j1eh89vbq0drnek87', '.eJxVjEEOwiAQRe_C2hAQhzIu3XsGAjODVA1NSrsy3l2bdKHb_977LxXTutS4dpnjyOqsjurwu-VED2kb4Htqt0nT1JZ5zHpT9E67vk4sz8vu_h3U1Ou3dkVYvEV0MORCAcPJDSYzggXATIBWSrZWxIRQfJDCFhwAGSIIHtX7A-UMN88:1uVYmA:ysHv7R0Km2OUz1hBOC8VJyL0W0qTlG5Sf13GfYQv7DY', '2025-07-12 16:51:38.190777'),
('nwkdh9o6xxgx6c10xj7abjru7wgm5q38', '.eJxVjEEOwiAQRe_C2hAQhzIu3XsGAjODVA1NSrsy3l2bdKHb_977LxXTutS4dpnjyOqsjurwu-VED2kb4Htqt0nT1JZ5zHpT9E67vk4sz8vu_h3U1Ou3dkVYvEV0MORCAcPJDSYzggXATIBWSrZWxIRQfJDCFhwAGSIIHtX7A-UMN88:1uV86o:een4AE5CNvrloF9cz5EcQIGMgRXZtkk3xF78mZaMNzw', '2025-07-11 12:23:10.973040'),
('uv9pff9e7195c3b1udsew8w41omjnna4', '.eJxVjEEOwiAQRe_C2hAQhzIu3XsGAjODVA1NSrsy3l2bdKHb_977LxXTutS4dpnjyOqsjurwu-VED2kb4Htqt0nT1JZ5zHpT9E67vk4sz8vu_h3U1Ou3dkVYvEV0MORCAcPJDSYzggXATIBWSrZWxIRQfJDCFhwAGSIIHtX7A-UMN88:1uVvd3:TZWSF1cMQNAosp8r7utQMunnTgo9lgxlXh43Ok0f4Ig', '2025-07-13 17:15:45.885564');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_app_order`
--

CREATE TABLE `ecommerce_app_order` (
  `id` bigint(20) NOT NULL,
  `date_ordered` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `is_delivered` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `ecommerce_app_order`
--

INSERT INTO `ecommerce_app_order` (`id`, `date_ordered`, `status`, `is_delivered`, `user_id`) VALUES
(1, '2025-06-28 17:17:34.310142', 'Pending', 0, 2),
(2, '2025-06-28 17:17:38.982120', 'Pending', 0, 2),
(3, '2025-06-28 17:24:34.862008', 'Pending', 0, 2),
(4, '2025-06-28 17:24:50.602824', 'Pending', 0, 2),
(5, '2025-06-28 17:51:50.125869', 'Pending', 0, 2),
(6, '2025-06-28 17:52:01.204515', 'Pending', 0, 2),
(7, '2025-06-28 17:53:02.837090', 'Pending', 0, 2),
(8, '2025-06-28 17:53:25.223823', 'Pending', 0, 2),
(9, '2025-06-28 17:53:31.303447', 'Pending', 0, 2),
(10, '2025-06-28 17:54:33.349968', 'Pending', 0, 2),
(11, '2025-06-28 17:58:20.158227', 'Pending', 0, 2),
(12, '2025-06-29 17:19:35.077156', 'Pending', 0, 2),
(13, '2025-06-29 17:21:15.827185', 'Pending', 0, 2),
(14, '2025-06-29 17:21:55.652956', 'Pending', 0, 2),
(15, '2025-06-29 17:22:47.732422', 'Pending', 0, 2),
(16, '2025-06-29 17:25:05.043468', 'Pending', 0, 2),
(17, '2025-06-29 18:23:49.290005', 'Pending', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_app_orderitem`
--

CREATE TABLE `ecommerce_app_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `ecommerce_app_orderitem`
--

INSERT INTO `ecommerce_app_orderitem` (`id`, `quantity`, `price`, `order_id`, `product_id`) VALUES
(1, 4, 1399.00, 10, 2),
(2, 3, 2500.00, 10, 3),
(3, 5, 1000.00, 10, 4),
(4, 1, 2500.00, 11, 3),
(5, 3, 1399.00, 12, 2),
(6, 1, 2500.00, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_app_product`
--

CREATE TABLE `ecommerce_app_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `subcategory` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `ecommerce_app_product`
--

INSERT INTO `ecommerce_app_product` (`product_id`, `product_name`, `category`, `subcategory`, `price`, `desc`, `image`) VALUES
(2, 'Asta Wolf COBRA', 'Airbud', 'Airbud', 1399.00, 'Key Specifications earbuds-type Earbuds Type In-ear earbuds-weight Earbuds Weight Unspecified earbuds-driver Earbuds Driver 10 mm earbuds-noise-cancellation Earbuds Noise Cancellation No earbuds-ingress-protection Earbuds Ingress Protection IPX4 (earbuds) earbuds-battery Earbuds Battery 30 mAh', 'images/Asta-Wolf-COBRA-Black.jpg'),
(3, 'Ultima Watch Flex', 'SmartWatch', 'SmartWatch', 2500.00, 'Key Specifications watch-type Type General watch-weight Weight Unspecified watch-display Display 2.01 inches watch-battery Battery 300mAh watch-ingress-protection Ingress Protection Yes (IP67)', 'images/Ultima-Watch-Flex-1.jpg'),
(4, 'USB Type C To HDMI Adapter', 'Other Accessories', 'Cables', 1000.00, 'Compatible Devices: New Apple Macbook, 2015, or other Type C port devices you would like to connect with an HDMI cable  What’s Included? USB-C to HDMI Adapter  Specifications: Length: 20cm Weight: 1 oz', 'images/ree7aadr63jksuf.jpg'),
(5, 'Acer Aspire 14', 'Laptop', 'Laptop', 81000.00, 'Acer Aspire 14 (A14-51P) is an affordable laptop that comes with a decent set of hardware. It comes with a 14-inch IPS LCD that stretches WUXGA in resolution. Under the hood, it comes with the latest AI-powered Intel Core 5 120U processor with 10 cores, 12 threads, and a 12MB cache. Additional hardw', 'images/Acer-Aspire-14-Intel-Core-5-120U.jpg'),
(6, 'HiFuture Gravity', 'Speaker', 'Speaker', 8000.00, 'The HiFuture Gravity is a 1.73kg cylindrical speaker with RGB light rings and two color options. It has an IPX7 rating and multiple buttons for volume, power, Bluetooth, and play/pause controls. The speaker has a 30W RMS woofer and 15W RMS tweeter, with trebles up to 20kHz and radiators for bass boo', 'images/HiFuture-Gravity-Black.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_app_shippingaddress`
--

CREATE TABLE `ecommerce_app_shippingaddress` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `ecommerce_app_shippingaddress`
--

INSERT INTO `ecommerce_app_shippingaddress` (`id`, `name`, `email`, `address`, `city`, `state`, `zip_code`, `phone`, `order_id`) VALUES
(1, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', 'Bagmati', '44800', '9808109441', 10),
(2, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', 'Bagmati', '44800', '9808109441', 11),
(3, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', 'Bagmati', '44800', '9808109441', 12),
(4, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', 'Bagmati', '44800', '9808109441', 13),
(5, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', '', '44800', '9808109441', 14),
(6, 'Kailash Thapa', 'kailassthapa73@gmail.com', 'Amaldol', 'Bhaktapur', '', '44800', '9808109441', 15),
(7, '', '', '', '', '', '', '', 16),
(8, '', '', '', '', '', '', '', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `ecommerce_app_order`
--
ALTER TABLE `ecommerce_app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ecommerce_app_order_user_id_866d935c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ecommerce_app_orderitem`
--
ALTER TABLE `ecommerce_app_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ecommerce_app_orderi_order_id_dabcbf26_fk_ecommerce` (`order_id`),
  ADD KEY `ecommerce_app_orderi_product_id_54e35af2_fk_ecommerce` (`product_id`);

--
-- Indexes for table `ecommerce_app_product`
--
ALTER TABLE `ecommerce_app_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `ecommerce_app_shippingaddress`
--
ALTER TABLE `ecommerce_app_shippingaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ecommerce_app_order`
--
ALTER TABLE `ecommerce_app_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ecommerce_app_orderitem`
--
ALTER TABLE `ecommerce_app_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ecommerce_app_product`
--
ALTER TABLE `ecommerce_app_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ecommerce_app_shippingaddress`
--
ALTER TABLE `ecommerce_app_shippingaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ecommerce_app_order`
--
ALTER TABLE `ecommerce_app_order`
  ADD CONSTRAINT `ecommerce_app_order_user_id_866d935c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ecommerce_app_orderitem`
--
ALTER TABLE `ecommerce_app_orderitem`
  ADD CONSTRAINT `ecommerce_app_orderi_order_id_dabcbf26_fk_ecommerce` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_app_order` (`id`),
  ADD CONSTRAINT `ecommerce_app_orderi_product_id_54e35af2_fk_ecommerce` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_app_product` (`product_id`);

--
-- Constraints for table `ecommerce_app_shippingaddress`
--
ALTER TABLE `ecommerce_app_shippingaddress`
  ADD CONSTRAINT `ecommerce_app_shippi_order_id_3bcb4c24_fk_ecommerce` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_app_order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
