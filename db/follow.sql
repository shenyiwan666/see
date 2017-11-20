/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-20 15:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `fid` int(5) NOT NULL AUTO_INCREMENT,
  `aid` int(5) NOT NULL,
  `follow_aid` int(11) DEFAULT NULL,
  `ftime` datetime DEFAULT NULL,
  `mutual_concern` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK_account_follow` (`aid`),
  CONSTRAINT `FK_account_follow` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('51', '1', '2', null, null);
INSERT INTO `follow` VALUES ('61', '1', '4', null, null);
