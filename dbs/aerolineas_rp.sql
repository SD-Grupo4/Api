CREATE DATABASE  IF NOT EXISTS `aerolineas_rp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aerolineas_rp`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: aerolineas_rp
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `aviones`
--

DROP TABLE IF EXISTS `aviones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviones` (
  `PlaneID` int NOT NULL,
  `PlaneTypeId` int DEFAULT NULL,
  `Matricula` varchar(20) NOT NULL,
  `LastFlights` text,
  `HorasVuelo` decimal(10,2) DEFAULT NULL,
  `CiclosVuelo` int DEFAULT NULL,
  `DistanciaRecorrida` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PlaneID`),
  UNIQUE KEY `Matricula` (`Matricula`),
  KEY `PlaneTypeId` (`PlaneTypeId`),
  CONSTRAINT `aviones_ibfk_1` FOREIGN KEY (`PlaneTypeId`) REFERENCES `tipos_avion` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviones`
--

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;
INSERT INTO `aviones` VALUES (1,1,'OLWC-854C',NULL,NULL,NULL,NULL),(2,1,'PLMI-489Q',NULL,NULL,NULL,NULL),(3,1,'EDCV-234R',NULL,NULL,NULL,NULL),(4,2,'QQWH-812C',NULL,NULL,NULL,NULL),(5,3,'UUCC-214B',NULL,NULL,NULL,NULL),(6,1,'DXAQ-822C',NULL,NULL,NULL,NULL),(7,1,'JMKJ-282C',NULL,NULL,NULL,NULL),(8,1,'YGBF-339F',NULL,NULL,NULL,NULL),(9,1,'XYZ9-001A',NULL,NULL,NULL,NULL),(10,2,'XYZ10-002B',NULL,NULL,NULL,NULL),(11,3,'XYZ11-003C',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_sincronizacion`
--

DROP TABLE IF EXISTS `bitacora_sincronizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_sincronizacion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Operacion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `TablaAfectada` varchar(50) DEFAULT NULL,
  `IdRegistro` int DEFAULT NULL,
  `RelojVectorial` json DEFAULT NULL,
  `ServidorOrigen` int DEFAULT NULL,
  `EpochEvento` bigint DEFAULT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_sincronizacion`
--

LOCK TABLES `bitacora_sincronizacion` WRITE;
/*!40000 ALTER TABLE `bitacora_sincronizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora_sincronizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `DestinoID` int NOT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Aeropuerto` varchar(150) DEFAULT NULL,
  `ShortDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DestinoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'Estados Unidos','Atlanta','Hartsfield Jackson Atlanta International Airport','ATL (USA)'),(2,'China','Pekín','Beijing Capital International Airport','PEK (CHN)'),(3,'Emiratos Árabes Unidos','Dubái','Dubai International Airport','DXB (ARE)'),(4,'Japón','Tokio','Haneda Airport','TYO (JPN)'),(5,'Reino Unido','Londres','Heathrow Airport','LON (GBR)'),(6,'Estados Unidos','Los Ángeles','Los Angeles International Airport (LAX)','LAX (USA)'),(7,'Francia','París','Charles de Gaulle Airport','PAR (FRA)'),(8,'Alemania','Frankfurt','Frankfurt am Main Airport','FRA (DEU)'),(9,'Turquía','Estambul','Istanbul Airport','IST (TUR)'),(10,'Singapur','Singapur','Changi Airport','SIN (SGP)'),(11,'España','Madrid','Adolfo Suárez Madrid Barajas Airport','MAD (ESP)'),(12,'Países Bajos','Ámsterdam','Schiphol Airport','AMS (NLD)'),(13,'Estados Unidos','Dallas','Dallas/Fort Worth International Airport','DFW (USA)'),(14,'China','Guangzhou','Guangzhou Baiyun International Airport','CAN (CHN)'),(15,'Brasil','São Paulo','São Paulo/Guarulhos International Airport','SAO (BRA)');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeros`
--

DROP TABLE IF EXISTS `pasajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajeros` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Pasaporte` varchar(10) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Pasaporte` (`Pasaporte`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeros`
--

LOCK TABLES `pasajeros` WRITE;
/*!40000 ALTER TABLE `pasajeros` DISABLE KEYS */;
INSERT INTO `pasajeros` VALUES (1,'10999','Peter Parker'),(2,'10100','Tony Stark'),(3,'10101','Steve Rogers'),(4,'10102','Thor Odinson'),(5,'10103','Bruce Banner'),(6,'10104','Natasha Romanoff'),(7,'10105','Stephen Strange'),(8,'10106','T’Challa'),(9,'10107','Wanda Maximoff'),(10,'10108','Scott Lang'),(11,'10109','Hope Van Dyne'),(12,'10110','Clint Barton'),(13,'10111','Carol Danvers'),(14,'10112','Janet Van Dyne'),(15,'10113','Matt Murdock'),(16,'10114','Logan James Howlett'),(17,'10115','Wade Wilson'),(18,'10116','Kate Bishop'),(19,'10117','Charles Xavier'),(20,'10118','Scott Summers'),(21,'10119','Ororo Munroe'),(22,'10120','Anna Marie'),(23,'10121','Remy LeBeau'),(24,'10122','Hank McCoy'),(25,'10123','Kurt Wagner'),(26,'10124','Piotr Rasputin'),(27,'10125','Bobby Drake'),(28,'10126','Elizabeth Braddock'),(29,'10127','Peter Quill'),(30,'10128','Reed Richards'),(31,'10129','Sue Storm'),(32,'10130','Johnny Storm'),(33,'10131','Ben Grimm'),(34,'10132','En Sabah Nur'),(35,'10133','Cain Marko'),(36,'10134','Raven Darkhölme'),(37,'10135','Victor Von Doom'),(38,'10136','Erik Lehnsherr'),(39,'10137','Johann Schmidt'),(40,'10138','Flash Thompson'),(41,'10139','Eddie Brock'),(42,'10140','Norman Osborn'),(43,'10141','Wilson Fisk'),(44,'10142','Anakin Skywalker'),(45,'10143','Anakin Skywalker / Darth Vader'),(46,'10144','Bail Organa'),(47,'10145','Baze Malbus'),(48,'10146','BB-8'),(49,'10147','Biggs Darklighter'),(50,'10148','Boba Fett'),(51,'10149','Boba Fett (niño)'),(52,'10150','Bodhi Rook'),(53,'10151','C-3PO'),(54,'10152','Capitán Panaka'),(55,'10153','Capitán Phasma'),(56,'10154','Cassian Andor'),(57,'10155','Chewbacca'),(58,'10156','Chirrut Îmwe'),(59,'10157','Conde Dooku'),(60,'10158','Conde Dooku / Darth Tyranus'),(61,'10159','Darth Maul'),(62,'10160','Darth Vader'),(63,'10161','Darth Vader / Anakin Skywalker'),(64,'10162','Director Krennic'),(65,'10163','Dryden Vos'),(66,'10164','El Emperador Palpatine'),(67,'10165','Enfys Nest'),(68,'10166','Finn'),(69,'10167','General Grievous'),(70,'10168','General Hux'),(71,'10169','Gran Moff Tarkin'),(72,'10170','Han Solo'),(73,'10171','Jabba el Hutt'),(74,'10172','Jango Fett'),(75,'10173','Jannah'),(76,'10174','Jar Jar Binks'),(77,'10175','Jyn Erso'),(78,'10176','K-2SO'),(79,'10177','Kylo Ren'),(80,'10178','Kylo Ren'),(81,'10179','Lama Su'),(82,'10180','Lando Calrissian'),(83,'10181','Leia Organa'),(84,'10182','Luke Skywalker'),(85,'10183','Mace Windu'),(86,'10184','Maz Kanata'),(87,'10185','Mon Mothma'),(88,'10186','Nute Gunray'),(89,'10187','Obi-Wan Kenobi'),(90,'10188','Padmé Amidala'),(91,'10189','Palpatine'),(92,'10190','Poe Dameron'),(93,'10191','Qi’ra'),(94,'10192','Qui-Gon Jinn'),(95,'10193','R2-D2'),(96,'10194','Rey'),(97,'10195','Rose Tico'),(98,'10196','Saw Gerrera'),(99,'10197','Sheev Palpatine'),(100,'10198','Sheev Palpatine'),(101,'10199','Shmi Skywalker'),(102,'10200','Snoke'),(103,'10201','Tobias Beckett'),(104,'10202','Watto'),(105,'10203','Wicket W. Warrick'),(106,'10204','Yoda'),(107,'10205','Zam Wesell'),(108,'10206','Zorii Bliss'),(109,'10207','Darth Sidious'),(110,'10208','Ben Solo'),(111,'10209','Kakarotto カロット'),(112,'10210','Son Goku 孫悟空'),(113,'10211','Vegetto'),(114,'10212','Gogeta'),(115,'10213','Abraham Jebediah Simpson II'),(116,'10214','Agnes Skinner'),(117,'10215','Apu Nahasapeemapetilon'),(118,'10216','Barney Gumble'),(119,'10217','Bartholomew JoJo \"Bart\" Simpson'),(120,'10218','Cecil Terwilliger'),(121,'10219','Charles  Leonard Carl'),(122,'10220','Charles Montgomery Burns'),(123,'10221','Clancy Bouvier'),(124,'10222','Clancy Wiggum'),(125,'10223','Clarence Wiggum'),(126,'10224','Dewey Largo'),(127,'10225','Edna Krabappel'),(128,'10226','Familia Bouvier'),(129,'10227','Familia Simpson'),(130,'10228','Hans Moleman'),(131,'10229','Herschel Shmoikel Pinchas Yerucham Krustofsky'),(132,'10230','Homer Jay Simpson'),(133,'10231','Jacqueline Ingrid Bouvier'),(134,'10232','Jeffrey Albertson'),(135,'10233','Joseph Quimby'),(136,'10234','Julius Hibbert'),(137,'10235','Kirk Evelyn Van Houten'),(138,'10236','Lenny Leonard'),(139,'10237','Lionel Hutz'),(140,'10238','Lisa Marie Simpson'),(141,'10239','Louie y Tony \"Gordo\" D\'Amico'),(142,'10240','Luann Van Houten'),(143,'10241','Manjula Nahasapeemapetilon'),(144,'10242','Margaret \"Maggie\" Simpson'),(145,'10243','Marjorie Jacqueline \"Marge\" Bouvier Simpson'),(146,'10244','Marvin Monroe'),(147,'10245','Maude Flanders'),(148,'10246','Milhouse Mussolini Van Houten'),(149,'10247','Moe Szyslak'),(150,'10248','Mona Penelope Simpson'),(151,'10249','Nedward \"Ned\" Flanders Jr.'),(152,'10250','Otros personajes recurrentes'),(153,'10251','Otto Mann'),(154,'10252','Patricia \"Patty\" Bouvier'),(155,'10253','Ralph Wiggum'),(156,'10254','Robert Underdunk Terwilliger Jr.'),(157,'10255','Rodrick \"Rod\" Flanders'),(158,'10256','Sarah Wiggum'),(159,'10257','Selma Bouvier Terwilliger Hutz McClure Stu Simpson'),(160,'10258','Seymour Skinner'),(161,'10259','Todd Flanders'),(162,'10260','Troy McClure'),(163,'10261','Waylon J. Smithers Jr.'),(164,'10262','Bellwether'),(165,'10263','Claude Frollo'),(166,'10264','Cruella de Vil'),(167,'10265','Dr Facilier'),(168,'10266','Gaston'),(169,'10267','Gothel'),(170,'10268','Hades'),(171,'10269','Hans Westergaard'),(172,'10270','Jafar'),(173,'10271','La Reina Grimhilde'),(174,'10272','Lady Tremaine'),(175,'10273','Madame Medusa'),(176,'10274','Maléfica'),(177,'10275','Profesor Ratigan'),(178,'10276','Scar Taka'),(179,'10277','Shan Yu'),(180,'10278','Ursula'),(181,'10279','Armando Nogales'),(182,'10280','German Rico'),(183,'10281','Mia Khalifa'),(184,'10282','Augusto Alborta'),(185,'10283','Lana Rhoades'),(186,'10284','Jhonny Sins'),(187,'10285','Dilion Harper'),(188,'10286','Jordi ENP'),(189,'10287','Riley Reid'),(190,'9340132','Juan Abiel Iriarte'),(191,'7894566','Edelfrida Lima'),(192,'93315545','Pasajero desconocido');
/*!40000 ALTER TABLE `pasajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajes`
--

DROP TABLE IF EXISTS `pasajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FlightID` int DEFAULT NULL,
  `PasajeroID` int DEFAULT NULL,
  `Asiento` varchar(10) DEFAULT NULL,
  `Clase` enum('Economica','Ejecutiva') DEFAULT NULL,
  `Estado` enum('Libre','Reservado','Vendido','Devolucion') DEFAULT NULL,
  `EpochCompra` bigint DEFAULT NULL,
  `ServerConected` int DEFAULT NULL,
  `RelojVectorial` json DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `FlightID` (`FlightID`,`Asiento`),
  KEY `PasajeroID` (`PasajeroID`),
  CONSTRAINT `pasajes_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `vuelos` (`Id`),
  CONSTRAINT `pasajes_ibfk_2` FOREIGN KEY (`PasajeroID`) REFERENCES `pasajeros` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajes`
--

LOCK TABLES `pasajes` WRITE;
/*!40000 ALTER TABLE `pasajes` DISABLE KEYS */;
INSERT INTO `pasajes` VALUES (31,2,11,'A4','Economica','Vendido',1746721800,1,'{\"japon\": 0, \"bolivia\": 1, \"alemania\": 0}','2025-04-07 00:26:01'),(32,2,78,'A5','Economica','Reservado',1746721860,1,'{\"japon\": 0, \"bolivia\": 2, \"alemania\": 0}','2025-04-07 00:26:01'),(33,2,11,'A6','Economica','Vendido',1746721920,1,'{\"japon\": 0, \"bolivia\": 3, \"alemania\": 0}','2025-04-07 00:26:01'),(34,2,89,'A7','Economica','Vendido',1746721980,2,'{\"japon\": 0, \"bolivia\": 3, \"alemania\": 1}','2025-04-07 00:26:01'),(35,2,10,'A8','Economica','Vendido',1746722040,1,'{\"japon\": 0, \"bolivia\": 4, \"alemania\": 1}','2025-04-07 00:26:01'),(36,2,28,'A9','Economica','Vendido',1746722100,2,'{\"japon\": 0, \"bolivia\": 4, \"alemania\": 2}','2025-04-07 00:26:01'),(37,2,8,'A10','Economica','Vendido',1746722160,1,'{\"japon\": 0, \"bolivia\": 5, \"alemania\": 2}','2025-04-07 00:26:01'),(38,2,5,'A11','Economica','Vendido',1746722220,3,'{\"japon\": 1, \"bolivia\": 5, \"alemania\": 2}','2025-04-07 00:26:01'),(39,2,5,'A12','Economica','Vendido',1746722280,1,'{\"japon\": 1, \"bolivia\": 6, \"alemania\": 2}','2025-04-07 00:26:01'),(40,2,5,'A13','Economica','Vendido',1746722340,3,'{\"japon\": 2, \"bolivia\": 6, \"alemania\": 2}','2025-04-07 00:26:01'),(42,2,190,'A1','Economica','Reservado',1744007920,1,'{\"japon\": 0, \"bolivia\": 1, \"alemania\": 0}','2025-04-07 02:38:40'),(43,2,191,'C2','Economica','Vendido',1744008126,1,'{\"japon\": 0, \"bolivia\": 1, \"alemania\": 0}','2025-04-07 02:42:07'),(44,24,192,'A1','Economica','Vendido',1744009608,1,'{\"japon\": 0, \"bolivia\": 1, \"alemania\": 0}','2025-04-07 03:06:48');
/*!40000 ALTER TABLE `pasajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_avion`
--

DROP TABLE IF EXISTS `tipos_avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_avion` (
  `Id` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Clase` varchar(50) DEFAULT NULL,
  `Ejecutiva` int DEFAULT NULL,
  `Turistica` int DEFAULT NULL,
  `PrecioEjecutivo` decimal(10,2) DEFAULT NULL,
  `PrecioTuristica` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_avion`
--

LOCK TABLES `tipos_avion` WRITE;
/*!40000 ALTER TABLE `tipos_avion` DISABLE KEYS */;
INSERT INTO `tipos_avion` VALUES (1,'Boeing 747-8','Boeing',36,386,160.00,100.00),(2,'Airbus A380-800','Airbus',14,407,160.00,100.00),(3,'Boeing 777-300ER','Boeing',8,338,160.00,100.00),(4,'Airbus A350-900','Airbus',12,253,160.00,100.00),(5,'Boeing 787-9 Dreamliner','Boeing',8,247,160.00,100.00),(6,'Airbus A330-300','Airbus',6,277,160.00,100.00);
/*!40000 ALTER TABLE `tipos_avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelos` (
  `Id` int NOT NULL,
  `PlaneID` int DEFAULT NULL,
  `OutDepartureTime` datetime DEFAULT NULL,
  `InDepartureTime` datetime DEFAULT NULL,
  `RutaIDOrigin` int DEFAULT NULL,
  `RutaIDDestination` int DEFAULT NULL,
  `Gate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PlaneID` (`PlaneID`),
  KEY `RutaIDOrigin` (`RutaIDOrigin`),
  KEY `RutaIDDestination` (`RutaIDDestination`),
  CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`PlaneID`) REFERENCES `aviones` (`PlaneID`),
  CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`RutaIDOrigin`) REFERENCES `destinos` (`DestinoID`),
  CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`RutaIDDestination`) REFERENCES `destinos` (`DestinoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelos`
--

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
INSERT INTO `vuelos` VALUES (1,1,'2024-03-30 01:10:00','2024-04-02 01:10:00',1,2,'2'),(2,1,'2024-03-30 02:22:00','2024-04-02 02:22:00',1,3,'2'),(3,2,'2024-03-30 03:34:00','2024-04-02 03:34:00',1,4,'3'),(4,3,'2024-03-30 04:46:00','2024-04-02 04:46:00',1,5,'5'),(5,9,'2024-03-30 05:58:00','2024-04-02 05:58:00',2,1,'4'),(6,1,'2024-03-30 07:10:00','2024-04-02 07:10:00',2,3,'110'),(7,1,'2024-03-30 08:22:00','2024-04-02 08:22:00',2,4,'4'),(8,2,'2024-03-30 09:34:00','2024-04-02 09:34:00',2,5,'5'),(9,2,'2024-03-30 10:46:00','2024-04-02 10:46:00',3,1,'1'),(10,2,'2024-03-30 11:58:00','2024-04-02 11:58:00',3,2,'2'),(11,3,'2024-03-30 13:10:00','2024-04-02 13:10:00',3,4,'4'),(12,4,'2024-03-30 14:22:00','2024-04-02 14:22:00',3,5,'5'),(13,10,'2024-03-30 15:34:00','2024-04-02 15:34:00',4,1,'1'),(14,2,'2024-03-30 16:46:00','2024-04-02 16:46:00',4,2,'2'),(15,2,'2024-03-30 17:58:00','2024-04-02 17:58:00',4,3,'3'),(16,3,'2024-03-30 19:10:00','2024-04-02 19:10:00',4,5,'5'),(17,3,'2024-03-30 20:22:00','2024-04-02 20:22:00',5,1,'1'),(18,3,'2024-03-30 21:34:00','2024-04-02 21:34:00',5,2,'2'),(19,4,'2024-03-30 22:46:00','2024-04-02 22:46:00',5,3,'3'),(20,5,'2024-03-30 23:58:00','2024-04-02 23:58:00',5,4,'4'),(21,11,'2024-03-31 01:10:00','2024-04-03 01:10:00',5,4,'4'),(22,3,'2024-03-31 02:22:00','2024-04-03 02:22:00',5,4,'4'),(23,3,'2024-03-31 03:34:00','2024-04-03 03:34:00',5,4,'4'),(24,4,'2024-03-31 04:46:00','2024-04-03 04:46:00',5,4,'4');
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07  4:27:23
