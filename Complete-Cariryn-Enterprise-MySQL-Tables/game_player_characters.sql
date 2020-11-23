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
-- Table structure for table `player_characters`
--

DROP TABLE IF EXISTS `player_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_characters` (
  `playerID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `raceID_FK1` int DEFAULT NULL,
  `classID_FK1` int DEFAULT NULL,
  `alignmentID_FK1` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `strength` int DEFAULT NULL,
  `brawn` int DEFAULT NULL,
  `agility` int DEFAULT NULL,
  `mettle` int DEFAULT NULL,
  `craft` int DEFAULT NULL,
  `insight` int DEFAULT NULL,
  `wits` int DEFAULT NULL,
  `resolve` int DEFAULT NULL,
  `life` int DEFAULT NULL,
  `armourID_FK1` int DEFAULT NULL,
  `protectionID_FK1` int DEFAULT NULL,
  PRIMARY KEY (`playerID`),
  KEY `raceID_idx` (`raceID_FK1`),
  KEY `classID_idx` (`classID_FK1`),
  KEY `alignmentID_idx` (`alignmentID_FK1`),
  KEY `armourID_idx` (`armourID_FK1`),
  KEY `protectionID_idx` (`protectionID_FK1`),
  CONSTRAINT `alignmentID_FK1` FOREIGN KEY (`alignmentID_FK1`) REFERENCES `alignment` (`alignmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `armourID_FK1` FOREIGN KEY (`armourID_FK1`) REFERENCES `armour` (`armourID`),
  CONSTRAINT `classID_FK1` FOREIGN KEY (`classID_FK1`) REFERENCES `classes` (`classID`),
  CONSTRAINT `protectionID_FK1` FOREIGN KEY (`protectionID_FK1`) REFERENCES `protection` (`protectionID`),
  CONSTRAINT `raceID_FK1` FOREIGN KEY (`raceID_FK1`) REFERENCES `race` (`raceID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_characters`
--

LOCK TABLES `player_characters` WRITE;
/*!40000 ALTER TABLE `player_characters` DISABLE KEYS */;
INSERT INTO `player_characters` VALUES (1,'Gitog','Strongbeard',1,4,1,1,2,2,1,2,5,5,3,2,11,4,4),(2,'Leena','Iliqen',2,6,1,1,4,2,4,2,3,2,2,3,18,2,3),(3,'Bogyog','Swampreaver',3,1,2,1,4,3,4,2,3,2,2,2,14,3,3),(4,'Zoa','Caim',4,7,3,2,1,2,2,1,5,3,5,3,12,1,1),(5,'Tarragon','Betterglimmer',6,2,2,1,3,1,3,2,4,2,2,5,14,1,1),(6,'Dorkuraz','Skullsplitter',7,9,2,1,5,5,2,4,2,1,1,2,19,5,4);
/*!40000 ALTER TABLE `player_characters` ENABLE KEYS */;
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
