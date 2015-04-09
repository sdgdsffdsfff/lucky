/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.5.20 : Database - lucky
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lucky` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lucky`;

/*Table structure for table `app_activity` */

DROP TABLE IF EXISTS `app_activity`;

CREATE TABLE `app_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `rule` longtext NOT NULL,
  `details` longtext NOT NULL,
  `hint` longtext NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `drawBase` bigint(20) NOT NULL,
  `boildboard` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `app_activity` */

insert  into `app_activity`(`id`,`name`,`channel`,`rule`,`details`,`hint`,`startTime`,`endTime`,`createTime`,`drawBase`,`boildboard`) values (1,'欢度六一','f384','1.活动时间：活动时间：2014年6月3日-2014年6月6日 ||\r\n2.请中奖网友及时完成领奖（活动结束前），逾期或领奖信息填写错误或不完整均视为放弃获奖资格。||\r\n3.活动结束后12个工作日内派送奖品，请耐心等待！','这是个活动dddddddddddddddddddd','多抽几次cccccccccccccccccccc','2014-06-18 08:39:15','2014-06-20 15:59:59','2014-06-19 04:35:40',1000,'image/A0858D9C-5A2F-4453-B7F8-AA71440EC2EC.png'),(3,'世界杯','f518','活动规则：下载安装《我爱斗地主》并注册账号即获得抽奖资格。\r\n','','中奖名单将于6月12日在电池医生消息中心公布，请及时查看。\r\n奖品会在中奖名单公布后的3个工作日内寄出。','2014-06-18 02:38:45','2014-06-21 02:38:45','2014-06-19 05:48:01',1,'image/1_1.png'),(5,'端午','f3030','dshgty','saf','dyhtrfj','2014-06-18 06:24:45','2014-06-21 06:24:45','2014-06-19 04:35:32',1000,'image/1_12.png');

/*Table structure for table `app_prize` */

DROP TABLE IF EXISTS `app_prize`;

CREATE TABLE `app_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `allCount` int(11) NOT NULL,
  `virCount` int(11) NOT NULL,
  `details` longtext NOT NULL,
  `prizeType` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_prize_8005e431` (`activity_id`),
  CONSTRAINT `activity_id_refs_id_723864fd` FOREIGN KEY (`activity_id`) REFERENCES `app_activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `app_prize` */

insert  into `app_prize`(`id`,`name`,`activity_id`,`pic`,`allCount`,`virCount`,`details`,`prizeType`,`createTime`,`enable`) values (1,'演唱会门票',1,'image/A0858D9C-5A2F-4453-B7F8-AA71440EC2EC_1.png',2,20,'2014周杰伦魔天伦世界巡回演唱会门票常州站',0,'2014-06-18 08:11:08',1),(7,'30元话费',3,'image/1_8.png',100,100,'30元话费',2,'2014-06-18 07:27:42',1),(8,'足球',3,'image/8cb1cb13495409238b031f999058d109b2de49ea.jpg',1000,30,'足球，是全球体育界最具影响力的单项体育运动，被誉为“世界第一运动”。以脚支配球为主，[1] 但也可以使用头、胸部等部位控球（除守门员外，其他队员不得用手或臂触球；守门员只能在己方禁区内，能用手或臂触球，不可以在大禁区外用手接球），每次有两个队、每队最多有11名成员在同一场地内进行攻守的体育运动项目。',0,'2014-06-18 09:48:37',1),(9,'iPad air',1,'image/u18515049464146000190fm58.jpg',2,2,'美国苹果公司于北京时间2013年10月23日举行发布会，正式公布了全新的iPad Air。iPad Air最大的变化是其整体设计，更偏向于iPad mini，使得 iPad Air拥有令人难以置信的纤薄轻巧...',0,'2014-06-18 06:23:53',1),(10,'彩票',3,'image/1_10.png',100,1000,'中五百万',1,'2014-06-18 06:22:51',1),(11,'话费',1,'image/1_11.png',100,1000,'',2,'2014-06-18 08:11:16',1),(12,'话费',5,'image/2.png',20,100,'dfj',2,'2014-06-19 04:33:11',1),(13,'小米手机',5,'image/2BC2E0CE-0052-42AE-B6E6-CA53C7DB99C5.png',3,100,'sht',0,'2014-06-19 04:35:10',1),(14,'彩票',5,'image/2_1.png',500,1000,'伍佰无',1,'2014-06-19 04:33:21',1);

