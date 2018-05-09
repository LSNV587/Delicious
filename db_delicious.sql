-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 11 月 12 日 16:22
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
-- 表的结构 `dr_food`
--

CREATE TABLE IF NOT EXISTS `dr_food` (
  `foodid` bigint(20) unsigned NOT NULL auto_increment COMMENT '菜品编号',
  `sellerid` int(20) default NULL COMMENT '所属商家编号',
  `foodname` varchar(40) NOT NULL COMMENT '菜品名',
  `foodkind` int(10) default NULL COMMENT '菜式',
  `foodtaste` int(10) NOT NULL COMMENT '口味',
  `foodstyle` int(10) default NULL COMMENT '菜系',
  `foodpicture` varchar(200) NOT NULL COMMENT '图片',
  `foodprice` int(5) default NULL COMMENT '价格',
  `remark` varchar(2000) default NULL COMMENT '备注',
  `updatetime` varchar(15) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`foodid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='菜品主表' AUTO_INCREMENT=10002 ;

--
-- 转存表中的数据 `dr_food`
--

INSERT INTO `dr_food` (`foodid`, `sellerid`, `foodname`, `foodkind`, `foodtaste`, `foodstyle`, `foodpicture`, `foodprice`, `remark`, `updatetime`) VALUES
(10001, 101, '鱼香肉丝', 1001, 1001, 1001, 'xx.jpg', 16, 'test', '20171112');

-- --------------------------------------------------------

--
-- 表的结构 `dr_history`
--

CREATE TABLE IF NOT EXISTS `dr_history` (
  `historyid` bigint(20) unsigned NOT NULL auto_increment COMMENT '历史编号',
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `foodid` int(10) default NULL COMMENT '菜品id',
  PRIMARY KEY  (`historyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='浏览历史' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dr_history`
--

INSERT INTO `dr_history` (`historyid`, `username`, `foodid`) VALUES
(1, '0131123804', 10001),
(2, '0131123804', 10002),
(3, '0131123804', 10003);

-- --------------------------------------------------------

--
-- 表的结构 `dr_kind`
--

CREATE TABLE IF NOT EXISTS `dr_kind` (
  `kindid` int(10) default NULL COMMENT '菜式编号',
  `kindname` varchar(40) default NULL COMMENT '菜式名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜式表';

--
-- 转存表中的数据 `dr_kind`
--

INSERT INTO `dr_kind` (`kindid`, `kindname`) VALUES
(1001, '家常菜'),
(1002, '素菜'),
(1003, '凉菜'),
(1004, '下饭菜'),
(1005, '面食'),
(1006, '小吃'),
(1007, '粥汤'),
(1008, '煲汤'),
(1009, '私房菜'),
(1010, '糕点'),
(1011, '甜点'),
(1012, '饮品'),
(1013, '创意菜'),
(1014, '腌制'),
(1015, '自制'),
(1016, '酱料'),
(1017, '冰品'),
(1018, '热菜'),
(1019, '农家菜'),
(1020, '荤菜'),
(1021, '主食'),
(1022, '宴客菜'),
(1023, '开胃菜'),
(1024, '海鲜'),
(1025, '下酒菜'),
(1026, '卤菜');

-- --------------------------------------------------------

--
-- 表的结构 `dr_seller`
--

CREATE TABLE IF NOT EXISTS `dr_seller` (
  `sellerid` bigint(20) unsigned NOT NULL auto_increment COMMENT '商家ID',
  `shopname` varchar(40) NOT NULL COMMENT '店名',
  `shopkepper` varchar(40) NOT NULL COMMENT '店主',
  `tel` int(11) default NULL COMMENT '手机号',
  `logo` varchar(500) NOT NULL COMMENT '图标',
  `distance` int(5) default NULL COMMENT '距离',
  `slogan` varchar(150) default NULL COMMENT '标语',
  `updatetime` varchar(16) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`sellerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家信息表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dr_seller`
--


-- --------------------------------------------------------

--
-- 表的结构 `dr_style`
--

CREATE TABLE IF NOT EXISTS `dr_style` (
  `styleid` int(10) default NULL COMMENT '菜系编号',
  `stylename` varchar(40) default NULL COMMENT '菜系名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜系表';

--
-- 转存表中的数据 `dr_style`
--

INSERT INTO `dr_style` (`styleid`, `stylename`) VALUES
(1001, '川菜'),
(1002, '东北菜'),
(1003, '粤菜'),
(1004, '湘菜'),
(1005, '西餐'),
(1006, '鲁菜'),
(1007, '韩式料理'),
(1008, '日式料理'),
(1009, '闽菜'),
(1010, '浙菜'),
(1011, '徽菜'),
(1012, '清真'),
(1013, '贵州菜'),
(1014, '新疆菜'),
(1015, '潮州菜'),
(1016, '客家菜'),
(1017, '台湾美食'),
(1018, '云南菜'),
(1019, '赣菜'),
(1020, '京菜');

-- --------------------------------------------------------

--
-- 表的结构 `dr_taste`
--

CREATE TABLE IF NOT EXISTS `dr_taste` (
  `tasteid` bigint(20) unsigned NOT NULL auto_increment COMMENT '口味编号',
  `tastename` varchar(10) NOT NULL COMMENT '口味名',
  PRIMARY KEY  (`tasteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='口味表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dr_taste`
--


-- --------------------------------------------------------

--
-- 表的结构 `dr_user`
--

CREATE TABLE IF NOT EXISTS `dr_user` (
  `id` bigint(20) unsigned NOT NULL auto_increment COMMENT '用户编号',
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `nickname` varchar(40) NOT NULL COMMENT '昵称',
  `userpicture` varchar(200) default NULL COMMENT '用户头像',
  `updatetime` varchar(15) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_user`
--

INSERT INTO `dr_user` (`id`, `username`, `password`, `nickname`, `userpicture`, `updatetime`) VALUES
(1, '0131123804', '123456', 'lsn', 'xx', '20171107');
