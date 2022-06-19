-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('Administrator','admin@admin.com','$2a$10$RybNY/nE/fX4Sv32GqAn/O/Bjf7v2P0GSccizP46vEYxs7UGEUK1K',NULL,1,'2022-02-07 09:15:47','2022-02-07 09:15:47');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccount` (
  `bank` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_name` varchar(255) DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Auto Spare Parts',0,1,'2022-02-07 09:22:51','2022-02-07 09:22:51'),('Electronics',0,2,'2022-02-07 09:22:59','2022-02-07 09:22:59'),('House Hold Items',0,3,'2022-02-07 09:23:09','2022-02-07 09:23:09'),('Clothes',0,4,'2022-02-07 09:23:19','2022-02-07 09:23:19'),('Mobile Phones',0,5,'2022-02-07 09:23:35','2022-02-07 09:23:35'),('Custmetics',1,6,'2022-02-07 09:24:02','2022-02-07 17:53:07'),('Drinks&Beverages',0,7,'2022-02-07 09:25:26','2022-02-07 17:49:35'),('Beddings',0,8,'2022-02-07 09:26:01','2022-02-07 09:26:01'),('Computing',0,9,'2022-02-07 09:27:39','2022-02-07 09:27:39'),('',0,10,'2022-02-07 21:48:50','2022-02-07 21:48:50');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyfeatures`
--

