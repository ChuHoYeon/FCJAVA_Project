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
-- Table structure for table `team_info`
--

DROP TABLE IF EXISTS `team_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_info` (
  `t_num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `t_name` varchar(20) NOT NULL,
  `t_logo` varchar(255) DEFAULT NULL,
  `hom_city` varchar(30) NOT NULL,
  `week_time` varchar(10) NOT NULL,
  `t_info` text,
  `t_c_day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_p_num` int(11) NOT NULL,
  `t_skill` varchar(10) NOT NULL,
  `t_sns` varchar(255) DEFAULT NULL,
  `t_age` varchar(10) NOT NULL,
  PRIMARY KEY (`t_num`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_info`
--

LOCK TABLES `team_info` WRITE;
/*!40000 ALTER TABLE `team_info` DISABLE KEYS */;
INSERT INTO `team_info` VALUES (9,'1234','테스트팀1111',NULL,'경상북도','수목금토','','2024-03-19 11:52:24',23,'아마추어','','20~30대'),(10,'1234','팀만들기 테스트',NULL,'충청북도','월화수목금토일','','2024-03-19 12:06:54',43,'세미프로','','50~60대'),(11,'1234','팀테스트1',NULL,'전라북도','월화목토일','123ㅇㄴㅁㄹㄴㅁㅇㄹㄴㅁ','2024-03-19 12:07:37',11,'프로','43425ㅁㄴㄹㅇㅁㄴㄹ','20~30대'),(12,'xVl3P','KFA','kfa.png','경기도','월화수목금토일','KFA입니다.','2024-05-07 17:57:00',64,'프로','https://www.kfa.or.kr/','20~30대'),(13,'1234','팀테스트3',NULL,'전라남도','수금일','','2024-03-19 12:35:34',82,'세미프로','','50~60대'),(14,'1234','팀테스트4',NULL,'강원도','수목금토','','2024-03-19 12:36:36',32,'아마추어','','30~40대'),(15,'1234','팀테스트5',NULL,'강원도','화수목','124','2024-03-19 12:36:55',32,'아마추어','ㄴㄻㅇㄹㄴㅇ','20~30대'),(16,'1234','테스트팀6',NULL,'충청남도','금일','ㄻㄴㅇ','2024-03-19 16:11:43',23,'아마추어','ㄹㄴㅇㅁㄹ','30~40대'),(17,'1234','테스트팀7',NULL,'충청북도','목토','23423','2024-03-19 16:11:56',14,'아마추어','4234','20~30대'),(18,'1234','테스트팀8',NULL,'전라남도','수금','123','2024-03-19 16:12:05',23,'아마추어','254ㅎㅇ','30~40대'),(19,'1234','테스트팀9',NULL,'전라남도','월화목일','','2024-03-19 16:12:20',14,'세미프로','','50~60대'),(20,'123456','팀테스트14',NULL,'경상북도','월수','','2024-03-20 11:41:08',22,'아마추어','','30~40대'),(21,'123456','테스트팀10',NULL,'충청북도','수금','','2024-03-20 11:41:33',23,'아마추어','','30~40대'),(22,'1234','테스트팀11',NULL,'경기도','수금','','2024-03-20 17:47:47',33,'아마추어','','40~50대'),(23,'1234','테스트팀12',NULL,'충청북도','화수목','ㄹㄴㅁㅇ','2024-03-22 14:40:02',43,'세미프로','ㄹㄴㅇㅁㄹ','10~20대'),(24,'1234','테스트팀13',NULL,'제주도','수금','ㄹㄴㅁㅇ','2024-03-26 18:01:45',23,'뉴비','ㄻㄴㅇ','30~40대'),(25,'12345','마이팀',NULL,'충청북도','목금','12','2024-04-03 15:19:30',23,'아마추어','213','30~40대'),(26,'123456','우리팀',NULL,'전라남도','수목','ㄴㄹㅇㅁ','2024-04-03 15:26:53',34,'프로','ㄴㅇㅁㄹ','20~30대'),(38,'1231','FC오리','teamlogo41.png','강원도','금','','2024-04-30 17:29:09',32,'비기너','','20~30대'),(39,'1231','TITANES FC','teamlogo102.png','충청북도','화수목금일','TITANES FC입니다.','2024-05-07 16:58:23',88,'비기너','','30~40대'),(40,'1231','FC MASTERS','teamlogo2.png','경상북도','금토일','FC MASTERS입니다.','2024-05-07 17:02:22',50,'아마추어','https://www.naver.com/','40~50대'),(41,'zZ5LYv4','EDMONTON FC','teamlogo63.png','전라북도','월화수목금','EDMONTON FC 입니다.','2024-05-07 17:05:38',40,'프로','https://www.daum.net/','20~30대'),(42,'zZ5LYv4','축구조아','teamlogo82.png','경기도','월화수목금토일','축구조아에서 함께 축구해요!!','2024-05-07 17:13:12',67,'아마추어','https://www.instagram.com/movie/','20~30대'),(43,'ZiR8I6Gl2gu','FC WATCH','teamlogo71.png','전라남도','월수금','FC WATCH입니다.\r\n같이 축구해요!!','2024-05-07 17:17:58',34,'아마추어','','50~60대');
/*!40000 ALTER TABLE `team_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 18:03:53
