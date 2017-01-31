USE content;

TRUNCATE TABLE HotelRoom;

DROP INDEX hotelroomimageunique on HotelRoom;

ALTER TABLE `HotelRoom` 
	ADD UNIQUE INDEX `hotelroomunique` (`hotelId`, `roomTypeId`, `supplierCode`);

ALTER TABLE HotelRoom DROP COLUMN image;

CREATE TABLE `HotelRoomImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelRoomId` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `HotelRoomImage_ibfk_1` FOREIGN KEY (`hotelRoomId`) REFERENCES `HotelRoom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `HotelRoomImage` 
	ADD UNIQUE INDEX `hotelroomimageunique` (`hotelRoomId`, `image`);
