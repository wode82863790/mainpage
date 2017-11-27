/*
 Navicat Premium Data Transfer

 Source Server         : zyapi
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : ykd

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 11/27/2017 16:22:25 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `aboutus_img`
-- ----------------------------
DROP TABLE IF EXISTS `aboutus_img`;
CREATE TABLE `aboutus_img` (
  `aboutusimg_id` int(10) NOT NULL AUTO_INCREMENT,
  `aboutusimg_name` varchar(50) DEFAULT NULL,
  `aboutusimg_src` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aboutusimg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` int(10) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(50) DEFAULT NULL,
  `banner_src` varchar(100) DEFAULT NULL,
  `banner_date` varchar(50) DEFAULT NULL,
  `banner_outid` int(20) DEFAULT NULL,
  `banner_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `banner_outid` (`banner_outid`),
  CONSTRAINT `outid_banner2goods` FOREIGN KEY (`banner_outid`) REFERENCES `ykd_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_img`
-- ----------------------------
DROP TABLE IF EXISTS `blog_img`;
CREATE TABLE `blog_img` (
  `blogimg_id` int(10) NOT NULL AUTO_INCREMENT,
  `blogimg_name` varchar(50) DEFAULT NULL,
  `blogimg_src` varchar(100) DEFAULT NULL,
  `blogimg_outid` int(10) DEFAULT NULL,
  `blogimg_intro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`blogimg_id`),
  KEY `blogimg_outid` (`blogimg_outid`),
  CONSTRAINT `outid_blog` FOREIGN KEY (`blogimg_outid`) REFERENCES `ykd_blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `callus_img`
-- ----------------------------
DROP TABLE IF EXISTS `callus_img`;
CREATE TABLE `callus_img` (
  `callusimg_id` int(10) NOT NULL AUTO_INCREMENT,
  `callusimg_name` varchar(150) DEFAULT NULL,
  `callusimg_src` varchar(100) DEFAULT NULL,
  `callusimg_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`callusimg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `goods_intro`
-- ----------------------------
DROP TABLE IF EXISTS `goods_intro`;
CREATE TABLE `goods_intro` (
  `goodsintro_id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsintro_name` varchar(10) DEFAULT NULL,
  `goodsintro_inner` varchar(200) DEFAULT NULL,
  `goodsintro_outid` int(10) DEFAULT NULL,
  `goodsintro_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`goodsintro_id`),
  KEY `goodsintro_outid` (`goodsintro_outid`),
  CONSTRAINT `goodsintro2goods` FOREIGN KEY (`goodsintro_outid`) REFERENCES `ykd_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `logo`
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo` (
  `logo_id` int(20) NOT NULL AUTO_INCREMENT,
  `logo_src` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`logo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `news_img`
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img` (
  `newsimg_id` int(10) NOT NULL AUTO_INCREMENT,
  `newsimg_name` varchar(100) DEFAULT NULL,
  `newsimg_src` varchar(100) DEFAULT NULL,
  `newsimg_outid` int(10) DEFAULT NULL,
  PRIMARY KEY (`newsimg_id`),
  KEY `newsimg_outid` (`newsimg_outid`),
  CONSTRAINT `outid_news` FOREIGN KEY (`newsimg_outid`) REFERENCES `ykd_news` (`news_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_aboutus`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_aboutus`;
CREATE TABLE `ykd_aboutus` (
  `aboutus_id` int(20) NOT NULL AUTO_INCREMENT,
  `aboutus_name` varchar(50) DEFAULT NULL,
  `aboutus_inner` varchar(1000) DEFAULT NULL,
  `aboutus_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aboutus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_aboutus`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_aboutus` VALUES ('5', 'aboutus_intro', 'dfa\'f\'f', null);
COMMIT;

-- ----------------------------
--  Table structure for `ykd_ally`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_ally`;
CREATE TABLE `ykd_ally` (
  `ally_id` int(10) NOT NULL AUTO_INCREMENT,
  `ally_name` varchar(10) DEFAULT NULL,
  `ally_call` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ally_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_blog`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_blog`;
CREATE TABLE `ykd_blog` (
  `blog_id` int(10) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(50) DEFAULT NULL,
  `blog_date` date DEFAULT NULL,
  `blog_banner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_down`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_down`;
CREATE TABLE `ykd_down` (
  `down_id` int(10) NOT NULL AUTO_INCREMENT,
  `down_img` varchar(50) DEFAULT NULL,
  `down_name` varchar(150) DEFAULT NULL,
  `down_inner` varchar(100) DEFAULT NULL,
  `down_url_Android` varchar(1000) DEFAULT NULL,
  `down_url_iOS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`down_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_goods`;
CREATE TABLE `ykd_goods` (
  `goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_mainimg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_help`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_help`;
CREATE TABLE `ykd_help` (
  `help_id` int(10) NOT NULL AUTO_INCREMENT,
  `help_ask` varchar(50) DEFAULT NULL,
  `help_ans` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_honor`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_honor`;
CREATE TABLE `ykd_honor` (
  `honor_id` int(10) NOT NULL AUTO_INCREMENT,
  `honor_title` varchar(50) DEFAULT NULL,
  `honor_inner` varchar(1000) DEFAULT NULL,
  `honor_date` int(10) DEFAULT NULL,
  `honor_src` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`honor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_join`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_join`;
CREATE TABLE `ykd_join` (
  `join_id` int(10) NOT NULL AUTO_INCREMENT,
  `join_title` varchar(50) DEFAULT NULL,
  `join_num` int(10) DEFAULT NULL,
  `join_back` varchar(20) DEFAULT NULL,
  `join_date` varchar(50) DEFAULT NULL,
  `join_class` varchar(50) DEFAULT NULL,
  `join_place` varchar(50) DEFAULT NULL,
  `join_time` varchar(10) DEFAULT NULL,
  `join_inner` varchar(1000) DEFAULT NULL,
  `join_need` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_manager`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_manager`;
CREATE TABLE `ykd_manager` (
  `manager_id` int(10) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(10) NOT NULL,
  `manager_pass` varchar(20) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_manager`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_manager` VALUES ('3', 'admin', '11223344');
COMMIT;

-- ----------------------------
--  Table structure for `ykd_news`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_news`;
CREATE TABLE `ykd_news` (
  `news_id` int(10) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `news_date` date DEFAULT NULL,
  `news_lit` varchar(200) DEFAULT NULL,
  `news_inner` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_timeline`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_timeline`;
CREATE TABLE `ykd_timeline` (
  `timeline_id` int(10) NOT NULL AUTO_INCREMENT,
  `timeline_title` varchar(100) DEFAULT NULL,
  `timeline_inner` varchar(1000) DEFAULT NULL,
  `timeline_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`timeline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
