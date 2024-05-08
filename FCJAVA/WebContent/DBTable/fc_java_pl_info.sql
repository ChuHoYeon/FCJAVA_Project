-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fc_java
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pl_info`
--

DROP TABLE IF EXISTS `pl_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pl_info` (
  `pl_num` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  `pl_pic` varchar(250) DEFAULT NULL,
  `back_num` varchar(5) NOT NULL,
  `position` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pl_memo` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `pl_ap_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pl_num`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_info`
--

LOCK TABLES `pl_info` WRITE;
/*!40000 ALTER TABLE `pl_info` DISABLE KEYS */;
INSERT INTO `pl_info` VALUES (54,25,'12345',NULL,'44','수비수','ㅀㄱㄷㅈ','458.4','45.6','2024-04-03 15:19:30'),(55,26,'123456',NULL,'23','골키퍼','ㄱㅈㄷ','643.5',NULL,'2024-04-03 15:26:53'),(72,26,'12345',NULL,'321','미드필더',NULL,NULL,NULL,'2024-04-18 11:24:29'),(73,26,'1111','de8_on (1).jpg','43','수비수','das','321','321','2024-04-22 15:05:46'),(74,26,'3213',NULL,'434','공격수','fsad','432','564','2024-04-22 15:07:01'),(75,26,'13qDK',NULL,'32','미드필더','sfd','322','123','2024-04-22 15:17:09'),(76,26,'1AwEb',NULL,'99','공격수','안녕하세요','158.3','67','2024-04-22 15:17:09'),(77,26,'1CA6O9Uf8j',NULL,'26','공격수','잘부탁해요','166','57','2024-04-22 15:17:09'),(78,26,'1if32EcHx',NULL,'48','미드필더','안녕하세요','177.3','78','2024-04-22 15:17:09'),(79,26,'1WvXHE2H8RZ3r841',NULL,'21','골키퍼','안녕하세요','161.5','84','2024-04-22 15:17:09'),(80,26,'22t32C4X67119bw0',NULL,'34','수비수','안녕하세요','175','75','2024-04-22 15:17:09'),(81,26,'24Y79t99',NULL,'11','수비수','안녕하세요','156','65','2024-04-22 15:17:09'),(82,26,'2Z4wn',NULL,'14','공격수','즐겜해요','174','185','2024-04-24 10:06:09'),(90,38,'1231','teamlogo91.png','232','공격수','하이','233','232','2024-04-30 17:29:09'),(91,17,'1231','mesi.png','7','공격수',NULL,'174','75','2024-05-07 16:58:23'),(92,16,'1231','hechan.jpg','11','미드필더',NULL,'180','80','2024-05-07 17:02:22'),(93,15,'zZ5LYv4','jo.jpg','5','수비수',NULL,'177','77','2024-05-07 17:05:38'),(94,14,'zZ5LYv4','son.jpg','369','골키퍼','골키퍼만 합니다','183','83','2024-05-07 17:13:12'),(95,11,'ZiR8I6Gl2gu','player1.webp','111','공격수','즐겁게해요~~','179','79','2024-05-07 17:17:58'),(96,12,'xVl3P','son1.jpg','43','수비수','안녕하세요.','178','78','2024-05-07 17:57:01'),(97,10,'W26NP','parkji.jpg','231','공격수',NULL,'177','87','2024-05-08 13:02:21'),(98,9,'vAycmV1lB0','leeseong.jpg','645','미드필더','안녕하세요','175','75','2024-05-08 13:11:36'),(99,13,'Q2sYRx7l9nq','minjae.jpg','12','수비수','수비수입니다.','187','85','2024-05-08 15:02:04'),(100,19,'32YMXjc9Qe5nn0l',NULL,'123','공격수','잘부탁합니다!!','176','85','2024-05-08 15:10:19'),(101,18,'3YJ83l',NULL,'67','미드필더','같이해요!!','175','76','2024-05-08 15:11:48'),(102,20,'4tHEUGE2P0',NULL,'622','미드필더','잘부탁드립니다!','178','78','2024-05-08 15:22:48'),(103,24,'709P1','img.png','157','수비수','잘부탁합니다.','185','78','2024-05-08 15:37:16'),(104,23,'7M45d11','images.jpg','3','수비수','잘부탁해요~','185','85','2024-05-08 15:38:51'),(105,22,'91LY5','images (1).jpg','75','골키퍼','잘부탁해요','185','80','2024-05-08 15:39:50'),(106,21,'9xP6','KakaoTalk_20210819_194607723_07.jpg','1','공격수','재밌게해요~','177','76','2024-05-08 15:41:15');
/*!40000 ALTER TABLE `pl_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08 17:42:42
