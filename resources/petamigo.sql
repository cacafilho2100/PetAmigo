-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: petamigo
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Animal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idade` int(11) NOT NULL,
  `informacoes` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `pelagem` varchar(255) DEFAULT NULL,
  `porte` varchar(255) DEFAULT NULL,
  `raca` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `id_foto` bigint(20) DEFAULT NULL,
  `statusAnimal_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK75i6mx4lnap2u5n89vrhdipok` (`id_foto`),
  KEY `FKo7us1yo9lbojxvwh0gnwiwski` (`statusAnimal_id`),
  KEY `FKsbj263v9d1cyi1smblxt1y34y` (`usuario_id`),
  CONSTRAINT `FK75i6mx4lnap2u5n89vrhdipok` FOREIGN KEY (`id_foto`) REFERENCES `MyFile` (`id`),
  CONSTRAINT `FKo7us1yo9lbojxvwh0gnwiwski` FOREIGN KEY (`statusAnimal_id`) REFERENCES `StatusAnimal` (`id`),
  CONSTRAINT `FKsbj263v9d1cyi1smblxt1y34y` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (1,1,'','Geraldo','curto','pequeno','Pug','macho','',5,5,1),(2,2,'Muito simpático','Clodoviu','curto','medio','Rottweiler','macho','',6,7,1),(3,3,'','Monique','longo','medio','Cocker Spaniel','femea','',7,6,1),(4,5,'','Maurício Mattar','curto','medio','Aviador','macho','',8,8,1),(5,2,'Sempre feliz','Alegre','longo','medio','Pastor Alemão','macho','',9,5,1);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyFile`
--

DROP TABLE IF EXISTS `MyFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyFile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyFile`
--

LOCK TABLES `MyFile` WRITE;
/*!40000 ALTER TABLE `MyFile` DISABLE KEYS */;
INSERT INTO `MyFile` VALUES (5,'2017-11-11 00:00:00','1510425785576.jpg',''),(6,'2017-11-01 00:00:00','1510426099902.jpg',''),(7,'2017-11-09 00:00:00','1510427646904.jpg',''),(8,'2017-11-08 00:00:00','1510427769286.jpg',''),(9,'0018-07-10 00:00:00','1510514013927.jpg','');
/*!40000 ALTER TABLE `MyFile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatusAnimal`
--

DROP TABLE IF EXISTS `StatusAnimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatusAnimal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` bit(1) NOT NULL,
  `statusAnimal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatusAnimal`
--

LOCK TABLES `StatusAnimal` WRITE;
/*!40000 ALTER TABLE `StatusAnimal` DISABLE KEYS */;
INSERT INTO `StatusAnimal` VALUES (5,'','ADOCAO'),(6,'','DOACAO DE SANGUE'),(7,'','PERDIDO'),(8,'','PARA CRUZAR');
/*!40000 ALTER TABLE `StatusAnimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(255) DEFAULT NULL,
  `confirmeSenha` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4tdehxj7dh8ghfc68kbwbsbll` (`email`),
  UNIQUE KEY `UK_osrxkgs8g8hn8a7885c1b85f8` (`senha`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Caruaru','40bd001563085fc35165329ea1ff5c5ecbdbbeef','arthurflor23@gmail.com','Arthur','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Homem','','123');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'petamigo'
--

--
-- Dumping routines for database 'petamigo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12 20:06:52
