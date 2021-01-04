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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  `item_load` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (0,'None',0,0),(1,'Aegis','500','2'),(2,'Amulet of Abjuration','100','0'),(3,'Amulet of the Magician\'s Escape','250','0'),(4,'Ancient Elven Bow','200','1'),(5,'Armour Repair Kit','1','1'),(6,'Astrolabe','5','2'),(7,'Bane Sword','400','2'),(8,'Bedroll & blanket','1','1'),(9,'Bottomless Haversack','100','1'),(10,'Candles (5)','1','1'),(11,'Censer with 20cones of incense','1','1'),(12,'Climbing Harness','2','2'),(13,'Concealed Pouch','3','1'),(14,'Crowbar','1','1'),(15,'Crown of Judgement','600','1'),(16,'Crystal Sceptre','300','1'),(17,'Crystal Shard','100','0'),(18,'Cure Disease Elixir','10','0'),(19,'Cure Poison Elixir','10','0'),(20,'Disguise Kit','2','1'),(21,'Doomsword','600','1'),(22,'Downing Rod','3','1'),(23,'Dragon Helm','300','2'),(24,'Dragon\'s Blood','25','0'),(25,'Dragonscale Shirt','700','3'),(26,'Eagle Talon','50','0'),(27,'Elixir of Destiny','50','0'),(28,'Elixir of Vitality','50','0'),(29,'Entertaining Costume','1-5',''),(30,'Everfull Purse','100','1'),(31,'Finger Bone of Blessed Samuel','10','0'),(32,'Fishing Tackle','1','1'),(33,'Flask of Oil','1','<1'),(34,'Flight Potion','15','0'),(35,'Guilded Compass','5','1'),(36,'Hammer','1','1'),(37,'Haversack','1','1'),(38,'Healer\'s Kit','3','1'),(39,'Helm of Warding','300','2'),(40,'Holy Lance','800','3'),(41,'Holy Water','10','1'),(42,'Ice Sceptre','500','1'),(43,'Inferno Spear','800','2'),(44,'Invisibility Potion','15','0'),(45,'Journal, Personal','2+','1'),(46,'Lantern','1','2'),(47,'Lorebook','10','1'),(48,'Luckstone','200','1'),(49,'Lucky Coin','100','0'),(50,'Magnifying Glass','1','<1'),(51,'Manacles','2','1'),(52,'Map','1+','1'),(53,'Mess Kit','1','1'),(54,'Musical Instrument','1-100','1-2'),(55,'Myrmidon Helmet','100','2'),(56,'Paper (5 sheets)','1','<1'),(57,'Pen & Ink','1','1'),(58,'Pharoah\'s Crown','400','1'),(59,'Phoenix Potion','100','0'),(60,'Pitons (10)','1','1'),(61,'Potion of Psychic Power','15','0'),(62,'Potion, Healing','5','<1'),(63,'Prayer Book','3','1'),(64,'Prayer Candles (5)','2','1'),(65,'Raft Kit','1','2'),(66,'Rations (1 week)','1','1'),(67,'Renewal Potion','20','0'),(68,'Ring of Misdirection','150','0'),(69,'Ring of Protection','250','0'),(70,'Rope (50ft)','1','2'),(71,'Rope Ladder','1','3'),(72,'Runestones','3','1'),(73,'Saddlebags','1','1'),(74,'Sealing Wax','1','<1'),(75,'Shield of Defiance','300','1'),(76,'Shovel','1','2'),(77,'Signet Ring','1','<1'),(78,'Snare (5)','1','1'),(79,'Songbook','3','1'),(80,'Spellbook','3','1'),(81,'Strength Potion','15','0'),(82,'Suleiman\'s Seal','1000','1'),(83,'Sun Shield','400','2'),(84,'Tent','1','3'),(85,'Thieves\' Tools','1','1'),(86,'Tinderbox','1','<1'),(87,'Tinkers\' Tooklit','1','1'),(88,'Torches (10)','1','2'),(89,'Walking Stick','1','2'),(90,'Water Bottle','1','1'),(91,'Winter Oil','5','1');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 15:17:50
