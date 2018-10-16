-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2018 at 10:22 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryname`, `description`) VALUES
(1, 'SDress for Girl', 'SDress for Girl'),
(2, 'Corner', 'Corner'),
(3, 'Window', 'Window');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `proId` bigint(20) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `price`, `quantity`, `total`, `orderId`, `proId`, `size`) VALUES
(80, 540, 1, 540, 8, 17, 'S'),
(79, 700, 1, 700, 7, 9, 'S'),
(78, 300, 4, 1200, 6, 11, 'S'),
(77, 270, 1, 270, 5, 16, 'L'),
(76, 300, 1, 300, 4, 8, 'L'),
(75, 270, 2, 540, 3, 4, 'S'),
(74, 300, 2, 600, 1, 9, 'M'),
(81, 545, 2, 1090, 9, 13, 'S'),
(82, 720, 1, 720, 10, 8, 'S'),
(83, 500, 2, 1000, 10, 4, 'M'),
(84, 270, 1, 270, 11, 17, 'S'),
(85, 300, 2, 600, 11, 10, 'S'),
(86, 270, 1, 270, 12, 17, 'S'),
(87, 300, 1, 300, 12, 10, 'S'),
(88, 720, 1, 720, 13, 8, 'S'),
(89, 350, 2, 700, 13, 11, 'S'),
(90, 490, 1, 490, 14, 9, 'S'),
(91, 490, 1, 490, 15, 9, 'S'),
(92, 350, 1, 350, 15, 11, 'S'),
(93, 720, 1, 720, 16, 8, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `orrrder`
--

CREATE TABLE `orrrder` (
  `id` bigint(20) NOT NULL,
  `orderDate` date NOT NULL,
  `userId` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orrrder`
--

