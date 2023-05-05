-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: gcu
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choice` (
  `choice_id` bigint NOT NULL AUTO_INCREMENT,
  `choice_count` int DEFAULT NULL,
  `choice_title` varchar(255) DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `FKqdn9d087kfmnptxakgo8ksa0o` (`question_id`),
  CONSTRAINT `FKqdn9d087kfmnptxakgo8ksa0o` FOREIGN KEY (`question_id`) REFERENCES `question_document` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (1,8,'Red',3),(2,0,'Blue',3),(3,0,'Green',3),(4,3,'Dog',4),(5,0,'Cat',4),(6,0,'Fish',4),(7,0,'1번',7),(8,0,'2번',7),(9,0,'3번',7),(10,0,'4번',7),(11,0,'5번',7),(12,0,'1번1',8),(13,0,'2번2',8),(14,0,'3번3',8),(15,0,'4번4',8),(16,0,'5번5',8),(17,0,'1번',11),(18,0,'2번',11),(19,0,'3번',11),(20,0,'4번',11),(21,0,'5번',11),(22,0,'1번1',12),(23,0,'2번2',12),(24,0,'3번3',12),(25,0,'4번4',12),(26,0,'5번5',12),(27,0,'1번',15),(28,0,'2번',15),(29,0,'3번',15),(30,0,'4번',15),(31,0,'5번',15),(32,0,'1번1',16),(33,0,'2번2',16),(34,0,'3번3',16),(35,0,'4번4',16),(36,0,'5번5',16),(37,0,'1번1',20),(38,0,'2번2',20),(39,0,'3번3',20),(40,0,'4번4',20),(41,0,'5번5',20),(42,0,'das',26),(43,0,'sadas',26),(44,0,'asdada',26),(45,0,'das',28),(46,0,'sadas',28),(47,0,'asdada',28),(48,0,'das',30),(49,0,'sadas',30),(50,0,'asdada',30),(51,0,'das',32),(52,0,'sadas',32),(53,0,'asdada',32);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answer`
--

