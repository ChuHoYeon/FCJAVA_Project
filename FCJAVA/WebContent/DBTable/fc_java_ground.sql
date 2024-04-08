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
-- Table structure for table `ground`
--

DROP TABLE IF EXISTS `ground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ground` (
  `g_no` varchar(20) NOT NULL,
  `gmem_id` varchar(20) NOT NULL,
  `g_add` varchar(250) NOT NULL,
  `g_name` varchar(20) NOT NULL,
  `g_type` int(11) NOT NULL,
  `g_photo` varchar(250) NOT NULL,
  `g_memo` text NOT NULL,
  `g_com_name` varchar(50) NOT NULL,
  `g_com_num` varchar(15) NOT NULL,
  `g_com_add` varchar(120) NOT NULL,
  `g_com_pnum` varchar(20) NOT NULL,
  `g_com_licence` varchar(250) NOT NULL,
  `g_homepage` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`g_no`),
  KEY `gmem_id_idx` (`gmem_id`),
  CONSTRAINT `gmem_id` FOREIGN KEY (`gmem_id`) REFERENCES `g_mem_info` (`gmem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ground`
--

LOCK TABLES `ground` WRITE;
/*!40000 ALTER TABLE `ground` DISABLE KEYS */;
/*!40000 ALTER TABLE `ground` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 18:23:09
