-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 11 月 15 日 11:16
-- 服务器版本: 5.0.90
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `db_delicious`
--

-- --------------------------------------------------------

--
-- 表的结构 `dr_taste`
--

CREATE TABLE IF NOT EXISTS `dr_taste` (
  `tasteid` bigint(20) unsigned NOT NULL auto_increment COMMENT '口味编号',
  `tastename` varchar(10) NOT NULL COMMENT '口味名',
  PRIMARY KEY  (`tasteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='口味表' AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dr_taste`
--

INSERT INTO `dr_taste` (`tasteid`, `tastename`) VALUES
(101, '清汤'),
(102, '微辣'),
(103, '麻辣'),
(104, '香甜'),
(105, '甘甜'),
(106, '酸辣'),
(107, '酸甜'),
(108, '鲜嫩'),
(109, '酥脆'),
(110, '醇厚'),
(111, '孜然'),
(112, '奥尔良');
