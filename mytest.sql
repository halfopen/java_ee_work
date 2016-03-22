/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mytest

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-03-20 01:19:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `BOOKID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BOOKNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BOOKPRICE` int(11) NOT NULL,
  PRIMARY KEY (`BOOKID`),
  UNIQUE KEY `BOOKNAME` (`BOOKNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('27', 'javaee2', '34');
INSERT INTO `t_book` VALUES ('29', 'JAVA IS GOOD', '55');
INSERT INTO `t_book` VALUES ('30', 'asdfasdff', '88');
INSERT INTO `t_book` VALUES ('33', 'asdfasdfasdf', '44');
INSERT INTO `t_book` VALUES ('34', 'asdf', '55');
INSERT INTO `t_book` VALUES ('35', 'c++', '65');
INSERT INTO `t_book` VALUES ('36', 'dev', '99');
INSERT INTO `t_book` VALUES ('37', 'asdfad', '44');
INSERT INTO `t_book` VALUES ('39', 'adf', '0');
INSERT INTO `t_book` VALUES ('41', 'adf8', '0');
INSERT INTO `t_book` VALUES ('43', 'adf88', '88');

-- ----------------------------
-- Table structure for `t_car`
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('3', 'ooxoo', '0');
INSERT INTO `t_car` VALUES ('5', 'FERRARI', '0');
INSERT INTO `t_car` VALUES ('6', 'NISSAN', '0');
INSERT INTO `t_car` VALUES ('7', 'BUICK', '0');
INSERT INTO `t_car` VALUES ('9', 'LOTUS', '0');
INSERT INTO `t_car` VALUES ('10', 'JEEP', '0');
INSERT INTO `t_car` VALUES ('11', 'DAEWOO', '0');
INSERT INTO `t_car` VALUES ('12', 'ASSTON_MARTIN', '0');
INSERT INTO `t_car` VALUES ('13', 'SSANGYONG', '0');
INSERT INTO `t_car` VALUES ('23', 'BMW', '0');
INSERT INTO `t_car` VALUES ('24', 'BMW2', '0');
INSERT INTO `t_car` VALUES ('25', 'BMW23', '0');
INSERT INTO `t_car` VALUES ('26', 'PONDA', '0');

-- ----------------------------
-- Table structure for `t_car_owner`
-- ----------------------------
DROP TABLE IF EXISTS `t_car_owner`;
CREATE TABLE `t_car_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_car_owner
-- ----------------------------
INSERT INTO `t_car_owner` VALUES ('0', 'admin', 'admin', '0');
INSERT INTO `t_car_owner` VALUES ('1', 'halfopen', 'bankaifuck', '0');
INSERT INTO `t_car_owner` VALUES ('2', 'qxk', 'qxk', '1');
INSERT INTO `t_car_owner` VALUES ('4', 'test', 'test', '1');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `ACCOUNT` varchar(20) NOT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `CNAME` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('qxk', 'bankaifuck', '秦贤康');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `STUNO` varchar(4) NOT NULL,
  `STUNAME` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '学生姓名',
  `STUSEX` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`STUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('0013', '黄云山', '男');
INSERT INTO `t_student` VALUES ('0014', '黄云山', '男');
INSERT INTO `t_student` VALUES ('0015', '黄云山', '男');
INSERT INTO `t_student` VALUES ('0017', '黄云山', '男');
INSERT INTO `t_student` VALUES ('10', '小小', '男');
INSERT INTO `t_student` VALUES ('11', '小三', '女');
INSERT INTO `t_student` VALUES ('2013', '秦贤康', '男');
INSERT INTO `t_student` VALUES ('9', '大', '女');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_time` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `login_times` int(16) NOT NULL DEFAULT '0',
  `type` int(4) NOT NULL DEFAULT '1',
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin@admin.net', '2016-03-19 20:13:56', '26', '0', '1');
INSERT INTO `t_user` VALUES ('6', 'halfopen', 'bankaifuck', 'halfopen@yeah.net', '2016-03-19 08:45:12', '1', '0', '0');
INSERT INTO `t_user` VALUES ('7', 'whu', 'whu', 'whu@whu.edu.cn', '2016-03-19 10:59:39', '3', '0', '0');
INSERT INTO `t_user` VALUES ('8', 'qxk', 'halfopen@yeah.net', '', '2016-03-19 09:59:05', '0', '0', '0');
INSERT INTO `t_user` VALUES ('12', 'qxk3', '', 'halfopen@yeah.net', '2016-03-19 12:01:43', '3', '1', '1');
INSERT INTO `t_user` VALUES ('13', 'qxk33', '', '', '2016-03-19 20:01:27', '1', '1', '0');
