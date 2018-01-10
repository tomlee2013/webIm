-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-10 17:05:13
-- 服务器版本： 5.5.41
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- 表的结构 `chat_chat_log`
--

CREATE TABLE `chat_chat_log` (
  `m_id` int(10) UNSIGNED NOT NULL COMMENT '记录ID',
  `f_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) UNSIGNED NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `add_time` int(10) UNSIGNED DEFAULT '0' COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息记录表';

--
-- 转存表中的数据 `chat_chat_log`
--

INSERT INTO `chat_chat_log` (`m_id`, `f_id`, `f_name`, `f_ip`, `t_id`, `t_name`, `t_msg`, `add_time`) VALUES
(137, 21, '阿里郎', '', 1, 'JZ&浩', '这不是真的', 1515471051),
(138, 1, 'JZ&浩', '', 21, '阿里郎', ':sad:', 1515471147),
(139, 21, '阿里郎', '', 1, 'JZ&浩', 'dfgdfgfdgfd', 1515471933),
(140, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515471950),
(141, 21, '阿里郎', '', 1, 'JZ&浩', 'sdfsdfs', 1515471952),
(142, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdfsd', 1515471955),
(143, 21, '阿里郎', '', 1, 'JZ&浩', ':lol:', 1515473237),
(144, 1, 'JZ&浩', '', 21, '阿里郎', ':lol:', 1515473339),
(145, 1, 'JZ&浩', '', 21, '阿里郎', 'srgdfgdf', 1515473346),
(146, 1, 'JZ&浩', '', 21, '阿里郎', 'cbncvbcv', 1515473351),
(147, 21, '阿里郎', '', 1, 'JZ&浩', ':cry:', 1515474170),
(148, 1, 'JZ&浩', '', 21, '阿里郎', ':loveliness:', 1515474176),
(149, 1, 'JZ&浩', '', 21, '阿里郎', ':lol:', 1515474186),
(150, 21, '阿里郎', '', 7, 'dear bear', 'sdfsdf', 1515475015),
(151, 21, '阿里郎', '', 1, 'JZ&浩', 'sdfsdf', 1515475078),
(152, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfs', 1515475083),
(153, 21, '阿里郎', '', 1, 'JZ&浩', 'sdfsdfsdfs', 1515475928),
(154, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515475932),
(155, 1, 'JZ&浩', '', 21, '阿里郎', 'dsfsdfs', 1515477849),
(156, 21, '阿里郎', '', 1, 'JZ&浩', ':cry:', 1515477896),
(157, 21, '阿里郎', '', 1, 'JZ&浩', 'fdgdfgf', 1515478939),
(158, 21, '阿里郎', '', 1, 'JZ&浩', 'ssdfsdfsd', 1515478944),
(159, 1, 'JZ&浩', '', 21, '阿里郎', 'vxcvxcvxc', 1515478955),
(160, 21, '阿里郎', '', 1, 'JZ&浩', '测试', 1515483145),
(161, 1, 'JZ&浩', '', 21, '阿里郎', '好啊', 1515483156),
(162, 1, 'JZ&浩', '', 21, '阿里郎', ':biggrin::cry::sun:', 1515483162),
(163, 21, '阿里郎', '', 1, 'JZ&浩', ':lol::shy::tongue:', 1515483168),
(164, 21, '阿里郎', '', 2, '殷俊', 'dfsfsdfsd', 1515484701),
(165, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdfsd', 1515484992),
(166, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfds', 1515485271),
(167, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515485281),
(168, 1, 'JZ&浩', '', 21, '阿里郎', 'asdasdas', 1515485596),
(169, 1, 'JZ&浩', '', 21, '阿里郎', 'sfdsdfsdf', 1515485739),
(170, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdfs', 1515485776),
(171, 1, 'JZ&浩', '', 21, '阿里郎', 'dfcasdsad', 1515485848),
(172, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515485916),
(173, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515486237),
(174, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515486594),
(175, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfs', 1515486982),
(176, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515487382),
(177, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515487387),
(178, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfs', 1515487444),
(179, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdf', 1515487451),
(180, 1, 'JZ&浩', '', 21, '阿里郎', 'sfdsfsdf', 1515489000),
(181, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdf', 1515489002),
(182, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515489121),
(183, 1, 'JZ&浩', '', 21, '阿里郎', 'dadsadas', 1515489777),
(184, 1, 'JZ&浩', '', 21, '阿里郎', 'fgdgdf', 1515489782),
(185, 1, 'JZ&浩', '', 21, '阿里郎', 'vsfsdfsd', 1515489981),
(186, 1, 'JZ&浩', '', 21, '阿里郎', 'fvsdfsdfsd', 1515495283),
(187, 21, '阿里郎', '', 1, 'JZ&浩', ':biggrin:', 1515495295),
(188, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515555576),
(189, 1, 'JZ&浩', '', 21, '阿里郎', 'sfdsdfsdf', 1515555825),
(190, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515555828),
(191, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsd', 1515564541),
(192, 1, 'JZ&浩', '', 21, '阿里郎', 'sdfsdfsdfsd', 1515565364),
(193, 1, 'JZ&浩', '', 21, '阿里郎', 'fdsdfsdfsd', 1515565972),
(194, 1, 'JZ&浩', '', 21, '阿里郎', 'sfdsdfsdfsd', 1515565980),
(195, 1, 'JZ&浩', '', 21, '阿里郎', 'sdsdfsdfsd', 1515573100),
(196, 21, '阿里郎', '', 1, 'JZ&浩', 'sdfsadfsadf', 1515573106),
(197, 21, '阿里郎', '', 1, 'JZ&浩', 'vcvcvc', 1515573213),
(198, 21, '阿里郎', '', 1, 'JZ&浩', 'sdfsdfaasdfs', 1515573323),
(199, 1, 'JZ&浩', '', 21, '阿里郎', 'ssdfsadfsadf', 1515573328),
(200, 21, '阿里郎', '', 1, 'JZ&浩', ':cry:', 1515573333),
(201, 1, 'JZ&浩', '', 21, '阿里郎', ':moon::biggrin:', 1515573340),
(202, 21, '阿里郎', '', 1, 'JZ&浩', ':huffy:', 1515573736);

-- --------------------------------------------------------

--
-- 表的结构 `chat_chat_msg`
--

CREATE TABLE `chat_chat_msg` (
  `m_id` int(10) UNSIGNED NOT NULL COMMENT '记录ID',
  `f_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) UNSIGNED NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `r_state` tinyint(1) UNSIGNED DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `add_time` int(10) UNSIGNED DEFAULT '0' COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

--
-- 转存表中的数据 `chat_chat_msg`
--

INSERT INTO `chat_chat_msg` (`m_id`, `f_id`, `f_name`, `f_ip`, `t_id`, `t_name`, `t_msg`, `r_state`, `add_time`) VALUES
(150, 21, '阿里郎', '', 7, 'dear bear', 'sdfsdf', 1, 1515475015),
(164, 21, '阿里郎', '', 2, '殷俊', 'dfsfsdfsd', 1, 1515484701),
(201, 1, 'JZ&浩', '', 21, '阿里郎', ':moon::biggrin:', 1, 1515573340),
(202, 21, '阿里郎', '', 1, 'JZ&浩', ':huffy:', 1, 1515573736);

-- --------------------------------------------------------

--
-- 表的结构 `chat_friend`
--

