USE feeds;

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
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedAttribute`
--

DROP TABLE IF EXISTS `FeedAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedAttribute` (
  `attributeId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`attributeId`,`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedHotel`
--

DROP TABLE IF EXISTS `FeedHotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedHotel` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `currencyCode` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `starRating` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `ranking` int(11) DEFAULT '100000000',
  `pageName` varchar(255) DEFAULT NULL,
  `checkInTime` varchar(255) DEFAULT NULL,
  `checkOutTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplierCode`),
  KEY `hotelCountryCodeIndex` (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedHotelAttribute`
--

DROP TABLE IF EXISTS `FeedHotelAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedHotelAttribute` (
  `hotelId` varchar(255) NOT NULL,
  `attributeId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `appendText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hotelId`,`attributeId`,`supplierCode`),
  KEY `hotelattributes` (`hotelId`,`attributeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedHotelDescription`
--

DROP TABLE IF EXISTS `FeedHotelDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedHotelDescription` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedHotelImage`
--

DROP TABLE IF EXISTS `FeedHotelImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedHotelImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `thumbnailURL` varchar(255) NOT NULL,
  `defaultImage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotelimages` (`hotelId`,`supplierCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7599157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `FeedHotelImage` 
	ADD UNIQUE INDEX `feedhotelimageurlunique` (`hotelId`, `supplierCode`, `url`);
	
ALTER TABLE `FeedHotelImage` 
	ADD INDEX `feedhotelimagesuppliercode` (`supplierCode`);

--
-- Table structure for table `FeedHotelRoom`
--

DROP TABLE IF EXISTS `FeedHotelRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedHotelRoom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` varchar(255) NOT NULL,
  `roomTypeId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17720495 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `FeedHotelRoom` 
	ADD UNIQUE INDEX `feedhotelroomimageunique` (`hotelId`, `roomTypeId`, `supplierCode`, `image`);

ALTER TABLE `FeedHotelRoom` 
	ADD INDEX `supplierCode` (`supplierCode`);

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Region` (
  `id` varchar(255) NOT NULL,
  `idParent` varchar(255) DEFAULT NULL,
  `regionName` varchar(255) DEFAULT NULL,
  `regionNameLong` varchar(255) DEFAULT NULL,
  `regionType` varchar(255) DEFAULT NULL,
  `subClass` varchar(255) DEFAULT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `searchPriority` int(11) DEFAULT NULL,
  `modifiedByUser` varchar(255) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `regionIndex` (`idParent`,`regionType`),
  KEY `modifiedByUser` (`modifiedByUser`),
  KEY `modifiedTimestamp` (`modifiedTimestamp`),
  KEY `regionTypeIndex` (`regionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegionArea`
--

DROP TABLE IF EXISTS `RegionArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionArea` (
  `id` varchar(255) NOT NULL,
  `coordinates` longtext,
  `regionType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionAreatypeIndex` (`regionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegionCoordinates`
--

DROP TABLE IF EXISTS `RegionCoordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionCoordinates` (
  `id` varchar(255) NOT NULL,
  `coordinates` longtext,
  `regionType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionCoordtypeIndex` (`regionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegionHotel`
--

DROP TABLE IF EXISTS `RegionHotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionHotel` (
  `idHotel` varchar(255) NOT NULL,
  `idRegion` varchar(255) NOT NULL,
  `supplierCode` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idHotel`,`idRegion`),
  KEY `regionHotelindex` (`idHotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegionLanguage`
--

DROP TABLE IF EXISTS `RegionLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionLanguage` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `regionName` varchar(255) DEFAULT NULL,
  `regionNameLong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-16 13:09:36
