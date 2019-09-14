/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - slim_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`slim_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `slim_db`;

/*Table structure for table `backup_log` */

DROP TABLE IF EXISTS `backup_log`;

CREATE TABLE `backup_log` (
  `backup_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `backup_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `backup_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`backup_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `backup_log` */

/*Table structure for table `biblio` */

DROP TABLE IF EXISTS `biblio`;

CREATE TABLE `biblio` (
  `biblio_id` int(11) NOT NULL AUTO_INCREMENT,
  `gmd_id` int(3) DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `sor` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn_issn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `publish_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `series_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_id` char(5) COLLATE utf8_unicode_ci DEFAULT 'en',
  `source` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_place_id` int(11) DEFAULT NULL,
  `classification` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_att` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opac_hide` smallint(1) DEFAULT '0',
  `promoted` smallint(1) DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `frequency_id` int(11) NOT NULL DEFAULT '0',
  `spec_detail_info` text COLLATE utf8_unicode_ci,
  `content_type_id` int(11) DEFAULT NULL,
  `media_type_id` int(11) DEFAULT NULL,
  `carrier_type_id` int(11) DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`biblio_id`),
  KEY `references_idx` (`gmd_id`,`publisher_id`,`language_id`,`publish_place_id`),
  KEY `classification` (`classification`),
  KEY `biblio_flag_idx` (`opac_hide`,`promoted`),
  KEY `rda_idx` (`content_type_id`,`media_type_id`,`carrier_type_id`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `title_ft_idx` (`title`,`series_title`),
  FULLTEXT KEY `notes_ft_idx` (`notes`),
  FULLTEXT KEY `labels` (`labels`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `biblio` */

insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (1,1,'PHP 5 for dummies',NULL,NULL,'0764541668',1,'2004','xiv, 392 p. : ill. ; 24 cm.','For dummies','005.13/3-22 Jan p','en',NULL,1,'005.13/3 22',NULL,'php5_dummies.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 15:36:50','2007-11-29 16:26:59',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (2,1,'Linux In a Nutshell',NULL,'Fifth Edition','9780596009304',2,'2005','xiv, 925 p. : ill. ; 23 cm.','In a Nutshell','005.4/32-22 Ell l','en',NULL,2,'005.4/32 22',NULL,'linux_in_a_nutshell.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 15:53:35','2007-11-29 16:26:10',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (3,1,'The Definitive Guide to MySQL 5',NULL,NULL,'9781590595350',3,'2005','784p.','Definitive Guide Series','005.75/85-22 Kof d','en',NULL,NULL,'005.75/85 22',NULL,'mysql_def_guide.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:01:08','2007-11-29 16:26:33',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (4,1,'Cathedral and the Bazaar: Musings on Linux and Open Source by an Accidental Revolutionary',NULL,NULL,'0-596-00108-8',2,'2001','208p.',NULL,'005.4/3222 Ray c','en',NULL,2,'005.4/32 22','The Cathedral & the Bazaar is a must for anyone who cares about the future of the computer industry or the dynamics of the information economy. This revised and expanded paperback edition includes new material on open source developments in 1999 and 2000. Raymond\'s clear and effective writing style accurately describing the benefits of open source software has been key to its success. (Source: http://safari.oreilly.com/0596001088)','cathedral_bazaar.jpg','cathedral-bazaar.pdf',1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:14:44','2007-11-29 16:25:43',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (5,1,'Producing open source software : how to run a successful free software project',NULL,'1st ed.','9780596007591',2,'2005','xx, 279 p. ; 24 cm.',NULL,'005.1-22 Fog p','en',NULL,2,'005.1 22','Includes index.','producing_oss.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:20:45','2007-11-29 16:31:21',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (6,1,'PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases','','1st ed.','0735712573',4,'2003','xvii, 790 p. : ill. ; 23cm.','DeveloperÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢s library','005.75/85-22 Kor p','en',NULL,3,'005.75/85 22','PostgreSQL is the world\'s most advanced open-source database. PostgreSQL is the most comprehensive, in-depth, and easy-to-read guide to this award-winning database. This book starts with a thorough overview of SQL, a description of all PostgreSQL data types, and a complete explanation of PostgreSQL commands.','postgresql.jpg',NULL,1,1,NULL,0,'',NULL,NULL,NULL,'2007-11-29 16:29:33','2019-06-03 14:19:29',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (7,1,'Web application architecture : principles, protocols, and practices',NULL,NULL,'0471486566',5,'2003','xi, 357 p. : ill. ; 23 cm.',NULL,'005.7/2-21 Leo w','en',NULL,1,'005.7/2 21','An in-depth examination of the core concepts and general principles of Web application development.\r\nThis book uses examples from specific technologies (e.g., servlet API or XSL), without promoting or endorsing particular platforms or APIs. Such knowledge is critical when designing and debugging complex systems. This conceptual understanding makes it easier to learn new APIs that arise in the rapidly changing Internet environment.','webapp_arch.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:41:57','2007-11-29 16:32:46',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (8,1,'Ajax : creating Web pages with asynchronous JavaScript and XML',NULL,NULL,'9780132272674',6,'2007','xxii, 384 p. : ill. ; 24 cm.','Bruce PerensÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ Open Source series','006.7/86-22 Woy a','en',NULL,4,'006.7/86 22','Using Ajax, you can build Web applications with the sophistication and usability of traditional desktop applications and you can do it using standards and open source software. Now, for the first time, there\'s an easy, example-driven guide to Ajax for every Web and open source developer, regardless of experience.','ajax.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:47:20','2019-06-03 15:13:37',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (9,1,'The organization of information',NULL,'2nd ed.','1563089769',7,'2004','xxvii, 417 p. : ill. ; 27 cm.','Library and information science text series','025-22 Tay o','en',NULL,5,'025 22','A basic textbook for students of library and information studies, and a guide for practicing school library media specialists. Describes the impact of global forces and the school district on the development and operation of a media center, the technical and human side of management, programmatic activities, supportive services to students, and the quality and quantity of resources available to support programs.','organization_information.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:54:12','2007-11-29 16:27:20',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (10,1,'Library and Information Center Management',NULL,'7th ed.','9781591584063',7,'2007','xxviii, 492 p. : ill. ; 27 cm.','Library and information science text series','025.1-22 Stu l','en',NULL,5,'025.1 22',NULL,'library_info_center.JPG',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 16:58:51','2007-11-29 16:27:40',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (11,1,'Information Architecture for the World Wide Web: Designing Large-Scale Web Sites',NULL,'2nd ed.','9780596000356',2,'2002','500p.',NULL,'006.7-22 Mor i','en',NULL,6,'006.7 22','Information Architecture for the World Wide Web is about applying the principles of architecture and library science to web site design. Each website is like a public building, available for tourists and regulars alike to breeze through at their leisure. The job of the architect is to set up the framework for the site to make it comfortable and inviting for people to visit, relax in, and perhaps even return to someday.','information_arch.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 17:26:14','2007-11-29 16:32:25',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (12,1,'Corruption and development',NULL,NULL,'9780714649023',8,'1998','166 p. : ill. ; 22 cm.',NULL,'364.1 Rob c','en',NULL,7,'364.1/322/091724 21','The articles assembled in this volume offer a fresh approach to analysing the problem of corruption in developing countries and the k means to tackle the phenomenon.','corruption_development.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 17:45:30','2007-11-29 16:20:53',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (13,1,'Corruption and development : the anti-corruption campaigns',NULL,NULL,'0230525504',9,'2007','310p.',NULL,'364.1 Bra c','en',NULL,8,'364.1/323091724 22','This book provides a multidisciplinary interrogation of the global anti-corruption campaigns of the last ten years, arguing that while some positive change is observable, the period is also replete with perverse consequences and unintended outcomes','corruption_development_anti_campaign.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 17:49:49','2007-11-29 16:19:48',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (14,1,'Pigs at the trough : how corporate greed and political corruption are undermining America',NULL,NULL,'1400047714',10,'2003','275 p. ; 22 cm.',NULL,'364.1323 Huf p','en',NULL,8,'364.1323',NULL,'pigs_at_trough.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 17:56:00','2007-11-29 16:18:33',NULL);
insert  into `biblio`(`biblio_id`,`gmd_id`,`title`,`sor`,`edition`,`isbn_issn`,`publisher_id`,`publish_year`,`collation`,`series_title`,`call_number`,`language_id`,`source`,`publish_place_id`,`classification`,`notes`,`image`,`file_att`,`opac_hide`,`promoted`,`labels`,`frequency_id`,`spec_detail_info`,`content_type_id`,`media_type_id`,`carrier_type_id`,`input_date`,`last_update`,`uid`) values (15,1,'Lords of poverty : the power, prestige, and corruption of the international aid business',NULL,NULL,'9780871134691',11,'1994','xvi, 234 p. ; 22 cm.',NULL,'338.9 Han l','en',NULL,8,'338.9/1/091724 20','Lords of Poverty is a case study in betrayals of a public trust. The shortcomings of aid are numerous, and serious enough to raise questions about the viability of the practice at its most fundamental levels. Hancocks report is thorough, deeply shocking, and certain to cause critical reevaluation of the governments motives in giving foreign aid, and of the true needs of our intended beneficiaries.','lords_of_poverty.jpg',NULL,1,1,NULL,0,NULL,NULL,NULL,NULL,'2007-11-29 18:08:13','2007-11-29 16:13:11',NULL);

/*Table structure for table `biblio_attachment` */

DROP TABLE IF EXISTS `biblio_attachment`;

CREATE TABLE `biblio_attachment` (
  `biblio_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `access_type` enum('public','private') COLLATE utf8_unicode_ci NOT NULL,
  `access_limit` text COLLATE utf8_unicode_ci,
  KEY `biblio_id` (`biblio_id`),
  KEY `file_id` (`file_id`),
  KEY `biblio_id_2` (`biblio_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `biblio_attachment` */

/*Table structure for table `biblio_author` */

DROP TABLE IF EXISTS `biblio_author`;

CREATE TABLE `biblio_author` (
  `biblio_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `level` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `biblio_author` */

insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (1,1,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (2,2,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (2,3,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (2,4,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (2,5,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (2,6,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (3,7,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (3,8,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (4,9,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (5,10,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (6,11,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (6,12,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (7,13,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (7,14,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (8,15,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (9,16,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (10,17,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (10,18,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (11,19,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (11,20,2);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (12,21,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (13,22,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (14,23,1);
insert  into `biblio_author`(`biblio_id`,`author_id`,`level`) values (15,24,1);

/*Table structure for table `biblio_custom` */

DROP TABLE IF EXISTS `biblio_custom`;

CREATE TABLE `biblio_custom` (
  `biblio_id` int(11) NOT NULL,
  PRIMARY KEY (`biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one to one relation with real biblio table';

/*Data for the table `biblio_custom` */

/*Table structure for table `biblio_log` */

DROP TABLE IF EXISTS `biblio_log`;

CREATE TABLE `biblio_log` (
  `biblio_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `affectedrow` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rawdata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`biblio_log_id`),
  KEY `realname` (`realname`),
  KEY `biblio_id` (`biblio_id`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `action` (`action`),
  KEY `affectedrow` (`affectedrow`),
  KEY `date` (`date`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `rawdata` (`rawdata`),
  FULLTEXT KEY `additional_information` (`additional_information`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `biblio_log` */

insert  into `biblio_log`(`biblio_log_id`,`biblio_id`,`user_id`,`realname`,`title`,`ip`,`action`,`affectedrow`,`rawdata`,`additional_information`,`date`) values (1,6,1,'Admin','PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases','::1','update','description','a%3A1%3A%7Bi%3A0%3Ba%3A32%3A%7Bs%3A9%3A%22biblio_id%22%3Bs%3A1%3A%226%22%3Bs%3A5%3A%22title%22%3Bs%3A99%3A%22PostgreSQL+%3A+a+comprehensive+guide+to+building%2C+programming%2C+and+administering+PostgreSQL+databases%22%3Bs%3A8%3A%22gmd_name%22%3Bs%3A4%3A%22Text%22%3Bs%3A3%3A%22sor%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22edition%22%3Bs%3A7%3A%221st+ed.%22%3Bs%3A9%3A%22isbn_issn%22%3Bs%3A10%3A%220735712573%22%3Bs%3A14%3A%22publisher_name%22%3Bs%3A4%3A%22Sams%22%3Bs%3A12%3A%22publish_year%22%3Bs%3A4%3A%222003%22%3Bs%3A9%3A%22collation%22%3Bs%3A27%3A%22xvii%2C+790+p.+%3A+ill.+%3B+23cm.%22%3Bs%3A12%3A%22series_title%22%3Bs%3A56%3A%22Developer%C3%83%C6%92%C3%82%C2%A2%C3%83%C2%A2%C3%A2%E2%82%AC%C5%A1%C3%82%C2%AC%C3%83%C2%A2%C3%A2%E2%82%AC%C5%BE%C3%82%C2%A2s+library%22%3Bs%3A11%3A%22call_number%22%3Bs%3A18%3A%22005.75%2F85-22+Kor+p%22%3Bs%3A13%3A%22language_name%22%3Bs%3A7%3A%22English%22%3Bs%3A6%3A%22source%22%3BN%3Bs%3A11%3A%22place_place%22%3Bs%3A12%3A%22Indianapolis%22%3Bs%3A14%3A%22classification%22%3Bs%3A12%3A%22005.75%2F85+22%22%3Bs%3A5%3A%22notes%22%3Bs%3A309%3A%22PostgreSQL+is+the+world%27s+most+advanced+open-source+database.+PostgreSQL+is+the+most+comprehensive%2C+in-depth%2C+and+easy-to-read+guide+to+this+award-winning+database.+This+book+starts+with+a+thorough+overview+of+SQL%2C+a+description+of+all+PostgreSQL+data+types%2C+and+a+complete+explanation+of+PostgreSQL+commands.%22%3Bs%3A5%3A%22image%22%3Bs%3A14%3A%22postgresql.jpg%22%3Bs%3A9%3A%22opac_hide%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22promoted%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22labels%22%3BN%3Bs%3A9%3A%22frequency%22%3BN%3Bs%3A16%3A%22spec_detail_info%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22content_type%22%3BN%3Bs%3A10%3A%22media_type%22%3BN%3Bs%3A12%3A%22carrier_type%22%3BN%3Bs%3A3%3A%22uid%22%3BN%3Bs%3A7%3A%22authors%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Korry%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Susan%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7D%7Ds%3A8%3A%22subjects%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A11%3A%22Programming%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A5%3A%22RDBMS%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7D%7Ds%3A5%3A%22items%22%3Ba%3A1%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A9%3A%22item_code%22%3Bs%3A6%3A%22B00002%22%3Bs%3A14%3A%22inventory_code%22%3Bs%3A10%3A%22INV%2FB00002%22%3B%7D%7Ds%3A4%3A%22hash%22%3Ba%3A5%3A%7Bs%3A6%3A%22biblio%22%3Bs%3A40%3A%22c472425631ced4214dc105f6f6d5d18d30809a55%22%3Bs%3A14%3A%22classification%22%3Bs%3A40%3A%22563ecd3169619ca48558f42ce90ee17fd71584c2%22%3Bs%3A7%3A%22authors%22%3Bs%3A40%3A%2293a51f37886e718b2c38efdd2b2c878b0f03ba7c%22%3Bs%3A8%3A%22subjects%22%3Bs%3A40%3A%222131f8a8f0fd59235b66d12b0aac2fa1d7cddadc%22%3Bs%3A5%3A%22image%22%3Bs%3A40%3A%22f23419a21e9f33280a31f8d28b2a5245346a89ca%22%3B%7Ds%3A10%3A%22input_date%22%3Bs%3A19%3A%222007-11-29+16%3A29%3A33%22%3Bs%3A11%3A%22last_update%22%3Bs%3A19%3A%222019-06-03+14%3A18%3A19%22%3B%7D%7D','Updated data. Bibliography.','2019-06-03 14:18:19');
insert  into `biblio_log`(`biblio_log_id`,`biblio_id`,`user_id`,`realname`,`title`,`ip`,`action`,`affectedrow`,`rawdata`,`additional_information`,`date`) values (2,6,1,'Admin','PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases','::1','update','description','a%3A1%3A%7Bi%3A0%3Ba%3A32%3A%7Bs%3A9%3A%22biblio_id%22%3Bs%3A1%3A%226%22%3Bs%3A5%3A%22title%22%3Bs%3A99%3A%22PostgreSQL+%3A+a+comprehensive+guide+to+building%2C+programming%2C+and+administering+PostgreSQL+databases%22%3Bs%3A8%3A%22gmd_name%22%3Bs%3A4%3A%22Text%22%3Bs%3A3%3A%22sor%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22edition%22%3Bs%3A7%3A%221st+ed.%22%3Bs%3A9%3A%22isbn_issn%22%3Bs%3A10%3A%220735712573%22%3Bs%3A14%3A%22publisher_name%22%3Bs%3A4%3A%22Sams%22%3Bs%3A12%3A%22publish_year%22%3Bs%3A4%3A%222003%22%3Bs%3A9%3A%22collation%22%3Bs%3A27%3A%22xvii%2C+790+p.+%3A+ill.+%3B+23cm.%22%3Bs%3A12%3A%22series_title%22%3Bs%3A56%3A%22Developer%C3%83%C6%92%C3%82%C2%A2%C3%83%C2%A2%C3%A2%E2%82%AC%C5%A1%C3%82%C2%AC%C3%83%C2%A2%C3%A2%E2%82%AC%C5%BE%C3%82%C2%A2s+library%22%3Bs%3A11%3A%22call_number%22%3Bs%3A18%3A%22005.75%2F85-22+Kor+p%22%3Bs%3A13%3A%22language_name%22%3Bs%3A7%3A%22English%22%3Bs%3A6%3A%22source%22%3BN%3Bs%3A11%3A%22place_place%22%3Bs%3A12%3A%22Indianapolis%22%3Bs%3A14%3A%22classification%22%3Bs%3A12%3A%22005.75%2F85+22%22%3Bs%3A5%3A%22notes%22%3Bs%3A309%3A%22PostgreSQL+is+the+world%27s+most+advanced+open-source+database.+PostgreSQL+is+the+most+comprehensive%2C+in-depth%2C+and+easy-to-read+guide+to+this+award-winning+database.+This+book+starts+with+a+thorough+overview+of+SQL%2C+a+description+of+all+PostgreSQL+data+types%2C+and+a+complete+explanation+of+PostgreSQL+commands.%22%3Bs%3A5%3A%22image%22%3Bs%3A14%3A%22postgresql.jpg%22%3Bs%3A9%3A%22opac_hide%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22promoted%22%3Bs%3A1%3A%221%22%3Bs%3A6%3A%22labels%22%3BN%3Bs%3A9%3A%22frequency%22%3BN%3Bs%3A16%3A%22spec_detail_info%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22content_type%22%3BN%3Bs%3A10%3A%22media_type%22%3BN%3Bs%3A12%3A%22carrier_type%22%3BN%3Bs%3A3%3A%22uid%22%3BN%3Bs%3A7%3A%22authors%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Korry%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Susan%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7D%7Ds%3A8%3A%22subjects%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A11%3A%22Programming%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A5%3A%22RDBMS%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7D%7Ds%3A5%3A%22items%22%3Ba%3A1%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A9%3A%22item_code%22%3Bs%3A6%3A%22B00002%22%3Bs%3A14%3A%22inventory_code%22%3Bs%3A10%3A%22INV%2FB00002%22%3B%7D%7Ds%3A4%3A%22hash%22%3Ba%3A5%3A%7Bs%3A6%3A%22biblio%22%3Bs%3A40%3A%225916a996adc7011c62026ffc1d86c3a26bf868ea%22%3Bs%3A14%3A%22classification%22%3Bs%3A40%3A%22563ecd3169619ca48558f42ce90ee17fd71584c2%22%3Bs%3A7%3A%22authors%22%3Bs%3A40%3A%2293a51f37886e718b2c38efdd2b2c878b0f03ba7c%22%3Bs%3A8%3A%22subjects%22%3Bs%3A40%3A%222131f8a8f0fd59235b66d12b0aac2fa1d7cddadc%22%3Bs%3A5%3A%22image%22%3Bs%3A40%3A%22f23419a21e9f33280a31f8d28b2a5245346a89ca%22%3B%7Ds%3A10%3A%22input_date%22%3Bs%3A19%3A%222007-11-29+16%3A29%3A33%22%3Bs%3A11%3A%22last_update%22%3Bs%3A19%3A%222019-06-03+14%3A18%3A53%22%3B%7D%7D','Updated data. Bibliography.','2019-06-03 14:18:53');
insert  into `biblio_log`(`biblio_log_id`,`biblio_id`,`user_id`,`realname`,`title`,`ip`,`action`,`affectedrow`,`rawdata`,`additional_information`,`date`) values (3,6,1,'Admin','PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases','::1','update','description','a%3A1%3A%7Bi%3A0%3Ba%3A32%3A%7Bs%3A9%3A%22biblio_id%22%3Bs%3A1%3A%226%22%3Bs%3A5%3A%22title%22%3Bs%3A99%3A%22PostgreSQL+%3A+a+comprehensive+guide+to+building%2C+programming%2C+and+administering+PostgreSQL+databases%22%3Bs%3A8%3A%22gmd_name%22%3Bs%3A4%3A%22Text%22%3Bs%3A3%3A%22sor%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22edition%22%3Bs%3A7%3A%221st+ed.%22%3Bs%3A9%3A%22isbn_issn%22%3Bs%3A10%3A%220735712573%22%3Bs%3A14%3A%22publisher_name%22%3Bs%3A4%3A%22Sams%22%3Bs%3A12%3A%22publish_year%22%3Bs%3A4%3A%222003%22%3Bs%3A9%3A%22collation%22%3Bs%3A27%3A%22xvii%2C+790+p.+%3A+ill.+%3B+23cm.%22%3Bs%3A12%3A%22series_title%22%3Bs%3A56%3A%22Developer%C3%83%C6%92%C3%82%C2%A2%C3%83%C2%A2%C3%A2%E2%82%AC%C5%A1%C3%82%C2%AC%C3%83%C2%A2%C3%A2%E2%82%AC%C5%BE%C3%82%C2%A2s+library%22%3Bs%3A11%3A%22call_number%22%3Bs%3A18%3A%22005.75%2F85-22+Kor+p%22%3Bs%3A13%3A%22language_name%22%3Bs%3A7%3A%22English%22%3Bs%3A6%3A%22source%22%3BN%3Bs%3A11%3A%22place_place%22%3Bs%3A12%3A%22Indianapolis%22%3Bs%3A14%3A%22classification%22%3Bs%3A12%3A%22005.75%2F85+22%22%3Bs%3A5%3A%22notes%22%3Bs%3A309%3A%22PostgreSQL+is+the+world%27s+most+advanced+open-source+database.+PostgreSQL+is+the+most+comprehensive%2C+in-depth%2C+and+easy-to-read+guide+to+this+award-winning+database.+This+book+starts+with+a+thorough+overview+of+SQL%2C+a+description+of+all+PostgreSQL+data+types%2C+and+a+complete+explanation+of+PostgreSQL+commands.%22%3Bs%3A5%3A%22image%22%3Bs%3A14%3A%22postgresql.jpg%22%3Bs%3A9%3A%22opac_hide%22%3Bs%3A1%3A%220%22%3Bs%3A8%3A%22promoted%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22labels%22%3BN%3Bs%3A9%3A%22frequency%22%3BN%3Bs%3A16%3A%22spec_detail_info%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22content_type%22%3BN%3Bs%3A10%3A%22media_type%22%3BN%3Bs%3A12%3A%22carrier_type%22%3BN%3Bs%3A3%3A%22uid%22%3BN%3Bs%3A7%3A%22authors%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Korry%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A11%3A%22author_name%22%3Bs%3A14%3A%22Douglas%2C+Susan%22%3Bs%3A14%3A%22authority_type%22%3Bs%3A1%3A%22p%22%3B%7D%7Ds%3A8%3A%22subjects%22%3Ba%3A2%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A11%3A%22Programming%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7Di%3A1%3Ba%3A2%3A%7Bs%3A5%3A%22topic%22%3Bs%3A5%3A%22RDBMS%22%3Bs%3A10%3A%22topic_type%22%3Bs%3A1%3A%22t%22%3B%7D%7Ds%3A5%3A%22items%22%3Ba%3A1%3A%7Bi%3A0%3Ba%3A2%3A%7Bs%3A9%3A%22item_code%22%3Bs%3A6%3A%22B00002%22%3Bs%3A14%3A%22inventory_code%22%3Bs%3A10%3A%22INV%2FB00002%22%3B%7D%7Ds%3A4%3A%22hash%22%3Ba%3A5%3A%7Bs%3A6%3A%22biblio%22%3Bs%3A40%3A%22f6db780aad09b937233ec4d0740c8f9ed4b66dc8%22%3Bs%3A14%3A%22classification%22%3Bs%3A40%3A%22563ecd3169619ca48558f42ce90ee17fd71584c2%22%3Bs%3A7%3A%22authors%22%3Bs%3A40%3A%2293a51f37886e718b2c38efdd2b2c878b0f03ba7c%22%3Bs%3A8%3A%22subjects%22%3Bs%3A40%3A%222131f8a8f0fd59235b66d12b0aac2fa1d7cddadc%22%3Bs%3A5%3A%22image%22%3Bs%3A40%3A%22f23419a21e9f33280a31f8d28b2a5245346a89ca%22%3B%7Ds%3A10%3A%22input_date%22%3Bs%3A19%3A%222007-11-29+16%3A29%3A33%22%3Bs%3A11%3A%22last_update%22%3Bs%3A19%3A%222019-06-03+14%3A19%3A29%22%3B%7D%7D','Updated data. Bibliography.','2019-06-03 14:19:29');

/*Table structure for table `biblio_relation` */

DROP TABLE IF EXISTS `biblio_relation`;

CREATE TABLE `biblio_relation` (
  `biblio_id` int(11) NOT NULL DEFAULT '0',
  `rel_biblio_id` int(11) NOT NULL DEFAULT '0',
  `rel_type` int(1) DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`rel_biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `biblio_relation` */

/*Table structure for table `biblio_topic` */

DROP TABLE IF EXISTS `biblio_topic`;

CREATE TABLE `biblio_topic` (
  `biblio_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `level` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `biblio_topic` */

insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (1,1,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (1,2,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (2,3,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (2,4,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (2,5,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (3,1,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (3,6,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (3,7,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (4,4,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (4,8,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (5,8,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (5,9,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (6,1,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (6,7,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (7,2,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (7,10,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (8,1,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (8,2,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (9,11,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (9,12,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (9,13,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (10,11,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (10,14,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (12,15,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (12,16,2);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (13,15,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (14,15,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (15,15,1);
insert  into `biblio_topic`(`biblio_id`,`topic_id`,`level`) values (15,17,2);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` int(11) NOT NULL,
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comment` */

/*Table structure for table `content` */

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `content_path` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_news` smallint(1) DEFAULT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `content_ownpage` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `content_path` (`content_path`),
  FULLTEXT KEY `content_title` (`content_title`),
  FULLTEXT KEY `content_desc` (`content_desc`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `content` */

insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (1,'Library Information','<h3>Contact Information</h3>\r\n<p><strong>Address :</strong> <br /> Jenderal Sudirman Road, Senayan, Jakarta, Indonesia - Postal Code : 10270 <br /> <strong>Phone Number :</strong> <br /> (021) 5711144 <br /> <strong>Fax Number :</strong> <br /> (021) 5711144</p>\r\n<h3>Opening Hours</h3>\r\n<p><strong>Monday - Friday :</strong> <br /> Open : 08.00 AM<br /> Break : 12.00 - 13.00 PM<br /> Close : 20.00 PM <br /> <strong>Saturday  :</strong> <br /> Open : 08.00 AM<br /> Break : 12.00 - 13.00 PM<br /> Close : 17.00 PM</p>\r\n<h3>Collections</h3>\r\n<p>We have many types of collections in our library, range from Fictions to Sciences Material, from printed material to digital collections such CD-ROM, CD, VCD and DVD. We also collect daily serials publications such as newspaper and also monthly serials such as magazines.</p>\r\n<h3>Library Membership</h3>\r\n<p>To be able to loan our library collections, you must first become library member. There is terms and conditions that you must obey.</p>','libinfo',NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (2,'Help On Usage','<h3>Searching</h3>\r\n<p>There are 2 methods available on searching library catalog. The first one is <strong>SIMPLE SEARCH</strong>, which is the simplest method on searching catalog. You just enter any keyword, either it containes in titles, author(s) names or subjects. You can supply more than one keywords in Simple Search method and it will expanding your search results.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ADVANCED SEARCH</strong>, lets you define keywords in more specific fields. If you want your keywords only contained in title field, then type your keyword in Title field and the system will limit its search within <strong>Title</strong> fields only, not in other fields. Location field lets you narrowing search results by specific location, so only collection that exists in selected location get fetched by system.</p>','help',NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (3,'Welcome To Admin Page','<div class=\"container admin_home\">\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Bibliography</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon biblioIcon notAJAX\" href=\"index.php?mod=bibliography\"></a></div>\r\n<div class=\"col-sm-8\">The Bibliography module lets you manage your library bibliographical data. It also include collection items management to manage a copies of your library collection so it can be used in library circulation.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Circulation</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon circulationIcon notAJAX\" href=\"index.php?mod=circulation\"></a></div>\r\n<div class=\"col-sm-8\">The Circulation module is used for doing library circulation transaction such as collection loans and return. In this module you can also create loan rules that will be used in loan transaction proccess.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Membership</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon memberIcon notAJAX\" href=\"index.php?mod=membership\"></a></div>\r\n<div class=\"col-sm-8\">The Membership module lets you manage library members such adding, updating and also removing. You can also manage membership type in this module.</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Stock Take</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon stockTakeIcon notAJAX\" href=\"index.php?mod=stock_take\"></a></div>\r\n<div class=\"col-sm-8\">The Stock Take module is the easy way to do Stock Opname for your library collections. Follow several steps that ease your pain in Stock Opname proccess.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Serial Control</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon serialIcon notAJAX\" href=\"index.php?mod=serial_control\"></a></div>\r\n<div class=\"col-sm-8\">Serial Control module help you manage library\'s serial publication subscription. You can track issues for each subscription.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Reporting</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon reportIcon notAJAX\" href=\"index.php?mod=reporting\"></a></div>\r\n<div class=\"col-sm-8\">Reporting lets you view various type of reports regardings membership data, circulation data and bibliographic data. All compiled on-the-fly from current library database.</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Master File</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon masterFileIcon notAJAX\" href=\"index.php?mod=master_file\"></a></div>\r\n<div class=\"col-sm-8\">The Master File modules lets you manage referential data that will be used by another modules. It include Authority File management such as Authority, Subject/Topic List, GMD and other data.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>System</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon systemIcon notAJAX\" href=\"index.php?mod=system\"></a></div>\r\n<div class=\"col-sm-8\">The System module is used to configure application globally, manage index, manage librarian, and also backup database.</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','adminhome',NULL,'2009-09-13 19:48:16','2009-09-13 22:02:11','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (4,'Homepage Info','<p>Welcome To <strong>SLiMS Library</strong> Online Public Access Catalog (OPAC). Use OPAC to search collection in our library.</p>','headerinfo',NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (5,'Tentang SLiMS','<p><!--intro_awal--><strong>SLiMS</strong> adalah akronim dari Senayan Library Management System. Awalnya dikembangkan oleh Perpustakaan Kementerian Pendidikan Nasional untuk menggantikan Alice (http://www2.softlinkint.com). Tujuan utamanya agar Perpustakaan Kemdiknas mempunyai kebebasan untuk menggunakan, mempelajari, memodifikasi dan mendistribusikan perangkat lunak yang digunakan. SLiMS, maka dirilis dengan lisensi GPL dan sekarang pengembangan SLiMS dilakukan oleh komunitas penggunanya.<!--intro_akhir--></p>\r\n<p><strong>Asal Mula</strong></p>\r\n<p>Setelah beroperasi 50 tahun lebih, karena beberapa alasan Perpustakaan BC Indonesia yang telah selama bertahun-tahun menjadi andalan layanan BC di Indonesia harus ditutup. Pengelola BC Indonesia kemudian berinisiatif untuk menghibahkan pengelolaan aset perpustakaanya ke tangan institusi pemerintah. Dalam hal ini, institusi pemerintah yang dianggap sesuai bidangnya dan strategis tempatnya, adalah Departemen Pendidikan Nasional (Depdiknas). Yang dihibahkan tidak hanya koleksi, tetapi juga rak koleksi, hardware (server dan workstation) serta sistem termasuk untuk aplikasi manajemen administrasi perpustakaan (Alice).</p>\r\n<p>Seiring dengan berjalannya waktu, manajemen Perpustakaan Depdiknas mulai menghadapi beberapa kendala dalam penggunaan sistem Alice. Pertama, keterbatasan dalam menambahkan fitur-fitur baru. Antara lain: kebutuhan manajemen serial, meng-online-kan katalog di web dan kustomisasi report yang sering berubah-ubah kebutuhannya. Penambahan fitur jika harus meminta modul resmi dari developer Alice, berarti membutuhkan dana tambahan yang tidak kecil. Apalagi tidak ada distributor resminya di Indonesia sehingga harus mengharapkan support dari Inggris. Ditambah lagi beberapa persyaratan yang membutuhkan infrastruktur biaya mahal seperti dedicated public IP agar bisa meng-online-kan Alice di web.<br /><br />Saat itu untuk mengatasi sebagian kebutuhan (utamanya kustomisasi report), dilakukan dengan ujicoba mengakses langsung database yang disimpan dalam format DBase. Terkadang berhasil terkadang tidak karena struktur datanya proprietary dan kompleks serta jumlah rekodnya banyak. Untuk mempelajari struktur database, dicoba melakukan kontak via email ke developer Alice. Tetapi tidak ada respon sama sekali. Disini muncul masalah kedua. Sulitnya mempelajari lebih mendalam cara kerja perangkat lunak Alice. Karena Alice merupakan sistem proprietary yang serba tertutup, segala sesuatunya sangat tergantung vendor. Dibutuhkan sejumlah uang untuk mendapatkan layanan resmi untuk kustomisasi.<br /><br />Perpustakaan Depdiknas salah satu tupoksinya adalah melakukan koordinasi pengelolaan perpustakaan unit kerja dibawah lingkungan Depdiknas. Dalam implementasinya, seringkali muncul kebutuhan untuk bisa mendistribusikan perangkat lunak sistem perpustakaan ke berbagai unit kerja tersebut. Disini masalah ketiga: sulit (atau tidak mungkin) untuk melakukan redistribusi sistem Alice. Alice merupakan perangkat lunak yang secara lisensi tidak memungkinkan diredistribusi oleh pengelola Perpustakaan Depdiknas secara bebas. Semuanya harus ijin dan membutuhkan biaya.<br /><br />November 2006, perpustakaan dihadapkan oleh sebuah masalah mendasar. Sistem Alice tiba-tiba tidak bisa digunakan. Ternyata Alice yang digunakan selama ini diimplementasikan dengan sistem sewa. Pantas saja biayanya relatif murah. Tiap tahun pengguna harus membayar kembali untuk memperpanjang masa sewa pakainya. Tetapi yang mengkhawatirkan adalah fakta bahwa perpustakaan harus menyimpan semua informasi penting dan kritikal di sebuah sistem yang tidak pernah dimiliki. Yang kalau lupa atau tidak mau membayar sewa lagi, hilanglah akses terhadap data kita sendiri. Konyol sekali. Itu sama saja dengan bunuh diri kalau masih tergantung dengan sistem berlisensi seperti itu.<br /><br />Akhirnya pengelola Perpustakaan Depdiknas me-review kembali penggunaan sistem Alice di perpustakaan Depdiknas. Beberapa poin pentingnya antara lain:<br />&bull;&nbsp;&nbsp;&nbsp; Alice memang handal (reliable), tapi punya banyak keterbatasan. Biaya sewanya memang relatif murah, tetapi kalau membutuhkan support tambahan, baik sederhana ataupun kompleks, sangat tergantung dengan developer Alice yang berpusat di Inggris. Butuh biaya yang kalau di total juga tidak murah.<br />&bull;&nbsp;&nbsp;&nbsp; Model lisensi proprietary yang digunakan developer Alice tidak cocok dengan kondisi kebanyakan perpustakaan di Indonesia. Padahal pengelola Perpustakaan Depdiknas sebagai koordinator banyak perpustakaan di lingkungan Depdiknas, punya kepentingan untuk bisa dengan bebas melakukan banyak hal terhadap software yang digunakan.<br />&bull;&nbsp;&nbsp;&nbsp; Menyimpan data penting dan kritikal untuk operasional perpustakaan di suatu software yang proprietary dan menggunakan sistem sewa, dianggap sesuatu yang konyol dan mengancam independensi dan keberlangsungan perpustakaan itu sendiri.<br />&bull;&nbsp;&nbsp;&nbsp; Alice berjalan diatas sistem operasi Windows yang juga proprietary padahal pengelola Perpustakaan Depdiknas ingin beralih menggunakan Sistem Operasi open source (seperti GNU/Linux dan FreeBSD).<br />&bull;&nbsp;&nbsp;&nbsp; Masalah devisa negara yang terbuang untuk membayar software yang tidak pernah dimiliki.<br />&bull;&nbsp;&nbsp;&nbsp; Intinya: pengelola Perpustakaan Depdiknas ingin menggunakan software yang memberikan dan menjamin kebebasan untuk: menggunakan, mempelajari, memodifikasi dan melakukan redistribusi. Lisensi Alice tidak memungkinkan untuk itu.<br /><br />Setelah memutuskan untuk hijrah menggunakan sistem yang lain, maka langkah berikutnya adalah mencari sistem yang ada untuk digunakan atau mengembangkan sendiri sistem yang dibutuhkan. Beberapa pertimbangan yang harus dipenuhi:<br />&bull;&nbsp;&nbsp;&nbsp; Dirilis dibawah lisensi yang menjamin kebebasan untuk: menggunakan, mempelajari, memodifikasi dan melakukan redistribusi. Model lisensi open source (www.openosurce.org) dianggap sebagai model yang paling ideal dan sesuai.<br />&bull;&nbsp;&nbsp;&nbsp; Teknologi yang digunakan untuk membangun sistem juga harus berlisensi open source.<br />&bull;&nbsp;&nbsp;&nbsp; Teknologi yang digunakan haruslah teknologi yang relatif mudah dipelajari oleh pengelola perpustakaan Depdiknas yang berlatarbelakang pendidiknas pustakawan, seperti PHP (scripting language) dan MySQL (database). Jika tidak menguasai sisi teknis teknologi, maka akan terjebak kembali terhadap ketergantungan pada developer.<br /><br />Langkah berikutnya adalah melakukan banding software sistem perpustakaan open source yang bisa diperoleh di internet. Beberapa software yang dicoba antara lain: phpMyLibrary, OpenBiblio, KOHA, EverGreen. Pengelola perpustakaan Depdiknas merasa tidak cocok dengan software yang ada, dengan beberapa alasan:<br />&bull;&nbsp;&nbsp;&nbsp; Desain aplikasi dan database yang tidak baik atau kurang menerapkan secara serius prinsip-prinsip pengembangan aplikasi dan database yang baik sesuai dengan teori yang ada (PHPMyLibrary, OpenBiblio).<br />&bull;&nbsp;&nbsp;&nbsp; Menggunakan teknologi yang sulit dikuasai oleh pengelola perpustakaan Depdiknas (KOHA dan EverGreen dikembangkan menggunakan Perl dan C++ Language yang relatif lebih sulit dipelajari).<br />&bull;&nbsp;&nbsp;&nbsp; Beberapa sudah tidak aktif atau lama sekali tidak di rilis versi terbarunya (PHPMyLibrary dan OpenBiblio).<br /><br />Karena tidak menemukan sistem yang dibutuhkan, maka diputuskan untuk mengembangkan sendiri aplikasi sistem perpustakaan yang dibutuhkan. Dalam dunia pengembangan software, salah satu best practice-nya adalah memberikan nama kode (codename) pengembangan. Nama kode berbeda dengan nama aplikasinya itu sendiri. Nama kode biasanya berbeda-beda tiap versi. Misalnya kode nama &ldquo;Hardy Heron&rdquo; untuk Ubuntu Linux 8.04 dan &ldquo;Jaunty Jackalope&rdquo; untuk Ubuntu Linux 9.04. Pengelola perpustakaan Depdiknas Untuk versi awal (1.0) aplikasi yang akan dikembangkan, memberikan nama kode &ldquo;Senayan&rdquo;. Alasannya sederhana, karena awal dikembangkan di perpustakaan Depdiknas yang berlokasi di Senayan. Apalagi Perpustakaan Depdiknas mempunyai brand sebagai library@senayan. Belakangan karena dirasa nama &ldquo;Senayan&rdquo; dirasa cocok dan punya nilai marketing yang bagus, maka nama &ldquo;Senayan&rdquo; dijadikan nama resmi aplikasi sistem perpustakaan yang dikembangkan.<br /><br />Mengembangkan Senayan<br /><br />Sebelum mulai mengembangkan Senayan, ada beberapa keputusan desain aplikasi yang harus dibuat. Aspek desain ini penting diantaranya untuk pengambilankeputusan dari berbagai masukan yang datang dari komunitas. Antara lain:<br /><br />Pertama,&nbsp; Senayan adalah aplikasi untuk kebutuhan administrasi dan konten perpustakaan (Library Automation System). Senayan didesain untuk kebutuhan skala menengah maupun besar. Cocok untuk perpustakaan yang memiliki koleksi, anggota dan staf banyak di lingkungan jaringan, baik itu lokal (intranet) dan internet.<br /><br />Kedua, Senayan dibangun dengan memperhatikan best practice dalam pengembangan software seperti dalam hal penulisan source code, dokumentasi, dan desain database.<br /><br />Ketiga, Senayan dirancang untuk compliant dengan standar pengelolaan koleksi di perpustakaan. Untuk standar pengatalogan minimal memenuhi syarat AACR 2 level 2 (Anglo-American Cataloging Rules). Kebutuhan untuk kesesuaian dengan standar di perpustakaan terus berkembang dan pengelola perpustakaan Depdiknas dan developer Senayan berkomitmen untuk terus mengembangkan Senayan agar mengikuti standar-standar tersebut.<br /><br />Keempat, Senayan didesain agar bisa juga menjadi middleware bagi aplikasi lain untuk menggunakan data yang ada didalam Senayan. Untuk itu Senayan akan menyediakan API (application programming Interface) yang berbasis web service.<br /><br />Kelima, Senayan merupakan aplikasi yang cross-platform, baik dari sisi aplikasinya itu sendiri dan akses terhadap aplikasi. Untuk itu basis yang paling tepat ada basis web.<br /><br />Keenam, teknologi yang digunakan untuk membangun Senayan, haruslah terbukti bisa diinstall di banyak platform sistem operasi, berlisensi open source dan mudah dipelajari oleh pengelola perpustakaan Depdiknas. Diputuskan untuk menggunakan PHP (www.php.net) untuk web scripting languange dan MySQL (www.mysql.com) untuk server database.<br /><br />Ketujuh, diputuskan untuk mengembangkan library PHP sendiri yang didesain spesifik untuk kebutuhan membangun library automation system. Tidak menggunakan library PHP yang sudah terkenal seperti PEAR (pear.php.net) karena alasan penguasaan terhadap teknologi dan kesederhanaan. Library tersebut diberinama &ldquo;simbio&rdquo;.<br /><br />Kedelapan, untuk mempercepat proses pengembangan, beberapa modul atau fungsi yang dibutuhkan yang dirasa terlalu lama dan rumit untuk dikembangkan sendiri, akan menggunakan software open source yang berlisensi open source juga. Misalnya: flowplayer untuk dukungan multimedia, jQuery untuk dukungan AJAX (Asynchronous Javascript and XML), genbarcode untuk dukungan pembuatan barcode, PHPThumb untuk dukungan generate image on-the-fly, tinyMCE untuk web-based text editor, dan lain-lain.<br /><br />Kesembilan, untuk menjaga spirit open source, proses pengembangan Senayan dilakukan dengan infrastruktur yang berbasis open source. Misalnya: server web menggunakan Apache, server produksi menggunakan OS Linux Centos dan OpenSuse, para developer melakukan pengembangan dengan OS Ubuntu Linux, manajemen source code menggunakan software git, dan lain-lain.<br /><br />Kesepuluh, Senayan dirilis ke masyarakat umum dengan lisensi GNU/GPL versi 3 yang menjamin kebebasan penggunanya untuk mempelajari, menggunakan, memodifikasi dan redistribusi Senayan.<br /><br />Kesebelas, para developer dan pengelola perpustakaan Depdiknas berkomitmen untuk terus mengembangkan Senayan dan menjadikannya salah satu contoh software perpustakaan yang open source, berbasis di indonesia dan menjadi salah satu contoh bagi model pengembangan open source yang terbukti berjalan dengan baik.<br /><br />Keduabelas, model pengembangan Senayan adalah open source yang artinya setiap orang dipersilahkan memberikan kontribusinya. Baik dari sisi pemrogaman, template, dokumentasi, dan lain-lain. Tentu saja ada mekanisme mana kontribusi yang bagus untuk dimasukkan dalam rilis resmi, mana yang tidak. Mengacu ke dokumen &hellip; (TAMBAHKAN DENGAN TULISAN ERIC S RAYMOND)<br /><br />Model pengembangan senayan<br /><br />Pengembangan Senayan awalnya diinisiasi oleh pengelola Perpustakaan Depdiknas. Tetapi sekarang komunitas pengembang Senayan (Senayan Developer Community) yang lebih banyak mengambil peran dalam mengembangkan Senayan. Beberapa hal dibawah ini merupakan kultur yang dibangun dalam mengembangkan Senayan:<br />1.&nbsp;&nbsp;&nbsp; Meritokrasi. Siapa saja bisa berkontribusi. Mereka yang banyak memberikan kontribusi, akan mendapatkan privilege lebih dibandingkan yang lain.<br />2.&nbsp;&nbsp;&nbsp; Minimal punya concern terhadap pengembangan perpustakaan. Contoh lain: berlatar belakang pendidikan ilmu perpustakaan dan informasi, bekerja di perpustakaan, mengelola perpustakaan, dan lain-lain. Diharapkan dengan kondisi ini, sense of librarianship melekat di tiap developer/pengguna Senayan. Sejauh ini, semua developer senayan merupakan pustakawan atau berlatarbelakang pendidikan kepustakawanan (Information and Librarianship).<br />3.&nbsp;&nbsp;&nbsp; Release early, release often, and listen to your customer. Release early artinya setiap perbaikan dan penambahan fitur, secepat mungkin dirilis ke publik. Diharapkan bugs yang ada, bisa cepat ditemukan oleh komunitas, dilaporkan ke developer, untuk kemudian dirilis perbaikannya. Release often, artinya sesering mungkin memberikan update perbaikan bugs dan penambahan fitur. Ini &ldquo;memaksa&rdquo; developer Senayan untuk terus kreatif menambahkan fitur Senayan. Release often juga membuat pengguna berkeyakinan bahwa Senayan punya sustainability yang baik dan terus aktif dikembangkan. Selain itu, release often juga mempunyai dampak pemasaran. Pengguna dan calon pengguna, selalu diingatkan tentang keberadaan Senayan. Tentunya dengan cara yang elegan, yaitu rilis-rilis Senayan. Sejak dirilis ke publi pertama kali November 2007 sampai Juli 2009 (kurang lebih 20 bulan) telah dirilis 18 rilis resmi Senayan. Listen to your customer. Developer Senayan selalu berusaha mengakomodasi kebutuhan pengguna baik yang masuk melalui report di mailing list, ataupun melalui bugs tracking system. Tentu tidak semua masukan diakomodasi, harus disesuaikan dengan desain dan roadmap pengembangan Senayan.<br />4.&nbsp;&nbsp;&nbsp; Dokumentasi. Developer Senayan meyakini pentingnya dokumentasi yang baik dalam mensukseskan implementasi Senayan dibanyak tempat. Karena itu pengembang Senayan mempunyai tim khusus yang bertanggungjawab yang mengembangkan dokumentasi Senayan agar terus uo-to-date mengikuti rilis terbaru.<br />5.&nbsp;&nbsp;&nbsp; Agar ada percepatan dalam pengembangan dan untuk mengakrabkan antar pengembang Senayan, minimal setahun sekali diadakan Senayan Developers Day yang mengumpulkan para developer Senayan dari berbagai kota, dan melakukan coding bersama-sama.<br />Fitur Senayan<br />Sebagai sebuah Sistem Automasi Perpustakaan yang terintergrasi, modul-modul yang telah terdapat di SENAYAN adalah sebagai berikut:<br />Modul Pengatalogan (Cataloging Module)<br />1)&nbsp;&nbsp;&nbsp; Compliance dengan standar AACR2 (Anglo-American Cataloging Rules).<br />2)&nbsp;&nbsp;&nbsp; Fitur untuk membuat, mengedit, dan menghapus data bibliografi sesuai dengan standar deskripsi bibliografi AACR2 level ke dua.<br />3)&nbsp;&nbsp;&nbsp; Mendukung pengelolaan koleksi dalam berbagai macam format seperti monograph, terbitan berseri, audio visual, dsb.<br />4)&nbsp;&nbsp;&nbsp; Mendukung penyimpanan data bibliografi dari situs di Internet.<br />5)&nbsp;&nbsp;&nbsp; Mendukung penggunaan Barcode.<br />6)&nbsp;&nbsp;&nbsp; Manajemen item koleksi untuk dokumen dengan banyak kopi dan format yang berbeda.<br />7)&nbsp;&nbsp;&nbsp; Mendukung format XML untuk pertukaran data dengan menggunakan standar metadata MODS (Metadata Object Description Schema).<br />8)&nbsp;&nbsp;&nbsp; Pencetakan Barcode item/kopi koleksi Built-in.<br />9)&nbsp;&nbsp;&nbsp; Pencetakan Label Punggung koleksi Built-in.<br />10)&nbsp;&nbsp;&nbsp; Pengambilan data katalog melalui protokol Z3950 ke database koleksi Library of Congress.<br />11)&nbsp;&nbsp;&nbsp; Pengelolaan koleksi yang hilang, dalam perbaikan, dan rusak serta pencatatan statusnya untuk dilakukan pergantian/perbaikan terhadap koleksi.<br />12)&nbsp;&nbsp;&nbsp; Daftar kendali untuk pengarang (baik pengarang orang, badan/lembaga, dan pertemuan) sebagai standar konsistensi penuliasn<br />13)&nbsp;&nbsp;&nbsp; Pengaturan hak akses pengelolaan data bibliografi hanya untuk staf yang berhak.<br /><br />Modul Penelusuran (OPAC/Online Public Access catalog Module)<br />1)&nbsp;&nbsp;&nbsp; Pencarian sederhana.<br />2)&nbsp;&nbsp;&nbsp; Pencarian tingkat lanjut (Advanced).<br />3)&nbsp;&nbsp;&nbsp; Dukungan penggunaan Boolean\'s Logic dan implementasi CQL (Common Query Language).<br />4)&nbsp;&nbsp;&nbsp; OPAC Web Services berbasis XML.<br />5)&nbsp;&nbsp;&nbsp; Mendukung akses OPAC melalui peralatan portabel (mobile device)<br />6)&nbsp;&nbsp;&nbsp; Menampilkan informasi lengkap tetang status koleksi di perpustakaan, tanggal pengembalian, dan pemesanan item/koleksi<br />7)&nbsp;&nbsp;&nbsp; Detil informasi juga menampilkan gambar sampul buku, lampiran dalam format elektronik yang tersedia (jika ada) serta fasilitas menampilkan koleksi audio dan visual.<br />8)&nbsp;&nbsp;&nbsp; Menyediakan hyperlink tambahan untuk pencarian lanjutan berdasarkan penulis, dan subjek.<br /><br />Modul Sirkulasi (Circulation Module)<br />1)&nbsp;&nbsp;&nbsp; Mampu memproses peminjaman dan pengembalian koleksi secara efisien, efektif dan aman.<br />2)&nbsp;&nbsp;&nbsp; Mendukung fitur reservasi koleksi yang sedang dipinjam, termasuk reminder/pemberitahuan-nya.<br />3)&nbsp;&nbsp;&nbsp; Mendukung fitur manajemen denda. Dilengkapi fleksibilitas untuk pemakai membayar denda secara cicilan.<br />4)&nbsp;&nbsp;&nbsp; Mendukung fitur reminder untuk berbagai keperluan seperti melakukan black list terhadap pemakai yang bermasalah atau habis keanggotaannya.<br />5)&nbsp;&nbsp;&nbsp; Mendukung fitur pengkalenderan (calendaring) untuk diintegrasikan dengan penghitungan masa peminjaman, denda, dan lain-lain.<br />6)&nbsp;&nbsp;&nbsp; Memungkinkan penentuan hari-hari libur non-standar yang spesifik.<br />7)&nbsp;&nbsp;&nbsp; Dukungan terhadap ragam jenis tipe pemakai dengan masa pinjam beragam untuk berbagai jenis keanggotaan.<br />8)&nbsp;&nbsp;&nbsp; Menyimpan histori peminjaman anggota.<br />9)&nbsp;&nbsp;&nbsp; Mendukung pembuatan peraturan peminjaman yang sangat rinci dengan mengkombinasikan parameter keanggotaan, jenis koleksi, dan gmd selain aturan peminjaman standar berdasarkan jenis keanggotaan<br /><br />Modul Manajemen Keanggotaan (Membership Management Module)<br />1)&nbsp;&nbsp;&nbsp; Memungkinkan beragam tipe pemakai dengan ragam jenis kategori peminjaman, ragam jenis keanggotaan dan pembedaan setiap layanan sirkulasi dalam jumlah koleksi serta lama peminjaman untuk jenis koleksi untuk setiap jenis/kategori.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap input menggunakan barcode reader<br />3)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi preferensi pemakai atau subject interest.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi tambahan untuk keperluan reminder pada saat transaksi.<br />5)&nbsp;&nbsp;&nbsp; Memungkinkan menyimpan informasi detail pemakai yang lebih lengkap.<br />6)&nbsp;&nbsp;&nbsp; Pencarian informasi anggota minimal berdasarkan nomor dan nama anggota.<br />7)&nbsp;&nbsp;&nbsp; Pembuatan kartu anggota yang dilengkapi dengan barcode untuk transaksi peminjaman.<br /><br />Modul Inventarisasi Koleksi (Stocktaking Module)<br />1)&nbsp;&nbsp;&nbsp; Proses inventarisasi koleksi bisa dilakukan secara bertahap dan parsial tanpa harus menutup layanan perpustakaan secara keseluruhan.<br />2)&nbsp;&nbsp;&nbsp; Proses inventarisasi bisa dilakukan secara efisien dan efektif.<br />3)&nbsp;&nbsp;&nbsp; Terdapat pilihan untuk menghapus data secara otomatis pada saat akhir proses inventarisasi terhadap koleksi yang dianggap hilang.<br /><br />Modul Statistik/Pelaporan (Report Module)<br />1)&nbsp;&nbsp;&nbsp; Meliputi pelaporan untuk semua modul-modul yang tersedia di Senayan.<br />2)&nbsp;&nbsp;&nbsp; Laporan Judul.<br />3)&nbsp;&nbsp;&nbsp; Laporan Items/Kopi koleksi.<br />4)&nbsp;&nbsp;&nbsp; Laporan Keanggotaan.<br />5)&nbsp;&nbsp;&nbsp; Laporan jumlah koleksi berdasarkan klasifikasi.<br />6)&nbsp;&nbsp;&nbsp; Laporan Keterlambatan.<br />7)&nbsp;&nbsp;&nbsp; Berbagai macam statistik seperti statistik koleksi, peminjaman, keanggotaan, keterpakaian koleksi.<br />8)&nbsp;&nbsp;&nbsp; Tampilan laporan yang sudah didesain printer-friendly, sehingga memudahkan untuk dicetak.<br />9)&nbsp;&nbsp;&nbsp; Filter data yang lengkap untuk setiap laporan.<br />10)&nbsp;&nbsp;&nbsp; API untuk pelaporan yang relatif mudah dipelajari untuk membuat custom report baru.<br /><br />Modul Manajemen Terbitan Berseri (Serial Control)<br />1)&nbsp;&nbsp;&nbsp; Manajemen data langganan.<br />2)&nbsp;&nbsp;&nbsp; Manajemen data Kardex.<br />3)&nbsp;&nbsp;&nbsp; Manajemen tracking data terbitan yang akan terbit dan yang sudah ada.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan tracking data terbitan berseri yang jadwal terbitnya tidak teratur (pengaturan yang fleksibel).<br /><br />Modul Lain-lain<br />1)&nbsp;&nbsp;&nbsp; Dukungan antar muka yang multi bahasa (internasionalisasi) dengan Gettext.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap penggunaan huruf bukan latin untuk pengisian data dan pencarian.<br /><br />Roadmap Pengembangan Senayan<br />SENAYAN akan terus dikembangkan oleh para pengembangnya beserta komunitas pengguna SENAYAN lainnya. Berikut adalah Roadmap pengembangan SENAYAN ke depannya:<br /><br />Pengembangan aplikasi:<br />1.&nbsp;&nbsp;&nbsp; Kompatibilitas dengan MARC dan standar pertukaran data yang komplit. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; Memastikan bahwa format data bibliografi kompatibel dengan MARC secara lebih baik (minimal MARC light).<br />&bull;&nbsp;&nbsp;&nbsp; Dukungan terhadap RFID.<br />&bull;&nbsp;&nbsp;&nbsp; Fitur untuk impor / ekspor rekod dari The Online Computer Library Centre (OCLC), Research Libraries Information Network (RLIN), vendor sistem lain yang compliant dengan MARC.<br />&bull;&nbsp;&nbsp;&nbsp; Validasi data ISBN menggunakan modulus seven.<br />&bull;&nbsp;&nbsp;&nbsp; Dukungan terhadap standar di perpustakaan, seperti: Library of Congress Subject Headings, Library of Congress Classification, ALA filing rules, International Standard Bibliographic Description, ANSI Standard for Bibliographic Information Exchange on magnetic tape, Common communication format (ISO 2709).<br />2.&nbsp;&nbsp;&nbsp; Katalog induk/bersama (union catalog)<br />3.&nbsp;&nbsp;&nbsp; Implementasi Thesaurus. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; Pemanfaatan tesaurus untuk proses pengatalogan.<br />&bull;&nbsp;&nbsp;&nbsp; Pemanfaatan tesaurus untuk proses pencarian, misalnya memberikan advis pencarian menggunakan knowledge base yang dibangun dengan sistem tesaurus.<br />4.&nbsp;&nbsp;&nbsp; Implementasi Library 2.0. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; User bisa login dan mempunyai halaman personalisasi.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan reservasi koleksi dan memperpanjang peminjaman.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan komunikasi dengan pustakawan via messaging system.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan tagging, rekomendasi koleksi dan menyimpannya didalam daftar koleksi favoritnya.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa memberikan komentar terhadap koleksi.<br />&bull;&nbsp;&nbsp;&nbsp; Pustakawan bisa memasukkan preferensi pemakai didalam data keanggotaan. Preferensi tersebut bisa dimanfaatkan salah satunya untuk men-generate semacam daftar koleksi terpilih untuk dicetak atau ditampilkan ketika user login.<br />5.&nbsp;&nbsp;&nbsp; Peningkatan dukungan manajemen konten digital dan entri analitikal<br /><br />Pengembangan basis komunitas pengguna:<br />&bull;&nbsp;&nbsp;&nbsp; Membangun komunitas pengguna di berbagai kota <br />&bull;&nbsp;&nbsp;&nbsp; Mengadakan Senayan Developers Day untuk silaturahmi antar developer Senayan, update dokumentasi, penambahan fitur baru dan bug fixing dan mencari bibit pengembang yang baru.<br />&bull;&nbsp;&nbsp;&nbsp; Workshop/Seminar Nasional Tahunan<br />&bull;&nbsp;&nbsp;&nbsp; Jam Sessions rutin setiap 3 bulan</p>','about_slims',NULL,'2010-08-28 23:29:55','2010-11-12 18:21:01','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (6,'Modul yang Tersedia','<p><!--intro_awal-->Sebagai sebuah Sistem Automasi Perpustakaan yang terintergrasi, modul-modul yang telah terdapat di SENAYAN antara lain: pengatalogan/bibliografi, keanggotaan, sirkulasi, masterfile, stock opname (inventarisasi koleksi), pelaporan/reporting, manajemen kontrol serial, digital library, dan lain-lain.<!--intro_akhir--></p>\r\n<p>Modul Pengatalogan (Cataloging Module)<br />1)&nbsp;&nbsp;&nbsp; Compliance dengan standar AACR2 (Anglo-American Cataloging Rules).<br />2)&nbsp;&nbsp;&nbsp; Fitur untuk membuat, mengedit, dan menghapus data bibliografi sesuai dengan standar deskripsi bibliografi AACR2 level ke dua.<br />3)&nbsp;&nbsp;&nbsp; Mendukung pengelolaan koleksi dalam berbagai macam format seperti monograph, terbitan berseri, audio visual, dsb.<br />4)&nbsp;&nbsp;&nbsp; Mendukung penyimpanan data bibliografi dari situs di Internet.<br />5)&nbsp;&nbsp;&nbsp; Mendukung penggunaan Barcode.<br />6)&nbsp;&nbsp;&nbsp; Manajemen item koleksi untuk dokumen dengan banyak kopi dan format yang berbeda.<br />7)&nbsp;&nbsp;&nbsp; Mendukung format XML untuk pertukaran data dengan menggunakan standar metadata MODS (Metadata Object Description Schema).<br />8)&nbsp;&nbsp;&nbsp; Pencetakan Barcode item/kopi koleksi Built-in.<br />9)&nbsp;&nbsp;&nbsp; Pencetakan Label Punggung koleksi Built-in.<br />10)&nbsp;&nbsp;&nbsp; Pengambilan data katalog melalui protokol Z3950 ke database koleksi Library of Congress.<br />11)&nbsp;&nbsp;&nbsp; Pengelolaan koleksi yang hilang, dalam perbaikan, dan rusak serta pencatatan statusnya untuk dilakukan pergantian/perbaikan terhadap koleksi.<br />12)&nbsp;&nbsp;&nbsp; Daftar kendali untuk pengarang (baik pengarang orang, badan/lembaga, dan pertemuan) sebagai standar konsistensi penuliasn<br />13)&nbsp;&nbsp;&nbsp; Pengaturan hak akses pengelolaan data bibliografi hanya untuk staf yang berhak.<br /><br />Modul Penelusuran (OPAC/Online Public Access catalog Module)<br />1)&nbsp;&nbsp;&nbsp; Pencarian sederhana.<br />2)&nbsp;&nbsp;&nbsp; Pencarian tingkat lanjut (Advanced).<br />3)&nbsp;&nbsp;&nbsp; Dukungan penggunaan Boolean\'s Logic dan implementasi CQL (Common Query Language).<br />4)&nbsp;&nbsp;&nbsp; OPAC Web Services berbasis XML.<br />5)&nbsp;&nbsp;&nbsp; Mendukung akses OPAC melalui peralatan portabel (mobile device)<br />6)&nbsp;&nbsp;&nbsp; Menampilkan informasi lengkap tetang status koleksi di perpustakaan, tanggal pengembalian, dan pemesanan item/koleksi<br />7)&nbsp;&nbsp;&nbsp; Detil informasi juga menampilkan gambar sampul buku, lampiran dalam format elektronik yang tersedia (jika ada) serta fasilitas menampilkan koleksi audio dan visual.<br />8)&nbsp;&nbsp;&nbsp; Menyediakan hyperlink tambahan untuk pencarian lanjutan berdasarkan penulis, dan subjek.<br /><br />Modul Sirkulasi (Circulation Module)<br />1)&nbsp;&nbsp;&nbsp; Mampu memproses peminjaman dan pengembalian koleksi secara efisien, efektif dan aman.<br />2)&nbsp;&nbsp;&nbsp; Mendukung fitur reservasi koleksi yang sedang dipinjam, termasuk reminder/pemberitahuan-nya.<br />3)&nbsp;&nbsp;&nbsp; Mendukung fitur manajemen denda. Dilengkapi fleksibilitas untuk pemakai membayar denda secara cicilan.<br />4)&nbsp;&nbsp;&nbsp; Mendukung fitur reminder untuk berbagai keperluan seperti melakukan black list terhadap pemakai yang bermasalah atau habis keanggotaannya.<br />5)&nbsp;&nbsp;&nbsp; Mendukung fitur pengkalenderan (calendaring) untuk diintegrasikan dengan penghitungan masa peminjaman, denda, dan lain-lain.<br />6)&nbsp;&nbsp;&nbsp; Memungkinkan penentuan hari-hari libur non-standar yang spesifik.<br />7)&nbsp;&nbsp;&nbsp; Dukungan terhadap ragam jenis tipe pemakai dengan masa pinjam beragam untuk berbagai jenis keanggotaan.<br />8)&nbsp;&nbsp;&nbsp; Menyimpan histori peminjaman anggota.<br />9)&nbsp;&nbsp;&nbsp; Mendukung pembuatan peraturan peminjaman yang sangat rinci dengan mengkombinasikan parameter keanggotaan, jenis koleksi, dan gmd selain aturan peminjaman standar berdasarkan jenis keanggotaan<br /><br />Modul Manajemen Keanggotaan (Membership Management Module)<br />1)&nbsp;&nbsp;&nbsp; Memungkinkan beragam tipe pemakai dengan ragam jenis kategori peminjaman, ragam jenis keanggotaan dan pembedaan setiap layanan sirkulasi dalam jumlah koleksi serta lama peminjaman untuk jenis koleksi untuk setiap jenis/kategori.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap input menggunakan barcode reader<br />3)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi preferensi pemakai atau subject interest.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi tambahan untuk keperluan reminder pada saat transaksi.<br />5)&nbsp;&nbsp;&nbsp; Memungkinkan menyimpan informasi detail pemakai yang lebih lengkap.<br />6)&nbsp;&nbsp;&nbsp; Pencarian informasi anggota minimal berdasarkan nomor dan nama anggota.<br />7)&nbsp;&nbsp;&nbsp; Pembuatan kartu anggota yang dilengkapi dengan barcode untuk transaksi peminjaman.<br /><br />Modul Inventarisasi Koleksi (Stocktaking Module)<br />1)&nbsp;&nbsp;&nbsp; Proses inventarisasi koleksi bisa dilakukan secara bertahap dan parsial tanpa harus menutup layanan perpustakaan secara keseluruhan.<br />2)&nbsp;&nbsp;&nbsp; Proses inventarisasi bisa dilakukan secara efisien dan efektif.<br />3)&nbsp;&nbsp;&nbsp; Terdapat pilihan untuk menghapus data secara otomatis pada saat akhir proses inventarisasi terhadap koleksi yang dianggap hilang.<br /><br />Modul Statistik/Pelaporan (Report Module)<br />1)&nbsp;&nbsp;&nbsp; Meliputi pelaporan untuk semua modul-modul yang tersedia di Senayan.<br />2)&nbsp;&nbsp;&nbsp; Laporan Judul.<br />3)&nbsp;&nbsp;&nbsp; Laporan Items/Kopi koleksi.<br />4)&nbsp;&nbsp;&nbsp; Laporan Keanggotaan.<br />5)&nbsp;&nbsp;&nbsp; Laporan jumlah koleksi berdasarkan klasifikasi.<br />6)&nbsp;&nbsp;&nbsp; Laporan Keterlambatan.<br />7)&nbsp;&nbsp;&nbsp; Berbagai macam statistik seperti statistik koleksi, peminjaman, keanggotaan, keterpakaian koleksi.<br />8)&nbsp;&nbsp;&nbsp; Tampilan laporan yang sudah didesain printer-friendly, sehingga memudahkan untuk dicetak.<br />9)&nbsp;&nbsp;&nbsp; Filter data yang lengkap untuk setiap laporan.<br />10)&nbsp;&nbsp;&nbsp; API untuk pelaporan yang relatif mudah dipelajari untuk membuat custom report baru.<br /><br />Modul Manajemen Terbitan Berseri (Serial Control)<br />1)&nbsp;&nbsp;&nbsp; Manajemen data langganan.<br />2)&nbsp;&nbsp;&nbsp; Manajemen data Kardex.<br />3)&nbsp;&nbsp;&nbsp; Manajemen tracking data terbitan yang akan terbit dan yang sudah ada.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan tracking data terbitan berseri yang jadwal terbitnya tidak teratur (pengaturan yang fleksibel).<br /><br />Modul Lain-lain<br />1)&nbsp;&nbsp;&nbsp; Dukungan antar muka yang multi bahasa (internasionalisasi) dengan Gettext.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap penggunaan huruf bukan latin untuk pengisian data dan pencarian.</p>','modul_tersedia',NULL,'2010-08-29 04:03:09','2010-08-29 04:05:49','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (7,'Lisensi SLiMS','<p><!--intro_awal--><strong>SLiMS</strong> dilisensikan dibawah GNU/GPL (http://www.gnu.org/licenses/gpl.html) untuk menjamin kebebasan pengguna dalam menggunakannya. GNU General Public License (disingkat GNU GPL atau cukup GPL) merupakan suatu lisensi perangkat lunak bebas yang aslinya ditulis oleh Richard Stallman untuk proyek GNU. Lisensi GPL memberikan penerima salinan perangkat lunak hak dari perangkat lunak bebas dan menggunakan copyleft&nbsp; untuk memastikan kebebasan yang sama diterapkan pada versi berikutnya dari karya tersebut.<!--intro_akhir--></p>\r\n<p>&nbsp;GNU LESSER GENERAL PUBLIC LICENSE<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version 3, 29 June 2007<br /><br />&nbsp;Copyright (C) 2007 Free Software Foundation, Inc. &lt;http://fsf.org/&gt;<br />&nbsp;Everyone is permitted to copy and distribute verbatim copies<br />&nbsp;of this license document, but changing it is not allowed.<br /><br /><br />&nbsp; This version of the GNU Lesser General Public License incorporates<br />the terms and conditions of version 3 of the GNU General Public<br />License, supplemented by the additional permissions listed below.<br /><br />&nbsp; 0. Additional Definitions.<br /><br />&nbsp; As used herein, \"this License\" refers to version 3 of the GNU Lesser<br />General Public License, and the \"GNU GPL\" refers to version 3 of the GNU<br />General Public License.<br /><br />&nbsp; \"The Library\" refers to a covered work governed by this License,<br />other than an Application or a Combined Work as defined below.<br /><br />&nbsp; An \"Application\" is any work that makes use of an interface provided<br />by the Library, but which is not otherwise based on the Library.<br />Defining a subclass of a class defined by the Library is deemed a mode<br />of using an interface provided by the Library.<br /><br />&nbsp; A \"Combined Work\" is a work produced by combining or linking an<br />Application with the Library.&nbsp; The particular version of the Library<br />with which the Combined Work was made is also called the \"Linked<br />Version\".<br /><br />&nbsp; The \"Minimal Corresponding Source\" for a Combined Work means the<br />Corresponding Source for the Combined Work, excluding any source code<br />for portions of the Combined Work that, considered in isolation, are<br />based on the Application, and not on the Linked Version.<br /><br />&nbsp; The \"Corresponding Application Code\" for a Combined Work means the<br />object code and/or source code for the Application, including any data<br />and utility programs needed for reproducing the Combined Work from the<br />Application, but excluding the System Libraries of the Combined Work.<br /><br />&nbsp; 1. Exception to Section 3 of the GNU GPL.<br /><br />&nbsp; You may convey a covered work under sections 3 and 4 of this License<br />without being bound by section 3 of the GNU GPL.<br /><br />&nbsp; 2. Conveying Modified Versions.<br /><br />&nbsp; If you modify a copy of the Library, and, in your modifications, a<br />facility refers to a function or data to be supplied by an Application<br />that uses the facility (other than as an argument passed when the<br />facility is invoked), then you may convey a copy of the modified<br />version:<br /><br />&nbsp;&nbsp; a) under this License, provided that you make a good faith effort to<br />&nbsp;&nbsp; ensure that, in the event an Application does not supply the<br />&nbsp;&nbsp; function or data, the facility still operates, and performs<br />&nbsp;&nbsp; whatever part of its purpose remains meaningful, or<br /><br />&nbsp;&nbsp; b) under the GNU GPL, with none of the additional permissions of<br />&nbsp;&nbsp; this License applicable to that copy.<br /><br />&nbsp; 3. Object Code Incorporating Material from Library Header Files.<br /><br />&nbsp; The object code form of an Application may incorporate material from<br />a header file that is part of the Library.&nbsp; You may convey such object<br />code under terms of your choice, provided that, if the incorporated<br />material is not limited to numerical parameters, data structure<br />layouts and accessors, or small macros, inline functions and templates<br />(ten or fewer lines in length), you do both of the following:<br /><br />&nbsp;&nbsp; a) Give prominent notice with each copy of the object code that the<br />&nbsp;&nbsp; Library is used in it and that the Library and its use are<br />&nbsp;&nbsp; covered by this License.<br /><br />&nbsp;&nbsp; b) Accompany the object code with a copy of the GNU GPL and this license<br />&nbsp;&nbsp; document.<br /><br />&nbsp; 4. Combined Works.<br /><br />&nbsp; You may convey a Combined Work under terms of your choice that,<br />taken together, effectively do not restrict modification of the<br />portions of the Library contained in the Combined Work and reverse<br />engineering for debugging such modifications, if you also do each of<br />the following:<br /><br />&nbsp;&nbsp; a) Give prominent notice with each copy of the Combined Work that<br />&nbsp;&nbsp; the Library is used in it and that the Library and its use are<br />&nbsp;&nbsp; covered by this License.<br /><br />&nbsp;&nbsp; b) Accompany the Combined Work with a copy of the GNU GPL and this license<br />&nbsp;&nbsp; document.<br /><br />&nbsp;&nbsp; c) For a Combined Work that displays copyright notices during<br />&nbsp;&nbsp; execution, include the copyright notice for the Library among<br />&nbsp;&nbsp; these notices, as well as a reference directing the user to the<br />&nbsp;&nbsp; copies of the GNU GPL and this license document.<br /><br />&nbsp;&nbsp; d) Do one of the following:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0) Convey the Minimal Corresponding Source under the terms of this<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; License, and the Corresponding Application Code in a form<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suitable for, and under terms that permit, the user to<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recombine or relink the Application with a modified version of<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the Linked Version to produce a modified Combined Work, in the<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; manner specified by section 6 of the GNU GPL for conveying<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Corresponding Source.<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1) Use a suitable shared library mechanism for linking with the<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Library.&nbsp; A suitable mechanism is one that (a) uses at run time<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a copy of the Library already present on the user\'s computer<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system, and (b) will operate properly with a modified version<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of the Library that is interface-compatible with the Linked<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version.<br /><br />&nbsp;&nbsp; e) Provide Installation Information, but only if you would otherwise<br />&nbsp;&nbsp; be required to provide such information under section 6 of the<br />&nbsp;&nbsp; GNU GPL, and only to the extent that such information is<br />&nbsp;&nbsp; necessary to install and execute a modified version of the<br />&nbsp;&nbsp; Combined Work produced by recombining or relinking the<br />&nbsp;&nbsp; Application with a modified version of the Linked Version. (If<br />&nbsp;&nbsp; you use option 4d0, the Installation Information must accompany<br />&nbsp;&nbsp; the Minimal Corresponding Source and Corresponding Application<br />&nbsp;&nbsp; Code. If you use option 4d1, you must provide the Installation<br />&nbsp;&nbsp; Information in the manner specified by section 6 of the GNU GPL<br />&nbsp;&nbsp; for conveying Corresponding Source.)<br /><br />&nbsp; 5. Combined Libraries.<br /><br />&nbsp; You may place library facilities that are a work based on the<br />Library side by side in a single library together with other library<br />facilities that are not Applications and are not covered by this<br />License, and convey such a combined library under terms of your<br />choice, if you do both of the following:<br /><br />&nbsp;&nbsp; a) Accompany the combined library with a copy of the same work based<br />&nbsp;&nbsp; on the Library, uncombined with any other library facilities,<br />&nbsp;&nbsp; conveyed under the terms of this License.<br /><br />&nbsp;&nbsp; b) Give prominent notice with the combined library that part of it<br />&nbsp;&nbsp; is a work based on the Library, and explaining where to find the<br />&nbsp;&nbsp; accompanying uncombined form of the same work.<br /><br />&nbsp; 6. Revised Versions of the GNU Lesser General Public License.<br /><br />&nbsp; The Free Software Foundation may publish revised and/or new versions<br />of the GNU Lesser General Public License from time to time. Such new<br />versions will be similar in spirit to the present version, but may<br />differ in detail to address new problems or concerns.<br /><br />&nbsp; Each version is given a distinguishing version number. If the<br />Library as you received it specifies that a certain numbered version<br />of the GNU Lesser General Public License \"or any later version\"<br />applies to it, you have the option of following the terms and<br />conditions either of that published version or of any later version<br />published by the Free Software Foundation. If the Library as you<br />received it does not specify a version number of the GNU Lesser<br />General Public License, you may choose any version of the GNU Lesser<br />General Public License ever published by the Free Software Foundation.<br /><br />&nbsp; If the Library as you received it specifies that a proxy can decide<br />whether future versions of the GNU Lesser General Public License shall<br />apply, that proxy\'s public statement of acceptance of any version is<br />permanent authorization for you to choose that version for the<br />Library.</p>','lisensi_slims',NULL,'2010-08-29 04:04:33','2010-11-12 22:15:43','1');
insert  into `content`(`content_id`,`content_title`,`content_desc`,`content_path`,`is_news`,`input_date`,`last_update`,`content_ownpage`) values (8,'Model Pengembangan Open Source','<p><!--intro_awal-->Sumber terbuka (Inggris: open source) adalah sistem pengembangan yang tidak dikoordinasi oleh suatu individu / lembaga pusat, tetapi oleh para pelaku yang bekerja sama dengan memanfaatkan kode sumber (source-code) yang tersebar dan tersedia bebas (biasanya menggunakan fasilitas komunikasi internet). Pola pengembangan ini mengambil model ala bazaar, sehingga pola Open Source ini memiliki ciri bagi komunitasnya yaitu adanya dorongan yang bersumber dari budaya memberi.<!--intro_akhir--><br /><br />Pola Open Source lahir karena kebebasan berkarya, tanpa intervensi berpikir dan mengungkapkan apa yang diinginkan dengan menggunakan pengetahuan dan produk yang cocok. Kebebasan menjadi pertimbangan utama ketika dilepas ke publik. Komunitas yang lain mendapat kebebasan untuk belajar, mengutak-ngatik, merevisi ulang, membenarkan ataupun bahkan menyalahkan, tetapi kebebasan ini juga datang bersama dengan tanggung jawab, bukan bebas tanpa tanggung jawab.<br /><br />Pada intinya konsep sumber terbuka adalah membuka \"kode sumber\" dari sebuah perangkat lunak. Konsep ini terasa aneh pada awalnya dikarenakan kode sumber merupakan kunci dari sebuah perangkat lunak. Dengan diketahui logika yang ada di kode sumber, maka orang lain semestinya dapat membuat perangkat lunak yang sama fungsinya. Sumber terbuka hanya sebatas itu. Artinya, dia tidak harus gratis. Definisi sumber terbuka yang asli adalah seperti tertuang dalam OSD (Open Source Definition)/Definisi sumber terbuka.</p>\r\n<p>Pengembangan Senayan awalnya diinisiasi oleh pengelola Perpustakaan Depdiknas. Tetapi sekarang komunitas pengembang Senayan (Senayan Developer Community) yang lebih banyak mengambil peran dalam mengembangkan Senayan. Beberapa hal dibawah ini merupakan kultur yang dibangun dalam mengembangkan Senayan:<br />1.&nbsp;&nbsp;&nbsp; Meritokrasi. Siapa saja bisa berkontribusi. Mereka yang banyak memberikan kontribusi, akan mendapatkan privilege lebih dibandingkan yang lain.<br />2.&nbsp;&nbsp;&nbsp; Minimal punya concern terhadap pengembangan perpustakaan. Contoh lain: berlatar belakang pendidikan ilmu perpustakaan dan informasi, bekerja di perpustakaan, mengelola perpustakaan, dan lain-lain. Diharapkan dengan kondisi ini, sense of librarianship melekat di tiap developer/pengguna Senayan. Sejauh ini, semua developer senayan merupakan pustakawan atau berlatarbelakang pendidikan kepustakawanan (Information and Librarianship).<br />3.&nbsp;&nbsp;&nbsp; Release early, release often, and listen to your customer. Release early artinya setiap perbaikan dan penambahan fitur, secepat mungkin dirilis ke publik. Diharapkan bugs yang ada, bisa cepat ditemukan oleh komunitas, dilaporkan ke developer, untuk kemudian dirilis perbaikannya. Release often, artinya sesering mungkin memberikan update perbaikan bugs dan penambahan fitur. Ini &ldquo;memaksa&rdquo; developer Senayan untuk terus kreatif menambahkan fitur Senayan. Release often juga membuat pengguna berkeyakinan bahwa Senayan punya sustainability yang baik dan terus aktif dikembangkan. Selain itu, release often juga mempunyai dampak pemasaran. Pengguna dan calon pengguna, selalu diingatkan tentang keberadaan Senayan. Tentunya dengan cara yang elegan, yaitu rilis-rilis Senayan. Sejak dirilis ke publi pertama kali November 2007 sampai Juli 2009 (kurang lebih 20 bulan) telah dirilis 18 rilis resmi Senayan. Listen to your customer. Developer Senayan selalu berusaha mengakomodasi kebutuhan pengguna baik yang masuk melalui report di mailing list, ataupun melalui bugs tracking system. Tentu tidak semua masukan diakomodasi, harus disesuaikan dengan desain dan roadmap pengembangan Senayan.<br />4.&nbsp;&nbsp;&nbsp; Dokumentasi. Developer Senayan meyakini pentingnya dokumentasi yang baik dalam mensukseskan implementasi Senayan dibanyak tempat. Karena itu pengembang Senayan mempunyai tim khusus yang bertanggungjawab yang mengembangkan dokumentasi Senayan agar terus uo-to-date mengikuti rilis terbaru.<br />5.&nbsp;&nbsp;&nbsp; Agar ada percepatan dalam pengembangan dan untuk mengakrabkan antar pengembang Senayan, minimal setahun sekali diadakan Senayan Developers Day yang mengumpulkan para developer Senayan dari berbagai kota, dan melakukan coding bersama-sama.</p>','opensource',NULL,'2010-08-29 04:05:16','2010-08-29 04:34:04','1');

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_title` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8_unicode_ci,
  `file_dir` text COLLATE utf8_unicode_ci,
  `mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_desc` text COLLATE utf8_unicode_ci,
  `uploader_id` int(11) NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  FULLTEXT KEY `file_name` (`file_name`),
  FULLTEXT KEY `file_dir` (`file_dir`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `files` */

/*Table structure for table `fines` */

DROP TABLE IF EXISTS `fines`;

CREATE TABLE `fines` (
  `fines_id` int(11) NOT NULL AUTO_INCREMENT,
  `fines_date` date NOT NULL,
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `debet` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fines_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fines` */

insert  into `fines`(`fines_id`,`fines_date`,`member_id`,`debet`,`credit`,`description`) values (2,'2019-06-04','1',0,0,'Overdue fines for item B00009');

/*Table structure for table `group_access` */

DROP TABLE IF EXISTS `group_access`;

CREATE TABLE `group_access` (
  `group_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `r` int(1) NOT NULL DEFAULT '0',
  `w` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `group_access` */

insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,1,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,2,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,3,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,4,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,5,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,6,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,7,1,1);
insert  into `group_access`(`group_id`,`module_id`,`r`,`w`) values (1,8,1,1);

/*Table structure for table `holiday` */

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_dayname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_date` date DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `holiday_dayname` (`holiday_dayname`,`holiday_date`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `holiday` */

insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (1,'Mon','2009-06-01','Tes Libur');
insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (2,'Tue','2009-06-02','Tes Libur');
insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (3,'Wed','2009-06-03','Tes Libur');
insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (4,'Thu','2009-06-04','Tes Libur');
insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (5,'Fri','2009-06-05','Tes Libur');
insert  into `holiday`(`holiday_id`,`holiday_dayname`,`holiday_date`,`description`) values (6,'Sat','2009-06-06','Tes Libur');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` int(11) DEFAULT NULL,
  `call_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coll_type_id` int(3) DEFAULT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inventory_code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `supplier_id` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `item_status_id` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` int(1) NOT NULL DEFAULT '0',
  `invoice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_currency` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `uid` (`uid`),
  KEY `item_references_idx` (`coll_type_id`,`location_id`,`item_status_id`),
  KEY `biblio_id_idx` (`biblio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `item` */

insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (1,8,NULL,1,'B00001','INV/B00001','0000-00-00','0','','SL','0000-00-00','0','',1,'',500000,'Rupiah','0000-00-00','2008-12-26 22:11:10','2008-12-26 22:14:13',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (2,6,NULL,1,'B00002','INV/B00002','0000-00-00','0','','SL','0000-00-00','0','',1,'',700000,'Rupiah','0000-00-00','2008-12-26 22:11:45','2008-12-26 22:13:45',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (3,15,NULL,1,'B00003','INV/B00003','0000-00-00','0','','SL','0000-00-00','0','',1,'',300000,'Rupiah','0000-00-00','2008-12-26 22:15:09','2008-12-26 22:15:09',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (4,14,NULL,1,'B00004','INV/B00004','0000-00-00','0','','SL','0000-00-00','0','',1,'',250000,'Rupiah','0000-00-00','2008-12-26 22:15:49','2008-12-26 22:15:49',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (5,13,NULL,1,'B00005','INV/B00005','0000-00-00','0','','SL','0000-00-00','0','',2,'',0,NULL,'0000-00-00','2008-12-26 22:17:04','2008-12-26 22:17:04',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (6,12,NULL,1,'B00006','INV/B00006','0000-00-00','0','','SL','0000-00-00','0','',1,'',350000,'Rupiah','0000-00-00','2008-12-26 22:17:52','2008-12-26 22:17:52',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (7,4,NULL,1,'B00007','INV/B00007','0000-00-00','0','','SL','0000-00-00','0','',1,'',450000,'Rupiah','0000-00-00','2008-12-26 22:18:29','2008-12-26 22:18:29',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (8,4,NULL,1,'B00008','INV/B00008','0000-00-00','0','','SL','0000-00-00','0','',2,'',0,NULL,'0000-00-00','2008-12-26 22:18:51','2008-12-26 22:18:51',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (9,2,NULL,1,'B00009','INV/B00009','0000-00-00','0','','SL','0000-00-00','0','',1,'',630000,'Rupiah','0000-00-00','2008-12-26 22:19:28','2008-12-26 22:19:28',NULL);
insert  into `item`(`item_id`,`biblio_id`,`call_number`,`coll_type_id`,`item_code`,`inventory_code`,`received_date`,`supplier_id`,`order_no`,`location_id`,`order_date`,`item_status_id`,`site`,`source`,`invoice`,`price`,`price_currency`,`invoice_date`,`input_date`,`last_update`,`uid`) values (10,2,NULL,1,'B00010','INV/B00010','0000-00-00','0','','SL','0000-00-00','0','',1,'',630000,'Rupiah','0000-00-00','2008-12-26 22:19:57','2008-12-26 22:19:57',NULL);

/*Table structure for table `kardex` */

DROP TABLE IF EXISTS `kardex`;

CREATE TABLE `kardex` (
  `kardex_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_expected` date NOT NULL,
  `date_received` date DEFAULT NULL,
  `seq_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `serial_id` int(11) DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`kardex_id`),
  KEY `fk_serial` (`serial_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `kardex` */

/*Table structure for table `loan` */

DROP TABLE IF EXISTS `loan`;

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `renewed` int(11) NOT NULL DEFAULT '0',
  `loan_rules_id` int(11) NOT NULL DEFAULT '0',
  `actual` date DEFAULT NULL,
  `is_lent` int(11) NOT NULL DEFAULT '0',
  `is_return` int(11) NOT NULL DEFAULT '0',
  `return_date` date DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `item_code` (`item_code`),
  KEY `member_id` (`member_id`),
  KEY `input_date` (`input_date`,`last_update`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `loan` */

insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (1,'B00010','1','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 10:57:24','2019-06-04 11:01:50',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (2,'B00009','1','2019-06-04','2019-06-11',1,0,NULL,1,1,'2019-06-04','2019-06-04 11:08:13','2019-06-04 15:40:18',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (3,'B00007','1','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 11:44:16','2019-06-04 14:06:22',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (4,'B00007','3','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 14:10:27','2019-06-04 14:11:54',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (5,'B00007','3','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 14:12:41','2019-06-04 14:12:49',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (6,'B00007','2','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 14:13:29','2019-06-04 15:40:28',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (7,'B00010','1','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 15:40:21','2019-06-04 17:06:37',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (8,'B00010','1','2019-06-04','2019-06-11',0,0,NULL,1,1,'2019-06-04','2019-06-04 17:29:07','2019-06-04 17:33:05',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (9,'B00007','1','2019-06-04','2019-06-11',1,0,NULL,1,1,'2019-06-04','2019-06-04 17:34:38','2019-06-04 20:33:58',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (10,'B00010','1','2019-06-04','2019-06-11',0,0,NULL,1,0,NULL,'2019-06-04 20:36:14','2019-06-04 20:36:14',1);
insert  into `loan`(`loan_id`,`item_code`,`member_id`,`loan_date`,`due_date`,`renewed`,`loan_rules_id`,`actual`,`is_lent`,`is_return`,`return_date`,`input_date`,`last_update`,`uid`) values (11,'B00009','2','2019-06-04','2019-06-11',0,0,NULL,1,0,NULL,'2019-06-04 20:36:51','2019-06-04 20:36:51',1);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `member_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(1) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `member_type_id` int(6) DEFAULT NULL,
  `member_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_mail_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inst_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_new` int(1) DEFAULT NULL,
  `member_image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_since_date` date DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `member_notes` text COLLATE utf8_unicode_ci,
  `is_pending` smallint(1) NOT NULL DEFAULT '0',
  `mpasswd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`),
  KEY `member_type_id` (`member_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `member` */

insert  into `member`(`member_id`,`member_name`,`gender`,`birth_date`,`member_type_id`,`member_address`,`member_mail_address`,`member_email`,`postal_code`,`inst_name`,`is_new`,`member_image`,`pin`,`member_phone`,`member_fax`,`member_since_date`,`register_date`,`expire_date`,`member_notes`,`is_pending`,`mpasswd`,`last_login`,`last_login_ip`,`input_date`,`last_update`) values ('1','Aziz Arif Rizaldi',1,'1997-11-08',1,'','','','','Azma',NULL,'member_1.jpg','','','','2019-06-03','2019-06-03','2020-06-02','',0,'$2y$10$yxhiJAXctfFbi40A0fqt3.pmJIj.llYtBHIdm4rN17UdCtwSIKMEa','2019-06-04 11:16:48','::1','2019-06-03','2019-06-04');
insert  into `member`(`member_id`,`member_name`,`gender`,`birth_date`,`member_type_id`,`member_address`,`member_mail_address`,`member_email`,`postal_code`,`inst_name`,`is_new`,`member_image`,`pin`,`member_phone`,`member_fax`,`member_since_date`,`register_date`,`expire_date`,`member_notes`,`is_pending`,`mpasswd`,`last_login`,`last_login_ip`,`input_date`,`last_update`) values ('2','Cecep Rokani',1,NULL,1,'','','cecepfahriazal@gmail.com','','',NULL,NULL,'','','','2019-06-04','2019-06-04','2020-06-03','',0,'$2y$10$SoZM3IQdsjvZ6q4d18Lo8uHGVdFQOvAZ8cSHukC0s0isKQswIAnjy','2019-06-04 14:05:34','::1','2019-06-04','2019-06-04');
insert  into `member`(`member_id`,`member_name`,`gender`,`birth_date`,`member_type_id`,`member_address`,`member_mail_address`,`member_email`,`postal_code`,`inst_name`,`is_new`,`member_image`,`pin`,`member_phone`,`member_fax`,`member_since_date`,`register_date`,`expire_date`,`member_notes`,`is_pending`,`mpasswd`,`last_login`,`last_login_ip`,`input_date`,`last_update`) values ('3','Gema Aji Wardian',0,NULL,1,'','','cecepfahriazal@gmail.com','','',NULL,NULL,'','','','2019-06-04','2019-06-04','2020-06-03','',0,'$2y$10$kd7JgWSPho6ew3EcNiolJe0MiyAbdXvOiN9wmwoo9o6yy9bV2/PnK',NULL,NULL,'2019-06-04','2019-06-04');
insert  into `member`(`member_id`,`member_name`,`gender`,`birth_date`,`member_type_id`,`member_address`,`member_mail_address`,`member_email`,`postal_code`,`inst_name`,`is_new`,`member_image`,`pin`,`member_phone`,`member_fax`,`member_since_date`,`register_date`,`expire_date`,`member_notes`,`is_pending`,`mpasswd`,`last_login`,`last_login_ip`,`input_date`,`last_update`) values ('4','Beti Rahmawati',0,NULL,1,'','','','','',NULL,NULL,'','','','2019-06-04','2019-06-04','2020-06-03','',0,'$2y$10$7Tyyp8cFpJ82Nbs/RSqt/.Ovdh27xpN5HpZjqE8llwkUldVr6x5NG',NULL,NULL,'2019-06-04','2019-06-04');

/*Table structure for table `member_custom` */

DROP TABLE IF EXISTS `member_custom`;

CREATE TABLE `member_custom` (
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one to one relation with real member table';

/*Data for the table `member_custom` */

/*Table structure for table `mst_author` */

DROP TABLE IF EXISTS `mst_author`;

CREATE TABLE `mst_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `author_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authority_type` enum('p','o','c') COLLATE utf8_unicode_ci DEFAULT 'p',
  `auth_list` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_name` (`author_name`,`authority_type`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_author` */

insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (1,'Valade, Janet',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (2,'Siever, Ellen',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (3,'Love, Robert',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (4,'Robbins, Arnold',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (5,'Figgins, Stephen',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (6,'Weber, Aaron',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (7,'Kofler, Michael',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (8,'Kramer, David',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (9,'Raymond, Eric',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (10,'Fogel, Karl',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (11,'Douglas, Korry',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (12,'Douglas, Susan',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (13,'Shklar, Leon',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (14,'Rosen, Richard',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (15,'Woychowsky, Edmond',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (16,'Taylor, Arlene G.',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (17,'Stueart, Robert D.',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (18,'Moran, Barbara B.',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (19,'Morville, Peter',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (20,'Rosenfeld, Louis',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (21,'Robinson, Mark',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (22,'Bracking, Sarah',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (23,'Huffington, Arianna Stassinopoulos',NULL,'p',NULL,'2007-11-29','2007-11-29');
insert  into `mst_author`(`author_id`,`author_name`,`author_year`,`authority_type`,`auth_list`,`input_date`,`last_update`) values (24,'Hancock, Graham',NULL,'p',NULL,'2007-11-29','2007-11-29');

/*Table structure for table `mst_carrier_type` */

DROP TABLE IF EXISTS `mst_carrier_type`;

CREATE TABLE `mst_carrier_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `code2` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`carrier_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_carrier_type` */

insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (1,'audio cartridge','sg','g','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (2,'audio cylinder','se','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (3,'audio disc','sd','d','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (4,'sound track reel','si','i','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (5,'audio roll','sq','q','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (6,'audiocassette','ss','s','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (7,'audiotape reel','st','t','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (8,'other (audio)','sz','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (9,'computer card','ck','k','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (10,'computer chip cartridge','cb','b','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (11,'computer disc','cd','d','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (12,'computer disc cartridge','ce','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (13,'computer tape cartridge','ca','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (14,'computer tape cassette','cf','f','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (15,'computer tape reel','ch','h','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (16,'online resource','cr','r','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (17,'other (computer)','cz','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (18,'aperture card','ha','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (19,'microfiche','he','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (20,'microfiche cassette','hf','f','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (21,'microfilm cartridge','hb','b','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (22,'microfilm cassette','hc','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (23,'microfilm reel','hd','d','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (24,'microfilm roll','hj','j','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (25,'microfilm slip','hh','h','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (26,'microopaque','hg','g','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (27,'other (microform)','hz','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (28,'microscope slide','pp','p','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (29,'other (microscope)','pz','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (30,'film cartridge','mc','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (31,'film cassette','mf','f','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (32,'film reel','mr','r','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (33,'film roll','mo','o','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (34,'filmslip','gd','d','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (35,'filmstrip','gf','f','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (36,'filmstrip cartridge','gc','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (37,'overhead transparency','gt','t','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (38,'slide','gs','s','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (39,'other (projected image)','mz','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (40,'stereograph card','eh','h','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (41,'stereograph disc','es','s','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (42,'other (stereographic)','ez','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (43,'card','no','o','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (44,'flipchart','nn','n','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (45,'roll','na','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (46,'sheet','nb','b','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (47,'volume','nc','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (48,'object','nr','r','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (49,'other (unmediated)','nz','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (50,'video cartridge','vc','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (51,'videocassette','vf','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (52,'videodisc','vd','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (53,'videotape reel','vr','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (54,'other (video)','vz','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_carrier_type`(`id`,`carrier_type`,`code`,`code2`,`input_date`,`last_update`) values (55,'unspecified','zu','u','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `mst_coll_type` */

DROP TABLE IF EXISTS `mst_coll_type`;

CREATE TABLE `mst_coll_type` (
  `coll_type_id` int(3) NOT NULL AUTO_INCREMENT,
  `coll_type_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`coll_type_id`),
  UNIQUE KEY `coll_type_name` (`coll_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_coll_type` */

insert  into `mst_coll_type`(`coll_type_id`,`coll_type_name`,`input_date`,`last_update`) values (1,'Reference','2007-11-29','2007-11-29');
insert  into `mst_coll_type`(`coll_type_id`,`coll_type_name`,`input_date`,`last_update`) values (2,'Textbook','2007-11-29','2007-11-29');
insert  into `mst_coll_type`(`coll_type_id`,`coll_type_name`,`input_date`,`last_update`) values (3,'Fiction','2007-11-29','2007-11-29');

/*Table structure for table `mst_content_type` */

DROP TABLE IF EXISTS `mst_content_type`;

CREATE TABLE `mst_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `code2` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type` (`content_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_content_type` */

insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (1,'cartographic dataset','crd','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (2,'cartographic image','cri','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (3,'cartographic moving image','crm','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (4,'cartographic tactile image','crt','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (5,'cartographic tactile three-dimensional form','crn','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (6,'cartographic three-dimensional form','crf','e','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (7,'computer dataset','cod','m','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (8,'computer program','cop','m','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (9,'notated movement','ntv','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (10,'notated music','ntm','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (11,'performed music','prm','j','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (12,'sounds','snd','i','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (13,'spoken word','spw','i','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (14,'still image','sti','k','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (15,'tactile image','tci','k','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (16,'tactile notated music','tcm','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (17,'tactile notated movement','tcn','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (18,'tactile text','tct','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (19,'tactile three-dimensional form','tcf','r','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (20,'text','txt','a','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (21,'three-dimensional form','tdf','r','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (22,'three-dimensional moving image','tdm','g','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (23,'two-dimensional moving image','tdi','g','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (24,'other','xxx','o','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_content_type`(`id`,`content_type`,`code`,`code2`,`input_date`,`last_update`) values (25,'unspecified','zzz','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `mst_frequency` */

DROP TABLE IF EXISTS `mst_frequency`;

CREATE TABLE `mst_frequency` (
  `frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `language_prefix` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_increment` smallint(6) DEFAULT NULL,
  `time_unit` enum('day','week','month','year') COLLATE utf8_unicode_ci DEFAULT 'day',
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`frequency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_frequency` */

insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (1,'Weekly','en',1,'week','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (2,'Bi-weekly','en',2,'week','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (3,'Fourth-Nightly','en',14,'day','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (4,'Monthly','en',1,'month','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (5,'Bi-Monthly','en',2,'month','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (6,'Quarterly','en',3,'month','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (7,'3 Times a Year','en',4,'month','2009-05-23','2009-05-23');
insert  into `mst_frequency`(`frequency_id`,`frequency`,`language_prefix`,`time_increment`,`time_unit`,`input_date`,`last_update`) values (8,'Annualy','en',1,'year','2009-05-23','2009-05-23');

/*Table structure for table `mst_gmd` */

DROP TABLE IF EXISTS `mst_gmd`;

CREATE TABLE `mst_gmd` (
  `gmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `gmd_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmd_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `icon_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`gmd_id`),
  UNIQUE KEY `gmd_name` (`gmd_name`),
  UNIQUE KEY `gmd_code` (`gmd_code`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_gmd` */

insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (1,'TE','Text',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (2,'AR','Art Original',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (3,'CH','Chart',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (4,'CO','Computer Software',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (5,'DI','Diorama',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (6,'FI','Filmstrip',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (7,'FL','Flash Card',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (8,'GA','Game',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (9,'GL','Globe',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (10,'KI','Kit',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (11,'MA','Map',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (12,'MI','Microform',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (13,'MN','Manuscript',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (14,'MO','Model',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (15,'MP','Motion Picture',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (16,'MS','Microscope Slide',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (17,'MU','Music',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (18,'PI','Picture',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (19,'RE','Realia',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (20,'SL','Slide',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (21,'SO','Sound Recording',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (22,'TD','Technical Drawing',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (23,'TR','Transparency',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (24,'VI','Video Recording',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (25,'EQ','Equipment',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (26,'CF','Computer File',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (27,'CA','Cartographic Material',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (28,'CD','CD-ROM',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (29,'MV','Multimedia',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (30,'ER','Electronic Resource',NULL,'2019-06-03','2019-06-03');
insert  into `mst_gmd`(`gmd_id`,`gmd_code`,`gmd_name`,`icon_image`,`input_date`,`last_update`) values (31,'DVD','Digital Versatile Disc',NULL,'2019-06-03','2019-06-03');

/*Table structure for table `mst_item_status` */

DROP TABLE IF EXISTS `mst_item_status`;

CREATE TABLE `mst_item_status` (
  `item_status_id` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `item_status_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `rules` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_loan` smallint(1) NOT NULL DEFAULT '0',
  `skip_stock_take` smallint(1) NOT NULL DEFAULT '0',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`item_status_id`),
  UNIQUE KEY `item_status_name` (`item_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_item_status` */

insert  into `mst_item_status`(`item_status_id`,`item_status_name`,`rules`,`no_loan`,`skip_stock_take`,`input_date`,`last_update`) values ('R','Repair','a:1:{i:0;s:1:\"1\";}',1,0,'2019-06-03','2019-06-03');
insert  into `mst_item_status`(`item_status_id`,`item_status_name`,`rules`,`no_loan`,`skip_stock_take`,`input_date`,`last_update`) values ('NL','No Loan','a:1:{i:0;s:1:\"1\";}',1,0,'2019-06-03','2019-06-03');
insert  into `mst_item_status`(`item_status_id`,`item_status_name`,`rules`,`no_loan`,`skip_stock_take`,`input_date`,`last_update`) values ('MIS','Missing',NULL,1,1,'2019-06-03','2019-06-03');

/*Table structure for table `mst_label` */

DROP TABLE IF EXISTS `mst_label`;

CREATE TABLE `mst_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `label_desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `mst_label` */

insert  into `mst_label`(`label_id`,`label_name`,`label_desc`,`label_image`,`input_date`,`last_update`) values (1,'label-new','New Title','label-new.png','2019-06-03','2019-06-03');
insert  into `mst_label`(`label_id`,`label_name`,`label_desc`,`label_image`,`input_date`,`last_update`) values (2,'label-favorite','Favorite Title','label-favorite.png','2019-06-03','2019-06-03');
insert  into `mst_label`(`label_id`,`label_name`,`label_desc`,`label_image`,`input_date`,`last_update`) values (3,'label-multimedia','Multimedia','label-multimedia.png','2019-06-03','2019-06-03');

/*Table structure for table `mst_language` */

DROP TABLE IF EXISTS `mst_language`;

CREATE TABLE `mst_language` (
  `language_id` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `language_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_language` */

insert  into `mst_language`(`language_id`,`language_name`,`input_date`,`last_update`) values ('id','Indonesia','2019-06-03','2019-06-03');
insert  into `mst_language`(`language_id`,`language_name`,`input_date`,`last_update`) values ('en','English','2019-06-03','2019-06-03');

/*Table structure for table `mst_loan_rules` */

DROP TABLE IF EXISTS `mst_loan_rules`;

CREATE TABLE `mst_loan_rules` (
  `loan_rules_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_type_id` int(11) NOT NULL DEFAULT '0',
  `coll_type_id` int(11) DEFAULT '0',
  `gmd_id` int(11) DEFAULT '0',
  `loan_limit` int(3) DEFAULT '0',
  `loan_periode` int(3) DEFAULT '0',
  `reborrow_limit` int(3) DEFAULT '0',
  `fine_each_day` int(3) DEFAULT '0',
  `grace_periode` int(2) DEFAULT '0',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`loan_rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_loan_rules` */

/*Table structure for table `mst_location` */

DROP TABLE IF EXISTS `mst_location`;

CREATE TABLE `mst_location` (
  `location_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `location_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_name` (`location_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_location` */

insert  into `mst_location`(`location_id`,`location_name`,`input_date`,`last_update`) values ('SL','My Library','2019-06-03','2019-06-03');

/*Table structure for table `mst_media_type` */

DROP TABLE IF EXISTS `mst_media_type`;

CREATE TABLE `mst_media_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `code2` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`media_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_media_type` */

insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (1,'audio','s','s','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (2,'computer','c','c','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (3,'microform','h','h','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (4,'microscopic','p','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (5,'projected','g','g','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (6,'stereographic','e','','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (7,'unmediated','n','t','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (8,'video','v','v','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (9,'other','x','z','0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `mst_media_type`(`id`,`media_type`,`code`,`code2`,`input_date`,`last_update`) values (10,'unspecified','z','z','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `mst_member_type` */

DROP TABLE IF EXISTS `mst_member_type`;

CREATE TABLE `mst_member_type` (
  `member_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loan_limit` int(11) NOT NULL,
  `loan_periode` int(11) NOT NULL,
  `enable_reserve` int(1) NOT NULL DEFAULT '0',
  `reserve_limit` int(11) NOT NULL DEFAULT '0',
  `member_periode` int(11) NOT NULL,
  `reborrow_limit` int(11) NOT NULL,
  `fine_each_day` int(11) NOT NULL,
  `grace_periode` int(2) DEFAULT '0',
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`member_type_id`),
  UNIQUE KEY `member_type_name` (`member_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_member_type` */

insert  into `mst_member_type`(`member_type_id`,`member_type_name`,`loan_limit`,`loan_periode`,`enable_reserve`,`reserve_limit`,`member_periode`,`reborrow_limit`,`fine_each_day`,`grace_periode`,`input_date`,`last_update`) values (1,'Standard',2,7,1,2,365,1,0,0,'2019-06-03','2019-06-03');

/*Table structure for table `mst_module` */

DROP TABLE IF EXISTS `mst_module`;

CREATE TABLE `mst_module` (
  `module_id` int(3) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `module_path` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`,`module_path`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `mst_module` */

insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (1,'bibliography','bibliography','Manage your bibliographic/catalog and items/copies database');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (2,'circulation','circulation','Module for doing library items circulation such as loan and return');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (3,'membership','membership','Manage your library membership and membership type');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (4,'master_file','master_file','Manage your referential data that will be used by other modules');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (5,'stock_take','stock_take','Ease your pain in doing library stock opname process');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (6,'system','system','Configure system behaviour, user and backups');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (7,'reporting','reporting','Real time and dynamic report about library collections and circulation');
insert  into `mst_module`(`module_id`,`module_name`,`module_path`,`module_desc`) values (8,'serial_control','serial_control','Serial publication management');

/*Table structure for table `mst_place` */

DROP TABLE IF EXISTS `mst_place`;

CREATE TABLE `mst_place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  UNIQUE KEY `place_name` (`place_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_place` */

insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (1,'Hoboken, NJ','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (2,'Sebastopol, CA','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (3,'Indianapolis','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (4,'Upper Saddle River, NJ','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (5,'Westport, Conn.','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (6,'Cambridge, Mass','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (7,'London','2007-11-29','2007-11-29');
insert  into `mst_place`(`place_id`,`place_name`,`input_date`,`last_update`) values (8,'New York','2007-11-29','2007-11-29');

/*Table structure for table `mst_publisher` */

DROP TABLE IF EXISTS `mst_publisher`;

CREATE TABLE `mst_publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_name` (`publisher_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_publisher` */

insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (1,'Wiley','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (2,'OReilly','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (3,'Apress','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (4,'Sams','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (5,'John Wiley','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (6,'Prentice Hall','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (7,'Libraries Unlimited','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (8,'Taylor & Francis Inc.','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (9,'Palgrave Macmillan','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (10,'Crown publishers','2007-11-29','2007-11-29');
insert  into `mst_publisher`(`publisher_id`,`publisher_name`,`input_date`,`last_update`) values (11,'Atlantic Monthly Press','2007-11-29','2007-11-29');

/*Table structure for table `mst_relation_term` */

DROP TABLE IF EXISTS `mst_relation_term`;

CREATE TABLE `mst_relation_term` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `rt_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rt_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_relation_term` */

insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (1,'U','Use');
insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (2,'UF','Use For');
insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (3,'BT','Broader Term');
insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (4,'NT','Narrower Term');
insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (5,'RT','Related Term');
insert  into `mst_relation_term`(`ID`,`rt_id`,`rt_desc`) values (6,'SA','See Also');

/*Table structure for table `mst_servers` */

DROP TABLE IF EXISTS `mst_servers`;

CREATE TABLE `mst_servers` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uri` text COLLATE utf8_unicode_ci NOT NULL,
  `server_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - p2p server; 2 - z3950; 3 - z3950  SRU',
  `input_date` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_servers` */

/*Table structure for table `mst_supplier` */

DROP TABLE IF EXISTS `mst_supplier`;

CREATE TABLE `mst_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` char(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_mail` char(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_name` (`supplier_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_supplier` */

/*Table structure for table `mst_topic` */

DROP TABLE IF EXISTS `mst_topic`;

CREATE TABLE `mst_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `topic_type` enum('t','g','n','tm','gr','oc') COLLATE utf8_unicode_ci NOT NULL,
  `auth_list` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classification` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Classification Code',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_type`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_topic` */

insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (1,'Programming','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (2,'Website','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (3,'Operating System','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (4,'Linux','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (5,'Computer','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (6,'Database','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (7,'RDBMS','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (8,'Open Source','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (9,'Project','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (10,'Design','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (11,'Information','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (12,'Organization','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (13,'Metadata','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (14,'Library','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (15,'Corruption','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (16,'Development','t',NULL,'','2007-11-29','2007-11-29');
insert  into `mst_topic`(`topic_id`,`topic`,`topic_type`,`auth_list`,`classification`,`input_date`,`last_update`) values (17,'Poverty','t',NULL,'','2007-11-29','2007-11-29');

/*Table structure for table `mst_voc_ctrl` */

DROP TABLE IF EXISTS `mst_voc_ctrl`;

CREATE TABLE `mst_voc_ctrl` (
  `vocabolary_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `rt_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `related_topic_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`vocabolary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mst_voc_ctrl` */

/*Table structure for table `reserve` */

DROP TABLE IF EXISTS `reserve`;

CREATE TABLE `reserve` (
  `reserve_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `biblio_id` int(11) NOT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reserve_date` datetime NOT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `references_idx` (`member_id`,`biblio_id`),
  KEY `item_code_idx` (`item_code`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reserve` */

insert  into `reserve`(`reserve_id`,`member_id`,`biblio_id`,`item_code`,`reserve_date`) values (6,'2',2,'B00010','2019-06-04 15:48:49');
insert  into `reserve`(`reserve_id`,`member_id`,`biblio_id`,`item_code`,`reserve_date`) values (7,'3',2,'B00010','2019-06-04 15:48:59');
insert  into `reserve`(`reserve_id`,`member_id`,`biblio_id`,`item_code`,`reserve_date`) values (8,'4',2,'B00010','2019-06-04 10:50:01');

/*Table structure for table `search_biblio` */

DROP TABLE IF EXISTS `search_biblio`;

CREATE TABLE `search_biblio` (
  `biblio_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `edition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn_issn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` text COLLATE utf8_unicode_ci,
  `topic` text COLLATE utf8_unicode_ci,
  `gmd` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_place` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classification` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spec_detail_info` text COLLATE utf8_unicode_ci,
  `carrier_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `media_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `publish_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `series_title` text COLLATE utf8_unicode_ci,
  `items` text COLLATE utf8_unicode_ci,
  `collection_types` text COLLATE utf8_unicode_ci,
  `call_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opac_hide` smallint(1) NOT NULL DEFAULT '0',
  `promoted` smallint(1) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `collation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  UNIQUE KEY `biblio_id` (`biblio_id`),
  KEY `add_indexes` (`gmd`,`publisher`,`publish_place`,`language`,`classification`,`publish_year`,`call_number`),
  KEY `add_indexes2` (`opac_hide`,`promoted`),
  KEY `rda_indexes` (`carrier_type`,`media_type`,`content_type`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `author` (`author`),
  FULLTEXT KEY `topic` (`topic`),
  FULLTEXT KEY `location` (`location`),
  FULLTEXT KEY `items` (`items`),
  FULLTEXT KEY `collection_types` (`collection_types`),
  FULLTEXT KEY `labels` (`labels`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='index table for advance searching technique for SLiMS';

/*Data for the table `search_biblio` */

insert  into `search_biblio`(`biblio_id`,`title`,`edition`,`isbn_issn`,`author`,`topic`,`gmd`,`publisher`,`publish_place`,`language`,`classification`,`spec_detail_info`,`carrier_type`,`content_type`,`media_type`,`location`,`publish_year`,`notes`,`series_title`,`items`,`collection_types`,`call_number`,`opac_hide`,`promoted`,`labels`,`collation`,`image`,`input_date`,`last_update`) values (6,'PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases','1st ed.','0735712573','Douglas, Korry - Douglas, Susan','Programming - RDBMS','Text','Sams','Indianapolis','English','005.75/85 22','','','','','My Library','2003','PostgreSQL is the world\'s most advanced open-source database. PostgreSQL is the most comprehensive, in-depth, and easy-to-read guide to this award-winning database. This book starts with a thorough overview of SQL, a description of all PostgreSQL data types, and a complete explanation of PostgreSQL commands.','DeveloperÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢s library','B00002','Reference','005.75/85-22 Kor p',0,0,NULL,'xvii, 790 p. : ill. ; 23cm.','postgresql.jpg','2007-11-29 16:29:33','2019-06-03 14:19:29');

/*Table structure for table `serial` */

DROP TABLE IF EXISTS `serial`;

CREATE TABLE `serial` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `period` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `biblio_id` int(11) DEFAULT NULL,
  `gmd_id` int(11) DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`serial_id`),
  KEY `fk_serial_biblio` (`biblio_id`),
  KEY `fk_serial_gmd` (`gmd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `serial` */

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `setting_id` int(3) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `setting` */

insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (1,'library_name','s:7:\"Senayan\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (2,'library_subname','s:37:\"Open Source Library Management System\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (3,'template','a:2:{s:5:\"theme\";s:7:\"default\";s:3:\"css\";s:26:\"template/default/style.css\";}');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (4,'admin_template','a:2:{s:5:\"theme\";s:7:\"default\";s:3:\"css\";s:32:\"admin_template/default/style.css\";}');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (5,'default_lang','s:5:\"id_ID\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (6,'opac_result_num','s:2:\"10\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (7,'enable_promote_titles','N;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (8,'quick_return','b:1;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (9,'allow_loan_date_change','b:0;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (10,'loan_limit_override','b:0;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (11,'enable_xml_detail','b:1;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (12,'enable_xml_result','b:1;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (13,'allow_file_download','b:1;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (14,'session_timeout','s:4:\"7200\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (15,'circulation_receipt','b:0;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (16,'barcode_encoding','s:7:\"code128\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (17,'ignore_holidays_fine_calc','b:0;');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (18,'barcode_print_settings','a:12:{s:19:\"barcode_page_margin\";d:0.200000000000000011102230246251565404236316680908203125;s:21:\"barcode_items_per_row\";i:3;s:20:\"barcode_items_margin\";d:0.1000000000000000055511151231257827021181583404541015625;s:17:\"barcode_box_width\";i:7;s:18:\"barcode_box_height\";i:5;s:27:\"barcode_include_header_text\";i:1;s:17:\"barcode_cut_title\";i:50;s:19:\"barcode_header_text\";s:0:\"\";s:13:\"barcode_fonts\";s:41:\"Arial, Verdana, Helvetica, \'Trebuchet MS\'\";s:17:\"barcode_font_size\";i:11;s:13:\"barcode_scale\";i:70;s:19:\"barcode_border_size\";i:1;}');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (19,'label_print_settings','a:10:{s:11:\"page_margin\";d:0.200000000000000011102230246251565404236316680908203125;s:13:\"items_per_row\";i:3;s:12:\"items_margin\";d:0.05000000000000000277555756156289135105907917022705078125;s:9:\"box_width\";i:8;s:10:\"box_height\";d:3.29999999999999982236431605997495353221893310546875;s:19:\"include_header_text\";i:1;s:11:\"header_text\";s:0:\"\";s:5:\"fonts\";s:41:\"Arial, Verdana, Helvetica, \'Trebuchet MS\'\";s:9:\"font_size\";i:11;s:11:\"border_size\";i:1;}');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (20,'membercard_print_settings','a:1:{s:5:\"print\";a:1:{s:10:\"membercard\";a:61:{s:11:\"card_factor\";s:12:\"37.795275591\";s:21:\"card_include_id_label\";i:1;s:23:\"card_include_name_label\";i:1;s:22:\"card_include_pin_label\";i:1;s:23:\"card_include_inst_label\";i:0;s:24:\"card_include_email_label\";i:0;s:26:\"card_include_address_label\";i:1;s:26:\"card_include_barcode_label\";i:1;s:26:\"card_include_expired_label\";i:1;s:14:\"card_box_width\";d:8.5999999999999996447286321199499070644378662109375;s:15:\"card_box_height\";d:5.4000000000000003552713678800500929355621337890625;s:9:\"card_logo\";s:8:\"logo.png\";s:21:\"card_front_logo_width\";s:0:\"\";s:22:\"card_front_logo_height\";s:0:\"\";s:20:\"card_front_logo_left\";s:0:\"\";s:19:\"card_front_logo_top\";s:0:\"\";s:20:\"card_back_logo_width\";s:0:\"\";s:21:\"card_back_logo_height\";s:0:\"\";s:19:\"card_back_logo_left\";s:0:\"\";s:18:\"card_back_logo_top\";s:0:\"\";s:15:\"card_photo_left\";s:0:\"\";s:14:\"card_photo_top\";s:0:\"\";s:16:\"card_photo_width\";d:1.5;s:17:\"card_photo_height\";d:1.8000000000000000444089209850062616169452667236328125;s:23:\"card_front_header1_text\";s:19:\"Library Member Card\";s:28:\"card_front_header1_font_size\";s:2:\"12\";s:23:\"card_front_header2_text\";s:10:\"My Library\";s:28:\"card_front_header2_font_size\";s:2:\"12\";s:22:\"card_back_header1_text\";s:10:\"My Library\";s:27:\"card_back_header1_font_size\";s:2:\"12\";s:22:\"card_back_header2_text\";s:35:\"My Library Full Address and Website\";s:27:\"card_back_header2_font_size\";s:1:\"5\";s:17:\"card_header_color\";s:7:\"#0066FF\";s:18:\"card_bio_font_size\";s:2:\"11\";s:20:\"card_bio_font_weight\";s:4:\"bold\";s:20:\"card_bio_label_width\";s:3:\"100\";s:9:\"card_city\";s:9:\"City Name\";s:10:\"card_title\";s:15:\"Library Manager\";s:14:\"card_officials\";s:14:\"Librarian Name\";s:17:\"card_officials_id\";s:12:\"Librarian ID\";s:15:\"card_stamp_file\";s:9:\"stamp.png\";s:19:\"card_signature_file\";s:13:\"signature.png\";s:15:\"card_stamp_left\";s:0:\"\";s:14:\"card_stamp_top\";s:0:\"\";s:16:\"card_stamp_width\";s:0:\"\";s:17:\"card_stamp_height\";s:0:\"\";s:13:\"card_exp_left\";s:0:\"\";s:12:\"card_exp_top\";s:0:\"\";s:14:\"card_exp_width\";s:0:\"\";s:15:\"card_exp_height\";s:0:\"\";s:18:\"card_barcode_scale\";i:100;s:17:\"card_barcode_left\";s:0:\"\";s:16:\"card_barcode_top\";s:0:\"\";s:18:\"card_barcode_width\";s:0:\"\";s:19:\"card_barcode_height\";s:0:\"\";s:10:\"card_rules\";s:120:\"<ul><li>This card is published by Library.</li><li>Please return this card to its owner if you found it.</li></ul>\";s:20:\"card_rules_font_size\";s:1:\"8\";s:12:\"card_address\";s:76:\"My Library<br />website: http://slims.web.id, email : librarian@slims.web.id\";s:22:\"card_address_font_size\";s:1:\"7\";s:17:\"card_address_left\";s:0:\"\";s:16:\"card_address_top\";s:0:\"\";}}}');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (21,'enable_visitor_limitation','s:1:\"0\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (22,'time_visitor_limitation','s:2:\"60\";');
insert  into `setting`(`setting_id`,`setting_name`,`setting_value`) values (25,'spellchecker_enabled','b:1;');

/*Table structure for table `stock_take` */

DROP TABLE IF EXISTS `stock_take`;

CREATE TABLE `stock_take` (
  `stock_take_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_take_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `init_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_item_stock_taked` int(11) DEFAULT NULL,
  `total_item_lost` int(11) DEFAULT NULL,
  `total_item_exists` int(11) DEFAULT '0',
  `total_item_loan` int(11) DEFAULT NULL,
  `stock_take_users` mediumtext COLLATE utf8_unicode_ci,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `report_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stock_take_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stock_take` */

/*Table structure for table `stock_take_item` */

DROP TABLE IF EXISTS `stock_take_item`;

CREATE TABLE `stock_take_item` (
  `stock_take_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gmd_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classification` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coll_type_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('e','m','u','l') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `checked_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_take_id`,`item_id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `status` (`status`),
  KEY `item_properties_idx` (`gmd_name`,`classification`,`coll_type_name`,`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stock_take_item` */

/*Table structure for table `system_log` */

DROP TABLE IF EXISTS `system_log`;

CREATE TABLE `system_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` enum('staff','member','system') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'staff',
  `id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `log_msg` text COLLATE utf8_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `system_log` */

insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (1,'staff','admin','Login','Login success for user admin from address ::1','2019-06-03 14:14:04');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (2,'staff','1','system','Admin change application global configuration','2019-06-03 14:14:26');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (3,'staff','1','bibliography','Admin update bibliographic data (PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases) with biblio_id (6)','2019-06-03 14:18:19');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (4,'staff','1','bibliography','Admin update bibliographic data (PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases) with biblio_id (6)','2019-06-03 14:18:53');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (5,'staff','1','bibliography','Admin update bibliographic data (PostgreSQL : a comprehensive guide to building, programming, and administering PostgreSQL databases) with biblio_id (6)','2019-06-03 14:19:29');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (6,'staff','1','membership','Admin upload image file member_1.jpg','2019-06-03 14:22:00');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (7,'staff','1','membership','Admin add new member (Aziz Arif Rizaldi) with ID (1)','2019-06-03 14:22:00');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (8,'member','1','Login','Login success for member 1 from address ::1','2019-06-03 14:23:27');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (9,'member','','Login','Log Out from address ::1','2019-06-03 14:23:39');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (10,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-03 14:23:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (11,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-03 14:24:37');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (12,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-03 14:24:43');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (13,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-03 14:27:29');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (14,'staff','1','membership','Admin update member data (Aziz Arif Rizaldi) with ID (1)','2019-06-03 14:29:14');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (15,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 00:09:37');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (16,'staff','1','membership','Admin update member data (Aziz Arif Rizaldi) with ID (1)','2019-06-04 00:09:57');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (17,'staff','1','membership','Admin update member data (Aziz Arif Rizaldi) with ID (1)','2019-06-04 00:10:15');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (18,'staff','1','membership','Admin update member data (Aziz Arif Rizaldi) with ID (1)','2019-06-04 00:12:47');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (19,'staff','1','system','Admin Log Out from application from address ::1','2019-06-04 00:17:01');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (20,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-04 00:21:12');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (21,'member','1','Login','Login FAILED for member 1 from address ::1','2019-06-04 00:24:37');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (22,'member','1','Login','Login success for member 1 from address ::1','2019-06-04 00:24:41');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (23,'member','','Login','Log Out from address ::1','2019-06-04 00:24:44');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (24,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 00:28:41');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (25,'staff','1','membership','Admin update member data (Aziz Arif Rizaldi) with ID (1)','2019-06-04 00:29:47');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (26,'staff','1','system','Admin Log Out from application from address ::1','2019-06-04 00:33:22');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (27,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 01:41:00');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (28,'member','1','Login','Login success for member 1 from address ::1','2019-06-04 10:53:10');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (29,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 10:54:27');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (30,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 10:54:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (31,'member','1','circulation','Admin insert new loan (B00010) for member (1)','2019-06-04 10:56:07');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (32,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 10:57:25');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (33,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 10:57:39');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (34,'member','1','circulation','Admin return item B00010 for member (1)','2019-06-04 11:01:50');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (35,'member','1','circulation','Admin insert new loan (B00010) for member (1)','2019-06-04 11:03:04');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (36,'member','1','circulation','Admin insert new loan (B00009) for member (1)','2019-06-04 11:03:32');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (37,'member','1','circulation','Admin insert new loan (B00009) for member (1)','2019-06-04 11:03:50');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (38,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 11:08:13');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (39,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 11:12:16');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (40,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 11:16:24');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (41,'member','1','Login','Login success for member 1 from address ::1','2019-06-04 11:16:48');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (42,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 11:41:07');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (43,'member','1','circulation','Admin insert new loan (B00007) for member (1)','2019-06-04 11:41:34');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (44,'member','1','circulation','Admin insert new loan (B00007) for member (1)','2019-06-04 11:44:11');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (45,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 11:44:16');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (46,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 11:46:25');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (47,'member','1','circulation','Admin extend loan for item B00007 for member (1)','2019-06-04 11:46:46');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (48,'member','1','circulation','Admin extend loan for item B00009 for member (1)','2019-06-04 11:51:00');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (49,'staff','1','system','Admin change application global configuration','2019-06-04 12:28:42');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (50,'staff','1','membership','Admin add new member (Cecep Rokani) with ID (2)','2019-06-04 14:01:19');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (51,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 14:01:32');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (52,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:01:39');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (53,'member','2','circulation','Admin reserve item B00007 for member (2)','2019-06-04 14:01:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (54,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:02:53');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (55,'member','','Login','Log Out from address ::1','2019-06-04 14:05:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (56,'member','2','Login','Login success for member 2 from address ::1','2019-06-04 14:05:34');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (57,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 14:06:12');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (58,'member','1','circulation','Admin return item B00007 for member (1)','2019-06-04 14:06:22');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (59,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 14:08:00');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (60,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:08:02');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (61,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:08:34');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (62,'staff','1','membership','Admin add new member (Gema Aji Wardian) with ID (3)','2019-06-04 14:08:52');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (63,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:08:58');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (64,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 14:10:27');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (65,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:10:39');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (66,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 14:11:21');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (67,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:11:22');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (68,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:11:44');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (69,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:11:46');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (70,'member','3','circulation','Admin return item B00007 for member (3)','2019-06-04 14:11:54');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (71,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 14:12:04');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (72,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:12:10');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (73,'member','2','circulation','Admin insert new loan (B00007) for member (2)','2019-06-04 14:12:18');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (74,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:12:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (75,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:12:32');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (76,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 14:12:41');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (77,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:12:45');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (78,'member','3','circulation','Admin return item B00007 for member (3)','2019-06-04 14:12:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (79,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 14:13:17');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (80,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:13:22');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (81,'member','2','circulation','Admin insert new loan (B00007) for member (2)','2019-06-04 14:13:27');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (82,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:13:29');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (83,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 14:13:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (84,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 14:15:02');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (85,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 14:15:05');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (86,'member','3','circulation','Admin reserve item B00007 for member (3)','2019-06-04 15:02:07');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (87,'member','3','circulation','Admin remove reservation for item B00007 for member (3)','2019-06-04 15:02:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (88,'member','3','circulation','Admin reserve item B00007 for member (3)','2019-06-04 15:04:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (89,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 15:04:36');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (90,'staff','1','membership','Admin add new member (Beti Rahmawati) with ID (4)','2019-06-04 15:04:57');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (91,'member','4','circulation','Admin start transaction with member (4)','2019-06-04 15:05:05');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (92,'member','4','circulation','Admin reserve item B00007 for member (4)','2019-06-04 15:05:11');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (93,'member','4','circulation','Admin remove reservation for item B00007 for member (4)','2019-06-04 15:05:25');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (94,'member','4','circulation','Admin finish circulation transaction with member (4)','2019-06-04 15:38:01');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (95,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 15:38:03');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (96,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 15:38:54');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (97,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 15:39:05');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (98,'member','1','circulation','Admin insert new loan (B00010) for member (1)','2019-06-04 15:39:53');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (99,'member','1','circulation','Admin return item B00009 for member (1)','2019-06-04 15:40:18');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (100,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 15:40:21');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (101,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 15:40:25');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (102,'member','2','circulation','Admin return item B00007 for member (2)','2019-06-04 15:40:28');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (103,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 15:40:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (104,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 15:40:33');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (105,'member','3','circulation','Admin finish circulation transaction with member (3)','2019-06-04 15:40:50');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (106,'member','4','circulation','Admin start transaction with member (4)','2019-06-04 15:40:52');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (107,'member','4','circulation','Admin finish circulation transaction with member (4)','2019-06-04 15:40:54');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (108,'member','5','circulation','Admin start transaction with member (5)','2019-06-04 15:40:56');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (109,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 15:41:26');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (110,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 15:48:41');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (111,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 15:48:45');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (112,'member','2','circulation','Admin reserve item B00010 for member (2)','2019-06-04 15:48:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (113,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 15:48:53');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (114,'member','3','circulation','Admin start transaction with member (3)','2019-06-04 15:48:54');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (115,'member','3','circulation','Admin reserve item B00010 for member (3)','2019-06-04 15:48:59');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (116,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 16:55:20');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (117,'staff','1','system','Admin change application global configuration','2019-06-04 16:55:44');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (118,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 16:56:03');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (119,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 17:02:57');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (120,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 17:03:01');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (121,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 17:06:32');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (122,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 17:06:33');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (123,'member','1','circulation','Admin return item B00010 for member (1)','2019-06-04 17:06:37');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (124,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 17:29:07');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (125,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 17:32:11');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (126,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 17:33:01');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (127,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 17:33:02');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (128,'member','1','circulation','Admin return item B00010 for member (1)','2019-06-04 17:33:05');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (129,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 17:34:28');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (130,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 17:34:30');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (131,'member','1','circulation','Admin insert new loan (B00007) for member (1)','2019-06-04 17:34:34');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (132,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 17:34:38');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (133,'staff','admin','Login','Login success for user admin from address ::1','2019-06-04 20:27:18');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (134,'member','1','circulation','Admin start transaction with member (1)','2019-06-04 20:28:49');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (135,'member','1','circulation','Admin extend loan for item B00007 for member (1)','2019-06-04 20:32:57');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (136,'member','1','circulation','Admin return item B00007 for member (1)','2019-06-04 20:33:58');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (137,'member','1','circulation','Admin finish circulation transaction with member (1)','2019-06-04 20:36:15');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (138,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 20:36:18');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (139,'member','2','circulation','Admin insert new loan (B00009) for member (2)','2019-06-04 20:36:48');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (140,'member','2','circulation','Admin finish circulation transaction with member (2)','2019-06-04 20:36:51');
insert  into `system_log`(`log_id`,`log_type`,`id`,`log_location`,`log_msg`,`log_date`) values (141,'member','2','circulation','Admin start transaction with member (2)','2019-06-04 20:36:53');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` smallint(2) DEFAULT NULL,
  `user_image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `social_media` text COLLATE utf8_unicode_ci,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groups` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `realname` (`realname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`realname`,`passwd`,`email`,`user_type`,`user_image`,`social_media`,`last_login`,`last_login_ip`,`groups`,`input_date`,`last_update`) values (1,'admin','Admin','$2y$10$dW/waaaDJw8bt1YcXRzz4ObD7PMoHbmlQwWTloqtm39190SGZBWCm',NULL,NULL,NULL,NULL,'2019-06-04 20:27:18','::1','a:1:{i:0;s:1:\"1\";}','2019-06-04','2019-06-04');

/*Table structure for table `user_group` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_group` */

insert  into `user_group`(`group_id`,`group_name`,`input_date`,`last_update`) values (1,'Administrator','2019-06-03','2019-06-03');

/*Table structure for table `visitor_count` */

DROP TABLE IF EXISTS `visitor_count`;

CREATE TABLE `visitor_count` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `institution` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkin_date` datetime NOT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `visitor_count` */

insert  into `visitor_count`(`visitor_id`,`member_id`,`member_name`,`institution`,`checkin_date`) values (1,'1','Aziz Arif Rizaldi','Azma','2019-06-04 10:57:25');
insert  into `visitor_count`(`visitor_id`,`member_id`,`member_name`,`institution`,`checkin_date`) values (2,'2','Cecep Rokani','','2019-06-04 14:02:53');
insert  into `visitor_count`(`visitor_id`,`member_id`,`member_name`,`institution`,`checkin_date`) values (3,'3','Gema Aji Wardian','','2019-06-04 14:10:27');
insert  into `visitor_count`(`visitor_id`,`member_id`,`member_name`,`institution`,`checkin_date`) values (4,'4','Beti Rahmawati','','2019-06-04 15:38:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
