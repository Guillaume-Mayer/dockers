USE feeds;

RENAME TABLE `FeedHotelRoom` TO `FeedHotelRoomImage`;

CREATE TABLE `FeedHotelRoom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` varchar(255) NOT NULL,
  `roomTypeId` varchar(255) NOT NULL,
  `supplierCode` varchar(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `FeedHotelRoom` 
	ADD UNIQUE INDEX `feedhotelroomunique` (`hotelId`, `roomTypeId`, `supplierCode`);

ALTER TABLE `FeedHotelRoomImage` DROP COLUMN name, DROP COLUMN description;

DELETE FROM `FeedHotelRoomImage` WHERE image is null or image = '';
