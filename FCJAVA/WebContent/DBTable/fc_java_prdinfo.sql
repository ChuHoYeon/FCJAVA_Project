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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prdinfo`
--

LOCK TABLES `prdinfo` WRITE;
/*!40000 ALTER TABLE `prdinfo` DISABLE KEYS */;
INSERT INTO `prdinfo` VALUES (9,'나이키 드라이 핏 파크20 팀 베스트 BIB(DV7425702)','17,100',NULL,'나이키',NULL,'DV7425702'),(10,'나이키 프리미어 리그 클럽 엘리트 축구공(FQ4967106)','71,100',NULL,'나이키',NULL,'FQ4967106'),(11,'나이키 브라질리아 9.5 더플백 스몰 41L(DM3976010)','40,500',NULL,'나이키',NULL,'DM3976010'),(12,'나이키 스트릭 무릎 패드 보호대(AC3444001)','47,700',NULL,'나이키',NULL,'AC3444001'),(13,'나이키 매치 골키퍼 글러브(FJ4862011)','35,100',NULL,'나이키',NULL,'FJ4862011'),(14,'푸마 퓨쳐 7 얼티메이트 FG/AG(10759903)','289,000',NULL,'푸마',NULL,'10759903'),(15,'나이키 짐 클래식 피트니스 글러브(AC4237010)','29,700',NULL,'나이키',NULL,'AC4237010'),(16,'나이키 짐 프리미엄 피트니스 글러브(AC4231010)','47,700',NULL,'나이키',NULL,'AC4231010'),(17,'나이키 드라이 핏 홈 어웨이 헤드밴드(AC3427101)','20,700',NULL,'나이키',NULL,'AC3427101'),(18,'나이키 스우시 더블 와이드 손목밴드(AC2287010)','17,100',NULL,'나이키',NULL,'AC2287010'),(19,'나이키 스우시 헤드 밴드(AC2285010)','14,400',NULL,'나이키',NULL,'AC2285010'),(20,'나이키 브라질리아 9.5 트레이닝 짐 쌕(DM3978010)','26,100',NULL,'나이키',NULL,'DM3978010'),(21,'나이키 드라이 핏 홈 어웨이 더블와이드 손목 밴드 2PK(AC3426022)','19,800',NULL,'나이키',NULL,'AC3426022'),(22,'나이키 풋볼 암 밴드 2.0(AC3912710)','17,100',NULL,'나이키',NULL,'AC3912710'),(23,'뉴발란스 암슬리브(B10119)','15,200',NULL,'뉴발란스',NULL,'B10119'),(24,'뉴발란스 LAB11100 OPP CORE SACKPACK(FG0419)','29,900',NULL,'뉴발란스',NULL,'FG0419'),(25,'뉴발란스 LAB11100 OPP CORE SACKPACK(FG0449)','29,900',NULL,'뉴발란스',NULL,'FG0449'),(26,'뉴발란스 우먼스 XL BUM BAG(SG0364)','49,900',NULL,'뉴발란스',NULL,'SG0364'),(27,'뉴발란스 OPP CORE SACKPACK(SG0419)','29,900',NULL,'뉴발란스',NULL,'SG0419'),(28,'뉴발란스 클래식 캔버스 토트백(SG0562)','59,900',NULL,'뉴발란스',NULL,'SG0562'),(29,'뉴발란스 퍼포먼스 바이저(NBGDDBSG0210)','39,900',NULL,'뉴발란스',NULL,'NBGDDBSG0210'),(30,'뉴발란스 6패널 시즈널 캡 모자(SG0310)','49,900',NULL,'뉴발란스',NULL,'SG0310'),(31,'뉴발란스 6패널 시즈널 캡 모자(SG0340)','49,900',NULL,'뉴발란스',NULL,'SG0340'),(32,'뉴발란스 6패널 시즈널 캡 모자(SG0350)','49,900',NULL,'뉴발란스',NULL,'SG0350'),(33,'NB 팀 크루 삭스(410250)','12,000',NULL,'뉴발란스',NULL,'410250'),(34,'NB 팀 크루 삭스(810220)','12,000',NULL,'뉴발란스',NULL,'810220'),(35,'NB 리플렉티브 헤드 밴드(730325)','15,200',NULL,'뉴발란스',NULL,'730325'),(36,'NB 리플렉티브 헤드 밴드(730451)','15,200',NULL,'뉴발란스',NULL,'730451'),(37,'NB 프린트 벨벳 헤드 밴드(730520)','15,200',NULL,'뉴발란스',NULL,'730520'),(38,'NB 프린트 벨벳 헤드 밴드(730525)','15,200',NULL,'뉴발란스',NULL,'730525');
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

-- Dump completed on 2024-05-29 15:16:33
