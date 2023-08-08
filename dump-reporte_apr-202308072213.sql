-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: reporte_apr
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `apr`
--

DROP TABLE IF EXISTS `apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apr` (
  `id` decimal(10,0) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apr`
--

LOCK TABLES `apr` WRITE;
/*!40000 ALTER TABLE `apr` DISABLE KEYS */;
/*!40000 ALTER TABLE `apr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo`
--

DROP TABLE IF EXISTS `costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo` (
  `id_apr` decimal(10,0) NOT NULL,
  `anno` smallint(6) NOT NULL,
  PRIMARY KEY (`id_apr`,`anno`),
  CONSTRAINT `fk_apr1` FOREIGN KEY (`id_apr`) REFERENCES `apr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo_mes`
--

DROP TABLE IF EXISTS `costo_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo_mes` (
  `id_apr` decimal(10,0) NOT NULL,
  `anno` smallint(6) NOT NULL,
  `mes` int(11) NOT NULL,
  `prodm3` int(11) DEFAULT NULL,
  `e_lectric_kwh` float DEFAULT NULL,
  `bombeo_hrs` smallint(6) DEFAULT NULL,
  `valor_energia` float DEFAULT NULL,
  `valor_hora` smallint(6) DEFAULT NULL,
  `cloro_kg` float DEFAULT NULL,
  `valor_cloro` smallint(6) DEFAULT NULL,
  `total_gasto` int(11) DEFAULT NULL,
  `resultado_energia` int(11) DEFAULT NULL,
  `resultado_cloro` int(11) DEFAULT NULL,
  `valor_mensual` int(11) DEFAULT NULL,
  `valor_m3` float DEFAULT NULL,
  PRIMARY KEY (`id_apr`,`anno`,`mes`),
  CONSTRAINT `fk_costo` FOREIGN KEY (`id_apr`, `anno`) REFERENCES `costo` (`id_apr`, `anno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_mes`
--

LOCK TABLES `costo_mes` WRITE;
/*!40000 ALTER TABLE `costo_mes` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `id_apr` decimal(10,0) NOT NULL,
  `anno` smallint(6) NOT NULL,
  PRIMARY KEY (`id_apr`,`anno`),
  CONSTRAINT `fk_apr` FOREIGN KEY (`id_apr`) REFERENCES `apr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_mes`
--

DROP TABLE IF EXISTS `ingreso_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso_mes` (
  `id_apr` decimal(10,0) NOT NULL,
  `anno` smallint(6) NOT NULL,
  `mes` int(11) NOT NULL,
  `prodm3` float DEFAULT NULL,
  `facturam3` float DEFAULT NULL,
  `arranque` smallint(6) DEFAULT NULL,
  `e_lectric_kwh` float DEFAULT NULL,
  `bombeo_hrs` smallint(6) DEFAULT NULL,
  `cloro_kg` float DEFAULT NULL,
  `dotacion_prod` smallint(6) DEFAULT NULL,
  `dotacion_fact` smallint(6) DEFAULT NULL,
  `productiv_kmw_m3` float DEFAULT NULL,
  `perdidas` float DEFAULT NULL,
  `bombeo_hrs_dia` float DEFAULT NULL,
  `qb_ls` float DEFAULT NULL,
  PRIMARY KEY (`id_apr`,`anno`,`mes`),
  CONSTRAINT `fk_ingreso` FOREIGN KEY (`id_apr`, `anno`) REFERENCES `ingreso` (`id_apr`, `anno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_mes`
--

LOCK TABLES `ingreso_mes` WRITE;
/*!40000 ALTER TABLE `ingreso_mes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'reporte_apr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-07 22:13:23
