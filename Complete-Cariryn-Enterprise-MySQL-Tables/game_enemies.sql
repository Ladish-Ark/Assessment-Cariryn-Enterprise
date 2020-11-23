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
-- Table structure for table `enemies`
--

DROP TABLE IF EXISTS `enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemies` (
  `enemiesID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `alignmentID_FK2` int DEFAULT NULL,
  `typeID_FK1` int DEFAULT NULL,
  `Threat` varchar(45) DEFAULT NULL,
  `Strength` varchar(45) DEFAULT NULL,
  `Craft` varchar(45) DEFAULT NULL,
  `Armour` varchar(45) DEFAULT NULL,
  `Life` varchar(45) DEFAULT NULL,
  `Attacks` varchar(45) DEFAULT NULL,
  `Speed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`enemiesID`),
  KEY `alignmentID_idx` (`alignmentID_FK2`),
  KEY `typeID_FK2_idx` (`typeID_FK1`),
  CONSTRAINT `alignmentID_FK2` FOREIGN KEY (`alignmentID_FK2`) REFERENCES `alignment` (`alignmentID`),
  CONSTRAINT `typeID_FK2` FOREIGN KEY (`typeID_FK1`) REFERENCES `type` (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemies`
--

LOCK TABLES `enemies` WRITE;
/*!40000 ALTER TABLE `enemies` DISABLE KEYS */;
INSERT INTO `enemies` VALUES (1,'Ape',2,1,'13','4','2','3','15','1','12'),(2,'Bear',2,1,'13','5','2','3','18','1','10'),(3,'Carrion Crows',2,1,'11','1','1','0','6','1','15'),(4,'Forest Goat',2,1,'12','3','1','3','12','1','12'),(5,'Giant Beetle',2,1,'13','4','1','12','12','1','12'),(6,'Giant Fly',2,1,'12','2','1','0','8','1','16'),(7,'Giant Rat',2,1,'12','2','1','0','8','1','13'),(8,'Giant Spider',2,1,'14','4','2','3','15','1','15'),(9,'Giant Worm',2,1,'15','5','2','6','15','1','10'),(10,'Lion',2,1,'14','4','1','3','13','1','14'),(11,'Mammoth',2,1,'15','8','3','6','15','1','13'),(12,'Mountain Goat',2,1,'13','4','2','3','14','1','13'),(13,'Mountain Lion',2,1,'14','3','1','3','13','1','20'),(14,'Serpent',2,1,'14','2','1','6','14','1','13'),(15,'Vampire Bat',3,1,'11','2','1','0','7','1','13'),(16,'Wild Boar',2,1,'12','5','1','3','14','1','12'),(17,'Wolf',2,1,'13','3','2','3','12','1','13'),(18,'Bandit',2,2,'14','4','2','3','12','1','12'),(19,'Dark Acolyte',3,2,'13','2','4','1','13','1','12'),(20,'Dark Initiates',3,2,'16','2','6','2','14','1','12'),(21,'Vassal of Mab',2,2,'11','2','3','0','12','1','14'),(22,'Dragon',3,3,'20','8','6','21','30','3','18'),(23,'Woodland Drake',3,3,'18','7','6','18','26','3','16'),(24,'Wyrd Dragon',3,3,'18','7','7','15','22','3','18'),(25,'Wyvern',3,3,'15','7','7','12','18','1','16'),(26,'Air Elemental',2,4,'16','4','6','0','12','2','24'),(27,'Crawling Slime',2,4,'15','6','2','0','14','1','6'),(28,'Earth Elemental',2,4,'16','5','5','24','22','1','8'),(29,'Fire Elemental',2,4,'17','5','6','0','18','1','12'),(30,'Water Elemental',3,4,'15','4','6','0','20','1','10'),(31,'Boggart',3,5,'14','2','4','0','10','1','10'),(32,'Breeze Sylph',1,5,'16','2','4','0','3','1','12'),(33,'Brownie',2,5,'14','3','4','3','8','2','8'),(34,'Coblynau',3,5,'14','4','4','6','12','1','12'),(35,'Fae Witch',4,5,'16','3','6','6','15','1','9'),(36,'Fomorian',3,5,'15','6','2','12','24','1','14'),(37,'Knocker',4,5,'13','3','2','3','12','1','8'),(38,'Naiad',3,5,'14','3','4','0','10','1','14'),(39,'Pixies',2,5,'17','2','4','0','8','1','12'),(40,'Red Cap',3,5,'17','6','3','9','15','1','13'),(41,'Sidhe',5,5,'17','6','4','15','20','2','12'),(42,'Sluagh',3,5,'17','3','6','0','18','1','11'),(43,'White Stag',1,5,'18','6','5','6','24','2','16'),(44,'Cave Troll',2,6,'16','8','2','9','25','2','13'),(45,'Gnoll',3,6,'13','4','2','3','12','1','15'),(46,'Goblin',3,6,'12','3','2','3','12','1','12'),(47,'Hobgoblin',3,6,'13','5','1','6','15','1','10'),(48,'Kobold',2,6,'11','2','2','3','7','1','13'),(49,'Ogre',3,6,'15','6','2','6','24','1','10'),(50,'Basilisk',3,7,'14','3','2','3','15','1','13'),(51,'Doppelganger',3,7,'14','*','*','*','*','*','*'),(52,'Gargoyle',2,7,'15','4','2','15','12','2','18'),(53,'Giant',2,7,'18','10','1','6','30','1','15'),(54,'Harpy',3,7,'14','4','3','3','16','2','18'),(55,'Manticore',2,7,'15','6','2','6','16','2','15'),(56,'Apparition',2,8,'11','1','2','0','10','1','10'),(57,'Banshee',3,8,'13','2','4','0','13','1','12'),(58,'Barrow Wight',3,8,'14','2','2','6','12','1','12'),(59,'Ghost',6,8,'14','2','4','0','14','1','10'),(60,'Shadow',3,8,'12','1','2','0','12','1','10'),(61,'Spectre',6,8,'14','1','3','0','15','1','12'),(62,'Will-O-The-Wisps',2,8,'10+*','1','1','0','10+*','1','15'),(63,'Wraith',3,8,'16','2','5','0','25','1','12'),(64,'Death Knight',3,9,'18','6','8','15','22','2','10'),(65,'Lemure',3,9,'11','2','2','0','11','1','10'),(66,'Lich',3,9,'17','3','8','0','18','1','12'),(67,'Mummy',3,9,'14','4','2','3','18','1','8'),(68,'Putrid Zombie',3,9,'13','3','2','0','15','1','4'),(69,'Skeleton',3,9,'13','2','2','5','12','1','10');
/*!40000 ALTER TABLE `enemies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 15:17:52