DROP TABLE IF EXISTS `keyfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyfeatures` (
  `feature_name` varchar(255) DEFAULT NULL,
  `feature_value` varchar(255) DEFAULT NULL,
  `product` int DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyfeatures`
--

LOCK TABLES `keyfeatures` WRITE;
/*!40000 ALTER TABLE `keyfeatures` DISABLE KEYS */;
INSERT INTO `keyfeatures` VALUES ('','',2,NULL,1,'2022-02-23 13:31:46','2022-02-23 13:31:46'),('','',2,NULL,2,'2022-02-23 13:32:45','2022-02-23 13:32:45'),('','',3,NULL,3,'2022-02-23 13:36:12','2022-02-23 13:36:12'),('','',4,NULL,4,'2022-02-23 13:53:25','2022-02-23 13:53:25'),('','',4,NULL,5,'2022-02-23 13:53:29','2022-02-23 13:53:29'),('','',5,NULL,6,'2022-02-23 14:00:39','2022-02-23 14:00:39'),('','',6,1,7,'2022-03-27 22:12:29','2022-03-27 22:23:02'),('','',6,NULL,8,'2022-03-27 22:22:00','2022-03-27 22:22:00'),('','',6,NULL,9,'2022-03-27 22:22:30','2022-03-27 22:22:30'),('','',6,NULL,10,'2022-03-27 22:22:47','2022-03-27 22:22:47'),('','',6,NULL,11,'2022-03-27 22:24:32','2022-03-27 22:24:32');
/*!40000 ALTER TABLE `keyfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES ('Okey & Sons Limited','morishard010@gmail.com','Shop 2b','917741056','active',1,'2022-02-07 09:29:38','2022-02-07 09:29:38'),('Chikason','chikasongroup@gmail.com','Tools and hardware plaza ','+2348067528055','active',2,'2022-02-08 11:53:24','2022-02-08 11:53:24'),('Eagle tech ','oluchi.sarah.9@facebook.com','Tradefair ','+2348067528055','active',3,'2022-02-22 20:29:09','2022-02-22 20:29:09'),('GAP AGENCY','gapagencylimited@gmail.com','36, Nathan Street, Surulere, Lagos','07034967171','active',4,'2022-03-27 22:07:16','2022-03-27 22:07:16');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `user` int DEFAULT NULL,
  `item_count` int DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `delivery` varchar(255) DEFAULT NULL,
  `delivery_fee` float DEFAULT NULL,
  `delivery_note` longtext,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `merchant` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `product` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `order` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `merchant` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `sub_category` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `cost_price` float DEFAULT NULL,
  `selling_price` float DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Pillows','This is',1,8,7,5,NULL,NULL,4000,0,1,'2022-02-07 09:30:13','2022-02-07 09:30:13'),('Safety','Good quality',3,2,1,200,NULL,NULL,61000,0,2,'2022-02-23 13:31:19','2022-02-23 13:31:19'),('Safety','Good quality',3,9,10,200,NULL,NULL,64000,0,3,'2022-02-23 13:36:08','2022-02-23 13:36:08'),('House plus home theater','perfect in working',2,2,2,4,NULL,NULL,70000,0,4,'2022-02-23 13:52:35','2022-02-23 13:52:35'),('jeans','blue janes',3,4,14,2,NULL,NULL,64000,0,5,'2022-02-23 14:00:05','2022-02-23 14:00:05'),('Cooking Pot','3 sets of non stick pot',4,3,16,10000,NULL,NULL,25000,0,6,'2022-03-27 22:12:00','2022-03-27 22:12:00'),('Cooking Pot','',4,3,16,10000,NULL,NULL,25000,0,7,'2022-04-02 22:16:45','2022-04-02 22:16:45');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productphoto`
--

DROP TABLE IF EXISTS `productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productphoto` (
  `photo_name` varchar(255) DEFAULT NULL,
  `product` int DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_name` (`photo_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productphoto`
--

LOCK TABLES `productphoto` WRITE;
/*!40000 ALTER TABLE `productphoto` DISABLE KEYS */;
INSERT INTO `productphoto` VALUES ('541211358.jpg',1,1,'2022-02-07 09:31:38','2022-02-07 09:31:38'),('95021032.jpg',6,2,'2022-03-27 22:17:30','2022-03-27 22:17:30'),('567140189.jpg',6,3,'2022-03-27 22:18:08','2022-03-27 22:18:08'),('225694079.jpg',6,4,'2022-03-27 22:20:54','2022-03-27 22:20:54'),('47392314.jpg',6,5,'2022-03-27 22:22:42','2022-03-27 22:22:42');
/*!40000 ALTER TABLE `productphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `sub_category_name` varchar(255) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_category_name` (`sub_category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES ('Smart Tvs',2,0,1,'2022-02-07 09:24:38','2022-02-07 09:24:38'),('Home theater',2,0,2,'2022-02-07 09:24:48','2022-02-07 09:24:48'),('Creams',6,1,3,'2022-02-07 09:24:57','2022-02-07 17:51:01'),('Whisky',7,1,4,'2022-02-07 09:25:36','2022-02-07 17:49:21'),('Brandy',7,0,5,'2022-02-07 09:25:43','2022-02-07 09:25:43'),('Red Wine',7,0,6,'2022-02-07 09:25:52','2022-02-07 09:25:52'),('Pillows',8,0,7,'2022-02-07 09:26:13','2022-02-07 09:26:13'),('Mattress',8,0,8,'2022-02-07 09:27:08','2022-02-07 09:27:08'),('Duvet',8,0,9,'2022-02-07 09:27:17','2022-02-07 09:27:17'),('Laptops',9,0,10,'2022-02-07 09:27:50','2022-02-07 09:27:50'),('Hard drives',9,0,11,'2022-02-07 09:28:04','2022-02-07 09:28:04'),('Flash drives',9,0,12,'2022-02-07 09:28:17','2022-02-07 09:28:17'),('spanners',1,0,13,'2022-02-23 13:57:46','2022-02-23 13:57:46'),('male',4,0,14,'2022-02-23 13:58:38','2022-02-23 13:58:38'),('female',4,0,15,'2022-02-23 13:58:53','2022-02-23 13:58:53'),('Kitchen And Dining ',3,0,16,'2022-03-27 22:09:46','2022-03-27 22:09:46');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercontact`
--

DROP TABLE IF EXISTS `usercontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercontact` (
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `user` int DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercontact`
--

LOCK TABLES `usercontact` WRITE;
/*!40000 ALTER TABLE `usercontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercontact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 11:56:51
