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
-- Table structure for table `board_1`
--

DROP TABLE IF EXISTS `board_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_1` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `bon` text NOT NULL,
  `c_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `u_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_1`
--

LOCK TABLES `board_1` WRITE;
/*!40000 ALTER TABLE `board_1` DISABLE KEYS */;
INSERT INTO `board_1` VALUES (5,'title section','hellow','2024-03-14 12:31:37','2024-03-14 12:31:37',''),(6,'title section','hellow','2024-03-14 12:35:41','2024-03-14 12:35:41',''),(7,'title1 입니다','hello 월드 안녕 하세요 ','2024-03-14 12:41:25','2024-03-14 12:41:25',''),(8,'title2 입니다',' 입력된 글입니다 본문 내용은 2줄이상 나오게 되며  안녕 하세요 ','2024-03-14 12:41:51','2024-03-14 12:41:51',''),(9,'title3 입니다. ','본라라','2024-03-14 14:52:26','2024-03-14 14:52:26','nooooood'),(10,'title3 입니다. ','4124124124124dsdfkasksaㄹfksdfksdfksdkf라라라라라라라라라라라라라ㅏㄴ이러ㅏㄴㅇㅁ린아ㅣㅓ라ㅣ너이런ㅁㅇ린ㅇ런ㅇ','2024-03-14 15:05:09','2024-03-14 15:05:09','nooooood'),(11,'ddddd',' ddddd','2024-03-19 12:30:33','2024-03-19 12:30:33','default_user'),(12,'fsdf',' dsfsdf','2024-03-19 12:34:51','2024-03-19 12:34:51','default_user'),(13,'fsdfsd',' fsdfsdfsfsdfsdf','2024-03-19 12:36:04','2024-03-19 12:36:04','default_user'),(14,'ë§ì§ë§ ê¸ì°ê¸° ìëë¤',' ããããã','2024-03-19 12:36:50','2024-03-19 12:36:50','default_user'),(15,'34324',' 25235235','2024-03-19 12:39:12','2024-03-19 12:39:12','default_user'),(16,'íê¸ë¡ ì¨ë´ìë¤',' ì´ë¬ë©´ ê¹¨ì§','2024-03-19 12:39:34','2024-03-19 12:39:34','default_user'),(17,'3423',' 234234','2024-03-19 12:41:15','2024-03-19 12:41:15','default_user'),(18,'ㄹㄴㅇㄹㄴ',' ㄹㄴㅇㄹㄴㅇㄹ','2024-03-19 12:57:00','2024-03-19 12:57:00','default_user');
/*!40000 ALTER TABLE `board_1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 18:23:06