INSERT INTO `orrrder` (`id`, `orderDate`, `userId`) VALUES
(1, '2018-06-22', 1),
(3, '2018-06-26', 19),
(4, '2018-06-26', 19),
(5, '2018-06-27', 19),
(6, '2018-06-27', 19),
(7, '2018-06-28', 26),
(8, '2018-06-29', 19),
(9, '2018-07-06', 19),
(10, '2018-07-07', 25),
(11, '2018-07-07', 25),
(12, '2018-07-07', 19),
(13, '2018-07-07', 25),
(14, '2018-07-07', 25),
(15, '2018-07-07', 25),
(16, '2018-07-07', 19);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `productname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `brand`, `color`, `discount`, `image`, `price`, `productname`, `categoryId`, `description`, `gender`, `featured`, `size`) VALUES
(9, 'activeden', 'black', 30, 'resources/images/products/m1.jpg', 700, 'STONE ISLAND LOGO APPLIQUE T-SHIRTT', 3, 'Men\'s black Stone Island long sleeve crew neck t-shirt with logo at front...', 'men', 0, 'L'),
(10, 'activeden', 'black', 0, 'resources/images/products/m2.jpg', 300, 'CRAIG GREEN LIGHTWEIGHT ZIP-UP JACKET', 2, 'Men\'s navy Craig Green lightweight jacket with ties throughout, two pockets and zip closure at front.', 'men', 0, 'S'),
(11, 'photodune', 'black', 0, 'resources/images/products/m3.jpg', 350, 'BURBERRY BRIT WOVEN DOUBLE-BREAST', 3, 'Men\'s black Burberry Brit woven double-breasted jacket with nova check lining, four pockets and button closures at front.', 'men', 0, 'M'),
(12, 'photodune', 'brown', 0, 'resources/images/products/m4.jpg', 450, 'LORO PIANA CASHMERE AND SILK-BLEND', 2, 'Men\'s red Loro Piana cashmere and silk-blend blazer with three external pockets, two internal pockets and three button closure at front.', 'men', 1, 'L'),
(13, 'themeforest', 'black', 0, 'resources/images/products/m5.jpg\r\n', 545, 'DIOR HOMME HOODED WOOL COAT DIOR', 2, 'Men\'s black Dior Homme wool coat with four pockets, hood, and button closures at front.', 'men', 1, 'S'),
(4, 'envato', 'white', 0, 'resources/images/products/w1.jpg', 500, 'JIL SANDER DOUBLE-BREASTED TRENCH COAT', 3, 'Khaki Jil Sander knee-length double-breasted trench coat with peaked lapels, belt featuring buckle closure at front, two pockets at front and button closures at front.', 'women', 0, 'M'),
(5, 'activeden', 'blue', 0, 'resources/images/products/w2.jpg', 600, 'ESCADA SHORT SLEEVE MINI DRESS', 2, 'Blue Escada short sleeve mini dress with bateau neck, gathered detail at front and concealed zip closure at back.', 'women', 1, 'S'),
(6, 'activeden', 'black', 0, 'resources/images/products/w3.jpg', 500, 'RACHEL ZOE LONG SLEEVE MINI DRESS W/ TAGS', 1, 'Black Rachel Zoe mini dress with satin trim, V-neck, peaked lapels, structured shoulders, long sleeves, single seam pocket at bust and concealed zip closure at back.', 'women', 1, 'S'),
(7, 'themeforest', 'white', 0, 'resources/images/products/w4.jpg', 700, 'LELA LELA ROSE JACQUARD MIDI DRESS', 1, 'White, dark slate and multicolor Lela Rose jacquard midi dress with bateau neck, short sleeves, pleat accents at skirt, dual pockets and zip closure at back.', 'women', 0, 'L'),
(8, 'photodune', 'white', 20, 'resources/images/products/w6.jpg', 900, 'HERMÈS LINEN MIDI DRESS HERMÈS LINEN', 3, 'Pale beige Hermès sleeveless linen midi dress with V-neck, dual seam pockets and button closures at front.', 'women', 0, 'S'),
(14, 'themeforest', 'blue', 0, 'resources/images/products/m6.jpg', 125, 'GUCCI STRIPED BUTTON-UP SHIRT GUCCI', 1, 'Men\'s blue and white Gucci striped shirt with button closures at front and cuffs.', 'men', 0, 'L'),
(15, 'envato', 'black', 0, 'resources/images/products/k1.jpg', 100, '2-pack T-shirts', 3, 'CONSCIOUS. V-neck T-shirts in organic cotton jersey.', 'kids', 0, 'S'),
(16, 'envato', 'blue', 0, 'resources/images/products/k2.jpg', 200, 'Grandad shirt', 3, 'Shirt in a cotton weave with a grandad collar, buttons and a chest pocket. Long sleeves with a tab and button, buttoned cuffs, and a rounded hem.', 'kids', 0, 'S'),
(17, 'envato', 'blue', 10, 'resources/images/products/k3.jpg', 300, 'Shirt in a cotton weave with a button-down ', 3, 'Shirt in a cotton weave with a button-down collar and buttons down the front. Small chest pocket, short sleeves with sewn-in turn-ups, and a rounded hem. Slightly longer at the back.', 'kids', 0, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `enabled`, `firstname`, `lastname`, `address`, `password`, `phone`, `roleid`) VALUES
(1, 'quang@gmail.com', b'1', 'Quang', 'Huynh Ngoc', 'Da Nang', 'Khung123', '0123456789', 1),
(2, 'quangad@gmail.com', b'1', 'Ad_Quang', 'Huynh', 'Admin', 'Khung123', '0123456788', 2),
(17, 'quang1@gmail.com', b'1', 'Quang12', 'Huynh Ngoc', 'DaNang', 'Khung123', '0120000000', 1),
(18, 'aaaa@gmail.com', b'1', 'Huynh', 'Quang', 'Vietnam', 'Khung123', '01205304861', 1),
(16, 'quang123@gmail.com', b'1', 'Quang', 'Huynh Ngoc', 'Danang', 'Khung123', '0120000000', 1),
(19, 'quangdanang1@gmail.com', b'1', 'Quang', 'Huynh Ngoc', 'Vietnam', 'Khung123', '01205304861', 1),
(23, 'quangdanang2@gmail.com', b'1', 'test', 'test', 'Danang', 'Khung123', '01205304861', 1),
(25, 'quangdanang3@gmail.com', b'1', 'Quang', 'Huynh', 'Danang', 'Khung123', '01205304861', 1),
(26, 'quangdanang10@gmail.com', b'1', 'Quang', 'Dang', 'DaNang', 'Khung124', '01205304861', 1),
(27, 'quangdanang11@gmail.com', b'0', 'Quang', 'Huynh Ngoc', 'Danang', 'Khung123', '01205304861', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_relation`
--

CREATE TABLE `user_role_relation` (
  `user_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role_relation`
--

INSERT INTO `user_role_relation` (`user_id`, `user_role_id`) VALUES
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlhvyqojw4kgrr7pqm1gmbl6lc` (`orderId`),
  ADD KEY `FK7v8j1xl2cebud11761sminu4w` (`proId`);

--
-- Indexes for table `orrrder`
--
ALTER TABLE `orrrder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1x9gb0hgnruj8b0udmag7gnwg` (`userId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6i3ku5n5njmijfxwv43ktj2ki` (`categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_relation`
--
ALTER TABLE `user_role_relation`
  ADD PRIMARY KEY (`user_id`,`user_role_id`),
  ADD KEY `FK2dk9ymg4h331ambb171746men` (`user_role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `orrrder`
--
ALTER TABLE `orrrder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
