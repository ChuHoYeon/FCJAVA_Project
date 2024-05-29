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
  `g_no` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium1`
--

LOCK TABLES `stadium1` WRITE;
/*!40000 ALTER TABLE `stadium1` DISABLE KEYS */;
INSERT INTO `stadium1` VALUES (1,'id1','잠실 종합운동장','06:00~24:00','104 x 68','잠실동 10','좋아요',NULL,NULL,NULL,NULL),(2,'id2','반포 종합운동장','06:00~24:00','110 x 74','서울 서초구 반포동 15-2','좋아요',NULL,NULL,NULL,NULL),(3,'id3','서울 월드컵 경기장','06:00~24:00','115 x 84','서울 마포구 월드컵로 240','좋아요',NULL,NULL,NULL,NULL),(4,'id4','효창운동장','06:00~24:00','106 x 69','서울 용산구 효창원로 177-15 효창운동장','좋아요',NULL,NULL,NULL,NULL),(5,'id5','수원 월드컵 경기장 1','06:00~24:00','110 x 72','경기도 수원시 팔달구 월드컵로 310','좋아요',NULL,NULL,NULL,NULL),(6,'id6','수원 월드컵 경기장 2	','06:00~24:00','110 x 72','경기도 수원시 팔달구 월드컵로 310','좋아요',NULL,NULL,NULL,NULL),(7,'id7','백운포체육공원(인조축구장1)','06:00~24:00','107 x 70','부산광역시 남구 백운포로 108(백운포 체육공원)','좋아요',NULL,NULL,NULL,NULL),(8,'id8','백운포체육공원(인조축구장2)','06:00~24:00','107 x 70','부산광역시 남구 백운포로 108(백운포 체육공원)','좋아요',NULL,NULL,NULL,NULL),(9,'id9','신호공원 인조잔디운동장','06:00~24:00','106 x 70','부산 강서구 신호산단1로72번길 46 (신호동) 신호공원','좋아요',NULL,NULL,NULL,NULL),(10,'id10','글로벌교육센터 잔디구장','06:00~24:00','112 x 81','충청북도 충주시 신니면 모남1길 180 예금보험공사 글로벌교육센터','좋아요',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2024-05-29 15:16:34
