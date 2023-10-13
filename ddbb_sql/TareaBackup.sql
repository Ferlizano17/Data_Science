-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tarea
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
-- Table structure for table `lineasdepedido`
--

DROP TABLE IF EXISTS `lineasdepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineasdepedido` (
  `CantidadUnidades` int DEFAULT NULL,
  `Importe` float DEFAULT NULL,
  `Articulo` varchar(20) NOT NULL,
  `CodPedido` varchar(20) NOT NULL,
  PRIMARY KEY (`CodPedido`,`Articulo`),
  KEY `Articulo` (`Articulo`),
  CONSTRAINT `lineasdepedido_ibfk_1` FOREIGN KEY (`Articulo`) REFERENCES `articulos` (`IDArticulo`),
  CONSTRAINT `lineasdepedido_ibfk_2` FOREIGN KEY (`CodPedido`) REFERENCES `pedidos` (`CodPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasdepedido`
--

LOCK TABLES `lineasdepedido` WRITE;
/*!40000 ALTER TABLE `lineasdepedido` DISABLE KEYS */;
INSERT INTO `lineasdepedido` VALUES (13,747.5,'8107','MF05'),(17,629,'8300','MF06'),(7,441,'8119','MF15'),(16,592,'8300','MF15'),(5,287.5,'8107','MF17'),(7,441,'8119','MF17'),(2,54,'8216','MF17'),(10,270,'8216','MF18'),(9,567.1,'8119','MF19'),(12,690,'8107','MF37');
/*!40000 ALTER TABLE `lineasdepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `CodPedido` varchar(20) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Mayorista` varchar(50) DEFAULT NULL,
  `DireccionEntrega` varchar(60) DEFAULT NULL,
  `IDTienda` varchar(25) DEFAULT NULL,
  `IDProveedor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodPedido`),
  KEY `DireccionEntrega` (`DireccionEntrega`),
  KEY `IDTienda` (`IDTienda`),
  KEY `IDProveedor` (`IDProveedor`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`DireccionEntrega`) REFERENCES `direcciones` (`Direccion`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`IDTienda`) REFERENCES `tienda` (`IDTienda`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`IDProveedor`) REFERENCES `proveedores` (`IDProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES ('MF05','2021-09-23 10:05:00','FLC S.A','Calle de Lagasca','102','M-43'),('MF06','2021-04-15 09:12:50','FLC S.A','Calle Ros de Olano 42','007','M-37'),('MF15','2022-10-18 14:15:00','FLC S.A','Calle de Torija','028','M-43'),('MF17','2022-07-19 07:30:00','FLC S.A','Calle Maria de Molina 42','007','M-37'),('MF18','2022-10-25 15:25:10','FLC S.A','Calle de Lagasca','102','M-43'),('MF19','2022-03-12 10:32:00','FLC S.A','Calle Ros de Olano 42','007','M-43'),('MF37','2022-09-22 14:15:00','FLC S.A','Calle de Torija','028','M-37');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 18:00:20
