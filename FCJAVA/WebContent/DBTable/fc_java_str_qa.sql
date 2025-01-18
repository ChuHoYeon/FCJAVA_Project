-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fc_java
-- ------------------------------------------------------
-- Server version	8.0.36-2ubuntu3

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
-- Table structure for table `str_qa`
--

DROP TABLE IF EXISTS `str_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `str_qa` (
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `u_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `today` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `str_qa`
--

LOCK TABLES `str_qa` WRITE;
/*!40000 ALTER TABLE `str_qa` DISABLE KEYS */;
INSERT INTO `str_qa` VALUES ('제목입니다.','사용자1','내용입니다.','2024-03-14 15:54:37'),('제목입니다.','사용자1','내용입니다.','2024-03-14 15:54:38'),('제목입니다.','사용자1','내용입니다.','2024-03-14 15:54:43'),('제목입니다.','사용자1','내용입니다.','2024-03-14 15:54:44'),('새로운 제목','새로운 사용자','새로운 내용','2024-03-18 12:45:24'),('구장 목록','메시','새로운 내용','2024-03-18 12:46:49'),('구장 목록','호날두','새로운 내용','2024-03-18 12:46:49'),('구장 목록','손흥민','새로운 내용','2024-03-18 12:46:49'),('구장 목록','김민재','새로운 내용','2024-03-18 12:46:49'),('구장 목록','이강인','새로운 내용','2024-03-18 12:46:49');
/*!40000 ALTER TABLE `str_qa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07  0:25:38
