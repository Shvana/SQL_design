
-- Shvana
-- Host: localhost    Database: ms_db
-- ------------------------------------------------------
-- Server version	8.0.23
--
-- Table structure for table `album_tb`
--

DROP TABLE IF EXISTS `album_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_tb` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(100) NOT NULL,
  `album_year` date NOT NULL,
  `album_format` varchar(9) NOT NULL,
  `album_price` decimal(3,0) NOT NULL,
  `id_label` int NOT NULL,
  PRIMARY KEY (`id_album`,`album_format`),
  KEY `label_idx` (`id_label`),
  CONSTRAINT `label` FOREIGN KEY (`id_label`) REFERENCES `label_tb` (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_tb`
--

LOCK TABLES `album_tb` WRITE;
/*!40000 ALTER TABLE `album_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art` (
  `id_artist` int NOT NULL AUTO_INCREMENT,
  `art_type` varchar(3) NOT NULL,
  `art_id` int NOT NULL,
  `art_name` varchar(60) NOT NULL,
  `art_lts` varchar(60) NOT NULL,
  `id_nationality` int NOT NULL,
  PRIMARY KEY (`id_artist`),
  UNIQUE KEY `art_id_UNIQUE` (`art_id`),
  KEY `nat_idx` (`id_nationality`),
  CONSTRAINT `national` FOREIGN KEY (`id_nationality`) REFERENCES `nation` (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_det`
--

DROP TABLE IF EXISTS `bill_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_det` (
  `id_bill` int NOT NULL,
  `id_album` int NOT NULL,
  `bill_amount` int NOT NULL,
  KEY `bill_idx` (`id_bill`),
  KEY `album_idx` (`id_album`),
  CONSTRAINT `album2` FOREIGN KEY (`id_album`) REFERENCES `album_tb` (`id_album`),
  CONSTRAINT `bill` FOREIGN KEY (`id_bill`) REFERENCES `bill_tb` (`id_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_det`
--

LOCK TABLES `bill_det` WRITE;
/*!40000 ALTER TABLE `bill_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_tb`
--

DROP TABLE IF EXISTS `bill_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_tb` (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `bill_cod_bill` varchar(10) NOT NULL,
  `bill_date` timestamp NOT NULL,
  `id_clients` int NOT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `clients_idx` (`id_clients`),
  CONSTRAINT `clients` FOREIGN KEY (`id_clients`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_tb`
--

LOCK TABLES `bill_tb` WRITE;
/*!40000 ALTER TABLE `bill_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `client_type` varchar(3) NOT NULL,
  `client_id` int NOT NULL,
  `client_name` varchar(60) NOT NULL,
  `client_lts` varchar(60) NOT NULL,
  `id_nationality` int NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`),
  KEY `nat_idx` (`id_nationality`),
  CONSTRAINT `nation` FOREIGN KEY (`id_nationality`) REFERENCES `nation` (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer_tb`
--

DROP TABLE IF EXISTS `composer_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composer_tb` (
  `id_composer` int NOT NULL AUTO_INCREMENT,
  `composer_id_type` varchar(3) NOT NULL,
  `composer_id` int NOT NULL,
  `composer_name` varchar(60) NOT NULL,
  `composer_lts_name` varchar(60) NOT NULL,
  `id_nationality` int NOT NULL,
  PRIMARY KEY (`id_composer`),
  UNIQUE KEY `composer_id_UNIQUE` (`composer_id`),
  KEY `nat_idx` (`id_nationality`),
  CONSTRAINT `nat` FOREIGN KEY (`id_nationality`) REFERENCES `nation` (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer_tb`
--

LOCK TABLES `composer_tb` WRITE;
/*!40000 ALTER TABLE `composer_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `composer_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_tb`
--

DROP TABLE IF EXISTS `label_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `label_tb` (
  `id_label` int NOT NULL AUTO_INCREMENT,
  `label_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_tb`
--

LOCK TABLES `label_tb` WRITE;
/*!40000 ALTER TABLE `label_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lan_tb`
--

DROP TABLE IF EXISTS `lan_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lan_tb` (
  `id_language` int NOT NULL AUTO_INCREMENT,
  `language_location` varchar(75) NOT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lan_tb`
--

LOCK TABLES `lan_tb` WRITE;
/*!40000 ALTER TABLE `lan_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `lan_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_genre_tb`
--

DROP TABLE IF EXISTS `m_genre_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_genre_tb` (
  `id_m_genre` int NOT NULL AUTO_INCREMENT,
  `m_genre_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id_m_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_genre_tb`
--

LOCK TABLES `m_genre_tb` WRITE;
/*!40000 ALTER TABLE `m_genre_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_genre_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nation` (
  `id_nationality` int NOT NULL AUTO_INCREMENT,
  `nation_type` varchar(60) NOT NULL,
  `nation_abb` varchar(2) NOT NULL,
  PRIMARY KEY (`id_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_alm_thm`
--

DROP TABLE IF EXISTS `rel_alm_thm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_alm_thm` (
  `id_theme` int NOT NULL,
  `id_album` int NOT NULL,
  KEY `theme_idx` (`id_theme`),
  KEY `album_idx` (`id_album`),
  CONSTRAINT `album` FOREIGN KEY (`id_album`) REFERENCES `album_tb` (`id_album`),
  CONSTRAINT `theme` FOREIGN KEY (`id_theme`) REFERENCES `theme_tb` (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_alm_thm`
--

LOCK TABLES `rel_alm_thm` WRITE;
/*!40000 ALTER TABLE `rel_alm_thm` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_alm_thm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_tb`
--

DROP TABLE IF EXISTS `theme_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_tb` (
  `id_theme` int NOT NULL AUTO_INCREMENT,
  `theme_title` varchar(200) NOT NULL,
  `theme_lyrics` longtext NOT NULL,
  `id_language` int NOT NULL,
  `id_artist` int NOT NULL,
  `id_composer` int NOT NULL,
  `id_m_genre` int NOT NULL,
  `theme_tbcol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_theme`),
  UNIQUE KEY `theme_title_UNIQUE` (`theme_title`),
  KEY `art_idx` (`id_artist`),
  KEY `com_idx` (`id_composer`),
  KEY `lan_idx` (`id_language`),
  KEY `gen_idx` (`id_m_genre`),
  CONSTRAINT `art` FOREIGN KEY (`id_artist`) REFERENCES `art` (`id_artist`),
  CONSTRAINT `com` FOREIGN KEY (`id_composer`) REFERENCES `composer_tb` (`id_composer`),
  CONSTRAINT `gen` FOREIGN KEY (`id_m_genre`) REFERENCES `m_genre_tb` (`id_m_genre`),
  CONSTRAINT `lan` FOREIGN KEY (`id_language`) REFERENCES `lan_tb` (`id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_tb`
--

LOCK TABLES `theme_tb` WRITE;
/*!40000 ALTER TABLE `theme_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-07 22:26:34
