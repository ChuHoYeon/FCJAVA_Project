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
-- Table structure for table `board_26`
--

DROP TABLE IF EXISTS `board_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_26` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `board_title` varchar(45) COLLATE utf8_bin NOT NULL,
  `board_content` text COLLATE utf8_bin NOT NULL,
  `board_file` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `board_readcount` int(11) NOT NULL,
  `board_createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `board_lastupdate` datetime NOT NULL,
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_26`
--

LOCK TABLES `board_26` WRITE;
/*!40000 ALTER TABLE `board_26` DISABLE KEYS */;
INSERT INTO `board_26` VALUES (1,'123456','하이','ㅎㅇㄴ','son.jpg',0,'2024-05-09 17:35:07','2024-05-09 17:35:07'),(2,'123456','하이','ㅎㅇㄴ','son.jpg',0,'2024-05-09 17:38:18','2024-05-09 17:38:18'),(3,'123456','방가','방가\r\n방가','parkji.jpg',0,'2024-05-09 17:44:14','2024-05-09 17:44:14'),(4,'123456','같이 축구해요~','수요일 저녁에 축구할건데 같이해요~','parkji.jpg',0,'2024-05-10 16:28:41','2024-05-10 16:28:41'),(5,'123456','올라가나?','올라 가나요?','parkji.jpg',0,'2024-05-10 16:30:06','2024-05-10 16:30:06'),(6,'123456','올라가나?','올라 가나요?','parkji.jpg',0,'2024-05-10 16:38:28','2024-05-10 16:38:28'),(7,'123456','올라가나?','올라 가나요?','parkji.jpg',0,'2024-05-10 16:38:31','2024-05-10 16:38:31'),(8,'123456','test1','test1','son.jpg',0,'2024-05-10 16:40:08','2024-05-10 16:40:08'),(9,'123456','test2','test2',NULL,0,'2024-05-10 16:40:16','2024-05-10 16:40:16'),(10,'123456','test3','test3',NULL,0,'2024-05-10 16:40:23','2024-05-10 16:40:23'),(11,'123456','test4','test4',NULL,0,'2024-05-10 16:40:28','2024-05-10 16:40:28'),(12,'123456','test5','test5',NULL,0,'2024-05-10 16:40:34','2024-05-10 16:40:34'),(13,'123456','test5','test5',NULL,0,'2024-05-10 16:43:37','2024-05-10 16:43:37'),(14,'123456','ㅇㄴㅁ','ㅇㅁㄴ','son.jpg',0,'2024-05-13 15:35:22','2024-05-13 15:35:22'),(15,'123456','테스트','테스트입니다.',NULL,0,'2024-05-13 15:48:56','2024-05-13 15:48:56'),(16,'123456','잘부탁드립니다~','같이 즐겁게 게임해요~',NULL,0,'2024-05-20 10:16:12','2024-05-20 10:16:12');
/*!40000 ALTER TABLE `board_26` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 15:16:33
