-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fc_java
-- ------------------------------------------------------
-- Server version	8.0.36-2ubuntu3

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
  `pl_num` int NOT NULL AUTO_INCREMENT,
  `t_num` int NOT NULL,
  `id` varchar(20) NOT NULL,
  `pl_pic` varchar(250) DEFAULT NULL,
  `back_num` varchar(5) NOT NULL,
  `position` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pl_memo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `pl_ap_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pl_num`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_info`
--

LOCK TABLES `pl_info` WRITE;
/*!40000 ALTER TABLE `pl_info` DISABLE KEYS */;
INSERT INTO `pl_info` VALUES (54,25,'12345',NULL,'44','수비수','ㅀㄱㄷㅈ','175','70','2024-04-03 15:19:30'),(55,26,'123456',NULL,'23','골키퍼','안녕하세용','181','76','2024-04-03 15:26:53'),(72,26,'12345',NULL,'321','미드필더','안녕하세요. 미드필더 희망합니다','171','68','2024-04-18 11:24:29'),(73,26,'1111',NULL,'43','수비수','안녕하세요! 좋은 팀에서 같이 축구하게 되어 기쁩니다! 함께 열심히 뛰며 즐겨봐요!','177','70','2024-04-22 15:05:46'),(74,26,'3213',NULL,'434','공격수','골키퍼빼고 다 갑니다','168','69','2024-04-22 15:07:01'),(75,26,'13qDK',NULL,'32','미드필더','안녕하세용','172','71','2024-04-22 15:17:09'),(76,26,'1AwEb',NULL,'99','공격수','안녕하세요','167','63','2024-04-22 15:17:09'),(77,26,'1CA6O9Uf8j',NULL,'26','공격수','잘부탁해요','166','57','2024-04-22 15:17:09'),(78,26,'1if32EcHx',NULL,'48','미드필더','안녕하세요','177','78','2024-04-22 15:17:09'),(79,26,'1WvXHE2H8RZ3r841',NULL,'21','골키퍼','안녕하세요','161','84','2024-04-22 15:17:09'),(80,26,'22t32C4X67119bw0',NULL,'34','수비수','안녕하세요','175','75','2024-04-22 15:17:09'),(81,26,'24Y79t99',NULL,'11','수비수','안녕하세요','156','65','2024-04-22 15:17:09'),(82,26,'2Z4wn',NULL,'14','공격수','즐겜해요','174','67','2024-04-24 10:06:09'),(90,38,'1231',NULL,'232','공격수','하이','170','63','2024-04-30 17:29:09'),(91,17,'1231',NULL,'7','공격수',NULL,'174','75','2024-05-07 16:58:23'),(92,16,'1231',NULL,'11','미드필더',NULL,'180','80','2024-05-07 17:02:22'),(93,15,'zZ5LYv4',NULL,'5','수비수',NULL,'177','77','2024-05-07 17:05:38'),(94,14,'zZ5LYv4',NULL,'369','골키퍼','골키퍼만 합니다','180','76','2024-05-07 17:13:12'),(95,11,'ZiR8I6Gl2gu',NULL,'111','공격수','즐겁게해요~~','179','79','2024-05-07 17:17:58'),(96,12,'xVl3P',NULL,'43','수비수','안녕하세요.','178','78','2024-05-07 17:57:01'),(97,10,'W26NP',NULL,'231','공격수',NULL,'177','72','2024-05-08 13:02:21'),(98,9,'vAycmV1lB0',NULL,'645','미드필더','안녕하세요','175','75','2024-05-08 13:11:36'),(100,19,'32YMXjc9Qe5nn0l',NULL,'123','공격수','잘부탁합니다!!','176','76','2024-05-08 15:10:19'),(101,18,'3YJ83l',NULL,'67','미드필더','같이해요!!','175','76','2024-05-08 15:11:48'),(102,20,'4tHEUGE2P0',NULL,'622','미드필더','잘부탁드립니다!','178','78','2024-05-08 15:22:48'),(103,24,'709P1',NULL,'157','수비수','잘부탁합니다.','185','78','2024-05-08 15:37:16'),(104,23,'7M45d11',NULL,'3','수비수','잘부탁해요~','185','85','2024-05-08 15:38:51'),(105,22,'91LY5',NULL,'75','골키퍼','잘부탁해요','185','80','2024-05-08 15:39:50'),(106,21,'9xP6',NULL,'1','공격수','재밌게해요~','177','76','2024-05-08 15:41:15'),(107,21,'06biCbKOZ33pyhDPKC',NULL,'123','공격수','dasd','166','67','2024-05-13 17:35:08'),(108,9,'1234',NULL,'123','공격수','잘부탁드려요~~','184','77','2024-05-16 16:26:14'),(109,19,'1234',NULL,'66','미드필더','잘부탁합니다~','174','75','2024-05-16 16:27:26'),(110,13,'123456',NULL,'13','미드필더','잘부탁드립니다!','174','65','2024-05-17 13:15:18'),(114,42,'1234',NULL,'23','미드필더',NULL,'174',NULL,'2024-05-20 11:22:22'),(120,42,'chuho',NULL,'123','공격수',NULL,'174','74','2024-05-30 03:30:48'),(123,45,'dkjdkdkkd',NULL,'123','공격수',NULL,NULL,NULL,'2024-06-04 10:35:04');
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

-- Dump completed on 2024-06-07  0:26:03
