# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.1.72)
# Database: minju
# Generation Time: 2016-11-22 19:06:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table MULTAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MULTAS`;

CREATE TABLE `MULTAS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rut` char(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `infraccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `monto` decimal(10,2) NOT NULL,
  `lastmodif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cuando` datetime NOT NULL,
  `donde` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `pagado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `MULTAS` WRITE;
/*!40000 ALTER TABLE `MULTAS` DISABLE KEYS */;

INSERT INTO `MULTAS` (`id`, `rut`, `infraccion`, `monto`, `lastmodif`, `cuando`, `donde`, `pagado`)
VALUES
	(1,'25.466.843-5','Andó demasiado rapido',999.99,'2016-11-22 15:09:02','2016-11-17 00:00:00','Calle Miraflores',1),
	(2,'25.466.843-5','Andó demasiado rapido',12345678.99,'2016-11-18 10:00:16','2016-11-16 00:00:00','Calle San Antonio',0),
	(3,'12.345.678-9','Bicicleta peligrosa',3000.00,'2016-11-21 18:45:51','2016-11-21 00:00:00','Paseo ahumada',0);

/*!40000 ALTER TABLE `MULTAS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SOLICITUD_AUDIENCIA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SOLICITUD_AUDIENCIA`;

CREATE TABLE `SOLICITUD_AUDIENCIA` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_multa` int(11) unsigned NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_multa_id` (`id_multa`),
  CONSTRAINT `fk_multa_id` FOREIGN KEY (`id_multa`) REFERENCES `multas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
