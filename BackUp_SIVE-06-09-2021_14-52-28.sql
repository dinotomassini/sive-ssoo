-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bd_sive
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

create database bd_sive;
use bd_sive;
--
-- Table structure for table `Administra`
--

DROP TABLE IF EXISTS `Administra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administra` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdCatalogo` int(11) NOT NULL,
  PRIMARY KEY (`correo`,`IdCatalogo`),
  KEY `IdCatalogo` (`IdCatalogo`),
  CONSTRAINT `Administra_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `vendedor` (`correo`),
  CONSTRAINT `Administra_ibfk_2` FOREIGN KEY (`IdCatalogo`) REFERENCES `Catalogo` (`IdCatalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administra`
--

LOCK TABLES `Administra` WRITE;
/*!40000 ALTER TABLE `Administra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrador` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdAdministrador` int(11) NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE KEY `IdAdministrador` (`IdAdministrador`),
  CONSTRAINT `Administrador_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `Usuario` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrito`
--

DROP TABLE IF EXISTS `Carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carrito` (
  `CodProducto` int(11) NOT NULL,
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdOrden` int(11) NOT NULL,
  `IdCarrito` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `SubTotal` int(11) NOT NULL,
  PRIMARY KEY (`CodProducto`,`IdCarrito`),
  KEY `correo` (`correo`),
  KEY `IdOrden` (`IdOrden`),
  CONSTRAINT `Carrito_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `Producto` (`CodProducto`),
  CONSTRAINT `Carrito_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `Cliente` (`correo`),
  CONSTRAINT `Carrito_ibfk_3` FOREIGN KEY (`IdOrden`) REFERENCES `Compras` (`IdOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrito`
--

LOCK TABLES `Carrito` WRITE;
/*!40000 ALTER TABLE `Carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catalogo`
--

DROP TABLE IF EXISTS `Catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catalogo` (
  `IdCatalogo` int(11) NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdCatalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catalogo`
--

LOCK TABLES `Catalogo` WRITE;
/*!40000 ALTER TABLE `Catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `IdCategoria` int(11) NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CentroDePagos`
--

DROP TABLE IF EXISTS `CentroDePagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CentroDePagos` (
  `IdMetodoPago` int(11) NOT NULL,
  `IdCentroDePago` int(11) NOT NULL,
  PRIMARY KEY (`IdMetodoPago`),
  UNIQUE KEY `IdCentroDePago` (`IdCentroDePago`),
  CONSTRAINT `CentroDePagos_ibfk_1` FOREIGN KEY (`IdMetodoPago`) REFERENCES `MetodoDePago` (`IdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CentroDePagos`
--

LOCK TABLES `CentroDePagos` WRITE;
/*!40000 ALTER TABLE `CentroDePagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `CentroDePagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reputacion` int(11) NOT NULL,
  PRIMARY KEY (`correo`),
  CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `Usuario` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compras` (
  `IdOrden` int(11) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `pagoAprobado` tinyint(1) NOT NULL,
  `Total` int(11) NOT NULL,
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodProducto` int(11) NOT NULL,
  PRIMARY KEY (`IdOrden`),
  KEY `correo` (`correo`),
  KEY `CodProducto` (`CodProducto`),
  CONSTRAINT `Compras_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `Cliente` (`correo`),
  CONSTRAINT `Compras_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `Producto` (`CodProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Despacho`
--

DROP TABLE IF EXISTS `Despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Despacho` (
  `IdEntrega` int(11) NOT NULL,
  `Estado_Entrega` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha_Entrega` date NOT NULL,
  `Lugar` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Despacho`
--

LOCK TABLES `Despacho` WRITE;
/*!40000 ALTER TABLE `Despacho` DISABLE KEYS */;
/*!40000 ALTER TABLE `Despacho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Esta`
--

DROP TABLE IF EXISTS `Esta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Esta` (
  `IdCatalogo` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL,
  PRIMARY KEY (`IdCatalogo`,`CodProducto`),
  KEY `CodProducto` (`CodProducto`),
  CONSTRAINT `Esta_ibfk_1` FOREIGN KEY (`IdCatalogo`) REFERENCES `Catalogo` (`IdCatalogo`),
  CONSTRAINT `Esta_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `Producto` (`CodProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Esta`
--

LOCK TABLES `Esta` WRITE;
/*!40000 ALTER TABLE `Esta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Esta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gestiona`
--

DROP TABLE IF EXISTS `Gestiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gestiona` (
  `IdCategoria` int(11) NOT NULL,
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdCategoria`),
  KEY `correo` (`correo`),
  CONSTRAINT `Gestiona_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `Categoria` (`IdCategoria`),
  CONSTRAINT `Gestiona_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `Administrador` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gestiona`
--

LOCK TABLES `Gestiona` WRITE;
/*!40000 ALTER TABLE `Gestiona` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gestiona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MetodoDePago`
--

DROP TABLE IF EXISTS `MetodoDePago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MetodoDePago` (
  `IdMetodoPago` int(11) NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MetodoDePago`
--

LOCK TABLES `MetodoDePago` WRITE;
/*!40000 ALTER TABLE `MetodoDePago` DISABLE KEYS */;
/*!40000 ALTER TABLE `MetodoDePago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPal`
--

DROP TABLE IF EXISTS `PayPal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPal` (
  `IdMetodoPago` int(11) NOT NULL,
  `confirmacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdMetodoPago`),
  CONSTRAINT `PayPal_ibfk_1` FOREIGN KEY (`IdMetodoPago`) REFERENCES `MetodoDePago` (`IdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPal`
--

LOCK TABLES `PayPal` WRITE;
/*!40000 ALTER TABLE `PayPal` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayPal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto` (
  `CodProducto` int(11) NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Precio` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Estado_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Procedencia` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Detalle` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CodProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Surge`
--

DROP TABLE IF EXISTS `Surge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Surge` (
  `IdOrden` int(11) NOT NULL,
  `IdEntrega` int(11) NOT NULL,
  PRIMARY KEY (`IdOrden`),
  KEY `IdEntrega` (`IdEntrega`),
  CONSTRAINT `Surge_ibfk_1` FOREIGN KEY (`IdOrden`) REFERENCES `Compras` (`IdOrden`),
  CONSTRAINT `Surge_ibfk_2` FOREIGN KEY (`IdEntrega`) REFERENCES `Despacho` (`IdEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Surge`
--

LOCK TABLES `Surge` WRITE;
/*!40000 ALTER TABLE `Surge` DISABLE KEYS */;
/*!40000 ALTER TABLE `Surge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarjeta`
--

DROP TABLE IF EXISTS `Tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tarjeta` (
  `IdMetodoPago` int(11) NOT NULL,
  `IdTarjeta` int(11) NOT NULL,
  PRIMARY KEY (`IdMetodoPago`),
  UNIQUE KEY `IdTarjeta` (`IdTarjeta`),
  CONSTRAINT `Tarjeta_ibfk_1` FOREIGN KEY (`IdMetodoPago`) REFERENCES `MetodoDePago` (`IdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjeta`
--

LOCK TABLES `Tarjeta` WRITE;
/*!40000 ALTER TABLE `Tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telefono` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`correo`,`Telefono`),
  CONSTRAINT `Telefono_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `Usuario` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiene`
--

DROP TABLE IF EXISTS `Tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tiene` (
  `CodProducto` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  PRIMARY KEY (`CodProducto`),
  KEY `IdCategoria` (`IdCategoria`),
  CONSTRAINT `Tiene_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `Producto` (`CodProducto`),
  CONSTRAINT `Tiene_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `Categoria` (`IdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiene`
--

LOCK TABLES `Tiene` WRITE;
/*!40000 ALTER TABLE `Tiene` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha_Nac` date NOT NULL,
  `Documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Calle` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numero` int(11) NOT NULL,
  `Esquina` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE KEY `Documento` (`Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utiliza`
--

DROP TABLE IF EXISTS `Utiliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utiliza` (
  `IdOrden` int(11) NOT NULL,
  `IdMetodoPago` int(11) NOT NULL,
  PRIMARY KEY (`IdOrden`),
  KEY `IdMetodoPago` (`IdMetodoPago`),
  CONSTRAINT `Utiliza_ibfk_1` FOREIGN KEY (`IdOrden`) REFERENCES `Compras` (`IdOrden`),
  CONSTRAINT `Utiliza_ibfk_2` FOREIGN KEY (`IdMetodoPago`) REFERENCES `MetodoDePago` (`IdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utiliza`
--

LOCK TABLES `Utiliza` WRITE;
/*!40000 ALTER TABLE `Utiliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `Utiliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vende`
--

DROP TABLE IF EXISTS `Vende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vende` (
  `IdCarrito` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL,
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdCarrito`,`CodProducto`),
  KEY `CodProducto` (`CodProducto`),
  KEY `correo` (`correo`),
  CONSTRAINT `Vende_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `Producto` (`CodProducto`),
  CONSTRAINT `Vende_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `vendedor` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vende`
--

LOCK TABLES `Vende` WRITE;
/*!40000 ALTER TABLE `Vende` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `correo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdVendedor` int(11) NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE KEY `IdVendedor` (`IdVendedor`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `Usuario` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 14:52:28
