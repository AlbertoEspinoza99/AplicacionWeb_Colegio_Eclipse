-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: instituto_2022_4fn
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `tb_acceso`
--

DROP TABLE IF EXISTS `tb_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_acceso` (
  `cod_men` int NOT NULL,
  `cod_usu` int NOT NULL,
  PRIMARY KEY (`cod_men`,`cod_usu`),
  KEY `cod_usu` (`cod_usu`),
  CONSTRAINT `tb_acceso_ibfk_1` FOREIGN KEY (`cod_men`) REFERENCES `tb_menu` (`cod_men`),
  CONSTRAINT `tb_acceso_ibfk_2` FOREIGN KEY (`cod_usu`) REFERENCES `tb_usuario` (`cod_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acceso`
--

LOCK TABLES `tb_acceso` WRITE;
/*!40000 ALTER TABLE `tb_acceso` DISABLE KEYS */;
INSERT INTO `tb_acceso` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2),(2,3),(4,3),(1,4),(3,4);
/*!40000 ALTER TABLE `tb_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bien`
--

DROP TABLE IF EXISTS `tb_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_bien` (
  `cod_bien` int NOT NULL AUTO_INCREMENT,
  `des_bien` varchar(90) DEFAULT NULL,
  `cod_tipo_bien` int DEFAULT NULL,
  PRIMARY KEY (`cod_bien`),
  KEY `FK02` (`cod_tipo_bien`),
  CONSTRAINT `FK02` FOREIGN KEY (`cod_tipo_bien`) REFERENCES `tb_tipo_bien` (`cod_tipo_bien`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bien`
--

LOCK TABLES `tb_bien` WRITE;
/*!40000 ALTER TABLE `tb_bien` DISABLE KEYS */;
INSERT INTO `tb_bien` VALUES (1,'Nevera',1),(2,'Lavadora',1),(3,'Termo',1),(4,'Sofá',1),(5,'Silla',1),(6,'Televisor',1),(7,'Mesa',1),(8,'Patinete',1),(9,'Bicicleta',1),(10,'Automóvil',1),(11,'Cuadros',1),(12,'Ordenador',1),(13,'Teléfono Móvil',1),(14,'Refrigerador',1),(15,'Aire acondicionado',1),(16,'Microondas',1),(17,'Licuadora',1),(18,'Silla',1),(19,'Escritorio',1),(20,'Zapatillas	',1),(21,'Medias',1),(22,'Chaqueta',1),(23,'Guantes',1),(24,'Pantalón',1),(25,'Camisa',1),(26,'Cinturón',1),(27,'Blusa',1),(28,'Cuchillo',1),(29,'Cuchara',1),(30,'Tenedor',1),(31,'Vaso',1),(32,'Jarra',1),(33,'Plato',1),(34,'Libro',1),(35,'Cuaderno',1),(36,'Lápiz',1),(37,'Regla',1),(38,'Compás',1),(39,'Goma de borrar',1),(40,'Casa',2),(41,'Piso',2),(42,'Apartamento',2),(43,'Terreno',2),(44,'Fábrica',2),(45,'Edificio',2),(46,'Garaje',2),(47,'Títulos de propiedad',2);
/*!40000 ALTER TABLE `tb_bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_condicion`
--

DROP TABLE IF EXISTS `tb_condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_condicion` (
  `cod_condi` int NOT NULL AUTO_INCREMENT,
  `nom_condi` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cod_condi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_condicion`
--

LOCK TABLES `tb_condicion` WRITE;
/*!40000 ALTER TABLE `tb_condicion` DISABLE KEYS */;
INSERT INTO `tb_condicion` VALUES (1,'Nombrado'),(2,'Contratado'),(3,'Por Horas'),(4,'Bolsa');
/*!40000 ALTER TABLE `tb_condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_requerimiento`
--

DROP TABLE IF EXISTS `tb_detalle_requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_detalle_requerimiento` (
  `cod_reque` int DEFAULT NULL,
  `cod_bien` int DEFAULT NULL,
  `can` int DEFAULT NULL,
  KEY `FK03` (`cod_reque`),
  KEY `FK05` (`cod_bien`),
  CONSTRAINT `FK03` FOREIGN KEY (`cod_reque`) REFERENCES `tb_requerimiento` (`cod_reque`),
  CONSTRAINT `FK05` FOREIGN KEY (`cod_bien`) REFERENCES `tb_bien` (`cod_bien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_requerimiento`
--

LOCK TABLES `tb_detalle_requerimiento` WRITE;
/*!40000 ALTER TABLE `tb_detalle_requerimiento` DISABLE KEYS */;
INSERT INTO `tb_detalle_requerimiento` VALUES (4,1,2),(6,1,2),(7,1,2);
/*!40000 ALTER TABLE `tb_detalle_requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_docente`
--

DROP TABLE IF EXISTS `tb_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_docente` (
  `cod_doc` int NOT NULL AUTO_INCREMENT,
  `nom_doc` varchar(30) DEFAULT NULL,
  `pat_doc` varchar(30) DEFAULT NULL,
  `mat_doc` varchar(30) DEFAULT NULL,
  `sex_doc` varchar(15) DEFAULT NULL,
  `num_hijo_doc` int DEFAULT NULL,
  `sue_doc` double DEFAULT NULL,
  `cod_condi_doc` int DEFAULT NULL,
  PRIMARY KEY (`cod_doc`),
  KEY `fk_01` (`cod_condi_doc`),
  CONSTRAINT `fk_01` FOREIGN KEY (`cod_condi_doc`) REFERENCES `tb_condicion` (`cod_condi`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_docente`
--

LOCK TABLES `tb_docente` WRITE;
/*!40000 ALTER TABLE `tb_docente` DISABLE KEYS */;
INSERT INTO `tb_docente` VALUES (18,'Junior Alejandro','MEDINA','HUAMAN','Masculino',0,1500.8,1),(20,'Percy Antony','OLIVARES','RUEDA','Masculino',0,1500.8,1),(21,'Paola Lucila','PINEDO','DE PAZ','Masculino',0,1500.8,1),(22,'LUIS ALEJANDRO','PINEIRO','PAIVA','Masculino',0,1500.8,1),(23,'Yonathan Ismael','QUISPE','SARMIENTO','Masculino',0,1500.8,1),(24,'Richar Serafin','SARMIENTO','CUYUTUPA','Masculino',0,1500.8,1),(25,'Mauro Job','ZEGARRA','ORTIZ','Masculino',0,1500.8,1),(26,'Abraham','ACHING','ZARRIA','Masculino',0,1500.8,1),(27,'Josh Bertin Jesus','ANCAJIMA','MORA','Masculino',0,1500.8,1),(28,'Rolando Martin','BARRIENTOS','QUIROZ','Masculino',0,1500.8,1),(29,'Luis Alberto','CALDERÓN','ROMERO','Masculino',0,1500.8,1),(30,'Jose Junior','CARMEN','QUESQUEN','Masculino',0,1500.8,1),(31,'Camilo Claudio','CESPEDES','CIERTO','Masculino',0,1500.8,1),(32,'Wendy Dayann','CHAFALOTE','JARAMILLO','Masculino',0,1500.8,1),(33,'JesÚs Eduardo','CHAUCA','CRUZ','Masculino',0,1500.8,1),(34,'Gustavo Alfredo','CHIMOY','GARCÍA','Masculino',0,1500.8,1),(35,'GUILLERMO','CONDE','GUIZADA','Masculino',0,1500.8,1),(36,'Maury Dionicio','CORZO','TRANCA','Masculino',0,1500.8,1),(37,'Gerson Omar','COTRINA','SALDAÑA','Masculino',0,1500.8,1),(38,'ENRIQUEZ','GUTIERREZ','MALCA','Masculino',0,1500.8,1),(39,'Miryam Vilma','ESCARCENA','TECSI','Masculino',0,1500.8,1),(40,'Catherine Adelayda','FARFÁN','HUILLCA','Masculino',0,1500.8,1),(43,'sdfdsf','asd','asd','1',2,4,1),(44,'rodolfo','sdsd','asdasd','2',2,55,1),(45,'Miguelito','aasdads','asdds','Femenino',2,45,1),(46,'pruebi','CUADRA','FEBRES','Masculino',1,4,1),(47,'monona','CUADRA','FEBRES','Femenino',1,4,1),(48,'gaseosa','CUADRA','FEBRES','1',2,1,1),(49,'LoLogramos','yes','fds','1',2,1,1),(50,'semana','CUADRA','asdg','Femenino',2,4,1),(51,'moli','CUADRA','FEBRES','Femenino',2,4,1),(52,'DIALOFGO','CUADRA','FEBRES','Femenino',2,4,1),(53,'radio','CUADRA','FEBRES','Femenino',2,4,1),(54,'locccc','CUADRA','FEBRES','Femenino',2,4,1),(55,NULL,NULL,NULL,NULL,NULL,NULL,1),(56,NULL,NULL,NULL,NULL,NULL,NULL,1),(57,NULL,NULL,NULL,NULL,NULL,NULL,1),(58,NULL,NULL,NULL,NULL,NULL,NULL,1),(59,NULL,NULL,NULL,NULL,NULL,NULL,1),(60,'mari','CUADRA','FEBRES','Femenino',2,4,3),(63,'gaseosa','LEON','FEBRES','masculino',2,1500.8,1);
/*!40000 ALTER TABLE `tb_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_menu` (
  `cod_men` int NOT NULL AUTO_INCREMENT,
  `des_men` varchar(30) DEFAULT NULL,
  `url_men` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`cod_men`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'Docente','docente.jsp'),(2,'Alumno','alumno.jsp'),(3,'Distrito','distrito.jsp'),(4,'Requerimiento','requerimiento.jsp');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_requerimiento`
--

DROP TABLE IF EXISTS `tb_requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_requerimiento` (
  `cod_reque` int NOT NULL AUTO_INCREMENT,
  `num_reque` varchar(10) DEFAULT NULL,
  `nom_reque` varchar(30) DEFAULT NULL,
  `fec_reque` date DEFAULT NULL,
  `cod_usu` int DEFAULT NULL,
  `est_reque` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_reque`),
  UNIQUE KEY `num_reque_UNIQUE` (`num_reque`),
  KEY `FK04` (`cod_usu`),
  CONSTRAINT `FK04` FOREIGN KEY (`cod_usu`) REFERENCES `tb_usuario` (`cod_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_requerimiento`
--

LOCK TABLES `tb_requerimiento` WRITE;
/*!40000 ALTER TABLE `tb_requerimiento` DISABLE KEYS */;
INSERT INTO `tb_requerimiento` VALUES (4,'RE-00002','eytry','2023-05-03',1,'Iniciado'),(6,'RE-00003','kk','2023-05-03',1,'Iniciado'),(7,'RE-00004','pk','2023-05-03',1,'Iniciado');
/*!40000 ALTER TABLE `tb_requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_bien`
--

DROP TABLE IF EXISTS `tb_tipo_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_bien` (
  `cod_tipo_bien` int NOT NULL AUTO_INCREMENT,
  `des_tipo_bien` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_bien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_bien`
--

LOCK TABLES `tb_tipo_bien` WRITE;
/*!40000 ALTER TABLE `tb_tipo_bien` DISABLE KEYS */;
INSERT INTO `tb_tipo_bien` VALUES (1,'Muebles'),(2,'Inmuebles'),(3,'Tangibles'),(4,'Intangibles');
/*!40000 ALTER TABLE `tb_tipo_bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `cod_usu` int NOT NULL AUTO_INCREMENT,
  `log_usu` varchar(15) DEFAULT NULL,
  `pas_usu` varchar(15) DEFAULT NULL,
  `nom_usu` varchar(30) DEFAULT NULL,
  `ape_usu` varchar(50) DEFAULT NULL,
  `eda_usu` smallint DEFAULT NULL,
  `est_usu` char(1) DEFAULT NULL,
  `nom_rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'pepe','pepe','Juan','Perez Ayala',30,'1','JEFE'),(2,'maria','maria','Maria','Fernandez',28,'1','JEFE'),(3,'sonia','sonia','Sonia','Fabiola',35,'1','SUPERVISOR'),(4,'pedro','pedro','Pedro','Ayala',40,'1','A'),(5,'miguel','miguel','Miguel','Arias Soto',32,'1','B');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18  5:56:35
