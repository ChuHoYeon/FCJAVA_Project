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
-- Table structure for table `stadium1`
--

DROP TABLE IF EXISTS `stadium1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium1` (
  `g_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `gmem_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `g_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `g_time` varchar(45) COLLATE utf8_bin NOT NULL,
  `g_size` varchar(45) COLLATE utf8_bin NOT NULL,
  `g_add` varchar(50) COLLATE utf8_bin NOT NULL,
  `g_memo` text COLLATE utf8_bin NOT NULL,
  `g_img` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `g_com_num` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `g_com_add` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `g_com_pnum` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`g_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium1`
--

LOCK TABLES `stadium1` WRITE;
/*!40000 ALTER TABLE `stadium1` DISABLE KEYS */;
INSERT INTO `stadium1` VALUES ('001','id1','잠실 종합운동장','06:00~24:00','104 x 68','송파구','좋아요',NULL,NULL,NULL,NULL),('002','id2','반포 종합운동장','06:00~24:00','110 x 74','서초구','좋아요',NULL,NULL,NULL,NULL),('003','id3','서울 월드컵 경기장','06:00~24:00','115 x 84','마포구','좋아요',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stadium1` ENABLE KEYS */;
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
