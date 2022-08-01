-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: transportdb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Dumping data for table `isporuka`
--

LOCK TABLES `isporuka` WRITE;
/*!40000 ALTER TABLE `isporuka` DISABLE KEYS */;
INSERT INTO `isporuka` VALUES (1,'završena','plaćeno','važna',3000,'2020-01-10 08:00:00','2020-01-10 17:00:00','Subotica','Kraljevo',500,500,1,3),(2,'završena','neplaćeno','hitna',5000,'2020-04-15 11:30:00','2020-04-15 16:00:00','Novi Sad','Niš',700,700,2,1),(3,'u toku','neplaćeno','obična',2500,'2020-04-20 11:30:00','2020-04-23 12:30:00','Loznica','Paraćin',300,100,2,7),(4,'otkazana','neplaćeno','obična',4200,'2020-04-30 12:30:00','2020-05-03 13:30:00','Valjevo','Kruševac',180,0,1,6),(5,'u toku','plaćeno','važna',3800,'2020-05-05 13:30:00','2020-05-06 14:30:00','Pirot','Jagodina',250,145,1,8),(6,'zakasnela','neplaćeno','hitna',2600,'2020-05-10 14:30:00','2020-05-10 21:30:00','Ruma','Sombor',200,200,2,2);
/*!40000 ALTER TABLE `isporuka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kamion`
--

LOCK TABLES `kamion` WRITE;
/*!40000 ALTER TABLE `kamion` DISABLE KEYS */;
INSERT INTO `kamion` VALUES (1,'MAN TX-100','Hladnjaca',2016,13,24500,NULL,1),(2,'MERCEDES RS200','Tanker',2014,23,65700,NULL,1),(3,'IVECO KGH','Mesalica',2016,27,45370,NULL,2),(4,'SCANIA GA','Kiper',2012,30,75400,NULL,2),(5,'VOLVO DRS','Tegljac',2017,32,35600,NULL,1),(6,'VONN JAX11','Sanduk',2019,24,3345,NULL,2),(7,'CROSS 22A','Utovarna Ruka',2018,18,23400,NULL,1),(8,'ADLER 345','Standardni',2020,12,2446,NULL,2),(9,'VOLVO DRS','Tegljac',2017,32,27000,NULL,2),(16,'HAM DX-100','Tegljac',2018,30,15346,NULL,1),(17,'HAM DX-200','Tegljac',2018,30,16547,NULL,2),(24,'dfsdf','Tanker',2017,12,346,NULL,1);
/*!40000 ALTER TABLE `kamion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES ('aa','aa',1),('bb','bb',2),('hjk','hjk',3);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `korisnik_uloga`
--

LOCK TABLES `korisnik_uloga` WRITE;
/*!40000 ALTER TABLE `korisnik_uloga` DISABLE KEYS */;
INSERT INTO `korisnik_uloga` VALUES ('aa',1),('bb',2),('hjk',2);
/*!40000 ALTER TABLE `korisnik_uloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prevoznik`
--

LOCK TABLES `prevoznik` WRITE;
/*!40000 ALTER TABLE `prevoznik` DISABLE KEYS */;
INSERT INTO `prevoznik` VALUES (1,'AutoTrans','Beograd','2003-10-20',350000,14,2,NULL,'aa@aa.com','021/1234-5678'),(2,'Transped','Nis','2004-05-08',678000,54,3,NULL,'bb@bb.com','021/1234-5678');
/*!40000 ALTER TABLE `prevoznik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prikolica`
--

LOCK TABLES `prikolica` WRITE;
/*!40000 ALTER TABLE `prikolica` DISABLE KEYS */;
INSERT INTO `prikolica` VALUES (1,'MERCEDES DX100','Zatvorena Suva',2017,10,34567,NULL,2),(2,'IVECO AA','Hladnjaca',2020,18,3245,NULL,2),(3,'VOLVO TROSS','Cisterna',2015,23,54360,NULL,2),(4,'BOTUM VONN','Kiper',2015,10,54600,NULL,1),(5,'FROSS DX80','Automobili',2013,24,62700,NULL,2),(6,'HANS BOLX','Masine',2019,24,8765,NULL,1),(7,'JOKERS POLLY','Drva',2011,20,76543,NULL,1),(8,'ANDOR BR2OM','Otvorena Ravna',2020,15,4567,NULL,1);
/*!40000 ALTER TABLE `prikolica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proizvodjac`
--

LOCK TABLES `proizvodjac` WRITE;
/*!40000 ALTER TABLE `proizvodjac` DISABLE KEYS */;
INSERT INTO `proizvodjac` VALUES (1,'AutoSport','Subotica','2002-10-24',500000,NULL,'cc@cc.com','021/1234-5678'),(2,'Invest','Novi Sad','2005-02-07',279000,NULL,'dd@dd.com','021/1234-5678');
/*!40000 ALTER TABLE `proizvodjac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teret`
--

LOCK TABLES `teret` WRITE;
/*!40000 ALTER TABLE `teret` DISABLE KEYS */;
INSERT INTO `teret` VALUES (1,12,'težak','Bager masina',2),(2,5,'lomljiv','Staklo paneli 10x10',2),(3,15,'opasan','Gume zapaljiva materija 500kom',1),(4,23,'vredan','Motori automobila 20kom',1),(5,10,'težak','Viljuskar',2),(6,1,'običan','Sasija automobila',1),(7,25,'težak','Kolektori',2),(8,5,'vredan','Farovi 1000kom',1);
/*!40000 ALTER TABLE `teret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ugovor`
--

LOCK TABLES `ugovor` WRITE;
/*!40000 ALTER TABLE `ugovor` DISABLE KEYS */;
INSERT INTO `ugovor` VALUES (1,1,2,1,2,9,1),(2,2,1,2,3,5,6),(3,2,2,3,4,17,3),(4,1,1,4,1,5,4),(5,2,2,6,2,17,5),(6,1,1,5,1,16,7);
/*!40000 ALTER TABLE `ugovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `uloga`
--

LOCK TABLES `uloga` WRITE;
/*!40000 ALTER TABLE `uloga` DISABLE KEYS */;
INSERT INTO `uloga` VALUES (1,'CARRIER'),(2,'MANUFACTURER');
/*!40000 ALTER TABLE `uloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vozac`
--

LOCK TABLES `vozac` WRITE;
/*!40000 ALTER TABLE `vozac` DISABLE KEYS */;
INSERT INTO `vozac` VALUES (1,'Pavle','Šulić','Nušićeva 51/2, Zrenjanin','021/123-4567',10,'2015-05-14',135,4000,NULL,1,NULL,NULL),(2,'Dorđe','Pajkić','Voje Rajkića, Beograd','021/123-4567',10,'2010-02-10',450,15000,NULL,2,NULL,NULL),(3,'David','Kupić','Mirka Drobnjaka, Pančevo','021/123-4567',14,'2012-10-05',134,3000,NULL,1,NULL,NULL),(4,'Miodrag','Bakić','Feke Dmitrova, Pirot','021/123-4567',15,'2013-08-23',678,45670,NULL,2,NULL,NULL),(10,'sdf','sdfs','asd','asd',6,'2014-07-22',2,7,NULL,1,2,7);
/*!40000 ALTER TABLE `vozac` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-01 18:51:23
