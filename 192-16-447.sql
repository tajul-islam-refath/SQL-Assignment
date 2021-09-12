/*
MySQL Data Transfer
Source Host: localhost
Source Database: fantasticgardens
Target Host: localhost
Target Database: fantasticgardens
Date: 4/16/2021 8:45:56 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for coustomer
-- ----------------------------
DROP TABLE IF EXISTS `coustomer`;
CREATE TABLE `coustomer` (
  `coustomer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `coustomerName` varchar(50) NOT NULL,
  `coustomerAddress` varchar(100) NOT NULL,
  `coustomerPhone` int(12) NOT NULL,
  PRIMARY KEY (`coustomer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `product_Id` int(6) NOT NULL,
  `order_Id` int(100) NOT NULL,
  `orderProduct_Id` int(100) NOT NULL AUTO_INCREMENT,
  `quantity` int(4) DEFAULT NULL,
  PRIMARY KEY (`orderProduct_Id`),
  KEY `product_Id` (`product_Id`),
  KEY `order_Id` (`order_Id`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`product_Id`) REFERENCES `product` (`product_Id`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`order_Id`) REFERENCES `orders` (`order_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_Id` int(100) NOT NULL AUTO_INCREMENT,
  `coustomer_Id` int(11) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `dalivaryDate` date DEFAULT NULL,
  `totalProduct` int(4) NOT NULL,
  `discount` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  PRIMARY KEY (`order_Id`),
  KEY `coustomer_Id` (`coustomer_Id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`coustomer_Id`) REFERENCES `coustomer` (`coustomer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_Id` int(6) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `unitPrice` float DEFAULT NULL,
  PRIMARY KEY (`product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `service_Id` int(4) NOT NULL,
  `serviceName` varchar(100) DEFAULT NULL,
  `order_Id` int(100) DEFAULT NULL,
  `staf_Id` int(4) DEFAULT NULL,
  PRIMARY KEY (`service_Id`),
  KEY `order_Id` (`order_Id`),
  KEY `staf_Id` (`staf_Id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `orders` (`order_Id`),
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`staf_Id`) REFERENCES `staf` (`staf_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for staf
-- ----------------------------
DROP TABLE IF EXISTS `staf`;
CREATE TABLE `staf` (
  `staf_Id` int(4) NOT NULL AUTO_INCREMENT,
  `stafName` varchar(50) NOT NULL,
  `stafPhone` int(12) NOT NULL,
  PRIMARY KEY (`staf_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `coustomer` VALUES ('1', 'Jhon Herring', 'city:Dhaka,area:Dhanmondi', '1912345678');
INSERT INTO `coustomer` VALUES ('2', 'Cary Robinson', 'city:Dhaka,area:Dhanmondi', '1912345678');
INSERT INTO `coustomer` VALUES ('3', 'Willy Wonka', 'city:Dhaka,area:Mirpur', '1912345678');
INSERT INTO `orderproduct` VALUES ('102', '33', '501', '1');
INSERT INTO `orderproduct` VALUES ('101', '33', '502', '1');
INSERT INTO `orderproduct` VALUES ('101', '76', '503', '1');
INSERT INTO `orderproduct` VALUES ('102', '11', '504', '1');
INSERT INTO `orders` VALUES ('11', '3', '2021-03-12', '2021-04-29', '1', '0', '30000');
INSERT INTO `orders` VALUES ('33', '1', '2021-04-12', '2021-04-29', '2', '0', '50000');
INSERT INTO `orders` VALUES ('76', '2', '2021-05-12', '2021-06-29', '1', '0', '20000');
INSERT INTO `product` VALUES ('101', 'Shed', '20000');
INSERT INTO `product` VALUES ('102', 'Green House', '30000');
INSERT INTO `services` VALUES ('201', 'Delivery', '33', '21');
INSERT INTO `services` VALUES ('202', 'Shed Construction', '33', '22');
INSERT INTO `services` VALUES ('203', 'Green House Construction', '33', '22');
INSERT INTO `services` VALUES ('204', 'Delivery', '76', '23');
INSERT INTO `services` VALUES ('205', 'Delivery', '11', '23');
INSERT INTO `services` VALUES ('206', 'Shed Construction', '11', '21');
INSERT INTO `staf` VALUES ('21', 'Ben Roberts', '987456321');
INSERT INTO `staf` VALUES ('22', 'Gary Crowley', '987456322');
INSERT INTO `staf` VALUES ('23', 'Anita Magneson', '987456324');
