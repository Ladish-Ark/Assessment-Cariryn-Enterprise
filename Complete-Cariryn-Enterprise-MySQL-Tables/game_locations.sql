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
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `locationID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Altar of Desire','An ancient, worn marble altar rests atop a small hill. The altar is engraved with images.'),(2,'Altar of Greed','This altar was exquisitely carved from white marble. It\'s adorned with gold inlay and gemstones. The ground around the altar is soft.'),(3,'Altar of Wrath','This altar is made of polished black basalt. An obsidian dagger rests atop it. Images carved on the altar show a spear or bolt of lightning striking a human figure.'),(4,'Ancient Altar','An ancient and crumbling altar is covered in vines and weeds.'),(5,'Arena','A temporary combat arena.'),(6,'Black Market','A goblin is holding a black market, one where stolen and illegal goods can be bought and sold.'),(7,'Blighted Shrine','A small shrine rests upon a barren hill. Many small dead animals lay around the perimeter of the shrine. The air has a putrid and unwholesome smell.'),(8,'Boneyard','A charnel pit is filled with bones and decaying corpses.'),(9,'Carnival','A small carnival is being held here in a tent.'),(10,'Castle Ruins','The crumbling ruins of an ancient castle rise from the ground. Only a few rising pillars, an archway and the foundations remain.'),(11,'Cave','A deep cave lies beyond. It may be empty or it might hold a random enemy. It may even connect to a dungeon deep below the ground.'),(12,'Cave of Bones','A small cave filled with bones of the long dead.'),(13,'Dungeon','An entrance to an underground dungeon.'),(14,'Faery Gate','This gate can take many forms. It might appear as a waterfall, faery ring, split oak tree or something more exotic hidden in the wilderness.'),(15,'Faery Glade','This pleasant glade is filled with mushroom rings and bright flowers.'),(16,'Faery Mound','An ancient faery mound.'),(17,'Forgotten Pantheon','Runied statues portray a forgotten pantheon of ancient gods.'),(18,'Fountain of Wisdom','Pure water flows from a fountain'),(19,'Idol','This crumbling statue roughly resembles a humanoid with skaly skin and four arms.'),(20,'Magic Stream','Water flows from this locale in a sparkling, crystal clear stream.'),(21,'Mystic Portal','A mystic portal grants instantaneous passage to another place in the realm.'),(22,'Pool of Fortitude','Pure water flows from a fountain'),(23,'Pool of Fortune','This fountain offers pure water.'),(24,'Pool of Life','Thick green moss speckled with white flowers surrounds a small pool of clear water.'),(25,'Pool of Vision','A small pool is set in a basin of brightly coloured stones.'),(26,'Riddle Stone','This rough-hewn stone is inscribed with ancient runes. When the stone is touched, the stone speaks a riddl in a deep and rumbly voice.'),(27,'Sacred Ground','A place sacred to one of the alignments.'),(28,'Sacrificial Altar','A large, round stone altar has an unlit pyre built atop it. A stack of chopped wood is nearby and the bare ground surrounding the altar is covered in soot.'),(29,'Sacrificial Stone','This tall standing stone is fitted with manacles for arms and ankles.'),(30,'Shrine','A small shrine surrounded with thick moss sits in a small clearing in the forest.'),(31,'Shortcut','A supposedly shorter route to where the players need to get to.'),(32,'Standing Stones','Ancient standing stones of great power rest here, enduring the elements.'),(33,'Tomb','An ancient and crumbling tomb. The carved name is so worn it is no longer visible.'),(34,'Tranquil Glade','This peaceful glade is filled with flowers and toadstools.'),(35,'Treasure Trove','A treasure has been buried here under a pile of rocks. It might be guarded.'),(36,'Well of Life','This old ramshackle well has crumbling walls. Lush and verdant plant life covers the ground around it.');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
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
