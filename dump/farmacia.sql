CREATE DATABASE  IF NOT EXISTS `farmacia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farmacia`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacia
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ref_alteracao`
--

DROP TABLE IF EXISTS `ref_alteracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_alteracao` (
  `id_alteracao` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_alteracao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_alteracao`),
  UNIQUE KEY `nome_alteracao_UNIQUE` (`nome_alteracao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_alteracao`
--

LOCK TABLES `ref_alteracao` WRITE;
/*!40000 ALTER TABLE `ref_alteracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_alteracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_classificacao_produto`
--

DROP TABLE IF EXISTS `ref_classificacao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_classificacao_produto` (
  `id_classificacao_produto` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_classificacao_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_classificacao_produto`),
  UNIQUE KEY `nome_classificacao_produto_UNIQUE` (`nome_classificacao_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_classificacao_produto`
--

LOCK TABLES `ref_classificacao_produto` WRITE;
/*!40000 ALTER TABLE `ref_classificacao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_classificacao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_genero`
--

DROP TABLE IF EXISTS `ref_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_genero` (
  `id_genero` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_genero` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `nome_genero_UNIQUE` (`nome_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_genero`
--

LOCK TABLES `ref_genero` WRITE;
/*!40000 ALTER TABLE `ref_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_situacao_usuario`
--

DROP TABLE IF EXISTS `ref_situacao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_situacao_usuario` (
  `id_situacao_usuario` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_situacao_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_situacao_usuario`),
  UNIQUE KEY `nome_situacao_usuario_UNIQUE` (`nome_situacao_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_situacao_usuario`
--

LOCK TABLES `ref_situacao_usuario` WRITE;
/*!40000 ALTER TABLE `ref_situacao_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_situacao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_tarja_produto`
--

DROP TABLE IF EXISTS `ref_tarja_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_tarja_produto` (
  `id_tarja_produto` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tarja_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tarja_produto`),
  UNIQUE KEY `nome_tarja_produto_UNIQUE` (`nome_tarja_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_tarja_produto`
--

LOCK TABLES `ref_tarja_produto` WRITE;
/*!40000 ALTER TABLE `ref_tarja_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_tarja_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_tipo_movimentacao`
--

DROP TABLE IF EXISTS `ref_tipo_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_tipo_movimentacao` (
  `id_tipo_movimentacao` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tipo_movimentacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_movimentacao`),
  UNIQUE KEY `ref_tipo_movimentacaocol_UNIQUE` (`nome_tipo_movimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_tipo_movimentacao`
--

LOCK TABLES `ref_tipo_movimentacao` WRITE;
/*!40000 ALTER TABLE `ref_tipo_movimentacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_tipo_movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_tipo_usuario`
--

DROP TABLE IF EXISTS `ref_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_tipo_usuario` (
  `id_tipo_usuario` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `nome_tipo_usuario_UNIQUE` (`nome_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_tipo_usuario`
--

LOCK TABLES `ref_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `ref_tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cidade` (
  `id_cidade` int unsigned NOT NULL AUTO_INCREMENT,
  `uf_cidade` char(2) NOT NULL,
  `nome_cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `idx_nome_cidade` (`nome_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_cidade` int unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `cep_endereco` char(8) NOT NULL,
  `logradouro_endereco` varchar(150) NOT NULL,
  `numero_endereco` varchar(10) NOT NULL,
  `complemento_endereco` varchar(50) DEFAULT NULL,
  `bairro_endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_tb_endereco_ref_cidade_idx` (`fk_cidade`),
  KEY `fk_tb_endereco_tb_usuario1_idx` (`fk_usuario`),
  CONSTRAINT `fk_tb_endereco_ref_cidade` FOREIGN KEY (`fk_cidade`) REFERENCES `tb_cidade` (`id_cidade`),
  CONSTRAINT `fk_tb_endereco_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_historico`
--

DROP TABLE IF EXISTS `tb_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_historico` (
  `id_historico` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_alteracao` tinyint unsigned NOT NULL,
  `fk_tipo_movimentacao` tinyint unsigned NOT NULL,
  `fk_produto` bigint unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `quantidade_historico` int NOT NULL,
  `quantidade_movimentada_historico` int NOT NULL,
  `data_hora_historico` timestamp NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `fk_historico_produto1_idx` (`fk_produto`),
  KEY `fk_tb_historico_ref_alteracao1_idx` (`fk_alteracao`),
  KEY `fk_tb_historico_tb_usuario1_idx` (`fk_usuario`),
  KEY `fk_tb_historico_ref_tipo_movimentacao1_idx` (`fk_tipo_movimentacao`),
  KEY `idx_tb_historico_data_hora` (`data_hora_historico`),
  KEY `idx_tb_historico_data_produto` (`data_hora_historico`,`fk_produto`),
  CONSTRAINT `fk_historico_produto1` FOREIGN KEY (`fk_produto`) REFERENCES `tb_produto` (`id_produto`),
  CONSTRAINT `fk_tb_historico_ref_alteracao1` FOREIGN KEY (`fk_alteracao`) REFERENCES `ref_alteracao` (`id_alteracao`),
  CONSTRAINT `fk_tb_historico_ref_tipo_movimentacao1` FOREIGN KEY (`fk_tipo_movimentacao`) REFERENCES `ref_tipo_movimentacao` (`id_tipo_movimentacao`),
  CONSTRAINT `fk_tb_historico_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_historico`
--

LOCK TABLES `tb_historico` WRITE;
/*!40000 ALTER TABLE `tb_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produto` (
  `id_produto` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_classificacao_produto` tinyint unsigned NOT NULL,
  `fk_tarja_produto` tinyint unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `quantidade_produto` int NOT NULL,
  `preco_produto` decimal(15,2) NOT NULL,
  `data_fabricacao_produto` date NOT NULL,
  `data_validade_produto` date NOT NULL,
  `nome_produto` varchar(200) NOT NULL,
  `fabricante_produto` varchar(100) NOT NULL,
  `descricao_produto` text NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tb_produto_ref_classificacao_produto1_idx` (`fk_classificacao_produto`),
  KEY `fk_tb_produto_ref_tarja_produto1_idx` (`fk_tarja_produto`),
  KEY `fk_tb_produto_tb_usuario1_idx` (`fk_usuario`),
  KEY `idx_tb_produto_nome_produto` (`nome_produto`),
  CONSTRAINT `fk_tb_produto_ref_classificacao_produto1` FOREIGN KEY (`fk_classificacao_produto`) REFERENCES `ref_classificacao_produto` (`id_classificacao_produto`),
  CONSTRAINT `fk_tb_produto_ref_tarja_produto1` FOREIGN KEY (`fk_tarja_produto`) REFERENCES `ref_tarja_produto` (`id_tarja_produto`),
  CONSTRAINT `fk_tb_produto_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `cpf_usuario` char(11) NOT NULL,
  `fk_situacao_usuario` tinyint unsigned NOT NULL,
  `fk_genero` tinyint unsigned NOT NULL,
  `nome_usuario` varchar(45) NOT NULL,
  `sobrenome_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `telefone_usuario` varchar(19) NOT NULL,
  PRIMARY KEY (`cpf_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email_usuario`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone_usuario`),
  KEY `fk_tb_usuario_ref_genero1_idx` (`fk_genero`),
  KEY `fk_tb_usuario_ref_situacao_usuario1_idx` (`fk_situacao_usuario`),
  CONSTRAINT `fk_tb_usuario_ref_genero1` FOREIGN KEY (`fk_genero`) REFERENCES `ref_genero` (`id_genero`),
  CONSTRAINT `fk_tb_usuario_ref_situacao_usuario1` FOREIGN KEY (`fk_situacao_usuario`) REFERENCES `ref_situacao_usuario` (`id_situacao_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario_has_ref_tipo_usuario`
--

DROP TABLE IF EXISTS `tb_usuario_has_ref_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario_has_ref_tipo_usuario` (
  `ref_tipo_usuario_id_tipo_usuario` tinyint unsigned NOT NULL,
  `tb_usuario_cpf_usuario` char(11) NOT NULL,
  PRIMARY KEY (`ref_tipo_usuario_id_tipo_usuario`,`tb_usuario_cpf_usuario`),
  KEY `fk_tb_usuario_has_ref_tipo_usuario_ref_tipo_usuario1_idx` (`ref_tipo_usuario_id_tipo_usuario`),
  KEY `fk_tb_usuario_has_ref_tipo_usuario_tb_usuario1_idx` (`tb_usuario_cpf_usuario`),
  CONSTRAINT `fk_tb_usuario_has_ref_tipo_usuario_ref_tipo_usuario1` FOREIGN KEY (`ref_tipo_usuario_id_tipo_usuario`) REFERENCES `ref_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `fk_tb_usuario_has_ref_tipo_usuario_tb_usuario1` FOREIGN KEY (`tb_usuario_cpf_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario_has_ref_tipo_usuario`
--

LOCK TABLES `tb_usuario_has_ref_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario_has_ref_tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuario_has_ref_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-09 16:07:53
