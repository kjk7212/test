-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for osx10.15 (x86_64)
--
-- Host: etl-converter.ay1.krane.9rum.cc    Database: db_pylon
-- ------------------------------------------------------
-- Server version	10.1.47-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_abo`
--

DROP TABLE IF EXISTS `tb_abo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_abo` (
  `abonumber` int(11) DEFAULT NULL,
  `sponsor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_abo`
--

LOCK TABLES `tb_abo` WRITE;
/*!40000 ALTER TABLE `tb_abo` DISABLE KEYS */;
INSERT INTO `tb_abo` VALUES (1,0),(2,1),(3,8),(4,1),(5,2),(6,5),(7,5),(8,4),(9,3),(10,1),(11,10),(12,6),(13,5),(14,3),(15,0),(16,18),(18,15),(19,11),(20,7),(21,16),(22,18),(100,0),(23,100),(24,26),(25,28),(26,25),(27,28),(28,100);
/*!40000 ALTER TABLE `tb_abo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_company`
--

DROP TABLE IF EXISTS `tb_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_company`
--

LOCK TABLES `tb_company` WRITE;
/*!40000 ALTER TABLE `tb_company` DISABLE KEYS */;
INSERT INTO `tb_company` VALUES (1,'kakaoenterprise','ted.me','2020-10-19 21:53:23','ted.me','2020-10-19 21:53:23');
/*!40000 ALTER TABLE `tb_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_component`
--

DROP TABLE IF EXISTS `tb_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_component` (
  `component_id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(100) DEFAULT NULL,
  `component_desc` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_component`
--

LOCK TABLES `tb_component` WRITE;
/*!40000 ALTER TABLE `tb_component` DISABLE KEYS */;
INSERT INTO `tb_component` VALUES (1,'CDC','Source : CDC','ted.me','2020-10-19 22:18:30','ted.me','2020-10-19 22:18:30'),(2,'ETL','Source : ETL','ted.me','2020-10-19 22:18:30','ted.me','2020-10-19 22:18:30'),(3,'Loader','Target : Loader','ted.me','2020-10-19 22:18:30','ted.me','2020-10-19 22:18:30'),(4,'Filter','Table Filter','ted.me','2020-10-19 22:18:30','ted.me','2020-10-19 22:18:30'),(5,'Mapper','Source Target Mapping','ted.me','2020-11-21 22:24:33','ted.me','2020-11-21 22:24:33'),(6,'SQL','SQL Executor','ted.me','2021-08-03 00:29:09','ted.me','2021-08-03 00:29:09'),(7,'Join','Join Executor','ted.me','2021-09-07 10:18:56','ted.me','2021-09-07 10:18:56'),(8,'API','API Caller','ted.me','2021-09-07 10:18:56','ted.me','2021-09-07 10:18:56');
/*!40000 ALTER TABLE `tb_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_component_property`
--

DROP TABLE IF EXISTS `tb_component_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_component_property` (
  `component_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL,
  `data_type_id` int(11) DEFAULT NULL,
  `component_property_key` varchar(100) NOT NULL,
  `connection_yn` char(1) NOT NULL,
  `component_property_level` int(11) NOT NULL,
  `component_default_value` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`component_property_id`),
  KEY `fk_tb_component_property_tb_component` (`component_id`),
  KEY `fk_tb_connector_property_tb_db_type` (`data_type_id`),
  CONSTRAINT `fk_tb_component_property_tb_component` FOREIGN KEY (`component_id`) REFERENCES `tb_component` (`component_id`),
  CONSTRAINT `fk_tb_connector_property_tb_db_type` FOREIGN KEY (`data_type_id`) REFERENCES `tb_data_type` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_component_property`
--

LOCK TABLES `tb_component_property` WRITE;
/*!40000 ALTER TABLE `tb_component_property` DISABLE KEYS */;
INSERT INTO `tb_component_property` VALUES (1,1,1,'connector.class','N',1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2020-09-22 18:09:23','ted.me','2020-09-22 18:09:23'),(2,1,1,'offset.storage','N',1,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2020-09-22 18:10:18','ted.me','2020-09-22 18:10:18'),(3,1,1,'offset.storage.file.filename','N',1,NULL,'ted.me','2020-09-22 18:10:49','ted.me','2020-09-22 18:10:49'),(4,1,1,'offset.flush.interval.ms','N',1,'60000','ted.me','2020-09-22 18:11:21','ted.me','2020-09-22 18:11:21'),(5,1,1,'database.server.id','N',1,NULL,'ted.me','2020-09-22 18:12:18','ted.me','2020-09-22 18:12:18'),(6,1,1,'database.server.name','N',1,NULL,'ted.me','2020-09-22 18:12:42','ted.me','2020-09-22 18:12:42'),(7,1,1,'database.include.list','Y',1,NULL,'ted.me','2020-09-22 18:13:08','ted.me','2020-09-22 18:13:08'),(8,1,1,'table.include.list','N',1,NULL,'ted.me','2020-09-22 18:13:26','ted.me','2020-09-22 18:13:26'),(9,1,1,'database.history','N',1,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2020-09-22 18:13:59','ted.me','2020-09-22 18:13:59'),(10,1,1,'database.history.file.filename','N',1,NULL,'ted.me','2020-09-22 18:14:27','ted.me','2020-09-22 18:14:27'),(15,1,1,'name','N',1,NULL,'ted.me','2020-09-23 02:15:20','ted.me','2020-09-23 02:15:20'),(16,1,1,'transforms','N',1,'unwrap','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(17,1,1,'transforms.unwrap.type','N',1,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(18,1,1,'transforms.unwrap.drop.tombstones','N',1,'false','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(19,1,1,'transforms.unwrap.add.fields','N',1,'op, table','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(20,1,1,'include.schema.changes','N',1,'true','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(21,1,1,'key.converter.schemas.enable','N',1,'false','ted.me','2020-09-23 02:20:27','ted.me','2020-09-23 02:20:27'),(22,1,1,'value.converter.schemas.enable','N',1,'false','ted.me','2020-09-23 02:20:27','ted.me','2020-09-23 02:20:27'),(27,3,1,'dbname','Y',1,NULL,'ted.me','2020-09-23 13:15:06','ted.me','2020-09-23 13:15:06'),(30,3,1,'db_table','N',1,NULL,'ted.me','2020-09-23 13:15:06','ted.me','2020-09-23 13:15:06'),(33,1,3,'connector.class','N',1,'io.debezium.connector.oracle.OracleConnector','ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(34,1,3,'tasks.max','N',1,'1','ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(35,1,3,'database.server.name','N',1,NULL,'ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(40,1,3,'database.dbname','Y',1,NULL,'ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(41,1,3,'database.pdb.name','N',1,NULL,'ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(42,1,3,'database.out.server.name','N',1,NULL,'ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(43,1,3,'database.history.kafka.bootstrap.servers','N',1,'kafka:9092','ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(44,1,3,'database.history.kafka.topic','N',1,NULL,'ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(45,1,3,'database.connection.adapter','N',1,'logminer','ted.me','2020-10-05 13:04:01','ted.me','2020-10-05 13:04:01'),(46,3,1,'db_driver','N',1,'com.mysql.cj.jdbc.Driver','ted.me','2020-11-12 12:27:13','ted.me','2020-11-12 12:27:13'),(47,3,3,'dbname','Y',1,NULL,'ted.me','2020-09-23 13:15:06','ted.me','2020-09-23 13:15:06'),(53,3,3,'db_driver','N',1,'oracle.jdbc.OracleDriver','ted.me','2020-11-12 12:27:13','ted.me','2020-11-12 12:27:13'),(54,1,1,'transforms.unwrap.delete.handling.mode','N',1,'rewrite','ted.me','2021-01-13 17:59:56','ted.me','2021-01-13 17:59:56'),(55,1,3,'name','N',1,NULL,'ted.me','2021-02-20 22:45:53','ted.me','2021-02-20 22:45:53'),(56,1,3,'offset.storage','N',1,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2021-02-20 23:28:07','ted.me','2021-02-20 23:28:07'),(57,1,3,'offset.storage.file.filename','N',1,NULL,'ted.me','2021-02-20 23:28:07','ted.me','2021-02-20 23:28:07'),(58,1,3,'database.history','N',1,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2021-02-20 23:28:07','ted.me','2021-02-20 23:28:07'),(59,1,3,'database.history.file.filename','N',1,NULL,'ted.me','2021-02-20 23:28:07','ted.me','2021-02-20 23:28:07'),(60,1,3,'offset.flush.interval.ms','N',1,'60000','ted.me','2021-02-20 23:29:13','ted.me','2021-02-20 23:29:13'),(61,1,3,'transforms','N',1,'unwrap,convert','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(62,1,3,'transforms.unwrap.type','N',1,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(63,1,3,'transforms.unwrap.drop.tombstones','N',1,'false','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(64,1,3,'transforms.unwrap.add.fields','N',1,'op, table','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(65,1,3,'include.schema.changes','N',1,'false','ted.me','2020-09-23 02:15:21','ted.me','2020-09-23 02:15:21'),(66,1,3,'key.converter.schemas.enable','N',1,'false','ted.me','2020-09-23 02:20:27','ted.me','2020-09-23 02:20:27'),(67,1,3,'value.converter.schemas.enable','N',1,'false','ted.me','2020-09-23 02:20:27','ted.me','2020-09-23 02:20:27'),(68,1,3,'transforms.unwrap.delete.handling.mode','N',1,'table','ted.me','2021-01-13 17:59:56','ted.me','2021-01-13 17:59:56'),(76,1,3,'schema.include.list','N',1,NULL,'ted.me','2021-02-21 20:20:39','ted.me','2021-02-21 20:20:39'),(77,1,3,'decimal.handling.mode','N',1,'STRING','ted.me','2021-02-22 17:12:11','ted.me','2021-02-22 17:12:11'),(78,1,3,'converters','N',1,'timestampConverter','ted.me','2021-02-22 17:29:01','ted.me','2021-02-22 17:29:01'),(79,1,3,'timestampConverter.type','N',1,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-02-22 17:29:01','ted.me','2021-02-22 17:29:01'),(80,1,1,'database.serverTimezone','N',1,'UTC','ted.me','2021-03-04 16:12:29','ted.me','2021-03-04 16:12:29'),(83,1,1,'converters','N',1,'timestampConverter','ted.me','2021-03-08 18:12:29','ted.me','2021-03-08 18:12:29'),(84,1,1,'timestampConverter.type','N',1,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-03-08 18:12:29','ted.me','2021-03-08 18:12:29'),(85,1,1,'snapshot.fetch.size','N',1,'1000','ted.me','2021-03-14 18:46:03','ted.me','2021-03-14 18:46:03'),(86,1,1,'table.exclude.list','N',1,NULL,'ted.me','2021-03-21 19:11:12','ted.me','2021-03-21 19:11:12'),(87,1,3,'table.include.list','N',1,NULL,'ted.me','2021-03-21 19:16:06','ted.me','2021-03-21 19:16:06'),(88,1,3,'table.exclude.list','N',1,NULL,'ted.me','2021-03-21 19:16:06','ted.me','2021-03-21 19:16:06'),(89,1,1,'cdc.batch.size','N',1,'0','ted.me','2021-04-05 22:37:06','ted.me','2021-04-05 22:37:06'),(90,1,3,'cdc.batch.size','N',1,'50','ted.me','2021-04-05 22:37:35','ted.me','2021-04-05 22:37:35'),(91,6,1,'dbname','Y',1,NULL,'ted.me','2021-08-03 01:19:36','ted.me','2021-08-03 01:19:36'),(97,6,NULL,'c_query','N',1,NULL,'ted.me','2021-08-03 01:19:36','ted.me','2021-08-03 01:19:36'),(98,6,NULL,'c_parameter','N',1,NULL,'ted.me','2021-08-03 01:19:36','ted.me','2021-08-03 01:19:36'),(99,6,NULL,'u_query','N',1,NULL,'ted.me','2021-08-04 10:43:36','ted.me','2021-08-04 10:43:36'),(100,6,NULL,'u_parameter','N',1,NULL,'ted.me','2021-08-04 10:43:36','ted.me','2021-08-04 10:43:36'),(101,6,NULL,'d_query','N',1,NULL,'ted.me','2021-08-04 10:43:36','ted.me','2021-08-04 10:43:36'),(102,6,NULL,'d_parameter','N',1,NULL,'ted.me','2021-08-04 10:43:36','ted.me','2021-08-04 10:43:36'),(103,1,1,'snapshot.mode','N',1,'initial','ted.me','2021-08-04 12:12:26','ted.me','2021-08-04 12:12:26'),(104,1,3,'snapshot.mode','N',1,'initial','ted.me','2021-08-04 12:13:02','ted.me','2021-08-04 12:13:02'),(105,6,NULL,'c_condition','N',1,NULL,'ted.me','2021-08-08 16:04:37','ted.me','2021-08-08 16:04:37'),(106,6,NULL,'u_condition','N',1,NULL,'ted.me','2021-08-08 16:04:38','ted.me','2021-08-08 16:04:38'),(107,6,NULL,'d_condition','N',1,NULL,'ted.me','2021-08-08 16:04:38','ted.me','2021-08-08 16:04:38'),(108,3,1,'merge_yn','N',1,'Y','ted.me','2021-08-17 21:54:55','ted.me','2021-08-17 21:54:55'),(109,7,1,'dbname','Y',1,NULL,'ted.me','2021-09-07 10:19:55','ted.me','2021-09-07 10:19:55'),(110,7,NULL,'dml_condition','N',1,NULL,'ted.me','2021-09-07 10:19:57','ted.me','2021-09-07 10:19:57'),(111,7,NULL,'query','N',1,NULL,'ted.me','2021-09-07 10:20:03','ted.me','2021-09-07 10:20:03'),(112,7,NULL,'parameter','N',1,NULL,'ted.me','2021-09-07 10:20:06','ted.me','2021-09-07 10:20:06'),(113,7,NULL,'select_list','N',1,NULL,'ted.me','2021-09-07 10:20:08','ted.me','2021-09-07 10:20:08'),(114,7,NULL,'mandatory_yn','N',1,NULL,'ted.me','2021-09-07 17:12:49','ted.me','2021-09-07 17:12:49'),(115,8,NULL,'uri','Y',1,NULL,'ted.me','2021-09-09 16:59:17','ted.me','2021-09-09 16:59:17'),(116,8,NULL,'header_json','N',1,NULL,'ted.me','2021-09-09 17:00:27','ted.me','2021-09-09 17:00:27'),(117,8,NULL,'param_json','N',1,NULL,'ted.me','2021-09-09 17:00:27','ted.me','2021-09-09 17:00:27'),(118,8,NULL,'response_item','N',1,NULL,'ted.me','2021-09-09 17:00:27','ted.me','2021-09-09 17:00:27'),(119,8,NULL,'api_type','N',1,NULL,'ted.me','2021-09-09 17:00:27','ted.me','2021-09-09 17:00:27'),(121,8,NULL,'response_column','N',1,NULL,'ted.me','2021-09-09 17:00:27','ted.me','2021-09-09 17:00:27'),(122,8,NULL,'dml_condition','N',1,NULL,'ted.me','2021-09-16 19:08:13','ted.me','2021-09-16 19:08:13'),(123,7,NULL,'condition','N',1,NULL,'ted.me','2021-09-28 21:32:40','ted.me','2021-09-28 21:32:40'),(124,8,NULL,'condition','N',1,NULL,'ted.me','2021-09-28 21:32:49','ted.me','2021-09-28 21:32:49'),(125,4,NULL,'condition','N',1,NULL,'ted.me','2021-09-28 21:32:40','ted.me','2021-09-28 21:32:40');
/*!40000 ALTER TABLE `tb_component_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_category`
--

DROP TABLE IF EXISTS `tb_data_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_category` (
  `data_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_category_name` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_category`
