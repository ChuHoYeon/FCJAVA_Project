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
-- Table structure for table `mem_info`
--

DROP TABLE IF EXISTS `mem_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mem_info` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `add` varchar(120) NOT NULL,
  `b_day` varchar(10) NOT NULL,
  `p_num` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `c_day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mem_info`
--

LOCK TABLES `mem_info` WRITE;
/*!40000 ALTER TABLE `mem_info` DISABLE KEYS */;
INSERT INTO `mem_info` VALUES ('1111','Qlqjs!','가나다라','(63249)제주특별자치도 제주시 제주대학로 21-1103동1102호','19450315','01112345678','woman','Email@gmail.com','2024-03-07 09:59:01'),('1234','!Qqq','추추','(08757)서울 관악구 양녕로 5sdf','19990618','01068116458','man','123@dssd.sd','2024-03-06 18:07:14'),('12345','!Qqq','추호연','(07049)서울 동작구 양녕로 153-9 sd','19990618','01068116458','man','123@gmail.com','2024-03-08 10:18:30'),('123456','!Qqq','홍길동','(08386)서울 구로구 구로동로 2 1001동2003호','19560204','01178294454','man','email@gmail.com','2024-03-20 11:30:50'),('3213','!Qqq','추추','(02830)서울 성북구 아리랑로 3 das','19990618','01068116458','man','123@dssd.sd','2024-03-07 13:06:05'),('dddd','aA123456789!','홍길동','(58327)전남 나주시 그린로 20 123','19990101','01011112222','man','ekke@gmail.com','2024-03-11 11:12:13'),('sdfasdfsdafs','!Qqq','한글','(13480)경기 성남시 분당구 대왕판교로 477 2334','19831111','0113840888','man','fsdfsdfsdfsd@fsdfsd.com','2024-03-08 18:20:21'),('test','!Qqq','홍길동','(26382)강원특별자치도 원주시 로아노크로 1 상세주소','20000101','01012345678','woman','test@naver.com','2024-03-08 10:19:51'),('test1','!Qqq','이름','(04766)서울 성동구 서울숲길 17 ㄴㅇ','19980305','01098761234','woman','email@gmail.com','2024-03-11 11:09:59'),('userid1234','Password1234@','홍길동','(13536)경기 성남시 분당구 판교역로2번길 1 111-1111','19990101','01012345678','woman','abced@gmail.com','2024-03-11 11:17:49');
/*!40000 ALTER TABLE `mem_info` ENABLE KEYS */;
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
