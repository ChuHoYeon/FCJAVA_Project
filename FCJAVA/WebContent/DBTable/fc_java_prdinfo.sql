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
-- Table structure for table `prdinfo`
--

DROP TABLE IF EXISTS `prdinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prdinfo` (
  `prd_no` int(11) NOT NULL AUTO_INCREMENT,
  `prd_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prd_price` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `prd_memo` text COLLATE utf8_bin,
  `prd_brand` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `prd_category` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `prd_image` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prd_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prdinfo`
--

LOCK TABLES `prdinfo` WRITE;
/*!40000 ALTER TABLE `prdinfo` DISABLE KEYS */;
INSERT INTO `prdinfo` VALUES (1,'리스폰스 CL','129,000','123','3123','123','4124'),(2,'Women originals Purple 스탠 스미스 CS','119,000','444','555','444','123'),(3,'424','1424','124','21414','124','24124'),(4,'1241','124124','4124124','142124124','4124124','142412'),(5,'englifsjdflsdjfjsldjflasdlkfjlksdafkljsdkljfklsjadklfj','1231','123','3123','123','4124'),(6,'í??ë??ê¸?ê°?ì?¼ì??','1231','123','3123','123','4124'),(7,'01123','011','11122','111','11122','3123'),(8,'hellow CLO','HElloW ','200,300','w','200,300','df');
/*!40000 ALTER TABLE `prdinfo` ENABLE KEYS */;
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
