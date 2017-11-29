/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-20 15:21:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for liked
-- ----------------------------
DROP TABLE IF EXISTS `liked`;
CREATE TABLE `liked` (
  `aid` int(5) NOT NULL,
  `wid` int(5) NOT NULL,
  `ltime` datetime DEFAULT NULL,
  PRIMARY KEY (`aid`,`wid`),
  KEY `FK_weibo_liked` (`wid`),
  CONSTRAINT `FK_account_liked` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`),
  CONSTRAINT `FK_weibo_liked` FOREIGN KEY (`wid`) REFERENCES `weibo` (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liked
-- ----------------------------
INSERT INTO `liked` VALUES ('2', '2', '2016-08-02 16:44:45');
INSERT INTO `liked` VALUES ('2', '4', '2016-08-02 16:44:44');
INSERT INTO `liked` VALUES ('2', '5', '2016-08-02 15:25:25');
INSERT INTO `liked` VALUES ('2', '6', '2016-08-05 15:49:31');
INSERT INTO `liked` VALUES ('2', '7', '2016-08-02 16:44:42');
INSERT INTO `liked` VALUES ('2', '8', '2016-08-05 16:02:30');
INSERT INTO `liked` VALUES ('2', '9', '2016-08-02 16:44:40');
INSERT INTO `liked` VALUES ('2', '10', '2016-08-02 16:44:37');
INSERT INTO `liked` VALUES ('2', '11', '2016-08-02 16:44:38');
INSERT INTO `liked` VALUES ('2', '13', '2016-08-05 15:49:24');
INSERT INTO `liked` VALUES ('2', '15', '2016-08-05 15:49:21');
INSERT INTO `liked` VALUES ('2', '50214', '2016-08-05 16:02:34');
INSERT INTO `liked` VALUES ('2', '50215', '2016-08-05 16:02:32');
INSERT INTO `liked` VALUES ('3', '1', '2016-08-05 15:49:53');
INSERT INTO `liked` VALUES ('3', '2', '2016-07-29 15:36:16');
INSERT INTO `liked` VALUES ('3', '3', '2016-08-05 15:50:06');
INSERT INTO `liked` VALUES ('3', '5', '2016-08-05 15:50:06');
INSERT INTO `liked` VALUES ('3', '6', '2016-08-05 15:49:58');
INSERT INTO `liked` VALUES ('3', '7', '2016-08-05 15:49:59');
INSERT INTO `liked` VALUES ('3', '8', '2016-08-05 15:49:56');
INSERT INTO `liked` VALUES ('3', '10', '2016-08-05 15:50:02');
INSERT INTO `liked` VALUES ('3', '12', '2016-08-05 15:50:03');
INSERT INTO `liked` VALUES ('3', '14', '2016-08-05 15:50:04');
INSERT INTO `liked` VALUES ('3', '50215', '2016-08-05 16:02:48');
INSERT INTO `liked` VALUES ('4', '10', '2016-08-05 16:04:46');
INSERT INTO `liked` VALUES ('4', '50214', '2016-08-05 16:04:42');
INSERT INTO `liked` VALUES ('4', '50215', '2016-08-05 16:03:18');
