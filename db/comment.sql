/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-20 15:21:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `aid` int(5) DEFAULT NULL,
  `wid` int(5) DEFAULT NULL,
  `ccontent` varchar(140) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_account_comment` (`aid`),
  KEY `FK_weibo_comment` (`wid`),
  CONSTRAINT `FK_account_comment` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `FK_weibo_comment` FOREIGN KEY (`wid`) REFERENCES `weibo` (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '4', '3', '新修改的评论2', '2016-10-15 14:44:42');
INSERT INTO `comment` VALUES ('2', '4', '3', '新修改的评论343434', '2016-10-15 15:04:11');
INSERT INTO `comment` VALUES ('3', '4', '3', '新修改的评论343434', '2016-10-15 15:04:57');