DROP TABLE IF EXISTS `question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_answer` (
  `question_answer_id` bigint NOT NULL AUTO_INCREMENT,
  `check_answer` varchar(255) DEFAULT NULL,
  `check_answer_id` bigint DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `question_title` varchar(255) DEFAULT NULL,
  `survey_answer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`question_answer_id`),
  KEY `FKjy3c3tphvm2hk80doy6r66f59` (`survey_answer_id`),
  CONSTRAINT `FKjy3c3tphvm2hk80doy6r66f59` FOREIGN KEY (`survey_answer_id`) REFERENCES `survey_answer` (`survey_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answer`
--

LOCK TABLES `question_answer` WRITE;
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
INSERT INTO `question_answer` VALUES (1,'Red',1,0,'What is your favorite color?',3),(2,'Dog',4,2,'What is your favorite animal?',3),(3,'',NULL,0,NULL,4),(4,'',NULL,0,NULL,5),(5,'',NULL,0,NULL,6),(6,'',NULL,0,NULL,7),(7,'',NULL,0,NULL,8),(8,'',NULL,0,NULL,9),(9,'',NULL,0,'주관식1',10),(10,'',NULL,0,'주관식1',11),(11,'Red',1,0,'What is your favorite color?',12),(12,'Dog',4,2,'What is your favorite animal?',12),(13,'',NULL,0,'주관식1',13),(14,'',NULL,0,'주관식1',14),(15,'',NULL,0,'주관식1',15),(16,'true',1,1,'What is your favorite color?',16),(17,'Dog',4,2,'What is your favorite animal?',16),(18,'',NULL,0,'주관식1',17),(19,'',NULL,0,'주관식1',18),(20,'',NULL,0,'주관식1',19),(21,'',NULL,0,'주관식1',20),(22,'asdas',NULL,0,'주관식1',21),(23,'dsa',1,0,'주관식1',22),(24,'true',1,1,'찬부식1',22),(25,'asd',1,0,'객관식1',22),(26,'1번1',0,2,'객관식2',22),(27,'asd',1,0,'주관식30',22),(28,'dsa',NULL,0,'주관식1',23),(29,'',-1,0,'주관식1',24),(30,'true',-1,1,'찬부식1',24),(31,'',-1,0,'객관식1',24),(32,'1번1',0,2,'객관식2',24),(33,'',-1,0,'주관식30',24),(34,'',-1,0,'주관식1',25),(35,'true',0,1,'찬부식1',25),(36,'',-1,0,'객관식1',25),(37,'1번1',0,2,'객관식2',25),(38,'',-1,0,'주관식30',25),(39,'',-1,0,'주관식1',26),(40,'true',1,1,'찬부식1',26),(41,'',-1,0,'객관식1',26),(42,'1번1',0,2,'객관식2',26),(43,'',-1,0,'주관식30',26);
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_document`
--

DROP TABLE IF EXISTS `question_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_document` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_type` int DEFAULT NULL,
  `question_title` varchar(255) DEFAULT NULL,
  `survey_document_id` bigint DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FK7oenkb5w5wt0aywgsmhb60spi` (`survey_document_id`),
  CONSTRAINT `FK7oenkb5w5wt0aywgsmhb60spi` FOREIGN KEY (`survey_document_id`) REFERENCES `survey_document` (`survey_document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_document`
--

LOCK TABLES `question_document` WRITE;
/*!40000 ALTER TABLE `question_document` DISABLE KEYS */;
INSERT INTO `question_document` VALUES (1,0,'가자!!!',1),(2,0,'가자!!!',2),(3,0,'What is your favorite color1?',3),(4,2,'What is your favorite animal?',3),(5,0,'주관식',4),(6,1,'찬부식',4),(7,2,'객관식',4),(8,2,'객관식2',4),(9,0,'주관식',5),(10,1,'찬부식',5),(11,2,'객관식',5),(12,2,'객관식2',5),(13,0,'주관식',6),(14,1,'찬부식',6),(15,2,'객관식',6),(16,2,'객관식2',6),(17,0,'주관식1',7),(18,1,'찬부식1',7),(19,0,'객관식1',7),(20,2,'객관식2',7),(21,0,'주관식30',7),(22,0,'sag',8),(23,0,'',9),(24,0,'',10),(25,0,'',11),(26,2,'',11),(27,0,'',12),(28,2,'',12),(29,0,'',13),(30,2,'',13),(31,0,'',14),(32,2,'',14);
/*!40000 ALTER TABLE `question_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `survey_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `FKjw3kf8yv281xykscronbdfr2m` (`user_id`),
  CONSTRAINT `FKjw3kf8yv281xykscronbdfr2m` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,1);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_analyze`
--

DROP TABLE IF EXISTS `survey_analyze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_analyze` (
  `survey_analyze_id` bigint NOT NULL AUTO_INCREMENT,
  `analyze_result1` varchar(255) DEFAULT NULL,
  `analyze_result2` varchar(255) DEFAULT NULL,
  `analyze_result3` varchar(255) DEFAULT NULL,
  `survey_document_id` bigint DEFAULT NULL,
  PRIMARY KEY (`survey_analyze_id`),
  KEY `FKnpgbjxcvc9sxmomdipu5jp5da` (`survey_document_id`),
  CONSTRAINT `FKnpgbjxcvc9sxmomdipu5jp5da` FOREIGN KEY (`survey_document_id`) REFERENCES `survey_document` (`survey_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_analyze`
--

LOCK TABLES `survey_analyze` WRITE;
/*!40000 ALTER TABLE `survey_analyze` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_analyze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer`
--

DROP TABLE IF EXISTS `survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_answer` (
  `survey_answer_id` bigint NOT NULL AUTO_INCREMENT,
  `survey_description` varchar(255) DEFAULT NULL,
  `survey_document_id` bigint DEFAULT NULL,
  `survey_title` varchar(255) DEFAULT NULL,
  `survey_type` int DEFAULT NULL,
  `survey_answer_user_id` bigint DEFAULT NULL,
  `survey_id` bigint DEFAULT NULL,
  PRIMARY KEY (`survey_answer_id`),
  KEY `FK2orahwrsoh3de2b3p1a7pv09w` (`survey_id`),
  CONSTRAINT `FK2orahwrsoh3de2b3p1a7pv09w` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer`
--

LOCK TABLES `survey_answer` WRITE;
/*!40000 ALTER TABLE `survey_answer` DISABLE KEYS */;
INSERT INTO `survey_answer` VALUES (1,NULL,7,NULL,0,NULL,1),(2,NULL,7,NULL,0,NULL,1),(3,'This is a sample survey',7,'Sample Survey',0,NULL,1),(4,NULL,7,'올문항23',0,NULL,1),(5,NULL,7,'올문항23',0,NULL,1),(6,NULL,7,'올문항23',0,NULL,1),(7,NULL,7,'올문항23',0,NULL,1),(8,NULL,7,'올문항23',0,NULL,1),(9,NULL,7,'올문항23',0,NULL,1),(10,NULL,7,'올문항23',0,NULL,1),(11,NULL,7,'올문항23',0,NULL,1),(12,NULL,7,'Sample Survey',0,NULL,1),(13,'surveyList.description',7,'올문항23',0,NULL,1),(14,NULL,7,'올문항23',0,NULL,1),(15,NULL,7,'올문항23',0,NULL,1),(16,NULL,7,'Sample Survey',0,NULL,1),(17,NULL,7,'올문항23',0,NULL,1),(18,NULL,7,'올문항23',0,NULL,1),(19,NULL,7,'올문항23',0,NULL,1),(20,'sda',7,'올문항23',0,NULL,1),(21,NULL,7,'올문항23',0,NULL,1),(22,'sda',7,'올문항23',0,NULL,1),(23,'sda',7,'올문항23',0,NULL,1),(24,NULL,7,'올문항23',0,NULL,1),(25,NULL,7,'올문항23',0,NULL,1),(26,NULL,7,'올문항23',0,NULL,1);
/*!40000 ALTER TABLE `survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_document`
--

DROP TABLE IF EXISTS `survey_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_document` (
  `survey_document_id` bigint NOT NULL AUTO_INCREMENT,
  `accept_response` bit(1) DEFAULT NULL,
  `survey_deadline` varchar(255) DEFAULT NULL,
  `survey_description` varchar(255) DEFAULT NULL,
  `survey_start_date` varchar(255) DEFAULT NULL,
  `survey_title` varchar(255) DEFAULT NULL,
  `survey_type` int DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `survey_id` bigint DEFAULT NULL,
  PRIMARY KEY (`survey_document_id`),
  KEY `FKde070btb1v9tvnvn0sdhjqb1c` (`survey_id`),
  CONSTRAINT `FKde070btb1v9tvnvn0sdhjqb1c` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_document`
--

LOCK TABLES `survey_document` WRITE;
/*!40000 ALTER TABLE `survey_document` DISABLE KEYS */;
INSERT INTO `survey_document` VALUES (1,_binary '\0','2023-05-03 21:04:25.433','가자','2023-05-03 21:04:25.433','rksk',0,NULL,1),(2,_binary '\0','2023-05-03 21:04:26.344','가자','2023-05-03 21:04:26.344','rksk',0,NULL,1),(3,_binary '\0','2023-05-03 21:05:39.438','This is a sample survey','2023-05-03 21:05:39.438','Sample Survey',0,NULL,1),(4,_binary '\0','2023-05-03 21:15:33.878',NULL,'2023-05-03 21:15:33.878','올문항',0,NULL,1),(5,_binary '\0','2023-05-03 21:16:12.843','왜안가지요요','2023-05-03 21:16:12.843','올문항',0,NULL,1),(6,_binary '\0','2023-05-03 21:20:13.614','왜안가지요요','2023-05-03 21:20:13.614','올문항',0,NULL,1),(7,_binary '\0','2023-05-03 21:51:42.085','왜안가지요요23','2023-05-03 21:51:42.085','올문항23',0,NULL,1),(8,_binary '\0','2023-05-04 00:38:03.011','gs','2023-05-04 00:38:03.011','ge',0,NULL,1),(9,_binary '\0','2023-05-04 10:05:34.336','','2023-05-04 10:05:34.336','',0,NULL,1),(10,_binary '\0','2023-05-04 10:05:35.598','','2023-05-04 10:05:35.598','',0,NULL,1),(11,_binary '\0','2023-05-04 10:06:12.948','','2023-05-04 10:06:12.948','',0,NULL,1),(12,_binary '\0','2023-05-04 10:06:46.882','','2023-05-04 10:06:46.882','',0,NULL,1),(13,_binary '\0','2023-05-04 10:08:20.999','','2023-05-04 10:08:20.999','',0,NULL,1),(14,_binary '\0','2023-05-04 10:08:36.579','','2023-05-04 10:08:36.579','',0,NULL,1);
/*!40000 ALTER TABLE `survey_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_master` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id` bigint DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,'2023-05-03 21:04:11.749000','junhee1883@naver.com',2771176860,'강준희','http://k.kakaocdn.net/dn/bMapEc/btrKMETqhUM/vCXQXvCQORarzAKIwHtLz1/img_640x640.jpg','kakao','ROLE_USER');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-05 11:17:00