/*Table structure for table `app_share` */

DROP TABLE IF EXISTS `app_share`;

CREATE TABLE `app_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_share_8005e431` (`activity_id`),
  CONSTRAINT `activity_id_refs_id_dc0011f7` FOREIGN KEY (`activity_id`) REFERENCES `app_activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `app_share` */

insert  into `app_share`(`id`,`activity_id`,`pic`,`url`,`text`,`createTime`) values (1,1,'image/01C307C3-86A6-41C3-8E81-C66E76989DBA.png','http://www.ttpod.com','fghfhgfhgfhfg','2014-06-12 08:15:29'),(3,3,'image/1_9.png','http://www.ttpod.com','hkjjkkkkkkkk','2014-06-18 04:01:32');

/*Table structure for table `app_winuser` */

DROP TABLE IF EXISTS `app_winuser`;

CREATE TABLE `app_winuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `taid` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_winuser_0f3583ba` (`prize_id`),
  KEY `app_winuser_8005e431` (`activity_id`),
  CONSTRAINT `activity_id_refs_id_ed0810c8` FOREIGN KEY (`activity_id`) REFERENCES `app_activity` (`id`),
  CONSTRAINT `prize_id_refs_id_e86cae74` FOREIGN KEY (`prize_id`) REFERENCES `app_prize` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_winuser` */

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can add user',4,'add_user'),(12,'Can change user',4,'change_user'),(13,'Can delete user',4,'delete_user'),(14,'Can view group',3,'view_group'),(15,'Can view permission',2,'view_permission'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add revision',7,'add_revision'),(26,'Can change revision',7,'change_revision'),(27,'Can delete revision',7,'delete_revision'),(28,'Can add version',8,'add_version'),(29,'Can change version',8,'change_version'),(30,'Can delete version',8,'delete_version'),(31,'Can view revision',7,'view_revision'),(32,'Can view version',8,'view_version'),(33,'Can add 活动',9,'add_activity'),(34,'Can change 活动',9,'change_activity'),(35,'Can delete 活动',9,'delete_activity'),(36,'Can add 奖品',10,'add_prize'),(37,'Can change 奖品',10,'change_prize'),(38,'Can delete 奖品',10,'delete_prize'),(39,'Can add 中奖信息',11,'add_winuser'),(40,'Can change 中奖信息',11,'change_winuser'),(41,'Can delete 中奖信息',11,'delete_winuser'),(42,'Can view 中奖信息',11,'view_winuser'),(43,'Can view 奖品',10,'view_prize'),(44,'Can view 活动',9,'view_activity'),(45,'Can add Bookmark',12,'add_bookmark'),(46,'Can change Bookmark',12,'change_bookmark'),(47,'Can delete Bookmark',12,'delete_bookmark'),(48,'Can add User Setting',13,'add_usersettings'),(49,'Can change User Setting',13,'change_usersettings'),(50,'Can delete User Setting',13,'delete_usersettings'),(51,'Can add User Widget',14,'add_userwidget'),(52,'Can change User Widget',14,'change_userwidget'),(53,'Can delete User Widget',14,'delete_userwidget');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$12000$xolL7NhZ68hp$+CYlkTcugzOKjM/46zQFbNkoVtB+EVUQGSXrzrFQo0w=','2014-06-19 08:30:54',1,'admin','','','admin@163.com',1,1,'2014-05-30 08:12:15');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`name`,`app_label`,`model`) values (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'revision','reversion','revision'),(8,'version','reversion','version'),(9,'活动','app','activity'),(10,'奖品','app','prize'),(11,'中奖信息','app','winuser'),(12,'Bookmark','xadmin','bookmark'),(13,'User Setting','xadmin','usersettings'),(14,'User Widget','xadmin','userwidget'),(15,'分享','app','share');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2b8ts6b8g98zrmbda436yervlk8lu6a2','NjEzMzc2OTNjZjVkM2IyM2RhOGIyYjVjYzM3M2ZlZDk3YmU5YWJlMzp7IkxJU1RfUVVFUlkiOltbImFwcCIsInNoYXJlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-07-02 03:07:55'),('7gsr1b3u5wcwv4qm1osd0pozzv5hw26u','ZWFlMTU2NWM0NmVjYzhjZTRmNDFlNjBmM2Q0YjZlNmJiYTQ5ODlkZTp7IkxJU1RfUVVFUlkiOltbImFwcCIsInByaXplIl0sIl9yZWxfYWN0aXZpdHlfX2lkX19leGFjdD0zIl0sIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-06-30 03:41:27'),('8h8bxkocnksuffqj8prjxzdk6uck9pvv','MTI2MjYwZTYyOTZmMzQ5Mzc3MGY4MDAzMGFhNTVjMmM1Y2U0NmMyNDp7IkxJU1RfUVVFUlkiOltbImFwcCIsInByaXplIl0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-07-03 03:49:18'),('buhntbn2qay279t4qh2kx1xy3vqiuzqk','YTg1MzYyMWM3MTVhZTYwODcyYWE1NmFjOWVjNWEyYTRkZDZkMzBjYTp7IkxJU1RfUVVFUlkiOltbImFwcCIsInByaXplIl0sIl9yZWxfYWN0aXZpdHlfX2lkX19leGFjdD0yIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-27 07:07:59'),('cre43kk6zl4dlr5frf2wf10vec00hh46','Mzk3MjdjZjhjNWUzMjNmMWE0YzkzZTUyMTljMjMyNzBiOTE2MjlmMTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-07-03 07:08:09'),('n0kqu31rwamzhuatpxkgd9b8cfpy2ofz','MWRlODQwMDdmYThmZmUzNGQ4M2IyMmQzZWM3NDFmM2NhZWU3NTI3YTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-07-02 02:42:05'),('nikzwgrmbbflzh6sgzpb6ohqrkgf6he4','Mzk3MjdjZjhjNWUzMjNmMWE0YzkzZTUyMTljMjMyNzBiOTE2MjlmMTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-06-18 07:57:09'),('om57imd3mgqky1t2o95tzalka2ac6svw','MWRlODQwMDdmYThmZmUzNGQ4M2IyMmQzZWM3NDFmM2NhZWU3NTI3YTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-07-02 03:26:04'),('p5jskbxu0k8dhibzf884de5pcrziw5d8','Mzk3MjdjZjhjNWUzMjNmMWE0YzkzZTUyMTljMjMyNzBiOTE2MjlmMTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-07-02 06:26:34'),('peo6igiz0glxamfjcxzrlhr7ttf8thhr','MWRlODQwMDdmYThmZmUzNGQ4M2IyMmQzZWM3NDFmM2NhZWU3NTI3YTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-07-03 04:35:40'),('s384erckfodwxvcsp5hkbvgo1mj7v29f','NjEzMzc2OTNjZjVkM2IyM2RhOGIyYjVjYzM3M2ZlZDk3YmU5YWJlMzp7IkxJU1RfUVVFUlkiOltbImFwcCIsInNoYXJlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-06-26 08:15:29'),('s4zi71jcsw1myv9thsw1h56yvlrfdl4q','Mzk3MjdjZjhjNWUzMjNmMWE0YzkzZTUyMTljMjMyNzBiOTE2MjlmMTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-07-02 03:38:27'),('sksn57l2qlm1ujr84xdl19hkdj1ez2gj','MTJiYzhhNDE1NWVjN2QwYzM5ZDlhYzI5MGQ4OWYwNTBhNjRjMDBhOTp7IkxJU1RfUVVFUlkiOltbImFwcCIsImFjdGl2aXR5Il0sIl9xXz1mNTE4Il0sIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-07-02 05:48:11'),('wl034kgyfh6uzgalce9hn9lzx3ph4y36','N2ZhM2JlNDM0NWE5ZDljYTFiNjJiMmVjYzhmNzNlOGNiNTdiZjZlYzp7IkxJU1RfUVVFUlkiOltbImFwcCIsInByaXplIl0sIiJdLCJuYXZfbWVudSI6Ilt7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi9hcHAvYWN0aXZpdHkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEsIFwidGl0bGVcIjogXCJcXHU2ZDNiXFx1NTJhOFwifSwge1widXJsXCI6IFwiL3hhZG1pbi9hcHAvcHJpemUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDIsIFwidGl0bGVcIjogXCJcXHU1OTU2XFx1NTRjMVwifSwge1widXJsXCI6IFwiL3hhZG1pbi9hcHAvd2ludXNlci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMywgXCJ0aXRsZVwiOiBcIlxcdTRlMmRcXHU1OTU2XFx1NGZlMVxcdTYwNmZcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vYXBwL3NoYXJlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA0LCBcInRpdGxlXCI6IFwiXFx1NTIwNlxcdTRlYWJcIn1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXBwL3ByaXplL1wiLCBcInRpdGxlXCI6IFwiQXBwXCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDYsIFwidGl0bGVcIjogXCJcXHU3ZWM0XCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL2F1dGgvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDcsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1wifSwge1widXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA4LCBcInRpdGxlXCI6IFwiXFx1Njc0M1xcdTk2NTBcIn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9hdXRoL3VzZXIvXCIsIFwidGl0bGVcIjogXCJBdXRoXCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi9yZXZlcnNpb24vcmV2aXNpb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWV4Y2hhbmdlXCIsIFwib3JkZXJcIjogMTAsIFwidGl0bGVcIjogXCJSZXZpc2lvbnNcIn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1leGNoYW5nZVwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vcmV2ZXJzaW9uL3JldmlzaW9uL1wiLCBcInRpdGxlXCI6IFwiUmV2ZXJzaW9uXCJ9XSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-04 11:11:37'),('ypksyto33n7sh2bjjmvw6jfcbprc5w92','YmNkM2U4NGFlZDcyNzU2OWU3MDY4ZTc1ODM0OWNkZGIxNDdiMDUyMzp7IkxJU1RfUVVFUlkiOltbImFwcCIsInByaXplIl0sIl9yZWxfYWN0aXZpdHlfX2lkX19leGFjdD0xIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-02 08:43:12');

/*Table structure for table `reversion_revision` */

DROP TABLE IF EXISTS `reversion_revision`;

CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_slug` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_86395673` (`manager_slug`),
  KEY `reversion_revision_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_d4f35b51` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reversion_revision` */

/*Table structure for table `reversion_version` */

DROP TABLE IF EXISTS `reversion_version`;

CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `object_id` longtext NOT NULL,
  `object_id_int` int(11) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_version_0c5c14b2` (`revision_id`),
  KEY `reversion_version_33b489b4` (`object_id_int`),
  KEY `reversion_version_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_f5dce86c` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `revision_id_refs_id_a685e913` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reversion_version` */

/*Table structure for table `xadmin_bookmark` */

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_91d2dce8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_bookmark` */

/*Table structure for table `xadmin_usersettings` */

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_a4128191` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_usersettings` */

insert  into `xadmin_usersettings`(`id`,`user_id`,`key`,`value`) values (1,1,'dashboard:home:pos','');

/*Table structure for table `xadmin_userwidget` */

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_97371ff7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_userwidget` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
