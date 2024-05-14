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
-- Table structure for table `game_apply`
--

DROP TABLE IF EXISTS `game_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_apply` (
  `game_num` int(11) NOT NULL,
  `team_num` int(11) NOT NULL,
  `game_apply_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `game_applycol` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`game_applycol`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_apply`
--

LOCK TABLES `game_apply` WRITE;
/*!40000 ALTER TABLE `game_apply` DISABLE KEYS */;
INSERT INTO `game_apply` VALUES (1,12,'2024-04-01 18:09:15',1),(1,15,'2024-04-01 18:09:16',2),(1,10,'2024-04-01 18:09:38',3),(1,10,'2024-04-01 18:09:43',4),(11,10,'2024-04-01 18:10:27',5),(11,12,'2024-04-02 09:51:16',6),(11,11,'2024-04-02 09:51:30',7),(11,13,'2024-04-02 09:51:44',8),(12,12,'2024-04-02 09:57:24',9),(12,11,'2024-04-02 09:57:38',10),(12,11,'2024-04-02 10:01:08',11),(12,14,'2024-04-02 10:01:33',12),(12,15,'2024-04-02 10:01:45',13),(12,13,'2024-04-02 10:13:29',14),(12,16,'2024-04-02 10:14:05',15),(12,17,'2024-04-02 10:17:04',16),(7,11,'2024-04-02 10:17:20',17),(7,12,'2024-04-02 10:18:03',18),(5,10,'2024-04-02 10:18:09',19),(3,12,'2024-04-02 10:48:47',20),(3,13,'2024-04-02 10:49:25',21),(3,11,'2024-04-02 10:50:58',22),(3,14,'2024-04-02 10:51:05',23),(13,11,'2024-04-03 13:07:57',24),(14,15,'2024-04-03 14:34:07',25),(15,17,'2024-04-03 14:36:47',26),(15,25,'2024-04-03 15:25:52',27),(15,26,'2024-04-03 15:27:39',28),(15,12,'2024-04-03 15:35:51',29),(15,10,'2024-04-03 15:35:52',30),(15,16,'2024-04-03 15:35:53',31),(15,18,'2024-04-03 15:35:54',32),(15,22,'2024-04-03 15:35:57',33),(15,23,'2024-04-03 15:35:58',34),(15,24,'2024-04-03 15:36:00',35),(15,9,'2024-04-03 15:36:02',36),(15,14,'2024-04-03 15:36:06',37),(15,11,'2024-04-03 15:36:08',38),(15,13,'2024-04-03 15:36:10',39),(15,15,'2024-04-03 15:36:12',40),(15,19,'2024-04-03 15:36:17',41),(9,9,'2024-03-26 22:20:00',58),(9,10,'2024-03-26 22:20:00',59),(9,11,'2024-03-26 22:20:00',60),(9,12,'2024-03-26 22:20:00',61),(9,13,'2024-03-26 22:20:00',62),(9,14,'2024-03-26 22:20:00',63),(9,15,'2024-03-26 22:20:00',64),(9,16,'2024-03-26 22:20:00',65),(9,17,'2024-03-26 22:20:00',66),(9,18,'2024-03-26 22:20:00',67),(9,19,'2024-03-26 22:20:00',68),(9,20,'2024-03-26 22:20:00',69),(9,21,'2024-03-26 22:20:00',70),(9,22,'2024-03-26 22:20:00',71),(9,23,'2024-03-26 22:20:00',72),(9,24,'2024-03-26 22:20:00',73),(22,11,'2024-04-12 18:12:04',75),(27,26,'2024-04-18 13:17:10',76),(25,26,'2024-04-18 13:17:22',77),(22,26,'2024-04-18 13:17:33',78);
/*!40000 ALTER TABLE `game_apply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 18:12:46
