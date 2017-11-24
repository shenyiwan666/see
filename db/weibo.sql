/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-24 16:21:06
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
  `imgname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wid`),
  KEY `FK_account_weibo` (`aid`),
  CONSTRAINT `FK_account_weibo` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=58997 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo
-- ----------------------------
INSERT INTO `weibo` VALUES ('1', '1', '大王叫我来巡山', '2016-07-29 15:32:10', 'iPhone 6s', '27', '0', null);
INSERT INTO `weibo` VALUES ('2', '2', '我是来揍张三的', '2016-07-29 15:32:59', 'weibo 网页', '3', '0', null);
INSERT INTO `weibo` VALUES ('3', '3', '天王盖地虎', '2016-07-29 15:33:56', '华为 P9', '1', '1', null);
INSERT INTO `weibo` VALUES ('4', '4', '我是马六，刚开通微博', '2016-07-29 15:49:03', 'weibo 网页', '1000', '6', null);
INSERT INTO `weibo` VALUES ('5', '1', 'test', '2016-08-02 10:50:24', 'weibo 网页', '9', '0', null);
INSERT INTO `weibo` VALUES ('6', '1', 'test2', '2016-08-02 08:53:47', 'weibo 网页', '4', '4', null);
INSERT INTO `weibo` VALUES ('7', '1', '测试set修改', '2016-08-02 16:06:55', 'iPhone 7 Plus', '3', '0', null);
INSERT INTO `weibo` VALUES ('8', '1', 'aad', '2016-08-02 16:08:05', 'weibo网页', '5', '0', null);
INSERT INTO `weibo` VALUES ('9', '1', '张三发微博', '2016-08-02 16:09:16', 'weibo网页', '1', '0', null);
INSERT INTO `weibo` VALUES ('10', '1', '张三发微博2', '2016-08-02 16:10:21', 'weibo网页', '5', '0', null);
INSERT INTO `weibo` VALUES ('11', '2', '李四发一条', '2016-08-02 16:12:26', 'weibo网页', '2', '0', null);
INSERT INTO `weibo` VALUES ('12', '1', 'VAOXHUGAOFMHVUUAVHTPKVBDSGKYXODDUUMGXKRFU GFRVWU', '2016-08-05 13:38:01', 'ZYIFWTCYUJKNSQRTYRMN', '170', '1', null);
INSERT INTO `weibo` VALUES ('13', '2', 'RVVHSXPSUERATJLHTUNTFSLCIBQNWPLPQ', '2016-08-05 13:38:01', 'YBOIBUTIDPGFS', '151', '0', null);
INSERT INTO `weibo` VALUES ('14', '3', 'TPFJDDHMYXRYEBWYKIWYRMLUIKJCPFPMPLOOPQNDCHXNZ NHN QM', '2016-08-05 13:38:01', 'ITXPHFQXSSWYCAYWQBK', '120', '0', null);
INSERT INTO `weibo` VALUES ('15', '4', 'XYJXAGJJOPAZ', '2016-08-05 13:38:01', 'MMSLNLGQXJAGHLATQW', '102', '1', null);
INSERT INTO `weibo` VALUES ('36232', '1', 'hahahahah', '2017-11-17 10:03:52', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('36560', '1', 'keyila', '2017-11-17 10:09:20', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('36786', '1', '666666', '2017-11-17 10:13:06', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('40032', '1', '4234324', '2017-11-21 11:07:12', null, '0', '1', null);
INSERT INTO `weibo` VALUES ('40036', '1', '55555555555', '2017-11-21 11:07:16', null, '0', '51', null);
INSERT INTO `weibo` VALUES ('40714', '1', '5555555555555555', '2017-11-17 11:18:34', null, '2', '0', null);
INSERT INTO `weibo` VALUES ('42057', '1', '777777777', '2017-11-20 11:40:57', null, '1', '0', null);
INSERT INTO `weibo` VALUES ('42205', '1', '66666666', '2017-11-20 11:43:25', null, '0', '2', null);
INSERT INTO `weibo` VALUES ('42533', '1', '121212', '2017-11-20 11:48:53', null, '1', '1', null);
INSERT INTO `weibo` VALUES ('50212', '3', 's', '2016-08-05 15:50:52', 'weibo网页', '0', '0', null);
INSERT INTO `weibo` VALUES ('50213', '3', 'gfgfg', '2016-08-05 15:53:53', 'weibo网页', '0', '0', null);
INSERT INTO `weibo` VALUES ('50214', '1', 'sdf', '2016-08-05 15:57:47', 'weibo网页', '4', '0', null);
INSERT INTO `weibo` VALUES ('50215', '1', 'sdfsdfd', '2016-10-25 08:00:50', 'weibo网页', '4', '10', null);
INSERT INTO `weibo` VALUES ('50216', '1', '发微博测试', '2017-01-05 10:41:12', 'weibo网页', '1', '0', null);
INSERT INTO `weibo` VALUES ('50218', '1', '发微博测试', '2017-01-05 11:03:22', 'weibo网页', '6', '0', null);
INSERT INTO `weibo` VALUES ('50220', '1', '发微博测试', '2017-01-05 11:04:55', 'weibo网页', '0', '0', null);
INSERT INTO `weibo` VALUES ('50221', '1', '这是发微薄测试', '2017-01-16 16:19:23', '网页', '11', '0', null);
INSERT INTO `weibo` VALUES ('50222', '1', 'ç»äºå¿«ç»æäº', '2017-01-18 09:52:27', '网页', '6', '0', null);
INSERT INTO `weibo` VALUES ('50223', '1', '我还来', '2017-01-18 09:54:07', '网页', '7', '0', null);
INSERT INTO `weibo` VALUES ('50224', '1', 'asdfasdfasdfasdfasfdasdfasfdasdfasdfasdfasdf', '2017-01-18 10:13:24', '网页', '0', '0', null);
INSERT INTO `weibo` VALUES ('50225', '1', 'dsfsdfsdf', '2017-01-18 10:21:34', '网页', '0', '1', null);
INSERT INTO `weibo` VALUES ('50226', '1', 'sdfasdfadfassssssssssssssssssss', '2017-01-18 13:53:30', '网页', '7', '0', null);
INSERT INTO `weibo` VALUES ('50227', '1', '发一条中文', '2017-01-18 13:53:38', '网页', '7', '0', null);
INSERT INTO `weibo` VALUES ('52313', '1', '31321312', '2017-11-20 14:31:53', null, '0', '2', null);
INSERT INTO `weibo` VALUES ('53076', '1', 'tsst', '2017-11-20 14:44:36', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('53081', '1', '666666666', '2017-11-20 14:44:41', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('56816', '1', '66546456', '2017-11-24 15:46:56', null, '0', '0', 'a48a6927-3e83-4f8c-ba2e-23513055bfb0u=1822899106,40471411&fm=27&gp=0.jpg');
INSERT INTO `weibo` VALUES ('57974', '1', '发一个', '2017-11-24 16:06:14', null, '0', '0', 'ecf766fc-274b-4dea-b3d2-de00d4480857');
INSERT INTO `weibo` VALUES ('58979', '1', '534252345', '2017-11-20 16:22:59', null, '0', '2', null);
INSERT INTO `weibo` VALUES ('58981', '1', '45566756', '2017-11-20 16:23:01', null, '1', '0', null);
INSERT INTO `weibo` VALUES ('58982', '1', '35345232', '2017-11-20 16:23:02', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('58984', '1', '453452', '2017-11-20 16:23:04', null, '0', '0', null);
INSERT INTO `weibo` VALUES ('58985', '1', '随便', '2017-11-24 14:53:08', null, '20000', null, null);
INSERT INTO `weibo` VALUES ('58986', '4', 'fwaf', '2017-11-15 14:53:12', null, '1500', null, null);
INSERT INTO `weibo` VALUES ('58987', '3', '哈哈哈哈哈', '2017-11-06 14:53:17', null, '6000', null, null);
INSERT INTO `weibo` VALUES ('58989', '68', '2424', '2017-11-10 14:53:20', null, '100', null, null);
INSERT INTO `weibo` VALUES ('58990', '68', '42424', '2017-11-24 14:53:26', null, '150', null, null);
INSERT INTO `weibo` VALUES ('58991', '102', 'xixixi', '2017-11-20 14:53:30', null, '4000', null, null);
INSERT INTO `weibo` VALUES ('58992', '114', '6666', '2017-11-10 14:53:35', null, '7000', null, null);
INSERT INTO `weibo` VALUES ('58993', '138', '9999', '2017-11-01 14:53:40', null, '250', null, null);
INSERT INTO `weibo` VALUES ('58994', '138', '6969', '2017-11-14 14:53:44', null, '273', null, null);
INSERT INTO `weibo` VALUES ('58995', '38431', 'yingyingying', '2017-11-24 14:53:47', null, '7104', '0', null);
INSERT INTO `weibo` VALUES ('58996', '153', 'testtset', '2017-11-20 14:53:50', null, '5200', null, null);
