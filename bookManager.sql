/*
SQLyog Enterprise - MySQL GUI v6.14
MySQL - 5.7.18 : Database - bookmanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `bookmanager`;

USE `bookmanager`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `deldoc` */

DROP TABLE IF EXISTS `deldoc`;

CREATE TABLE `deldoc` (
  `doc_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deldoc` */

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `stack` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `document` */

insert  into `document`(`doc_id`,`title`,`author`,`publisher`,`price`,`stack`,`count`) values (1,'三国演义','罗贯中','中国出版社',24,'文学书库',2),(2,'水浒传','施耐庵','中国出版社',18,'文学书库',4),(3,'C语言高级编程','谭浩强','清华大学出版社',30,'工科书库',5),(4,'软件工程','张海藩','人民邮电出版社',27,'工科书库',6),(5,'高等数学','同济大学数学系','高等教育出版社',26,'理医农书库',7),(6,'农学初步','钟崇高','山东科学技术出版社',20,'理医农书库',1),(7,'马克思主义基本原理概论(2013年修订版)','本书编写组','高等教育出版社',21,'社科书库',2),(8,'中国近现代史纲要(2013年修订版)','本书编写组','高等教育出版社',23,'社科书库',3);

/*Table structure for table `lend` */

DROP TABLE IF EXISTS `lend`;

CREATE TABLE `lend` (
  `lend_id` int(11) NOT NULL AUTO_INCREMENT,
  `patron_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `lendtime` date DEFAULT NULL,
  `duetime` date DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lend` */

insert  into `lend`(`lend_id`,`patron_id`,`doc_id`,`lendtime`,`duetime`,`operator_id`) values (1,1,1,'2017-06-21',NULL,NULL);

/*Table structure for table `lendhistory` */

DROP TABLE IF EXISTS `lendhistory`;

CREATE TABLE `lendhistory` (
  `lend_id` int(11) NOT NULL,
  `patron_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `lendtime` date DEFAULT NULL,
  `returntime` date DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `loperator_id` int(11) DEFAULT NULL,
  `roperator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lendhistory` */

/*Table structure for table `reader` */

DROP TABLE IF EXISTS `reader`;

CREATE TABLE `reader` (
  `patron_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `pwd` int(11) DEFAULT NULL,
  `id` char(18) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `itemcounts` int(11) DEFAULT NULL,
  PRIMARY KEY (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `reader` */

insert  into `reader`(`patron_id`,`name`,`gender`,`pwd`,`id`,`tel`,`itemcounts`) values (1,'张三',1,1001,'111111111111111111','18848962938',3),(2,'李四',0,1002,'111111111111111111','18848962938',3),(3,'王五',0,1003,'111111111111111111','18848962938',3),(4,'赵六',1,1004,'111111111111111111','18848962938',3);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `operator_id` int(11) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  PRIMARY KEY (`operator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

insert  into `staff`(`operator_id`,`pwd`,`name`,`tel`,`gender`) values (101,'101','周老师','15648975646',''),(102,'102','吴老师','15648975646',''),(103,'103','郑老师','15648975646','\0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
