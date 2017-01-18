-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-01-18 14:51:41
-- 服务器版本： 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsxwx`
--

-- --------------------------------------------------------

--
-- 表的结构 `docfreq`
--

CREATE TABLE `docfreq` (
  `year` char(4) DEFAULT NULL,
  `month1` int(255) DEFAULT '0',
  `month2` int(255) DEFAULT '0',
  `month3` int(255) DEFAULT '0',
  `month4` int(255) DEFAULT '0',
  `month5` int(255) DEFAULT '0',
  `month6` int(255) DEFAULT '0',
  `month7` int(255) DEFAULT '0',
  `month8` int(255) DEFAULT '0',
  `month9` int(255) DEFAULT '0',
  `month10` int(255) DEFAULT '0',
  `month11` int(255) DEFAULT '0',
  `month12` int(255) DEFAULT '0',
  `total` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `docfreq`
--

INSERT INTO `docfreq` (`year`, `month1`, `month2`, `month3`, `month4`, `month5`, `month6`, `month7`, `month8`, `month9`, `month10`, `month11`, `month12`, `total`) VALUES
('2013', 15, 68, 25, 56, 11, 13, 14, 15, 15, 14, 34, 45, 325),
('2014', 11, 13, 14, 56, 42, 21, 27, 15, 17, 10, 34, 45, 305),
('2015', 12, 34, 5, 6, 7, 84, 67, 89, 44, 56, 32, 34, 470),
('2016', 33, 34, 34, 56, 45, 33, 66, 45, 78, 45, 23, 47, 538),
('2017', 12, 23, 34, 45, 56, 67, 78, 12, 23, 34, 45, 56, 485);

-- --------------------------------------------------------

--
-- 表的结构 `month1`
--

CREATE TABLE `month1` (
  `word` varchar(100) NOT NULL,
  `freq` int(255) NOT NULL,
  `year` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `month1`
--

INSERT INTO `month1` (`word`, `freq`, `year`) VALUES
('like', 6, 2017),
('love', 5, 2017),
('instead', 5, 2017),
('hurt', 5, 2017),
('nothing', 5, 2017),
('last', 5, 2017),
('forget', 4, 2017),
('mind', 4, 2017),
('find', 4, 2017),
('best', 4, 2017),
('wish', 4, 2017),
('never', 4, 2017),
('remember', 4, 2017),
('don', 4, 2017),
('beg', 4, 2017),
('say', 4, 2017),
('too', 3, 2017),
('give', 2, 2017),
('see', 2, 2017),
('hate', 2, 2017),
('heaven', 9, 2016),
('piece', 6, 2016),
('fifteen', 6, 2016),
('losing', 6, 2016),
('trying', 6, 2016),
('like', 6, 2016),
('without', 6, 2016),
('sol', 5, 2016),
('heart', 4, 2016),
('feeling', 3, 2016),
('want', 3, 2016),
('run', 3, 2016),
('waste', 3, 2016),
('change', 3, 2016),
('don', 3, 2016),
('chorus', 3, 2016),
('truth', 3, 2016),
('time', 3, 2016),
('wild', 3, 2016),
('mistake', 3, 2016);

-- --------------------------------------------------------

--
-- 表的结构 `month2`
--

CREATE TABLE `month2` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `month2`
--

INSERT INTO `month2` (`word`, `freq`, `year`) VALUES
('appearance', 4, 2016),
('people', 3, 2016),
('society', 3, 2016),
('group', 2, 2016),
('plural', 2, 2016),
('commit', 2, 2016),
('create', 2, 2016),
('pluralistic', 2, 2016),
('turner', 2, 2016),
('other', 2, 2016),
('man', 2, 2016),
('inspire', 1, 2016),
('mild', 1, 2016),
('paper', 1, 2016),
('go', 1, 2016),
('earth', 1, 2016),
('still', 1, 2016),
('help', 1, 2016),
('superior', 1, 2016),
('death', 1, 2016);

-- --------------------------------------------------------

--
-- 表的结构 `month3`
--

CREATE TABLE `month3` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `month3`
--

INSERT INTO `month3` (`word`, `freq`, `year`) VALUES
('like', 7, 2016),
('play', 4, 2016),
('hobby', 4, 2016),
('game', 3, 2016),
('thing', 3, 2016),
('because', 2, 2016),
('enjoy', 2, 2016),
('sport', 2, 2016),
('different', 2, 2016),
('too', 2, 2016),
('card', 2, 2016),
('many', 2, 2016),
('favorite', 2, 2016),
('learn', 2, 2016),
('draw', 1, 2016),
('swim', 1, 2016),
('love', 1, 2016),
('final', 1, 2016),
('people', 1, 2016),
('being', 1, 2016);

-- --------------------------------------------------------

--
-- 表的结构 `month4`
--

CREATE TABLE `month4` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month5`
--

CREATE TABLE `month5` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month6`
--

CREATE TABLE `month6` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month7`
--

CREATE TABLE `month7` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month8`
--

CREATE TABLE `month8` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month9`
--

CREATE TABLE `month9` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month10`
--

CREATE TABLE `month10` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month11`
--

CREATE TABLE `month11` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `month12`
--

CREATE TABLE `month12` (
  `word` varchar(100) DEFAULT NULL,
  `freq` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `month12`
--

INSERT INTO `month12` (`word`, `freq`, `year`) VALUES
('thank', 15, 2016),
('applause', 12, 2016),
('sol', 12, 2016),
('know', 11, 2016),
('will', 10, 2016),
('not', 9, 2016),
('country', 9, 2016),
('campaign', 9, 2016),
('want', 7, 2016),
('who', 7, 2016),
('people', 6, 2016),
('let', 6, 2016),
('believe', 6, 2016),
('together', 6, 2016),
('now', 5, 2016),
('hope', 5, 2016),
('one', 5, 2016),
('work', 5, 2016),
('grateful', 4, 2016),
('still', 4, 2016);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `docfreq`
--
ALTER TABLE `docfreq`
  ADD UNIQUE KEY `year` (`year`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
