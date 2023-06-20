-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 03:29 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamify`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment`, `commentOn`, `commentBy`, `commentAt`) VALUES
(1, 'Interested', 3, 5, '0000-00-00 00:00:00'),
(2, 'efewf', 11, 7, '0000-00-00 00:00:00'),
(3, 'ken', 11, 7, '0000-00-00 00:00:00'),
(7, 'saldsa', 8, 7, '0000-00-00 00:00:00'),
(9, 'as', 11, 7, '0000-00-00 00:00:00'),
(13, 'j', 7, 7, '0000-00-00 00:00:00'),
(20, 'aw', 12, 7, '0000-00-00 00:00:00'),
(23, 'd', 12, 7, '0000-00-00 00:00:00'),
(25, 'j', 13, 7, '0000-00-00 00:00:00'),
(26, 'j', 13, 7, '0000-00-00 00:00:00'),
(27, 'a', 12, 7, '0000-00-00 00:00:00'),
(28, 'w', 13, 7, '0000-00-00 00:00:00'),
(29, 's', 15, 7, '0000-00-00 00:00:00'),
(30, 's', 8, 7, '0000-00-00 00:00:00'),
(31, 'kle', 8, 7, '0000-00-00 00:00:00'),
(32, 'knf', 15, 7, '0000-00-00 00:00:00'),
(34, 'sadas', 37, 7, '0000-00-00 00:00:00'),
(35, 'asdasd', 22, 7, '0000-00-00 00:00:00'),
(36, 'dsfsd', 22, 7, '0000-00-00 00:00:00'),
(38, 's', 39, 7, '0000-00-00 00:00:00'),
(40, 'Sdad', 32, 7, '0000-00-00 00:00:00'),
(44, 's', 34, 7, '0000-00-00 00:00:00'),
(45, 'sss', 34, 7, '0000-00-00 00:00:00'),
(46, 's', 34, 7, '0000-00-00 00:00:00'),
(47, 's', 34, 7, '0000-00-00 00:00:00'),
(48, 'assd', 34, 7, '0000-00-00 00:00:00'),
(49, 'asd', 34, 7, '0000-00-00 00:00:00'),
(50, 'sad', 38, 7, '0000-00-00 00:00:00'),
(52, 's', 38, 7, '0000-00-00 00:00:00'),
(53, 's', 38, 7, '0000-00-00 00:00:00'),
(54, 'szf', 36, 7, '0000-00-00 00:00:00'),
(56, 's', 36, 7, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followOn`) VALUES
(1, 4, 3, '2021-04-28 09:45:14'),
(2, 5, 4, '2021-04-28 09:47:51'),
(3, 5, 3, '2021-04-28 09:48:47'),
(4, 4, 5, '2021-04-28 09:49:25'),
(6, 6, 3, '2023-06-13 19:35:47'),
(10, 6, 7, '2023-06-14 08:47:57'),
(12, 7, 2, '2023-06-14 12:42:39'),
(13, 7, 4, '2023-06-14 12:42:41'),
(14, 7, 5, '2023-06-14 13:54:55'),
(15, 7, 3, '2023-06-14 13:55:02'),
(16, 6, 4, '2023-06-14 14:24:31'),
(17, 6, 1, '2023-06-14 14:24:32'),
(21, 8, 3, '2023-06-18 18:34:57'),
(23, 8, 7, '2023-06-18 18:35:08'),
(24, 8, 4, '2023-06-18 18:35:18'),
(25, 8, 2, '2023-06-18 18:35:19'),
(26, 8, 1, '2023-06-18 18:35:20'),
(33, 7, 8, '2023-06-18 19:45:25'),
(35, 7, 6, '2023-06-18 19:45:27'),
(36, 7, 1, '2023-06-20 10:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeBy`, `likeOn`) VALUES
(1, 5, 3),
(4, 7, 8),
(5, 7, 13),
(6, 7, 12),
(7, 7, 11),
(8, 7, 7),
(9, 6, 11),
(10, 6, 12),
(11, 6, 13),
(24, 7, 32),
(25, 7, 27),
(26, 7, 34),
(27, 7, 38),
(28, 7, 37),
(29, 7, 39),
(30, 7, 49);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(1, 'Hii....How are you', 4, 5, '2021-04-28 09:48:33', 1),
(2, 'Hey, I am good', 5, 4, '2021-04-28 09:49:57', 0),
(3, 'what\'s about you', 5, 4, '2021-04-28 09:50:05', 0),
(4, 'Hello', 6, 7, '2023-06-14 13:43:23', 1),
(6, 'nice to meet you', 6, 7, '2023-06-14 13:43:57', 1),
(7, 'say my name', 7, 6, '2023-06-14 14:24:59', 1),
(9, 's', 6, 7, '2023-06-15 20:18:09', 1),
(10, 'jkab', 6, 7, '2023-06-15 20:18:20', 1),
(11, 'i wanna tell you somthing', 6, 7, '2023-06-15 20:26:28', 1),
(12, 'hello kartik', 2, 6, '2023-06-17 19:11:01', 0),
(13, 'what', 6, 7, '2023-06-17 19:18:03', 1),
(14, 'hey', 6, 7, '2023-06-17 19:18:14', 1),
(15, 'what', 7, 6, '2023-06-17 19:19:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','repost','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `time`, `status`) VALUES
(1, 3, 4, 4, 'follow', '2021-04-28 09:45:14', 0),
(2, 4, 5, 4, 'mention', '2021-04-28 09:47:45', 1),
(3, 4, 5, 5, 'follow', '2021-04-28 09:47:52', 1),
(4, 4, 5, 3, 'like', '2021-04-28 09:48:01', 1),
(5, 3, 5, 5, 'follow', '2021-04-28 09:48:47', 0),
(6, 5, 4, 4, 'follow', '2021-04-28 09:49:25', 0),
(7, 3, 6, 6, 'follow', '2023-06-13 19:35:24', 0),
(8, 3, 6, 6, 'follow', '2023-06-13 19:35:47', 0),
(9, 6, 6, 7, 'repost', '2023-06-13 19:40:21', 1),
(10, 6, 7, 7, 'follow', '2023-06-13 19:42:05', 1),
(11, 6, 7, 7, 'repost', '2023-06-13 19:44:01', 1),
(12, 6, 7, 8, 'repost', '2023-06-13 19:44:58', 1),
(13, 2, 7, 11, 'mention', '2023-06-13 19:45:41', 0),
(14, 6, 7, 8, 'like', '2023-06-13 19:46:45', 1),
(15, 6, 7, 7, 'follow', '2023-06-13 20:39:29', 1),
(16, 7, 7, 13, 'repost', '2023-06-14 08:14:40', 1),
(17, 7, 6, 6, 'follow', '2023-06-14 08:47:55', 1),
(18, 7, 6, 6, 'follow', '2023-06-14 08:47:57', 1),
(19, 7, 6, 14, 'repost', '2023-06-14 08:48:19', 1),
(20, 1, 7, 7, 'follow', '2023-06-14 12:42:30', 0),
(21, 2, 7, 7, 'follow', '2023-06-14 12:42:39', 0),
(22, 4, 7, 7, 'follow', '2023-06-14 12:42:41', 0),
(23, 6, 7, 7, 'like', '2023-06-14 13:38:21', 1),
(24, 5, 7, 7, 'follow', '2023-06-14 13:54:55', 0),
(25, 3, 7, 7, 'follow', '2023-06-14 13:55:02', 0),
(26, 4, 7, 2, '', '2023-06-14 14:23:51', 0),
(27, 4, 6, 6, 'follow', '2023-06-14 14:24:31', 0),
(28, 1, 6, 6, 'follow', '2023-06-14 14:24:32', 0),
(29, 4, 6, 19, '', '2023-06-14 14:25:47', 0),
(30, 7, 6, 11, 'like', '2023-06-14 14:26:39', 1),
(31, 7, 6, 12, 'like', '2023-06-14 14:26:41', 1),
(32, 7, 6, 13, 'like', '2023-06-14 14:26:43', 1),
(33, 4, 7, 20, '', '2023-06-15 10:29:57', 0),
(34, 7, 7, 23, '', '2023-06-15 10:39:55', 1),
(35, 7, 6, 25, '', '2023-06-15 18:28:01', 1),
(36, 4, 6, 24, '', '2023-06-15 18:28:14', 0),
(37, 7, 6, 13, '', '2023-06-15 18:29:02', 1),
(38, 7, 6, 12, '', '2023-06-15 18:29:06', 1),
(39, 7, 6, 11, '', '2023-06-15 18:29:12', 1),
(40, 4, 7, 27, '', '2023-06-15 19:11:04', 0),
(41, 4, 6, 31, '', '2023-06-15 19:53:59', 0),
(42, 7, 6, 38, 'like', '2023-06-17 18:44:31', 1),
(43, 7, 6, 38, 'like', '2023-06-17 18:44:33', 1),
(44, 7, 6, 39, 'mention', '2023-06-17 19:14:36', 1),
(45, 6, 7, 39, '', '2023-06-17 19:16:20', 1),
(46, 6, 7, 39, 'like', '2023-06-17 19:17:34', 1),
(47, 6, 7, 39, 'like', '2023-06-17 20:46:22', 1),
(48, 6, 7, 39, 'like', '2023-06-17 20:46:32', 1),
(49, 6, 7, 39, 'like', '2023-06-17 20:46:34', 1),
(50, 6, 7, 39, 'like', '2023-06-17 20:46:35', 1),
(51, 6, 7, 39, 'like', '2023-06-17 20:47:00', 1),
(52, 6, 7, 7, 'follow', '2023-06-18 08:46:22', 1),
(53, 6, 7, 7, 'follow', '2023-06-18 17:04:46', 1),
(54, 6, 7, 7, 'follow', '2023-06-18 17:04:48', 1),
(55, 3, 8, 8, 'follow', '2023-06-18 18:34:57', 0),
(56, 7, 8, 8, 'follow', '2023-06-18 18:34:58', 1),
(57, 7, 8, 8, 'follow', '2023-06-18 18:35:08', 1),
(58, 4, 8, 8, 'follow', '2023-06-18 18:35:18', 0),
(59, 2, 8, 8, 'follow', '2023-06-18 18:35:19', 0),
(60, 1, 8, 8, 'follow', '2023-06-18 18:35:20', 0),
(61, 6, 8, 8, 'follow', '2023-06-18 18:35:29', 1),
(62, 5, 8, 8, 'follow', '2023-06-18 18:35:30', 0),
(63, 6, 7, 7, 'follow', '2023-06-18 19:45:12', 1),
(64, 8, 7, 7, 'follow', '2023-06-18 19:45:13', 0),
(65, 8, 7, 7, 'follow', '2023-06-18 19:45:16', 0),
(66, 6, 7, 7, 'follow', '2023-06-18 19:45:17', 1),
(67, 8, 7, 7, 'follow', '2023-06-18 19:45:25', 0),
(68, 6, 7, 7, 'follow', '2023-06-18 19:45:26', 1),
(69, 6, 7, 7, 'follow', '2023-06-18 19:45:27', 1),
(70, 6, 7, 39, 'like', '2023-06-20 09:37:47', 1),
(71, 7, 7, 38, 'repost', '2023-06-20 09:38:03', 1),
(72, 1, 7, 7, 'follow', '2023-06-20 10:07:19', 0),
(73, 7, 7, 37, 'repost', '2023-06-20 10:21:08', 1),
(74, 4, 7, 32, 'like', '2023-06-20 10:51:08', 0),
(75, 4, 7, 27, 'like', '2023-06-20 10:51:09', 0),
(76, 4, 7, 32, 'repost', '2023-06-20 11:02:53', 0),
(77, 7, 7, 22, 'repost', '2023-06-20 11:16:41', 1),
(78, 7, 7, 36, 'repost', '2023-06-20 11:17:58', 1),
(79, 7, 7, 34, 'repost', '2023-06-20 11:18:13', 1),
(80, 6, 7, 39, 'like', '2023-06-20 11:18:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `status` varchar(1000) NOT NULL,
  `postBy` int(11) NOT NULL,
  `repostID` int(11) NOT NULL,
  `repostBy` int(11) NOT NULL,
  `postImage` varchar(255) NOT NULL,
  `likesCount` int(11) NOT NULL,
  `repostCount` int(11) NOT NULL,
  `postedOn` datetime NOT NULL,
  `repostMsg` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `status`, `postBy`, `repostID`, `repostBy`, `postImage`, `likesCount`, `repostCount`, `postedOn`, `repostMsg`) VALUES
(1, 'Day 6 of #100daysofcode Learned about Recursions and Recursive Function. Done Problems on Fibonacci series &amp; Factorial. Need More Focus on Building Logic, Problem solving and thinking ability. #codingnewbies #coding #problemsolvingskills #programming', 4, 0, 0, 'users/code.jpg', 0, 0, '2021-04-28 09:33:19', ''),
(2, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 0, 0, 'users/google.png', 0, 1, '2021-04-28 09:43:21', ''),
(3, 'We are all excited for the #IndiaFacultySummit! Connect with #Google experts, get inspired, and expand your knowledge on Google technologies. Block your dates: April 23rd, 10:00 AM to 12:30 PM IST Have you registered for it? If not, register here https://goo.gle', 4, 0, 0, '', 1, 0, '2021-04-28 09:44:49', ''),
(4, 'Developed a web Application &quot;Twitter - The Social Media Platform&quot; with @nikhil01 It is a platform where user can interact with each other, share their thoughts, and messages known as #tweets. Frontend: #HTML #CSS #javaScript Backend: #php Framework: #Bootstrap Database: #MySql', 5, 0, 0, '', 0, 0, '2021-04-28 09:47:45', ''),
(7, 'k', 6, 0, 0, 'users/er2.png', 1, 2, '2023-06-13 19:40:02', ''),
(8, 'k', 6, 7, 6, 'users/er2.png', 1, 2, '2023-06-13 19:40:02', 'sadm'),
(9, 'k', 6, 7, 7, 'users/er2.png', 0, 2, '2023-06-13 19:40:02', 'kcna;nc'),
(10, 'k', 6, 8, 7, 'users/er2.png', 0, 2, '2023-06-13 19:40:02', 'Ken'),
(11, '@kartik001\r\nhey', 7, 0, 0, '', 2, 1, '2023-06-13 19:45:41', ''),
(12, 'sajdks', 7, 0, 0, '', 2, 1, '2023-06-13 19:47:13', ''),
(13, 'asdn', 7, 0, 0, '', 2, 2, '2023-06-13 19:47:23', ''),
(14, 'asdn', 7, 13, 7, '', 1, 2, '2023-06-13 19:47:23', 'w'),
(15, 'a', 6, 0, 0, '', 0, 0, '2023-06-14 08:48:13', ''),
(16, 'asdn', 7, 14, 6, '', 1, 2, '2023-06-13 19:47:23', 's'),
(17, 'skdnpasd', 7, 0, 0, '', 1, 0, '2023-06-14 14:04:25', ''),
(18, '#Google', 7, 0, 0, '', 2, 0, '2023-06-14 14:04:58', ''),
(19, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 2, 7, 'users/google.png', 0, 2, '2021-04-28 09:43:21', 'Hai boss'),
(20, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 19, 6, 'users/google.png', 0, 3, '2021-04-28 09:43:21', 's'),
(21, 'j', 7, 0, 0, '', 0, 0, '2023-06-15 10:04:14', ''),
(22, 's', 7, 0, 0, 'users/er2.png', 0, 1, '2023-06-15 10:20:55', ''),
(23, 'Say My Name', 7, 0, 0, 'users/breaking-bad-tv-show.jpg', 0, 1, '2023-06-15 10:28:06', ''),
(24, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 20, 7, 'users/google.png', 0, 4, '2021-04-28 09:43:21', 'g'),
(25, 'Say My Name', 7, 23, 7, 'users/breaking-bad-tv-show.jpg', 0, 2, '2023-06-15 10:28:06', 'Goddamn Right'),
(26, 'Say My Name', 7, 25, 6, 'users/breaking-bad-tv-show.jpg', 0, 2, '2023-06-15 10:28:06', 'x'),
(27, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 24, 6, 'users/google.png', 1, 5, '2021-04-28 09:43:21', 's'),
(28, 'asdn', 7, 13, 6, '', 2, 2, '2023-06-13 19:47:23', 'd'),
(29, 'sajdks', 7, 12, 6, '', 2, 1, '2023-06-13 19:47:13', 'd'),
(30, '@kartik001\r\nhey', 7, 11, 6, '', 2, 1, '2023-06-13 19:45:41', 'd'),
(31, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 27, 7, 'users/google.png', 0, 6, '2021-04-28 09:43:21', 's'),
(32, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 31, 6, 'users/google.png', 1, 7, '2021-04-28 09:43:21', 'haiya'),
(33, '', 7, 0, 0, 'users/mrbeast.jfif', 0, 0, '2023-06-15 19:55:13', ''),
(34, '', 7, 0, 0, 'users/images.jfif', 1, 1, '2023-06-15 20:02:58', ''),
(36, 'def', 7, 0, 0, 'users/breaking-bad-tv-show.jpg', 0, 1, '2023-06-15 20:06:16', ''),
(37, 'kn', 7, 0, 0, '', 1, 1, '2023-06-15 20:17:22', ''),
(38, 'sdf', 7, 0, 0, 'users/breaking-bad-tv-show.jpg', 1, 1, '2023-06-15 20:17:30', ''),
(39, '@theniue', 6, 0, 0, '', 1, 1, '2023-06-17 19:14:36', ''),
(40, '@theniue', 6, 39, 7, '', 0, 1, '2023-06-17 19:14:36', 'm'),
(41, 'sdf', 7, 38, 7, 'users/breaking-bad-tv-show.jpg', 1, 1, '2023-06-15 20:17:30', 'sa'),
(42, 'kn', 7, 37, 7, '', 1, 1, '2023-06-15 20:17:22', 'sdasd'),
(43, 'Let’s go to #GoogleIO!\r\n\r\n#GoogleIO brings together developers from around the world for thoughtful discussions, interactive learning with Google experts and a first look at Google’s latest developer products.\r\n\r\nDetails → https://goo.gle', 4, 32, 7, 'users/google.png', 1, 7, '2021-04-28 09:43:21', 'sda'),
(44, 's', 7, 22, 7, 'users/er2.png', 0, 1, '2023-06-15 10:20:55', 'sad'),
(45, 'def', 7, 36, 7, 'users/breaking-bad-tv-show.jpg', 0, 1, '2023-06-15 20:06:16', 'sad'),
(46, '', 7, 34, 7, 'users/images.jfif', 1, 1, '2023-06-15 20:02:58', 'saas'),
(47, 'sdf', 7, 0, 0, '', 0, 0, '2023-06-20 11:45:26', ''),
(48, 'sdf', 7, 0, 0, 'users/images.jfif', 0, 0, '2023-06-20 11:45:34', '');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `createdOn`) VALUES
(1, '100daysofcode', '2021-04-28 13:03:19'),
(6, 'GoogleIO', '2021-04-28 13:13:22'),
(8, 'IndiaFacultySummit', '2021-04-28 13:14:49'),
(10, 'tweets', '2021-04-28 13:17:45'),
(17, 'Google', '2023-06-14 19:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `screenName` varchar(40) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `bio` varchar(140) NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'chaurasia20', 'chaurasia@gmail.com', 'ab84e1ad31337246d6d98e3ca709eeaf', 'Yash Chaurasia', 'users/eat-sleep-code-repeat-saying-t-shirt-for-coder-vector-31386255.jpg', 'users/coding.png', 0, 3, 'Full Stack Developer | Freelancer', 'India', 'www.chaurasia.com'),
(2, 'kartik001', 'kartik@gmail.com', 'c8d39cdb56a46ad807969ee04c4e660b', 'Kartik Choubey', 'users/download.png', 'users/Dev wallpaper 1.jpg', 0, 2, 'BCA Student | Freelancer', 'India', 'www.kartik.com'),
(3, 'naman1999', 'naman@gmail.com', '98c8bc837481b93acfb0deef65e50127', 'Naman Jain', 'users/avtar2.jpg', 'users/Dev wallpaper 2.jpg', 0, 5, 'UI/UX Designer | Website Designer', 'India', 'www.naman.com'),
(4, 'nikhil01', 'nikhil@gmail.com', '350d89c1cd6592bbbd1ed2e8a4f3ddba', 'Nikhil Yadav', 'users/avtar.png', 'users/code.jpg', 2, 4, 'Software Developer | Freelancer', 'India', 'www.nikhil.com'),
(5, 'yashgaur908', 'yash@gmail.com', 'e76eb8a75988cb07c8428733a5dd4684', 'Yash Gaur', 'users/avtar1.jpg', 'users/Dev wallpaper.jpg', 2, 2, 'Software Developer | Website Designer', 'India', 'www.yashgaur.tk'),
(6, 'Kenzie', 'ken@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Kenzie', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 4, 1, '', '', ''),
(7, 'theniue', 'the@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'the', 'users/breaking-bad-tv-show.jpg', 'users/sc1.png', 7, 2, '', '', ''),
(8, 'kanakana', 'kena@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Kenzie', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 5, 1, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `createdOn` (`createdOn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
