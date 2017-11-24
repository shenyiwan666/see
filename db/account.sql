/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-11-24 16:20:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `aid` int(5) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `follow` int(11) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `weibo` int(11) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `acccount_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=58803 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', 'hehe', '1', '2', '500', '17', '3503d397-0e7a-45ed-8331-34a2a0c044de');
INSERT INTO `account` VALUES ('2', 'K', 'xi', 'k', '0', '0', null, null);
INSERT INTO `account` VALUES ('3', 'fefewa', '张三', '312312', '0', '400', '2', null);
INSERT INTO `account` VALUES ('4', 'maliu@gmail.com', '马六', '1234567', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('68', 'HLRGDSTWREXDDJ', '哈啊哈', 'OVMGSDTPOMI', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('73', 'MOHMULVMLHXNNPONME', 'SJWDUMGVILCBKGS三', 'RCCYZJPHLV', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('81', 'GLNNBLRIGGUN', 'CMZUMKPNTXNJWULTUQP', 'KYDFJLC', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('83', 'TFLTJUJNGUT', 'OFQWTWUYOQIWSVXPCH', 'TCJSVOTONMGINRDV', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('86', 'JBSQIJFVJQDXISO', 'COGGILQUFWKJJBVDPCT', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('90', 'QVXIALRXQBMTG', 'IIZXJBKYWVWPV', 'YBHLKSOJTOF', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('91', 'TVQFJCJETOCWP', 'XIIBOULMVRGPWV', 'KJCEPMVMOUX', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('94', 'QJFJJDFT', 'FDNKFUY三', 'ZKSVAJWLBTBCCNM', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('95', 'UGNFTGSSBEBYDWEIVJ', 'GMEWCFP三', 'LNICXERLEX', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('96', 'DIGCFGVCIDXQSNBUY', 'KFQXENVJLDEKSGQ三', 'HZYZFRBXAVCLMPU', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('97', 'DOIIOIXFJF', 'HZEWQOPMIOOXIGFMD', 'MJPPMPDEQN', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('98', 'RZPMXEIQYSZU', 'BRXEVOINVTLYZTI六', 'SXDHGNSCH', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('99', 'KGBVYZFJBMPVMFHMV', 'VZQGP三', 'JYAPSBVH', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('102', 'aaaaaa@gmail.com', '张张张张张三三三三', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('104', 'abcdefgh2@gmail.com', '张张张张张2三三三三', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('106', 'z@163.com', 'zs', null, null, null, null, null);
INSERT INTO `account` VALUES ('107', 'hibernate333333333@163.com', 'hibernate', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('108', '1@163.com', '1', 'a|b|c|d', null, null, null, null);
INSERT INTO `account` VALUES ('109', '2@163.com', '2', null, null, null, null, null);
INSERT INTO `account` VALUES ('110', '3@163.com', '3', null, null, null, null, null);
INSERT INTO `account` VALUES ('111', '4@163.com', '4', null, null, null, null, null);
INSERT INTO `account` VALUES ('114', 'syw@abc.com', '这是修改测试昵称', '654321', '0', '0', '0', '2.jpg');
INSERT INTO `account` VALUES ('116', 'adfasdf345@123.com', '大王345', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('118', 'hibernate2@hibernate.org', 'hibernate', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('119', 'hibernate@163.com', 'hibernate', '123456', '0', '0', '0', '1.jpg');
INSERT INTO `account` VALUES ('120', 'adfsadf@163.com', '13800138000', '123456', '0', '0', '0', 'Chrysanthemum.jpg');
INSERT INTO `account` VALUES ('126', 'aaaaaaaaaaaaaaaaa@qq.com', 'aaaaaaaaaaaaaaa', null, null, null, null, 'abc.jpg');
INSERT INTO `account` VALUES ('130', 'ccccccccccccccccc@gmail.com', 'cccccc', 'ccccc', null, null, null, null);
INSERT INTO `account` VALUES ('135', '123', '123', '123', null, null, null, null);
INSERT INTO `account` VALUES ('137', '12121212', 'emmmmmm', '0000', null, null, null, null);
INSERT INTO `account` VALUES ('138', 'hahahha', '李大爷', 'emmmmm', null, null, null, null);
INSERT INTO `account` VALUES ('147', '张三', '456你好', '123456', null, null, null, null);
INSERT INTO `account` VALUES ('148', 'zhangsan@163.com', '张三', '123456', null, null, null, '4.jpg');
INSERT INTO `account` VALUES ('151', 'abcdefghijklmn@abc.com', '这是测试昵称', '654321', null, null, null, '2.jpg');
INSERT INTO `account` VALUES ('153', 'sywweiyi@abc.com', '这是添加测试昵称', '654321', null, null, null, '2.jpg');
INSERT INTO `account` VALUES ('38431', 'shenyiwan@163.com', 'shenyiwan', '123456', null, null, null, null);
INSERT INTO `account` VALUES ('40583', '1312', '3123', '3123', null, null, null, '418be2a4-04a4-4887-8085-809321246cbe123.jpg');
INSERT INTO `account` VALUES ('58802', '111', '123', '3123', null, null, null, '786428bc-3c5e-41a8-93a8-75d9107310ea');