CREATE TABLE `chat_friend` (
  `friendid` bigint(20) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED DEFAULT '0',
  `fuserid` int(10) UNSIGNED DEFAULT '0',
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `flag` tinyint(1) UNSIGNED DEFAULT '0',
  `black` tinyint(1) UNSIGNED DEFAULT '0',
  `ftype` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chat_friend`
--

INSERT INTO `chat_friend` (`friendid`, `userid`, `fuserid`, `timeline`, `flag`, `black`, `ftype`) VALUES
(1, 21, 1, 1514877252, 0, 0, 0),
(2, 21, 2, 1514877252, 0, 0, 0),
(3, 21, 3, 1514877252, 0, 0, 0),
(4, 21, 4, 1514877252, 0, 0, 0),
(5, 21, 5, 1514877252, 0, 0, 0),
(6, 21, 7, 1514877252, 0, 0, 0),
(7, 1, 21, 1514884234, 0, 0, 0),
(8, 1, 20, 1514884234, 0, 0, 0),
(9, 1, 7, 1514884234, 0, 0, 0),
(10, 2, 21, 1514877252, 0, 0, 0),
(11, 3, 21, 1514877252, 0, 0, 0),
(12, 4, 21, 1514877252, 0, 0, 0),
(13, 5, 21, 1514877252, 0, 0, 0),
(14, 7, 21, 1514877252, 0, 0, 0),
(15, 20, 1, 1514877252, 0, 0, 0),
(16, 7, 1, 1514877252, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `chat_user`
--

CREATE TABLE `chat_user` (
  `id` int(11) NOT NULL,
  `wxid` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '微信id',
  `nick_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '用户昵称',
  `headimgurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像',
  `game_score` int(11) NOT NULL DEFAULT '0' COMMENT '游戏得分',
  `mobile` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户姓名',
  `brithday` timestamp NULL DEFAULT NULL COMMENT '用户生日',
  `recharge_score` int(11) DEFAULT '0' COMMENT '充值积分',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1 男士，2女士',
  `cash` float(7,2) NOT NULL DEFAULT '0.00' COMMENT '账号余额',
  `create_time` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `card_num` int(11) NOT NULL DEFAULT '0' COMMENT '会员卡号',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.玩家，2法官，3.管理员'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `chat_user`
--

INSERT INTO `chat_user` (`id`, `wxid`, `nick_name`, `headimgurl`, `game_score`, `mobile`, `name`, `brithday`, `recharge_score`, `sex`, `cash`, `create_time`, `card_num`, `type`) VALUES
(1, 'oyg7U0dLfVzn8J9dih6pcMdGt0p0', 'JZ&浩', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIDfL4IeSpzHTsNYP1LMBPT4mjx15zXrs8pKoJvFeIE20vEH8ibvcxOibfliajX9e46MvWDqLMvP1aFg/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 15:37:43', 0, 3),
(2, 'oyg7U0S956PnBwurnB0g-ZstA1yc', '殷俊', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqy5HVXMoFcFrvpE14tK55W3X8gGOpMU77thp1mA4Ciaec4ZMgdeBU8gv1UqjP1LTEiaAE9UVWibY4rg/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 15:44:18', 0, 3),
(3, 'oyg7U0bCscv3Edk5avEHVS3OBIoU', '半杯茶', 'http://wx.qlogo.cn/mmopen/vi_32/TsjPXjulb2pPJuCLjfOJWibJfBfWHcvKTc6aNwUmgqpLicUgNhkiaQPPU1s6lQ5FZrs9C5Dzhk7kibh76zabIVZTqw/0', 50, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 16:04:15', 0, 3),
(4, 'oyg7U0YCXONSn-hObG09fQT0xufU', '杜慧', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqDTSYGBh9OpUVMWo2V1libszOoqT4ZFARyzJjqicA9kDZcD8RWkHBdoASnbC2VDKSc6hSz5liaaicKSw/0', 125, '', NULL, NULL, 0, 2, 0.00, '2017-11-01 16:09:18', 0, 3),
(5, 'oyg7U0ceoqvuPX5Q5MiINSO6tWp8', '祝亮', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIfzKzv2Z34BiaA56I7Vo7XYUAt2FVqJkiczAUQlG0wDicfmwqwZgtHMOnFDicuQxQEnucq7AQFnt5dibw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 16:49:39', 0, 1),
(6, 'oyg7U0dbFkUFgw8G6iumlP7NGK_k', '修大文', 'http://wx.qlogo.cn/mmopen/vi_32/YQ2v6TWOm4gdn706PxO5khRS9oPmpUpiccicmzD5zhog9ibv8iaMlHNTXNU7AaibbCA67RVmfoscZK3LHM3b6BzkbQw/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 17:08:49', 0, 1),
(7, 'oyg7U0VXEWnUZHdKZGgIehw3KqlU', 'dear bear', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGxtczpu3ibiaicibm3lMiaWb4CH7DBmG1GF1eIFmWKe69WcX0T1ESqNsYPWEziblxKeKNA7aHiclbetsyA/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-01 17:39:17', 0, 1),
(8, 'oyg7U0UWwBGY1bG23nelV9Qnjzfk', '❀ღ゛     Over.  ????✨', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELUmBpy7z0nuYoITmW1zRDy3cNkzn53hTMuXDnmGtbRxegib9zPfYrm7ykndqm8pRP7JTsWHibCO7zg/0', 40, '', NULL, NULL, 0, 2, 0.00, '2017-11-01 21:19:06', 0, 2),
(9, 'oyg7U0WLyMQD_JfkaNPEf-B0pTls', 'Soul_Gin????????????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLpYOBLamH0TLMQDnoqLgwxTLMj0K4NDjN4DMqe7hN8ZXMuxTGygKWOqNbKxhiacsrPqTcggrz0LGQ/0', 195, '', NULL, NULL, 0, 1, 0.00, '2017-11-01 21:19:13', 0, 2),
(10, 'oyg7U0Q70hoBvWLvfGjny-PYq6b4', '麦兜船长', 'http://wx.qlogo.cn/mmopen/vi_32/L6ktZSuI7nYRaN8a507BjiciahziamgQWYxUMh4UwbPJ7FrPIAdDLY1YIeOICNC254f0X8ufibvDXicwQibLNgJibruCw/0', 275, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 15:29:32', 0, 2),
(11, 'oyg7U0TQ33iOyGDHijoSOG630G88', 'A Fei', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELYeJxU9M91p2ge7xPImkBELqO3WuS1yhUAcBMt37qNic5vbjIhgyPcFukiaJs5O0t1ibVbWB9SRia7hQ/0', 415, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 15:31:42', 0, 2),
(12, 'oyg7U0ccFstuRx2QNr0DDhgrtoqM', '鱼香肉丝', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKsribrxX7mnCPdiaicc02s8Cxibp262cnBE5rNj5YbedIIocg7MOm1lz6YV6A6QYbmslPNWB7xwtnssQ/0', 345, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 15:54:08', 0, 2),
(13, 'oyg7U0YPKN7hoM3dnyl4Xji7FeZw', '曾伟', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKBPNMKd5ONQ0YYZTg4kIYOvtfRA94MP3KkAz6rrEVIia78zdglVqDdBJ8iavqklUFtdF1d0PBM9yNw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 17:35:25', 0, 1),
(14, 'oyg7U0dd3RdkbuJD9esoYbRoT4Ew', '蛋宝〜', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIGQ3x5kS3WeIgeYGmmzhkLYiaRia7tI42LpRKmI8SarHtwfj2xLrcEG3XXnDzWSk7PRyW1L5JQJIVg/0', 95, '', NULL, NULL, 0, 2, 0.00, '2017-11-03 20:06:33', 0, 3),
(15, 'oyg7U0dgMud-h9I0iLkbZRcqsgos', '王大宝', 'http://wx.qlogo.cn/mmopen/vi_32/AR6UTBhqOpP9lfZFtETYJq6CICpex8yTVjUpuZTjNzXia0LuncibmpoTcmvWeY5aBxBic7zgJSfQDuMVhwOKJ0j3A/0', 265, '', NULL, NULL, 0, 2, 0.00, '2017-11-03 20:18:50', 0, 1),
(16, 'oyg7U0QI4EjW5jmqzVcZFyTMCtVE', '纯爷。????', 'http://wx.qlogo.cn/mmopen/vi_32/ckBCaB3va7L9csnoGEUE4N7DYCsad8rB8jxONrt2GB8Jza7M6ouDicexgZUSDQAA7medkuyzgUZH2fzZv5GsWmA/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 20:19:50', 0, 1),
(17, 'oyg7U0QxgQQEl2BXtR1LAVCqoG-s', 'boom', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIbqMZMGS4sT2AY5MAnn5f65hGPZur0TCZknTIyELJLjgSFxJZ6hNjJ9KWt8FOLhlfU1eVkhxVpXw/0', 95, '', NULL, NULL, 0, 1, 0.00, '2017-11-03 20:53:08', 0, 2),
(18, 'oyg7U0WFWuMJa_6lN6bGbuNXJ0f8', '后知后觉', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrcdzJGxQyLqBtnictAMchiaAbB27noPKrZjqm26mAL5qEUnrdHMibq9OPsa5sgj1IbypETZd6WvPcQ/0', 215, '', NULL, NULL, 0, 2, 0.00, '2017-11-03 21:12:14', 0, 1),
(19, 'oyg7U0WzUb1wjboe1rSbtfN-GXhU', 'FwhApp.Com|小强哥', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL40CYbBtPXN2yfISOJvicmB19eno352eIBHia0DF9P1k5Dr4glP21waib4kicoZiclzUTRmkcpO2zX0ibQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-04 10:29:57', 0, 1),
(20, 'oyg7U0Z5iLIvLeUwXgsp8-0D81pY', '索索', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeALhA2Wib90O5Bwsvukl4P2ez67K9sUurPKTYibK035AdIqzp7ict7h2DeaaPqQIpXGsBcq3Exbt7g/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-04 11:01:18', 0, 1),
(21, 'oyg7U0Zu7b5-h_h9_6jp5v9Q33XQ', '阿里郎', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQhibyVyxkGT9bzzkJWsDeoSdtRWS1YFCa2YnDdKkJJnH3nnh0Tkbj1zFo2icNPocfRQF93dAos7bQ/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-04 16:11:12', 0, 1),
(22, 'oyg7U0eW7MOoXH36zXcJr1ZCqoxU', '傻到没朋友的巨蟹', 'http://wx.qlogo.cn/mmopen/vi_32/UXKNCxJ9dbJ7kCm76MXOR2riam3CNJcykWVjIXJFaNJlz1lR47y2L3nnoib91QCY4WaUkNG3VOZ4udsAZEc1DOgQ/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-04 17:35:11', 0, 2),
(23, 'oyg7U0Ydu-kUKa6MKqOKmxmOkSIc', '沁q????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epEK2sAyJyCZv73JkD0FVv2pSe4cCtZTvtXIZbIzjZ8h6SnoagK61Hq2raibLYFEicAbZ21qgm8eQ6w/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-04 19:39:44', 0, 1),
(24, 'oyg7U0QW6NRCFJuAityEWfQjc6ic', '张志聪', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJa5M3miabZJr6Du0MlLKGArCPJ0icAgL17Qjz4X7vVVVjErJ96qqSJLpgWdmxAp1kq45ibXrHUTqudQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-05 16:58:02', 0, 1),
(25, 'oyg7U0QUOGmxydhB3iF85nDVeJuY', '张智聪', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqveInj4iaA8EJ5ZchLZib6jANE6aibnqIqbeICzY6RaVeUldKYlyNIAFzo0l8iaicZ5zz3v2N5sPtIXicw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-05 21:24:25', 0, 1),
(26, 'oyg7U0fxng3PWRYx936jJzGCXg84', '美凌格', 'http://wx.qlogo.cn/mmopen/vi_32/8169ia6YxjTHYib8c6L3BFRRCAaoyASJiak0ZIPNiaD14wboTbUTUDCVaIJdNIVib0YRMk2A7Z2DKwZMf7V6crzQCXw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-06 09:21:14', 0, 1),
(27, 'oyg7U0QbCX4XMkDAcQrDXzonNKYU', '昊匠网络科技', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLsicv1Q0pgfbaEZhzIxO4Znicl47lTkwu2CibzrjRY8OknFwOcSMK7deS0RrDQrUuUtpsvPytzmG5QQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-06 10:19:02', 0, 1),
(28, 'oyg7U0fSclFxPZ4P41EwIFvrA7mo', '翔', 'http://wx.qlogo.cn/mmopen/vi_32/tVtdATOIDmCyHE8ib2h6D5Cq0XSt9xBtRc3Me6LeKQe4xljfyxoJGhM6k2aOEvAmycvBoHtHKpYgoqUGoo9OCIg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-06 10:35:48', 0, 1),
(29, 'oyg7U0dde5Z2K6sjNvzWBiX_nb50', '????郭妍君', 'http://wx.qlogo.cn/mmopen/vi_32/mWfjhLXh8kKdsSzqibZeU1RSdOEws4q5Liaqbytiamvx7EHxR1MOUM7ol1CWTeeoZTF2ESbcuH6ft51IoG351Zdeg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-06 15:16:08', 0, 1),
(30, 'oyg7U0VqBUIdmoi3S0UCQSWE0VBk', 'W.k', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLCGY6o6GNnCbJsOsPJxVlvpso8IRJz0Bq4utLZiaTuiaaAzP1Az6icb822ODRjJskicsr0NL02gGZSwA/0', 130, '', NULL, NULL, 0, 1, 0.00, '2017-11-06 20:28:25', 0, 1),
(31, 'oyg7U0VSy9R7nRVOMPhr6ssx2u14', 'MMMMax~', 'http://wx.qlogo.cn/mmopen/vi_32/XrIic7ZweCkIQiaRtTfcDQTA22Zybg5UWtmnKm4sd8VBqU5VekFMw5ETva8SVBfiatEOlgg8AkvZ0XM3ZFLg4ic5Tg/0', 40, '', NULL, NULL, 0, 2, 0.00, '2017-11-06 20:28:42', 0, 1),
(32, 'oyg7U0aEBJFq47eDRckZFp2D2_TI', '????????????', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJiaH9EAmg8CzmBMUiawTUCyRxrTvibDI8TyHxqmiaVcFDibcqicVPJe8vXveMSPEzsvqBghV3A1RqvHapA/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 00:02:16', 0, 1),
(33, 'oyg7U0YAikxwVRKnM7MRp-ctE-F8', '志明与春娇', 'http://wx.qlogo.cn/mmopen/vi_32/G9pPwIfIK1hnxhav7zA6mWsjB1enOzf9MMibs3Wff4QrhpmNaW1Qib2T51fCf27qovpSyic30FG6srNlcOTHz9zoA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 12:15:28', 0, 1),
(34, 'oyg7U0eFfHrEWDuBmZeNv3pHuRJI', '陈魏豪^.^', 'http://wx.qlogo.cn/mmopen/vi_32/L1sGCkBiaF8f9TCictibsVxP0rGRBjjUM6ve4pbMkHticLN3szVUDhYCKtMBt3hNRqHLFPtJGXJFYLO79kavLEAgkg/0', 30, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:44:18', 0, 1),
(35, 'oyg7U0b7He4ABKBSjARfBXO2sJs0', '美少女战士', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKicT22uicmXjkYYicVc1zAmgghZH1JYgEcwamCQ30WGiaeSlT6wHDT0erZpJVFex1PzkgGMzAiaEJNSGw/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 19:44:20', 0, 1),
(36, 'oyg7U0YExAg4Ro5fzA2yJ5yQDZQM', 'Leo', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJSfpKKL0amDt6Yia97Q7icvAV6E5zfibRymaNzdRdibrlI6CoPAwQjIlu6HKKApkvCwmT07SkzZrFLUg/0', 30, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:44:28', 0, 1),
(37, 'oyg7U0XS3RysJn48xxhV1s3kKQNo', '????彤彤', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKpGRRyjVjtPucesuxEjjEw10S0lOO5onzs1NEEfc1m1RpLJUYkaeXmLJXHsU61BHTSxfkEaWsDLQ/0', 85, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 19:44:30', 0, 1),
(38, 'oyg7U0ZYMLEGnODYRqIk6jcd-BJQ', 'Karen 简', 'http://wx.qlogo.cn/mmopen/vi_32/5Qwbf6EibjBQotrZib9ywJKxmDoNBibSatvCIAlDIqevHibRTiaH1McJJTarB0hvAAlB48loibkgT8Gyw5GexWHbKBWw/0', 40, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:44:34', 0, 1),
(39, 'oyg7U0bVh9PAqeDeBjYxXGCPtJMs', '兰泥酱', 'http://wx.qlogo.cn/mmopen/vi_32/KxicVF26TvY5q124YpBLb9AdQzTMzibozjuZDa3OtibK8NAhBlDU8E25OMajPwBubCeg7nZKFl2pyL4C6wgHelZNQ/0', 60, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 19:44:48', 0, 1),
(40, 'oyg7U0QGQLmEKfAqTzTGHQ9qGqbM', '陈', 'http://wx.qlogo.cn/mmopen/vi_32/yGCia3faGhicaVuCTljOEmFpHvasT8fU5PYHrxCWRXVpo0IsdyaV5qtfugq69g0v9jUUsyutWmSUjQqFA0ARHFfQ/0', 30, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:44:56', 0, 1),
(41, 'oyg7U0Qj-7DoiIEKdD-pQ81Rscm0', '王玮。', 'http://wx.qlogo.cn/mmopen/vi_32/f5CXko1IQWY1Eibmssjnzrr9YyCnD1VxrLaBk5BYFAoBibqYfGUSM73LaNmuXk4YxgfjpfVosMJUH4Dx92BpdYVA/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:44:57', 0, 1),
(42, 'oyg7U0TF9OTH9qP-Lytk3HyGHraQ', '胡露@中亿天金融', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erwZ5htCR1qSMTWcwhPXRUaDy9mJuCMiawELCqgPwbeLocgiaK3GHXKryOpWc25QkeGicCH6GQECYWCw/0', 40, '', NULL, NULL, 0, 1, 0.00, '2017-11-07 19:45:52', 0, 1),
(43, 'oyg7U0ZeOHLOgNsgHFBGUHd-o23s', '????????', 'http://wx.qlogo.cn/mmopen/vi_32/NxutX5X4l5SHX6fZYXP6GWhv9wrNsRzEbMHbWQlSQF0GBicRdRibCxHXVweNsp0B1sgZZH9KogJnYwZQPLeA4ooQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 19:46:35', 0, 1),
(44, 'oyg7U0RkFZTMTlFCV1uiRfHjbIik', '美腻的五花肉', 'http://wx.qlogo.cn/mmopen/vi_32/XYF4FicwEPPGMWuXZKxl3RW3l3YqwlLy15tyE5GWYLmwN9ib59JmyGQc1Z7RJlxQCjEYdEVyRwf5DensuhIFKia1A/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-07 19:48:21', 0, 1),
(45, 'oyg7U0UYt6gC4GzYKhCR71hVWlC8', 'Young_Jun！！！', 'http://wx.qlogo.cn/mmopen/vi_32/kd8ru9FGvQmuRI3zNFgDufqL9NloQSEPR0ia2cUxQ7HPMXT9Qlsw9mojOHfHAuRyuCRTED4pbkJCvuaHAPNEOmw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-08 16:31:16', 0, 1),
(46, 'oyg7U0eytRtvchgaAIQDlldujQZ4', '燕玥', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNh5mKXgccR5wN3QKao28HBfSxibSdxZoweNDXWfD6JeOygTniasMwOa1h8sBcnY1AawoEszWlDzag/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-09 11:45:28', 0, 1),
(47, 'oyg7U0RP_sx2auNJS45sshOGBTjo', '张鹏', 'http://wx.qlogo.cn/mmopen/vi_32/RvrtmsGxBaf4L4WicTXf3tm6zZ4uibCus2p0rp3D0qPia4C0XFpAukxnBp1arBGA5Qyxl3bXQTM2cR7FiaehDbjeQQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-09 15:03:43', 0, 1),
(48, 'oyg7U0VNOzH31m6-TOUuklJuZKY8', '烧????酒', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJlmn85HrFGz3zwepu3O9e8xNV6PTqrQWVISkTGHjn77tykiaZbITJUOhz2upFjBB53iaicoUIM7mt0g/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-09 16:04:14', 0, 1),
(49, 'oyg7U0fBQEh-leNJiAtcNCD2IZYs', '黄浩???? ༄百川金融࿐ོ', 'http://wx.qlogo.cn/mmopen/vi_32/eOrfjx6dK38YSOHN6vuGm1dA4P4hPveXNFUP4q11cickib4aXbBHUaSO4mZOsaoiaJWavZyAGHI31v3uPG9p49uVQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-09 17:56:28', 0, 1),
(50, 'oyg7U0eHl-Ni3ob-7Jgx6Cyf46SU', 'Valter-R', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKpSbT6ZqrpacU0UJlbesDrSa2vwbuLV2gVkHhibxvzpicPf6HhyLwhbdsf5py1tPyAAqTflCJGA7Tw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-10 12:09:21', 0, 1),
(51, 'oyg7U0Z6B5ID2wAW0DR49eHOBKcs', 'Shine~云殇', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK20hfI3VcJrbEHibEEVTqx06WqQhczAEn8lx0O8WIgXwzeVcgVfXAFN2HDpGHcoaIT9eFKmVEksGA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-10 14:10:07', 0, 1),
(52, 'oyg7U0TuzZ41LV_-Uo-q7C4WSytY', 'Survival', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIgKOe9XbSgBGgtG1Z4NH5zstcbYhFnW2PoSIc2863eSYhtmM2ic57YiacMPDR5Wzicic59AWyNvZ4tKQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-10 16:49:21', 0, 1),
(53, 'oyg7U0fMqexXLaFwI_skfOhei-iE', 'yyf', 'http://wx.qlogo.cn/mmopen/vi_32/NHeRibh2us1dAd2ldrriccswbAy3pVZwM9gOqLps32WktydKv0lIwdwt2U2KcNz1Q37DBlfOSASngyDaJia1oVoVw/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-10 16:58:09', 0, 1),
(54, 'oyg7U0T-8Xgp198gD8hBpWV9ns0c', '紫紫', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIibwY3c0cNhLMqA3UxG7DtBPJKvd6CXDqurlhKibne0yHaCicoYQreuXibym6NNBCaL9icPEypwDDGFDQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-10 18:12:59', 0, 1),
(55, 'oyg7U0XSenXkK40RiGZZMavGVeM0', '✨希世珍寳,⛱????????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIowbz5xxVOJSmu0P107rkqibic9PkSubhHpIWXnjGnibhHg5ThkvkmO9uhqoZic5l5NgIhH317kUCATw/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-10 20:24:08', 0, 1),
(56, 'oyg7U0ZYX3qFtEuX5stubp5vy4Nk', '燃灯小哥', 'http://wx.qlogo.cn/mmopen/vi_32/hN3dzHdciad1frjkxIZwkSC9rDkgEMf0iaBaxEdUJwuia7kmJaPiakuUWIvo2p7ujw1HBl9m0L0Fia8giaIcBR8bRSEQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-11 12:14:13', 0, 1),
(57, 'oyg7U0aHa8b9LehDb0ddxTCkJ6fA', '天行九歌', 'http://wx.qlogo.cn/mmopen/vi_32/CzqTtEVEYKcZrg9brqxIibYOyMBWxDB64UABPc91dqW3UQw5oyE0H49OqME9zRFMY4XiaRMxbew48kGAfnATw1ibQ/0', 55, '', NULL, NULL, 0, 1, 0.00, '2017-11-11 12:23:16', 0, 1),
(58, 'oyg7U0SgFpiE8Ajvd1sBEci31Q50', 'AA.张小黑.☞18707111515', 'http://wx.qlogo.cn/mmopen/vi_32/59cVuYh2olbwhqia5GFBNicRhwLbDCNwMpZ7JHA7GMkQaOwN5wG8ibcnpDCIadd4b9S7Q7I1aV5rftXZeaYNSxPiag/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-11 12:57:36', 0, 1),
(59, 'oyg7U0RB2aApKmeX2dfmtNvaJhvo', 'xxxhoney', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgNQbtic3oYSVXY4J3EkAQNKoRmAXCtgaxb2ZPM69wMs9H5RvoZuDnydPOnsH86Z7K4LUoQ70XV4Q/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-11 20:04:05', 0, 1),
(60, 'oyg7U0ag-5D7o30o6iBq9_Ze31RE', '徐大小姐.', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKs2cCU7EBKlXOWqaom307HQYgajT4hiaiaat44ItugdAGGAxmuS33ib47u3MVOdZ3PkxkOb0bxFRoOg/0', 0, '', NULL, NULL, 0, 0, 0.00, '2017-11-11 23:12:38', 0, 1),
(61, 'oyg7U0XRe_wLNiGPkkjlnSNGJCyA', '陈静', 'http://wx.qlogo.cn/mmopen/vi_32/4OU0Jibez0CZqNnqqXNBpLb3T9Rc1q9cDtQaDs1SxolOKicoS7lLqrshJdFPkQ2ZSiaW0qJNjSCHZSKQxyZcRJiaRg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-13 06:00:33', 0, 1),
(62, 'oyg7U0VyzgwSLUDEM1X74w0T3syU', '白开水', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELlTTXibYiakicTStnn8xUvibnS1RiaNw5UdPySIPlhQR8BeukkKGTfxZ6sXNcazCTWAyXWrgedfel9iaAQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-13 15:24:33', 0, 1),
(63, 'oyg7U0fYMpu8FuyL61m3PTJPQi2A', '足迹', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJgQ5Uwr6HjlxdwWgCBiaqjPsI0VRVhtKNWPlX3b0q6fOvqVBSia3GI8H4TPTiagS25p9NSGdfhwiaMfA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-15 17:47:23', 0, 1),
(64, 'oyg7U0bHLREzr0y9SX8f9Kx1Yo5M', '肖俊', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eribKIPzmIM5ksQMt59ic26iaeuice9ibbz1v7quicsoCvVGiajS8HcX8uJ69fiajVu9gz43j3G4ibH7ibZxs3Q/0', 135, '', NULL, NULL, 0, 0, 0.00, '2017-11-15 21:42:28', 0, 1),
(65, 'oyg7U0YGQ6AUuH1kWCI1eKQQtsVs', '刘小美啦啦啦 ', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJhDZW7FrYZcFJjgejz6tMXAaOzpy1iabFYf3f6SqwfGcdWOwfXrRI9kzKLiaZQlYDiaeic8jOOD5Hlsg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-16 12:23:39', 0, 1),
(66, 'oyg7U0afl_fQOouJdAcnm1MMjcfI', 'Maxim', 'http://wx.qlogo.cn/mmopen/vi_32/GUaFljuL4lLqIK1biaRVzuhT1PmM91BmHJAsgZEmjSMe8cI6DopibEYVcyYpWgiaXUzA77FjhCPxe6cN8EAVXwl1w/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-16 14:37:54', 0, 1),
(67, 'oyg7U0edUE_sjhnHuXn7_QIQjjtQ', '汉唐朝阳', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqk98FKczkT4eq1ictNcITb2icrdhhcRKIEWrqheBIcOqNeG9TcGlN0b2ib6BHtQPlSzbiaYTeotkv7YA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-16 15:37:41', 0, 1),
(68, 'oyg7U0T_o9gjObNHLPgW9zHpyzmI', 'Mr°翟', 'http://wx.qlogo.cn/mmopen/vi_32/mVaN1K0AibPT983ibYYQNnlhERezwdyJHpR0wtxenzia8mlrDeTxcqGSGc3cGVdrmDdCuSdspJoK5kuoZyGCEPEIg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-16 17:05:07', 0, 1),
(69, 'oyg7U0aO8p1lIQz0-XRc3H4TBtjY', '丶CCCCSTONE', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkCD2dEUrWLeCqyBcM8bNQ4SqsSyZLR2ibIibyO9ECgyQHF8cEb73SOtQh6Xb6Knh2WmLY8fK64obA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-17 23:01:36', 0, 1),
(70, 'oyg7U0dvmIQll6rkDNPOjor0wI2A', '悟空???? 你又回来了？', 'http://wx.qlogo.cn/mmopen/vi_32/JK4hI4QicIYfHVgsAcfhoNcN3NNls0eSyTuib6CEJQvwMtib4EOMlA29elJtLLibBmolXdtJkeDzMTOnbAkaOEkBMg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-22 17:30:33', 0, 1),
(71, 'oyg7U0SZ_Jgdgw_RfwlqwKdWhH0g', '筱筱筱草帽', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKLiciav6lzCAlJZw33ddZdHMTh7obGUTtDdN24sWF5xySdrVakD6j1OZOrKdWh0oArwJL4Ye0AA0Lg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-22 17:52:24', 0, 1),
(72, 'oyg7U0cRunrXtf1KurplcCxHkuvg', '张鹏 ????????????????????????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erxNzrydoXDhr4BPyo8OfqXCyMu3RE85enxquibib032Up0VibzkQhicyJRibw3b67ASk8609COWiaQuKhA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-22 20:44:09', 0, 1),
(73, 'oyg7U0SYw74H2yCwTsV1VHpEXghE', 'HLW  李', 'http://wx.qlogo.cn/mmopen/vi_32/ibfBVaKqJHElzd2LQPAZsFPAibDUIia70HoZpexCs8BicbMBvMvgWZFLZ0ocRm4EKfR8Kgt3vnF7Jmmju9aR18fmPQ/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 12:53:49', 0, 1),
(74, 'oyg7U0XEUCY9TL1xXo9FybzxQSkA', '。', 'http://wx.qlogo.cn/mmopen/vi_32/ObbMzkXz1u2yRuia8mPfy7Ak3vunDfdnh31dYM9bWOzBF8k6G01lelQcbxlOnSmam4ChULw5Olbxwhf4NHkiaBDw/0', 80, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 16:52:34', 0, 2),
(75, 'oyg7U0T1ds5wOdLihtP2GLDD9aEg', 'winner', 'http://wx.qlogo.cn/mmopen/vi_32/QF7tQNDzTxu7PMq8ZJGlEaFKyRXxQllxe3IxCM1xxt3no72VjUgYFGNAHzvibF27VTUe08usFoLicYSCfELa2O3w/0', 115, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 16:52:41', 0, 2),
(76, 'oyg7U0VmhptVJqbq3qN_ygH_YF5Y', 'Yyyyyy', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKW8Eicmrdn75gCCnbT5RJ6H1Wbhjp5K3GobanQJibHZya1lXPSwSYtruX9L8ib5BRRjqhEeVEz49R3w/0', 275, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 16:52:54', 0, 2),
(77, 'oyg7U0VFTdqBnQ4JveXS4ZAtQJek', '大大觉', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQNUgjtVPmh1MbS2vjfx4vlicZiaiagSWgKHHmfybsGxAcJqQk3YDX7ClBAvn2y5icKpcJoR8w0SIOpw/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 16:54:29', 0, 1),
(78, 'oyg7U0ROhn_MDtTFgVtMXj0ciUX0', 'Steven', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJqibAQibGgndeZtwubzd4vXMtwpvndoq1R8WtKJgGvwFcNd4YKOoOEuJaKx2lKiauib83mmDtyKTEBoA/0', 50, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 17:47:05', 0, 1),
(79, 'oyg7U0WwFeYj6SCXzmjD-Rwg-trc', 'Walker', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIAZ09LmNe6tZyOmrPAS5nT4WdDqAw5LhW0OibHVEpksJibTqwDHNyvqmraavZ3FI4qzCicP2H4ib472A/0', 110, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 17:47:30', 0, 1),
(80, 'oyg7U0aRjz-z2EuunHXRcuNgL3RM', '　', 'http://wx.qlogo.cn/mmopen/vi_32/A7VqG9Oe1Tkib64Z6URclCUtzfQEmGUGUHfGmkNRK5wrDic0jfUq8Kaib2eX8Bb6tEqyup94ViafLyzX5my4u3MEqQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 19:10:03', 0, 1),
(81, 'oyg7U0WmvI9b6Jkn8nXpB8PY8jv4', 'Ling ???? Baby', 'http://wx.qlogo.cn/mmopen/vi_32/zWXSkANEsFOsXPe0Bh8wBYXa6yvFtHFrVhWNHZ8eeuAgkoMEblrHJrsaExZ83k4nLHAEQGTBCUv0ctWI0nFREw/0', 30, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 20:47:49', 0, 1),
(82, 'oyg7U0XWXrR1e05xqBrZ_NANU9U8', 'OvO', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISYbhpBg4ibVhdE57sia2jfhUPrQUXICElTtVVkVzMHqibs1FphMXYl0Ag1Cria7Wt2DrtJtHk1Rxx7A/0', 55, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 20:50:19', 0, 1),
(83, 'oyg7U0QxrPAtExNM_KIP2idtjlp8', '????momo～', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqjUZbPF9jeSXag1TXkNAt1G6Y6IQ7RQ3JrpqhrnKrx2YjYRoib9tdT5bdunsHIhKhw1KaIHZ7HaLQ/0', 290, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 20:50:35', 0, 1),
(84, 'oyg7U0U5yLiZm3Ti7KM0r-u6GAjA', '识趣', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKD3ZvU3UaCVk63hOMNkf2JNuJXxgMaIYUYzmXQ7mbqYLv7sSCXExzkTaYBFCYkAG2TwFatt5Y0JQ/0', 45, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 20:51:16', 0, 1),
(85, 'oyg7U0QAUlvzHe0O-D5Sh4tfB06A', '小草莓????', 'http://wx.qlogo.cn/mmopen/vi_32/oFpp3Slt4OToJibDAD86TXkrUPVfR5WwS8ZV3ypPib4B0wgUEg2OIfHzoS3v3E0Qj5dbKwE62DvtibDUe8UEIJLpw/0', 65, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 20:51:19', 0, 1),
(86, 'oyg7U0UGA65aOZ5CRfZ6XHq3qUBY', 'Sad', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ8kfTO3wkrzlvOUQ8aPicX3LhUQTjAVAZia0YRm9WSicY3oTl3Nr3uUqTJRBlBYnp2tLesBQD3T4wxg/0', 90, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 21:41:35', 0, 1),
(87, 'oyg7U0e8he_pQwv5N8kBzrG9w3WQ', 'Asher', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKHXDic5F8ibPB5rSNkRM327fcEZ0iaS01TicJ6eutE3BCHfgkj9eMfhXOicUmMtXll4OW7o0hGnSpR0uQ/0', 60, '', NULL, NULL, 0, 1, 0.00, '2017-11-24 21:44:51', 0, 1),
(88, 'oyg7U0T72EuiB8n5bjnOLf8kCDgQ', '33????????????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epItMdun2caB3nILjzjEFutUXd8KSp1kezcofKg4XR8aP6UbPVtJNv0UTudHZq6N5mWrGDjx9uMkg/0', 375, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 21:44:55', 0, 1),
(89, 'oyg7U0SzYROJFSvkllYMZCM_wm4s', '小亮', 'http://wx.qlogo.cn/mmopen/vi_32/tEibyIQYJWT17nDQ7z77KGiblDkwhicMfoqsDZ1PO2PBVvYMNn8EXcua0IiayibAQHBBL2ZOiaWl4JxwVyddcktTm2mA/0', 350, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 21:46:08', 0, 1),
(90, 'oyg7U0c68HOiw_hEkJU_VyXLs-HA', '????', 'http://wx.qlogo.cn/mmopen/vi_32/ZDS7hNUcfZEq26VqTEhJnJeK5EicZRVw7n1TiaSkuYHWnldVOo7W90wXP2L2QKf9jTTqLHFkuYqXPicQ5UYsa1eyA/0', 270, '', NULL, NULL, 0, 2, 0.00, '2017-11-24 22:20:00', 0, 1),
(91, 'oyg7U0a6W_GCQF0Mj6RzqGok3VOY', '对方还在输入...', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoW1FyauHaAI7WonniaWIho0EBxm0icRibAhkmQUlh63ia2icPicHZoSH6YP34hib0poOgNto1YZ6YunXsqw/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 00:14:42', 0, 1),
(92, 'oyg7U0bofjsc7QfEEz_rLfwxk_tk', '-SRJ', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epKry52TyMNTsMMFfQyic8ZApSBpcfsbYzu6nEAgqsNhTpXV5O27JqveOvCUd4ibKMp3n4wjyHNrxDQ/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 18:49:24', 0, 1),
(93, 'oyg7U0S30fPotWSY5XgLLQuzYo2E', 'A????丶愛笑de.眼睛 ????????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKF7ImnHq4JI6FCaOp3vY8f3qv7Vubmpdcz7PHO7Z2qyuRNjEakHppOMXz5HZUIM2BWyGO3WyLWA/0', 195, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 18:49:25', 0, 1),
(94, 'oyg7U0QGVulC62AjNSAtXz1J6A28', '东东の东', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIMpThl2OVicy6UFDM8gPMibZr61f3KfPFcY0vp4e4ToB2ota0hGiaEI8AyicWGR6EsxSTdOiawDNCtJEQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 18:49:30', 0, 1),
(95, 'oyg7U0YD2Ff0CzsM8YXaL_ycSahM', '顺', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJbZzQ2W4fGGG2vKORX8aq9ZJuTwIzpVvx6IlqcT4ecrFf7icjawS0xBsWHaAxC7k6JAFZzege4Nicg/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 18:49:45', 0, 1),
(96, 'oyg7U0WuqVwi_97o8PvlDsVpcyzk', 'Pisces', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epgnKwHWOJYV6Ph6T8H2hKI2kdc3XZRCrgo4AYaKlAMibgyib4LbjbWNlicOUFuNVbzGgHK7Kx4mYf2A/0', 40, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 18:49:50', 0, 1),
(97, 'oyg7U0Y7Vdfubq1YgA9qS6X7YJ4E', ' gavin ', 'http://wx.qlogo.cn/mmopen/vi_32/V8j2icvQxT4gKO2RP8QeUAPEpRBscduVS1uovBoQypJW0sCZbUhsedqqYvCSybjRzibvREkNYHfrhJ5DyObhQYUA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 18:50:08', 0, 1),
(98, 'oyg7U0YZCMAUOj8J_kMGde5W0WdI', '星⭐', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep8ITibK3vGrqVTIwA4050nDU5SvfgHsDVjbQexO5dCGBn8pHc7O3CP6zicfwmaibYLew37F2JiaFiaWhw/0', 140, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 18:54:20', 0, 1),
(99, 'oyg7U0bhjGgr-SJZCzoWUsa0iFtc', '石朝超', 'http://wx.qlogo.cn/mmopen/vi_32/ZrA7SPMNXYicEHoI15rFCICgbZibl9ecMjKpib3CEgZt4icTB5iczBdbldAXZpY8cs8ylT1l8C2AiagjHjK6bXCwc3yg/0', 20, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 19:52:19', 0, 1),
(100, 'oyg7U0SL7g3hGTna2_EzJBrq8efo', 'holy', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epML971kvbGEoQhTofSk5icAoydgjpjmUHSCiaibmA0bu6icveu13P4LDf7h0xEtKpCqqUCtBBExTnhOg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:26:37', 0, 1),
(101, 'oyg7U0YYALgHkLYTdu_AqEiKwKvY', '滋滋卷卷腹', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKicD9pkGBuAbgvpmMwzt4YOKfxiaInhUGlLgTtwV26Ej0HMYlZxzEACEgZC9yYRw1JGcV5Pa1gFAfg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:28:48', 0, 1),
(102, 'oyg7U0X2IlCP1wGNTYSzcvZhg4nA', '还带一点帅', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er4vCQfKrNv36QtybAbFiar4zFvEFloUrxW9yiceSd8YfNiaUaia0UF8JYbFkwZqdJxlm9zGSjMdaica2Q/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:28:54', 0, 1),
(103, 'oyg7U0V88aJe2MgniEzm5CLQmwG4', '????早睡', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJNiaLHdE23FQ0kcLnAqeDnmbPeicgltBVNJn1sCicUGxHpVOwcd3gnvGBQjucjXxjia00gjdgLbLO1BQ/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:30:23', 0, 1),
(104, 'oyg7U0Vo8hDRd2yN7EcbOU7zpQlk', 'hU', 'http://wx.qlogo.cn/mmopen/vi_32/oAdEUk0YiaJbIOiaRXclzrrIzaEicV0h96NuuThWQt2ia0Cibo4ld9mkDkjdorLkqvmD7UPDZrbpWjGVBWJRdE5BhHg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:34:58', 0, 1),
(105, 'oyg7U0bLze9hRCYRWO6PNAalxA_E', '1.', 'http://wx.qlogo.cn/mmopen/vi_32/aqPx8mTRMPbdQ41P2DC5Bmd7vEjib2RGhRTVtANmru6WK0SfxpOtSxntJGrE2fEtR59YJXgkYPOyoiaAQuZ5ca5g/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:35:48', 0, 1),
(106, 'oyg7U0YgGCmHAqy7tPdss-M2JF2M', '????朱紫嫣????', 'http://wx.qlogo.cn/mmopen/vi_32/dlIBXlicZrolNVSvM4zH2ETVicQAs5QN9gJfgbEf6fOtcFe88iaeDqXbcehBxqm6pOgl89DFBGj4pNoTmgDZLtknw/0', 25, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:36:22', 0, 1),
(107, 'oyg7U0VFnzPh9KeH8smjH7IDkS28', 'lrz', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epVeagKcVaemSNadmpnJUFyXn18ia9zXaeJm1iaE2jVxDVNlMOEwTPdSTxCwQaMMjbZnbdR8pTgH8tA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:36:23', 0, 1),
(108, 'oyg7U0cdgEavAPShvY2hMZqDSDJw', 'Merry~酱', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJf89oiczgReicrNEib72pZ8USWkBQSUEXiangZ3DyK4WHBJzOCTVAbV5YrRoc1jvoFk6DFqHuicb1Unwg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:36:42', 0, 1),
(109, 'oyg7U0ezGgAOBIScm-jfMx7ZT1QQ', '茄子????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erXCQ8ISckOeZoyTOvWiaZfjH8icvn1xzrac9RgQmtQnZxghjSu8RGDJRUplFupOz134CqNEJh6Grsw/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:36:44', 0, 1),
(110, 'oyg7U0YR1OuGy_oBR2LAjSXulG5Y', '陈晨光15527868311', 'http://wx.qlogo.cn/mmopen/vi_32/Kh7wzo0j2ibbYF97nESsDcHxNoejTR4dG2EmFqrQt1Bcf4icLUiaP3gFKBqkvbCwQfPGayN7fBN82FUV6NXq1FQiaQ/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:37:04', 0, 1),
(111, 'oyg7U0dnE-A1yuOhvmnOguhRFG-c', 'pd????', 'http://wx.qlogo.cn/mmopen/vi_32/NCWqUnubuUyJ0uicU6xrW2lpERcVcXQ818icNjJCxeOBc4uUcInRqBTlSlicka5JicyQoosy9cVD0wKoZvvn2M6FhQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:57:59', 0, 1),
(112, 'oyg7U0dI1n9QtzrutcM8LeRaat7Y', '????翻身农奴把歌唱????????.', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicjnkj6dm6qNGnYic1rp6RvWKbcc6NEpCIVuoUVgHsyx90SibHCMKZyvILAV0jtTsytPYeicHphzP2g/0', 20, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:58:00', 0, 1),
(113, 'oyg7U0U3_xbh5zK5D9HaKGW5obVs', '????李海鹏！？', 'http://wx.qlogo.cn/mmopen/vi_32/Ds46aEECibnOFaibnUkiaeBp6HtZCM14GDohSXdZhtxx9h1Y6fA8F0UgYpqPCNzaWyJ1muibsgtR2TVa8Z2qRkuzTg/0', 45, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:58:06', 0, 1),
(114, 'oyg7U0cFujntEEkd76kjrlW4CwQA', '义义', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eriao1VBdibxoBdicZbouE2ia6oUPslspsbp0VG4jykE8sjJQGqgKeKHkicicYeiajezUrcR30prL3c4TRIw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:58:51', 0, 1),
(115, 'oyg7U0QMk4wZXB6yCencq2AdrwHY', '｀Jaggerˇ????', 'http://wx.qlogo.cn/mmopen/vi_32/PAMoNniatKkVHNmua4W86mlXG9xuOlHqrFibZFhH0g6Nxm1kXUDHR5ok9xHOibbwwgNeNBl3iaR0RQnvibJibFVP07zQ/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:58:55', 0, 1),
(116, 'oyg7U0SIgUeXtRo5DjRtBsvOhNkI', '王蕾', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eojBSWjmlU9CWibQOicA92kUFiaslFSXaicUpnqJo8RFRuCcIQn1n2Ne37dTC7JicWmvm2akUqstTeicmVw/0', 40, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 22:59:26', 0, 1),
(117, 'oyg7U0Woz9673o8Be8fbWJwVoxxQ', 'tietie娜', 'http://wx.qlogo.cn/mmopen/vi_32/qQIw3icGKcxicT33aSBldXubFoFj5XvQIs7tTI3D1RykGnN5wDCX2vibX4iavdTnj7kYXppiaFRWrpRfrdthd53QYug/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-25 22:59:28', 0, 1),
(118, 'oyg7U0dxk3dO1cTXJqcGnrMT37jQ', '张翔', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBnQ2AZibJic0qribTiblOl1bIywx88VWesSLZgh9AT1er8HTo869fOEic0TQUlZUY1Ul9YypH4reVB8A/0', 20, '', NULL, NULL, 0, 1, 0.00, '2017-11-25 23:00:56', 0, 1),
(119, 'oyg7U0UCbuKzjW0aNzz4Ix5Bk_iE', '小鸡炖蘑菇????', 'http://wx.qlogo.cn/mmopen/vi_32/d8vpC6nE8p6duFJVBQBI7pH79JcdFlSPy3EDTwewuaWeKvyc1rHpXsApCbziaI9SEFFo05ph72Qglia1tOfbbT1g/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-26 19:18:15', 0, 1),
(120, 'oyg7U0bXX3mmwdNApOn8QhxY3_tg', '贺兰鑫(^｡^)~', 'http://wx.qlogo.cn/mmopen/vi_32/jMQvricCYnibvW6qQicItUItNDvSevm9iakicyCGicNQju9BhqKYabkLE3ZTMcMAEibiapfAG8YrzCV1ibvpia382iacQLfzg/0', 25, '', NULL, NULL, 0, 2, 0.00, '2017-11-26 20:08:57', 0, 1),
(121, 'oyg7U0f8crLjfzdv-mBGiGgUwZBE', 'lapooh', 'http://wx.qlogo.cn/mmopen/vi_32/eQIGFbOqGibp218oEPBWztzXic7I2ticlTYHKwJ998Sh7A9W7C6u24tPxmhsI0hRA0gzEThEeDa2m3teT6yk3xAbQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-26 20:09:18', 0, 1),
(122, 'oyg7U0e_W8sNLxkq-QiNcYsMNVZc', '石明仁', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqWGNaQTH3Ylo0GpaicC5OZPNqXkY3wCrL0pq4z3p6qJoIDGc85MfS8oqSMfFO9EP1BiaxgbIMJx1ibA/0', 50, '', NULL, NULL, 0, 1, 0.00, '2017-11-26 20:10:17', 0, 1),
(123, 'oyg7U0b9qM3WSwLGmrvbgSfKhg1c', 'MJ', 'http://wx.qlogo.cn/mmopen/vi_32/PbWTKej7b17JA48vAkqIfU4VXbuf8os7oAeDwjAjxmicGCicWA7ibbgZ2oAOD8aVX1GbUN8FAmgjzKd1uMuBfiaXAQ/0', 25, '', NULL, NULL, 0, 2, 0.00, '2017-11-26 20:11:20', 0, 1),
(124, 'oyg7U0QQxLBaJppUnvKP6OnT7Mek', '????', 'http://wx.qlogo.cn/mmopen/vi_32/6hkWKL9K2KvfCuzw9aTwGwiaAnG72WtjAyNxczUicZA60iciaCLYwFIrfG3srJIhxd1QaJTzDqPTmttzcnc4BDSg2g/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-26 20:45:11', 0, 1),
(125, 'oyg7U0TUzZ1RQBLQF5Ed3fkcOrI8', '梅藜耀', 'http://wx.qlogo.cn/mmopen/vi_32/2qZ6YZarFbpChIkIgib5uc2IDbJZlmVib8K58dLgcXGaQvWZKlRsibAkR8hHdupjuTUO6IDpjSTmvqF1va5KCm0Kg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-27 08:21:23', 0, 1),
(126, 'oyg7U0UYjEDKXVSY9MXLZvl1mASA', 'Zhouxin__????', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELiblelOvVQ6ok2lvkXg7Weib8xKiauibiaIhjWK6IynswXFS24jkrLp5ObuHhBMTS0lrichF6OJ1OtJcSg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-28 13:28:42', 0, 1),
(127, 'oyg7U0Ufw_2EyH4oSpy7iBZ1FGHc', '对方正在输入...', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKqYQURSZr9MY4YAfVm3EDib2ibhyiaz9V5pgCUyRhFuibcsMYDSBicibRKhT8WOrddTIZ9ExmQSiaM7oibOQ/0', 75, '', NULL, NULL, 0, 1, 0.00, '2017-11-28 21:42:56', 0, 1),
(128, 'oyg7U0YLIcwRt2Ynqtn1XLErM5rY', '哎呦巍', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epq6QQbdzWkEevWzicnABogb07WamKBzAK7Agiaghib9e9wF25m3TINlBArGgWXC8mHZj8NMMdhkFVrg/0', 40, '', NULL, NULL, 0, 1, 0.00, '2017-11-28 21:43:11', 0, 1),
(129, 'oyg7U0UQg_6LVTXVPRVOunOxaZOY', '呵', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJeWrV1vsp9lLn41vJCsllEaAmMRHzrqv4Mh4icUyyrQnJTLjJehMT9NTThzHNibI93KvajsibQfxgrQ/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-11-28 21:43:13', 0, 1),
(130, 'oyg7U0ZsOuNHnSihyoWhL2pDoVDw', '亨特', 'http://wx.qlogo.cn/mmopen/vi_32/y4vYCibfRbT3icgM5AYxgX25TgvoCCjqk12bTmuWUAmLibmKIX9YzYpFsKzqwuib3R0iaWw5ukiah3PGKPkOVRYm07TQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-28 21:43:43', 0, 1),
(131, 'oyg7U0QzYK2DQG-ThN9PZ84ymyTo', '要努力', 'http://wx.qlogo.cn/mmopen/vi_32/jT8qEFTKfVjK5bUVIvSxxLLKXTC6IzyQssIKXv6bJEQOFfW0bdicpmM9uIArFWyFILh7mYmQsxRAX6BOEhTrrfQ/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-11-28 21:44:02', 0, 1),
(132, 'oyg7U0QcRMC9zmNCB3i6-75zhxc8', 'felicity', 'http://wx.qlogo.cn/mmopen/vi_32/4EJSPDt8JbdR4AwYy5MOic9qGzpzPA04REqndKjoSzTWlXia4fN0FeiaGic5wDSXTWsqDkdic9N7TwmTk6iaOmpOzg7g/0', 0, '', NULL, NULL, 0, 0, 0.00, '2017-11-28 23:17:05', 0, 1),
(133, 'oyg7U0U9joZg9nS2noImyLm8m9Lo', '李诗含', 'http://wx.qlogo.cn/mmopen/vi_32/AHukDxPf2pCou1NpXlKctundAV9CiahcMTiaadcxZ1xFDskKzlXC2OQslZCHdVFO51uS1WtUfqFJNia9a2E4wwZ5A/0', 15, '', NULL, NULL, 0, 2, 0.00, '2017-11-29 19:49:12', 0, 1),
(134, 'oyg7U0UxZJxuKkY6qDufbpDCl5oc', '神光', 'http://wx.qlogo.cn/mmopen/vi_32/K9BCiak9dnHYwlHzYNJajHlpKn9aBqibBT4NpCrGHMxN0CBQxgK5KE7OSDHRg1py0oPyvEbO7lWJt5DQesW1na7g/0', 50, '', NULL, NULL, 0, 1, 0.00, '2017-11-29 19:49:32', 0, 1),
(135, 'oyg7U0SI7u80xdzHnXYzCOwaJ1xo', '隐藏', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK5EwbjvPTqZv8daDiaZotJB6Oib20E2fzib02eichvduEQ7Wk0rejCNSjbKYGWgwg1x99gqec2PyGKwA/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-11-29 19:51:12', 0, 1),
(136, 'oyg7U0f4DitbnDR7S6KtphvOeYe4', '周俊', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep0hhib5icOVF8vIZ3UsibolzO6gYliaXKwrYKMvqJApdO4LX18ic5a71P80ia1C7IamydzHN9Am107O0Ow/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-29 20:22:06', 0, 1),
(137, 'oyg7U0aai0B-ZifwoClz0qzZgwys', 'Vesery????????', 'http://wx.qlogo.cn/mmopen/vi_32/k4G4afU3KnnoRz92IiaiaNiaicbnqpWmN8iakOTGnfy4YxkrMFA9RdiaBa8mUwNuM0jzgqkib95h69QsbzCquvbZwkILw/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-11-29 20:46:56', 0, 1),
(138, 'oyg7U0fT3UaVH4RpxeSMn4xbxIUc', '老街与他????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJeosykIUSTgmJSx3picYlaGPFuyAHYb9junTMdqhxLmiajvLGDHLibKSCUtZnoXpdjthcXp7EfjZwUw/0', 60, '', NULL, NULL, 0, 1, 0.00, '2017-11-29 20:47:28', 0, 1),
(139, 'oyg7U0SGejaMBm9qbX74XFV_KFC8', '????亡灵', 'http://wx.qlogo.cn/mmopen/vi_32/QHUAdS5eJL93OLA4vxCQdhc7P36IjOiaEtLDATftlqsLjflFrlQlQdCHGt3DgoOq93AMBuJwrtegiaUtPxe6Wjpw/0', 35, '', NULL, NULL, 0, 2, 0.00, '2017-11-29 21:59:25', 0, 1),
(140, 'oyg7U0TFG6d9CKox3AjxHXhmzhLo', '新开张', 'http://wx.qlogo.cn/mmopen/vi_32/Cxp7icNXbU5vQKxhwYV33RJfH3GsaSSHepUqLjcs8bbqPAYjbxygtliaLms56O58HAYck8VRW2kGxUl05Dq4L0ibA/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-30 15:15:42', 0, 1),
(141, 'oyg7U0Xm8Eaj5xDFuFj9eFGgZ4a4', 'LiSA(LiVE is Smile Always', 'http://wx.qlogo.cn/mmopen/vi_32/jfcxjrOO5DZhEmt3TO07Qf7g0jWGsQjmK6ldKUjzreWTCzNUiccIggVEejr3nxUh2gdgcnFqZfia43Sic7O7q7LuA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-11-30 18:30:13', 0, 1),
(142, 'oyg7U0ZKFiQKHDQ_NmE1R3blxS44', '纸飞机', 'http://wx.qlogo.cn/mmopen/vi_32/Pnz0ialTZSeDIiaS22aR0fMv6nOr2bXvPKHXmlMf9zB8lic6sCy76vAyXthUice8MrZtqgydFiaUK0w1uDkXo4zMGlw/0', 25, '', NULL, NULL, 0, 1, 0.00, '2017-11-30 18:30:16', 0, 1),
(143, 'oyg7U0SNrx-KjWjNb99HwUrgDxk8', '酉星', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTILTbxpPfnRB2YADpOicNIMCWBFnnyc27iaHpZDclV3vxJz4qXuib2ia8LCDHniczL1pAic8iaALFre3YKyQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-11-30 18:32:27', 0, 1),
(144, 'oyg7U0WmI3KfgMiwiSYiiwVMIiXo', '猴头菇', 'http://wx.qlogo.cn/mmopen/vi_32/vs36kylmiagmibU1WSQagDiadibXnIJlLAj1JWlODYePkqop8LROk4I0fh6zZgshl6XWQXE8Kf2brDdlDUnSVicVYYw/0', 0, '', NULL, NULL, 0, 0, 0.00, '2017-11-30 18:32:55', 0, 1),
(145, 'oyg7U0a7M52eZ-WeXGnCPAvz_KN0', '张忍忍', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKc5nNF2TPU1z5U3ncTmVYnEyOUuicO0r8ibOGak6bl9AQbsibPxaZK5Q5ysseWibejr7mBNRXzJlEBHQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 14:27:50', 0, 1),
(146, 'oyg7U0RK9_lrp4Xwv0rYdcorWAl8', '汪小洋????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eptm36I63fHdj8kyx4ke2bO8WI5vBkD2BHEZtBqGbZKz2BVhPXlqK3iaHC0BfoTzMV3PkhJPs924Hg/0', 65, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:21:26', 0, 1),
(147, 'oyg7U0Z7akPZn55P5_6ND_IQPygg', '黄????田❤️心', 'http://wx.qlogo.cn/mmopen/vi_32/jyX97Kd0ho3e8cYd4KprMOJ6DDhqRQuwkJcnBIMXicFfe9XTHJhYb7fU85k4ILHWCgUciaBzB2F3ZgBibuqC15pXw/0', 20, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:21:27', 0, 1),
(148, 'oyg7U0XcThRBSAZU4FT-ww1L-zqY', 'Corner *', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCTaxpLNkZ9Gc0Xia6hc1siaWTx4FcS4MW6QXvicRxhkUyAKUvXY20ttVaBfnMGXoQ5icFJbCtydR4Qw/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-12-01 19:21:32', 0, 1),
(149, 'oyg7U0QtGsWsAjcrZDmX-oMHOFwA', '罗  琦。', 'http://wx.qlogo.cn/mmopen/vi_32/vb9dyWlUDNXzTRcGMtKMNWz6B2kY9610xMGTeLlOhpb8oIqWII5NeyVrUDbMIskPj8tVLPyapRIGqlfGHOSdPQ/0', 35, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:21:35', 0, 1),
(150, 'oyg7U0dtBgCuFzJ5l2tJY6UfbaBc', '李小贝、', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epDwZ9fM2m5FtOSfFNrr10oibYIV7F5dRThL5Ps15OiaM0yVFpnYYhPElRz3bIqDf5bicRsVg3G4zSBQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-01 19:21:38', 0, 1),
(151, 'oyg7U0TRnE5ydSZrUVgi9QXG2PQM', 'Cissy', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJscpicM2wyBcm35bp05YEObDFprniaYJOJrHTAOUL3GDibGOxOiaYp910P9QTlZGUV6fy6DNted17lQg/0', 60, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:22:22', 0, 1),
(152, 'oyg7U0ceF_PY-tf_XwWNyilus5Hg', '曦曦', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq3ZSAGqibEHffGHDCP7aSe5ZGyrXr5M3qicnGHiapPLjqbFHmI36wNSqfUFygbFq4qxG7L36ia8ADK3w/0', 40, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:22:29', 0, 1),
(153, 'oyg7U0R_QcNKcc2cviVlMIr1Vm_I', '东京story', 'http://wx.qlogo.cn/mmopen/vi_32/S6h3pRIScQsMHzIQjaljGHofqQLec0cKmUTUkH4wWMSrTuv6djRh1Qzr7R72pTyZLSVaS5W8CXH6ERVJbheOzg/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-12-01 19:23:16', 0, 1),
(154, 'oyg7U0ZE_JV9fX__XLGDFo8PHmSQ', 'Z、琪琪????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJtZKicrNcVeq8n5ofSWnkXn084uhjAQNibxibFU85Jb89VBicQvfSX8RXWbVW61LSM3ibRH3kuO41UweA/0', 35, '', NULL, NULL, 0, 2, 0.00, '2017-12-01 19:23:56', 0, 1),
(155, 'oyg7U0bjNkrGcSPDvvGVhRb6Db9k', 'ayako丶 ????', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJkhqTws3JibJEeV0dQfnaDwL488NbWpwA01FlRW0uv6jmT4tS7icCjPyANS6YibN6kzR5k3EXvJ7Z5Q/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-02 10:27:01', 0, 1),
(156, 'oyg7U0X7Xqb7SO7poaPqD-7NYbSc', 'Vocalsamples。', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ3cOgzwTPUtNaibhgSaweAwQG6UIlkRF3q09cRCaO79OAziaXodFsXkWia87XTdpicuAyUPibVCNccK9w/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 14:29:09', 0, 1),
(157, 'oyg7U0UnM_EdCOa6Z4Qud9Kldc6s', 'A.MUSE².李凌峰17607148810', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiaxqhGTib6Q3AhxtjjkWicmG0ROL5URMhQngWicmEk2Hw7pBDyol0UkEIVD1jzibPHicbgRYyFKlTIybw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 18:27:23', 0, 1),
(158, 'oyg7U0QzkqRYexuSA4XS0TguY-9Q', 'A我家烧麦', 'http://wx.qlogo.cn/mmopen/vi_32/be998ic1hFIhezIh017BpIYib7KziahmGAKg23z9udJibOWskJGpKsgE1k7fHbgk3o2E4iascZ1rUqkswSxzyDpricXw/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 18:55:15', 0, 1),
(159, 'oyg7U0SDnum31TPYa6_rJNcpPtGk', '范永清', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoY7iaddSHdIBvaZZzKraqENkpwTW3bbMKEo4GMYkI7Z8ZFJILLFzoycTdBMVGdSxeMOmg4KUjxGdQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 19:17:31', 0, 1),
(160, 'oyg7U0XEfEfBgjlyeI-JGeHJRn10', '惠姣龙 Sping生活', 'http://wx.qlogo.cn/mmopen/vi_32/C7E12VaGp3DcXtJwqJavhPuKW3777TSBKBfabPapqLGFgfvbyBZR7r9kzGhQWicktOUku8ppCzMauRh2rqEpCKw/0', 20, '', NULL, NULL, 0, 2, 0.00, '2017-12-02 19:50:37', 0, 1),
(161, 'oyg7U0YqkxGd1xG3V3l7LnaTZvGo', '何荒唐荒唐', 'http://wx.qlogo.cn/mmopen/vi_32/vVEOzKllCmMphMEm8Rz63xQalDW8s8MpBuictkNkWpNvNIPwfibuQ1pnicS1qL5vJupov8nHibmn1tN7NkzjZDuIsA/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 19:50:44', 0, 1),
(162, 'oyg7U0fIHSn_TLqNSPBzUO2Ck4Ms', '_雷鸣', 'http://wx.qlogo.cn/mmopen/vi_32/vg3RBsQ3DnoeWu45AeBZj4fhjuvicOKZJKRUMHKmwVCv6oc2vBViaDNk3YI7BIAHwnPSjiagGibCcIjs1VTpybibpYg/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 19:51:05', 0, 1),
(163, 'oyg7U0ThLNn4N-uhtq0qTSmpMFjo', '聂昱', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo5HP1ibenk8NuRduhJ1jZzmlJuLCQzicxd1VPrv06lTmSDDv8249KyfZrqSJeK1dXF6rOrqLibKBpUQ/0', 65, '', NULL, NULL, 0, 0, 0.00, '2017-12-02 19:51:40', 0, 1),
(164, 'oyg7U0RlPqP8jVkfjxwpI4Z51qNQ', '阿神', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJlJf0evKOialQDJiaW7ibQpJbU78muqiaVCPogZbpMoOorax0Mo2e4o5bOKs6F3E2bYKnibhmK2XNZG4g/0', 35, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 19:52:11', 0, 1),
(165, 'oyg7U0TosT4Bdh1bq__FMWOMT_Pg', '无  限  大', 'http://wx.qlogo.cn/mmopen/vi_32/QPqldEtceF1vsk9YSK78HdaOxrFVAIIOGJJGdY3AsvOO0cLH5wAEzSfYQqxfibtgb40jDnSXm7OulXkmtWdxjNg/0', 35, '', NULL, NULL, 0, 2, 0.00, '2017-12-02 20:03:21', 0, 1),
(166, 'oyg7U0ccFXvDlyM1_Ef0mtlEAYyI', '吴凡', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKeiat6M2kiaywLmVmEKUOticCojSubym2MTVHOFxJawYhgPqNq2ol4ZLX4I6FyT6OhwyEsAZdibPnfrQ/0', 50, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 20:04:30', 0, 1),
(167, 'oyg7U0U1QrA8QaujTX69LDlRYPhw', '江瑛', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELibBXg6DyMdOQ99T78BSkAibv4YX6MhGE4QwjzDby4FUfXjs3NAUsicmxItEMp4iaUodR99hHgVHFJCA/0', 15, '', NULL, NULL, 0, 2, 0.00, '2017-12-02 20:04:38', 0, 1),
(168, 'oyg7U0VtxhtMZNihkPEO0NHWYKKg', '文轩……', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFibBVics2hOEjWfNeLfMRjUhGWpksZ5WMj7OvKHp0gVia6Faia9JicpicJLib3sO77uk6qLJlR19Tsm4Bw/0', 55, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 20:05:27', 0, 1),
(169, 'oyg7U0b_dlUZmWr5BmDW6WcRh3qM', '何   小榕', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLxpyP19LpueENf4ibtMt5JuFE2XX3YQ4H6dXMT2pxLPXa7qHsHibu0ibNNHfRClib0aPIJMRW7b5SF7w/0', 90, '', NULL, NULL, 0, 2, 0.00, '2017-12-02 21:02:00', 0, 1),
(170, 'oyg7U0dEg33Dq-7zymgoI55iQvzI', '王惠', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep3darxesnzcUHquotLXA3HpyvWbQvNc7htqtm4DfGAakFlD5Mib11XR0skr7pFWfKGT7HSMtZ0dAA/0', 65, '', NULL, NULL, 0, 1, 0.00, '2017-12-02 21:42:30', 0, 1),
(171, 'oyg7U0QNhdjbpC9MuD6YTi3cAFgM', 'Dragon.', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoMqeZhXPicnBhHXXibicvmNMjpiavLSRM1ic1Ixz9vbyq9QfjCia0jud1nlV0cBuhGceq9lgoLicX8v0mAg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-03 00:22:23', 0, 1),
(172, 'oyg7U0RZRYbvO1Lp5K-Yxs_Pnwx8', 'Aim 曾成令', 'http://wx.qlogo.cn/mmopen/vi_32/oia8utpVIkYY8iblib5zpfkicNWrXgHstia069adGTOhicibBGI6HicxKRgO7ibrfxHfNbETsEiaUG37y0jeMwCACvSEpzMg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-04 09:02:34', 0, 1),
(173, 'oyg7U0e8hqUr9VCgTBIL-PSvryUs', '^菟尛猫O????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoUFrq7bWpDQ88bH4RE3DVhw85a9lJbG66osYXfANyicvNEePAk8lVt6ic5L3kJunM15RrSILU9MvXQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-04 15:55:05', 0, 1),
(174, 'oyg7U0R0OntBQ_88naglKSBMZIAQ', ' 干掉熊猫我就是国宝`', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI0mMeTY3WTxdHeuUniaHMvgb4PZKqmN2uDytsQfCbdsVcS0DEcSlicibeibmUSOIWSkrfFkKWzacMHNQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-05 08:43:46', 0, 1),
(175, 'oyg7U0Xv8MdplikJIKC5wogRttWE', 'crown  prince', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJIqnV1t5iaOODWkVEkmpPR0ib9iae2ibMW8NqiawgfAib0U8sgibw61knKKBwoEJUJMzeibp1e2pKXZsgTg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-05 13:55:40', 0, 1),
(176, 'oyg7U0WYjm5hJB-7j93drAMtwXVQ', '平安金融-金作春', 'http://wx.qlogo.cn/mmopen/vi_32/QXSmwc4hDriaV5ia95ovyC38X93FG6PXRXT2QtZUY5VoKnicuK6kW7WJqjyrsicgXWnN7icuU2r50kNl67pPUQSzYOg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-05 13:59:36', 0, 1),
(177, 'oyg7U0SBRBe8ehutxYZXHptGsD1k', '飞翔', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkmUx7wzh8GHrxPKibo6yzwibiaickjJXZKKpjJnichpDIcW0Lic2zcgs8Go16BGCIKfW6udecPODa7ZpA/0', 15, '', NULL, NULL, 0, 1, 0.00, '2017-12-06 09:29:48', 0, 1),
(178, 'oyg7U0Yf5TACEi5e8c5N9tJcuGmE', '.', 'http://wx.qlogo.cn/mmopen/vi_32/H9F7ickrUtxGyKzy5nncAWeibXkMtsMp1TXWxtLbibcFay6OrlUdHz3COfx0oiaxQaDSsuCXoFmbQQicYiaibe0ibickUJQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-06 11:00:27', 0, 1),
(179, 'oyg7U0dHfmTRXBZo66LNac4vsUJA', '啦啦啦', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epbvARPChebCAEnmfKFZDsiaEVqkFlXRu3dTVYVhPyh5gibdiabFibRicTtYYh3Hibc8icWHB3u7EqhBwyHA/0', 0, '', NULL, NULL, 0, 0, 0.00, '2017-12-06 16:16:14', 0, 1),
(180, 'oyg7U0WJOwTG94Wjo6acEtNdnffQ', 'Eric', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELYWpuPoicVY9oOfibLVknZmIOa1ibbo5ZSQMKbB3I1BZI4cCNff3AqcxQ2FfZ8KSlClnDhicTc39ibUQg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-08 12:57:23', 0, 1),
(181, 'oyg7U0cqOFQk9Oq9IjgAXVq6g8EM', '黄腾', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep8YGVkbXqcriaSNEvnCVbTdlOf1jBgbyXDEMsibAIocDtTh1dWVSibOCvbZiapWDB7r5PW7ovNQlNd9Q/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-08 22:02:16', 0, 1),
(182, 'oyg7U0TFjy3MT7FCBGnU4XRBrT0c', '风中', 'http://wx.qlogo.cn/mmopen/vi_32/R2Hz8hOTib38DriaokDKCHFQOLbKFjBBic6woichDtic5yHjRWRYnoURaYicLSUxbTjibdct0yhQo6fUye8XFuakOy3Hg/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-09 00:32:51', 0, 1),
(183, 'oyg7U0e1sq-Ru_wS_kUE5-vghNHw', '天野直澍', 'http://wx.qlogo.cn/mmopen/vi_32/6hS5NEnDniaWr1T6fNS4ia4JFgSFv70o8sMgFiaCaEopbgKsXicRymbDX3yBnBlVuPPm35SQpFSwNU3A7iawRp79TnQ/0', 0, '', NULL, NULL, 0, 0, 0.00, '2017-12-09 09:43:46', 0, 1),
(184, 'oyg7U0V7LUuXD30b0UuEJMNGu_Us', 'Becky', 'http://wx.qlogo.cn/mmopen/vi_32/JedNAOtPpATsp9jfNpIokucZDRBNyVcwwosQvnTxJqlezN5LfTTW7NalHw2FiaZ5J927C4nEvC9kuNLAHl7UsGQ/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-11 13:40:42', 0, 1),
(185, 'oyg7U0dvIpmEwAdxAYOzNt3uD28Y', '夏至未至', 'http://wx.qlogo.cn/mmopen/vi_32/FWwkDMJ84jqib3SfU8bxn0ziaQ9tjcfYqib4IKwXnWJuh1paQqTranHic1vWaYicfqJsLmZTYjicSekuYcrPibrCaqOow/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-15 21:12:11', 0, 1),
(186, 'oyg7U0d8VTuFjKNaVJL0t3K0HYCE', '????', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiaH6jmKv9C8nliaqibOyEedRJibNVVEicHuwXlvStACL3qiaBylgTHX7xFHPJ6ZHIOFC8LeIF0gBG3Jzg/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-16 18:00:18', 0, 1),
(187, 'oyg7U0XZ5DjU5BFxF44UeXLbunVk', '.', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLoWmiaLBuwruMSZbOxctnSicFByeTUuJfh57Zjh0CUZGdFY4DLv5mjZ3VXYrbF0gBibeclS3FmGMwGQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-16 18:11:16', 0, 1),
(188, 'oyg7U0eBGhBNIyXsAu5HXcAHzghY', '柯南倒耳', 'http://wx.qlogo.cn/mmopen/vi_32/gpQiawQVRKlBWFM0fYIBSfPShsmhFvSiaIuiafnYnMndBEualNKmIKBGicFT9WT1hOKQ92HGTJvgWYRDQaUhHWoGgQ/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-16 20:38:33', 0, 1),
(189, 'oyg7U0Yw8Bd9jbfNUPQ1D9XT4nWg', 'Bowen', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIno9qwO98uwgeCkg78KNC4RquY3bIsXYhETciciaHpsKWr6555bibYsxFBe6NYkCicMOoKTtibicB5a56w/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-19 14:10:52', 0, 1),
(190, 'oyg7U0YgU6YDKjzPEPyN66pMQhok', '宋词', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL8h6lh7msFynOVJ5Fm2bqnYsvfvOsQEwRia5g6chLRDSnHroXMIxJ6JNibWXmwkVJA6A8Nu8cvzbpw/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-21 15:40:27', 0, 1),
(191, 'oyg7U0Q1As2DUMFxX4iZLCZIS4Qk', 'XUANZI', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epg6oqvfcbcpmOWfCWjABRia1gdlDaib5fxKCxer0BlIQco3ecibKENLaB2EfZlNuCzvPrFt7wRou56A/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-21 16:38:17', 0, 2),
(192, 'oyg7U0RkB7gz8gG3C78xMwM_d2Jw', '????', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJlN0AUA3CiaZ1WCcIicS7Cgh9MOyyDVr8xNrw2Wnlq7EuLymQ4wMy6oTsKSvH6bnWicnEsDpibwtvibcA/0', 0, '', NULL, NULL, 0, 2, 0.00, '2017-12-22 00:57:55', 0, 1),
(193, 'oyg7U0YV7b6vjugKnZpS4DJykAqY', '黎大旭', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLga6F6jxVkz6dQcGiaoGvu43u1gr38oVfMrgogfFCEHhDD2reWnVQ0EvCsMibibmYVmbaH5iafzbdV7g/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-22 17:53:35', 0, 1),
(194, 'oyg7U0TFHnzJrhRICvqsde7bxjEA', '肖文钊13971285414', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTInSWicVSUdicG22mibeBWK7ZhphK4qROm8HiavibB0YfOuCS62aK6hWibb3nZ19pRQmT6eBSXFjg43BwLA/0', 0, '', NULL, NULL, 0, 1, 0.00, '2017-12-22 18:43:26', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_chat_log`
--
ALTER TABLE `chat_chat_log`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `chat_chat_msg`
--
ALTER TABLE `chat_chat_msg`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `chat_friend`
--
ALTER TABLE `chat_friend`
  ADD PRIMARY KEY (`friendid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `fuserid` (`fuserid`),
  ADD KEY `ftype` (`ftype`);

--
-- Indexes for table `chat_user`
--
ALTER TABLE `chat_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `chat_chat_log`
--
ALTER TABLE `chat_chat_log`
  MODIFY `m_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID', AUTO_INCREMENT=203;
--
-- 使用表AUTO_INCREMENT `chat_chat_msg`
--
ALTER TABLE `chat_chat_msg`
  MODIFY `m_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID', AUTO_INCREMENT=203;
--
-- 使用表AUTO_INCREMENT `chat_friend`
--
ALTER TABLE `chat_friend`
  MODIFY `friendid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `chat_user`
--
ALTER TABLE `chat_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
