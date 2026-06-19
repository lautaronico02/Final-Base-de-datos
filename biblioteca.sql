CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `categoría`
--

DROP TABLE IF EXISTS `categoría`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoría` (
  `Id_Categoría` int NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(55) NOT NULL,
  PRIMARY KEY (`Id_Categoría`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoría`
--

LOCK TABLES `categoría` WRITE;
/*!40000 ALTER TABLE `categoría` DISABLE KEYS */;
INSERT INTO `categoría` VALUES (1,'Novela'),(2,'Infantil'),(3,'Histórica'),(4,'Ciencia Ficción'),(5,'Romance'),(6,'Aventura'),(7,'Terror'),(8,'Biografía'),(9,'Filosofía'),(10,'Poesía');
/*!40000 ALTER TABLE `categoría` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `Id_Editorial` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(55) NOT NULL,
  `País` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`Id_Editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Editorial Sudamericana',NULL),(2,'Anaya',NULL),(3,'Reynal & Hitchcock',NULL),(4,'Alianza Editorial',NULL),(5,'Planeta',NULL),(6,'Simon & Schuster',NULL),(7,'Penguin Random House',NULL),(8,'HarperCollins',NULL),(9,'Ediciones Salamandra',NULL),(10,'Tusquets Editores',NULL);
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(55) NOT NULL,
  `Apellido` varchar(55) NOT NULL,
  `Cargo` varchar(55) NOT NULL,
  `Fecha_Contratación` date NOT NULL,
  PRIMARY KEY (`Id_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Mariana','Gómez','Bibliotecaria','2018-03-15'),(2,'Lucas','Fernández','Asistente de Sala','2019-07-22'),(3,'Carolina','Martínez','Encargada de Préstamos','2020-01-10'),(4,'Julián','Pereyra','Catalogador','2021-04-05'),(5,'Natalia','Ríos','Auxiliar Administrativo','2022-09-30'),(6,'Diego','Morales','Conservador','2017-11-12'),(7,'Romina','Santos','Bibliotecaria','2019-02-18'),(8,'Santiago','López','Técnico en Archivo','2020-08-25'),(9,'Florencia','Díaz','Recepcionista','2023-01-03'),(10,'Martín','Castro','Director','2016-06-20');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trReasignarPrestamosEmpleado` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
    UPDATE prestamos
    SET Estado = 'Reasignado'
    WHERE Id_Empleado = OLD.Id_Empleado;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `Id_Libros` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(55) NOT NULL,
  `ISBN` varchar(55) NOT NULL,
  `Año_Publicacion` varchar(4) NOT NULL,
  `Id_Editorial` int NOT NULL,
  `Cantidad_Disponible` int NOT NULL,
  `Id_Categoria` int NOT NULL,
  PRIMARY KEY (`Id_Libros`),
  KEY `fk_editorial_idx` (`Id_Editorial`),
  KEY `fk_categoria_idx` (`Id_Categoria`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoría` (`Id_Categoría`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_editorial` FOREIGN KEY (`Id_Editorial`) REFERENCES `editorial` (`Id_Editorial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (32,'Cien años de soledad','9780307474728','1967',1,5,1),(33,'Don Quijote de la Mancha','9788491050297','1605',2,3,1),(34,'El principito','9780156012195','1943',3,8,2),(35,'Rayuela','9788437604947','1963',4,7,1),(36,'La sombra del viento','9788408172178','2001',5,4,3),(37,'Fahrenheit 451','9781451673319','1953',6,7,4),(38,'Crónica de una muerte anunciada','9781400034956','1981',1,5,1),(39,'1984','9780451524935','1949',6,8,4),(40,'El amor en los tiempos del cólera','9780307389732','1985',1,6,5),(41,'Los pilares de la tierra','9780451225245','1989',7,4,3);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TrEliminarPrestamosLibro` BEFORE DELETE ON `libros` FOR EACH ROW BEGIN
    DELETE FROM prestamos 
    WHERE Id_Libros = OLD.Id_Libros;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `Id_Préstamo` int NOT NULL AUTO_INCREMENT,
  `Id_Libros` int NOT NULL,
  `Id_Socio` int NOT NULL,
  `Id_Empleado` int NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date DEFAULT NULL,
  `Estado` varchar(55) NOT NULL,
  PRIMARY KEY (`Id_Préstamo`),
  KEY `fk_libro_idx` (`Id_Libros`),
  KEY `fk_socio_idx` (`Id_Socio`),
  KEY `fk_empleado_idx` (`Id_Empleado`),
  CONSTRAINT `Id_Empleado` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Id_Libros` FOREIGN KEY (`Id_Libros`) REFERENCES `libros` (`Id_Libros`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Id_Socio` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (71,32,3,2,'2024-12-10','2024-12-20','Devuelto'),(73,34,6,3,'2025-02-05','2025-02-19','Devuelto'),(74,35,8,4,'2025-03-10','2025-11-10','Devuelto'),(75,36,2,7,'2025-04-01','2025-04-15','Devuelto'),(76,37,9,6,'2025-05-12','2025-05-26','Devuelto'),(77,38,10,1,'2025-06-03','2025-11-03','Devuelto'),(80,41,7,10,'2025-09-20',NULL,'En préstamo'),(81,39,5,3,'2025-10-04',NULL,'Activo');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `Id_Socios` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(55) NOT NULL,
  `Apellido` varchar(55) NOT NULL,
  `Direccion` varchar(55) NOT NULL,
  `Telefono` int DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `Fecha_Alta` date NOT NULL,
  PRIMARY KEY (`Id_Socios`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES (2,'Bruno','Pérez','Calle San Martín 845',1123456789,'bruno.perez@yahoo.com','2020-11-03'),(3,'Camila','Rodríguez','Mitre 672',1134567890,'camila.rodriguez@hotmail.com','2022-05-20'),(5,'Elena','Martínez','Belgrano 213',1167890123,'elena.martinez@gmail.com','2023-03-01'),(6,'Federico','Ramírez','Sarmiento 1560',1178901234,'federico.ramirez@gmail.com','2021-09-10'),(7,'Gabriela','García','Independencia 320',1189012345,'gabriela.garcia@gmail.com','2020-12-05'),(8,'Hernán','Torres','Perón 1888',1190123456,'hernan.torres@gmail.com','2022-08-16'),(9,'Isabel','Díaz','Las Heras 502',1101234567,'isabel.diaz@gmail.com','2023-01-27'),(10,'Joaquín','Fernández','Moreno 950',1112345678,'joaquin.fernandez@gmail.com','2021-06-14'),(11,'Carla','Paredes','Av. Belgrano 1550',1134442345,'carla.paredes@gmail.com','2025-11-09'),(12,'Ariel','Gonzalez','Av.Libertador 2111',1135453321,'GonzalezAriel99@gmail.com','2025-06-07'),(13,'Nico','Sanchez','calle falsa 123',223455631,'assad@gmail.com','2025-09-11');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trVerificarEmailUnico` BEFORE INSERT ON `socios` FOR EACH ROW BEGIN
    IF EXISTS (
    SELECT 1 FROM socios WHERE Email = NEW.Email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el email ya está registrado para otro socio.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vistalibrosmasprestados`
--

DROP TABLE IF EXISTS `vistalibrosmasprestados`;
/*!50001 DROP VIEW IF EXISTS `vistalibrosmasprestados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistalibrosmasprestados` AS SELECT 
 1 AS `Id_Libros`,
 1 AS `Titulo`,
 1 AS `Cantidad_Prestamos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaprestamosactivos`
--

DROP TABLE IF EXISTS `vistaprestamosactivos`;
/*!50001 DROP VIEW IF EXISTS `vistaprestamosactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaprestamosactivos` AS SELECT 
 1 AS `Id_Préstamo`,
 1 AS `Nombre_Socio`,
 1 AS `Apellido_Socio`,
 1 AS `Libro`,
 1 AS `Empleado`,
 1 AS `ApellidoEmpleado`,
 1 AS `Fecha_Prestamo`,
 1 AS `Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistastockporcategoria`
--

DROP TABLE IF EXISTS `vistastockporcategoria`;
/*!50001 DROP VIEW IF EXISTS `vistastockporcategoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistastockporcategoria` AS SELECT 
 1 AS `Categoria`,
 1 AS `Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!50003 DROP FUNCTION IF EXISTS `CantidadPrestamosLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CantidadPrestamosLibro`(
p_Id_Libro INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad 
    FROM prestamos 
    WHERE Id_Libros = p_Id_Libro;
    RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Dias_Prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Dias_Prestamo`(
p_Id_Prestamo INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE dias INT;
    SELECT DATEDIFF(Fecha_Devolucion, Fecha_Prestamo) INTO dias
    FROM prestamos 
    WHERE Id_Préstamo = p_Id_Prestamo;
    RETURN dias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LibrosPorEditorial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LibrosPorEditorial`(
    p_Id_Editorial INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM libros
    WHERE Id_Editorial = p_Id_Editorial;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PromedioPrestamoLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PromedioPrestamoLibro`(
p_Id_Libro INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE totalPrestamos INT;
    DECLARE promedio DECIMAL(10,2);
	
	-- Cuenta los préstamos del libro.
	SELECT COUNT(*) INTO totalPrestamos
	FROM prestamos
	WHERE Id_Libros = p_Id_Libro;
    
    -- Cuenta el promedio (Prestamos / total de libros)
    SELECT totalPrestamos / COUNT(*) INTO promedio
    FROM libros;
    
    RETURN promedio;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEstadoPrestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEstadoPrestamo`(
	IN p_Id_Prestamo INT,
	IN p_NuevoEstado VARCHAR(20),
	IN p_Fecha_Devolucion DATE
)
BEGIN
	DECLARE v_Id_Libros INT;

	SELECT Id_Libros INTO v_Id_Libros
	FROM prestamos
	WHERE Id_Préstamo = p_Id_Prestamo;

	UPDATE prestamos
	SET Estado = p_NuevoEstado,
		Fecha_Devolucion = p_Fecha_Devolucion
	WHERE Id_Préstamo = p_Id_Prestamo;

	IF p_NuevoEstado = 'Devuelto' OR p_NuevoEstado = 'devuelto' THEN
		UPDATE libros
		SET Cantidad_Disponible = Cantidad_Disponible + 1
		WHERE Id_Libros = v_Id_Libros;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarSocioYPrestamos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSocioYPrestamos`(
    IN p_Id_Socio INT
)
BEGIN
    DECLARE v_Activos INT DEFAULT 0;
    DECLARE v_Eliminados INT DEFAULT 0;
    DECLARE v_Nombre VARCHAR(55);
    DECLARE v_Apellido VARCHAR(55);

    /* Iniciamos todo junto para que no se generen inconsistencias. */
    START TRANSACTION;

    /* Guardamos las variables temporales para luego mostrarlo al finalizar. */
    SELECT Nombre, Apellido
    INTO v_Nombre, v_Apellido
    FROM socios
    WHERE Id_Socios = p_Id_Socio;

    /* Verificamos que el socio a eliminar no tenga préstamos activos, sino, no lo permitimos. */
    SELECT COUNT(*) INTO v_Activos
    FROM prestamos
    WHERE Id_Socio = p_Id_Socio AND Estado <> 'Devuelto';

    IF v_Activos > 0 THEN
        ROLLBACK; /* No permitimos que se realice la parte superior de la transacción completa. */
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El socio tiene préstamos activos, no se puede eliminar';
    ELSE
        /* Borramos los préstamos devueltos del socio a eliminar. */
        DELETE FROM prestamos
        WHERE Id_Socio = p_Id_Socio;

        SET v_Eliminados = ROW_COUNT(); /* Guardamos la cantidad de préstamos eliminados para luego mostrarlos. */

        /* Borramos el socio. */
        DELETE FROM socios
        WHERE Id_Socios = p_Id_Socio;

        /* Confirmamos. */
        COMMIT;

        /* Mostramos socio y sus préstamos eliminados. */
        SELECT CONCAT('Socio eliminado: ', v_Nombre, ' ', v_Apellido) AS Socio,
        CONCAT('Préstamo(s) eliminado(s): ', v_Eliminados) AS Resumen;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarNuevoSocio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarNuevoSocio`(
	IN p_Nombre VARCHAR(55),
	IN p_Apellido VARCHAR(55),
	IN p_Direccion VARCHAR(55),
	IN p_Telefono VARCHAR(20),
	IN p_Email VARCHAR(55),
	IN p_Fecha_Alta DATE
)
BEGIN
	DECLARE email_existe INT DEFAULT 0;

	-- Verificar si ya existe el e-mail.
	SELECT COUNT(*) INTO email_existe
	FROM socios
	WHERE Email = p_Email;

	-- Si no existe, ingresamos el nuevo socio.
	IF email_existe = 0 THEN
		INSERT INTO socios (Nombre, Apellido, Direccion, Telefono, Email, Fecha_Alta)
		VALUES (p_Nombre, p_Apellido, p_Direccion, p_Telefono, p_Email, p_Fecha_Alta);
	ELSE
		-- Si el e-mail ya existe en la tabla, mostramos el error.
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Ya existe socio con dicho E-mail';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPrestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPrestamo`(
	IN p_Id_Libros INT,
	IN p_Id_Socio INT,
	IN p_Id_Empleado INT,
	IN p_Fecha_Prestamo date
)
BEGIN
	DECLARE cantidad_actual INT;
    -- Verificar cantidad disponible de libro.
	SELECT Cantidad_Disponible INTO cantidad_actual
	FROM libros
	WHERE Id_Libros = p_Id_Libros;

	IF cantidad_actual > 0 THEN
		-- Insertar el nuevo préstamo.
		INSERT INTO prestamos(Id_Libros, Id_Socio, Id_Empleado, Fecha_Prestamo, Estado)
		VALUES (p_Id_Libros, p_Id_Socio, p_Id_Empleado, p_Fecha_Prestamo, "Activo");

		UPDATE libros
        -- Reducir cantidad disponible del libro prestado.
		SET Cantidad_Disponible = Cantidad_Disponible - 1
		WHERE Id_Libros = p_Id_Libros;

	ELSE
    -- Mostrar mensaje de error si no hay ejemplares para prestar.
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "No hay ejemplares disponibles para dicho libro";
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vistalibrosmasprestados`
--

/*!50001 DROP VIEW IF EXISTS `vistalibrosmasprestados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistalibrosmasprestados` AS select `l`.`Id_Libros` AS `Id_Libros`,`l`.`Titulo` AS `Titulo`,count(`p`.`Id_Préstamo`) AS `Cantidad_Prestamos` from (`libros` `l` left join `prestamos` `p` on((`l`.`Id_Libros` = `p`.`Id_Libros`))) group by `l`.`Id_Libros`,`l`.`Titulo` order by `Cantidad_Prestamos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaprestamosactivos`
--

/*!50001 DROP VIEW IF EXISTS `vistaprestamosactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaprestamosactivos` AS select `p`.`Id_Préstamo` AS `Id_Préstamo`,`s`.`Nombre` AS `Nombre_Socio`,`s`.`Apellido` AS `Apellido_Socio`,`l`.`Titulo` AS `Libro`,`e`.`Nombre` AS `Empleado`,`e`.`Apellido` AS `ApellidoEmpleado`,`p`.`Fecha_Prestamo` AS `Fecha_Prestamo`,`p`.`Estado` AS `Estado` from (((`prestamos` `p` join `socios` `s` on((`p`.`Id_Socio` = `s`.`Id_Socios`))) join `libros` `l` on((`p`.`Id_Libros` = `l`.`Id_Libros`))) join `empleados` `e` on((`p`.`Id_Empleado` = `e`.`Id_Empleado`))) where (`p`.`Estado` <> 'Devuelto') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistastockporcategoria`
--

/*!50001 DROP VIEW IF EXISTS `vistastockporcategoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistastockporcategoria` AS select `c`.`Nombre_Categoria` AS `Categoria`,sum(`l`.`Cantidad_Disponible`) AS `Stock` from (`libros` `l` join `categoría` `c` on((`l`.`Id_Categoria` = `c`.`Id_Categoría`))) group by `c`.`Nombre_Categoria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-12  2:15:53
