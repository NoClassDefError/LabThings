-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: labThings
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES gbk ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鐗╁搧绫诲埆id',
  `name` varchar(50) NOT NULL,
  `parentCategory` bigint(20) DEFAULT NULL COMMENT '蹇呴』涓烘湰琛╥d鎴栫┖',
  `description` varchar(300) DEFAULT NULL COMMENT '鎻忚堪',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='绫诲埆琛紝鍒嗕负澶氫釜绾у埆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'实验仪器',NULL,NULL,'2019-08-19 11:45:05'),(2,'电子仪器',1,NULL,'2019-08-19 11:46:21'),(3,'元器件',2,NULL,'2019-08-19 11:46:48'),(4,'晶体管',3,NULL,'2019-08-19 11:47:08'),(5,'三极管',4,NULL,'2019-08-19 11:47:38'),(6,'NPN型三极管',5,NULL,'2019-08-19 11:48:31'),(7,'PNP型三极管',5,NULL,'2019-08-19 11:50:30'),(8,'办公用品',NULL,NULL,'2019-08-19 11:52:42'),(9,'家具',8,NULL,'2019-08-19 11:53:11'),(10,'试验台',9,NULL,'2019-08-19 11:53:29'),(11,'计算机及其组件',8,NULL,'2019-08-19 11:53:53'),(12,'服务器',11,NULL,'2019-08-19 11:54:19'),(13,'台式主机',11,NULL,'2019-08-19 11:54:42'),(14,'显示器',11,NULL,'2019-08-19 11:55:55'),(15,'键盘',11,NULL,'2019-08-19 11:56:20'),(16,'测量仪器',2,NULL,'2019-08-19 11:56:57'),(17,'示波器',16,NULL,'2019-08-19 11:57:17'),(18,'生产工具',NULL,NULL,'2019-08-19 11:59:08'),(19,'小型工具',18,NULL,'2019-08-19 11:59:33'),(20,'大型工具',18,NULL,'2019-08-19 11:59:47'),(21,'电焊枪',19,NULL,'2019-08-25 08:46:15'),(24,'12341',20,'333333',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `imageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `thingId` bigint(20) DEFAULT NULL,
  `logId` bigint(20) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `fk_thing2Id` (`thingId`),
  KEY `fk_logId` (`logId`),
  KEY `fk_categoryId` (`categoryId`),
  KEY `FK5FAA95B556C9F86` (`imageId`),
  CONSTRAINT `FK5FAA95B556C9F86` FOREIGN KEY (`imageId`) REFERENCES `log` (`id`),
  CONSTRAINT `fk_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_logId` FOREIGN KEY (`logId`) REFERENCES `log` (`id`),
  CONSTRAINT `fk_thing2Id` FOREIGN KEY (`thingId`) REFERENCES `things` (`thingId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鍥剧墖琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2,NULL,NULL,21,'/img/img2'),(3,NULL,NULL,21,'/img/img3');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `thingId` bigint(20) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_thingId` (`thingId`),
  CONSTRAINT `fk_thingId` FOREIGN KEY (`thingId`) REFERENCES `things` (`thingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鐗╁搧浜嬩欢璁板綍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'dd',NULL,'2019-08-06 08:00:00'),(2,'123',NULL,'2019-08-18 08:00:00'),(3,'1234',NULL,'2019-08-10 08:00:00'),(4,'',NULL,'2019-08-17 08:00:00'),(5,'12345',NULL,'2019-08-25 08:00:00'),(6,'1234',2,'2019-08-10 08:00:00');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `things`
--

DROP TABLE IF EXISTS `things`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `things` (
  `thingId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鐗╁搧id 鑷闀?,
  `category` bigint(20) DEFAULT NULL COMMENT '绉嶇被',
  `description` varchar(300) DEFAULT NULL COMMENT '鎻忚堪',
  `imageUrl` varchar(100) DEFAULT NULL COMMENT '灏侀潰鍥剧墖鍦板潃',
  `name` varchar(100) NOT NULL COMMENT '鍚嶅瓧',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '璐拱鏃堕棿',
  PRIMARY KEY (`thingId`),
  KEY `fk_category` (`category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鐗╁搧琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `things`
--

LOCK TABLES `things` WRITE;
/*!40000 ALTER TABLE `things` DISABLE KEYS */;
INSERT INTO `things` VALUES (1,20,NULL,NULL,'电焊枪1','2019-08-22 13:33:21'),(2,21,NULL,NULL,'电焊枪2','2019-08-22 13:33:36'),(3,21,NULL,NULL,'电焊枪3','2019-08-22 13:33:48'),(4,12,'winwin',NULL,'windows server',NULL);
/*!40000 ALTER TABLE `things` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
