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
  `position` varchar(5) NOT NULL,
  `pl_memo` varchar(250) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `pl_ap_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pl_num`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_info`
--

LOCK TABLES `pl_info` WRITE;
/*!40000 ALTER TABLE `pl_info` DISABLE KEYS */;
INSERT INTO `pl_info` VALUES (38,9,'1234',NULL,'1','골키퍼','축알못','156.7','45.6','2024-03-19 11:52:24'),(39,10,'1234',NULL,'2','공격수','하이요','456.3','85.2','2024-03-19 12:06:54'),(40,11,'1234',NULL,'35','골키퍼','방가',NULL,'75.8','2024-03-19 12:07:37'),(41,12,'1234',NULL,'6','공격수','나 못해','12.3',NULL,'2024-03-19 12:35:19'),(42,13,'1234',NULL,'78','공격수','ㄹㄴㅇ',NULL,'64.8','2024-03-19 12:35:34'),(43,14,'1234',NULL,'61','공격수','ㄹㅇㄴㅁ','85.9',NULL,'2024-03-19 12:36:36'),(44,15,'1234',NULL,'38','골키퍼',NULL,NULL,'45.6','2024-03-19 12:36:55'),(45,16,'1234',NULL,'24','미드필더',NULL,'123.5',NULL,'2024-03-19 16:11:43'),(46,17,'1234',NULL,'28','미드필더','ㅎ로','123.6',NULL,'2024-03-19 16:11:56'),(47,18,'1234',NULL,'82','골키퍼','굣',NULL,NULL,'2024-03-19 16:12:05'),(48,19,'1234',NULL,'10','미드필더','ㅂㄱㅈ','95.6','123.6','2024-03-19 16:12:20'),(49,20,'123456',NULL,'23','공격수',NULL,NULL,'67.9','2024-03-20 11:41:08'),(50,21,'123456',NULL,'65','수비수','ㅠㅊㅍㅌ','458.3','65.7','2024-03-20 11:41:33'),(51,22,'1234',NULL,'98','수비수',NULL,'164.5','58.2','2024-03-20 17:47:47'),(52,23,'1234',NULL,'78','골키퍼','ㅎㄹㅇ','282.6','45.8','2024-03-22 14:40:02'),(53,24,'1234',NULL,'45','공격수',NULL,NULL,NULL,'2024-03-26 18:01:45'),(54,25,'12345',NULL,'44','수비수','ㅀㄱㄷㅈ','458.4','45.6','2024-04-03 15:19:30'),(55,26,'123456',NULL,'23','골키퍼','ㄱㅈㄷ','643.5',NULL,'2024-04-03 15:26:53'),(72,26,'12345',NULL,'321','미드필더',NULL,NULL,NULL,'2024-04-18 11:24:29');
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

-- Dump completed on 2024-04-18 18:14:42
