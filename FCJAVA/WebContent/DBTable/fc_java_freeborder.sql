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
-- Table structure for table `freeborder`
--

DROP TABLE IF EXISTS `freeborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freeborder` (
  `number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `memo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeborder`
--

LOCK TABLES `freeborder` WRITE;
/*!40000 ALTER TABLE `freeborder` DISABLE KEYS */;
INSERT INTO `freeborder` VALUES (9,'1234','제목입니다.','올라갈까요?!!!!!!$@#$!@!$','2024-03-13 11:56:07'),(10,'1234','제목입니다.','올라갈까요?','2024-03-13 11:56:46'),(12,'1234','ㅠㅊㅍㅌ','ㅏㅓㅣ;','2024-03-13 12:09:04'),(13,'1234','제목을 입력했습니다.','글 내용을 입력했습니다.','2024-03-13 12:38:38'),(14,'1234','제목만 입력했습니다.','ㄴㅁㅇ','2024-03-13 12:38:55'),(20,'1234','test','test','2024-03-14 12:21:48'),(21,'1234','이게 맞는지 모르겠다~~~~~','정말 모르겠다~~~~~~~~~~~','2024-03-14 12:49:18'),(23,'1234','dsa','dsadsa','2024-03-15 13:55:44'),(24,'1234','test','test','2024-03-15 15:04:54'),(25,'1234','test1','test1','2024-03-15 15:05:00'),(26,'1234','카카는 뭔가.. 유니크했음','분명 위치는 공격형 미드필더인데 \r\n\r\n뭐지? 공격수인가 싶다가도 미친 돌파후 킬패스\r\n\r\n아 공미지 참 하고있으면 미친 오프더볼로, 킥력으로 득점 \r\n\r\n아 공격순가?\r\n\r\n그리고 그 수많은 임팩트들 중 단연코 손에꼽히는\r\n\r\n맨유박살낸 그경기.. \r\n\r\n단독 파괴력에 낭만까지 챙김..\r\n\r\n뭔가 엄청난 강호 밀란 안에서도 꽃중의 꽃이었달까\r\n','2024-03-15 15:05:13'),(27,'1234','덕배 전성기가 길긴 하네요','볼프스부터 치면 거진 10년은 꾸준한거 같은데\r\n\r\n카카랑 vs 나오는게 이상한건 아닌듯','2024-03-15 15:05:20'),(28,'12345','근데 카카 전성기가 빨리 지게 된 이유가 먼가요?','예전에는 축구에 관심도 덜했고, 또  카카를 좋아하지 않아서 관심이 없었는데 \r\n\r\n요즘 보니 카카가 엄청 잘햇더라구요. \r\n\r\n카카전성기가 마드리드로 옮기고 나서 훅간거 같던데 왜 전성기가 빨리 끝났는지 알고 싶습니다.','2024-03-15 17:02:55'),(30,'12345','근데 확실히 예전 브라질 레전드들이 축구를 쉽게 하는 게 있었음ㅋㅋㅋ','물론 이들이 다 역사에 남을 레전드들이라 그런 것도 있지만, 보면 축구 자체를 엄청 쉽게 함ㅋㅋㅋ\r\n\r\n \r\n\r\n뭐 화려한 드리블이나 개인기를 차치하고 그냥 간결하게 팍팍! 슛도 잘하고 패스도 뛰어난 데...\r\n\r\n \r\n\r\n이런 레전드들 보다가 요새 브라질 국대 애들 보면 축구를 그냥 어렵게 함 아니, 그냥 못함. \r\n\r\n \r\n\r\n확실히 클라스가 달랐어요ㅋㅋㅋㅋㅋㅋㅋㅋ','2024-03-15 17:12:11'),(31,'12345','저도 물론 카카가 덕배보다 위라고 봅니다','근데 적어도 덕배가 비벼볼만 하지 않겠냐? 이 생각이 드는거지요\r\n \r\nepl에서 그만큼 꾸준히 어시를 비롯 공포를 쌓고 리그우승을 이뤄냈고 챔스우승까지 \r\n\r\n비벼볼만은 하다고 봅니다','2024-03-15 17:17:54'),(32,'1234','손흥민도 패스 참 잘하는것 같아요.','그니까 공격형 미들의 천재성 있는 패스까지는 아닌데...\r\n\r\n뭐 저 각을 어떻게 봤지? 저걸 어떻게 주지?\r\n\r\n라는 말은 거의 안나오는데...\r\n\r\n관객 입장에서 아 저기 줬음 좋겠다 저기 주면 좋을텐데 생각하고 있으면\r\n\r\n보통 거의 거기다 바로 슛 차기 좋게 잘 줌.\r\n\r\n위에 공미스러운 쓰루패스는 우리나라에서 이강인 정도만 가능한거고...\r\n\r\n세계적으로도 많지 않고;;\r\n\r\n저는 메디슨은 그거 잘할줄 알았더만...\r\n\r\n얘는 박스 근처서 개인기를 이용한 돌파나 좋은 킥을 이용한 크로스나 슛팅에 강점이 있지...\r\n\r\n저 유형은 또 아니더라고요...','2024-03-18 15:48:11'),(40,'123456','축구장 추천좀','축구장 어디가 괜찮나요?? 추천좀요','2024-04-30 10:06:25'),(41,'chuho','하이~','안녕\r\n하세요\r\nㅎㅎ','2024-05-30 02:49:24');
/*!40000 ALTER TABLE `freeborder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07  0:26:51