--

LOCK TABLES `tb_data_category` WRITE;
/*!40000 ALTER TABLE `tb_data_category` DISABLE KEYS */;
INSERT INTO `tb_data_category` VALUES (1,'RDBMS','ted.me','2020-10-19 21:58:00','ted.me','2020-10-19 21:58:00'),(2,'NoSQL','ted.me','2020-10-19 21:58:14','ted.me','2020-10-19 21:58:14');
/*!40000 ALTER TABLE `tb_data_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_type`
--

DROP TABLE IF EXISTS `tb_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_type` (
  `data_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_name` varchar(100) NOT NULL,
  `data_category_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_type_id`),
  KEY `fk_tb_data_type_tb_data_caterogy` (`data_category_id`),
  CONSTRAINT `fk_tb_data_type_tb_data_caterogy` FOREIGN KEY (`data_category_id`) REFERENCES `tb_data_category` (`data_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_type`
--

LOCK TABLES `tb_data_type` WRITE;
/*!40000 ALTER TABLE `tb_data_type` DISABLE KEYS */;
INSERT INTO `tb_data_type` VALUES (1,'MySQL',1,'ted.me','2020-10-19 22:04:05','ted.me','2020-10-19 22:04:05'),(2,'Straw',2,'ted.me','2020-10-19 22:04:05','ted.me','2020-10-19 22:04:05'),(3,'Oracle',1,'ted.me','2020-10-19 22:04:05','ted.me','2020-10-19 22:04:05');
/*!40000 ALTER TABLE `tb_data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_type_property`
--

DROP TABLE IF EXISTS `tb_data_type_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_type_property` (
  `data_type_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_id` int(11) NOT NULL,
  `data_type_property_name` varchar(100) NOT NULL,
  `data_type_property_key` varchar(100) NOT NULL,
  `data_type_default_value` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_type_property_id`),
  KEY `fk_tb_db_type_property_tb_db_type` (`data_type_id`),
  CONSTRAINT `fk_tb_db_type_property_tb_db_type` FOREIGN KEY (`data_type_id`) REFERENCES `tb_data_type` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_type_property`
--

LOCK TABLES `tb_data_type_property` WRITE;
/*!40000 ALTER TABLE `tb_data_type_property` DISABLE KEYS */;
INSERT INTO `tb_data_type_property` VALUES (1,1,'hostname','database.hostname','localhost','ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(2,1,'port','database.port','3306','ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(3,1,'user','database.user','root','ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(4,1,'password','database.password',NULL,'ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(5,2,'url','url',NULL,'ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(6,2,'key','key',NULL,'ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(7,2,'boxId','boxId',NULL,'ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(8,1,'db_driver','db_driver','com.mysql.cj.jdbc.Driver','ted.me','2020-11-12 12:26:15','ted.me','2020-11-12 12:26:15'),(9,3,'url','database.url','localhost','ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(11,3,'user','database.user','root','ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(12,3,'password','database.password',NULL,'ted.me','2020-10-19 22:12:55','ted.me','2020-10-19 22:12:55'),(13,3,'db_driver','db_driver','oracle.jdbc.OracleDriver','ted.me','2020-11-12 12:26:15','ted.me','2020-11-12 12:26:15');
/*!40000 ALTER TABLE `tb_data_type_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_department`
--

DROP TABLE IF EXISTS `tb_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `department_name` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`),
  KEY `fk_tb_department_tb_company` (`company_id`),
  CONSTRAINT `fk_tb_department_tb_company` FOREIGN KEY (`company_id`) REFERENCES `tb_company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_department`
--

LOCK TABLES `tb_department` WRITE;
/*!40000 ALTER TABLE `tb_department` DISABLE KEYS */;
INSERT INTO `tb_department` VALUES (1,1,'Solution Platform','ted.me','2020-10-19 21:55:34','ted.me','2020-10-19 21:55:34');
/*!40000 ALTER TABLE `tb_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_execution`
--

DROP TABLE IF EXISTS `tb_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_execution` (
  `execution_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime DEFAULT NULL,
  `execution_status` char(1) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`execution_id`),
  KEY `fk_tb_execution_tb_task` (`task_id`),
  CONSTRAINT `fk_tb_execution_tb_task` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_execution`
--

LOCK TABLES `tb_execution` WRITE;
/*!40000 ALTER TABLE `tb_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_execution_detail`
--

DROP TABLE IF EXISTS `tb_execution_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_execution_detail` (
  `execution_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `step_name` varchar(100) NOT NULL,
  `execution_detail_status` char(1) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`execution_id`,`detail_id`),
  CONSTRAINT `fk_tb_execution_detail_tb_execution` FOREIGN KEY (`execution_id`) REFERENCES `tb_execution` (`execution_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_execution_detail`
--

LOCK TABLES `tb_execution_detail` WRITE;
/*!40000 ALTER TABLE `tb_execution_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_execution_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_flow`
--

DROP TABLE IF EXISTS `tb_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `before_step_id` int(11) NOT NULL,
  `after_step_id` int(11) NOT NULL,
  `flow_name` varchar(100) DEFAULT NULL,
  `condition_table` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`flow_id`),
  KEY `fk_tb_flow_tb_task` (`task_id`),
  KEY `fk_tb_flow_tb_step` (`before_step_id`),
  KEY `fk_tb_flow_tb_step_0` (`after_step_id`),
  CONSTRAINT `fk_tb_flow_tb_step` FOREIGN KEY (`before_step_id`) REFERENCES `tb_step` (`step_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_flow_tb_step_0` FOREIGN KEY (`after_step_id`) REFERENCES `tb_step` (`step_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_flow_tb_task` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_flow`
--

LOCK TABLES `tb_flow` WRITE;
/*!40000 ALTER TABLE `tb_flow` DISABLE KEYS */;
INSERT INTO `tb_flow` VALUES (1,1,1,2,NULL,NULL,'ted.me','2020-10-19 22:32:47','ted.me','2020-10-19 22:32:47'),(3,2,4,5,NULL,NULL,'ted.me','2020-10-19 22:32:47','ted.me','2020-10-19 22:32:47'),(4,7,25,27,NULL,NULL,'ted.me','2021-02-20 21:24:16','ted.me','2021-02-20 21:24:16'),(5,7,27,26,NULL,NULL,'ted.me','2021-02-20 21:24:16','ted.me','2021-02-20 21:24:16'),(6,8,28,30,NULL,NULL,'ted.me','2021-03-04 16:51:51','ted.me','2021-03-04 16:51:51'),(7,8,30,29,NULL,NULL,'ted.me','2021-03-04 16:51:51','ted.me','2021-03-04 16:51:51'),(8,100000,37,40,'소스-매퍼',NULL,'ted.me','2021-06-20 10:30:20','ted.me','2021-06-20 10:30:20'),(9,100000,40,38,'매퍼-타겟',NULL,'ted.me','2021-06-20 10:30:33','ted.me','2021-06-20 10:30:33'),(10,9,41,43,NULL,NULL,'ted.me','2021-08-03 01:02:32','ted.me','2021-08-03 01:02:32'),(11,9,43,42,NULL,NULL,'ted.me','2021-08-03 01:02:32','ted.me','2021-08-03 01:02:32'),(12,9,43,44,NULL,'tb_krew_dept','ted.me','2021-08-03 01:02:32','ted.me','2021-08-03 01:02:32'),(13,10,45,47,'소스-매퍼',NULL,'ted.me','2021-08-10 17:39:39','ted.me','2021-08-10 17:39:39'),(14,10,47,46,'매퍼-타겟',NULL,'ted.me','2021-08-10 17:39:56','ted.me','2021-08-10 17:39:56'),(15,11,48,50,'소스-매퍼',NULL,'ted.me','2021-08-10 17:39:39','ted.me','2021-08-10 17:39:39'),(16,11,50,49,'매퍼-타겟',NULL,'ted.me','2021-08-10 17:39:56','ted.me','2021-08-10 17:39:56'),(18,9,43,51,NULL,'tb_job','ted.me','2021-09-07 15:35:35','ted.me','2021-09-07 15:35:35'),(19,9,51,42,NULL,'tb_job','ted.me','2021-09-07 15:35:55','ted.me','2021-09-07 15:35:55'),(20,9,43,53,NULL,'tb_krew','ted.me','2021-09-07 15:35:55','ted.me','2021-09-07 15:35:55'),(21,9,53,42,NULL,'tb_krew','ted.me','2021-09-07 15:35:55','ted.me','2021-09-07 15:35:55'),(22,9,43,54,NULL,'tb_krew','ted.me','2021-08-03 01:02:32','ted.me','2021-08-03 01:02:32');
/*!40000 ALTER TABLE `tb_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_folder`
--

DROP TABLE IF EXISTS `tb_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_folder` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `folder_name` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_folder`
--

LOCK TABLES `tb_folder` WRITE;
/*!40000 ALTER TABLE `tb_folder` DISABLE KEYS */;
INSERT INTO `tb_folder` VALUES (1,NULL,'test','ted.me','2020-10-19 22:14:53','ted.me','2020-10-19 22:14:53');
/*!40000 ALTER TABLE `tb_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mapping_column`
--

DROP TABLE IF EXISTS `tb_mapping_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mapping_column` (
  `step_table_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `transform_type` tinyint(4) NOT NULL,
  `source_step_table_id` int(11) DEFAULT NULL,
  `source_column_id` int(11) DEFAULT NULL,
  `transform_formula` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_table_id`,`column_id`),
  CONSTRAINT `fk_tb_mapping_column_tb_table_column` FOREIGN KEY (`step_table_id`, `column_id`) REFERENCES `tb_table_column` (`step_table_id`, `column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mapping_column`
--

LOCK TABLES `tb_mapping_column` WRITE;
/*!40000 ALTER TABLE `tb_mapping_column` DISABLE KEYS */;
INSERT INTO `tb_mapping_column` VALUES (2,1,1,1,1,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(2,2,1,1,2,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(2,3,1,1,3,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(4,1,1,3,1,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(4,2,1,3,2,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(4,3,1,3,3,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(6,1,1,5,1,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,2,1,5,2,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,3,1,5,3,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,4,1,5,4,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,5,1,5,5,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,6,1,5,6,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(6,7,1,5,7,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(8,1,1,7,1,NULL,'ted.me','2020-12-10 21:29:36','ted.me','2020-12-10 21:29:36'),(8,2,1,7,2,NULL,'ted.me','2020-12-10 21:29:36','ted.me','2020-12-10 21:29:36'),(8,3,1,7,3,NULL,'ted.me','2020-12-10 21:29:36','ted.me','2020-12-10 21:29:36'),(8,4,1,7,4,NULL,'ted.me','2020-12-10 21:29:36','ted.me','2020-12-10 21:29:36'),(10,1,1,5,1,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,2,1,5,2,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,3,1,5,3,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,4,1,5,4,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,5,1,5,5,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,6,1,5,6,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(10,7,1,5,7,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(13,1,1,1,1,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(13,2,1,1,2,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(13,3,1,1,3,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(23,1,1,22,1,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(23,2,1,22,2,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(23,3,1,22,3,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(25,1,1,24,1,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,2,1,24,2,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,3,1,24,3,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,4,1,24,4,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,5,1,24,5,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,6,1,24,6,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(25,7,1,24,7,NULL,'ted.me','2020-12-03 12:52:55','ted.me','2020-12-03 12:52:55'),(30,1,1,29,1,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,2,1,29,2,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,3,1,29,3,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,4,1,29,4,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,5,1,29,5,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,6,1,29,6,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,7,1,29,7,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,8,1,29,8,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(30,9,1,29,9,NULL,'ted.me','2021-01-13 16:23:01','ted.me','2021-01-13 16:23:01'),(33,1,1,32,1,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(33,2,1,32,2,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(33,3,1,32,3,NULL,'ted.me','2020-11-21 23:06:43','ted.me','2020-11-21 23:06:43'),(35,1,1,34,1,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,2,1,34,2,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,3,1,34,3,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,4,1,34,4,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,5,1,34,5,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,6,1,34,6,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,7,1,34,7,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,8,1,34,8,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(37,1,1,36,1,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,2,1,36,2,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,3,1,36,3,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,4,1,36,4,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,5,1,36,5,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(39,1,1,38,1,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,2,1,38,2,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,3,1,38,3,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,4,1,38,4,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(39,5,1,38,5,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(39,6,1,38,6,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(39,7,1,38,7,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(39,8,1,38,8,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(39,9,1,38,9,NULL,'ted.me','2021-03-04 00:20:15','ted.me','2021-03-04 00:20:15'),(41,0,2,40,NULL,'KREW_ID|DEPT_CD','ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,1,1,40,1,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,2,1,40,2,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,3,1,40,3,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,4,1,40,4,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,5,1,40,5,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,6,1,40,6,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,7,1,40,7,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(43,1,1,42,1,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(43,2,1,42,2,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(45,1,1,44,1,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,2,1,44,2,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,3,1,44,3,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,4,1,44,4,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,5,1,44,5,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,6,1,44,6,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,7,1,44,7,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,8,1,44,8,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(47,1,1,46,1,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(47,2,1,46,2,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(47,3,1,46,3,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(47,4,1,46,4,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(47,5,1,46,5,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(49,1,1,48,1,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,2,1,48,2,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,3,1,48,3,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,4,1,48,4,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,5,1,48,5,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,6,1,48,6,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,7,1,48,7,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,8,1,48,8,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,9,1,48,9,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(51,0,2,50,NULL,'krew_id|dept_cd','ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,1,1,50,1,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,2,1,50,2,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,3,1,50,3,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,4,1,50,4,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,5,1,50,5,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,6,1,50,6,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,7,1,50,7,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(53,0,2,52,NULL,'krew_id|dept_cd|seq','ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,1,1,52,1,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,2,1,52,2,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,3,1,52,3,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,4,1,52,4,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,5,1,52,5,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(55,0,2,54,NULL,'krew_id|seq','ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,1,1,54,1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,2,1,54,2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,3,1,54,3,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,4,1,54,4,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(109,1,1,108,1,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,2,1,108,2,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,3,1,108,3,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,4,1,108,4,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,5,1,108,5,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,6,1,108,6,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,7,1,108,7,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,8,1,108,8,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,1,1,110,1,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(111,2,1,110,2,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(111,3,1,110,3,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(111,4,1,110,4,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(111,5,1,110,5,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(113,1,1,112,1,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,2,1,112,2,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,3,4,112,NULL,'{:EmpId}|updated!','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,4,1,112,4,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,5,1,112,5,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,6,1,112,6,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,8,1,112,7,'','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,9,1,112,8,'','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,10,4,112,NULL,'&now()|N/A','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,11,3,112,NULL,'&now()','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,1,1,114,1,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,2,1,114,2,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,3,1,114,3,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,4,1,114,4,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,5,1,114,5,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,6,1,114,6,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,7,1,114,7,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(117,1,1,116,1,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,2,1,116,2,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,3,1,116,3,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,4,1,116,4,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,5,1,116,5,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35');
/*!40000 ALTER TABLE `tb_mapping_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mapping_column_history`
--

DROP TABLE IF EXISTS `tb_mapping_column_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mapping_column_history` (
  `step_table_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `transform_type` tinyint(4) NOT NULL,
  `source_step_table_id` int(11) DEFAULT NULL,
  `source_column_id` int(11) DEFAULT NULL,
  `transform_formula` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_table_id`,`column_id`,`history_id`),
  CONSTRAINT `fk_tb_mapping_column_history` FOREIGN KEY (`step_table_id`) REFERENCES `tb_step_table` (`step_table_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mapping_column_history`
--

LOCK TABLES `tb_mapping_column_history` WRITE;
/*!40000 ALTER TABLE `tb_mapping_column_history` DISABLE KEYS */;
INSERT INTO `tb_mapping_column_history` VALUES (55,0,1,2,54,NULL,'krew_id|seq','ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,1,1,1,54,1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,2,1,1,54,2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,3,1,1,54,3,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,4,1,1,54,4,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42');
/*!40000 ALTER TABLE `tb_mapping_column_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_metadata`
--

DROP TABLE IF EXISTS `tb_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_metadata` (
  `metadata_id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_name` varchar(100) NOT NULL,
  `metadata_desc` varchar(1000) DEFAULT NULL,
  `data_type_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`metadata_id`),
  KEY `fk_tb_rdbms_tb_db_type` (`data_type_id`),
  CONSTRAINT `fk_tb_rdbms_tb_db_type` FOREIGN KEY (`data_type_id`) REFERENCES `tb_data_type` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_metadata`
--

LOCK TABLES `tb_metadata` WRITE;
/*!40000 ALTER TABLE `tb_metadata` DISABLE KEYS */;
INSERT INTO `tb_metadata` VALUES (1,'source-mysql','krane:converter-test',1,'ted.me','2020-10-19 22:06:24','ted.me','2020-10-19 22:06:24'),(2,'target-straw','box:1886',2,'ted.me','2020-10-19 22:06:24','ted.me','2020-10-19 22:06:24'),(3,'source-mysql','krane:converter-test/alexis',1,'ted.me','2020-10-19 22:06:24','ted.me','2020-10-19 22:06:24'),(4,'source-oracle','krane:converter-oracle',3,'ted.me','2020-11-12 13:37:03','ted.me','2020-11-12 13:37:03'),(5,'straw (Dev)','box:361',2,'ted.me','2021-02-20 21:19:45','ted.me','2021-02-20 21:19:45'),(7,'MySQL Test','따라하기 테스트 - MySQL',1,'ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(8,'target-MySQL','krane:etl-target',1,'ted.me','2021-08-03 00:58:34','ted.me','2021-08-03 00:58:34');
/*!40000 ALTER TABLE `tb_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_metadata_property`
--

DROP TABLE IF EXISTS `tb_metadata_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_metadata_property` (
  `metadata_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_id` int(11) NOT NULL,
  `data_type_property_id` int(11) NOT NULL,
  `data_property_value` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`metadata_property_id`),
  KEY `fk_tb_db_property_tb_rdbms` (`metadata_id`),
  KEY `fk_tb_db_property_tb_db_type_property` (`data_type_property_id`),
  CONSTRAINT `fk_tb_db_property_tb_db_type_property` FOREIGN KEY (`data_type_property_id`) REFERENCES `tb_data_type_property` (`data_type_property_id`),
  CONSTRAINT `fk_tb_db_property_tb_rdbms` FOREIGN KEY (`metadata_id`) REFERENCES `tb_metadata` (`metadata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_metadata_property`
--

LOCK TABLES `tb_metadata_property` WRITE;
/*!40000 ALTER TABLE `tb_metadata_property` DISABLE KEYS */;
INSERT INTO `tb_metadata_property` VALUES (1,1,1,'converter-test.ay1.krane.9rum.cc','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(2,1,2,'3306','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(3,1,3,'etl_user','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(4,1,4,'converter','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(5,2,5,'http://straw.v1.rehearsal.daumkakao.io/boxes','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(6,2,6,'xtnquFPfrk_zvUgWlpvGMuLbnPfB6NAorTYbw_OeciV','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(7,2,7,'1886','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(8,3,1,'converter-test.ay1.krane.9rum.cc','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(9,3,2,'3306','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(10,3,3,'alexis','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(11,3,4,'converter','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(12,4,9,'jdbc:oracle:thin:@converter-oracle.ay1.krane.9rum.cc:1521:orcl','ted.me','2020-11-12 13:45:33','ted.me','2020-11-12 13:45:33'),(14,4,11,'etl_user','ted.me','2020-11-12 13:45:33','ted.me','2020-11-12 13:45:33'),(15,4,12,'converter','ted.me','2020-11-12 13:45:33','ted.me','2020-11-12 13:45:33'),(16,4,13,'oracle.jdbc.OracleDriver','ted.me','2020-11-12 13:45:33','ted.me','2020-11-12 13:45:33'),(17,5,5,'http://straw.develop.is.daumkakao.io','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(18,5,6,'3ZKR6Yn5TuT4xifiUC0SnWyCQjOv-6U0DP04H7sdY61','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(19,5,7,'361','ted.me','2020-10-19 22:13:02','ted.me','2020-10-19 22:13:02'),(21,7,1,'source-db','ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(22,7,2,'3307','ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(23,7,3,'etl_user','ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(24,7,4,'converter','ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(25,7,8,'com.mysql.cj.jdbc.Driver','ted.me','2021-06-19 16:28:58','ted.me','2021-06-19 16:28:58'),(26,8,1,'etl-target.ay1.krane.9rum.cc','ted.me','2021-08-03 01:00:27','ted.me','2021-08-03 01:00:27'),(27,8,2,'3306','ted.me','2021-08-03 01:00:27','ted.me','2021-08-03 01:00:27'),(28,8,3,'etl_user','ted.me','2021-08-03 01:00:27','ted.me','2021-08-03 01:00:27'),(29,8,4,'etl123','ted.me','2021-08-03 01:00:27','ted.me','2021-08-03 01:00:27');
/*!40000 ALTER TABLE `tb_metadata_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_msg`
--

DROP TABLE IF EXISTS `tb_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_msg` (
  `msg_cd` smallint(6) NOT NULL,
  `category_cd` tinyint(4) NOT NULL COMMENT '1 : CDC\n2 : 매핑',
  `contents` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_msg`
--

LOCK TABLES `tb_msg` WRITE;
/*!40000 ALTER TABLE `tb_msg` DISABLE KEYS */;
INSERT INTO `tb_msg` VALUES (101,1,'CDC 시작','ted.me','2021-06-10 16:45:57','ted.me','2021-06-10 16:45:57'),(102,1,'CDC 중단','ted.me','2021-06-10 16:45:57','ted.me','2021-06-10 16:45:57'),(103,1,'CDC 재시작','ted.me','2021-06-10 16:45:57','ted.me','2021-06-10 16:45:57'),(104,1,'CDC 강제중단','ted.me','2021-06-10 23:42:52','ted.me','2021-06-10 23:42:52'),(201,1,'테이블 추가','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(202,1,'테이블 삭제','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(203,1,'테이블 변경','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(301,2,'매핑 생성','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(302,2,'매핑 수정','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(303,2,'매핑 삭제','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(304,2,'타겟 테이블 생성','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(305,2,'타겟 테이블 변경','ted.me','2021-06-10 16:45:58','ted.me','2021-06-10 16:45:58'),(306,2,'타겟 테이블 삭제','ted.me','2021-06-10 16:45:59','ted.me','2021-06-10 16:45:59');
/*!40000 ALTER TABLE `tb_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_step`
--

DROP TABLE IF EXISTS `tb_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_step` (
  `step_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` varchar(10) NOT NULL,
  `step_name` varchar(100) NOT NULL,
  `step_desc` varchar(1000) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_id`),
  KEY `fk_tb_step_tb_component` (`component_id`),
  KEY `fk_tb_step_tb_rdbms` (`metadata_id`),
  KEY `fk_tb_step_tb_task` (`task_id`),
  CONSTRAINT `fk_tb_step_tb_component` FOREIGN KEY (`component_id`) REFERENCES `tb_component` (`component_id`),
  CONSTRAINT `fk_tb_step_tb_rdbms` FOREIGN KEY (`metadata_id`) REFERENCES `tb_metadata` (`metadata_id`),
  CONSTRAINT `fk_tb_step_tb_task` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_step`
--

LOCK TABLES `tb_step` WRITE;
/*!40000 ALTER TABLE `tb_step` DISABLE KEYS */;
INSERT INTO `tb_step` VALUES (1,'0.1','MySQL CDC','Source : MySQL CDC',1,1,1,'ted.me','2020-09-22 18:15:48','ted.me','2020-09-22 18:15:48'),(2,'0.1','Target : MySQL','Target : MySQL',1,3,1,'ted.me','2020-09-22 18:24:05','ted.me','2020-09-22 18:24:05'),(3,'0.1','Straw Krew Insert','Target : Straw',1,3,2,'ted.me','2020-09-23 12:09:22','ted.me','2020-09-23 12:09:22'),(4,'0.1','MySQL ETL','Source : MySQL',2,2,1,'ted.me','2020-09-23 13:08:15','ted.me','2020-09-23 13:08:15'),(5,'0.1','Target : MySQL','Target : Local',2,3,1,'ted.me','2020-09-23 13:21:30','ted.me','2020-09-23 13:21:30'),(6,'0.1','Oracle ETL','Source : Oracle',6,2,4,'ted.me','2020-11-12 13:46:09','ted.me','2020-11-12 13:46:09'),(7,'0.1','MySQL Mapper','',2,5,NULL,'ted.me','2020-11-21 22:25:54','ted.me','2020-11-21 22:25:54'),(8,'0.1','Mapper',NULL,1,5,NULL,'ted.me','2020-12-02 11:30:19','ted.me','2020-12-02 11:30:19'),(9,'0.1','Mapper',NULL,99999,5,NULL,'ted.me','2020-12-03 12:42:37','ted.me','2020-12-03 12:42:37'),(10,'0.1','Mapper',NULL,99999,5,NULL,'ted.me','2020-12-10 21:01:28','ted.me','2020-12-10 21:01:28'),(11,'0.1','MySQL ETL','Source : MySQL',3,2,1,'ted.me','2020-09-23 13:08:15','ted.me','2020-09-23 13:08:15'),(12,'0.1','Target : MySQL','Target : Krane',3,3,1,'ted.me','2020-09-23 13:21:30','ted.me','2020-09-23 13:21:30'),(13,'0.1','MySQL Mapper','',3,5,NULL,'ted.me','2020-11-21 22:25:54','ted.me','2020-11-21 22:25:54'),(14,'0.1','MySQL CDC','Source : MySQL CDC',5,1,1,'ted.me','2020-09-22 18:15:48','ted.me','2020-09-22 18:15:48'),(15,'0.1','Target : MySQL','Target : MySQL',5,3,1,'ted.me','2020-09-22 18:24:05','ted.me','2020-09-22 18:24:05'),(16,'0.1','Straw Krew Insert','Target : Straw',5,3,2,'ted.me','2020-09-23 12:09:22','ted.me','2020-09-23 12:09:22'),(17,'0.1','Mapper',NULL,5,5,NULL,'ted.me','2020-12-02 11:30:19','ted.me','2020-12-02 11:30:19'),(21,'0.1','Mapper',NULL,5,5,NULL,'ted.me','2020-12-02 11:30:19','ted.me','2020-12-02 11:30:19'),(22,'0.1','MySQL ETL','Source : MySQL',4,2,1,'ted.me','2021-01-13 21:54:31','ted.me','2021-01-13 21:54:31'),(23,'0.1','Straw','Target : Straw',4,3,2,'ted.me','2021-01-13 21:54:57','ted.me','2021-01-13 21:54:57'),(24,'0.1','MySQL Mapper','',4,5,NULL,'ted.me','2020-11-21 22:25:54','ted.me','2020-11-21 22:25:54'),(25,'0.1','Oracle CDC','Source : Oracle CDC',7,1,4,'ted.me','2021-02-20 21:13:17','ted.me','2021-02-20 21:13:17'),(26,'0.1','Straw Insert','Target : Straw',7,3,5,'ted.me','2021-02-20 21:13:17','ted.me','2021-02-20 21:13:17'),(27,'0.1','Mapper',NULL,7,5,NULL,'ted.me','2021-02-20 21:13:17','ted.me','2021-02-20 21:13:17'),(28,'0.1','MySQL CDC','Source : MySQL CDC',8,1,1,'ted.me','2020-09-22 18:15:48','ted.me','2020-09-22 18:15:48'),(29,'0.1','Straw Krew Insert','Target : Straw',8,3,2,'ted.me','2020-09-23 12:09:22','ted.me','2020-09-23 12:09:22'),(30,'0.1','Mapper',NULL,8,5,NULL,'ted.me','2020-12-02 11:30:19','ted.me','2020-12-02 11:30:19'),(37,'0.1','source db - MySQL','따라하기 테스트',100000,1,7,'ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(38,'0.1','target - Straw','따라하기 테스트',100000,3,5,'ted.me','2021-06-19 22:16:07','ted.me','2021-06-19 22:16:07'),(40,'0.1','Test Mapper','따라하기 테스트',100000,5,NULL,'ted.me','2021-06-19 22:24:15','ted.me','2021-06-19 22:24:15'),(41,'0.1','MySQL CDC','Source : MySQL CDC',9,1,1,'ted.me','2021-08-03 01:00:55','ted.me','2021-08-03 01:00:55'),(42,'0.1','MySQL Loader','Target : MySQL',9,3,8,'ted.me','2021-08-03 01:00:55','ted.me','2021-08-03 01:00:55'),(43,'0.1','Mapper','Mapper',9,5,NULL,'ted.me','2021-08-03 01:00:55','ted.me','2021-08-03 01:00:55'),(44,'0.1','SQL','SQL Execute',9,6,8,'ted.me','2021-08-03 01:00:55','ted.me','2021-08-03 01:00:55'),(45,'0.1','조직도 CDC','조직도 CDC',10,1,1,'ted.me','2021-08-10 17:34:19','ted.me','2021-08-10 17:34:19'),(46,'0.1','loader - 근태관리','',10,3,8,'ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(47,'0.1','조직도-근태관리 Mapper','',10,5,NULL,'ted.me','2021-08-10 17:38:15','ted.me','2021-08-10 17:38:15'),(48,'0.1','조직도 CDC','조직도 CDC',11,1,1,'ted.me','2021-08-10 17:34:19','ted.me','2021-08-10 17:34:19'),(49,'0.1','loader - 전자결재','',11,3,8,'ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(50,'0.1','조직도-전자결재 Mapper','',11,5,NULL,'ted.me','2021-08-10 17:38:15','ted.me','2021-08-10 17:38:15'),(51,'0.1','Join','Join Execute',9,7,8,'ted.me','2021-09-07 15:34:02','ted.me','2021-09-07 15:34:02'),(53,'0.1','API','API Call',9,8,8,'ted.me','2021-09-07 15:34:02','ted.me','2021-09-07 15:34:02'),(54,'0.1','SQL','SQL Execute',9,6,8,'ted.me','2021-08-03 01:00:55','ted.me','2021-08-03 01:00:55');
/*!40000 ALTER TABLE `tb_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_step_property`
--

DROP TABLE IF EXISTS `tb_step_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_step_property` (
  `step_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` varchar(10) DEFAULT NULL,
  `step_id` int(11) NOT NULL,
  `component_property_id` int(11) NOT NULL,
  `step_property_value` varchar(4000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_property_id`),
  KEY `fk_tb_step_property_tb_component_property` (`component_property_id`),
  KEY `fk_tb_step_property_tb_step` (`step_id`),
  CONSTRAINT `fk_tb_step_property_tb_component_property` FOREIGN KEY (`component_property_id`) REFERENCES `tb_component_property` (`component_property_id`),
  CONSTRAINT `fk_tb_step_property_tb_step` FOREIGN KEY (`step_id`) REFERENCES `tb_step` (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_step_property`
--

LOCK TABLES `tb_step_property` WRITE;
/*!40000 ALTER TABLE `tb_step_property` DISABLE KEYS */;
INSERT INTO `tb_step_property` VALUES (1,'0.1',1,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2020-09-22 18:21:43','ted.me','2020-09-22 18:21:43'),(2,'0.1',1,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(3,'0.1',1,3,'offset/1/offset.dat','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(4,'0.1',1,4,'60000','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(5,'0.1',1,5,'85744','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(6,'0.1',1,6,'mysql-test','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(7,'0.1',1,7,'source_db','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(8,'0.1',1,8,'source_db.tb_krew, source_db.tb_krew_dept','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(9,'0.1',1,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(10,'0.1',1,10,'offset/1/dbhistory.dat','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(15,'0.1',1,15,'krew-test','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(16,'0.1',1,16,'unwrap','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(17,'0.1',1,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(18,'0.1',1,18,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(19,'0.1',1,19,'op, table','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(20,'0.1',1,20,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(21,'0.1',1,21,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(22,'0.1',1,22,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(27,'0.1',4,27,'source_db','ted.me','2020-09-23 13:19:48','ted.me','2020-09-23 13:19:48'),(33,'0.1',2,27,'source_db','ted.me','2020-09-24 09:36:36','ted.me','2020-09-24 09:36:36'),(40,'0.1',6,47,'orcl','ted.me','2020-11-12 13:51:28','ted.me','2020-11-12 13:51:28'),(45,'0.1',6,53,'oracle.jdbc.OracleDriver','ted.me','2020-11-12 13:51:28','ted.me','2020-11-12 13:51:28'),(46,'0.1',5,27,'source_db','ted.me','2020-11-22 03:04:11','ted.me','2020-11-22 03:04:11'),(52,'0.1',11,27,'source_db','ted.me','2020-09-23 13:19:48','ted.me','2020-09-23 13:19:48'),(57,'0.1',12,27,'target_db','ted.me','2020-11-22 03:04:11','ted.me','2020-11-22 03:04:11'),(67,'0.1',14,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2020-09-22 18:21:43','ted.me','2020-09-22 18:21:43'),(68,'0.1',14,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(69,'0.1',14,3,'offset/5/offset.dat','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(70,'0.1',14,4,'60000','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(71,'0.1',14,5,'85744','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(72,'0.1',14,6,'mysql-test','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(73,'0.1',14,7,'source_db','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(74,'0.1',14,8,'source_db.tb_krew, source_db.tb_krew_dept','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(75,'0.1',14,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(76,'0.1',14,10,'offset/5/dbhistory.dat','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(81,'0.1',14,15,'krew-test','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(82,'0.1',14,16,'unwrap','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(83,'0.1',14,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(84,'0.1',14,18,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(85,'0.1',14,19,'op, table','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(86,'0.1',14,20,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(87,'0.1',14,21,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(88,'0.1',14,22,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(89,'0.1',15,27,'target_db','ted.me','2020-09-24 09:36:36','ted.me','2020-09-24 09:36:36'),(98,'0.1',14,54,'rewrite','ted.me','2021-01-13 18:01:42','ted.me','2021-01-13 18:01:42'),(99,'0.1',22,27,'source_db','ted.me','2020-09-23 13:19:48','ted.me','2020-09-23 13:19:48'),(123,'0.1',25,33,'io.debezium.connector.oracle.OracleConnector','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(124,'0.1',25,34,'1','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(125,'0.1',25,35,'oracle_test','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(130,'0.1',25,40,'orcl','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(132,'0.1',25,42,'oracle_test','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(133,'0.1',25,43,'kafka:9092','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(134,'0.1',25,44,'schema-change.krew','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(135,'0.1',25,45,'logminer','ted.me','2021-02-20 21:35:05','ted.me','2021-02-20 21:35:05'),(138,'0.1',25,55,'oracle-cdc','ted.me','2021-02-20 22:50:21','ted.me','2021-02-20 22:50:21'),(139,'0.1',25,56,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(140,'0.1',25,57,'offset/7/offset.dat','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(141,'0.1',25,58,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(142,'0.1',25,59,'offset/7/dbhistory.dat','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(143,'0.1',25,60,'60000','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(144,'0.1',25,61,'unwrap','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(145,'0.1',25,62,'io.debezium.transforms.ExtractNewRecordState','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(146,'0.1',25,63,'false','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(147,'0.1',25,64,'op, table','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(148,'0.1',25,65,'false','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(149,'0.1',25,66,'false','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(150,'0.1',25,67,'false','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(151,'0.1',25,68,'rewrite','ted.me','2021-02-20 23:36:14','ted.me','2021-02-20 23:36:14'),(154,'0.1',25,76,'ETL_USER','ted.me','2021-02-21 20:21:03','ted.me','2021-02-21 20:21:03'),(155,'0.1',25,77,'STRING','ted.me','2021-02-22 17:13:12','ted.me','2021-02-22 17:13:12'),(159,'0.1',25,78,'timestampConverter','ted.me','2021-03-02 16:00:37','ted.me','2021-03-02 16:00:37'),(160,'0.1',25,79,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-03-02 16:00:37','ted.me','2021-03-02 16:00:37'),(161,'0.1',28,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2020-09-22 18:21:43','ted.me','2020-09-22 18:21:43'),(162,'0.1',28,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(163,'0.1',28,3,'offset/8/offset.dat','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(164,'0.1',28,4,'60000','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(165,'0.1',28,5,'85744','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(166,'0.1',28,6,'mysql-test','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(167,'0.1',28,7,'source_db','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(169,'0.1',28,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(170,'0.1',28,10,'offset/8/dbhistory.dat','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(175,'0.1',28,15,'krew-test','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(176,'0.1',28,16,'unwrap','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(177,'0.1',28,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(178,'0.1',28,18,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(179,'0.1',28,19,'op, table','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(180,'0.1',28,20,'true','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(181,'0.1',28,21,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(182,'0.1',28,22,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(187,'0.1',28,54,'rewrite','ted.me','2021-01-13 18:01:42','ted.me','2021-01-13 18:01:42'),(192,'0.1',28,80,'Asia/Seoul','ted.me','2021-03-04 16:13:18','ted.me','2021-03-04 16:13:18'),(193,'0.1',28,83,'timestampConverter','ted.me','2021-03-08 18:13:37','ted.me','2021-03-08 18:13:37'),(194,'0.1',28,84,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-03-08 18:13:37','ted.me','2021-03-08 18:13:37'),(195,'0.1',28,85,'50','ted.me','2021-03-14 18:46:55','ted.me','2021-03-14 18:46:55'),(196,'0.1',28,89,'0','ted.me','2021-04-05 22:49:44','ted.me','2021-04-05 22:49:44'),(234,'0.1',37,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(235,'0.1',37,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(236,'0.1',37,3,'offset/100000/offset.dat','ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(237,'0.1',37,4,'60000','ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(238,'0.1',37,5,'85745','ted.me','2021-06-19 22:09:18','ted.me','2021-06-19 22:09:18'),(239,'0.1',37,6,'source db - MySQL','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(240,'0.1',37,7,'source_db','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(241,'0.1',37,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(242,'0.1',37,10,'offset/100000/dbhistory.dat','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(247,'0.1',37,15,'source db - MySQL','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(248,'0.1',37,16,'unwrap','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(249,'0.1',37,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(250,'0.1',37,18,'false','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(251,'0.1',37,19,'op, table','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(252,'0.1',37,20,'true','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(253,'0.1',37,21,'false','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(254,'0.1',37,22,'false','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(255,'0.1',37,54,'table','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(256,'0.1',37,80,'UTC','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(257,'0.1',37,83,'timestampConverter','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(258,'0.1',37,84,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-06-19 22:09:19','ted.me','2021-06-19 22:09:19'),(259,'0.1',37,85,'1000','ted.me','2021-06-19 22:09:20','ted.me','2021-06-19 22:09:20'),(260,'0.1',37,89,'0','ted.me','2021-06-19 22:09:20','ted.me','2021-06-19 22:09:20'),(264,'0.1',41,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2020-09-22 18:21:43','ted.me','2020-09-22 18:21:43'),(265,'0.1',41,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(266,'0.1',41,3,'offset/9/offset.dat','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(267,'0.1',41,4,'60000','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(268,'0.1',41,5,'85744','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(269,'0.1',41,6,'mysql-test','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(270,'0.1',41,7,'source_db','ted.me','2020-09-22 18:21:44','ted.me','2020-09-22 18:21:44'),(271,'0.1',41,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(272,'0.1',41,10,'offset/9/dbhistory.dat','ted.me','2020-09-22 18:21:45','ted.me','2020-09-22 18:21:45'),(277,'0.1',41,15,'krew-test','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(278,'0.1',41,16,'unwrap','ted.me','2020-09-23 02:17:16','ted.me','2020-09-23 02:17:16'),(279,'0.1',41,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(280,'0.1',41,18,'false','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(281,'0.1',41,19,'op, table','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(282,'0.1',41,20,'true','ted.me','2020-09-23 02:17:17','ted.me','2020-09-23 02:17:17'),(283,'0.1',41,21,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(284,'0.1',41,22,'false','ted.me','2020-09-23 02:20:52','ted.me','2020-09-23 02:20:52'),(285,'0.1',41,54,'rewrite','ted.me','2021-01-13 18:01:42','ted.me','2021-01-13 18:01:42'),(286,'0.1',41,80,'Asia/Seoul','ted.me','2021-03-04 16:13:18','ted.me','2021-03-04 16:13:18'),(287,'0.1',41,83,'timestampConverter','ted.me','2021-03-08 18:13:37','ted.me','2021-03-08 18:13:37'),(288,'0.1',41,84,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-03-08 18:13:37','ted.me','2021-03-08 18:13:37'),(289,'0.1',41,85,'50','ted.me','2021-03-14 18:46:55','ted.me','2021-03-14 18:46:55'),(290,'0.1',41,89,'0','ted.me','2021-04-05 22:49:44','ted.me','2021-04-05 22:49:44'),(300,'0.1',42,27,'target_db','ted.me','2021-08-03 01:07:26','ted.me','2021-08-03 01:07:26'),(305,'0.1',44,91,'target_db','ted.me','2021-08-03 01:09:47','ted.me','2021-08-03 01:09:47'),(311,'0.1',44,97,'update tb_krew set hire_dy = ?, retire_dy = ? where krew_id = ?','ted.me','2021-08-03 01:21:53','ted.me','2021-08-03 01:21:53'),(312,'0.1',44,98,'{.start_dy}, {:EmpId}, {.krew_id}','ted.me','2021-08-03 01:21:53','ted.me','2021-08-03 01:21:53'),(313,'0.1',41,103,'schema_only','ted.me','2021-08-04 12:14:58','ted.me','2021-08-04 12:14:58'),(314,'0.1',44,105,'{.primary_yn} == \'Y\'','ted.me','2021-08-08 16:06:07','ted.me','2021-08-08 16:06:07'),(315,'0.1',45,1,'io.debezium.connector.mysql.MySqlConnector','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(316,'0.1',45,2,'org.apache.kafka.connect.storage.FileOffsetBackingStore','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(317,'0.1',45,3,'offset/10/offset.dat','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(318,'0.1',45,4,'60000','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(319,'0.1',45,5,'85746','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(320,'0.1',45,6,'조직도 CDC','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(321,'0.1',45,7,'tools_iam','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(322,'0.1',45,9,'io.debezium.relational.history.FileDatabaseHistory','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(323,'0.1',45,10,'offset/10/dbhistory.dat','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(328,'0.1',45,15,'조직도 CDC','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(329,'0.1',45,16,'unwrap','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(330,'0.1',45,17,'io.debezium.transforms.ExtractNewRecordState','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(331,'0.1',45,18,'false','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(332,'0.1',45,19,'op, table','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(333,'0.1',45,20,'true','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(334,'0.1',45,21,'false','ted.me','2021-08-10 17:34:20','ted.me','2021-08-10 17:34:20'),(335,'0.1',45,22,'false','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(336,'0.1',45,54,'rewrite','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(337,'0.1',45,80,'UTC','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(338,'0.1',45,83,'timestampConverter','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(339,'0.1',45,84,'com.kep.soldelivery.cdcconverter.utils.TimestampConverter','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(340,'0.1',45,85,'1000','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(341,'0.1',45,89,'0','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(342,'0.1',45,103,'initial','ted.me','2021-08-10 17:34:21','ted.me','2021-08-10 17:34:21'),(343,'0.1',46,27,'tools_bsc_job_kakaom','ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(348,'0.1',46,46,'com.mysql.cj.jdbc.Driver','ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(349,'0.1',46,47,'tools_bsc_job_kakaom','ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(354,'0.1',46,53,'oracle.jdbc.OracleDriver','ted.me','2021-08-10 17:37:42','ted.me','2021-08-10 17:37:42'),(355,'0.1',42,108,'Y','ted.me','2021-08-17 21:55:36','ted.me','2021-08-17 21:55:36'),(356,'0.1',51,109,'target_db','ted.me','2021-09-07 15:47:24','ted.me','2021-09-07 15:47:24'),(357,'0.1',51,110,'c|u','ted.me','2021-09-07 15:47:24','ted.me','2021-09-07 15:47:24'),(358,'0.1',51,111,'select krew_id, hire_dy from tb_krew tk where job_cd =?','ted.me','2021-09-07 15:47:24','ted.me','2021-09-07 15:47:24'),(359,'0.1',51,112,'{.job_cd}','ted.me','2021-09-07 15:47:24','ted.me','2021-09-07 15:47:24'),(360,'0.1',51,113,'delegate_krew_id, job_hire_dy','ted.me','2021-09-07 15:47:24','ted.me','2021-09-07 15:47:24'),(361,'0.1',51,114,'N','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(362,'0.1',53,115,'https://papi.kakaowork.com/v1/bots/install','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(363,'0.1',53,116,'{\"X-Request-ID\": \"we-eapproval-{$getUUIDString()}\"}','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(364,'0.1',53,117,'{\"bot_key\": \"we-approval\", \"space_id\": \"{.space_id}\"}','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(365,'0.1',53,118,'api_key','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(366,'0.1',53,119,'post','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(367,'0.1',53,121,'bot_auth_key','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(368,'0.1',53,122,'c|u','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22'),(369,'0.1',54,91,'target_db','ted.me','2021-08-03 01:09:47','ted.me','2021-08-03 01:09:47'),(370,'0.1',54,99,'update tb_job set delegate_krew_id = ?, job_hire_dy=? where job_cd = ?','ted.me','2021-08-03 01:21:53','ted.me','2021-08-03 01:21:53'),(371,'0.1',54,100,'{.krew_id}, {.hire_dy}, {.job_cd}','ted.me','2021-08-03 01:21:53','ted.me','2021-08-03 01:21:53'),(372,'0.1',51,123,'{.job_cd} != \'001\'','ted.me','2021-09-07 17:13:22','ted.me','2021-09-07 17:13:22');
/*!40000 ALTER TABLE `tb_step_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_step_table`
--

DROP TABLE IF EXISTS `tb_step_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_step_table` (
  `step_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) NOT NULL,
  `schema_name` varchar(1000) DEFAULT NULL,
  `table_name` varchar(1000) NOT NULL,
  `source_target_type` tinyint(4) NOT NULL COMMENT 'source : 1\ntarget : 2',
  `belong_step_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_table_id`),
  KEY `fk_tb_step_table_tb_step` (`step_id`),
  CONSTRAINT `fk_tb_step_table_tb_step` FOREIGN KEY (`step_id`) REFERENCES `tb_step` (`step_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_step_table`
--

LOCK TABLES `tb_step_table` WRITE;
/*!40000 ALTER TABLE `tb_step_table` DISABLE KEYS */;
INSERT INTO `tb_step_table` VALUES (1,7,'source_db','tb_krew',1,4,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(2,7,'source_db','tb_emp',2,5,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(3,8,'source_db','tb_krew',1,1,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(4,8,'source_db','tb_emp',2,2,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(5,9,'source_db','tb_krew_dept',1,4,'ted.me','2020-12-03 12:43:28','ted.me','2020-12-03 12:43:28'),(6,9,'source_db','tb_user_dept',2,5,'ted.me','2020-12-03 12:44:05','ted.me','2020-12-03 12:44:05'),(7,10,'source_db','tb_krew_hist',1,4,'ted.me','2020-12-10 21:03:16','ted.me','2020-12-10 21:03:16'),(8,10,'source_db','tb_user_hist',2,5,'ted.me','2020-12-10 21:03:16','ted.me','2020-12-10 21:03:16'),(9,8,'source_db','tb_krew_dept',1,1,'ted.me','2020-12-03 12:43:28','ted.me','2020-12-03 12:43:28'),(10,8,'source_db','tb_user_dept',2,2,'ted.me','2020-12-03 12:44:05','ted.me','2020-12-03 12:44:05'),(12,13,'source_db','tb_krew',1,11,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(13,13,'source_db','tb_emp',2,12,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(15,13,'source_db','tb_krew',1,8,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(22,17,'source_db','tb_krew',1,14,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(23,17,'source_db','tb_emp',2,15,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(24,17,'source_db','tb_krew_dept',1,14,'ted.me','2020-12-03 12:43:28','ted.me','2020-12-03 12:43:28'),(25,17,'source_db','tb_user_dept',2,15,'ted.me','2020-12-03 12:44:05','ted.me','2020-12-03 12:44:05'),(29,21,'source_db','tb_krew',1,14,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(30,21,'source_db','tb_krew',2,16,'ted.me','2020-12-02 11:34:29','ted.me','2020-12-02 11:34:29'),(32,24,'source_db','tb_krew',1,22,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(33,24,'source_db','tb_emp',2,23,'ted.me','2020-11-21 22:37:08','ted.me','2020-11-21 22:37:08'),(34,27,'ETL_USER','TB_DEPT',1,25,'ted.me','2021-02-20 23:09:36','ted.me','2021-02-20 23:09:36'),(35,27,'ETL_USER','TB_DEPT',2,26,'ted.me','2021-02-20 23:09:36','ted.me','2021-02-20 23:09:36'),(36,27,'ETL_USER','TB_JOB',1,25,'ted.me','2021-02-20 23:09:37','ted.me','2021-02-20 23:09:37'),(37,27,'ETL_USER','TB_JOB',2,26,'ted.me','2021-02-20 23:09:37','ted.me','2021-02-20 23:09:37'),(38,27,'ETL_USER','TB_KREW',1,25,'ted.me','2021-02-20 23:09:38','ted.me','2021-02-20 23:09:38'),(39,27,'ETL_USER','TB_KREW',2,26,'ted.me','2021-02-20 23:09:39','ted.me','2021-02-20 23:09:39'),(40,27,'ETL_USER','TB_KREW_DEPT',1,25,'ted.me','2021-02-20 23:09:39','ted.me','2021-02-20 23:09:39'),(41,27,'ETL_USER','TB_KREW_DEPT',2,26,'ted.me','2021-02-20 23:09:39','ted.me','2021-02-20 23:09:39'),(42,27,'ETL_USER','TB_CLOB',1,25,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(43,27,'ETL_USER','TB_CLOB',2,26,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(44,30,'source_db','tb_dept',1,28,'ted.me','2021-03-04 16:52:04','ted.me','2021-03-04 16:52:04'),(45,30,'source_db','tb_dept',2,29,'ted.me','2021-03-04 16:52:04','ted.me','2021-03-04 16:52:04'),(46,30,'source_db','tb_job',1,28,'ted.me','2021-03-04 16:52:04','ted.me','2021-03-04 16:52:04'),(47,30,'source_db','tb_job',2,29,'ted.me','2021-03-04 16:52:04','ted.me','2021-03-04 16:52:04'),(48,30,'source_db','tb_krew',1,28,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(49,30,'source_db','tb_krew',2,29,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(50,30,'source_db','tb_krew_dept',1,28,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(51,30,'source_db','tb_krew_dept',2,29,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(52,30,'source_db','tb_krew_hist',1,28,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(53,30,'source_db','tb_krew_hist',2,29,'ted.me','2021-03-04 16:52:05','ted.me','2021-03-04 16:52:05'),(54,30,'source_db','tb_test',1,28,'ted.me','2021-03-09 22:57:37','ted.me','2021-03-09 22:57:37'),(55,30,'source_db','tb_test',2,29,'ted.me','2021-03-09 22:57:37','ted.me','2021-03-09 22:57:37'),(108,43,'source_db','tb_dept',1,41,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,43,'source_db','tb_dept',2,42,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(110,43,'source_db','tb_job',1,41,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,43,'source_db','tb_job',2,42,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(112,43,'source_db','tb_krew',1,41,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(113,43,'source_db','tb_krew',2,42,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,43,'source_db','tb_krew_dept',1,41,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,43,'source_db','tb_krew_dept',2,42,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(116,43,'source_db','tb_krew_hist',1,41,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(117,43,'source_db','tb_krew_hist',2,42,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(118,47,'tools_iam','CODE',1,45,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(119,47,'tools_bsc_job_kakaom','code',2,46,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(120,47,'tools_iam','COMPANY',1,45,'ted.me','2021-08-10 17:40:58','ted.me','2021-08-10 17:40:58'),(121,47,'tools_bsc_job_kakaom','company',2,46,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(122,47,'tools_iam','DEPARTMENT',1,45,'ted.me','2021-08-10 17:41:00','ted.me','2021-08-10 17:41:00'),(123,47,'tools_bsc_job_kakaom','department',2,46,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(124,47,'tools_iam','DEPT_USER',1,45,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(125,47,'tools_bsc_job_kakaom','department_user',2,46,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,47,'tools_iam','HOLIDAY',1,45,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(127,47,'tools_bsc_job_kakaom','event_holiday',2,46,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(128,47,'tools_iam','LOCALE',1,45,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(129,47,'tools_bsc_job_kakaom','locale',2,46,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,47,'tools_iam','MANAGER',1,45,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(131,47,'tools_bsc_job_kakaom','manager',2,46,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(132,47,'tools_iam','USER',1,45,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(133,47,'tools_bsc_job_kakaom','employee',2,46,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(136,47,'tools_iam','USER_INFO',1,45,'ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(138,50,'tools_iam','COMPANY',1,48,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(139,50,'eapproval_kep','company',2,49,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(140,50,'tools_iam','DEPT_USER',1,48,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(141,50,'eapproval_kep','concurrent',2,49,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(142,50,'tools_iam','DEPARTMENT',1,48,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(143,50,'eapproval_kep','department',2,49,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(144,50,'tools_iam','USER',1,48,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(145,50,'eapproval_kep','employee',2,49,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(146,50,'tools_iam','HOLIDAY',1,48,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12'),(147,50,'eapproval_kep','holiday',2,49,'ted.me','2021-08-30 20:10:12','ted.me','2021-08-30 20:10:12');
/*!40000 ALTER TABLE `tb_step_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_table_column`
--

DROP TABLE IF EXISTS `tb_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_table_column` (
  `step_table_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `column_name` varchar(1000) NOT NULL,
  `column_type` varchar(100) NOT NULL,
  `column_type_id` int(11) NOT NULL,
  `column_length` bigint(20) DEFAULT NULL,
  `null_yn` char(1) NOT NULL,
  `pk_seq` tinyint(4) DEFAULT NULL,
  `extra_type` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_table_id`,`column_id`),
  CONSTRAINT `fk_tb_table_column_tb_step_table` FOREIGN KEY (`step_table_id`) REFERENCES `tb_step_table` (`step_table_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_table_column`
--

LOCK TABLES `tb_table_column` WRITE;
/*!40000 ALTER TABLE `tb_table_column` DISABLE KEYS */;
INSERT INTO `tb_table_column` VALUES (1,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(1,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(2,1,'emp_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(2,2,'emp_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(2,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(3,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(3,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(4,1,'emp_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(4,2,'emp_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(4,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(5,1,'krew_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(5,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(6,1,'user_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(6,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(7,1,'krew_id','int',4,11,'N',1,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(7,2,'dept_cd','varchar',12,10,'N',2,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(7,3,'seq','int',4,11,'N',3,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(7,4,'krew_nm','varchar',12,1000,'N',NULL,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(8,1,'user_id','int',4,11,'N',1,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(8,2,'dept_cd','varchar',12,10,'N',2,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(8,3,'seq','int',4,11,'N',3,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(8,4,'user_nm','varchar',12,1000,'N',NULL,NULL,'ted.me','2020-12-10 21:27:21','ted.me','2020-12-10 21:27:21'),(9,1,'krew_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(9,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(10,1,'user_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(10,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(12,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(12,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(13,1,'emp_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(13,2,'emp_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(13,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(22,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(22,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(23,1,'emp_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(23,2,'emp_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(23,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(24,1,'krew_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(24,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:49:39','ted.me','2020-12-03 12:49:39'),(25,1,'user_id','int',4,11,'N',2,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,2,'dept_cd','varchar',12,100,'N',1,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,3,'primary_yn','char',12,1,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,4,'start_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,5,'end_dy','varchar',12,8,'Y',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,6,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(25,7,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-12-03 12:50:36','ted.me','2020-12-03 12:50:36'),(29,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(29,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(30,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,1,'krew_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,2,'krew_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,4,'phone','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,5,'job_cd','varchar',12,10,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,6,'hire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,7,'retire_dy','varchar',12,8,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,8,'reg_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(32,9,'updt_dt','varchar',12,20,'N',NULL,NULL,'ted.me','2020-11-21 23:02:12','ted.me','2020-11-21 23:02:12'),(33,1,'emp_id','int',4,11,'N',1,'auto_increment','ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(33,2,'emp_nm','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(33,3,'email','varchar',12,100,'N',NULL,NULL,'ted.me','2020-11-21 23:04:02','ted.me','2020-11-21 23:04:02'),(34,1,'DEPT_CD','VARCHAR2',12,100,'N',1,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,2,'DEPT_NM','VARCHAR2',12,1000,'N',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,3,'DEPT_DESC','VARCHAR2',12,1000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,4,'UPPER_DEPT_CD','VARCHAR2',12,100,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,5,'START_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,6,'END_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,7,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(34,8,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(35,1,'DEPT_CD','VARCHAR2',12,100,'N',1,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(35,2,'DEPT_NM','VARCHAR2',12,1000,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,3,'DEPT_DESC','VARCHAR2',12,1000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,4,'UPPER_DEPT_CD','VARCHAR2',12,100,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,5,'START_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,6,'END_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,7,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(35,8,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(36,1,'JOB_CD','VARCHAR2',12,10,'N',1,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(36,2,'JOB_TITLE','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(36,3,'JOB_DESC','VARCHAR2',12,1000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(36,4,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(36,5,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(37,1,'JOB_CD','VARCHAR2',12,10,'N',1,NULL,'ted.me','2021-03-04 00:20:12','ted.me','2021-03-04 00:20:12'),(37,2,'JOB_TITLE','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,3,'JOB_DESC','VARCHAR2',12,1000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,4,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(37,5,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:13','ted.me','2021-03-04 00:20:13'),(38,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,2,'KREW_NM','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,3,'EMAIL','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,4,'PHONE','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,5,'JOB_CD','VARCHAR2',12,10,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,6,'HIRE_DY','DATE',93,7,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,7,'RETIRE_DY','DATE',93,7,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,8,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(38,9,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,2,'KREW_NM','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,3,'EMAIL','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,4,'PHONE','VARCHAR2',12,100,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,5,'JOB_CD','VARCHAR2',12,10,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,6,'HIRE_DY','DATE',93,7,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,7,'RETIRE_DY','DATE',93,7,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,8,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(39,9,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:14','ted.me','2021-03-04 00:20:14'),(40,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,2,'DEPT_CD','VARCHAR2',12,100,'N',2,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,3,'PRIMARY_YN','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,4,'START_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,5,'END_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,6,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(40,7,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,0,'id','VARCHAR',12,8000,'N',0,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,2,'DEPT_CD','VARCHAR2',12,100,'N',2,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,3,'PRIMARY_YN','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,4,'START_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,5,'END_DY','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,6,'REG_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(41,7,'UPDT_DT','DATE',93,7,'N',NULL,NULL,'ted.me','2021-03-04 00:20:16','ted.me','2021-03-04 00:20:16'),(42,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(42,2,'KREW_TEXT','CLOB',2005,4000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(43,1,'KREW_ID','NUMBER',2,0,'N',1,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(43,2,'KREW_TEXT','CLOB',2005,4000,'Y',NULL,NULL,'ted.me','2021-03-04 00:20:11','ted.me','2021-03-04 00:20:11'),(44,1,'dept_cd','VARCHAR',12,100,'N',1,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,2,'dept_nm','VARCHAR',12,1000,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,3,'dept_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,4,'upper_dept_cd','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,5,'start_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,6,'end_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,7,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(44,8,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,1,'dept_cd','VARCHAR',12,100,'N',1,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,2,'dept_nm','VARCHAR',12,1000,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,3,'dept_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,4,'upper_dept_cd','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,5,'start_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,6,'end_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,7,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(45,8,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:40','ted.me','2021-03-24 23:20:40'),(46,1,'job_cd','VARCHAR',12,10,'N',1,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(46,2,'job_title','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(46,3,'job_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(46,4,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(46,5,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(47,1,'job_cd','VARCHAR',12,10,'N',1,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(47,2,'job_title','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(47,3,'job_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:41','ted.me','2021-03-24 23:20:41'),(47,4,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(47,5,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-03-24 23:20:42','ted.me','2021-03-24 23:20:42'),(48,1,'krew_id','INT',4,10,'N',1,'auto_increment','ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,2,'krew_nm','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,3,'email','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,4,'phone','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,5,'job_cd','VARCHAR',12,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,6,'hire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,7,'retire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:43','ted.me','2021-03-24 23:20:43'),(48,8,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(48,9,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,1,'krew_id','INT',4,10,'N',1,'auto_increment','ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,2,'krew_nm','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,3,'email','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,4,'phone','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,5,'job_cd','VARCHAR',12,10,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,6,'hire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,7,'retire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,8,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(49,9,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,2,'dept_cd','VARCHAR',12,100,'N',2,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,3,'primary_yn','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,4,'start_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,5,'end_dy','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,6,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:44','ted.me','2021-03-24 23:20:44'),(50,7,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,0,'id','VARCHAR',12,8000,'N',0,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,2,'dept_cd','VARCHAR',12,100,'N',2,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,3,'primary_yn','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,4,'start_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,5,'end_dy','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,6,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(51,7,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(52,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(52,2,'dept_cd','VARCHAR',12,10,'N',2,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(52,3,'seq','INT',4,10,'N',3,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(52,4,'krew_nm','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(52,5,'long_text','LONGTEXT',-1,2147483647,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(53,0,'id','VARCHAR',12,8000,'N',0,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-03-24 23:20:45','ted.me','2021-03-24 23:20:45'),(53,2,'dept_cd','VARCHAR',12,10,'N',2,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,3,'seq','INT',4,10,'N',3,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,4,'krew_nm','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(53,5,'long_text','LONGTEXT',-1,2147483647,'Y',NULL,NULL,'ted.me','2021-03-24 23:20:46','ted.me','2021-03-24 23:20:46'),(54,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,2,'seq','INT',4,10,'N',2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,3,'id','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,4,'straw_id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,0,'straw_id1','VARCHAR',12,8000,'N',0,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,2,'seq','INT',4,10,'N',2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,3,'id','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,4,'straw_id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(108,1,'dept_cd','VARCHAR',12,100,'N',1,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,2,'dept_nm','VARCHAR',12,1000,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,3,'dept_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,4,'upper_dept_cd','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,5,'start_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,6,'end_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,7,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(108,8,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,1,'dept_cd','VARCHAR',12,100,'N',1,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,2,'dept_nm','VARCHAR',12,1000,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,3,'dept_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,4,'upper_dept_cd','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,5,'start_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,6,'end_dy','DATE',91,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,7,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(109,8,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:30','ted.me','2021-08-03 01:13:30'),(110,1,'job_cd','VARCHAR',12,10,'N',1,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(110,2,'job_title','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(110,3,'job_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(110,4,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(110,5,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,1,'job_cd','VARCHAR',12,10,'N',1,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,2,'job_title','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,3,'job_desc','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,4,'reg_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(111,5,'updt_dt','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-03 01:13:31','ted.me','2021-08-03 01:13:31'),(112,1,'krew_id','INT',4,10,'N',1,'auto_increment','ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(112,2,'krew_nm','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:32','ted.me','2021-08-03 01:13:32'),(112,3,'email','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,4,'phone','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,5,'job_cd','VARCHAR',12,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,6,'space_id','BIGINT',12,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,7,'hire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,8,'retire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,9,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(112,10,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,1,'krew_id','INT',4,10,'N',1,'auto_increment','ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,2,'krew_nm','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,3,'email','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,4,'phone','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,5,'job_cd','VARCHAR',12,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,6,'space_id','BIGINT',12,10,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,7,'bot_auth_key','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,8,'hire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,9,'retire_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,10,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(113,11,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,2,'dept_cd','VARCHAR',12,100,'N',2,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,3,'primary_yn','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,4,'start_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,5,'end_dy','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,6,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(114,7,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,2,'dept_cd','VARCHAR',12,100,'N',2,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,3,'primary_yn','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:33','ted.me','2021-08-03 01:13:33'),(115,4,'start_dy','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,5,'end_dy','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,6,'reg_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(115,7,'updt_dt','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(116,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(116,2,'dept_cd','VARCHAR',12,10,'N',2,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(116,3,'seq','INT',4,10,'N',3,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(116,4,'krew_nm','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(116,5,'long_text','LONGTEXT',-1,2147483647,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:34','ted.me','2021-08-03 01:13:34'),(117,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,2,'dept_cd','VARCHAR',12,10,'N',2,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,3,'seq','INT',4,10,'N',3,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,4,'krew_nm','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(117,5,'long_text','LONGTEXT',-1,2147483647,'Y',NULL,NULL,'ted.me','2021-08-03 01:13:35','ted.me','2021-08-03 01:13:35'),(118,1,'ID','BIGINT UNSIGNED',-5,20,'N',1,'auto_increment','ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,3,'CODE_SET_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,4,'CODE','VARCHAR',12,40,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,5,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,6,'ORD','INT',4,10,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,7,'USE_YN','CHAR',1,1,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,8,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,9,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,10,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(118,11,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:57','ted.me','2021-08-10 17:40:57'),(119,1,'cmp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:19:59','ted.me','2021-08-23 16:19:59'),(119,2,'code_id','bigint',4,20,'N',1,'auto_increment','ted.me','2021-08-23 16:20:11','ted.me','2021-08-23 16:20:11'),(119,3,'code_type','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,4,'code','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,5,'code_name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,6,'display_order','int',4,11,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,7,'use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,8,'sync_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,9,'sync_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:20:12','ted.me','2021-08-23 16:20:12'),(119,10,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(119,11,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(119,12,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(119,13,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(120,1,'COMPANY_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,2,'SPACE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,3,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,4,'REMARKS','TEXT',-1,65535,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,5,'IMAGE','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,6,'COLOR','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,7,'DEFAULT_LOCALE','VARCHAR',12,40,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,8,'LOCALE_USE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,9,'LOCATION_USE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,10,'DATA_SYNC_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,11,'LEVEL','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,12,'REGISTRATION_NUMBER','VARCHAR',12,12,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,13,'IP_RESTRICTIONS_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,14,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,15,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,16,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(120,17,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(121,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(121,2,'space_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(121,3,'name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(121,4,'remarks','text',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:06','ted.me','2021-08-23 16:22:06'),(121,5,'image','varchar',12,1000,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,6,'establishment_date','varchar',12,8,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,7,'closure_date','varchar',12,8,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,8,'default_close_date','varchar',12,2,'N',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,9,'default_locale','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,10,'data_sync_yn','varchar',12,2,'N',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,11,'registration_number','varchar',12,12,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,12,'ip_restrictions_yn','varchar',12,2,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:07','ted.me','2021-08-23 16:22:07'),(121,13,'service_status','varchar',12,10,'N',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,14,'service_start_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,15,'first_open_date','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,16,'open_date','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,17,'reserve_off_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,18,'api_key','varchar',12,100,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,19,'created_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,20,'created_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:08','ted.me','2021-08-23 16:22:08'),(121,21,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,22,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,23,'api_token_issue_id','varchar',12,36,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,24,'api_token_issue_date','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,25,'api_ip_check','tinyint',4,1,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,26,'api_allow_ip_list','text',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(121,27,'api_token','text',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(122,1,'DEPT_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,3,'PARENT_DEPT_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,4,'CODE','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,5,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,6,'ORD','INT',4,10,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,7,'DEPT_PATH_ID','TEXT',-1,65535,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,8,'DEPTH','INT',4,10,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,9,'PARENT_DEPT_NAME','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,10,'APPROVAL_EMP_SET_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(122,11,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(122,12,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(122,13,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(122,14,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(123,1,'dept_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-23 16:22:09','ted.me','2021-08-23 16:22:09'),(123,2,'cmp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,3,'dept_code','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,4,'dept_name','varchar',12,100,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,5,'dept_ord','int',4,11,'N',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,6,'up_dept_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,7,'dept_path_id','varchar',12,500,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,8,'dept_head_emp_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,9,'effective_start_date','varchar',12,8,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,10,'effective_end_date','varchar',12,8,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:10','ted.me','2021-08-23 16:22:10'),(123,11,'use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(123,12,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(123,13,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(123,14,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(123,15,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(124,1,'DEPT_ID','BIGINT',-5,19,'N',2,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,2,'EMPLOYEE_ID','BIGINT',-5,19,'N',1,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,3,'USER_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,4,'COMPANY_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,5,'PRIMARY_JOB_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,6,'DUTY_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,7,'DUTY','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,8,'HAED_EMPLOYEE_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,9,'APPROVAL_EMPLOYEE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,10,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,11,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,12,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(124,13,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(125,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(125,2,'dept_id','bigint',4,20,'N',2,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(125,3,'emp_id','bigint',4,20,'N',3,NULL,'ted.me','2021-08-23 16:22:11','ted.me','2021-08-23 16:22:11'),(125,4,'primary_job_yn','varchar',12,2,'N',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,5,'position_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,6,'duty_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,7,'job_code_Id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,8,'appointment_start_date','timestamp',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,9,'appointment_end_date','timestamp',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,10,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,11,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,12,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:12','ted.me','2021-08-23 16:22:12'),(125,13,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(125,14,'approval_employee_yn','varchar',12,2,'N',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(125,15,'head_employee_yn','varchar',12,2,'N',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(126,1,'HOLIDAY_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,3,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,4,'DAY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,5,'TYPE','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,6,'FIRST_CREATED_TIME','TIMESTAMP',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,7,'FIRST_CREATED_BY','VARCHAR',12,20,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,8,'LAST_MODIFIED_TIME','TIMESTAMP',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(126,9,'LAST_MODIFIED_BY','VARCHAR',12,20,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(127,1,'seq','bigint',4,20,'N',1,'auto_increment','ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(127,2,'cmp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,3,'title','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,4,'contents','varchar',12,2000,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,5,'type','varchar',12,30,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,6,'start_day','date',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,7,'end_day','date',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,8,'event_minute','int',4,11,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,9,'display_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:22:18','ted.me','2021-08-23 16:22:18'),(127,10,'url','varchar',12,255,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(127,11,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(127,12,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(127,13,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(127,14,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(127,15,'setting_seq','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(128,1,'CODE','VARCHAR',12,40,'N',1,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(128,2,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(128,3,'NAME_NATIVE','TEXT',-1,65535,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(128,4,'DATE_FORMAT','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(128,5,'CURRENCY','VARCHAR',12,45,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(128,6,'TIMEZONE','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(129,1,'code','varchar',12,40,'N',1,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(129,2,'name','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:22:19','ted.me','2021-08-23 16:22:19'),(129,3,'name_native','text',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(129,4,'currency','varchar',12,45,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(129,5,'timezone','varchar',12,100,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(130,1,'ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,3,'EMPLOYEE_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,4,'ROLE_TYPE','VARCHAR',12,40,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,5,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,6,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,7,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(130,8,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:04','ted.me','2021-08-10 17:41:04'),(131,1,'seq','bigint',4,20,'N',1,'auto_increment','ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,2,'cmp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,3,'emp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,4,'role_type','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,5,'use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,6,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:20','ted.me','2021-08-23 16:22:20'),(131,7,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:21','ted.me','2021-08-23 16:22:21'),(131,8,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:21','ted.me','2021-08-23 16:22:21'),(131,9,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:21','ted.me','2021-08-23 16:22:21'),(132,1,'EMPLOYEE_ID','BIGINT',-5,19,'N',1,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,2,'COMPANY_ID','BIGINT',-5,19,'N',2,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,3,'USER_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,4,'UID','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,5,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,6,'NICKNAME','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,7,'TYPE_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,8,'JOB_GROUP_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,9,'POSITION_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,10,'JOB_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,11,'RANK_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,12,'POSITION','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,13,'RESPONSIBILITY','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,14,'JOIN_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,15,'GROUP_JOIN_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,16,'RETIREMENT_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,17,'PROFILE_IMAGE_URL','VARCHAR',12,500,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,18,'REMARK','VARCHAR',12,200,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,19,'STATUS','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,20,'SEX_DISTINCTION','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,21,'BIRTHDAY','CHAR',1,4,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,22,'BIRTHDAY_LUNAR_YN','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,23,'OFFICE_LOCATION','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,24,'WORK_START_TIME','TIME',92,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,25,'WORK_END_TIME','TIME',92,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,26,'FIRST_LOGIN_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,27,'DELETE_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,28,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,29,'FIRST_CREATED_BY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,30,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,31,'LAST_MODIFIED_BY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,32,'COMPANY_TELEPHONE_NUMBER','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,33,'MAIL','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,34,'MOBILE_TELEPHONE_NUMBER','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(132,35,'DELETED_TIME','DATETIME',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(133,1,'emp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(133,2,'cmp_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(133,3,'dept_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(133,4,'name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(133,5,'account_id','varchar',12,50,'N',NULL,NULL,'ted.me','2021-08-23 16:22:13','ted.me','2021-08-23 16:22:13'),(133,6,'user_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,7,'work_start_time','time',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,8,'work_end_time','time',12,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,9,'duty_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,10,'type_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,11,'locale_code','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,12,'type_code','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,13,'email','varchar',12,200,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,14,'mobile_telephone_number','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:14','ted.me','2021-08-23 16:22:14'),(133,15,'emp_status','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,16,'office_location','varchar',12,50,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,17,'group_no','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,18,'group_apply_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,19,'group_apply_emp_no','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,20,'setting_seq','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,21,'use_service_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,22,'join_date','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:15','ted.me','2021-08-23 16:22:15'),(133,23,'retirement_date','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,24,'layoff_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,25,'reinstatement_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,26,'layoff_reason_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,27,'layoff_from_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,28,'layoff_to_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,29,'leader_issued_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,30,'leader_release_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:16','ted.me','2021-08-23 16:22:16'),(133,31,'trainee_end_date','date',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,32,'profile_image_url','varchar',12,1000,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,33,'conversation_id','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,34,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,35,'created_by','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,36,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,37,'updated_by','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(133,38,'renewal_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-23 16:22:17','ted.me','2021-08-23 16:22:17'),(136,1,'ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(136,2,'EMPLOYEE_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(136,3,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(136,4,'TYPE','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(136,5,'INFO','VARCHAR',12,500,'N',NULL,NULL,'ted.me','2021-08-10 17:41:07','ted.me','2021-08-10 17:41:07'),(138,1,'COMPANY_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,2,'SPACE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,3,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,4,'REMARKS','TEXT',-1,65535,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,5,'IMAGE','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,6,'COLOR','VARCHAR',12,1000,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,7,'DEFAULT_LOCALE','VARCHAR',12,40,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,8,'LOCALE_USE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,9,'LOCATION_USE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,10,'DATA_SYNC_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,11,'LEVEL','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,12,'REGISTRATION_NUMBER','VARCHAR',12,12,'Y',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,13,'IP_RESTRICTIONS_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,14,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,15,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,16,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(138,17,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:40:59','ted.me','2021-08-10 17:40:59'),(139,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-30 20:30:59','ted.me','2021-08-30 20:30:59'),(139,2,'cmp_code','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-30 20:30:59','ted.me','2021-08-30 20:30:59'),(139,3,'cmp_name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,4,'cmp_ceo','varchar',12,100,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,5,'cmp_address','varchar',12,500,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,6,'cmp_phone_number','varchar',12,30,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,7,'cmp_fax_number','varchar',12,30,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,8,'space_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,9,'bot_auth_key','varchar',12,100,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,10,'cmp_logo_url','varchar',12,300,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:00','ted.me','2021-08-30 20:31:00'),(139,11,'default_locale_code','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(139,12,'locale_use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(139,13,'ip_restrictions_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(139,14,'service_use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(139,15,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(139,16,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(140,1,'DEPT_ID','BIGINT',-5,19,'N',2,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,2,'EMPLOYEE_ID','BIGINT',-5,19,'N',1,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,3,'USER_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,4,'COMPANY_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,5,'PRIMARY_JOB_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,6,'DUTY_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,7,'DUTY','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,8,'HAED_EMPLOYEE_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,9,'APPROVAL_EMPLOYEE_YN','VARCHAR',12,2,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,10,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,11,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,12,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(140,13,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(141,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-30 20:31:01','ted.me','2021-08-30 20:31:01'),(141,2,'dept_id','bigint',4,20,'N',3,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,3,'emp_id','bigint',4,20,'N',2,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,4,'position_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,5,'duty_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,6,'dept_head_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,7,'doc_receipt_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,8,'appr_emp_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,9,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-30 20:31:02','ted.me','2021-08-30 20:31:02'),(141,10,'updated_at','datetime',93,6,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(142,1,'DEPT_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,3,'PARENT_DEPT_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,4,'CODE','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,5,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,6,'ORD','INT',4,10,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,7,'DEPT_PATH_ID','TEXT',-1,65535,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,8,'DEPTH','INT',4,10,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,9,'PARENT_DEPT_NAME','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,10,'APPROVAL_EMP_SET_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:01','ted.me','2021-08-10 17:41:01'),(142,11,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(142,12,'FIRST_CREATED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(142,13,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(142,14,'LAST_MODIFIED_BY','VARCHAR',12,20,'N',NULL,NULL,'ted.me','2021-08-10 17:41:02','ted.me','2021-08-10 17:41:02'),(143,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,2,'dept_id','bigint',4,20,'N',2,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,3,'dept_code','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,4,'dept_name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,5,'up_dept_id','bigint',4,20,'N',NULL,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,6,'dept_path_name','varchar',12,500,'N',NULL,NULL,'ted.me','2021-08-30 20:31:03','ted.me','2021-08-30 20:31:03'),(143,7,'dept_path_id','varchar',12,500,'N',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(143,8,'dept_depth','int',4,11,'N',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(143,9,'display_order','smallint',4,6,'N',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(143,10,'use_yn','varchar',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(143,11,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(143,12,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(144,1,'EMPLOYEE_ID','BIGINT',-5,19,'N',1,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,2,'COMPANY_ID','BIGINT',-5,19,'N',2,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,3,'USER_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,4,'UID','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,5,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,6,'NICKNAME','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,7,'TYPE_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,8,'JOB_GROUP_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,9,'POSITION_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,10,'JOB_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,11,'RANK_CODE_ID','BIGINT',-5,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,12,'POSITION','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,13,'RESPONSIBILITY','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,14,'JOIN_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,15,'GROUP_JOIN_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,16,'RETIREMENT_DATE','VARCHAR',12,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,17,'PROFILE_IMAGE_URL','VARCHAR',12,500,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,18,'REMARK','VARCHAR',12,200,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,19,'STATUS','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,20,'SEX_DISTINCTION','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,21,'BIRTHDAY','CHAR',1,4,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,22,'BIRTHDAY_LUNAR_YN','CHAR',1,1,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,23,'OFFICE_LOCATION','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,24,'WORK_START_TIME','TIME',92,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,25,'WORK_END_TIME','TIME',92,8,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,26,'FIRST_LOGIN_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,27,'DELETE_YN','VARCHAR',12,2,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,28,'FIRST_CREATED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,29,'FIRST_CREATED_BY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,30,'LAST_MODIFIED_TIME','DATETIME',93,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,31,'LAST_MODIFIED_BY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,32,'COMPANY_TELEPHONE_NUMBER','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,33,'MAIL','VARCHAR',12,100,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,34,'MOBILE_TELEPHONE_NUMBER','VARCHAR',12,40,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(144,35,'DELETED_TIME','DATETIME',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:05','ted.me','2021-08-10 17:41:05'),(145,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-30 20:31:04','ted.me','2021-08-30 20:31:04'),(145,2,'emp_id','bigint',4,20,'N',2,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,3,'emp_no','varchar',12,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,4,'dept_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,5,'emp_name','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,6,'account_id','varchar',12,100,'N',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,7,'app_user_id','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,8,'app_conversation_id','varchar',12,40,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:05','ted.me','2021-08-30 20:31:05'),(145,9,'emp_rank_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,10,'position_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,11,'duty_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,12,'job_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,13,'job_group_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,14,'emp_type_code_id','bigint',4,20,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,15,'email','varchar',12,200,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,16,'cmp_phone_number','varchar',12,30,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:06','ted.me','2021-08-30 20:31:06'),(145,17,'cell_phone_number','varchar',12,30,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,18,'profile_image_url','varchar',12,256,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,19,'emp_status','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,20,'notice_receive_yn','varchar',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,21,'office_location','varchar',12,50,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,22,'appr_password_use_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,23,'appr_password','varchar',12,500,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,24,'dept_head_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:07','ted.me','2021-08-30 20:31:07'),(145,25,'doc_receipt_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,26,'appr_emp_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,27,'authority','varchar',12,45,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,28,'space_manager_yn','char',12,1,'N',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,29,'emp_deleted_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,30,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(145,31,'updated_at','datetime',93,6,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:08','ted.me','2021-08-30 20:31:08'),(146,1,'HOLIDAY_ID','BIGINT',-5,19,'N',1,'auto_increment','ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,2,'COMPANY_ID','BIGINT',-5,19,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,3,'NAME','VARCHAR',12,100,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,4,'DAY','VARCHAR',12,8,'N',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,5,'TYPE','VARCHAR',12,50,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,6,'FIRST_CREATED_TIME','TIMESTAMP',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,7,'FIRST_CREATED_BY','VARCHAR',12,20,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,8,'LAST_MODIFIED_TIME','TIMESTAMP',93,19,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(146,9,'LAST_MODIFIED_BY','VARCHAR',12,20,'Y',NULL,NULL,'ted.me','2021-08-10 17:41:03','ted.me','2021-08-10 17:41:03'),(147,1,'cmp_id','bigint',4,20,'N',1,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,2,'holiday_id','bigint',4,20,'N',2,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,3,'holiday_name','varchar',12,40,'N',NULL,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,4,'holiday_date','varchar',12,10,'N',NULL,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,5,'holiday_type','varchar',12,10,'N',NULL,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,6,'created_at','datetime',93,NULL,'N',NULL,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09'),(147,7,'updated_at','datetime',93,NULL,'Y',NULL,NULL,'ted.me','2021-08-30 20:31:09','ted.me','2021-08-30 20:31:09');
/*!40000 ALTER TABLE `tb_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_table_column_history`
--

DROP TABLE IF EXISTS `tb_table_column_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_table_column_history` (
  `step_table_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `column_name` varchar(1000) NOT NULL,
  `column_type` varchar(100) NOT NULL,
  `column_type_id` int(11) NOT NULL,
  `column_length` int(11) DEFAULT NULL,
  `null_yn` char(1) NOT NULL,
  `pk_seq` tinyint(4) DEFAULT NULL,
  `extra_type` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`step_table_id`,`column_id`,`history_id`),
  CONSTRAINT `fk_tb_table_column_history` FOREIGN KEY (`step_table_id`) REFERENCES `tb_step_table` (`step_table_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_table_column_history`
--

LOCK TABLES `tb_table_column_history` WRITE;
/*!40000 ALTER TABLE `tb_table_column_history` DISABLE KEYS */;
INSERT INTO `tb_table_column_history` VALUES (54,1,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,2,1,'seq','INT',4,10,'N',2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,3,1,'id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(54,4,1,'straw_id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,0,1,'straw_id1','VARCHAR',12,8000,'N',0,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,1,1,'krew_id','INT',4,10,'N',1,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,2,1,'seq','INT',4,10,'N',2,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,3,1,'id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42'),(55,4,1,'straw_id','INT',4,10,'Y',NULL,NULL,'ted.me','2021-06-01 13:45:42','ted.me','2021-06-01 13:45:42');
/*!40000 ALTER TABLE `tb_table_column_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task`
--

DROP TABLE IF EXISTS `tb_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` varchar(10) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `folder_seq` int(11) NOT NULL,
  `task_type_cd` tinyint(4) NOT NULL,
  `task_name` varchar(100) NOT NULL,
  `task_desc` varchar(1000) DEFAULT NULL,
  `owner_id` varchar(100) NOT NULL,
  `task_status` tinyint(4) DEFAULT NULL,
  `execution_status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`),
  KEY `fk_tb_task_tb_folder` (`folder_id`),
  CONSTRAINT `fk_tb_task_tb_folder` FOREIGN KEY (`folder_id`) REFERENCES `tb_folder` (`folder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task`
--

LOCK TABLES `tb_task` WRITE;
/*!40000 ALTER TABLE `tb_task` DISABLE KEYS */;
INSERT INTO `tb_task` VALUES (1,'0.1',1,2,1,'CDC Test','MySQL -> MySQL(local)','ted.me',1,1,'ted.me','2020-10-19 22:16:51','ted.me','2020-10-19 22:16:51'),(2,'0.1',1,1,2,'ETL Test','MySQL -> MySQL(local)','ted.me',1,1,'ted.me','2020-10-19 22:16:51','ted.me','2020-10-19 22:16:51'),(3,'0.1',1,3,2,'ETL (DB-DB)','MySQL -> MySQL(krane)','ted.me',1,1,'ted.me','2021-01-12 04:07:58','ted.me','2021-01-12 04:07:58'),(4,'0.1',1,6,2,'ETL (DB-Straw)','MySQL -> Straw','ted.me',1,1,'ted.me','2021-01-13 21:52:38','ted.me','2021-01-13 21:52:38'),(5,'0.1',1,5,1,'CDC Multi Target','MySQL -> MySQL, Straw','ted.me',1,1,'ted.me','2021-01-12 05:21:52','ted.me','2021-01-12 05:21:52'),(6,'0.1',1,4,2,'Oracle Test','Oracle -> MySQL(개발중)','ted.me',1,1,'ted.me','2020-12-02 11:26:35','ted.me','2020-12-02 11:26:35'),(7,'0.1',1,7,1,'Oracle CDC','Oracle -> Straw','ted.me',1,1,'ted.me','2021-02-20 21:10:57','ted.me','2021-02-20 21:10:57'),(8,'0.1',1,8,1,'MySQL CDC','MySQL -> Straw','ted.me',1,1,'ted.me','2021-03-04 15:59:42','ted.me','2021-03-04 15:59:42'),(9,'0.1',1,9,1,'New MySQL CDC','MySQL -> MySQL (SQL step 포함)','ted.me',1,1,'ted.me','2021-08-03 00:43:01','ted.me','2021-08-03 00:43:01'),(10,'0.1',1,10,1,'조직도-근태관리','MySQL → MySQL','ted.me',1,1,'ted.me','2021-08-10 17:28:27','ted.me','2021-08-10 17:28:27'),(11,'0.1',1,11,1,'조직도-전자결재','MySQL → MySQL','ted.me',1,1,'ted.me','2021-08-30 16:36:31','ted.me','2021-08-30 16:36:31'),(99999,'0.1',1,99999,1,'Dummy Task','사용금지','ted.me',1,1,'ted.me','2021-01-12 02:41:06','ted.me','2021-01-12 02:41:06'),(100000,'0.1',1,100000,1,'CDC 따라하기 test','따라하기 테스트','ted.me',1,1,'ted.me','2021-06-18 16:37:11','ted.me','2021-06-18 16:37:11');
/*!40000 ALTER TABLE `tb_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task_log`
--

DROP TABLE IF EXISTS `tb_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `priority_cd` tinyint(4) NOT NULL COMMENT '1 : ERROR\n2 : WARN\n3 : INFO\n4 : DEBUG\n5 : TRACE',
  `msg_cd` smallint(6) NOT NULL,
  `object_name` varchar(1000) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `fk_tb_task_log_tb_task` (`task_id`),
  KEY `fk_tb_task_log_tb_msg` (`msg_cd`),
  CONSTRAINT `fk_tb_task_log_tb_msg` FOREIGN KEY (`msg_cd`) REFERENCES `tb_msg` (`msg_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_task_log_tb_task` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task_log`
--

LOCK TABLES `tb_task_log` WRITE;
/*!40000 ALTER TABLE `tb_task_log` DISABLE KEYS */;
INSERT INTO `tb_task_log` VALUES (1,8,3,101,NULL,'ted.me','2021-06-10 23:31:53'),(2,8,3,202,'tb_test2','ted.me','2021-06-10 23:33:06'),(3,8,3,303,'tb_test2','ted.me','2021-06-10 23:33:06'),(4,8,3,306,'tb_test2','ted.me','2021-06-10 23:33:14'),(5,8,3,102,NULL,'ted.me','2021-06-10 23:34:29'),(6,8,3,103,NULL,'ted.me','2021-06-10 23:34:47'),(7,9,3,101,NULL,'ted.me','2021-08-03 22:33:10'),(8,9,3,102,NULL,'ted.me','2021-08-03 22:37:09'),(9,9,3,101,NULL,'ted.me','2021-08-03 22:37:21'),(10,9,3,101,NULL,'ted.me','2021-08-03 23:39:43'),(11,9,3,101,NULL,'ted.me','2021-08-03 23:45:01'),(12,9,3,101,NULL,'ted.me','2021-08-04 00:01:08'),(13,9,3,102,NULL,'ted.me','2021-08-04 00:23:36'),(14,9,3,101,NULL,'ted.me','2021-08-04 00:23:45'),(15,9,3,101,NULL,'ted.me','2021-08-04 00:26:45'),(16,9,3,101,NULL,'ted.me','2021-08-04 00:44:44'),(17,9,3,101,NULL,'ted.me','2021-08-04 00:47:18'),(18,9,3,101,NULL,'ted.me','2021-08-04 00:49:05'),(19,9,3,101,NULL,'ted.me','2021-08-04 00:51:46'),(20,9,3,102,NULL,'ted.me','2021-08-04 00:55:14'),(21,9,3,101,NULL,'ted.me','2021-08-04 00:55:17'),(22,9,3,101,NULL,'ted.me','2021-08-04 01:19:53'),(23,9,3,101,NULL,'ted.me','2021-08-04 14:58:15'),(24,9,3,202,'tb_test','ted.me','2021-08-04 14:58:16'),(25,9,3,102,NULL,'ted.me','2021-08-04 15:03:17'),(26,9,3,101,NULL,'ted.me','2021-08-06 00:21:38'),(27,9,3,101,NULL,'ted.me','2021-08-06 00:23:30'),(28,9,3,101,NULL,'ted.me','2021-08-08 16:48:59'),(29,9,3,102,NULL,'ted.me','2021-08-08 16:53:33'),(30,9,3,103,NULL,'ted.me','2021-08-08 16:54:31'),(31,9,3,102,NULL,'ted.me','2021-08-17 20:55:34'),(32,9,3,101,NULL,'ted.me','2021-08-17 20:55:41'),(33,9,3,101,NULL,'ted.me','2021-08-17 21:48:59'),(34,9,3,102,NULL,'ted.me','2021-08-17 21:56:21'),(35,9,3,101,NULL,'ted.me','2021-08-17 21:56:28'),(36,9,3,101,NULL,'ted.me','2021-08-22 19:28:09'),(37,9,3,101,NULL,'ted.me','2021-08-22 19:35:23'),(38,9,3,101,NULL,'ted.me','2021-08-22 19:37:43'),(39,9,3,101,NULL,'ted.me','2021-08-22 19:50:55'),(40,9,3,101,NULL,'ted.me','2021-08-22 19:56:40'),(41,9,3,102,NULL,'ted.me','2021-08-22 19:58:55'),(42,9,3,101,NULL,'ted.me','2021-08-22 19:59:04'),(43,9,3,101,NULL,'ted.me','2021-08-22 23:35:34'),(44,9,3,101,NULL,'ted.me','2021-08-22 23:41:00'),(45,9,3,101,NULL,'ted.me','2021-08-23 21:43:02'),(46,9,3,101,NULL,'ted.me','2021-08-23 21:46:55'),(47,9,3,101,NULL,'ted.me','2021-08-23 21:51:00'),(48,9,3,101,NULL,'ted.me','2021-08-23 21:55:10'),(49,9,3,101,NULL,'ted.me','2021-08-23 21:58:03'),(50,9,3,101,NULL,'ted.me','2021-08-23 22:08:45'),(51,9,3,101,NULL,'ted.me','2021-08-23 22:12:34'),(52,9,3,102,NULL,'ted.me','2021-08-24 10:55:27'),(53,9,3,101,NULL,'ted.me','2021-08-24 10:56:05'),(54,9,3,102,NULL,'ted.me','2021-08-24 16:09:53'),(55,9,3,101,NULL,'ted.me','2021-08-24 16:10:01'),(56,9,3,102,NULL,'ted.me','2021-08-24 16:11:03'),(57,9,3,101,NULL,'ted.me','2021-08-24 16:11:05'),(58,9,3,102,NULL,'ted.me','2021-08-24 16:51:02'),(59,9,3,101,NULL,'ted.me','2021-08-24 16:51:04'),(60,9,3,102,NULL,'ted.me','2021-08-24 16:54:05'),(61,9,3,101,NULL,'ted.me','2021-08-24 16:54:06'),(62,9,3,102,NULL,'ted.me','2021-08-24 17:19:47'),(63,9,3,101,NULL,'ted.me','2021-08-24 17:19:53'),(64,9,3,101,NULL,'ted.me','2021-08-24 17:33:33'),(65,9,3,101,NULL,'ted.me','2021-08-24 17:35:52'),(66,9,3,102,NULL,'ted.me','2021-08-24 17:46:13'),(67,9,3,101,NULL,'ted.me','2021-08-24 17:46:15'),(68,9,3,101,NULL,'ted.me','2021-09-05 15:28:42'),(69,9,3,101,NULL,'ted.me','2021-09-05 15:32:32'),(70,9,3,101,NULL,'ted.me','2021-09-05 17:16:52'),(71,9,3,101,NULL,'ted.me','2021-09-05 17:21:14'),(72,9,3,101,NULL,'ted.me','2021-09-05 17:23:59'),(73,9,3,101,NULL,'ted.me','2021-09-05 17:27:20'),(74,9,3,101,NULL,'ted.me','2021-09-05 17:28:57'),(75,9,3,101,NULL,'ted.me','2021-09-06 16:45:20'),(76,9,3,101,NULL,'ted.me','2021-09-06 17:14:37'),(77,9,3,101,NULL,'ted.me','2021-09-06 17:22:20'),(78,9,3,101,NULL,'ted.me','2021-09-06 18:44:39'),(79,9,3,101,NULL,'ted.me','2021-09-06 19:03:21'),(80,9,3,101,NULL,'ted.me','2021-09-07 16:12:25'),(81,9,3,101,NULL,'ted.me','2021-09-07 16:34:47'),(82,9,3,102,NULL,'ted.me','2021-09-07 16:38:28'),(83,9,3,101,NULL,'ted.me','2021-09-07 16:38:43'),(84,9,3,101,NULL,'ted.me','2021-09-07 16:57:08'),(85,9,3,101,NULL,'ted.me','2021-09-07 17:09:16'),(86,9,3,101,NULL,'ted.me','2021-09-07 17:28:55'),(87,9,3,101,NULL,'ted.me','2021-09-07 17:33:10'),(88,9,3,101,NULL,'ted.me','2021-09-07 17:41:34'),(89,9,3,102,NULL,'ted.me','2021-09-07 17:45:19'),(90,9,3,101,NULL,'ted.me','2021-09-07 17:45:26'),(91,9,3,101,NULL,'ted.me','2021-09-16 09:50:44'),(92,9,3,101,NULL,'ted.me','2021-09-16 13:42:47'),(93,9,3,101,NULL,'ted.me','2021-09-16 13:52:12'),(94,9,3,101,NULL,'ted.me','2021-09-16 13:57:43'),(95,9,3,101,NULL,'ted.me','2021-09-16 14:44:34'),(96,9,3,101,NULL,'ted.me','2021-09-16 15:01:01'),(97,9,3,102,NULL,'ted.me','2021-09-16 15:29:20'),(98,9,3,101,NULL,'ted.me','2021-09-16 15:29:33'),(99,9,3,101,NULL,'ted.me','2021-09-16 17:19:36'),(100,9,3,101,NULL,'ted.me','2021-09-16 17:24:32'),(101,9,3,101,NULL,'ted.me','2021-09-16 17:28:47'),(102,9,3,101,NULL,'ted.me','2021-09-16 17:31:41'),(103,9,3,101,NULL,'ted.me','2021-09-16 17:33:48'),(104,9,3,101,NULL,'ted.me','2021-09-16 17:45:23'),(105,9,3,101,NULL,'ted.me','2021-09-16 17:47:04'),(106,9,3,101,NULL,'ted.me','2021-09-16 17:53:39'),(107,9,3,101,NULL,'ted.me','2021-09-16 17:55:18'),(108,9,3,101,NULL,'ted.me','2021-09-16 17:58:45'),(109,9,3,102,NULL,'ted.me','2021-09-16 18:01:55'),(110,9,3,101,NULL,'ted.me','2021-09-16 18:02:02'),(111,9,3,101,NULL,'ted.me','2021-09-16 18:08:10'),(112,9,3,101,NULL,'ted.me','2021-09-16 18:11:00'),(113,9,3,101,NULL,'ted.me','2021-09-16 18:28:00'),(114,9,3,101,NULL,'ted.me','2021-09-16 18:30:27'),(115,9,3,101,NULL,'ted.me','2021-09-16 18:34:10'),(116,9,3,101,NULL,'ted.me','2021-09-16 18:56:53'),(117,9,3,101,NULL,'ted.me','2021-09-16 19:00:53'),(118,9,3,101,NULL,'ted.me','2021-09-16 19:03:28'),(119,9,3,101,NULL,'ted.me','2021-09-16 19:11:53'),(120,9,3,101,NULL,'ted.me','2021-09-16 19:14:50'),(121,9,3,101,NULL,'ted.me','2021-09-16 20:11:31'),(122,9,3,101,NULL,'ted.me','2021-09-27 11:37:48'),(123,9,3,102,NULL,'ted.me','2021-09-27 11:51:57'),(124,9,3,101,NULL,'ted.me','2021-09-27 11:52:05'),(125,9,3,102,NULL,'ted.me','2021-09-27 11:58:42'),(126,9,3,101,NULL,'ted.me','2021-09-27 11:58:47'),(127,9,3,102,NULL,'ted.me','2021-09-27 12:03:24'),(128,9,3,101,NULL,'ted.me','2021-09-27 12:03:27'),(129,9,3,101,NULL,'ted.me','2021-10-01 13:31:31'),(130,9,3,102,NULL,'ted.me','2021-10-01 13:33:12'),(131,9,3,101,NULL,'ted.me','2021-10-01 13:33:15'),(132,9,3,102,NULL,'ted.me','2021-10-01 13:36:19'),(133,9,3,101,NULL,'ted.me','2021-10-01 13:36:23'),(134,9,3,101,NULL,'ted.me','2021-10-02 20:39:31'),(135,9,3,101,NULL,'ted.me','2021-10-06 18:14:22');
/*!40000 ALTER TABLE `tb_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task_variable`
--

DROP TABLE IF EXISTS `tb_task_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task_variable` (
  `variable_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `variable_name` varchar(1000) NOT NULL,
  `variable_type_id` int(11) NOT NULL,
  `variable_value` varchar(4000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`variable_id`),
  KEY `fk_tb_task_variable_tb_task` (`task_id`),
  KEY `fk_tb_task_variable_tb_variable_type` (`variable_type_id`),
  CONSTRAINT `fk_tb_task_variable_tb_task` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_task_variable_tb_variable_type` FOREIGN KEY (`variable_type_id`) REFERENCES `tb_variable_type` (`variable_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task_variable`
--

LOCK TABLES `tb_task_variable` WRITE;
/*!40000 ALTER TABLE `tb_task_variable` DISABLE KEYS */;
INSERT INTO `tb_task_variable` VALUES (1,9,'EmpId',1,'99999','ted.me','2021-08-19 21:09:28','ted.me','2021-08-19 21:09:28');
/*!40000 ALTER TABLE `tb_task_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `user_id` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_name` varchar(1000) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_tb_user_tb_company` (`company_id`),
  KEY `fk_tb_user_department` (`department_id`),
  CONSTRAINT `fk_tb_user_department` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_user_tb_company` FOREIGN KEY (`company_id`) REFERENCES `tb_company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES ('ted.me',1,1,'ildo kim','ted.me','2020-10-19 21:56:57','ted.me','2020-10-19 21:56:57');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_variable_type`
--

DROP TABLE IF EXISTS `tb_variable_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_variable_type` (
  `variable_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_type_name` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(100) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`variable_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_variable_type`
--

LOCK TABLES `tb_variable_type` WRITE;
/*!40000 ALTER TABLE `tb_variable_type` DISABLE KEYS */;
INSERT INTO `tb_variable_type` VALUES (1,'string','ted.me','2021-08-19 21:08:25','ted.me','2021-08-19 21:08:25');
/*!40000 ALTER TABLE `tb_variable_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_working`
--

DROP TABLE IF EXISTS `tb_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_working` (
  `rownum` int(11) NOT NULL,
  `abonumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`rownum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_working`
--

LOCK TABLES `tb_working` WRITE;
/*!40000 ALTER TABLE `tb_working` DISABLE KEYS */;
INSERT INTO `tb_working` VALUES (1,1),(2,10),(3,11),(4,19),(5,2),(6,5),(7,13),(8,6),(9,12),(10,7),(11,20),(12,4),(13,8),(14,3),(15,14),(16,9),(17,100),(18,23),(19,28),(20,25),(21,26),(22,24),(23,27),(24,15),(25,18),(26,16),(27,21),(28,22);
/*!40000 ALTER TABLE `tb_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_pylon'
--
/*!50003 DROP FUNCTION IF EXISTS `getpath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`etl_user`@`%` FUNCTION `getpath`(abo_id INT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE res TEXT;
    CALL getpath(abo_id, res);
    RETURN res;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getpath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`etl_user`@`%` PROCEDURE `getpath`(IN abo_id INT, OUT path TEXT)
BEGIN
    DECLARE abo_num VARCHAR(20);
    DECLARE temppath TEXT;
    DECLARE tempparent INT;
    -- SET max_sp_recursion_depth = 255;
    SELECT abonumber, sponsor INTO abo_num, tempparent
    FROM tb_abo 
    WHERE abonumber=abo_id;
   
    IF (tempparent IS NULL or tempparent = 0)
    THEN
        SET path = abo_num;
    ELSE
        CALL getpath(tempparent, temppath);
        SET path = CONCAT(temppath, '/', abo_num);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06 22:11:39
