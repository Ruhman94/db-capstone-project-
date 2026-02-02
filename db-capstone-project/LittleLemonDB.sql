-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Booking id` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Table number` int NOT NULL,
  `Customer ID` int NOT NULL,
  `Orders_Order ID` int NOT NULL,
  PRIMARY KEY (`Booking id`),
  KEY `Customerdetails_idx` (`Customer ID`),
  CONSTRAINT `Bking.CID-CD.CID` FOREIGN KEY (`Customer ID`) REFERENCES `customer details` (`Customer ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer details`
--

DROP TABLE IF EXISTS `customer details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer details` (
  `Customer ID` int NOT NULL AUTO_INCREMENT,
  `Full name` varchar(100) NOT NULL,
  `Phone number` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Customer ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer details`
--

LOCK TABLES `customer details` WRITE;
/*!40000 ALTER TABLE `customer details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Menu ID` int NOT NULL AUTO_INCREMENT,
  `Item name` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Menu ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order delivery status`
--

DROP TABLE IF EXISTS `order delivery status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order delivery status` (
  `Delivery date` date DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `Delivery ID` int NOT NULL AUTO_INCREMENT,
  `Order ID` int NOT NULL,
  PRIMARY KEY (`Delivery ID`),
  KEY `ODS.OID-O.OID_idx` (`Order ID`),
  CONSTRAINT `ODS.OID-O.OID` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order delivery status`
--

LOCK TABLES `order delivery status` WRITE;
/*!40000 ALTER TABLE `order delivery status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order delivery status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order ID` int NOT NULL AUTO_INCREMENT,
  `Order date` date NOT NULL,
  `Quantity` int NOT NULL,
  `Total cost` decimal(10,2) NOT NULL,
  `Booking ID` int NOT NULL,
  `Customer ID` int NOT NULL,
  `Staff ID` int NOT NULL,
  PRIMARY KEY (`Order ID`),
  KEY `O.BID-B,BID_idx` (`Booking ID`),
  KEY `O.CIS-CD.CID_idx` (`Customer ID`),
  KEY `O.SID-SI.SID_idx` (`Staff ID`),
  CONSTRAINT `O.BID-B,BID` FOREIGN KEY (`Booking ID`) REFERENCES `bookings` (`Booking id`) ON UPDATE CASCADE,
  CONSTRAINT `O.CIS-CD.CID` FOREIGN KEY (`Customer ID`) REFERENCES `customer details` (`Customer ID`) ON UPDATE CASCADE,
  CONSTRAINT `O.SID-SI.SID` FOREIGN KEY (`Staff ID`) REFERENCES `staff information` (`Staff ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff information`
--

DROP TABLE IF EXISTS `staff information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff information` (
  `Staff ID` int NOT NULL AUTO_INCREMENT,
  `Full name` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Staff ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff information`
--

LOCK TABLES `staff information` WRITE;
/*!40000 ALTER TABLE `staff information` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-02 12:13:29
