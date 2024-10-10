CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `idData` int NOT NULL,
  `Dia` int DEFAULT NULL,
  `Mês` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Datacol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idData`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_curso`
--

DROP TABLE IF EXISTS `dim_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_curso` (
  `idCurso` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Duração(anos)` int DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_curso`
--

LOCK TABLES `dim_curso` WRITE;
/*!40000 ALTER TABLE `dim_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_data`
--

DROP TABLE IF EXISTS `dim_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_data` (
  `idData` int NOT NULL,
  `Dia` int DEFAULT NULL,
  `Mês` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Datacol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idData`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_data`
--

LOCK TABLES `dim_data` WRITE;
/*!40000 ALTER TABLE `dim_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_departamento`
--

DROP TABLE IF EXISTS `dim_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_departamento` (
  `Id_Departamento` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Campus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_departamento`
--

LOCK TABLES `dim_departamento` WRITE;
/*!40000 ALTER TABLE `dim_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_disciplina`
--

DROP TABLE IF EXISTS `dim_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_disciplina` (
  `IdDisciplina` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Requisito` int NOT NULL,
  PRIMARY KEY (`IdDisciplina`),
  KEY `fk_DIM_Disciplina_DIM_Disciplina1_idx` (`Requisito`),
  CONSTRAINT `fk_DIM_Disciplina_DIM_Disciplina1` FOREIGN KEY (`Requisito`) REFERENCES `dim_disciplina` (`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_disciplina`
--

LOCK TABLES `dim_disciplina` WRITE;
/*!40000 ALTER TABLE `dim_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_professor`
--

DROP TABLE IF EXISTS `dim_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_professor` (
  `Id_Professor` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  PRIMARY KEY (`Id_Professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_professor`
--

LOCK TABLES `dim_professor` WRITE;
/*!40000 ALTER TABLE `dim_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fat_professor`
--

DROP TABLE IF EXISTS `fat_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fat_professor` (
  `SK_Professor` int NOT NULL,
  `DIM_Departamento_Id_Departamento` int NOT NULL,
  `Dim_Curso_idCurso` int NOT NULL,
  `DIM_Disciplina_IdDisciplina` int NOT NULL,
  `Data_idData` int NOT NULL,
  `Carga_Horária` int DEFAULT NULL,
  `Fat_Professorcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SK_Professor`,`DIM_Disciplina_IdDisciplina`),
  KEY `fk_FAt_Professor_DIM_Departamento_idx` (`DIM_Departamento_Id_Departamento`),
  KEY `fk_Fat_Professor_Dim_Curso1_idx` (`Dim_Curso_idCurso`),
  KEY `fk_Fat_Professor_DIM_Disciplina1_idx` (`DIM_Disciplina_IdDisciplina`),
  KEY `fk_Fat_Professor_Data1_idx` (`Data_idData`),
  CONSTRAINT `fk_Fat_Professor_Data1` FOREIGN KEY (`Data_idData`) REFERENCES `data` (`idData`),
  CONSTRAINT `fk_Fat_Professor_Dim_Curso1` FOREIGN KEY (`Dim_Curso_idCurso`) REFERENCES `dim_curso` (`idCurso`),
  CONSTRAINT `fk_FAt_Professor_DIM_Departamento` FOREIGN KEY (`DIM_Departamento_Id_Departamento`) REFERENCES `dim_departamento` (`Id_Departamento`),
  CONSTRAINT `fk_Fat_Professor_DIM_Disciplina1` FOREIGN KEY (`DIM_Disciplina_IdDisciplina`) REFERENCES `dim_disciplina` (`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fat_professor`
--

LOCK TABLES `fat_professor` WRITE;
/*!40000 ALTER TABLE `fat_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fat_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-10  2:59:47
