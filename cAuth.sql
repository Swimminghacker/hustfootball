-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 172.16.168.69
-- Generation Time: 2018-02-11 12:23:46
-- 服务器版本： 5.6.28-cdb2016-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cAuth`
--

-- --------------------------------------------------------

--
-- 表的结构 `cAppinfo`
--

CREATE TABLE `cAppinfo` (
  `appid` char(36) DEFAULT NULL,
  `secret` char(64) DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  `login_duration` int(11) DEFAULT NULL,
  `qcloud_appid` char(64) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cAppinfo`
--

INSERT INTO `cAppinfo` (`appid`, `secret`, `ip`, `login_duration`, `qcloud_appid`, `session_duration`) VALUES
('wxdf93781661e70f1f', '', '123.207.50.173', 1000, '1255776846', 2000);

-- --------------------------------------------------------

--
-- 表的结构 `championship`
--

CREATE TABLE `championship` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `shcool_id` int(255) NOT NULL,
  `code` int(10) NOT NULL,
  `is_ended` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `championship`
--

INSERT INTO `championship` (`id`, `name`, `year`, `shcool_id`, `code`, `is_ended`) VALUES
(1, '华工杯甲组', 2017, 1, 0, 0),
(2, '新生杯', 2017, 1, 3, 0),
(3, '华工杯乙组', 2017, 1, 1, 0),
(4, '女足华工杯', 2017, 1, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cSessionInfo`
--

CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `final`
--

CREATE TABLE `final` (
  `id` int(11) NOT NULL,
  `homeTeam` varchar(255) DEFAULT NULL,
  `guestTeam` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `belong` varchar(255) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `final`
--

INSERT INTO `final` (`id`, `homeTeam`, `guestTeam`, `score`, `time`, `belong`, `championship_id`) VALUES
(1, '电信', '生科', '1-3', '2017-11-13', 'semiFinal', 2),
(2, '环境', '生科', '2-0', '2017-11-15', 'final', 2),
(3, '环境', '软件', '8-0', '2017-11-10', 'quarterFinal', 2),
(4, '生科', '计算机', '8-0', '2017-11-10', 'quarterFinal', 2),
(5, '能源', '电信', '（2）2-2（3）', '2017-11-10', 'quarterFinal', 2),
(6, '土木', '机械', '4-0', '2017-11-10', 'quarterFinal', 2),
(11, '土木', '环境', '0-1', '2017-11-13', 'semiFinal', 2),
(12, '软件', '材料', '3-0', '2017-11-06', 'eighthFinal', 2),
(13, '光电', '机械', '0-2', '2017-11-06', 'eighthFinal', 2),
(14, '土木', '外国语', '3-0', '2017-11-06', 'eighthFinal', 2),
(15, '环境', '建规', '10-0', '2017-11-06', 'eighthFinal', 2),
(16, '生科', '物理', '6-0', '2017-11-03', 'eighthFinal', 2),
(17, '计算机', '管理', '2-1', '2017-11-03', 'eighthFinal', 2),
(18, '能源', '自动化', '2-1', '2017-11-03', 'eighthFinal', 2),
(19, '电信', '数学', '（2）1-1（1）', '2017-11-03', 'eighthFinal', 2),
(20, '物理', '能源', '2-4', '2017-05-21', 'final', 1),
(21, '电信', '公管', '0-1', '2017-05-21', 'final', 3),
(22, '经济', '自动化', '（1）2-2（0）', '2017-05-21', 'final', 4),
(23, '经济', '电信', '（1）2-2（3）', '2017-05-14', 'semiFinal', 3),
(24, '公管', '化学', '4-0', '2017-05-14', 'semiFinal', 3),
(25, '光电', '能源', '0-2', '2017-05-13', 'semiFinal', 1),
(26, '物理', '水电', '3-1', '2017-05-13', 'semiFinal', 1),
(27, '公管', '经济', '（1）1-1（2）', '2017-05-13', 'semiFinal', 4),
(28, '自动化', '电气', '1-0', '2017-05-14', 'semiFinal', 4),
(29, '经济', '环境', '2-0', '2017-05-07', 'quarterFinal', 3),
(30, '中欧', '公管', '2-6', '2017-05-07', 'quarterFinal', 3),
(31, '电信', '建规', '3-0', '2017-05-07', 'quarterFinal', 3),
(32, '化学', '生科', '（7）2-2（6）', '2017-05-07', 'quarterFinal', 3),
(33, '公管', '中欧', '7-0', '2017-05-06', 'quarterFinal', 4),
(34, '自动化', '物理', '1-0', '2017-05-06', 'quarterFinal', 4),
(35, '法学', '经济', '1-5', '2017-05-07', 'quarterFinal', 4),
(36, '电信', '电气', '0-2', '2017-05-07', 'quarterFinal', 4),
(37, '物理', '国光', '3-0', '2017-05-06', 'quarterFinal', 1),
(38, '光电', '机械', '3-0', '2017-05-06', 'quarterFinal', 1),
(39, '计算机', '水电', '（3）3-3（4）', '2017-05-06', 'quarterFinal', 1),
(40, '能源', '电气', '3-1', '2017-05-06', 'quarterFinal', 1);

-- --------------------------------------------------------

--
-- 表的结构 `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `match` int(30) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `goal` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `belong` varchar(10) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `group`
--

INSERT INTO `group` (`id`, `name`, `match`, `result`, `goal`, `score`, `belong`, `championship_id`) VALUES
(1, '土木', 3, '2/0/1', '8/2', '7', 'A', 2),
(2, '环境', 3, '2/1/0', '14/4', '6', 'A', 2),
(3, '机械', 3, '1/1/1', '6/2', '4', 'A', 2),
(4, '新闻', 3, '0/3/0', '0/18', '0', 'A', 2),
(5, '光电', 3, '3/0/0', '21/1', '9', 'B', 2),
(6, '管理', 3, '1/1/1', '9/6', '4', 'B', 2),
(7, '材料', 3, '1/1/1', '5/5', '4', 'B', 2),
(8, '社会', 3, '0/3/0', '0/23', '0', 'B ', 2),
(9, '计算机', 3, '3/0/0', '6/1', '9', 'C', 2),
(10, '数学', 3, '1/1/1', '5/4', '4', 'C', 2),
(11, '物理', 3, '1/1/1', '4/5', '4', 'C', 2),
(12, '船海', 3, '0/3/0', '1/6', '0', 'C', 2),
(13, '生科', 3, '3/0/0', '24/1', '9', 'D', 2),
(14, '软件', 3, '2/1/0', '17/5', '6', 'D', 2),
(15, '电气', 3, '1/2/0', '7/11', '3', 'D', 2),
(16, '公管', 3, '0/3/0', '1/31', '0', 'D', 2),
(17, '能源', 3, '3/0/0', '8/0', '9', 'E', 2),
(18, '建规', 3, '1/1/1', '3/3', '4', 'E', 2),
(19, '化学', 3, '1/2/0', '2/6', '3', 'E', 2),
(20, '经济', 3, '0/2/1', '2/6', '1', 'E', 2),
(21, '电信', 3, '3/0/0', '14/1', '9', 'F', 2),
(22, '外语', 3, '1/1/1', '4/3', '4', 'F', 2),
(23, '自动化', 3, '1/1/1', '6/6', '4', 'F', 2),
(24, '水电', 3, '0/3/0', '2/16', '0', 'F', 2),
(25, '物理', 5, '3/0/2', '15/8', '11', 'A', 1),
(26, '光电', 5, '3/1/1', '10/6', '10', 'A', 1),
(27, '计算机', 5, '3/2/0', '11/6', '9', 'A', 1),
(28, '电气', 5, '2/2/1', '14/7', '7', 'A', 1),
(29, '材料', 5, '1/2/2', '8/9', '5', 'A', 1),
(30, '船海', 5, '0/3/0', '1/19', '0', 'A', 1),
(31, '能源', 5, '2/0/3', '14/4', '9', 'B', 1),
(32, '水电', 5, '2/1/2', '10/8', '8', 'B', 1),
(33, '机械', 5, '1/0/3', '7/7', '6', 'B', 1),
(34, '国光', 5, '1/2/2', '10/16', '5', 'B', 1),
(35, '土木', 5, '1/2/2', '5/11', '5', 'B', 1),
(36, '自动化', 5, '1/2/2', '9/10', '5', 'B', 1);

-- --------------------------------------------------------

--
-- 表的结构 `honor`
--

CREATE TABLE `honor` (
  `id` int(11) NOT NULL,
  `yan_championship` varchar(255) NOT NULL,
  `yan_runnerup` varchar(255) NOT NULL,
  `hua_championship` varchar(255) NOT NULL,
  `hua_runnerup` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `honor`
--

INSERT INTO `honor` (`id`, `yan_championship`, `yan_runnerup`, `hua_championship`, `hua_runnerup`, `time`) VALUES
(1, '能源', '自动化', '能源', '物理', '16-17'),
(2, '国光', '机械', '国光', '光电', '15-16'),
(3, '国光', '机械', '光电', '能源', '14-15'),
(4, '电气', '光电', '光电', '材料', '13-14'),
(5, '光电', '电气', '光电', '能源', '12-13'),
(6, '能源', '机械', '材料', '电子', '11-12'),
(7, '材料', '计算机', '能源', '电子', '10-11'),
(8, '生科', '机械', '材料', '计算机', '09-10'),
(9, '机械', '能源', '材料', '计算机', '08-09'),
(10, '机械', '能源', '材料', '电信', '07-08'),
(11, '计算机', '机械', '电信', '材料', '06-07'),
(12, '控制', '机械', '控制', '生科', '05-06'),
(13, '材料', '自控', '电信', '计算机', '04-05'),
(14, '土木', '自控', '电信', '材料', '03-04'),
(15, '材料', '电信', '电信', '成教', '02-03'),
(16, '同济', '电力', '成教', '计算机', '01-02'),
(17, '材料', '自控', '电力', '计算机', '00-01'),
(18, '——', '——', '成教', '研究生院', '2000'),
(19, '——', '——', '成教', '能源', '1999'),
(20, '——', '——', '交通', '——', '1997'),
(21, '——', '——', '机械', '成教', '1995'),
(22, '——', '——', '机二系', '船海系', '1993'),
(23, '——', '——', '自控、船海', '——', '1991'),
(24, '——', '——', '自控', '——', '87、89');

-- --------------------------------------------------------

--
-- 表的结构 `playergoallist`
--

CREATE TABLE `playergoallist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `goals` int(255) DEFAULT NULL,
  `team` varchar(255) NOT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `playergoallist`
--

INSERT INTO `playergoallist` (`id`, `name`, `goals`, `team`, `championship_id`) VALUES
(1, '田纪遨', 13, '物理', 1),
(2, '吾孜艾力', 6, '计算机', 1),
(3, '阿卜杜萨拉木图尔荪', 5, '能源', 1),
(4, '赵一凡', 5, '国光', 1),
(5, '陈贵伦', 5, '电气', 1),
(6, '舒周攀\r\n', 4, '自动化', 1),
(7, '张子孺', 4, '自动化', 1),
(8, '和吉春', 4, '水电', 1),
(9, '杨子易\r\n', 4, '能源', 1),
(10, '陈祁\r\n', 4, '能源', 1),
(11, '周舜杰\r\n', 4, '计算机', 1),
(12, '毛乐源\r\n', 4, '电气', 1),
(13, '亚森江', 8, '经济', 3),
(14, '阿卜杜\r\n', 7, '环境', 3),
(15, '韩兴丰\r\n', 5, '中欧', 3),
(16, '邹旭东\r\n', 5, '公管', 3),
(17, '石维民\r\n', 5, '电信', 3),
(18, '毛正江\r\n', 4, '中欧', 3),
(19, '彭嘉恒\r\n', 4, '环境', 3),
(20, '李晓静\r\n', 4, '化学', 3),
(21, '刘永弘\r\n', 4, '电信', 3),
(22, '吉力格尔\r\n', 3, '生科', 3),
(23, '陈柯维\r\n', 3, '公管', 3),
(24, '李昀锐\r\n', 3, '公管', 3),
(25, '王子豪\r\n', 3, '公管', 3),
(26, '刘卓旭\r\n', 3, '法学', 3),
(27, '张瑞雪\r\n', 15, '经济', 4),
(28, '唐紫曦\r\n', 13, '公管', 4),
(29, '汪贺\r\n', 8, '物理', 4),
(30, '卢丽莹\r\n', 7, '自动化', 4),
(31, '李傅临\r\n', 6, '物理', 4),
(32, '邓珊\r\n', 6, '公管', 4),
(33, '黄玉杰\r\n', 4, '电气', 4),
(34, '廖园\r\n', 4, '电信', 4),
(35, '李纯漪\r\n', 3, '电气', 4),
(36, '吕圆真\r\n', 3, '法学', 4),
(37, '李思畅\r\n', 3, '自动化', 4),
(38, '石萌萌\r\n', 3, '中欧', 4),
(39, '季雨西\r\n', 3, '电气', 4),
(40, '卡德尔丁\r\n', 21, '生科', 2),
(41, '艾力江.麦麦提库尔班\r\n', 9, '土木', 2),
(42, '夏柔克.铁来克\r\n', 8, '环境', 2),
(43, '曾思哲\r\n', 8, '软件', 2),
(44, '何今\r\n', 6, '生科', 2),
(45, '特留别克.阿肯米亚提\r\n', 6, '光电', 2),
(46, '约尔开什.佧斯木\r\n', 6, '能源', 2),
(47, '石智\r\n', 5, '电信', 2),
(48, '廖先桥\r\n', 5, '光电', 2),
(49, '王宣焙\r\n', 5, '电气', 2),
(50, '艾尼瓦尔.穆萨\r\n', 5, '管理', 2),
(51, '王景浩\r\n', 5, '计算机', 2),
(52, '周展科\r\n', 5, '软件', 2),
(53, '尚坤\r\n', 5, '环境', 2),
(54, '董元昊\r\n', 5, '环境', 2),
(55, '覃思宇\r\n', 5, '电信', 2),
(56, '贺晴龙\r\n', 4, '环境', 2),
(57, '聂嘉琪\r\n', 4, '生科', 2),
(58, '杨旺星\r\n', 4, '自动化', 2);

-- --------------------------------------------------------

--
-- 表的结构 `playerredcardlist`
--

CREATE TABLE `playerredcardlist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `redCards` int(30) DEFAULT NULL,
  `championship_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `playerredcardlist`
--

INSERT INTO `playerredcardlist` (`id`, `name`, `team`, `redCards`, `championship_id`) VALUES
(1, '艾孜麦提江·玉素甫\r\n', '土木', 1, 1),
(2, '古颢语\r\n', '化学', 1, 3),
(4, '邓珊\r\n', '公管', 1, 4),
(5, '万星灿\r\n', '船海', 1, 2),
(6, '阿力木\r\n', '公管', 1, 2),
(7, '居修松\r\n', '社会', 1, 2),
(8, '陶皓然\r\n', '生科', 1, 2),
(9, '何存祥\r\n', '机械', 1, 2),
(10, '何然\r\n', '环境', 1, 2),
(11, '夏柔克.铁来克\r\n', '环境', 1, 2),
(12, '田一泽\r\n', '软件', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `playeryellowcardlist`
--

CREATE TABLE `playeryellowcardlist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `yellowCards` int(30) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `playeryellowcardlist`
--

INSERT INTO `playeryellowcardlist` (`id`, `name`, `team`, `yellowCards`, `championship_id`) VALUES
(1, '阿尔纳塔尔提甫汗\r\n', '水电', 4, 1),
(2, '沙力木\r\n', '水电', 3, 1),
(3, '祁雪原\r\n', '计算机', 3, 1),
(4, '刘旋\r\n', '自动化', 2, 1),
(5, '刘岩', '自动化', 2, 1),
(6, '李舵', '物理', 2, 1),
(7, '田纪遨', '物理', 2, 1),
(8, '张冰利\r\n', '土木', 2, 1),
(9, '和吉春', '水电', 2, 1),
(10, '艾和买提\r\n', '水电', 2, 1),
(11, '李岳', '能源', 2, 1),
(12, '阿卜杜萨拉木图尔荪\r\n', '能源', 2, 1),
(13, '李嘉银\r\n', '计算机', 2, 1),
(14, '戴博伦\r\n', '机械', 2, 1),
(15, '李宗仁', '机械', 2, 1),
(16, '刘铁峰\r\n', '国光', 2, 1),
(17, '刘旻\r\n', '外国语', 2, 3),
(18, '阿尔斯坦\r\n', '建规', 2, 3),
(19, '陈柯维\r\n', '公管', 2, 3),
(20, '李昀锐\r\n', '公管', 2, 3),
(21, '刘永弘\r\n', '电信', 2, 3),
(22, '邓晨\r\n', '自动化', 1, 4),
(23, '陈小芳\r\n', '中欧', 1, 4),
(24, '张瑞雪\r\n', '经济', 1, 4),
(25, '孙颖\r\n', '建规', 1, 4),
(26, '白珊\r\n', '化学', 1, 4),
(27, '宋学静\r\n', '管理', 1, 4),
(28, '朱琳\r\n', '公管', 1, 4),
(29, '范菁菁\r\n', '公管', 1, 4),
(30, '唐紫曦\r\n', '公管', 1, 4),
(31, '王一然\r\n', '公管', 1, 4),
(32, '贺诗雨\r\n', '法学', 1, 4),
(33, '黄美雪\r\n', '法学', 1, 4),
(34, '黄丹华\r\n', '电信', 1, 4),
(35, '吴云\r\n', '电信', 1, 4),
(36, '王娜娜\r\n', '电气', 1, 4),
(37, '陈林\r\n', '公管', 1, 2),
(38, '尚坤\r\n', '环境', 1, 2),
(39, '嘎玛\r\n', '环境', 1, 2),
(40, '蔡博涵\r\n', '环境', 1, 2),
(41, '强巴俄柱\r\n', '环境', 1, 2),
(42, '邓鸿峰\r\n', '船海', 1, 2),
(43, '练炳诚\r\n', '计算机', 1, 2),
(44, '贾子扬\r\n', '计算机', 1, 2),
(45, '张新驿\r\n', '软件', 1, 2),
(46, '林浩坤\r\n', '软件', 1, 2),
(47, '王泽祺\r\n', '软件', 1, 2),
(48, '张煜华\r\n', '电气', 1, 2),
(49, '王宣焙\r\n', '电气', 1, 2),
(50, '卡德尔丁\r\n', '生科', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `questionandanswer`
--

CREATE TABLE `questionandanswer` (
  `id` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `questionandanswer`
--

INSERT INTO `questionandanswer` (`id`, `question`, `answer`) VALUES
(1, 'Q：这是什么？', 'A：这是专门为华科足球圈打造的小程序'),
(3, 'Q：是谁在管理维护这些数据？', 'A：现在是由“华科十二码”团队在后台进行管理维护这些数据'),
(4, 'Q：发现数据或者信息有问题？', 'A：欢迎大家指正，可以向负责人反馈，QQ：1091390188'),
(5, 'Q：球队校内积分是怎么算的？', 'A：参考国际足联的规则，根据赛事重要级别、对手实力等因素综合考虑。具体可以参考”华科十二码“微信公众号历史消息：《华科校内球队积分排名是如何实现的》'),
(6, 'Q：小程序是谁开发维护的？', 'A：由华科Swimming开发，由于单兵作战，会有很多值得改进之处，欢迎大家提出宝贵的建议。'),
(7, 'Q：觉得这些页面好丑怎么办？', 'A：原谅一个典型理工科生的审美。。。'),
(8, 'Q：我不是华科的，自己学校也希望有这样一个小程序怎么办？', 'A：如果非华科需要，可以联系开发者：QQ495730364，后期可能考虑满足不同学校入驻该小程序。');

-- --------------------------------------------------------

--
-- 表的结构 `schedulelist`
--

CREATE TABLE `schedulelist` (
  `id` int(11) NOT NULL,
  `time` date DEFAULT NULL,
  `homeTeam` varchar(255) NOT NULL,
  `guestTeam` varchar(255) NOT NULL,
  `score` varchar(255) DEFAULT NULL,
  `championship_id` int(11) NOT NULL,
  `round` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `schedulelist`
--

INSERT INTO `schedulelist` (`id`, `time`, `homeTeam`, `guestTeam`, `score`, `championship_id`, `round`, `group`) VALUES
(1, '2017-10-16', '环境', '新闻', '10-0', 2, 'first', 'A'),
(2, '2017-10-16', '土木', '机械', '12-2', 2, 'first', 'A'),
(3, '2017-10-16', '材料', '管理', '1-1', 2, 'first', 'B'),
(4, '2017-10-16', '光电', '社会', '12-0', 2, 'first', 'B'),
(5, '2017-10-16', '数学', '船海', '3-1', 2, 'first', 'C'),
(6, '2017-10-16', '计算机', '物理', '3-1', 2, 'first', 'C'),
(7, '2017-10-18', '自动化', '电信', '0-4', 2, 'first', 'F'),
(8, '2017-10-18', '外国语', '水电', '3-1', 2, 'first', 'F'),
(9, '2017-10-18', '化学', '建规', '0-2', 2, 'first', 'E'),
(10, '2017-10-18', '能源', '经济', '3-0', 2, 'first', 'E'),
(11, '2017-10-18', '电气', '生科', '0-7', 2, 'first', 'D'),
(12, '2017-10-18', '软件', '公管', '12-1', 2, 'first', 'D'),
(13, '2017-10-20', '物理', '数学', '2-2', 2, 'second', 'C'),
(14, '2017-10-20', '计算机', '船海', '2-0', 2, 'second', 'C'),
(15, '2017-10-20', '光电', '材料', '4-1', 2, 'second', 'B'),
(16, '2017-10-20', '新闻', '土木', '0-3', 2, 'second', 'A'),
(17, '2017-10-20', '社会', '管理', '0-8', 2, 'second', 'B'),
(18, '2017-10-20', '机械', '环境', '0-1', 2, 'second', 'A'),
(19, '2017-10-20', '机械', '环境', '0-1', 2, 'second', 'A'),
(20, '2017-10-23', '电气', '软件', '-', 2, 'second', 'D'),
(21, '2017-10-23', '生科', '公管', '-', 2, 'second', 'D'),
(22, '2017-10-23', '建规', '经济', '-', 2, 'second', 'E'),
(23, '2017-10-23', '化学', '能源', '-', 2, 'second', 'E'),
(24, '2017-10-23', '外国语', '自动化', '-', 2, 'second', 'F '),
(25, '2017-10-23', '水电', '电信', '-', 2, 'second', 'F'),
(26, '2017-10-25', '土木', '环境', '-', 2, 'third', 'A'),
(27, '2017-10-25', '新闻', '机械', '-', 2, 'third', 'A'),
(28, '2017-10-25', '材料', '社会', '-', 2, 'third', 'B'),
(29, '2017-10-25', '管理', '光电', '-', 2, 'third', 'B'),
(30, '2017-10-25', '船海', '物理', '-', 2, 'third', 'C'),
(31, '2017-10-25', '数学', '计算机', '-', 2, 'third', 'C'),
(32, '2017-10-27', '公管', '电气', '-', 2, 'third', 'D'),
(33, '2017-10-27', '软件', '生科', '-', 2, 'third', 'D'),
(34, '2017-10-27', '建规', '能源', '-', 2, 'third', 'E'),
(35, '2017-10-27', '化学', '经济', '-', 2, 'third', 'E'),
(36, '2017-10-27', '电信', '外国语', '-', 2, 'third', 'F'),
(37, '2017-10-27', '水电', '自动化', '-', 2, 'third', 'F'),
(38, '2017-04-08', '国光', '机械', '4-2', 1, 'first', 'B'),
(39, '2017-04-08', '土木', '能源', '0-6', 1, 'first', 'B'),
(40, '2017-04-08', '水电', '自动化', '3-2', 1, 'first', 'B'),
(41, '2017-04-08', '电气', '计算机', '3-2', 1, 'first', 'A'),
(42, '2017-04-08', '光电', '材料', '2-1', 1, 'first', 'A'),
(43, '2017-04-08', '船海', '物理', '0-3', 1, 'first', 'A'),
(44, '2017-04-11', '船海', '光电', '0-1', 1, 'second', 'A'),
(45, '2017-04-11', '电气', '材料', '1-1', 1, 'second', 'A'),
(46, '2017-04-11', '物理', '计算机', '3-0', 1, 'second', 'A'),
(47, '2017-04-12', '自动化', '国光', '2-3', 1, 'second', 'B'),
(48, '2017-04-12', '土木', '机械', '0-0', 1, 'second', 'B'),
(49, '2017-04-12', '能源', '水电', '1-1', 1, 'second', 'B'),
(50, '2017-04-15', '材料', '船海', '2-1', 1, 'third', 'A'),
(51, '2017-04-15', '计算机', '光电', '3-0', 1, 'third', 'A'),
(52, '2017-04-15', '电气', '物理', '1-2', 1, 'third', 'A'),
(53, '2017-04-15', '自动化', '机械', '2-2', 1, 'third', 'B'),
(54, '2017-04-15', '水电', '土木', '1-2', 1, 'third', 'B'),
(55, '2017-04-15', '国光', '能源', '0-5', 1, 'third', 'B'),
(56, '2017-04-18', '船海', '电气', '0-8', 1, 'forth', 'A'),
(57, '2017-04-18', '物理', '光电', '3-3', 1, 'forth', 'A'),
(58, '2017-04-18', '材料', '计算机', '0-1', 1, 'forth', 'A'),
(59, '2017-04-19', '土木', '自动化', '2-1', 1, 'forth', 'B'),
(60, '2017-04-19', '水电', '国光', '3-3', 1, 'forth', 'B'),
(61, '2017-04-19', '机械', '能源', '1-1', 1, 'forth', 'B'),
(62, '2017-04-22', '计算机', '船海', '5-0', 1, 'fifth', 'A'),
(63, '2017-04-22', '物理', '材料', '4-4', 1, 'fifth', 'A'),
(64, '2017-04-22', '光电', '电气', '2-1', 1, 'fifth', 'A'),
(65, '2017-04-22', '能源', '自动化', '1-1', 1, 'fifth', 'B'),
(66, '2017-04-22', '机械', '水电', '0-2', 1, 'fifth', 'B'),
(67, '2017-04-22', '国光', '土木', '2-2', 1, 'fifth', 'B'),
(69, '2017-04-09', '管理', '中欧', '-', 3, 'first', 'A'),
(70, '2017-04-09', '社会', '经济', '-', 3, 'first', 'A'),
(71, '2017-04-09', '公管', '化学', '-', 3, 'first', 'B'),
(72, '2017-04-09', '环境', '新闻', '-', 3, 'first', 'B'),
(73, '2017-04-09', '电信', '外国语', '-', 3, 'first', 'C'),
(74, '2017-04-09', '化学', '软件', '-', 3, 'first', 'C'),
(75, '2017-04-09', '数学', '生科', '-', 3, 'first', 'D'),
(76, '2017-04-16', '管理', '经济', '-', 3, 'second', 'A'),
(77, '2017-04-16', '中欧', '社会', '-', 3, 'second', 'A'),
(78, '2017-04-16', '公管', '环境', '-', 3, 'second', 'B'),
(79, '2017-04-16', '法学', '新闻', '-', 3, 'second', 'B'),
(80, '2017-04-16', '电信', '化学', '-', 3, 'second', 'C'),
(81, '2017-04-16', '外国语', '软件', '-', 3, 'second', 'C'),
(82, '2017-04-16', '生科', '建规', '-', 3, 'second', 'D'),
(83, '2017-04-23', '社会', '管理', '-', 3, 'third', 'A'),
(84, '2017-04-23', '经济', '中欧', '-', 3, 'third', 'A'),
(85, '2017-04-23', '公管', '新闻', '-', 3, 'third', 'B'),
(86, '2017-04-23', '环境', '法学', '-', 3, 'third', 'B'),
(87, '2017-04-23', '软件', '电信', '-', 3, 'third', 'C'),
(88, '2017-04-23', '化学', '外国语', '-', 3, 'third', 'C'),
(89, '2017-04-23', '建规', '数学', '-', 3, 'third', 'D');

-- --------------------------------------------------------

--
-- 表的结构 `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `school`
--

INSERT INTO `school` (`id`, `name`, `nickname`) VALUES
(1, '华中科技大学', 'hust');

-- --------------------------------------------------------

--
-- 表的结构 `teamgoallist`
--

CREATE TABLE `teamgoallist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `goals` int(255) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `teamgoallist`
--

INSERT INTO `teamgoallist` (`id`, `name`, `goals`, `championship_id`) VALUES
(1, '电信', 13, 1),
(2, '船海', 12, 1);

-- --------------------------------------------------------

--
-- 表的结构 `teamranklist`
--

CREATE TABLE `teamranklist` (
  `id` int(11) NOT NULL,
  `rank` int(255) NOT NULL,
  `teamname` varchar(255) NOT NULL,
  `score` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `teamranklist`
--

INSERT INTO `teamranklist` (`id`, `rank`, `teamname`, `score`) VALUES
(1, 1, '电信', 100),
(2, 2, '水电', 100);

-- --------------------------------------------------------

--
-- 表的结构 `teamredcardslist`
--

CREATE TABLE `teamredcardslist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `redCards` int(255) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `teamredcardslist`
--

INSERT INTO `teamredcardslist` (`id`, `name`, `redCards`, `championship_id`) VALUES
(1, '电信', 1, 1),
(2, '自动化', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `teamyellowcardslist`
--

CREATE TABLE `teamyellowcardslist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `yellowCards` int(255) DEFAULT NULL,
  `championship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `teamyellowcardslist`
--

INSERT INTO `teamyellowcardslist` (`id`, `name`, `yellowCards`, `championship_id`) VALUES
(1, '水电', 11, 1),
(2, '国光', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `championship`
--
ALTER TABLE `championship`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cSessionInfo`
--
ALTER TABLE `cSessionInfo`
  ADD PRIMARY KEY (`open_id`),
  ADD KEY `openid` (`open_id`) USING BTREE,
  ADD KEY `skey` (`skey`) USING BTREE;

--
-- Indexes for table `final`
--
ALTER TABLE `final`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `honor`
--
ALTER TABLE `honor`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `playergoallist`
--
ALTER TABLE `playergoallist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `playerredcardlist`
--
ALTER TABLE `playerredcardlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `playeryellowcardlist`
--
ALTER TABLE `playeryellowcardlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `questionandanswer`
--
ALTER TABLE `questionandanswer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `schedulelist`
--
ALTER TABLE `schedulelist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `teamgoallist`
--
ALTER TABLE `teamgoallist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `teamranklist`
--
ALTER TABLE `teamranklist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `teamredcardslist`
--
ALTER TABLE `teamredcardslist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `teamyellowcardslist`
--
ALTER TABLE `teamyellowcardslist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `championship`
--
ALTER TABLE `championship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `final`
--
ALTER TABLE `final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- 使用表AUTO_INCREMENT `honor`
--
ALTER TABLE `honor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `playergoallist`
--
ALTER TABLE `playergoallist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- 使用表AUTO_INCREMENT `playerredcardlist`
--
ALTER TABLE `playerredcardlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `playeryellowcardlist`
--
ALTER TABLE `playeryellowcardlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- 使用表AUTO_INCREMENT `questionandanswer`
--
ALTER TABLE `questionandanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `schedulelist`
--
ALTER TABLE `schedulelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- 使用表AUTO_INCREMENT `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `teamgoallist`
--
ALTER TABLE `teamgoallist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `teamranklist`
--
ALTER TABLE `teamranklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `teamredcardslist`
--
ALTER TABLE `teamredcardslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `teamyellowcardslist`
--
ALTER TABLE `teamyellowcardslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
