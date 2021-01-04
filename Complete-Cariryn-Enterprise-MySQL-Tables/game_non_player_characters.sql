-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: game
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `non_player_characters`
--

DROP TABLE IF EXISTS `non_player_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_player_characters` (
  `npcID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Strength` int DEFAULT NULL,
  `Craft` int DEFAULT NULL,
  `Life` int DEFAULT NULL,
  PRIMARY KEY (`npcID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_player_characters`
--

LOCK TABLES `non_player_characters` WRITE;
/*!40000 ALTER TABLE `non_player_characters` DISABLE KEYS */;
INSERT INTO `non_player_characters` VALUES (0,'None',0,0,0),(1,'Apprentice Minstrel',2,3,10),(2,'Apprentice Wizard',1,4,10),(3,'Armoursmith',5,2,15),(4,'Astrologer',2,6,12),(5,'Bartender',3,3,14),(6,'Bear',5,2,18),(7,'Camel',5,1,15),(8,'Cat',1,3,5),(9,'Crow / Raven',1,3,3),(10,'Cutpurse',4,2,12),(11,'Dog',3,2,10),(12,'Dungsweeper',3,3,12),(13,'Earth Elemental',5,2,20),(14,'Enchanter',2,6,13),(15,'Faery',1,5,5),(16,'Falcon / Hawk',2,3,5),(17,'Familiar Spirit',1,4,5),(18,'Good Acolyte',2,4,10),(19,'Healer',2,4,10),(20,'Horse',5,1,15),(21,'Imp',1,5,12),(22,'Junior Assassin',4,2,15),(23,'Junior Thief',3,3,12),(24,'Leper',3,3,10),(25,'Leprechaun',2,7,15),(26,'Mercenary',4,1,15),(27,'Messenger Pigeon',1,1,3),(28,'Mule',6,1,15),(29,'Pedlar',3,3,12),(30,'Pixie',1,5,7),(31,'Prospector',3,3,14),(32,'Sage Owl',2,6,6),(33,'Scout',3,3,10),(34,'Servant',2,3,10),(35,'Shambler',5,1,15),(36,'Shrine Priest',2,6,14),(37,'Spirit',7,1,10),(38,'Stag',4,2,15),(39,'Street Sage',2,6,14),(40,'Talismonger',0,0,0),(41,'Temple Acolyte',3,3,10),(42,'Tracker',3,4,14),(43,'Weaponsmith',5,2,15),(44,'Wild Boar',5,1,15),(45,'Wildcat',3,3,10),(46,'Wolf',3,2,15);
/*!40000 ALTER TABLE `non_player_characters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 15:17:51
