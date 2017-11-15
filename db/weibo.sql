/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-15 14:41:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for weibo
-- ----------------------------
DROP TABLE IF EXISTS `weibo`;
CREATE TABLE `weibo` (
  `wid` int(5) NOT NULL AUTO_INCREMENT,
  `aid` int(5) DEFAULT NULL,
  `wcontent` varchar(140) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `service` varchar(100) DEFAULT NULL,
  `liked` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`wid`),
  KEY `FK_account_weibo` (`aid`),
  CONSTRAINT `FK_account_weibo` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=50228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo
-- ----------------------------
INSERT INTO `weibo` VALUES ('1', '1', '大王叫我来巡山', '2016-07-29 15:32:10', 'iPhone 6s', '2', '0');
INSERT INTO `weibo` VALUES ('2', '2', '我是来揍张三的', '2016-07-29 15:32:59', 'weibo 网页', '2', '0');
INSERT INTO `weibo` VALUES ('3', '3', '天王盖地虎', '2016-07-29 15:33:56', '华为 P9', '1', '1');
INSERT INTO `weibo` VALUES ('4', '4', '我是马六，刚开通微博', '2016-07-29 15:49:03', 'weibo 网页', '1', '0');
INSERT INTO `weibo` VALUES ('5', '1', 'test', '2016-08-02 10:50:24', 'weibo 网页', '3', '0');
INSERT INTO `weibo` VALUES ('6', '1', 'test2', '2016-08-02 08:53:47', 'weibo 网页', '3', '0');
INSERT INTO `weibo` VALUES ('7', '1', '测试set修改', '2016-08-02 16:06:55', 'iPhone 7 Plus', '2', '0');
INSERT INTO `weibo` VALUES ('8', '1', 'aad', '2016-08-02 16:08:05', 'weibo网页', '3', '0');
INSERT INTO `weibo` VALUES ('9', '1', '张三发微博', '2016-08-02 16:09:16', 'weibo网页', '1', '0');
INSERT INTO `weibo` VALUES ('10', '1', '张三发微博2', '2016-08-02 16:10:21', 'weibo网页', '4', '0');
INSERT INTO `weibo` VALUES ('11', '2', '李四发一条', '2016-08-02 16:12:26', 'weibo网页', '1', '0');
INSERT INTO `weibo` VALUES ('12', '1', 'VAOXHUGAOFMHVUUAVHTPKVBDSGKYXODDUUMGXKRFU GFRVWU', '2016-08-05 13:38:01', 'ZYIFWTCYUJKNSQRTYRMN', '1', '0');
INSERT INTO `weibo` VALUES ('13', '2', 'RVVHSXPSUERATJLHTUNTFSLCIBQNWPLPQ', '2016-08-05 13:38:01', 'YBOIBUTIDPGFS', '1', '0');
INSERT INTO `weibo` VALUES ('14', '3', 'TPFJDDHMYXRYEBWYKIWYRMLUIKJCPFPMPLOOPQNDCHXNZ NHN QM', '2016-08-05 13:38:01', 'ITXPHFQXSSWYCAYWQBK', '1', '0');
INSERT INTO `weibo` VALUES ('15', '4', 'XYJXAGJJOPAZ', '2016-08-05 13:38:01', 'MMSLNLGQXJAGHLATQW', '1', '0');
INSERT INTO `weibo` VALUES ('50212', '3', 's', '2016-08-05 15:50:52', 'weibo网页', '0', '0');
INSERT INTO `weibo` VALUES ('50213', '3', 'gfgfg', '2016-08-05 15:53:53', 'weibo网页', '0', '0');
INSERT INTO `weibo` VALUES ('50214', '1', 'sdf', '2016-08-05 15:57:47', 'weibo网页', '3', '0');
INSERT INTO `weibo` VALUES ('50215', '1', 'sdfsdfd', '2016-10-25 08:00:50', 'weibo网页', '4', '10');
INSERT INTO `weibo` VALUES ('50216', '1', '发微博测试', '2017-01-05 10:41:12', 'weibo网页', '0', '0');
INSERT INTO `weibo` VALUES ('50218', '1', '发微博测试', '2017-01-05 11:03:22', 'weibo网页', '0', '0');
INSERT INTO `weibo` VALUES ('50220', '1', '发微博测试', '2017-01-05 11:04:55', 'weibo网页', '0', '0');
INSERT INTO `weibo` VALUES ('50221', '1', '这是发微薄测试', '2017-01-16 16:19:23', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50222', '1', 'ç»äºå¿«ç»æäº', '2017-01-18 09:52:27', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50223', '1', '我还来', '2017-01-18 09:54:07', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50224', '1', 'asdfasdfasdfasdfasfdasdfasfdasdfasdfasdfasdf', '2017-01-18 10:13:24', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50225', '1', 'dsfsdfsdf', '2017-01-18 10:21:34', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50226', '1', 'sdfasdfadfassssssssssssssssssss', '2017-01-18 13:53:30', '网页', '0', '0');
INSERT INTO `weibo` VALUES ('50227', '1', '发一条中文', '2017-01-18 13:53:38', '网页', '0', '0');
