-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2016 at 08:05 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taracode`
--

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity`
--

DROP TABLE IF EXISTS `pm_activity`;
CREATE TABLE IF NOT EXISTS `pm_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `hotels` varchar(250) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `max_children` int(11) DEFAULT '1',
  `max_adults` int(11) DEFAULT '1',
  `max_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `duration` float DEFAULT '0',
  `duration_unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT '0',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `activity_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_activity`
--

INSERT INTO `pm_activity` (`id`, `lang`, `hotels`, `id_user`, `max_children`, `max_adults`, `max_people`, `title`, `subtitle`, `alias`, `descr`, `duration`, `duration_unit`, `price`, `lat`, `lng`, `home`, `checked`, `rank`) VALUES
(1, 1, '3', 1, 2, 3, 5, 'Demo', '', 'demo', '<p>Demo</p>\r\n', 10, 'hour(s)', 100, 100.1, 100.1, 1, 1, 1),
(1, 2, '3', 1, 2, 3, 5, '', '', '', '', 10, 'hour(s)', 100, 100.1, 100.1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_file`
--

DROP TABLE IF EXISTS `pm_activity_file`;
CREATE TABLE IF NOT EXISTS `pm_activity_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `activity_file_fkey` (`id_item`,`lang`),
  KEY `activity_file_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session`
--

DROP TABLE IF EXISTS `pm_activity_session`;
CREATE TABLE IF NOT EXISTS `pm_activity_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_activity` int(11) NOT NULL,
  `days` varchar(20) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `price` double DEFAULT '0',
  `price_child` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `vat_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_session_fkey` (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session_hour`
--

DROP TABLE IF EXISTS `pm_activity_session_hour`;
CREATE TABLE IF NOT EXISTS `pm_activity_session_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_activity_session` int(11) NOT NULL,
  `start_h` int(11) DEFAULT NULL,
  `start_m` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_session_hour_fkey` (`id_activity_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_article`
--

DROP TABLE IF EXISTS `pm_article`;
CREATE TABLE IF NOT EXISTS `pm_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `text` longtext,
  `url` varchar(250) DEFAULT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `unpublish_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `article_lang_fkey` (`lang`),
  KEY `article_page_fkey` (`id_page`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_article`
--

