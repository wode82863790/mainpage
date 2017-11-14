/*
 Navicat Premium Data Transfer

 Source Server         : zyapi
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : ykd

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 11/08/2017 15:08:43 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `aboutus_img`
-- ----------------------------
BEGIN;
INSERT INTO `aboutus_img` VALUES ('35', 'aboutus_in', 'images/aboutus_in.jpg'), ('36', 'aboutus_out', 'images/aboutus_out.jpg'), ('37', 'aboutus_lit1510021592512.jpg', 'images/aboutus_lit1510021592512.jpg');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `banner`
-- ----------------------------
BEGIN;
INSERT INTO `banner` VALUES ('21', 'secend_banner1', 'images/s_banner1.jpg', null, null, null), ('22', 'mainbanner', 'images/mbanner.jpg', null, null, null), ('23', 'banner1510021563644.jpg', 'images/banner1510021563644.jpg', null, null, null), ('24', 'secend_banner_goods', 'images/secend_banner_goods.jpg', null, null, null), ('25', 'goodsbanner1510021780805.jpg', 'images/goodsbanner1510021780805.jpg', null, '9', null);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
--  Records of `callus_img`
-- ----------------------------
BEGIN;
INSERT INTO `callus_img` VALUES ('20', 'banklogo1510021679825.jpg', 'images/banklogo1510021679825.jpg', '0'), ('22', 'storelogo1510021698698.jpg', 'images/storelogo1510021698698.jpg', '1');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods_intro`
-- ----------------------------
BEGIN;
INSERT INTO `goods_intro` VALUES ('15', 'main', '哈哈', '9', null), ('16', 'intro', '哈哈哈哈', '9', 'images/intro1510021772216.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `logo`
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo` (
  `logo_id` int(20) NOT NULL AUTO_INCREMENT,
  `logo_src` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`logo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `logo`
-- ----------------------------
BEGIN;
INSERT INTO `logo` VALUES ('4', 'images/logo.jpg');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `news_img`
-- ----------------------------
BEGIN;
INSERT INTO `news_img` VALUES ('8', 'news1510021650173.jpg', 'images/news1510021650173.jpg', '9');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_aboutus`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_aboutus` VALUES ('4', 'aboutus_intro', '好公司', null);
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
--  Records of `ykd_ally`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_ally` VALUES ('3', '张经理', 'xxxxxxx');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ykd_down`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_down`;
CREATE TABLE `ykd_down` (
  `down_id` int(10) NOT NULL AUTO_INCREMENT,
  `down_img` varchar(50) DEFAULT NULL,
  `down_name` varchar(150) DEFAULT NULL,
  `down_inner` varchar(100) DEFAULT NULL,
  `down_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`down_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_down`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_down` VALUES ('6', 'images/down1510021796581.jpg', '下载1', '下载哦说明', '#');
COMMIT;

-- ----------------------------
--  Table structure for `ykd_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_goods`;
CREATE TABLE `ykd_goods` (
  `goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_mainimg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_goods`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_goods` VALUES ('9', '产品1', 'images/goods1510021760937.jpg');
COMMIT;

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
--  Records of `ykd_help`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_help` VALUES ('6', '问题', '回答');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_honor`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_honor` VALUES ('5', '荣誉标题', '说明', '2017', 'images/honor1510021671324.jpg');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_join`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_join` VALUES ('3', '哈哈', '1', '哈哈', '长期', '技术', '济南', '全职', '哈哈', '哈哈');
COMMIT;

-- ----------------------------
--  Table structure for `ykd_manager`
-- ----------------------------
DROP TABLE IF EXISTS `ykd_manager`;
CREATE TABLE `ykd_manager` (
  `manager_id` int(10) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(10) NOT NULL,
  `manager_pass` varchar(20) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_manager`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_manager` VALUES ('1', 'admin', '11223344');
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
  `news_inner` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_news`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_news` VALUES ('9', '新闻1', '2017-01-01', '新闻简介', '内容');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ykd_timeline`
-- ----------------------------
BEGIN;
INSERT INTO `ykd_timeline` VALUES ('13', '荣获', '', '2017');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
