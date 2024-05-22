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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_info`
--

LOCK TABLES `team_info` WRITE;
/*!40000 ALTER TABLE `team_info` DISABLE KEYS */;
INSERT INTO `team_info` VALUES (9,'vAycmV1lB0','PSG','psg.svg','경기도','월화목금','PSG입니다','2024-05-08 13:11:36',33,'세미프로','','30~40대'),(10,'W26NP','FC FIRE','fire.jpg','전라북도','화금토','FC FIRE입니다.','2024-05-08 13:02:21',64,'비기너','','30~40대'),(11,'ZiR8I6Gl2gu','FC WATCH','teamlogo71.png','전라남도','월수금','FC WATCH입니다.\r\n같이 축구해요!!','2024-05-07 17:17:58',34,'아마추어','','50~60대'),(12,'xVl3P','KFA','kfa.png','경기도','월화수목금토일','KFA입니다.','2024-05-07 17:57:00',64,'프로','https://www.kfa.or.kr/','20~30대'),(13,'123456','FC BAYERN','bayern.png','강원도','화수목금','FC BAYERN입니다.','2024-05-08 15:02:04',87,'아마추어','','20~30대'),(14,'zZ5LYv4','축구조아','teamlogo82.png','경기도','월화수목금토일','축구조아에서 함께 축구해요!!','2024-05-07 17:13:12',67,'아마추어','https://www.instagram.com/movie/','20~30대'),(15,'zZ5LYv4','EDMONTON FC','teamlogo63.png','전라북도','월화수목금','EDMONTON FC 입니다.','2024-05-07 17:05:38',40,'프로','https://www.daum.net/','20~30대'),(16,'1231','FC MASTERS','teamlogo2.png','경상북도','금토일','FC MASTERS입니다.','2024-05-07 17:02:22',50,'아마추어','https://www.naver.com/','40~50대'),(17,'1231','TITANES FC','teamlogo102.png','충청북도','화수목금일','TITANES FC입니다.','2024-05-07 16:58:23',88,'비기너','','30~40대'),(18,'3YJ83l','READING FC','rfc.png','강원도','수금토일','READING FC입니다.','2024-05-08 15:11:48',85,'세미프로','','40~50대'),(19,'32YMXjc9Qe5nn0l','MANCHESTER UNITED FC','manu.svg','경상남도','화목금토일','MANCHESTER UNITED FC입니다.','2024-05-08 15:10:19',63,'프로','','40~50대'),(20,'4tHEUGE2P0','Chelsea FC','chelsea.png','전라북도','화금','Chelsea FC입니다.','2024-05-08 15:22:48',78,'아마추어','https://www.chelseamegastore.com/ko/','30~40대'),(21,'9xP6','초보만오세요','istockphoto-1407073099-612x612.jpg','경기도','토일','축구 초보자 구합니다!!','2024-05-08 15:41:15',78,'뉴비','','20~30대'),(22,'91LY5','INNOVATION FC','72b978f6e3076.png','강원도','수목','INNOVATION FC 입니다.','2024-05-08 15:39:50',64,'아마추어','','40~50대'),(23,'7M45d11','FC 축구공','ball1.jpg','전라북도','화','FC 축구공 입니다. 같이하실분 구합니다!','2024-05-08 15:38:51',67,'비기너','','30~40대'),(24,'709P1','Arsenal FC','arsenal.jpg','강원도','수목금','Arsenal FC입니다.','2024-05-08 15:37:16',67,'비기너','https://www.arsenal.com/','30~40대'),(25,'12345','마이팀',NULL,'충청북도','목금','마이팀에서 같이하실분 구해요!!','2024-04-03 15:19:30',23,'아마추어','','30~40대'),(26,'123456','우리팀',NULL,'전라남도','수목','우리팀원 모집합니다!','2024-04-03 15:26:53',34,'프로','','20~30대'),(38,'1231','FC오리','teamlogo41.png','강원도','금','꽥꽥꽥','2024-04-30 17:29:09',32,'비기너','','20~30대'),(42,'1234','FC 아리아','logo12.jpg','경기도','금토일','안녕하세요','2024-05-20 11:22:22',67,'비기너','','20~30대');
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

-- Dump completed on 2024-05-22 18:10:56
