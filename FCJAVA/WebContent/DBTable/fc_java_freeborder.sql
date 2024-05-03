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
-- Table structure for table `freeborder`
--

DROP TABLE IF EXISTS `freeborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freeborder` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `title` varchar(45) COLLATE utf8_bin NOT NULL,
  `memo` text COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeborder`
--

LOCK TABLES `freeborder` WRITE;
/*!40000 ALTER TABLE `freeborder` DISABLE KEYS */;
INSERT INTO `freeborder` VALUES (9,'1234','제목입니다.','올라갈까요?!!!!!!$@#$!@!$','2024-03-13 11:56:07'),(10,'1234','제목입니다.','올라갈까요?','2024-03-13 11:56:46'),(12,'1234','ㅠㅊㅍㅌ','ㅏㅓㅣ;','2024-03-13 12:09:04'),(13,'1234','제목을 입력했습니다.','글 내용을 입력했습니다.','2024-03-13 12:38:38'),(14,'1234','제목만 입력했습니다.','ㄴㅁㅇ','2024-03-13 12:38:55'),(20,'1234','test','test','2024-03-14 12:21:48'),(21,'1234','이게 맞는지 모르겠다~~~~~','정말 모르겠다~~~~~~~~~~~','2024-03-14 12:49:18'),(23,'1234','dsa','dsadsa','2024-03-15 13:55:44'),(24,'1234','test','test','2024-03-15 15:04:54'),(25,'1234','test1','test1','2024-03-15 15:05:00'),(26,'1234','test2','test2','2024-03-15 15:05:13'),(27,'1234','test3','test3','2024-03-15 15:05:20'),(28,'12345','ddsa','dsadsadll\r\nda\r\n\r\nldalsdlsad','2024-03-15 17:02:55'),(30,'12345','ㅇㄴㅁㅇㄴㅁ','ㄹㄴㅇㄹㅇㄹㄴㅇㄴㄹㄴㅇ\r\nㅇㄴㅁㅇ\r\nㅁㄴㅇㅁㄴㅇㄴㅁㅇ\r\nㅁㄴㅇㄴㅁㅇㄴㅁ\r\nㅇㅁㄴㅇㅁㄴㄹㄴㅇㅇㄴㄹㅇㄴㄴㅇㄹㄴㅇㄹ\r\nㅁㄴㅇ','2024-03-15 17:12:11'),(31,'12345','제목입력','제목을 입력\r\n해\r\n보\r\n았\r\n습\r\n니\r\n다.','2024-03-15 17:17:54'),(32,'1234','글쓴다','끌','2024-03-18 15:48:11'),(33,'1','213','123','2024-04-15 16:47:04'),(40,'123456','한글깨짐','한글이\r\n깨져요','2024-04-30 10:06:25');
/*!40000 ALTER TABLE `freeborder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03 18:12:35
