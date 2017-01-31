USE content;

-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `AmenityPattern`
--

DROP TABLE IF EXISTS `AmenityPattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AmenityPattern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierCode` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `included` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplierCode` (`supplierCode`),
  KEY `supplierCodeAndName` (`supplierCode`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Attribute`
--

DROP TABLE IF EXISTS `Attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attribute` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CategoryHotel`
--

DROP TABLE IF EXISTS `CategoryHotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoryHotel` (
  `categoryId` bigint(20) NOT NULL,
  `hotelId` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryId`,`hotelId`),
  KEY `hotelId` (`hotelId`),
  CONSTRAINT `CategoryHotel_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `Hotel` (`id`),
  CONSTRAINT `CategoryHotel_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DictionaryReplacementRule`
--

DROP TABLE IF EXISTS `DictionaryReplacementRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DictionaryReplacementRule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryCode` varchar(255) DEFAULT NULL,
  `hotelAttribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countryCodeIndex` (`countryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `currencyCode` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `starRating` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `ranking` int(11) DEFAULT '100000000',
  `city` varchar(255) DEFAULT NULL,
  `searchPriority` int(11) DEFAULT NULL,
  `checkInTime` varchar(255) DEFAULT NULL,
  `checkOutTime` varchar(255) DEFAULT NULL,
  `tripAdvisorUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotelIndex` (`countryCode`),
  KEY `hotelTripAdvisor` (`id`,`tripAdvisorUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HotelAttribute`
--

DROP TABLE IF EXISTS `HotelAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelAttribute` (
  `hotelId` varchar(255) NOT NULL,
  `attributeId` varchar(255) NOT NULL,
  `appendText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hotelId`,`attributeId`),
  KEY `attributeId` (`attributeId`),
  KEY `hotelId` (`hotelId`),
  CONSTRAINT `HotelAttribute_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `Hotel` (`id`),
  CONSTRAINT `HotelAttribute_ibfk_2` FOREIGN KEY (`attributeId`) REFERENCES `Attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HotelDescription`
--

DROP TABLE IF EXISTS `HotelDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelDescription` (
  `id` varchar(255) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HotelImage`
--

DROP TABLE IF EXISTS `HotelImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `thumbnailURL` varchar(255) NOT NULL,
  `defaultImage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotelimageurlunique` (`hotelId`,`url`),
  KEY `hotelId` (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=98808 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HotelMapping`
--

DROP TABLE IF EXISTS `HotelMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelMapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `confidence` int(11) DEFAULT NULL,
  `hotelId` varchar(255) DEFAULT NULL,
  `mappedByUser` tinyint(1) NOT NULL,
  `supplierCode` varchar(3) DEFAULT NULL,
  `supplierHotelId` varchar(255) DEFAULT NULL,
  `unmapped` tinyint(1) NOT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `modifiedByUser` varchar(255) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hotelMapIndex` (`hotelId`,`supplierCode`),
  KEY `hotelActiveConfidenceIndex` (`hotelId`,`active`,`confidence`),
  KEY `countryCodeUnmappedIndex` (`countryCode`,`unmapped`),
  KEY `modifiedByUser` (`modifiedByUser`),
  KEY `modifiedTimestamp` (`modifiedTimestamp`),
  KEY `supplierConfidence` (`supplierCode`,`confidence`)
) ENGINE=InnoDB AUTO_INCREMENT=301910 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HotelRoom`
--

DROP TABLE IF EXISTS `HotelRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelRoom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` varchar(255) NOT NULL,
  `roomTypeId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23232158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `HotelRoom` 
	ADD UNIQUE INDEX `hotelroomimageunique` (`hotelId`, `roomTypeId`, `supplierCode`, `image`);

ALTER TABLE `content`.`HotelRoom` 
	ADD INDEX `hotelIdsupplierCode` (`hotelId`, `supplierCode`);

--
-- Table structure for table `RegionHotelMapping`
--

DROP TABLE IF EXISTS `RegionHotelMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionHotelMapping` (
  `active` tinyint(1) NOT NULL,
  `hotelId` varchar(255) NOT NULL,
  `regionId` varchar(255) NOT NULL,
  `regionType` varchar(45) DEFAULT NULL,
  `supplierCode` varchar(3) DEFAULT NULL,
  `supplierHotelId` varchar(255) DEFAULT NULL,
  `mappedByUser` tinyint(1) NOT NULL DEFAULT '0',
  `modifiedByUser` varchar(255) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hotelId`,`regionId`),
  KEY `regionHotelMappingIndex` (`regionId`),
  KEY `modifiedByUser` (`modifiedByUser`),
  KEY `modifiedTimestamp` (`modifiedTimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplacementTokens`
--

DROP TABLE IF EXISTS `ReplacementTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacementTokens` (
  `ReplacementRule_id` bigint(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`ReplacementRule_id`,`pattern`),
  KEY `FK_dw2cvawgrktx58gc7wim0atxi` (`ReplacementRule_id`),
  CONSTRAINT `FK_dw2cvawgrktx58gc7wim0atxi` FOREIGN KEY (`ReplacementRule_id`) REFERENCES `DictionaryReplacementRule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SupplierPayload`
--
DROP TABLE IF EXISTS `SupplierPayload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupplierPayload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `supplier` varchar(3) NOT NULL,
  `type` varchar(10) NOT NULL,
  `request` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS `cleanPayloadsEvent` 
  ON SCHEDULE EVERY 1 WEEK 
  DO DELETE FROM `SupplierPayload` where `created` < DATE_SUB(CURRENT_DATE, INTERVAL 1 WEEK);
  
ALTER TABLE `SupplierPayload` 
	ADD INDEX `createdDate` (`created`);

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-16 13:09:25
