CREATE DATABASE  IF NOT EXISTS `aqa2426` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aqa2426`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `confirmed_cases`
--

DROP TABLE IF EXISTS `confirmed_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `confirmed_cases` (
  `state` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `TestDate` date NOT NULL,
  `PositiveCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`state`,`county`,`TestDate`),
  CONSTRAINT `confirmed_cases_ibfk_1` FOREIGN KEY (`state`, `county`) REFERENCES `county` (`State`, `county`),
  CONSTRAINT `confirmed_cases_chk_1` CHECK ((`PositiveCount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `county` (
  `State` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `Population` int(11) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  PRIMARY KEY (`State`,`county`),
  CONSTRAINT `county_ibfk_1` FOREIGN KEY (`State`) REFERENCES `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deaths`
--

DROP TABLE IF EXISTS `deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `deaths` (
  `state` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `ReportDate` date NOT NULL,
  `DeathCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`state`,`county`,`ReportDate`),
  CONSTRAINT `deaths_ibfk_1` FOREIGN KEY (`state`, `county`) REFERENCES `county` (`State`, `county`),
  CONSTRAINT `deaths_chk_1` CHECK ((`DeathCount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `abbreviation_char` char(2) DEFAULT NULL,
  `YearOfStatehood` int(11) DEFAULT NULL,
  `Capital` varchar(50) DEFAULT NULL,
  `Capital_Since` int(11) DEFAULT NULL,
  `LandArea` decimal(10,0) DEFAULT NULL,
  `isPopulousCity` tinyint(1) DEFAULT NULL,
  `MunicipalPopulation` int(11) DEFAULT NULL,
  `MetroPopulation` int(11) DEFAULT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaccinations`
--

DROP TABLE IF EXISTS `vaccinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vaccinations` (
  `state` varchar(50) NOT NULL,
  `TotalDistributed` int(11) DEFAULT NULL,
  `TotalAdministered` int(11) DEFAULT NULL,
  `distributed_per_100k` int(11) DEFAULT NULL,
  `administered_per_100k` int(11) DEFAULT NULL,
  `people_with_1_plus_doeses` int(11) DEFAULT NULL,
  `people_with_1_plus_doses_per_100k` int(11) DEFAULT NULL,
  `people_with_2_plus_doses` int(11) DEFAULT NULL,
  `people_with_2_plus_doses_per_100k` int(11) DEFAULT NULL,
  KEY `state` (`state`),
  CONSTRAINT `vaccinations_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

