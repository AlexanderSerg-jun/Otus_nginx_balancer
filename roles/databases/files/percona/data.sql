/*
Database - data
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`data` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `data`;

/*Table structure for table `net_list` */

DROP TABLE IF EXISTS `net_list`;

CREATE TABLE `net_list` (
  `address` varchar(20) DEFAULT NULL,
  `id` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `net_list` */

insert  into `net_list`(`address`,`id`) values 
('192.168.250.0','1'),
('192.168.251.0','2'),
('192.168.239.0','17'),
('192.168.252.0','3'),
('192.168.253.0','4'),
('192.168.254.0','5'),
('192.168.220.0','6'),
('192.168.246.0','7'),
('192.168.248.0','8'),
('192.168.142.0','9'),
('192.168.242.0','10'),
('192.168.221.0','11'),
('192.168.223.0','12'),
('192.168.124.0','14'),
('192.168.244.0','15'),
('192.168.147.0','16'),
('192.168.104.0','18'),
('192.168.103.0','19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
