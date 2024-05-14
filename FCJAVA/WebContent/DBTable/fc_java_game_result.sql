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
-- Table structure for table `game_result`
--

DROP TABLE IF EXISTS `game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_result` (
  `game_resultcol` int(11) NOT NULL AUTO_INCREMENT,
  `game_num` int(11) NOT NULL,
  `game_type` int(11) NOT NULL,
  `team1_num` int(11) NOT NULL,
  `team1_score` int(11) NOT NULL,
  `team2_num` int(11) NOT NULL,
  `team2_score` int(11) NOT NULL,
  `game_date` datetime NOT NULL,
  PRIMARY KEY (`game_resultcol`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result`
--

LOCK TABLES `game_result` WRITE;
/*!40000 ALTER TABLE `game_result` DISABLE KEYS */;
INSERT INTO `game_result` VALUES (1,11,4,10,2,11,1,'2024-03-27 19:10:00'),(2,11,4,12,3,13,0,'2024-03-27 20:10:00'),(3,11,2,10,1,12,3,'2024-03-27 22:50:00'),(4,3,4,12,4,13,5,'2024-03-27 10:00:00'),(5,3,4,11,2,14,1,'2024-03-27 11:00:00'),(6,3,2,13,6,11,1,'2024-03-27 12:00:00'),(7,9,16,9,4,10,5,'2024-03-27 16:00:00'),(8,9,16,11,5,12,1,'2024-03-27 16:00:00'),(9,9,16,13,9,14,4,'2024-03-27 16:00:00'),(10,9,16,15,3,16,5,'2024-03-27 16:00:00'),(11,9,16,17,4,18,5,'2024-03-27 16:00:00'),(12,9,16,19,5,20,2,'2024-03-27 16:00:00'),(13,9,16,21,3,22,0,'2024-03-27 16:00:00'),(14,9,16,23,1,24,7,'2024-03-27 16:00:00'),(15,9,8,10,4,11,8,'2024-03-27 17:00:00'),(16,9,8,13,7,16,5,'2024-03-27 17:00:00'),(17,9,8,18,1,19,3,'2024-03-27 17:00:00'),(18,9,8,21,3,14,6,'2024-03-27 17:00:00'),(19,9,4,11,0,13,5,'2024-03-27 17:40:00'),(20,9,4,19,5,14,1,'2024-03-27 17:40:00'),(21,9,2,13,9,19,3,'2024-03-27 18:00:00');
/*!40000 ALTER TABLE `game_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 18:12:48
