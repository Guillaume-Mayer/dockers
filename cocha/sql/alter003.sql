use feeds;
CREATE TABLE `FeedHotelPolicyDescription` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `FeedHotelFeeDescription` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `FeedHotelMandatoryFeeDescription` (
  `id` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


use content;
CREATE TABLE `HotelPolicyDescription` (
  `id` varchar(255) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `HotelFeeDescription` (
  `id` varchar(255) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `HotelMandatoryFeeDescription` (
  `id` varchar(255) NOT NULL,
  `description` longtext,
  `languageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;