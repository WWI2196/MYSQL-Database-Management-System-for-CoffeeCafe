-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: coffeecafe_details
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `user_ID` varchar(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `delivery_address` varchar(80) NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_ID` (`user_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('A00045','Arnol','Jhonson','Arjho@gmail.com','23,Barrio de Greenwich,Greenwich'),('A45300','Ruby','Wilson','RubyWil@gmail.com','45,Barrington,Stratford'),('B57005','Olivia','Elizabeth','Eliza@gmail.com','234,Mottingham,Bromley'),('E05678','Burton','Harris','Burth@gmail.com','122,Turnham Green,Chiswick'),('R66789','Samantha','Joann','samantha@gmail.com','99,Tiddington,Stratford');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contact_number`
--

DROP TABLE IF EXISTS `customer_contact_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_contact_number` (
  `user_ID` varchar(6) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  PRIMARY KEY (`user_ID`,`contact_number`),
  CONSTRAINT `ccn_uID_fk` FOREIGN KEY (`user_ID`) REFERENCES `customer` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contact_number`
--

LOCK TABLES `customer_contact_number` WRITE;
/*!40000 ALTER TABLE `customer_contact_number` DISABLE KEYS */;
INSERT INTO `customer_contact_number` VALUES ('A00045','+447975777666'),('A45300','+441682960079'),('B57005','+441632960201'),('B57005','+441632960732'),('B57005','+441772961239'),('E05678','+441711960287'),('R66789','+441900960806');
/*!40000 ALTER TABLE `customer_contact_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_ID` int NOT NULL,
  `vehicle_number` varchar(8) NOT NULL,
  `delivery_date` date NOT NULL,
  `driver_ID` int NOT NULL,
  `steward_ID` int NOT NULL,
  `delivered_time` time NOT NULL,
  PRIMARY KEY (`delivery_ID`),
  UNIQUE KEY `delivery_ID` (`delivery_ID`),
  KEY `d_drID_fk` (`driver_ID`),
  KEY `d_stID_fk` (`steward_ID`),
  CONSTRAINT `d_drID_fk` FOREIGN KEY (`driver_ID`) REFERENCES `employee` (`employee_ID`),
  CONSTRAINT `d_stID_fk` FOREIGN KEY (`steward_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (100098,'TA2T MAK','2022-02-26',511789,675543,'16:44:56'),(134566,'CSI1 NET','2022-11-10',500789,675543,'12:50:10'),(324579,'TA25 MAK','2022-05-26',267886,675443,'09:06:50'),(444589,'CSIY NET','2022-05-26',511789,511222,'09:55:50'),(788890,'M88U KER','2022-10-11',830500,100067,'10:30:45'),(906433,'SMII 12X','2022-06-08',500789,100067,'15:10:10'),(980097,'DM1T KER','2022-09-02',830500,675443,'14:37:20');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_receive`
--

DROP TABLE IF EXISTS `delivery_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_receive` (
  `delivery_ID` int NOT NULL,
  `user_ID` varchar(6) NOT NULL,
  PRIMARY KEY (`delivery_ID`,`user_ID`),
  KEY `dr_uID_fk` (`user_ID`),
  CONSTRAINT `dr_diID_fk` FOREIGN KEY (`delivery_ID`) REFERENCES `delivery` (`delivery_ID`),
  CONSTRAINT `dr_uID_fk` FOREIGN KEY (`user_ID`) REFERENCES `customer` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_receive`
--

LOCK TABLES `delivery_receive` WRITE;
/*!40000 ALTER TABLE `delivery_receive` DISABLE KEYS */;
INSERT INTO `delivery_receive` VALUES (788890,'A00045'),(906433,'A00045'),(324579,'A45300'),(100098,'B57005'),(134566,'B57005'),(444589,'E05678'),(980097,'R66789');
/*!40000 ALTER TABLE `delivery_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_staff`
--

DROP TABLE IF EXISTS `delivery_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_staff` (
  `employee_ID` int NOT NULL,
  `driver_license_number` varchar(15) NOT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `employee_ID` (`employee_ID`),
  UNIQUE KEY `driver_license_number` (`driver_license_number`),
  CONSTRAINT `ds_drID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_staff`
--

LOCK TABLES `delivery_staff` WRITE;
/*!40000 ALTER TABLE `delivery_staff` DISABLE KEYS */;
INSERT INTO `delivery_staff` VALUES (511789,'QFV717243ZA8MN'),(830500,'URE504124XA9UK'),(500789,'YLE554923XA0KC'),(267886,'ZZE411631JQ6VB');
/*!40000 ALTER TABLE `delivery_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_vehicles_allowed`
--

DROP TABLE IF EXISTS `delivery_vehicles_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_vehicles_allowed` (
  `employee_ID` int NOT NULL,
  `vehicles_allowed` varchar(10) NOT NULL,
  PRIMARY KEY (`employee_ID`,`vehicles_allowed`),
  CONSTRAINT `dv_drID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_vehicles_allowed`
--

LOCK TABLES `delivery_vehicles_allowed` WRITE;
/*!40000 ALTER TABLE `delivery_vehicles_allowed` DISABLE KEYS */;
INSERT INTO `delivery_vehicles_allowed` VALUES (267886,'Car'),(500789,'Car'),(500789,'Motorcycle'),(511789,'Car'),(830500,'Bicycle'),(830500,'Car'),(830500,'Moped'),(830500,'Motorcycle');
/*!40000 ALTER TABLE `delivery_vehicles_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_ID` int NOT NULL,
  `designation` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `manager_ID` int DEFAULT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `employee_ID` (`employee_ID`),
  KEY `e_mID_fk` (`manager_ID`),
  CONSTRAINT `e_mID_fk` FOREIGN KEY (`manager_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100067,'Steward','Amelia','Stephens',90000.00,202780),(190078,'Cleaner','Kayleigh','Potts',76000.00,207990),(200989,'Manager','Daisy','Green',300000.00,NULL),(202780,'Manager','Patrick','Gould',300000.00,NULL),(203420,'Manager','Georgina','Doherty',300000.00,NULL),(207990,'Manager','Jamie','Hall',300000.00,NULL),(267886,'Driver','Rummy','Arnon',85000.00,200989),(500789,'Driver','Jamie','Nixon',85000.00,200989),(511222,'Steward','Jacob','Ali',90000.00,202780),(511789,'Driver','Finley','Conway',85000.00,200989),(555799,'Barista','Charles','Ryan',98000.00,203420),(675443,'Steward','Adam','Bennett',90000.00,202780),(675543,'Steward','Kyle','Howarth',90000.00,202780),(830500,'Driver','Zachary','Baldwin',85000.00,200989);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_address`
--

DROP TABLE IF EXISTS `employee_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_address` (
  `employee_ID` int NOT NULL,
  `address` varchar(80) NOT NULL,
  PRIMARY KEY (`employee_ID`,`address`),
  CONSTRAINT `ead_eID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_address`
--

LOCK TABLES `employee_address` WRITE;
/*!40000 ALTER TABLE `employee_address` DISABLE KEYS */;
INSERT INTO `employee_address` VALUES (100067,'76,Crescent Avenue,Drumlemble'),(190078,'13,Lairg Road,New Winton'),(190078,'57,Union Terrace,Lochawe'),(200989,'46,Roman Rd,Leckhampstead'),(202780,'60,Henley Road,Bournbrook'),(202780,'69,Broad Street,Lower Swell'),(203420,'71,Ash Lane,Yaverland'),(207990,'66,High Street,Ashill'),(267886,'86,Harrogate Road,Saddington'),(500789,'6,Seaford Road,Culgower'),(511222,'59,Warren St,West Hatch'),(511789,'7,Argyll Road,Llandefaelog-Tre\'R-Graig'),(555799,'68,Henley Road,Bourton'),(675443,'S44,Fordham Rd,Halfway Houses'),(675543,'79,Simone Weil Avenue,Waytown'),(830500,'2,Quay Street,Nedging TYE');
/*!40000 ALTER TABLE `employee_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_contact_number`
--

DROP TABLE IF EXISTS `employee_contact_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_contact_number` (
  `employee_ID` int NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  PRIMARY KEY (`employee_ID`,`contact_number`),
  CONSTRAINT `ecn_eID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contact_number`
--

LOCK TABLES `employee_contact_number` WRITE;
/*!40000 ALTER TABLE `employee_contact_number` DISABLE KEYS */;
INSERT INTO `employee_contact_number` VALUES (100067,'+447706441475'),(190078,'+447924555791'),(190078,'+447955920132'),(200989,'+447831965208'),(200989,'+447847985395'),(202780,'+447760056457'),(202780,'+447925840713'),(203420,'+447851066584'),(207990,'+447885619683'),(267886,'+447830606399'),(500789,'+447031309766'),(511222,'+447878061681'),(511789,'+447061044919'),(555799,'+447085436640'),(675443,'+447786975325'),(675543,'+447938834700'),(830500,'+447703839120');
/*!40000 ALTER TABLE `employee_contact_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_details`
--

DROP TABLE IF EXISTS `manager_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_details` (
  `employee_ID` int NOT NULL,
  `employment_peroid_years` int DEFAULT '1',
  `division_in_charge` varchar(30) NOT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `employee_ID` (`employee_ID`),
  UNIQUE KEY `division_in_charge` (`division_in_charge`),
  CONSTRAINT `md_eID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_details`
--

LOCK TABLES `manager_details` WRITE;
/*!40000 ALTER TABLE `manager_details` DISABLE KEYS */;
INSERT INTO `manager_details` VALUES (200989,7,'Delivery'),(202780,10,'Delivery tracking'),(203420,11,'Production'),(207990,4,'Cleaning');
/*!40000 ALTER TABLE `manager_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_contents`
--

DROP TABLE IF EXISTS `order_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_contents` (
  `order_ID` varchar(10) NOT NULL,
  `product_ID` varchar(10) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_ID`,`product_ID`),
  KEY `oc_pID_fk` (`product_ID`),
  CONSTRAINT `oc_oID_fk` FOREIGN KEY (`order_ID`) REFERENCES `order_details` (`order_ID`),
  CONSTRAINT `oc_pID_fk` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_contents`
--

LOCK TABLES `order_contents` WRITE;
/*!40000 ALTER TABLE `order_contents` DISABLE KEYS */;
INSERT INTO `order_contents` VALUES ('BBN11123','CAK711123',1),('CXA45112','CBD622213',2),('HJK99040','CBD165890',1),('HJK99040','HBD661789',1),('QQR78190','CBD165890',1),('QQR78190','CBD566541',2),('QQR78190','HBD587913',1),('REL78644','CBD622213',1),('UPW88930','SNA483227',2),('XXA66788','HBD501255',2);
/*!40000 ALTER TABLE `order_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_ID` varchar(10) NOT NULL,
  `received_date` date NOT NULL,
  `received_time` time NOT NULL DEFAULT '00:00:00',
  `prepaired_time` time NOT NULL DEFAULT '00:00:00',
  `delivery_ID` int NOT NULL,
  `prepared_employee_ID` int NOT NULL,
  `user_ID` varchar(6) NOT NULL,
  `payment_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`order_ID`),
  UNIQUE KEY `order_ID` (`order_ID`),
  UNIQUE KEY `payment_ID` (`payment_ID`),
  KEY `od_diID_fk` (`delivery_ID`),
  KEY `od_preID_fk` (`prepared_employee_ID`),
  KEY `od_uID_fk` (`user_ID`),
  CONSTRAINT `od_diID_fk` FOREIGN KEY (`delivery_ID`) REFERENCES `delivery` (`delivery_ID`),
  CONSTRAINT `od_preID_fk` FOREIGN KEY (`prepared_employee_ID`) REFERENCES `employee` (`employee_ID`),
  CONSTRAINT `od_uID_fk` FOREIGN KEY (`user_ID`) REFERENCES `customer` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('BBN11123','2022-05-26','08:35:02','08:42:22',324579,555799,'A45300','POI556789'),('CXA45112','2022-11-10','12:00:40','12:17:28',134566,555799,'B57005','POV580009'),('HJK99040','2022-05-26','09:00:20','09:13:10',444589,555799,'E05678','PDY233211'),('QQR78190','2022-10-11','09:57:17','10:05:03',788890,555799,'A00045','PDA267789'),('REL78644','2022-02-26','16:12:36','16:20:36',100098,555799,'B57005','POG677754'),('UPW88930','2022-09-02','14:00:03','14:10:23',980097,555799,'R66789','PDR789911'),('XXA66788','2022-06-08','14:41:23','14:49:33',906433,555799,'A00045','POQ498112');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_on_delivery`
--

DROP TABLE IF EXISTS `payment_on_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_on_delivery` (
  `payment_ID` varchar(10) NOT NULL,
  `payment_date` date NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `verified_time` time NOT NULL,
  `steward_ID` int NOT NULL,
  `receipt_number` varchar(10) NOT NULL,
  PRIMARY KEY (`payment_ID`),
  UNIQUE KEY `payment_ID` (`payment_ID`),
  KEY `pod_stID_fk` (`steward_ID`),
  CONSTRAINT `pod_pID_fk` FOREIGN KEY (`payment_ID`) REFERENCES `order_details` (`payment_ID`),
  CONSTRAINT `pod_stID_fk` FOREIGN KEY (`steward_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_on_delivery`
--

LOCK TABLES `payment_on_delivery` WRITE;
/*!40000 ALTER TABLE `payment_on_delivery` DISABLE KEYS */;
INSERT INTO `payment_on_delivery` VALUES ('PDA267789','2022-10-11',17.50,'10:32:00',100067,'IP123D837'),('PDR789911','2022-09-02',5.40,'14:41:23',675443,'QT667U009'),('PDY233211','2022-05-26',11.70,'09:57:20',511222,'YO007L909');
/*!40000 ALTER TABLE `payment_on_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_online`
--

DROP TABLE IF EXISTS `payment_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_online` (
  `payment_ID` varchar(10) NOT NULL,
  `payment_date` date NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `verified_time` time NOT NULL,
  `steward_ID` int NOT NULL,
  `card_number` varchar(16) NOT NULL,
  PRIMARY KEY (`payment_ID`),
  UNIQUE KEY `payment_ID` (`payment_ID`),
  KEY `po_stID_fk` (`steward_ID`),
  KEY `po_cdn_fk` (`card_number`),
  CONSTRAINT `po_cdn_fk` FOREIGN KEY (`card_number`) REFERENCES `user_card_details` (`card_number`),
  CONSTRAINT `po_pID_fk` FOREIGN KEY (`payment_ID`) REFERENCES `order_details` (`payment_ID`),
  CONSTRAINT `po_stID_fk` FOREIGN KEY (`steward_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_online`
--

LOCK TABLES `payment_online` WRITE;
/*!40000 ALTER TABLE `payment_online` DISABLE KEYS */;
INSERT INTO `payment_online` VALUES ('POG677754','2022-02-26',7.70,'16:12:36',675543,'497654112312'),('POI556789','2022-05-26',5.60,'08:35:02',675443,'498711234522'),('POQ498112','2022-06-08',11.40,'14:41:23',100067,'487643212234'),('POV580009','2022-11-10',15.40,'12:00:40',675543,'497654112312');
/*!40000 ALTER TABLE `payment_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_ID` varchar(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` varchar(200) NOT NULL DEFAULT '(yet to update)',
  `product_type` varchar(20) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`product_ID`),
  UNIQUE KEY `product_ID` (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('CAK711123','Chocolate coconut cake','An irresistible cake with the dense aroma of \nbrown sugar with creamy texture of coconut.','cake',5.60),('CBD165890','La Colombe Triple Latte','This iced coffee upgrade has the \nclassic full taste and texture of a true cold latte, complete with a frothy layer of milk and 3 shots of espresso.','cold beverage',6.30),('CBD566541','Iced Horchata Latte','A combination of a Latin American \nfavorite and an American café staple, the iced horchata latte brings together the \nsweet heady-spiced goodness of horchata and the earthy sweetness of a café latte.','cold beverage',3.75),('CBD622213','Iced Lavender Mint Matcha Latte','(yet to update)','cold beverage',7.70),('HBD501255','Affogato','Affogato is a classic Italian \ndessert that features a scoop of vanilla ice cream covered in a warm shot of espresso.','hot beverage',5.70),('HBD587913','Espresso','Espresso is a kind of strong \ncoffee made by forcing steam or boiling water through ground, dark-roast coffee beans.','hot beverage',3.70),('HBD661789','Mocha','It is a variant of a latte, in the sense that \nit is often 1/3 espresso and 2/3 steamed milk. However, a chocolate flavour is added, and this can be milk or dark.','hot beverage',5.40),('SNA483227','Muffins','A quick bread made of batter containing egg \nand baked in a pan having cuplike molds.','snack',2.70);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steward_details`
--

DROP TABLE IF EXISTS `steward_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steward_details` (
  `employee_ID` int NOT NULL,
  `city_assigned` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `employee_ID` (`employee_ID`),
  CONSTRAINT `st_eID_fk` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steward_details`
--

LOCK TABLES `steward_details` WRITE;
/*!40000 ALTER TABLE `steward_details` DISABLE KEYS */;
INSERT INTO `steward_details` VALUES (100067,'Greenwich'),(511222,'Chiswick'),(675443,'Stratford'),(675543,'Bromley');
/*!40000 ALTER TABLE `steward_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_card_details`
--

DROP TABLE IF EXISTS `user_card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_card_details` (
  `card_number` varchar(16) NOT NULL,
  `card_holder` varchar(50) NOT NULL,
  PRIMARY KEY (`card_number`),
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_card_details`
--

LOCK TABLES `user_card_details` WRITE;
/*!40000 ALTER TABLE `user_card_details` DISABLE KEYS */;
INSERT INTO `user_card_details` VALUES ('487643212234','Arnol Jhonson'),('497654112312','Olivia Elizabeth'),('498711234522','Ruby Wilson');
/*!40000 ALTER TABLE `user_card_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-24  4:40:46
