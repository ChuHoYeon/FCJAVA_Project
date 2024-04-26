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
-- Table structure for table `t_formation`
--

DROP TABLE IF EXISTS `t_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_formation` (
  `formation_num` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` int(11) NOT NULL,
  `formation` varchar(10) NOT NULL,
  `formation_name` varchar(7) NOT NULL,
  `position_num` int(11) NOT NULL,
  `player_id` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`formation_num`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_formation`
--

LOCK TABLES `t_formation` WRITE;
/*!40000 ALTER TABLE `t_formation` DISABLE KEYS */;
INSERT INTO `t_formation` VALUES (8,26,'4-4-2','포메이션1',1,'123456','2024-04-23 10:58:44'),(9,26,'4-4-2','포메이션1',2,'24Y79t99','2024-04-23 10:58:44'),(10,26,'4-4-2','포메이션1',3,'22t32C4X67119bw0','2024-04-23 10:58:44'),(11,26,'4-4-2','포메이션1',4,'1WvXHE2H8RZ3r841','2024-04-23 10:58:44'),(12,26,'4-4-2','포메이션1',5,'1if32EcHx','2024-04-23 10:58:44'),(13,26,'4-4-2','포메이션1',6,'1CA6O9Uf8j','2024-04-23 10:58:44'),(14,26,'4-4-2','포메이션1',7,'1AwEb','2024-04-23 10:58:44'),(15,26,'4-4-2','포메이션1',8,'13qDK','2024-04-23 10:58:44'),(16,26,'4-4-2','포메이션1',9,'3213','2024-04-23 10:58:44'),(17,26,'4-4-2','포메이션1',10,'1111','2024-04-23 10:58:44'),(18,26,'4-4-2','포메이션1',11,'12345','2024-04-23 10:58:44'),(19,26,'4-1-4-1','포메이션2',1,'1CA6O9Uf8j','2024-04-23 10:58:44'),(20,26,'4-1-4-1','포메이션2',2,'1AwEb','2024-04-23 10:58:44'),(21,26,'4-1-4-1','포메이션2',3,'13qDK','2024-04-23 10:58:44'),(22,26,'4-1-4-1','포메이션2',4,'3213','2024-04-23 10:58:44'),(23,26,'4-1-4-1','포메이션2',5,'1111','2024-04-23 10:58:44'),(24,26,'4-1-4-1','포메이션2',6,'12345','2024-04-23 10:58:44'),(25,26,'4-1-4-1','포메이션2',7,'1if32EcHx','2024-04-23 10:58:44'),(26,26,'4-1-4-1','포메이션2',8,'1WvXHE2H8RZ3r841','2024-04-23 10:58:44'),(27,26,'4-1-4-1','포메이션2',9,'22t32C4X67119bw0','2024-04-23 10:58:44'),(28,26,'4-1-4-1','포메이션2',10,'24Y79t99','2024-04-23 10:58:44'),(29,26,'4-1-4-1','포메이션2',11,'123456','2024-04-23 10:58:44'),(30,26,'3-1-4-2','포메이션3',1,'1111','2024-04-25 11:03:10'),(31,26,'3-1-4-2','포메이션3',2,'3213','2024-04-25 11:03:10'),(32,26,'3-1-4-2','포메이션3',3,'13qDK','2024-04-25 11:03:10'),(33,26,'3-1-4-2','포메이션3',4,'1AwEb','2024-04-25 11:03:10'),(34,26,'3-1-4-2','포메이션3',5,'123456','2024-04-25 11:03:10'),(35,26,'3-1-4-2','포메이션3',6,'12345','2024-04-25 11:03:10'),(36,26,'3-1-4-2','포메이션3',7,'1if32EcHx','2024-04-25 11:03:10'),(37,26,'3-1-4-2','포메이션3',8,'1CA6O9Uf8j','2024-04-25 11:03:10'),(38,26,'3-1-4-2','포메이션3',9,'1WvXHE2H8RZ3r841','2024-04-25 11:03:10'),(39,26,'3-1-4-2','포메이션3',10,'22t32C4X67119bw0','2024-04-25 11:03:10'),(40,26,'3-1-4-2','포메이션3',11,'24Y79t99','2024-04-25 11:03:10'),(41,26,'3-1-4-2','ff',1,'1if32EcHx','2024-04-26 09:47:10'),(42,26,'3-1-4-2','ff',2,'1CA6O9Uf8j','2024-04-26 09:47:10'),(43,26,'3-1-4-2','ff',3,'1WvXHE2H8RZ3r841','2024-04-26 09:47:10'),(44,26,'3-1-4-2','ff',4,'22t32C4X67119bw0','2024-04-26 09:47:10'),(45,26,'3-1-4-2','ff',5,'24Y79t99','2024-04-26 09:47:10'),(46,26,'3-1-4-2','ff',6,'2Z4wn','2024-04-26 09:47:10'),(47,26,'3-1-4-2','ff',7,'123456','2024-04-26 09:47:10'),(48,26,'3-1-4-2','ff',8,'3213','2024-04-26 09:47:10'),(49,26,'3-1-4-2','ff',9,'13qDK','2024-04-26 09:47:10'),(50,26,'3-1-4-2','ff',10,'1AwEb','2024-04-26 09:47:10'),(51,26,'3-1-4-2','ff',11,'1111','2024-04-26 09:47:10');
/*!40000 ALTER TABLE `t_formation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26 18:23:39