INSERT INTO `pm_article` (`id`, `lang`, `title`, `subtitle`, `alias`, `text`, `url`, `tags`, `id_page`, `id_user`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `publish_date`, `unpublish_date`, `comment`, `rating`) VALUES
(1, 1, 'Манай зочид буудал', '', 'plongee', '<p>Манай зочид буудал нь 3 одны зэрэглэлтэй ба энгийн болон хагас люкс, люкс 180 өрөөнд 330 хүн хүлээн авах хүчин чадалтай. Хотын төвд хэрнээ дуу чимээнээс алс, өндөрлөг хэсэгт мод бутаар хүрээлүүлэн, намуухан орчинд байрлах манай буудлаас Улаанбаатар хот болон үзэсгэлэнт Богд уул, хүрээлэн буй орчин сэтгэл татам харагддаг нь бидний нэг давуу тал юм. Буудлаас та ихэнх шаардлагатай газар руугаа зорчиход тун тохиромжтой: Тухайлбал замын ачаалал бага үед Чингис Хаан Олон Улсын нисэх буудал машинаар ердөө л 20 минут, Төмөр замын буудал аравхан  минут л явах бөгөөд хотын төв хэсэг Сүхбаатарын талбай, бизнес, худалдааны төвүүд, театр, музей, галларейнүүд ердөө л 20минут алхах зайд байрлалтай.</p>\r\n', '', '', 5, 1, 1, 1, 1, 1478177832, 1478291164, NULL, NULL, 1, 0),
(1, 2, 'Dive into unknown waters!', '', 'scuba-diving', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Nullam molestie, nunc eu consequat varius, nisi metus iaculis nulla, nec ornare odio leo quis eros. Donec gravida eget velit eget pulvinar. Phasellus eget est quis est faucibus condimentum. Morbi tellus turpis, posuere vel tincidunt non, varius ac ante. Suspendisse in sem neque. Donec et faucibus justo. Nulla vitae nisl lacus. Fusce tincidunt quam nec vestibulum vestibulum. Vivamus vulputate, nunc non ullamcorper mattis, nunc orci imperdiet nulla, at laoreet ipsum nisl non leo. Aenean dapibus aliquet sem, ut lacinia magna mattis in.</p>\r\n\r\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempor arcu eu sapien ullamcorper sodales. Aenean eu massa in ante commodo scelerisque vitae sed sapien. Aenean eu dictum arcu. Mauris ultricies dolor eu molestie egestas.<br />\r\nProin feugiat, nunc at pellentesque fringilla, ex purus efficitur dolor, ac pretium odio lacus id leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse eu ipsum viverra dolor tempus vehicula eu eu risus. Praesent rutrum dapibus odio, nec accumsan justo fermentum in. Ut quis neque a ante facilisis bibendum.</p>\r\n', '', '', 5, 1, 1, 1, 1, 1478177832, 1478291164, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pm_article_file`
--

DROP TABLE IF EXISTS `pm_article_file`;
CREATE TABLE IF NOT EXISTS `pm_article_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `article_file_fkey` (`id_item`,`lang`),
  KEY `article_file_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_article_file`
--

INSERT INTO `pm_article_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(6, 1, 1, NULL, 1, 5, '4.jpg', NULL, 'image'),
(6, 2, 1, NULL, 1, 5, '4.jpg', NULL, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking`
--

DROP TABLE IF EXISTS `pm_booking`;
CREATE TABLE IF NOT EXISTS `pm_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_room` int(11) NOT NULL,
  `room` varchar(100) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `from_date` int(11) DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL,
  `nights` int(11) DEFAULT '1',
  `adults` int(11) DEFAULT '1',
  `children` int(11) DEFAULT '1',
  `amount` float DEFAULT NULL,
  `tourist_tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `down_payment` float DEFAULT NULL,
  `extra_services` text,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `comments` text,
  `status` int(11) DEFAULT '1',
  `trans` varchar(50) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  `payment_method` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_activity`
--

DROP TABLE IF EXISTS `pm_booking_activity`;
CREATE TABLE IF NOT EXISTS `pm_booking_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_booking` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `children` int(11) DEFAULT '0',
  `adults` int(11) DEFAULT '0',
  `duration` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_activity_fkey` (`id_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_comment`
--

DROP TABLE IF EXISTS `pm_comment`;
CREATE TABLE IF NOT EXISTS `pm_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(30) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `msg` longtext,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_country`
--

DROP TABLE IF EXISTS `pm_country`;
CREATE TABLE IF NOT EXISTS `pm_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_currency`
--

DROP TABLE IF EXISTS `pm_currency`;
CREATE TABLE IF NOT EXISTS `pm_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `sign` varchar(5) DEFAULT NULL,
  `main` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_currency`
--

INSERT INTO `pm_currency` (`id`, `code`, `sign`, `main`, `rank`) VALUES
(1, 'MNT', '₮', 1, 1),
(2, 'USD', '$', 0, 2),
(3, 'EUR', '€', 0, 3),
(4, 'GBP', '£', 0, 4),
(5, 'JPY', '¥', 0, 5),
(6, 'KRW', '₩', 0, 6),
(7, 'CNY', '¥', 0, 7),
(8, 'RUB', '₽', 0, 8),
(9, 'AUD', 'A$', 0, 9),
(10, 'CAD', 'C$', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pm_destination`
--

DROP TABLE IF EXISTS `pm_destination`;
CREATE TABLE IF NOT EXISTS `pm_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_destination`
--

INSERT INTO `pm_destination` (`id`, `name`, `checked`) VALUES
(1, 'Ulaanbaatar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility`
--

DROP TABLE IF EXISTS `pm_facility`;
CREATE TABLE IF NOT EXISTS `pm_facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `facility_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_facility`
--

INSERT INTO `pm_facility` (`id`, `lang`, `name`, `rank`) VALUES
(1, 1, 'Агаар цэвэршүүлэгч', 1),
(1, 2, 'Air conditioning', 1),
(2, 1, 'Хүүхдийн ор', 2),
(2, 2, 'Baby cot', 2),
(3, 1, 'Тагт', 3),
(3, 2, 'Balcony', 3),
(4, 1, 'Шорлогийн тавиур', 4),
(4, 2, 'Barbecue', 4),
(5, 1, 'Угаалгын өрөө', 5),
(5, 2, 'Bathroom', 5),
(6, 1, 'Кофе чанагч', 6),
(6, 2, 'Coffeemaker', 6),
(7, 1, 'Цахилгаан пилетка', 7),
(7, 2, 'Cooktop', 7),
(8, 1, 'Ширээ', 8),
(8, 2, 'Desk', 8),
(9, 1, 'Аяга таваг угаагч', 9),
(9, 2, 'Dishwasher', 9),
(10, 1, 'Сэнс', 10),
(10, 2, 'Fan', 10),
(11, 1, 'Үнэгүй зогсоол', 11),
(11, 2, 'Free parking', 11),
(12, 1, 'Хөргөгч', 12),
(12, 2, 'Fridge', 12),
(13, 1, 'Үсний сэнс', 13),
(13, 2, 'Hairdryer', 13),
(14, 1, 'Интернэт', 14),
(14, 2, 'Internet', 14),
(15, 1, 'Индүү', 15),
(15, 2, 'Iron', 15),
(16, 1, 'Бичил долгионы зуух', 16),
(16, 2, 'Microwave', 16),
(17, 1, 'Мини-бар', 17),
(17, 2, 'Mini-bar', 17),
(18, 1, 'Тамхи-татахыг хориглоно', 18),
(18, 2, 'Non-smoking', 18),
(19, 1, 'Төлбөртэй зогсоол', 19),
(19, 2, 'Paid parking', 19),
(20, 1, 'Гэрийн тэжээвэр амьтан зөвшөөрнө', 20),
(20, 2, 'Pets allowed', 20),
(21, 1, 'Гэрийн тэжээвэр амьтан зөвшөөрөхгүй', 21),
(21, 2, 'Pets not allowed', 21),
(22, 1, 'Радио', 22),
(22, 2, 'Radio', 22),
(23, 1, 'Сэйф', 23),
(23, 2, 'Safe', 23),
(24, 1, 'Кабелын ТВ', 24),
(24, 2, 'Satellite chanels', 24),
(25, 1, 'Шүршүүрийн өрөө', 25),
(25, 2, 'Shower-room', 25),
(26, 1, 'Жижиг амралтын өрөө', 26),
(26, 2, 'Small lounge', 26),
(27, 1, 'Суурин утас', 27),
(27, 2, 'Telephone', 27),
(28, 1, 'Зурагт', 28),
(28, 2, 'Television', 28),
(29, 1, 'Гадаа суух байгууламж', 29),
(29, 2, 'Terrasse', 29),
(30, 1, 'Угаалгын машин', 30),
(30, 2, 'Washing machine', 30),
(31, 1, 'Тэргэнцэртэй орж болох', 31),
(31, 2, 'Wheelchair accessible', 31),
(32, 1, 'Wi-Fi', 31),
(32, 2, 'WiFi', 31),
(33, 1, 'Hi-fi систем', 32),
(33, 2, 'Hi-fi system', 32),
(34, 1, 'DVD тоглуулагч', 33),
(34, 2, 'DVD player', 33),
(35, 1, 'Лифт', 34),
(35, 2, 'Elevator', 34),
(36, 1, 'Амралтын өрөө', 35),
(36, 2, 'Lounge', 35),
(37, 1, 'Ресторан', 36),
(37, 2, 'Restaurant', 36),
(38, 1, 'Өрөөний үйлчилгээ', 37),
(38, 2, 'Room service', 37),
(39, 1, 'Хувцасны өлгүүр', 38),
(39, 2, 'Cloakroom', 38);

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility_file`
--

DROP TABLE IF EXISTS `pm_facility_file`;
CREATE TABLE IF NOT EXISTS `pm_facility_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `facility_file_fkey` (`id_item`,`lang`),
  KEY `facility_file_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_facility_file`
--

INSERT INTO `pm_facility_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 31, 0, 1, 1, 'wheelchair.png', '', 'image'),
(1, 2, 31, 0, 1, 1, 'wheelchair.png', '', 'image'),
(2, 1, 20, 0, 1, 2, 'pet-allowed.png', '', 'image'),
(2, 2, 20, 0, 1, 2, 'pet-allowed.png', '', 'image'),
(3, 1, 21, 0, 1, 3, 'pet-not-allowed.png', '', 'image'),
(3, 2, 21, 0, 1, 3, 'pet-not-allowed.png', '', 'image'),
(4, 1, 3, 0, 1, 4, 'balcony.png', '', 'image'),
(4, 2, 3, 0, 1, 4, 'balcony.png', '', 'image'),
(5, 1, 4, 0, 1, 5, 'barbecue.png', '', 'image'),
(5, 2, 4, 0, 1, 5, 'barbecue.png', '', 'image'),
(6, 1, 8, 0, 1, 6, 'desk.png', '', 'image'),
(6, 2, 8, 0, 1, 6, 'desk.png', '', 'image'),
(7, 1, 6, 0, 1, 7, 'coffee.png', '', 'image'),
(7, 2, 6, 0, 1, 7, 'coffee.png', '', 'image'),
(8, 1, 24, 0, 1, 8, 'satellite.png', '', 'image'),
(8, 2, 24, 0, 1, 8, 'satellite.png', '', 'image'),
(9, 1, 1, 0, 1, 9, 'air-conditioning.png', '', 'image'),
(9, 2, 1, 0, 1, 9, 'air-conditioning.png', '', 'image'),
(10, 1, 23, 0, 1, 10, 'safe.png', '', 'image'),
(10, 2, 23, 0, 1, 10, 'safe.png', '', 'image'),
(11, 1, 26, 0, 1, 11, 'lounge.png', '', 'image'),
(11, 2, 26, 0, 1, 11, 'lounge.png', '', 'image'),
(12, 1, 15, 0, 1, 12, 'iron.png', '', 'image'),
(12, 2, 15, 0, 1, 12, 'iron.png', '', 'image'),
(13, 1, 14, 0, 1, 13, 'adsl.png', '', 'image'),
(13, 2, 14, 0, 1, 13, 'adsl.png', '', 'image'),
(14, 1, 9, 0, 1, 14, 'dishwasher.png', '', 'image'),
(14, 2, 9, 0, 1, 14, 'dishwasher.png', '', 'image'),
(15, 1, 2, 0, 1, 15, 'baby-cot.png', '', 'image'),
(15, 2, 2, 0, 1, 15, 'baby-cot.png', '', 'image'),
(16, 1, 30, 0, 1, 16, 'washing-machine.png', '', 'image'),
(16, 2, 30, 0, 1, 16, 'washing-machine.png', '', 'image'),
(17, 1, 16, 0, 1, 17, 'microwaves.png', '', 'image'),
(17, 2, 16, 0, 1, 17, 'microwaves.png', '', 'image'),
(18, 1, 17, 0, 1, 18, 'mini-bar.png', '', 'image'),
(18, 2, 17, 0, 1, 18, 'mini-bar.png', '', 'image'),
(19, 1, 18, 0, 1, 19, 'non-smoking.png', '', 'image'),
(19, 2, 18, 0, 1, 19, 'non-smoking.png', '', 'image'),
(20, 1, 11, 0, 1, 20, 'free-parking.png', '', 'image'),
(20, 2, 11, 0, 1, 20, 'free-parking.png', '', 'image'),
(21, 1, 19, 0, 1, 21, 'paid-parking.png', '', 'image'),
(21, 2, 19, 0, 1, 21, 'paid-parking.png', '', 'image'),
(22, 1, 7, 0, 1, 22, 'cooktop.png', '', 'image'),
(22, 2, 7, 0, 1, 22, 'cooktop.png', '', 'image'),
(23, 1, 22, 0, 1, 23, 'radio.png', '', 'image'),
(23, 2, 22, 0, 1, 23, 'radio.png', '', 'image'),
(24, 1, 12, 0, 1, 24, 'fridge.png', '', 'image'),
(24, 2, 12, 0, 1, 24, 'fridge.png', '', 'image'),
(25, 1, 25, 0, 1, 25, 'shower.png', '', 'image'),
(25, 2, 25, 0, 1, 25, 'shower.png', '', 'image'),
(26, 1, 5, 0, 1, 26, 'bath.png', '', 'image'),
(26, 2, 5, 0, 1, 26, 'bath.png', '', 'image'),
(27, 1, 13, 0, 1, 27, 'hairdryer.png', '', 'image'),
(27, 2, 13, 0, 1, 27, 'hairdryer.png', '', 'image'),
(28, 1, 27, 0, 1, 28, 'phone.png', '', 'image'),
(28, 2, 27, 0, 1, 28, 'phone.png', '', 'image'),
(29, 1, 28, 0, 1, 29, 'tv.png', '', 'image'),
(29, 2, 28, 0, 1, 29, 'tv.png', '', 'image'),
(30, 1, 29, 0, 1, 30, 'terrasse.png', '', 'image'),
(30, 2, 29, 0, 1, 30, 'terrasse.png', '', 'image'),
(31, 1, 10, 0, 1, 31, 'fan.png', '', 'image'),
(31, 2, 10, 0, 1, 31, 'fan.png', '', 'image'),
(32, 1, 32, 0, 1, 32, 'wifi.png', '', 'image'),
(32, 2, 32, 0, 1, 32, 'wifi.png', '', 'image'),
(33, 1, 33, 0, 1, 33, 'hifi.png', '', 'image'),
(33, 2, 33, 0, 1, 33, 'hifi.png', '', 'image'),
(34, 1, 34, 0, 1, 34, 'dvd.png', '', 'image'),
(34, 2, 34, 0, 1, 34, 'dvd.png', '', 'image'),
(35, 1, 33, 0, 1, 33, 'elevator.png', '', 'image'),
(35, 2, 33, 0, 1, 33, 'elevator.png', '', 'image'),
(36, 1, 33, 0, 1, 33, 'lounge.png', '', 'image'),
(36, 2, 33, 0, 1, 33, 'lounge.png', '', 'image'),
(37, 1, 33, 0, 1, 33, 'restaurant.png', '', 'image'),
(37, 2, 33, 0, 1, 33, 'restaurant.png', '', 'image'),
(38, 1, 33, 0, 1, 33, 'room-service.png', '', 'image'),
(38, 2, 33, 0, 1, 33, 'room-service.png', '', 'image'),
(39, 1, 33, 0, 1, 33, 'cloakroom.png', '', 'image'),
(39, 2, 33, 0, 1, 33, 'cloakroom.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_hotel`
--

DROP TABLE IF EXISTS `pm_hotel`;
CREATE TABLE IF NOT EXISTS `pm_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `web` varchar(250) DEFAULT NULL,
  `descr` longtext,
  `facilities` varchar(250) DEFAULT NULL,
  `id_destination` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `hotel_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_hotel`
--

INSERT INTO `pm_hotel` (`id`, `lang`, `id_user`, `title`, `subtitle`, `alias`, `address`, `lat`, `lng`, `email`, `phone`, `web`, `descr`, `facilities`, `id_destination`, `home`, `checked`, `rank`) VALUES
(1, 1, 1, 'Зочид буудал', 'Зочид буудал', 'taracode-hotel', 'Ulaanbaatar, Mongolia', 4.455734, 73.718185, 'contact@taracode.mn', '+976 99999999', '', '<p>Манай зочид буудал нь 3 одны зэрэглэлтэй ба энгийн болон хагас люкс, люкс 180 өрөөнд 330 хүн хүлээн авах хүчин чадалтай. Хотын төвд хэрнээ дуу чимээнээс алс, өндөрлөг хэсэгт мод бутаар хүрээлүүлэн, намуухан орчинд байрлах манай буудлаас Улаанбаатар хот болон үзэсгэлэнт Богд уул, хүрээлэн буй орчин сэтгэл татам харагддаг нь бидний нэг давуу тал юм. Буудлаас та ихэнх шаардлагатай газар руугаа зорчиход тун тохиромжтой: Тухайлбал замын ачаалал бага үед Чингис Хаан Олон Улсын нисэх буудал машинаар ердөө л 20 минут, Төмөр замын буудал аравхан  минут л явах бөгөөд хотын төв хэсэг Сүхбаатарын талбай, бизнес, худалдааны төвүүд, театр, музей, галларейнүүд ердөө л 20минут алхах зайд байрлалтай.</p>\r\n\r\n<p>Манайх Европ, Монгол, Хятад, Япон ресторанууддаа нэгдүгээр зэргийн тогоочийн хийсэн амт чанартай зоогоор зочиддоо үйлчилдэг. Мөн манайд ачаалал ихтэй ажилладаг хүний алжаал ядаргааг тун сайн тайлах Япон хэв маягийн саун, массаж, гоо сайхны салон болон Караоке баар ажиллаж байна.</p>\r\n', '32,1,20,26,17,37,27,5,25,11,38', 1, 1, 1, 1),
(1, 2, 1, 'Royal Hotel', 'Luxury hotel overlooking the sea', 'royal-hotel', 'Ulaanbaatar, Mongolia', 4.455734, 73.718185, 'contact@taracode.mn', '+976 99999999', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquet felis massa, sed condimentum ligula feugiat et. Etiam facilisis euismod dignissim. Vivamus facilisis lorem ut purus pellentesque, nec sollicitudin lorem suscipit. Fusce sed enim ultricies, venenatis nunc ut, pharetra nunc. Quisque sollicitudin egestas varius. Nulla aliquet magna sapien, id malesuada felis lobortis id. Vivamus vulputate sed enim sit amet eleifend. Vivamus sit amet felis id urna vulputate maximus. Nullam fringilla sed turpis non volutpat. Cras ultrices diam velit, ac volutpat odio semper at. Sed pulvinar turpis imperdiet sapien hendrerit pulvinar.</p>\r\n', '32,1,20,26,17,37,27,5,25,11,38', 1, 1, 1, 1),
(2, 1, 1, 'Амралтын газар', 'Амралтын газар', 'tourist-camp', 'Ulaanbaatar, Mongolia', 98, 98, 'contact@taracode.mn', '+976 88888888', '', '', '', NULL, 1, 1, 2),
(2, 2, 1, '', '', '', 'Ulaanbaatar, Mongolia', 98, 98, 'contact@taracode.mn', '+976 88888888', '', '', '', NULL, 1, 1, 2),
(3, 1, 1, 'Мод захиалах', 'Мод захиалах', 'wood-sale', 'Ulaanbaatar, Mongolia', 98, 98, '', '', '', '', '', NULL, 1, 1, 3),
(3, 2, 1, '', '', '', 'Ulaanbaatar, Mongolia', 98, 98, '', '', '', '', '', NULL, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pm_hotel_file`
--

DROP TABLE IF EXISTS `pm_hotel_file`;
CREATE TABLE IF NOT EXISTS `pm_hotel_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `hotel_file_fkey` (`id_item`,`lang`),
  KEY `hotel_file_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_hotel_file`
--

INSERT INTO `pm_hotel_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 1, 0, 1, 1, '5555048217-1389b680d6-o.jpg', '', 'image'),
(1, 2, 1, 0, 1, 1, '5555048217-1389b680d6-o.jpg', '', 'image'),
(2, 1, 2, NULL, 1, 2, '6.jpg', NULL, 'image'),
(2, 2, 2, NULL, 1, 2, '6.jpg', NULL, 'image'),
(3, 1, 3, NULL, 1, 3, '9.jpg', NULL, 'image'),
(3, 2, 3, NULL, 1, 3, '9.jpg', NULL, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang`
--

DROP TABLE IF EXISTS `pm_lang`;
CREATE TABLE IF NOT EXISTS `pm_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `main` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `tag` varchar(20) DEFAULT NULL,
  `rtl` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_lang`
--

INSERT INTO `pm_lang` (`id`, `title`, `locale`, `main`, `checked`, `rank`, `tag`, `rtl`) VALUES
(1, 'Монгол', 'mn_MN', 1, 1, 2, 'mn', 0),
(2, 'English', 'en_GB', 0, 1, 1, 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang_file`
--

DROP TABLE IF EXISTS `pm_lang_file`;
CREATE TABLE IF NOT EXISTS `pm_lang_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_file_fkey` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_lang_file`
--

INSERT INTO `pm_lang_file` (`id`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 0, 1, 2, 'mn.png', '', 'image'),
(2, 2, 0, 1, 1, 'gb.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_location`
--

DROP TABLE IF EXISTS `pm_location`;
CREATE TABLE IF NOT EXISTS `pm_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `pages` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_location`
--

INSERT INTO `pm_location` (`id`, `name`, `address`, `lat`, `lng`, `checked`, `pages`) VALUES
(1, 'Tagtaa solution', 'Ulaanbaatar, Mongolia', 47.9216221, 106.9201769, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `pm_media`
--

DROP TABLE IF EXISTS `pm_media`;
CREATE TABLE IF NOT EXISTS `pm_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_media_file`
--

DROP TABLE IF EXISTS `pm_media_file`;
CREATE TABLE IF NOT EXISTS `pm_media_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_file_fkey` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_message`
--

DROP TABLE IF EXISTS `pm_message`;
CREATE TABLE IF NOT EXISTS `pm_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` longtext,
  `phone` varchar(100) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `msg` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_page`
--

DROP TABLE IF EXISTS `pm_page`;
CREATE TABLE IF NOT EXISTS `pm_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `title_tag` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `robots` varchar(20) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `intro` longtext,
  `text` longtext,
  `text2` longtext,
  `id_parent` int(11) DEFAULT NULL,
  `page_model` varchar(50) DEFAULT NULL,
  `article_model` varchar(50) DEFAULT NULL,
  `main` int(11) DEFAULT '1',
  `footer` int(11) DEFAULT '0',
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `system` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `page_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_page`
--

INSERT INTO `pm_page` (`id`, `lang`, `name`, `title`, `subtitle`, `title_tag`, `alias`, `descr`, `robots`, `keywords`, `intro`, `text`, `text2`, `id_parent`, `page_model`, `article_model`, `main`, `footer`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `comment`, `rating`, `system`) VALUES
(1, 1, 'Нүүр', 'Нүүр', 'Нүүр', 'Нүүр', '', '', 'index,follow', '', '', '<blockquote class="text-center">\r\n<p>Хамгийн сайн үйлчилгээг зөвхөн манайх</p>\r\n</blockquote>\r\n', '', NULL, 'home', 'home', 1, 0, 1, 1, 1, 1478177832, 1478495468, 0, 0, 0),
(1, 2, 'Home', 'Lorem ipsum dolor sit amet', '', 'Lorem ipsum dolor sit amet', '', '', 'index,follow', '', '', '<blockquote class="text-center">\r\n<p>A man travels the world over in search of what he needs and returns home to find it.</p>\r\n</blockquote>\r\n\r\n<p class="text-muted" style="text-align: center;">- George A. Moore -</p>\r\n', '', NULL, 'home', 'home', 1, 0, 1, 1, 1, 1478177832, 1478495468, 0, 0, 0),
(2, 1, 'Холбоо барих', 'Холбоо барих', '', 'Холбоо барих', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 1, 1, 0, 1, 11, 1478177832, 1478177832, 0, 0, 0),
(2, 2, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', '', NULL, 'contact', '', 1, 1, 0, 1, 11, 1478177832, 1478177832, 0, 0, 0),
(3, 1, 'Үйлчилгээний нөхцөл', 'Үйлчилгээний нөхцөл', '', 'Үйлчилгээний нөхцөл', 'legal-notices', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1478177832, 1478289732, 0, 0, 0),
(3, 2, 'Legal notices', 'Legal notices', '', 'Legal notices', 'legal-notices', '', 'index,follow', '', '', '', '', NULL, 'page', '', 0, 1, 0, 1, 12, 1478177832, 1478289732, 0, 0, 0),
(4, 1, 'Сайтын бүтэц', 'Сайтын бүтэц', '', 'Сайтын бүтэц', 'site-map', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1478177832, 1478289710, 0, 0, 0),
(4, 2, 'Sitemap', 'Sitemap', '', 'Sitemap', 'sitemap', '', 'index,follow', '', '', '', '', NULL, 'sitemap', '', 0, 1, 0, 1, 13, 1478177832, 1478289710, 0, 0, 0),
(5, 1, 'Бидний тухай', 'Бидний тухай', '', 'Бидний тухай', 'about-us', '', 'index,follow', '', '', '<p>Манай зочид буудал нь 3 одны зэрэглэлтэй ба энгийн болон хагас люкс, люкс 180 өрөөнд 330 хүн хүлээн авах хүчин чадалтай. Хотын төвд хэрнээ дуу чимээнээс алс, өндөрлөг хэсэгт мод бутаар хүрээлүүлэн, намуухан орчинд байрлах манай буудлаас Улаанбаатар хот болон үзэсгэлэнт Богд уул, хүрээлэн буй орчин сэтгэл татам харагддаг нь бидний нэг давуу тал юм. Буудлаас та ихэнх шаардлагатай газар руугаа зорчиход тун тохиромжтой: Тухайлбал замын ачаалал бага үед Чингис Хаан Олон Улсын нисэх буудал машинаар ердөө л 20 минут, Төмөр замын буудал аравхан  минут л явах бөгөөд хотын төв хэсэг Сүхбаатарын талбай, бизнес, худалдааны төвүүд, театр, музей, галларейнүүд ердөө л 20минут алхах зайд байрлалтай.Манайх Европ, Монгол, Хятад, Япон ресторанууддаа нэгдүгээр зэргийн тогоочийн хийсэн амт чанартай зоогоор зочиддоо үйлчилдэг. Мөн манайд ачаалал ихтэй ажилладаг хүний алжаал ядаргааг тун сайн тайлах Япон хэв маягийн саун, массаж, гоо сайхны салон болон Караоке баар ажиллаж байна.</p>\r\n', '<p>Манай буудлын ихэнх албан хаагчид англи, япон, орос болон бусад гадаад хэлээр зочидтойгоо харилцах чадвартай. Бидний үйл ажиллагаа, үйлчилгээний чанарыг үнэлж Цэцэг зочид буудлыг Монгол Улсын Засгийн Газраас хамгийн сайн үйл ажиллагаатай аж ахуйн нэгжүүдийн нэгээр тодруулан шалгаруулж байсан.</p>\r\n', NULL, 'page', 'article', 1, 0, 0, 1, 2, 1478177832, 1478289576, 0, 0, 0),
(5, 2, 'About us', 'About us', '', 'About us', 'about-us', '', 'index,follow', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla vel est at rhoncus. Cras porttitor ligula vel magna vehicula accumsan. Mauris eget elit et sem commodo interdum. Aenean dolor sem, tincidunt ac neque tempus, hendrerit blandit lacus. Vivamus placerat nulla in mi tristique, fringilla fermentum nisl vehicula. Nullam quis eros non magna tincidunt interdum ac eu eros. Morbi malesuada pulvinar ultrices. Etiam bibendum efficitur risus, sit amet venenatis urna ullamcorper non. Proin fermentum malesuada tortor, vitae mattis sem scelerisque in. Curabitur rutrum leo at mi efficitur suscipit. Vivamus tristique lorem eros, sit amet malesuada augue sodales sed.</p>\r\n', '<p>Etiam bibendum efficitur risus, sit amet venenatis urna ullamcorper non. Proin fermentum malesuada tortor, vitae mattis sem scelerisque in. Curabitur rutrum leo at mi efficitur.</p>\r\n', NULL, 'page', 'article', 1, 0, 0, 1, 2, 1478177832, 1478289576, 0, 0, 0),
(6, 1, 'Хайх', 'Хайх', '', 'Хайх', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 1, 14, 1478177832, 1478289687, 0, 0, 1),
(6, 2, 'Search', 'Search', '', 'Search', 'search', '', 'noindex,nofollow', '', '', '', '', NULL, 'search', '', 0, 0, 0, 1, 14, 1478177832, 1478289687, 0, 0, 1),
(7, 1, 'Амралтын газар', 'Амралтын газар', '', 'Амралтын газар', 'hotels-taracode-hotel-tourist-camp', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 1, 0, 0, 1, 5, 1478177832, 1478291886, 0, 0, 0),
(7, 2, 'Tourist camp', 'Tourist camp', '', 'Tourist camp', 'hotels-taracode-hotel-tourist-camp', '', 'index,follow', '', '', '', '', NULL, 'page', 'gallery', 1, 0, 0, 1, 5, 1478177832, 1478291886, 0, 0, 0),
(8, 1, '404', 'Алдаа 404 : Хуудас олдонгүй !', '', '404 хуудас олдонгүй', '404', '', 'noindex,nofollow', '', '', '<p>''Серверт таны хандсан URL хаяг алга байна.<br />\r\nЭнэ хуудас анхнаасаа байгаагүй, хаяг нь солигдсон эсвэл түр зуур хандах боломжгүй байна.</p>\r\n\r\n<p>Доорх зааврыг дагана уу :</p>\r\n\r\n<ul>\r\n  <li>Таны интернэт хөтөчийн хандах хэсэгт буй URL хаяг зөв бичигдсэн эсэхийг шалгана уу.</li>\r\n  <li>Хэрвээ та энэ хуудасруу сайтын холбоос линкээр дамжиж орсон эсвэл энэ алдаа нь серверийн алдаатай үйлдэл гэж үзэж байвал сайтын администраторт хандаж мэдэгдэнэ үү.</li>\r\n</ul>\r\n', '', NULL, '404', '', 0, 0, 0, 1, 15, 1478177832, 1478289667, 0, 0, 1),
(8, 2, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '<p>The wanted URL was not found on this server.<br />\r\nThe page you wish to display does not exist, or is temporarily unavailable.</p>\r\n\r\n<p>Thank you for trying the following actions :</p>\r\n\r\n<ul>\r\n  <li>Be sure the URL in the address bar of your browser is correctly spelt and formated.</li>\r\n  <li>If you reached this page by clicking a link or if you think that it is about an error of the server, contact the administrator to alert him.</li>\r\n</ul>\r\n', '', NULL, '404', '', 0, 0, 0, 1, 15, 1478177832, 1478289667, 0, 0, 1),
(9, 1, 'Зочид буудал', 'Зочид буудал', '', 'Зочид буудал', 'hotels', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 1, 0, 0, 1, 3, 1478177832, 1478291968, 0, 0, 1),
(9, 2, 'Hotel', 'Hotel', '', 'Hotel', 'hotels-taracode-hotel', '', 'index,follow', '', '', '', '', NULL, 'hotels', 'hotel', 1, 0, 0, 1, 3, 1478177832, 1478291968, 0, 0, 1),
(10, 1, 'Захиалга', 'Захиалга', '', 'Захиалга', 'booking', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', '', 1, 0, 0, 1, 6, 1478177832, 1478289871, 0, 0, 1),
(10, 2, 'Booking', 'Booking', '', 'Booking', 'booking', '', 'noindex,nofollow', '', '', '', '', NULL, 'booking', '', 1, 0, 0, 1, 6, 1478177832, 1478289871, 0, 0, 1),
(11, 1, 'Танилцуулга', 'Танилцуулга', '', 'Танилцуулга', 'booking-details', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1478177832, 1478289907, 0, 0, 1),
(11, 2, 'Details', 'Booking details', '', 'Booking details', 'booking-details', '', 'noindex,nofollow', '', '', '', '', 10, 'details', '', 0, 0, 0, 1, 8, 1478177832, 1478289907, 0, 0, 1),
(12, 1, 'Төлбөр тооцоо', 'Төлбөр тооцоо', '', 'Төлбөр тооцоо', 'payment', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1478177832, 1478289769, 0, 0, 1),
(12, 2, 'Payment', 'Payment', '', 'Payment', 'payment', '', 'noindex,nofollow', '', '', '', '', 13, 'payment', '', 0, 0, 0, 1, 10, 1478177832, 1478289769, 0, 0, 1),
(13, 1, 'Дүн', 'Захиалгын нийт дүн', '', 'Захиалгын нийт дүн', 'booking-summary', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1478177832, 1478289794, 0, 0, 1),
(13, 2, 'Summary', 'Booking summary', '', 'Booking summary', 'booking-summary', '', 'noindex,nofollow', '', '', '', '', 11, 'summary', '', 0, 0, 0, 1, 9, 1478177832, 1478289794, 0, 0, 1),
(14, 1, 'Бүртгэл', 'Бүртгэл', '', 'Бүртгэл', 'account', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1478177832, 1478289633, 0, 0, 1),
(14, 2, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', '', NULL, 'account', '', 0, 0, 0, 1, 16, 1478177832, 1478289633, 0, 0, 1),
(15, 1, 'Үйл ажиллагаа', 'Үйл ажиллагаа', '', 'Үйл ажиллагаа', 'booking-activities', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1478177832, 1478289888, 0, 0, 1),
(15, 2, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', '', 10, 'booking-activities', '', 1, 0, 0, 1, 7, 1478177832, 1478289888, 0, 0, 1),
(16, 1, 'Үйл ажиллагаа', 'Үйл ажиллагаа', '', 'Үйл ажиллагаа', 'activities', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 1, 0, 1, 4, 1478177832, 1478494887, 0, 0, 1),
(16, 2, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,nofollow', '', '', '', '', NULL, 'activities', 'activity', 0, 1, 0, 1, 4, 1478177832, 1478494887, 0, 0, 1),
(17, 1, 'Мод зарах', 'Мод зарах', 'Мод зарах', 'Мод зарах', 'sale', '', 'index,follow', NULL, 'Мод зарах', '', '', NULL, 'wood', 'wood', 1, 1, 0, 1, 17, 1478489653, 1478495597, 0, NULL, NULL),
(17, 2, 'Sale', 'Sale', 'Sale', 'Sale', 'sale', '', 'index,follow', NULL, '', '', '', NULL, 'wood', 'wood', 1, 1, 0, 1, 17, 1478489653, 1478495597, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_page_file`
--

DROP TABLE IF EXISTS `pm_page_file`;
CREATE TABLE IF NOT EXISTS `pm_page_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `page_file_fkey` (`id_item`,`lang`),
  KEY `page_file_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_rate`
--

DROP TABLE IF EXISTS `pm_rate`;
CREATE TABLE IF NOT EXISTS `pm_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_room` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` double DEFAULT '0',
  `child_price` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `people` int(11) DEFAULT NULL,
  `price_sup` double DEFAULT NULL,
  `fixed_sup` double DEFAULT NULL,
  `min_stay` int(11) DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `day_start` int(11) DEFAULT NULL,
  `day_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rate_room_fkey` (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_room`
--

DROP TABLE IF EXISTS `pm_room`;
CREATE TABLE IF NOT EXISTS `pm_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `max_children` int(11) DEFAULT '1',
  `max_adults` int(11) DEFAULT '1',
  `max_people` int(11) DEFAULT NULL,
  `min_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext,
  `facilities` text,
  `stock` int(11) DEFAULT '1',
  `price` double DEFAULT '0',
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `start_lock` int(11) DEFAULT NULL,
  `end_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `room_lang_fkey` (`lang`),
  KEY `room_hotel_fkey` (`id_hotel`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_room`
--

INSERT INTO `pm_room` (`id`, `lang`, `id_hotel`, `id_user`, `max_children`, `max_adults`, `max_people`, `min_people`, `title`, `subtitle`, `alias`, `descr`, `facilities`, `stock`, `price`, `home`, `checked`, `rank`, `start_lock`, `end_lock`) VALUES
(1, 1, 1, 1, 1, 2, 2, 1, 'Хоёр хүний өрөө', 'Хоёр хүний өрөө', 'chambre-double-deluxe', '<p>Буудлаас та ихэнх шаардлагатай газар руугаа зорчиход тун тохиромжтой: Тухайлбал замын ачаалал бага үед Чингис Хаан Олон Улсын нисэх буудал машинаар ердөө л 20 минут, Төмөр замын буудал аравхан  минут л явах бөгөөд хотын төв хэсэг Сүхбаатарын талбай, бизнес, худалдааны төвүүд, театр, музей, галларейнүүд ердөө л 20минут алхах зайд байрлалтай.</p>\r\n', '32,1,29,21,28,24,17,27,23,18,5,25,11,13', 1, 150000, 0, 1, 1, 1477958400, 1477958400),
(1, 2, 1, 1, 1, 2, 2, 1, 'Deluxe Double Bedroom', 'Breakfast included', 'deluxe-double-bedroom', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut eleifend diam. Etiam molestie quam at nunc tempus, ac porttitor ante rutrum. Donec ipsum orci, molestie sit amet nibh a, accumsan varius nisl. Suspendisse blandit efficitur interdum. Nulla auctor tortor eu volutpat imperdiet. Nam at tempus sapien, sit amet porttitor neque. Nam lacinia ex libero, vel egestas ante vehicula nec.</p>\r\n\r\n<p>Sed sed dignissim est. Donec egestas nisl eu congue rhoncus. Nulla finibus malesuada mauris, et pellentesque diam scelerisque non. Duis auctor dapibus augue sed malesuada. Nam placerat at libero quis aliquam. Phasellus quam orci, dapibus sit amet finibus a, convallis volutpat arcu. Nullam condimentum quam id urna scelerisque varius. Duis a metus metus.</p>\r\n', '32,1,29,21,28,24,17,27,23,18,5,25,11,13', 1, 150000, 0, 1, 1, 1477958400, 1477958400),
(2, 1, 1, 1, 1, 1, 1, 1, 'Нэг хүний люкс өрөө', 'Нэг хүний люкс өрөө', 'one-lux', '', '33,32,1', 1, 100000, 1, 1, 2, NULL, NULL),
(2, 2, 1, 1, 1, 1, 1, 1, '', '', '', '', '33,32,1', 1, 100000, 1, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_file`
--

DROP TABLE IF EXISTS `pm_room_file`;
CREATE TABLE IF NOT EXISTS `pm_room_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `room_file_fkey` (`id_item`,`lang`),
  KEY `room_file_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_room_file`
--

INSERT INTO `pm_room_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 1, 0, 1, 1, 'deluxe-double-room.jpg', '', 'image'),
(1, 2, 1, 0, 1, 1, 'deluxe-double-room.jpg', '', 'image'),
(2, 1, 2, NULL, 1, 2, '4.jpg', '', 'image'),
(2, 2, 2, NULL, 1, 2, '4.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_service`
--

DROP TABLE IF EXISTS `pm_service`;
CREATE TABLE IF NOT EXISTS `pm_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `descr` text,
  `long_descr` text,
  `type` varchar(50) DEFAULT NULL,
  `rooms` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `service_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_service`
--

INSERT INTO `pm_service` (`id`, `lang`, `id_user`, `title`, `descr`, `long_descr`, `type`, `rooms`, `price`, `vat_rate`, `checked`, `rank`) VALUES
(1, 1, 1, 'Ариун цэврийн хэрэгсэл (багц)', '1 гар нүүрийн алчуур, 1 том алчуур, 1 угаалгын өрөөний дэвсгэр', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(1, 2, 1, 'Rent of towel (kit)', '1 hand towel, 1 bath towel, 1 bath mat', '', 'qty-night', '4,1,3,2', 7, 10, 1, 1),
(2, 1, 1, 'Цэвэрлэгээ', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(2, 2, 1, 'Housework', '', '', 'package', '1,3,2', 50, 10, 1, 2),
(3, 1, 1, 'Халаалт', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(3, 2, 1, 'Heating', '', '', 'night', '1,3,2', 8, 10, 1, 3),
(4, 1, 1, 'Тэжээвэр амьтан', 'Төрөл үүлдрийн талаар дор бичнэ үү', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4),
(4, 2, 1, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 10, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide`
--

DROP TABLE IF EXISTS `pm_slide`;
CREATE TABLE IF NOT EXISTS `pm_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `legend` text,
  `url` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `slide_lang_fkey` (`lang`),
  KEY `slide_page_fkey` (`id_page`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_slide`
--

INSERT INTO `pm_slide` (`id`, `lang`, `legend`, `url`, `id_page`, `checked`, `rank`) VALUES
(4, 1, '', '', 1, 1, 1),
(4, 2, '', '', 1, 1, 1),
(6, 1, '', '', 1, 1, 2),
(6, 2, '', '', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide_file`
--

DROP TABLE IF EXISTS `pm_slide_file`;
CREATE TABLE IF NOT EXISTS `pm_slide_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT '0',
  `checked` int(11) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  KEY `slide_file_fkey` (`id_item`,`lang`),
  KEY `slide_file_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_slide_file`
--

INSERT INTO `pm_slide_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(7, 1, 4, NULL, 1, 1, '6.jpg', '', 'image'),
(7, 2, 4, NULL, 1, 1, '6.jpg', '', 'image'),
(9, 1, 6, NULL, 1, 2, '4.jpg', '', 'image'),
(9, 2, 6, NULL, 1, 2, '4.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_tag`
--

DROP TABLE IF EXISTS `pm_tag`;
CREATE TABLE IF NOT EXISTS `pm_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `tag_lang_fkey` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pm_text`
--

DROP TABLE IF EXISTS `pm_text`;
CREATE TABLE IF NOT EXISTS `pm_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`,`lang`),
  KEY `text_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_text`
--

INSERT INTO `pm_text` (`id`, `lang`, `name`, `value`) VALUES
(1, 1, 'CREATION', 'Үүсгэх'),
(1, 2, 'CREATION', 'Creation'),
(2, 1, 'MESSAGE', 'Зурвас'),
(2, 2, 'MESSAGE', 'Message'),
(3, 1, 'EMAIL', 'И-мэйл'),
(3, 2, 'EMAIL', 'E-mail'),
(4, 1, 'PHONE', 'Утас.'),
(4, 2, 'PHONE', 'Phone'),
(5, 1, 'FAX', 'Факс'),
(5, 2, 'FAX', 'Fax'),
(6, 1, 'COMPANY', 'Байгууллага'),
(6, 2, 'COMPANY', 'Company'),
(7, 1, 'COPY_CODE', 'Код хуулах'),
(7, 2, 'COPY_CODE', 'Copy the code'),
(8, 1, 'SUBJECT', 'Сэдэв'),
(8, 2, 'SUBJECT', 'Subject'),
(9, 1, 'REQUIRED_FIELD', 'Талбаруудыг бөглөнө үү'),
(9, 2, 'REQUIRED_FIELD', 'Required field'),
(10, 1, 'INVALID_CAPTCHA_CODE', 'Хамгаалалтын код буруу байна'),
(10, 2, 'INVALID_CAPTCHA_CODE', 'Invalid security code'),
(11, 1, 'INVALID_EMAIL', 'И-мэйл хаяг буруу байна'),
(11, 2, 'INVALID_EMAIL', 'Invalid email address'),
(12, 1, 'FIRSTNAME', 'Нэр'),
(12, 2, 'FIRSTNAME', 'Firstname'),
(13, 1, 'LASTNAME', 'Овог'),
(13, 2, 'LASTNAME', 'Lastname'),
(14, 1, 'ADDRESS', 'Хаяг'),
(14, 2, 'ADDRESS', 'Address'),
(15, 1, 'POSTCODE', 'Шуудангийн дугаар'),
(15, 2, 'POSTCODE', 'Post code'),
(16, 1, 'CITY', 'Хот'),
(16, 2, 'CITY', 'City'),
(17, 1, 'MOBILE', 'Утасны дугаар'),
(17, 2, 'MOBILE', 'Mobile'),
(18, 1, 'ADD', 'Нэмэх'),
(18, 2, 'ADD', 'Add'),
(19, 1, 'EDIT', 'Засах'),
(19, 2, 'EDIT', 'Edit'),
(20, 1, 'INVALID_INPUT', 'Буруу утга'),
(20, 2, 'INVALID_INPUT', 'Invalid input'),
(21, 1, 'MAIL_DELIVERY_FAILURE', 'Зурвасыг илгээх үед алдаа гарлаа.'),
(21, 2, 'MAIL_DELIVERY_FAILURE', 'A failure occurred during the delivery of this message.'),
(22, 1, 'MAIL_DELIVERY_SUCCESS', 'Санал хүсэлтээ бидэнрүү илгээсэнд баярлалаа.\nБид тантай тун удахгүй холбогдох болно.'),
(22, 2, 'MAIL_DELIVERY_SUCCESS', 'Thank you for your interest, your message has been sent.\nWe will contact you as soon as possible.'),
(23, 1, 'SEND', 'Илгээх'),
(23, 2, 'SEND', 'Send'),
(24, 1, 'FORM_ERRORS', 'Дараах формууд алдаатай байна.'),
(24, 2, 'FORM_ERRORS', 'The following form contains some errors.'),
(25, 1, 'FROM_DATE', 'Хэзээ'),
(25, 2, 'FROM_DATE', 'From'),
(26, 1, 'TO_DATE', 'хүртэл'),
(26, 2, 'TO_DATE', 'till'),
(27, 1, 'FROM', 'Хэнээс'),
(27, 2, 'FROM', 'From'),
(28, 1, 'TO', 'Хэнд'),
(28, 2, 'TO', 'to'),
(29, 1, 'BOOK', 'Захиалга'),
(29, 2, 'BOOK', 'Book'),
(30, 1, 'READMORE', 'Дэлгэрэнгүй'),
(30, 2, 'READMORE', 'Read more'),
(31, 1, 'BACK', 'Буцах'),
(31, 2, 'BACK', 'Back'),
(32, 1, 'DISCOVER', 'Нээх'),
(32, 2, 'DISCOVER', 'Discover'),
(33, 1, 'ALL', 'Бүгд'),
(33, 2, 'ALL', 'All'),
(34, 1, 'ALL_RIGHTS_RESERVED', 'Бүх эрх хуулиар хамгаалагдсан'),
(34, 2, 'ALL_RIGHTS_RESERVED', 'All rights reserved'),
(35, 1, 'FORGOTTEN_PASSWORD', 'Нууц үгээ мартсан уу ?'),
(35, 2, 'FORGOTTEN_PASSWORD', 'Forgotten password?'),
(36, 1, 'LOG_IN', 'Нэвтрэх'),
(36, 2, 'LOG_IN', 'Log in'),
(37, 1, 'SIGN_UP', 'Бүртгүүлэх'),
(37, 2, 'SIGN_UP', 'Sign up'),
(38, 1, 'LOG_OUT', 'Гарах'),
(38, 2, 'LOG_OUT', 'Log out'),
(39, 1, 'SEARCH', 'Хайх'),
(39, 2, 'SEARCH', 'Search'),
(40, 1, 'RESET_PASS_SUCCESS', 'Таны и-мэйл хаягруу шинэ нууц үгийг илгээлээ.'),
(40, 2, 'RESET_PASS_SUCCESS', 'Your new password was sent to you on your e-mail.'),
(41, 1, 'PASS_TOO_SHORT', 'Нууц үг хамгийн багадаа 6 тэмдэгт байна'),
(41, 2, 'PASS_TOO_SHORT', 'The password must contain 6 characters at least'),
(42, 1, 'PASS_DONT_MATCH', 'Нууц үг таарахгүй байна'),
(42, 2, 'PASS_DONT_MATCH', 'The passwords don''t match'),
(43, 1, 'ACCOUNT_EXISTS', 'Энэхүү и-мэйл хаяг бүртгэлтэй байна'),
(43, 2, 'ACCOUNT_EXISTS', 'An account already exists with this e-mail'),
(44, 1, 'ACCOUNT_CREATED', 'Таны мэдээллийг амжилттай бүртгэлээ. Та и-мэйл хаягаа шалгана уу'),
(44, 2, 'ACCOUNT_CREATED', 'Your account has been created. You will receive an email to confirm your account.'),
(45, 1, 'INCORRECT_LOGIN', 'Нэвтрэх мэдээлэл буруу байна.'),
(45, 2, 'INCORRECT_LOGIN', 'Incorrect login information.'),
(46, 1, 'I_SIGN_UP', 'Бүртгүүлэх'),
(46, 2, 'I_SIGN_UP', 'I sign up'),
(47, 1, 'ALREADY_HAVE_ACCOUNT', 'Та бүртгэлтэй юу'),
(47, 2, 'ALREADY_HAVE_ACCOUNT', 'I already have an account'),
(48, 1, 'MY_ACCOUNT', 'Миний мэдээлэл'),
(48, 2, 'MY_ACCOUNT', 'My account'),
(49, 1, 'COMMENTS', 'Сэтгэгдэлүүд'),
(49, 2, 'COMMENTS', 'Comments'),
(50, 1, 'LET_US_KNOW', 'Санал бодлоо хуваалцах'),
(50, 2, 'LET_US_KNOW', 'Let us know what you think'),
(51, 1, 'COMMENT_SUCCESS', 'Бидэнтэй холбогдсонд баярлалаа. Таны хүсэлтийг хүлээн авлаа.'),
(51, 2, 'COMMENT_SUCCESS', 'Thank you for your interest, your comment will be checked.'),
(52, 1, 'NO_SEARCH_RESULT', 'Хайлт илэрцгүй. Хайх утгаа дахин нягтална уу (> 3 тэмдэгтээс багагүй) эсвэл өөр үгээр хайна уу.'),
(52, 2, 'NO_SEARCH_RESULT', 'No result. Check the spelling terms of search (> 3 characters) or try other words.'),
(53, 1, 'SEARCH_EXCEEDED', 'Хайлтын тоо гүйцсэн.'),
(53, 2, 'SEARCH_EXCEEDED', 'Number of researches exceeded.'),
(54, 1, 'SECONDS', 'секунд'),
(54, 2, 'SECONDS', 'seconds'),
(55, 1, 'FOR_A_TOTAL_OF', 'нийт'),
(55, 2, 'FOR_A_TOTAL_OF', 'for a total of'),
(56, 1, 'COMMENT', 'Сэтгэгдэл'),
(56, 2, 'COMMENT', 'Comment'),
(57, 1, 'VIEW', 'Харах'),
(57, 2, 'VIEW', 'View'),
(58, 1, 'RECENT_ARTICLES', 'Сүүлийн нийтлэлүүд'),
(58, 2, 'RECENT_ARTICLES', 'Recent articles'),
(59, 1, 'RSS_FEED', 'RSS'),
(59, 2, 'RSS_FEED', 'RSS feed'),
(60, 1, 'COUNTRY', 'Улс'),
(60, 2, 'COUNTRY', 'Country'),
(61, 1, 'ROOM', 'Өрөө'),
(61, 2, 'ROOM', 'Room'),
(62, 1, 'INCL_VAT', 'НӨАТ орсон'),
(62, 2, 'INCL_VAT', 'incl. VAT'),
(63, 1, 'NIGHTS', 'Хоног'),
(63, 2, 'NIGHTS', 'night(s)'),
(64, 1, 'ADULTS', 'Том хүн'),
(64, 2, 'ADULTS', 'Adults'),
(65, 1, 'CHILDREN', 'Хүүхэд'),
(65, 2, 'CHILDREN', 'Children'),
(66, 1, 'PERSONS', 'хүн(ий)'),
(66, 2, 'PERSONS', 'person(s)'),
(67, 1, 'CONTACT_DETAILS', 'Холбоо барих'),
(67, 2, 'CONTACT_DETAILS', 'Contact details'),
(68, 1, 'NO_AVAILABILITY', 'Боломжгүй'),
(68, 2, 'NO_AVAILABILITY', 'No availability'),
(69, 1, 'AVAILABILITIES', 'Боломжтой'),
(69, 2, 'AVAILABILITIES', 'Availabilities'),
(70, 1, 'CHECK', 'Шалгах'),
(70, 2, 'CHECK', 'Check'),
(71, 1, 'BOOKING_DETAILS', 'Захиалгын дэлгэрэнгүй'),
(71, 2, 'BOOKING_DETAILS', 'Booking details'),
(72, 1, 'SPECIAL_REQUESTS', 'Тусгай хүсэлт'),
(72, 2, 'SPECIAL_REQUESTS', 'Special requests'),
(73, 1, 'PREVIOUS_STEP', 'Өмнөх алхам'),
(73, 2, 'PREVIOUS_STEP', 'Previous step'),
(74, 1, 'CONFIRM_BOOKING', 'Захиалга баталгаажуулах'),
(74, 2, 'CONFIRM_BOOKING', 'Confirm the booking'),
(75, 1, 'ALSO_DISCOVER', 'Төстэй'),
(75, 2, 'ALSO_DISCOVER', 'Also discover'),
(76, 1, 'CHECK_PEOPLE', 'Сонгосон өрөөнийхөө хүний тоог нягтална уу.'),
(76, 2, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(77, 1, 'BOOKING', 'Захиалга'),
(77, 2, 'BOOKING', 'Booking'),
(78, 1, 'NIGHT', 'Хоног'),
(78, 2, 'NIGHT', 'night'),
(79, 1, 'WEEK', 'долоо хоног'),
(79, 2, 'WEEK', 'week'),
(80, 1, 'EXTRA_SERVICES', 'Нэмэлт үйлчилгээ'),
(80, 2, 'EXTRA_SERVICES', 'Extra services'),
(81, 1, 'BOOKING_TERMS', ''),
(81, 2, 'BOOKING_TERMS', ''),
(82, 1, 'NEXT_STEP', 'Дараагийн алхам'),
(82, 2, 'NEXT_STEP', 'Next step'),
(83, 1, 'TOURIST_TAX', 'Жуулчны татвар'),
(83, 2, 'TOURIST_TAX', 'Tourist tax'),
(84, 1, 'CHECK_IN', 'Ирэх'),
(84, 2, 'CHECK_IN', 'Check in'),
(85, 1, 'CHECK_OUT', 'Гарах'),
(85, 2, 'CHECK_OUT', 'Check out'),
(86, 1, 'TOTAL', 'Нийт'),
(86, 2, 'TOTAL', 'Total'),
(87, 1, 'CAPACITY', 'Багтаамж'),
(87, 2, 'CAPACITY', 'Capacity'),
(88, 1, 'FACILITIES', 'Өрөөний эд зүйлс'),
(88, 2, 'FACILITIES', 'Facilities'),
(89, 1, 'PRICE', 'Үнэ'),
(89, 2, 'PRICE', 'Price'),
(90, 1, 'MORE_DETAILS', 'Дэлгэрэнгүй мэдээлэл'),
(90, 2, 'MORE_DETAILS', 'More details'),
(91, 1, 'FROM_PRICE', 'Эхлэх үнэ'),
(91, 2, 'FROM_PRICE', 'From'),
(92, 1, 'AMOUNT', 'Мөнгөн дүн'),
(92, 2, 'AMOUNT', 'Amount'),
(93, 1, 'PAY', 'Тооцоо шалгах'),
(93, 2, 'PAY', 'Check out'),
(94, 1, 'PAYMENT_PAYPAL_NOTICE', '"Тооцоо шалгах" товчлуур дээр дарснаар та, PayPal-ийн аюулгүй холбоос хуудасруу шилжих болно'),
(94, 2, 'PAYMENT_PAYPAL_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of PayPal'),
(95, 1, 'PAYMENT_CANCEL_NOTICE', 'Тооцоо цуцлагдлаа.<br>Манайхаар зочилсонд баярлалаа.'),
(95, 2, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(96, 1, 'PAYMENT_SUCCESS_NOTICE', 'Таны гүйлгээ амжилттай хийгдлээ.<br>Манайхаар үйлчлүүлсэнд баярлалаа !'),
(96, 2, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(97, 1, 'BILLING_ADDRESS', 'Тооцооны хаяг'),
(97, 2, 'BILLING_ADDRESS', 'Billing address'),
(98, 1, 'DOWN_PAYMENT', 'Урьдчилгаа төлбөр'),
(98, 2, 'DOWN_PAYMENT', 'Down payment'),
(99, 1, 'PAYMENT_CHECK_NOTICE', 'Нийт үнийн дүн {amount}-г бидэнрүү илгээсэнд баярлалаа.<br>Таны захиалгыг хүлээн авсны дараа баталгаажуулах болно.<br>Манайхаар үйлчлүүлсэнд баярлалаа !'),
(99, 2, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to "Panda Multi Resorts, Neeloafaru Magu, Maldives".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(100, 1, 'PAYMENT_ARRIVAL_NOTICE', 'Нийт үнийн дүн {amount}-г хүлээн авлаа.<br>Манайхаар үйлчлүүлсэнд баярлалаа!'),
(100, 2, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(101, 1, 'MAX_PEOPLE', 'Нийт хүний тоо'),
(101, 2, 'MAX_PEOPLE', 'Max people'),
(102, 1, 'VAT_AMOUNT', 'НӨАТ дүн'),
(102, 2, 'VAT_AMOUNT', 'VAT amount'),
(103, 1, 'MIN_NIGHTS', 'Доод тал нь (шөнө)'),
(103, 2, 'MIN_NIGHTS', 'Min nights'),
(104, 1, 'ROOMS', 'Өрөөнүүд'),
(104, 2, 'ROOMS', 'Rooms'),
(105, 1, 'RATINGS', 'Үнэлгээ'),
(105, 2, 'RATINGS', 'Rating(s)'),
(106, 1, 'MIN_PEOPLE', 'Х.бага хүний тоо'),
(106, 2, 'MIN_PEOPLE', 'Min people'),
(107, 1, 'HOTEL', 'Зочид Буудал'),
(107, 2, 'HOTEL', 'Hotel'),
(108, 1, 'MAKE_A_REQUEST', 'Хүсэлт гаргах'),
(108, 2, 'MAKE_A_REQUEST', 'Make a request'),
(109, 1, 'FULLNAME', 'Бүтэн нэр'),
(109, 2, 'FULLNAME', 'Full Name'),
(110, 1, 'PASSWORD', 'Нууц үг'),
(110, 2, 'PASSWORD', 'Password'),
(111, 1, 'LOG_IN_WITH_FACEBOOK', 'Facebook-ээр нэвтрэх'),
(111, 2, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(112, 1, 'OR', 'Эсвэл'),
(112, 2, 'OR', 'Or'),
(113, 1, 'NEW_PASSWORD', 'Шинэ нууц үг'),
(113, 2, 'NEW_PASSWORD', 'New password'),
(114, 1, 'NEW_PASSWORD_NOTICE', 'Өөрийнхөө бүртгэлийн и-мэйл хаягаа оруулна уу. Таны и-мэйл хаягруу шинэ нууц үгийг илгээх болно.'),
(114, 2, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(115, 1, 'USERNAME', 'Хэрэглэгчийн нэр'),
(115, 2, 'USERNAME', 'Username'),
(116, 1, 'PASSWORD_CONFIRM', 'Нууц үгээ баталгаажуулна уу'),
(116, 2, 'PASSWORD_CONFIRM', 'Confirm password'),
(117, 1, 'USERNAME_EXISTS', 'Ийм нэртэй хэрэглэгчийн бүртгэл аль хэдийн үүссэн байна'),
(117, 2, 'USERNAME_EXISTS', 'An account already exists with this username'),
(118, 1, 'ACCOUNT_EDIT_SUCCESS', 'Таны бүртгэлийн мэдээлэл өөрчлөгдлөө.'),
(118, 2, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(119, 1, 'ACCOUNT_EDIT_FAILURE', 'Таны бүртгэлийн мэдээллийг өөрчлөх үед алдаа гарлаа.'),
(119, 2, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(120, 1, 'ACCOUNT_CREATE_FAILURE', 'Бүртгэл үүсгэж чадсангүй.'),
(120, 2, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(121, 1, 'PAYMENT_CHECK', 'Дансаар'),
(121, 2, 'PAYMENT_CHECK', 'By check'),
(122, 1, 'PAYMENT_ARRIVAL', 'Биеэр'),
(122, 2, 'PAYMENT_ARRIVAL', 'On arrival'),
(123, 1, 'CHOOSE_PAYMENT', 'Төлбөрийн хэлбэрээ сонгоно уу'),
(123, 2, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(124, 1, 'PAYMENT_CREDIT_CARDS', 'Кредит карт'),
(124, 2, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(125, 1, 'MAX_ADULTS', 'Том хүний тоо'),
(125, 2, 'MAX_ADULTS', 'Max adults'),
(126, 1, 'MAX_CHILDREN', 'Хүүхдийн тоо'),
(126, 2, 'MAX_CHILDREN', 'Max children'),
(127, 1, 'PAYMENT_CARDS_NOTICE', '"Төлбөр төлөх" товчлуур дээр дарснаар та, 2Checkout.com-ийн аюулгүй холбоос сайтруу шилжих болно'),
(127, 2, 'PAYMENT_CARDS_NOTICE', 'Click on "Check Out" below, you will be redirected towards the secure site of 2Checkout.com'),
(128, 1, 'COOKIES_NOTICE', 'Cookie нь хэрэглэгчийн сэтгэл ханамжийг дээшлүүлэх үүднээс ашигдагдаж байна. Та манай сайтыг ашигласнаар, cookie хэрэглээг зөвшөөрч байгаа болно.'),
(128, 2, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(129, 1, 'DURATION', 'Үргэлжлэх хугацаа'),
(129, 2, 'DURATION', 'Duration'),
(130, 1, 'PERSON', 'Хүн'),
(130, 2, 'PERSON', 'Person'),
(131, 1, 'CHOOSE_A_DATE', 'Өдрөө сонгоно уу'),
(131, 2, 'CHOOSE_A_DATE', 'Choose a date'),
(132, 1, 'TIMESLOT', 'Цагийн хооронд'),
(132, 2, 'TIMESLOT', 'Time slot'),
(133, 1, 'ACTIVITIES', 'Үйл ажиллагаанууд'),
(133, 2, 'ACTIVITIES', 'Activities'),
(134, 1, 'DESTINATION', 'Чиглэл'),
(134, 2, 'DESTINATION', 'Destination'),
(135, 1, 'NO_HOTEL_FOUND', 'Зочид буудал олдсонгүй'),
(135, 2, 'NO_HOTEL_FOUND', 'No hotel found'),
(136, 1, 'FOR', 'for'),
(136, 2, 'FOR', 'for'),
(137, 1, 'FIND_ACTIVITIES_AND_TOURS', 'Бидний аялал, үйл ажиллагаатай танилцах'),
(137, 2, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours');

-- --------------------------------------------------------

--
-- Table structure for table `pm_user`
--

DROP TABLE IF EXISTS `pm_user`;
CREATE TABLE IF NOT EXISTS `pm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `fb_id` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_user`
--

INSERT INTO pm_user (id, name, email, login, pass, type, add_date, edit_date, checked, fb_id, address, postcode, city, company, country, mobile, phone, token) VALUES
(1, 'Administrator', 'USER_EMAIL', 'USER_LOGIN', 'USER_PASS', 'administrator', INSTALL_DATE, INSTALL_DATE, 1, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pm_widget`
--

DROP TABLE IF EXISTS `pm_widget`;
CREATE TABLE IF NOT EXISTS `pm_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `showtitle` int(11) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `allpages` int(11) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext,
  `class` varchar(200) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`lang`),
  KEY `widget_lang_fkey` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pm_widget`
--

INSERT INTO `pm_widget` (`id`, `lang`, `title`, `showtitle`, `pos`, `allpages`, `pages`, `type`, `content`, `class`, `checked`, `rank`) VALUES
(1, 1, 'Бидний тухай', 1, 'footer', 1, '', '', '<p style="text-align: justify;">Манай зочид буудал нь 3 одны зэрэглэлтэй ба энгийн болон хагас люкс, люкс 180 өрөөнд 330 хүн хүлээн авах хүчин чадалтай. Хотын төвд хэрнээ дуу чимээнээс алс, өндөрлөг хэсэгт мод бутаар хүрээлүүлэн, намуухан орчинд байрлах манай буудлаас Улаанбаатар хот болон үзэсгэлэнт Богд уул, хүрээлэн буй орчин сэтгэл татам харагддаг нь бидний нэг давуу тал юм. </p>\r\n', '', 1, 1),
(1, 2, 'About us', 1, 'footer', 1, '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget auctor ipsum. Mauris pharetra neque a mauris commodo, at aliquam leo malesuada. Maecenas eget elit eu ligula rhoncus dapibus at non erat. In sed velit eget eros gravida consectetur varius imperdiet lectus.</p>\r\n', '', 1, 1),
(3, 1, 'Сүүлийн нийтлэлүүд', 1, 'footer', 1, '', 'latest_articles', '', '', 1, 2),
(3, 2, 'Latest articles', 1, 'footer', 1, '', 'latest_articles', '', '', 1, 2),
(4, 1, 'Бидэнтэй холбогдох', 0, 'footer', 1, '', 'contact_informations', '', '', 1, 3),
(4, 2, 'Contact us', 0, 'footer', 1, '', 'contact_informations', '', '', 1, 3),
(5, 1, 'Footer form', 0, 'footer', 1, '', 'footer_form', '', 'footer-form mt10', 2, 4),
(5, 2, 'Footer form', 0, 'footer', 1, '', 'footer_form', '', 'footer-form mt10', 2, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pm_activity`
--
ALTER TABLE `pm_activity`
  ADD CONSTRAINT `activity_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_file`
--
ALTER TABLE `pm_activity_file`
  ADD CONSTRAINT `activity_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_activity` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `activity_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session`
--
ALTER TABLE `pm_activity_session`
  ADD CONSTRAINT `activity_session_fkey` FOREIGN KEY (`id_activity`) REFERENCES `pm_activity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session_hour`
--
ALTER TABLE `pm_activity_session_hour`
  ADD CONSTRAINT `activity_session_hour_fkey` FOREIGN KEY (`id_activity_session`) REFERENCES `pm_activity_session` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article`
--
ALTER TABLE `pm_article`
  ADD CONSTRAINT `article_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_page_fkey` FOREIGN KEY (`id_page`,`lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article_file`
--
ALTER TABLE `pm_article_file`
  ADD CONSTRAINT `article_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_article` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_activity`
--
ALTER TABLE `pm_booking_activity`
  ADD CONSTRAINT `booking_activity_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility`
--
ALTER TABLE `pm_facility`
  ADD CONSTRAINT `facility_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility_file`
--
ALTER TABLE `pm_facility_file`
  ADD CONSTRAINT `facility_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_facility` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `facility_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_hotel`
--
ALTER TABLE `pm_hotel`
  ADD CONSTRAINT `hotel_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_hotel_file`
--
ALTER TABLE `pm_hotel_file`
  ADD CONSTRAINT `hotel_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_hotel` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `hotel_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_lang_file`
--
ALTER TABLE `pm_lang_file`
  ADD CONSTRAINT `lang_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_media_file`
--
ALTER TABLE `pm_media_file`
  ADD CONSTRAINT `media_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_media` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
