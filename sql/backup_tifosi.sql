-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: tifosi
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `tifosi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tifosi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tifosi`;

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achete` (
  `id_client` int NOT NULL,
  `id_focaccia` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_client`,`id_focaccia`,`jour`),
  KEY `fk_achete_focaccia` (`id_focaccia`),
  CONSTRAINT `fk_achete_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_achete_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
INSERT INTO `achete` VALUES (1,1,'2026-09-01'),(2,2,'2026-09-03'),(3,3,'2026-09-05'),(4,4,'2026-09-10'),(1,5,'2026-09-15'),(5,6,'2026-09-12'),(2,7,'2026-09-20'),(3,8,'2026-09-22');
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_marque` int NOT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `fk_boisson_marque` (`id_marque`),
  CONSTRAINT `fk_boisson_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boisson`
--

LOCK TABLES `boisson` WRITE;
/*!40000 ALTER TABLE `boisson` DISABLE KEYS */;
INSERT INTO `boisson` VALUES (1,'Coca-cola zéro',1),(2,'Coca-cola original',1),(3,'Fanta citron',1),(4,'Fanta orange',1),(5,'Capri-sun',1),(6,'Pepsi',4),(7,'Pepsi Max Zéro',4),(8,'Lipton zéro citron',4),(9,'Lipton Peach',4),(10,'Monster energy ultra gold',3),(11,'Monster energy ultra blue',3),(12,'Eau de source',2);
/*!40000 ALTER TABLE `boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `cp_client` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Dupont',28,'75001'),(2,'Martin',35,'69002'),(3,'Bernard',42,'13001'),(4,'Petit',23,'31000'),(5,'Robert',31,'06000');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprend` (
  `id_focaccia` int NOT NULL,
  `id_ingredient` int NOT NULL,
  PRIMARY KEY (`id_focaccia`,`id_ingredient`),
  KEY `fk_comprend_ingredient` (`id_ingredient`),
  CONSTRAINT `fk_comprend_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  CONSTRAINT `fk_comprend_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprend`
--

LOCK TABLES `comprend` WRITE;
/*!40000 ALTER TABLE `comprend` DISABLE KEYS */;
INSERT INTO `comprend` VALUES (1,1),(2,1),(3,1),(8,1),(6,2),(1,3),(8,3),(6,4),(7,4),(1,5),(2,5),(3,5),(5,5),(6,5),(7,5),(4,6),(8,6),(1,7),(2,7),(3,7),(4,7),(5,7),(8,7),(8,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(4,10),(2,11),(5,12),(1,13),(8,13),(8,14),(4,15),(1,16),(2,16),(5,16),(6,16),(7,16),(8,16),(5,17),(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(8,18),(6,19),(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20),(8,20),(7,21),(8,21),(3,22),(1,25),(5,25),(6,25),(7,25);
/*!40000 ALTER TABLE `comprend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contient`
--

DROP TABLE IF EXISTS `contient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contient` (
  `id_menu` int NOT NULL,
  `id_boisson` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_boisson`),
  KEY `fk_contient_boisson` (`id_boisson`),
  CONSTRAINT `fk_contient_boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  CONSTRAINT `fk_contient_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contient`
--

LOCK TABLES `contient` WRITE;
/*!40000 ALTER TABLE `contient` DISABLE KEYS */;
INSERT INTO `contient` VALUES (1,1),(2,2),(4,4),(3,6),(5,7),(4,9),(2,10),(5,11),(1,12),(3,12);
/*!40000 ALTER TABLE `contient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_focaccia` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia`
--

LOCK TABLES `focaccia` WRITE;
/*!40000 ALTER TABLE `focaccia` DISABLE KEYS */;
INSERT INTO `focaccia` VALUES (1,'Mozaccia',9.80),(2,'Gorgonzollaccia',10.80),(3,'Raclaccia',8.90),(4,'Emmentalaccia',9.80),(5,'Tradizione',8.90),(6,'Hawaienne',11.20),(7,'Américaine',10.80),(8,'Paysanne',12.80);
/*!40000 ALTER TABLE `focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Ail'),(2,'Ananas'),(3,'Artichaut'),(4,'Bacon'),(5,'Base Tomate'),(6,'Base crème'),(7,'Champignon'),(8,'Chevre'),(9,'Cresson'),(10,'Emmental'),(11,'Gorgonzola'),(12,'Jambon cuit'),(13,'Jambon fumé'),(14,'Oeuf'),(15,'Oignon'),(16,'Olive noire'),(17,'Olive verte'),(18,'Parmesan'),(19,'Piment'),(20,'Poivre'),(21,'Pomme de terre'),(22,'Raclette'),(23,'Salami'),(24,'Tomate cerise'),(25,'Mozarella');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Coca-cola'),(2,'Cristalline'),(3,'Monster'),(4,'Pepsico');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_menu` decimal(6,2) NOT NULL,
  `id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_menu_focaccia` (`id_focaccia`),
  CONSTRAINT `fk_menu_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Menu Mozaccia',13.90,1),(2,'Menu Gorgonzollaccia',14.90,2),(3,'Menu Raclaccia',12.90,3),(4,'Menu Tradizione',12.90,5),(5,'Menu Paysanne',16.90,8);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paye`
--

DROP TABLE IF EXISTS `paye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paye` (
  `id_client` int NOT NULL,
  `id_menu` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_client`,`id_menu`,`jour`),
  KEY `fk_paye_menu` (`id_menu`),
  CONSTRAINT `fk_paye_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_paye_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paye`
--

LOCK TABLES `paye` WRITE;
/*!40000 ALTER TABLE `paye` DISABLE KEYS */;
INSERT INTO `paye` VALUES (1,1,'2026-09-02'),(5,1,'2026-09-25'),(2,2,'2026-09-06'),(4,3,'2026-09-16'),(1,4,'2026-09-18'),(3,5,'2026-09-11');
/*!40000 ALTER TABLE `paye` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-07 20:32:10
