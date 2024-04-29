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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_num` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `game_type` int(11) NOT NULL,
  `game_place` varchar(45) COLLATE utf8_bin NOT NULL,
  `game_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `game_memo` text COLLATE utf8_bin,
  `game_subst_date` datetime NOT NULL,
  `game_subfn_date` datetime NOT NULL,
  `game_st_date` datetime NOT NULL,
  `game_fn_date` datetime NOT NULL,
  PRIMARY KEY (`game_num`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'24년3월4째주 토너먼트대회',4,'어디어디축구장',NULL,NULL,'2024-03-20 12:00:00','2024-03-25 17:36:59','2024-03-27 14:20:00','2024-03-29 18:00:00'),(2,'24년4월1째주 토너먼트대회',32,'저기저기축구장',NULL,'많은 참여 바람','2024-03-25 18:00:00','2024-03-30 22:00:00','2024-04-01 10:20:00','2024-04-05 19:30:00'),(3,'월드컵',4,'서울 축구장',NULL,'FIFA 월드컵은 매년 열리는 국제 축구 대회입니다.','2024-03-26 15:30:00','2024-03-26 18:00:00','2024-03-27 10:00:00','2024-03-27 12:00:00'),(4,'유로파 리그',8,'부산 축구장',NULL,'UEFA 유로파 리그는 유럽의 클럽 간 축구 대회입니다.','2024-03-26 16:00:00','2024-03-26 19:00:00','2024-03-27 11:00:00','2024-03-27 13:00:00'),(5,'챔피언스 리그',16,'대구 축구장',NULL,'UEFA 챔피언스 리그는 유럽의 최고 클럽 간의 축구 대회입니다.','2024-03-26 17:00:00','2024-03-26 20:00:00','2024-03-27 12:00:00','2024-03-27 14:00:00'),(6,'프리미어 리그',32,'인천 축구장',NULL,'프리미어 리그는 잉글랜드의 최상위 축구 리그입니다.','2024-03-26 18:00:00','2024-03-26 21:00:00','2024-03-27 13:00:00','2024-03-27 15:00:00'),(7,'라 리가',4,'광주 축구장',NULL,'라 리가는 스페인의 최상위 축구 리그입니다.','2024-03-26 19:00:00','2024-03-26 22:00:00','2024-03-27 14:00:00','2024-03-27 16:00:00'),(8,'분데스리가',8,'대전 축구장',NULL,'분데스리가는 독일의 최상위 축구 리그입니다.','2024-03-26 20:00:00','2024-03-26 23:00:00','2024-03-27 15:00:00','2024-03-27 17:00:00'),(9,'세리에 A',16,'울산 축구장',NULL,'세리에 A는 이탈리아의 최상위 축구 리그입니다.','2024-03-26 21:00:00','2024-03-27 00:00:00','2024-03-27 16:00:00','2024-03-27 18:00:00'),(10,'리그 앙',32,'세종 축구장',NULL,'리그 앙은 프랑스의 최상위 축구 리그입니다.','2024-03-26 22:00:00','2024-03-27 01:00:00','2024-03-27 17:00:00','2024-03-27 19:00:00'),(11,'프라임리그',4,'경기 축구장',NULL,'프라임리그는 브라질의 최상위 축구 리그입니다.','2024-03-26 23:00:00','2024-03-27 02:00:00','2024-03-27 18:00:00','2024-03-27 23:00:00'),(12,'프리메라 리그',8,'제주 축구장',NULL,'프리메라 리그는 스페인의 두 번째 축구 리그입니다.','2024-03-27 00:00:00','2024-03-27 03:00:00','2024-03-27 19:00:00','2024-03-27 21:00:00'),(13,'축구 대회 1',4,'공원 체육관',NULL,'4인 팀으로 진행되는 축구 대회입니다.','2024-04-01 09:00:00','2024-04-10 18:00:00','2024-04-20 09:00:00','2024-04-25 18:00:00'),(14,'축구 대회 2',8,'체육관',NULL,'8인 팀으로 진행되는 축구 대회입니다.','2024-04-02 09:00:00','2024-04-11 18:00:00','2024-04-21 09:00:00','2024-04-26 18:00:00'),(15,'축구 대회 3',16,'체육관',NULL,'16인 팀으로 진행되는 축구 대회입니다.','2024-04-03 09:00:00','2024-04-12 18:00:00','2024-04-22 09:00:00','2024-04-27 18:00:00'),(16,'축구 대회 4',32,'축구장',NULL,'32인 팀으로 진행되는 축구 대회입니다.','2024-04-04 09:00:00','2024-04-13 18:00:00','2024-04-23 09:00:00','2024-04-28 18:00:00'),(17,'축구 대회 5',4,'공원',NULL,'4인 팀으로 진행되는 축구 대회입니다.','2024-04-05 09:00:00','2024-04-14 18:00:00','2024-04-24 09:00:00','2024-04-29 18:00:00'),(18,'축구 대회 6',8,'체육관',NULL,'8인 팀으로 진행되는 축구 대회입니다.','2024-04-06 09:00:00','2024-04-15 18:00:00','2024-04-25 09:00:00','2024-04-30 18:00:00'),(19,'축구 대회 7',16,'체육관',NULL,'16인 팀으로 진행되는 축구 대회입니다.','2024-04-07 09:00:00','2024-04-16 18:00:00','2024-04-26 09:00:00','2024-05-01 18:00:00'),(20,'축구 대회 8',32,'축구장',NULL,'32인 팀으로 진행되는 축구 대회입니다.','2024-04-08 09:00:00','2024-04-17 18:00:00','2024-04-27 09:00:00','2024-05-02 18:00:00'),(21,'축구 대회 9',4,'공원',NULL,'4인 팀으로 진행되는 축구 대회입니다.','2024-04-09 09:00:00','2024-04-18 18:00:00','2024-04-28 09:00:00','2024-05-03 18:00:00'),(22,'축구 대회 10',8,'체육관',NULL,'8인 팀으로 진행되는 축구 대회입니다.','2024-04-10 09:00:00','2024-04-19 18:00:00','2024-04-29 09:00:00','2024-05-04 18:00:00'),(23,'축구 대회 11',16,'체육관',NULL,'16인 팀으로 진행되는 축구 대회입니다.','2024-04-11 09:00:00','2024-04-20 18:00:00','2024-04-30 09:00:00','2024-05-05 18:00:00'),(24,'축구 대회 12',32,'축구장',NULL,'32인 팀으로 진행되는 축구 대회입니다.','2024-04-12 09:00:00','2024-04-21 18:00:00','2024-05-01 09:00:00','2024-05-06 18:00:00'),(25,'축구 대회 13',4,'공원',NULL,'4인 팀으로 진행되는 축구 대회입니다.','2024-04-13 09:00:00','2024-04-22 18:00:00','2024-05-02 09:00:00','2024-05-07 18:00:00'),(26,'축구 대회 14',8,'체육관',NULL,'8인 팀으로 진행되는 축구 대회입니다.','2024-04-14 09:00:00','2024-04-23 18:00:00','2024-05-03 09:00:00','2024-05-08 18:00:00'),(27,'축구 대회 15',16,'체육관',NULL,'16인 팀으로 진행되는 축구 대회입니다.','2024-04-15 09:00:00','2024-04-24 18:00:00','2024-05-04 09:00:00','2024-05-09 18:00:00'),(28,'축구 대회 16',32,'축구장',NULL,'32인 팀으로 진행되는 축구 대회입니다.','2024-04-16 09:00:00','2024-04-25 18:00:00','2024-05-05 09:00:00','2024-05-10 18:00:00'),(29,'축구 대회 17',4,'공원',NULL,'4인 팀으로 진행되는 축구 대회입니다.','2024-04-17 09:00:00','2024-04-26 18:00:00','2024-05-06 09:00:00','2024-05-11 18:00:00'),(30,'축구 대회 18',8,'체육관',NULL,'8인 팀으로 진행되는 축구 대회입니다.','2024-04-18 09:00:00','2024-04-27 18:00:00','2024-05-07 09:00:00','2024-05-12 18:00:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 18:11:29
