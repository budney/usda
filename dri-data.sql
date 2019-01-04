-- MySQL dump 10.13  Distrib 5.7.22-22, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dietary_reference_intake
-- ------------------------------------------------------
-- Server version	5.7.22-22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `age_ranges`
--

DROP TABLE IF EXISTS `age_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_ranges` (
  `age_range_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age_from` int(10) unsigned NOT NULL,
  `age_to` int(10) unsigned NOT NULL,
  PRIMARY KEY (`age_range_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_ranges`
--

LOCK TABLES `age_ranges` WRITE;
/*!40000 ALTER TABLE `age_ranges` DISABLE KEYS */;
INSERT INTO `age_ranges` VALUES (1,1,3),(2,4,8),(3,9,13),(4,14,18),(5,19,30),(6,31,50),(7,51,70),(8,70,150);
/*!40000 ALTER TABLE `age_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_amounts`
--

DROP TABLE IF EXISTS `reference_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_amounts` (
  `reference_amount_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nutr_no` char(3) DEFAULT NULL,
  `tagname` char(20) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  PRIMARY KEY (`reference_amount_id`),
  UNIQUE KEY `tagname` (`tagname`,`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_amounts`
--

LOCK TABLES
    `reference_amounts` WRITE,
    `reference_amounts` AS `a` WRITE,
    `usda`.`nutr_def` AS `b` READ;

/*!40000 ALTER TABLE `reference_amounts` DISABLE KEYS */;
INSERT INTO `reference_amounts`(`reference_amount_id`,`tagname`,`amount`) VALUES (1,'ca',700.000),(2,'ca',1000.000),(4,'ca',1200.000),(3,'ca',1300.000),(129,'ca',2000.000),(127,'ca',2500.000),(128,'ca',3000.000),(5,'chocdf',130.000),(250,'chocdf',175.000),(196,'chocdf',210.000),(6,'choln',200.000),(7,'choln',250.000),(8,'choln',375.000),(9,'choln',400.000),(10,'choln',425.000),(251,'choln',450.000),(197,'choln',550.000),(130,'choln',1000.000),(131,'choln',2000.000),(132,'choln',3000.000),(133,'choln',3500.000),(11,'cu',0.340),(12,'cu',0.440),(13,'cu',0.700),(14,'cu',0.890),(15,'cu',0.900),(134,'cu',1.000),(198,'cu',1.300),(135,'cu',3.000),(136,'cu',5.000),(137,'cu',8.000),(138,'cu',10.000),(16,'f18d2',7.000),(17,'f18d2',10.000),(18,'f18d2',11.000),(19,'f18d2',12.000),(199,'f18d2',13.000),(223,'f18d2',14.000),(221,'f18d2',16.000),(222,'f18d2',17.000),(20,'f18d3cn3',0.700),(21,'f18d3cn3',0.900),(22,'f18d3cn3',1.000),(23,'f18d3cn3',1.100),(224,'f18d3cn3',1.200),(200,'f18d3cn3',1.300),(252,'f18d3cn3',1.400),(225,'f18d3cn3',1.600),(24,'fe',7.000),(26,'fe',8.000),(201,'fe',9.000),(25,'fe',10.000),(226,'fe',11.000),(27,'fe',15.000),(28,'fe',18.000),(253,'fe',27.000),(139,'fe',40.000),(140,'fe',45.000),(29,'fibtg',19.000),(32,'fibtg',21.000),(30,'fibtg',25.000),(31,'fibtg',26.000),(254,'fibtg',28.000),(202,'fibtg',29.000),(229,'fibtg',30.000),(227,'fibtg',31.000),(228,'fibtg',38.000),(33,'fld',700.000),(34,'fld',1000.000),(141,'fld',1300.000),(35,'fld',2000.000),(142,'fld',2200.000),(36,'fld',3000.000),(230,'fld',4000.000),(143,'fld',10000.000),(37,'fol',150.000),(38,'fol',200.000),(39,'fol',300.000),(40,'fol',400.000),(203,'fol',500.000),(144,'fol',600.000),(145,'fol',800.000),(146,'fol',1000.000),(41,'k',3000.000),(42,'k',3800.000),(43,'k',4500.000),(44,'k',4700.000),(204,'k',5100.000),(147,'mg',65.000),(45,'mg',80.000),(148,'mg',110.000),(46,'mg',130.000),(47,'mg',240.000),(49,'mg',310.000),(50,'mg',320.000),(149,'mg',350.000),(48,'mg',360.000),(232,'mg',400.000),(231,'mg',410.000),(233,'mg',420.000),(51,'mn',1.200),(52,'mn',1.500),(53,'mn',1.600),(54,'mn',1.800),(234,'mn',1.900),(150,'mn',2.000),(235,'mn',2.200),(236,'mn',2.300),(205,'mn',2.600),(151,'mn',3.000),(152,'mn',6.000),(153,'mn',9.000),(154,'mn',11.000),(55,'na',1000.000),(56,'na',1200.000),(58,'na',1300.000),(57,'na',1500.000),(155,'na',1900.000),(156,'na',2200.000),(157,'na',2300.000),(59,'nia',6.000),(60,'nia',8.000),(158,'nia',10.000),(61,'nia',12.000),(62,'nia',14.000),(159,'nia',15.000),(237,'nia',16.000),(206,'nia',17.000),(255,'nia',18.000),(160,'nia',20.000),(161,'nia',30.000),(162,'nia',35.000),(63,'p',460.000),(64,'p',500.000),(66,'p',700.000),(65,'p',1250.000),(163,'p',3000.000),(266,'p',3500.000),(164,'p',4000.000),(67,'pantac',2.000),(68,'pantac',3.000),(69,'pantac',4.000),(70,'pantac',5.000),(256,'pantac',6.000),(207,'pantac',7.000),(71,'procnt',13.000),(72,'procnt',19.000),(73,'procnt',34.000),(74,'procnt',46.000),(238,'procnt',52.000),(239,'procnt',56.000),(208,'procnt',71.000),(75,'ribf',0.500),(76,'ribf',0.600),(77,'ribf',0.900),(78,'ribf',1.000),(79,'ribf',1.100),(240,'ribf',1.300),(257,'ribf',1.400),(209,'ribf',1.600),(80,'se',20.000),(81,'se',30.000),(82,'se',40.000),(83,'se',55.000),(258,'se',60.000),(210,'se',70.000),(165,'se',90.000),(166,'se',150.000),(167,'se',280.000),(168,'se',400.000),(84,'thia',0.500),(85,'thia',0.600),(86,'thia',0.900),(87,'thia',1.000),(88,'thia',1.100),(241,'thia',1.200),(211,'thia',1.400),(89,'tocpha',6.000),(90,'tocpha',7.000),(91,'tocpha',11.000),(92,'tocpha',15.000),(212,'tocpha',19.000),(169,'tocpha',200.000),(170,'tocpha',300.000),(171,'tocpha',600.000),(172,'tocpha',800.000),(173,'tocpha',1000.000),(93,'vita_rae',300.000),(94,'vita_rae',400.000),(95,'vita_rae',600.000),(96,'vita_rae',700.000),(259,'vita_rae',750.000),(260,'vita_rae',770.000),(174,'vita_rae',900.000),(213,'vita_rae',1200.000),(214,'vita_rae',1300.000),(175,'vita_rae',1700.000),(176,'vita_rae',2800.000),(177,'vita_rae',3000.000),(97,'vitb12',0.900),(98,'vitb12',1.200),(99,'vitb12',1.800),(100,'vitb12',2.400),(261,'vitb12',2.600),(215,'vitb12',2.800),(101,'vitb6a',0.500),(102,'vitb6a',0.600),(103,'vitb6a',1.000),(104,'vitb6a',1.200),(105,'vitb6a',1.300),(106,'vitb6a',1.500),(242,'vitb6a',1.700),(262,'vitb6a',1.900),(216,'vitb6a',2.000),(178,'vitb6a',30.000),(179,'vitb6a',40.000),(180,'vitb6a',60.000),(181,'vitb6a',80.000),(182,'vitb6a',100.000),(107,'vitc',15.000),(108,'vitc',25.000),(109,'vitc',45.000),(110,'vitc',65.000),(111,'vitc',75.000),(263,'vitc',80.000),(264,'vitc',85.000),(243,'vitc',90.000),(217,'vitc',115.000),(218,'vitc',120.000),(183,'vitc',450.000),(184,'vitc',650.000),(185,'vitc',1200.000),(186,'vitc',1800.000),(187,'vitc',2000.000),(112,'vitd',15.000),(113,'vitd',20.000),(188,'vitd',63.000),(189,'vitd',75.000),(190,'vitd',100.000),(114,'vitk1',30.000),(115,'vitk1',55.000),(116,'vitk1',60.000),(117,'vitk1',75.000),(118,'vitk1',90.000),(244,'vitk1',120.000),(119,'water',1300.000),(120,'water',1700.000),(121,'water',2100.000),(122,'water',2300.000),(245,'water',2400.000),(123,'water',2700.000),(265,'water',3000.000),(246,'water',3300.000),(247,'water',3700.000),(219,'water',3800.000),(124,'zn',3.000),(248,'zn',5.000),(191,'zn',7.000),(125,'zn',8.000),(126,'zn',9.000),(249,'zn',11.000),(192,'zn',12.000),(220,'zn',13.000),(193,'zn',23.000),(194,'zn',34.000),(195,'zn',40.000);
/*!40000 ALTER TABLE `reference_amounts` ENABLE KEYS */;

-- Look up the nutr_no in the USDA database, which must exist.
UPDATE `reference_amounts` a JOIN `usda`.`nutr_def` b USING(`tagname`)
    SET a.`nutr_no` = b.`nutr_no`;
ALTER TABLE `reference_amounts`
    MODIFY `nutr_no` CHAR(3) NOT NULL;
ALTER TABLE `reference_amounts`
    ADD UNIQUE INDEX (`nutr_no`, `amount`);

UNLOCK TABLES;

--
-- Table structure for table `reference_intake_by_age_and_sex`
--

DROP TABLE IF EXISTS `reference_intake_by_age_and_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_intake_by_age_and_sex` (
  `age_range_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sex_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('recommended','tolerable_upper') NOT NULL,
  `reference_amount_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_intake_by_age_and_sex`
--

LOCK TABLES `reference_intake_by_age_and_sex` WRITE;
/*!40000 ALTER TABLE `reference_intake_by_age_and_sex` DISABLE KEYS */;
INSERT INTO `reference_intake_by_age_and_sex` VALUES (1,1,'recommended',1),(2,1,'recommended',2),(3,1,'recommended',3),(4,1,'recommended',3),(5,1,'recommended',2),(6,1,'recommended',2),(7,1,'recommended',4),(8,1,'recommended',4),(1,1,'recommended',5),(2,1,'recommended',5),(3,1,'recommended',5),(4,1,'recommended',5),(5,1,'recommended',5),(6,1,'recommended',5),(7,1,'recommended',5),(8,1,'recommended',5),(1,1,'recommended',6),(2,1,'recommended',7),(3,1,'recommended',8),(4,1,'recommended',9),(5,1,'recommended',10),(6,1,'recommended',10),(7,1,'recommended',10),(8,1,'recommended',10),(1,1,'recommended',11),(2,1,'recommended',12),(3,1,'recommended',13),(4,1,'recommended',14),(5,1,'recommended',15),(6,1,'recommended',15),(7,1,'recommended',15),(8,1,'recommended',15),(1,1,'recommended',16),(2,1,'recommended',17),(3,1,'recommended',17),(4,1,'recommended',18),(5,1,'recommended',19),(6,1,'recommended',19),(7,1,'recommended',18),(8,1,'recommended',18),(1,1,'recommended',20),(2,1,'recommended',21),(3,1,'recommended',22),(4,1,'recommended',23),(5,1,'recommended',23),(6,1,'recommended',23),(7,1,'recommended',23),(8,1,'recommended',23),(1,1,'recommended',24),(2,1,'recommended',25),(3,1,'recommended',26),(4,1,'recommended',27),(5,1,'recommended',28),(6,1,'recommended',28),(7,1,'recommended',26),(8,1,'recommended',26),(1,1,'recommended',29),(2,1,'recommended',30),(3,1,'recommended',31),(4,1,'recommended',31),(5,1,'recommended',30),(6,1,'recommended',30),(7,1,'recommended',32),(8,1,'recommended',32),(1,1,'recommended',33),(2,1,'recommended',34),(3,1,'recommended',35),(4,1,'recommended',36),(5,1,'recommended',36),(6,1,'recommended',36),(7,1,'recommended',36),(8,1,'recommended',36),(1,1,'recommended',37),(2,1,'recommended',38),(3,1,'recommended',39),(4,1,'recommended',40),(5,1,'recommended',40),(6,1,'recommended',40),(7,1,'recommended',40),(8,1,'recommended',40),(1,1,'recommended',41),(2,1,'recommended',42),(3,1,'recommended',43),(4,1,'recommended',44),(5,1,'recommended',44),(6,1,'recommended',44),(7,1,'recommended',44),(8,1,'recommended',44),(1,1,'recommended',45),(2,1,'recommended',46),(3,1,'recommended',47),(4,1,'recommended',48),(5,1,'recommended',49),(6,1,'recommended',50),(7,1,'recommended',50),(8,1,'recommended',50),(1,1,'recommended',51),(2,1,'recommended',52),(3,1,'recommended',53),(4,1,'recommended',53),(5,1,'recommended',54),(6,1,'recommended',54),(7,1,'recommended',54),(8,1,'recommended',54),(1,1,'recommended',55),(2,1,'recommended',56),(3,1,'recommended',57),(4,1,'recommended',57),(5,1,'recommended',57),(6,1,'recommended',57),(7,1,'recommended',58),(8,1,'recommended',56),(1,1,'recommended',59),(2,1,'recommended',60),(3,1,'recommended',61),(4,1,'recommended',62),(5,1,'recommended',62),(6,1,'recommended',62),(7,1,'recommended',62),(8,1,'recommended',62),(1,1,'recommended',63),(2,1,'recommended',64),(3,1,'recommended',65),(4,1,'recommended',65),(5,1,'recommended',66),(6,1,'recommended',66),(7,1,'recommended',66),(8,1,'recommended',66),(1,1,'recommended',67),(2,1,'recommended',68),(3,1,'recommended',69),(4,1,'recommended',70),(5,1,'recommended',70),(6,1,'recommended',70),(7,1,'recommended',70),(8,1,'recommended',70),(1,1,'recommended',71),(2,1,'recommended',72),(3,1,'recommended',73),(4,1,'recommended',74),(5,1,'recommended',74),(6,1,'recommended',74),(7,1,'recommended',74),(8,1,'recommended',74),(1,1,'recommended',75),(2,1,'recommended',76),(3,1,'recommended',77),(4,1,'recommended',78),(5,1,'recommended',79),(6,1,'recommended',79),(7,1,'recommended',79),(8,1,'recommended',79),(1,1,'recommended',80),(2,1,'recommended',81),(3,1,'recommended',82),(4,1,'recommended',83),(5,1,'recommended',83),(6,1,'recommended',83),(7,1,'recommended',83),(8,1,'recommended',83),(1,1,'recommended',84),(2,1,'recommended',85),(3,1,'recommended',86),(4,1,'recommended',87),(5,1,'recommended',88),(6,1,'recommended',88),(7,1,'recommended',88),(8,1,'recommended',88),(1,1,'recommended',89),(2,1,'recommended',90),(3,1,'recommended',91),(4,1,'recommended',92),(5,1,'recommended',92),(6,1,'recommended',92),(7,1,'recommended',92),(8,1,'recommended',92),(1,1,'recommended',93),(2,1,'recommended',94),(3,1,'recommended',95),(4,1,'recommended',96),(5,1,'recommended',96),(6,1,'recommended',96),(7,1,'recommended',96),(8,1,'recommended',96),(1,1,'recommended',97),(2,1,'recommended',98),(3,1,'recommended',99),(4,1,'recommended',100),(5,1,'recommended',100),(6,1,'recommended',100),(7,1,'recommended',100),(8,1,'recommended',100),(1,1,'recommended',101),(2,1,'recommended',102),(3,1,'recommended',103),(4,1,'recommended',104),(5,1,'recommended',105),(6,1,'recommended',105),(7,1,'recommended',106),(8,1,'recommended',106),(1,1,'recommended',107),(2,1,'recommended',108),(3,1,'recommended',109),(4,1,'recommended',110),(5,1,'recommended',111),(6,1,'recommended',111),(7,1,'recommended',111),(8,1,'recommended',111),(1,1,'recommended',112),(2,1,'recommended',112),(3,1,'recommended',112),(4,1,'recommended',112),(5,1,'recommended',112),(6,1,'recommended',112),(7,1,'recommended',112),(8,1,'recommended',113),(1,1,'recommended',114),(2,1,'recommended',115),(3,1,'recommended',116),(4,1,'recommended',117),(5,1,'recommended',118),(6,1,'recommended',118),(7,1,'recommended',118),(8,1,'recommended',118),(1,1,'recommended',119),(2,1,'recommended',120),(3,1,'recommended',121),(4,1,'recommended',122),(5,1,'recommended',123),(6,1,'recommended',123),(7,1,'recommended',123),(8,1,'recommended',123),(1,1,'recommended',124),(2,1,'recommended',124),(3,1,'recommended',125),(4,1,'recommended',126),(5,1,'recommended',125),(6,1,'recommended',125),(7,1,'recommended',125),(8,1,'recommended',125),(1,1,'tolerable_upper',127),(2,1,'tolerable_upper',127),(3,1,'tolerable_upper',128),(4,1,'tolerable_upper',128),(5,1,'tolerable_upper',127),(6,1,'tolerable_upper',127),(7,1,'tolerable_upper',129),(8,1,'tolerable_upper',129),(1,1,'tolerable_upper',130),(2,1,'tolerable_upper',130),(3,1,'tolerable_upper',131),(4,1,'tolerable_upper',132),(5,1,'tolerable_upper',133),(6,1,'tolerable_upper',133),(7,1,'tolerable_upper',133),(8,1,'tolerable_upper',133),(1,1,'tolerable_upper',134),(2,1,'tolerable_upper',135),(3,1,'tolerable_upper',136),(4,1,'tolerable_upper',137),(5,1,'tolerable_upper',138),(6,1,'tolerable_upper',138),(7,1,'tolerable_upper',138),(8,1,'tolerable_upper',138),(1,1,'tolerable_upper',139),(2,1,'tolerable_upper',139),(3,1,'tolerable_upper',139),(4,1,'tolerable_upper',140),(5,1,'tolerable_upper',140),(6,1,'tolerable_upper',140),(7,1,'tolerable_upper',140),(8,1,'tolerable_upper',140),(1,1,'tolerable_upper',141),(2,1,'tolerable_upper',142),(3,1,'tolerable_upper',143),(4,1,'tolerable_upper',143),(5,1,'tolerable_upper',143),(6,1,'tolerable_upper',143),(7,1,'tolerable_upper',143),(8,1,'tolerable_upper',143),(1,1,'tolerable_upper',39),(2,1,'tolerable_upper',40),(3,1,'tolerable_upper',144),(4,1,'tolerable_upper',145),(5,1,'tolerable_upper',146),(6,1,'tolerable_upper',146),(7,1,'tolerable_upper',146),(8,1,'tolerable_upper',146),(1,1,'tolerable_upper',147),(2,1,'tolerable_upper',148),(3,1,'tolerable_upper',149),(4,1,'tolerable_upper',149),(5,1,'tolerable_upper',149),(6,1,'tolerable_upper',149),(7,1,'tolerable_upper',149),(8,1,'tolerable_upper',149),(1,1,'tolerable_upper',150),(2,1,'tolerable_upper',151),(3,1,'tolerable_upper',152),(4,1,'tolerable_upper',153),(5,1,'tolerable_upper',154),(6,1,'tolerable_upper',154),(7,1,'tolerable_upper',154),(8,1,'tolerable_upper',154),(1,1,'tolerable_upper',57),(2,1,'tolerable_upper',155),(3,1,'tolerable_upper',156),(4,1,'tolerable_upper',157),(5,1,'tolerable_upper',157),(6,1,'tolerable_upper',157),(7,1,'tolerable_upper',157),(8,1,'tolerable_upper',157),(1,1,'tolerable_upper',158),(2,1,'tolerable_upper',159),(3,1,'tolerable_upper',160),(4,1,'tolerable_upper',161),(5,1,'tolerable_upper',162),(6,1,'tolerable_upper',162),(7,1,'tolerable_upper',162),(8,1,'tolerable_upper',162),(1,1,'tolerable_upper',163),(2,1,'tolerable_upper',163),(3,1,'tolerable_upper',164),(4,1,'tolerable_upper',164),(5,1,'tolerable_upper',164),(6,1,'tolerable_upper',164),(7,1,'tolerable_upper',164),(8,1,'tolerable_upper',163),(1,1,'tolerable_upper',165),(2,1,'tolerable_upper',166),(3,1,'tolerable_upper',167),(4,1,'tolerable_upper',168),(5,1,'tolerable_upper',168),(6,1,'tolerable_upper',168),(7,1,'tolerable_upper',168),(8,1,'tolerable_upper',168),(1,1,'tolerable_upper',169),(2,1,'tolerable_upper',170),(3,1,'tolerable_upper',171),(4,1,'tolerable_upper',172),(5,1,'tolerable_upper',173),(6,1,'tolerable_upper',173),(7,1,'tolerable_upper',173),(8,1,'tolerable_upper',173),(1,1,'tolerable_upper',95),(2,1,'tolerable_upper',174),(3,1,'tolerable_upper',175),(4,1,'tolerable_upper',176),(5,1,'tolerable_upper',177),(6,1,'tolerable_upper',177),(7,1,'tolerable_upper',177),(8,1,'tolerable_upper',177),(1,1,'tolerable_upper',178),(2,1,'tolerable_upper',179),(3,1,'tolerable_upper',180),(4,1,'tolerable_upper',181),(5,1,'tolerable_upper',182),(6,1,'tolerable_upper',182),(7,1,'tolerable_upper',182),(8,1,'tolerable_upper',182),(1,1,'tolerable_upper',183),(2,1,'tolerable_upper',184),(3,1,'tolerable_upper',185),(4,1,'tolerable_upper',186),(5,1,'tolerable_upper',187),(6,1,'tolerable_upper',187),(7,1,'tolerable_upper',187),(8,1,'tolerable_upper',187),(1,1,'tolerable_upper',188),(2,1,'tolerable_upper',189),(3,1,'tolerable_upper',190),(4,1,'tolerable_upper',190),(5,1,'tolerable_upper',190),(6,1,'tolerable_upper',190),(7,1,'tolerable_upper',190),(8,1,'tolerable_upper',190),(1,1,'tolerable_upper',191),(2,1,'tolerable_upper',192),(3,1,'tolerable_upper',193),(4,1,'tolerable_upper',194),(5,1,'tolerable_upper',195),(6,1,'tolerable_upper',195),(7,1,'tolerable_upper',195),(8,1,'tolerable_upper',195),(4,2,'recommended',3),(5,2,'recommended',2),(6,2,'recommended',2),(4,2,'recommended',196),(5,2,'recommended',196),(6,2,'recommended',196),(4,2,'recommended',197),(5,2,'recommended',197),(6,2,'recommended',197),(4,2,'recommended',198),(5,2,'recommended',198),(6,2,'recommended',198),(4,2,'recommended',199),(5,2,'recommended',199),(6,2,'recommended',199),(4,2,'recommended',200),(5,2,'recommended',200),(6,2,'recommended',200),(4,2,'recommended',25),(5,2,'recommended',201),(6,2,'recommended',201),(4,2,'recommended',202),(5,2,'recommended',202),(6,2,'recommended',202),(4,2,'recommended',36),(5,2,'recommended',36),(6,2,'recommended',36),(4,2,'recommended',203),(5,2,'recommended',203),(6,2,'recommended',203),(4,2,'recommended',204),(5,2,'recommended',204),(6,2,'recommended',204),(4,2,'recommended',48),(5,2,'recommended',49),(6,2,'recommended',50),(4,2,'recommended',205),(5,2,'recommended',205),(6,2,'recommended',205),(4,2,'recommended',57),(5,2,'recommended',57),(6,2,'recommended',57),(4,2,'recommended',206),(5,2,'recommended',206),(6,2,'recommended',206),(4,2,'recommended',65),(5,2,'recommended',66),(6,2,'recommended',66),(4,2,'recommended',207),(5,2,'recommended',207),(6,2,'recommended',207),(4,2,'recommended',208),(5,2,'recommended',208),(6,2,'recommended',208),(4,2,'recommended',209),(5,2,'recommended',209),(6,2,'recommended',209),(4,2,'recommended',210),(5,2,'recommended',210),(6,2,'recommended',210),(4,2,'recommended',211),(5,2,'recommended',211),(6,2,'recommended',211),(4,2,'recommended',212),(5,2,'recommended',212),(6,2,'recommended',212),(4,2,'recommended',213),(5,2,'recommended',214),(6,2,'recommended',214),(4,2,'recommended',215),(5,2,'recommended',215),(6,2,'recommended',215),(4,2,'recommended',216),(5,2,'recommended',216),(6,2,'recommended',216),(4,2,'recommended',217),(5,2,'recommended',218),(6,2,'recommended',218),(4,2,'recommended',112),(5,2,'recommended',112),(6,2,'recommended',112),(4,2,'recommended',117),(5,2,'recommended',118),(6,2,'recommended',118),(4,2,'recommended',219),(5,2,'recommended',219),(6,2,'recommended',219),(4,2,'recommended',220),(5,2,'recommended',192),(6,2,'recommended',192),(4,2,'tolerable_upper',128),(5,2,'tolerable_upper',127),(6,2,'tolerable_upper',127),(4,2,'tolerable_upper',132),(5,2,'tolerable_upper',133),(6,2,'tolerable_upper',133),(4,2,'tolerable_upper',137),(5,2,'tolerable_upper',138),(6,2,'tolerable_upper',138),(4,2,'tolerable_upper',140),(5,2,'tolerable_upper',140),(6,2,'tolerable_upper',140),(4,2,'tolerable_upper',143),(5,2,'tolerable_upper',143),(6,2,'tolerable_upper',143),(4,2,'tolerable_upper',145),(5,2,'tolerable_upper',146),(6,2,'tolerable_upper',146),(4,2,'tolerable_upper',149),(5,2,'tolerable_upper',149),(6,2,'tolerable_upper',149),(4,2,'tolerable_upper',153),(5,2,'tolerable_upper',154),(6,2,'tolerable_upper',154),(4,2,'tolerable_upper',157),(5,2,'tolerable_upper',157),(6,2,'tolerable_upper',157),(4,2,'tolerable_upper',161),(5,2,'tolerable_upper',162),(6,2,'tolerable_upper',162),(4,2,'tolerable_upper',164),(5,2,'tolerable_upper',164),(6,2,'tolerable_upper',164),(4,2,'tolerable_upper',168),(5,2,'tolerable_upper',168),(6,2,'tolerable_upper',168),(4,2,'tolerable_upper',172),(5,2,'tolerable_upper',173),(6,2,'tolerable_upper',173),(4,2,'tolerable_upper',176),(5,2,'tolerable_upper',177),(6,2,'tolerable_upper',177),(4,2,'tolerable_upper',181),(5,2,'tolerable_upper',182),(6,2,'tolerable_upper',182),(4,2,'tolerable_upper',186),(5,2,'tolerable_upper',187),(6,2,'tolerable_upper',187),(4,2,'tolerable_upper',190),(5,2,'tolerable_upper',190),(6,2,'tolerable_upper',190),(4,2,'tolerable_upper',194),(5,2,'tolerable_upper',195),(6,2,'tolerable_upper',195),(1,3,'recommended',1),(2,3,'recommended',2),(3,3,'recommended',3),(4,3,'recommended',3),(5,3,'recommended',2),(6,3,'recommended',2),(7,3,'recommended',2),(8,3,'recommended',4),(1,3,'recommended',5),(2,3,'recommended',5),(3,3,'recommended',5),(4,3,'recommended',5),(5,3,'recommended',5),(6,3,'recommended',5),(7,3,'recommended',5),(8,3,'recommended',5),(1,3,'recommended',6),(2,3,'recommended',7),(3,3,'recommended',8),(4,3,'recommended',197),(5,3,'recommended',197),(6,3,'recommended',197),(7,3,'recommended',197),(8,3,'recommended',197),(1,3,'recommended',11),(2,3,'recommended',12),(3,3,'recommended',13),(4,3,'recommended',14),(5,3,'recommended',15),(6,3,'recommended',15),(7,3,'recommended',15),(8,3,'recommended',15),(1,3,'recommended',16),(2,3,'recommended',17),(3,3,'recommended',19),(4,3,'recommended',221),(5,3,'recommended',222),(6,3,'recommended',222),(7,3,'recommended',223),(8,3,'recommended',223),(1,3,'recommended',20),(2,3,'recommended',21),(3,3,'recommended',224),(4,3,'recommended',225),(5,3,'recommended',225),(6,3,'recommended',225),(7,3,'recommended',225),(8,3,'recommended',225),(1,3,'recommended',24),(2,3,'recommended',25),(3,3,'recommended',26),(4,3,'recommended',226),(5,3,'recommended',26),(6,3,'recommended',26),(7,3,'recommended',26),(8,3,'recommended',26),(1,3,'recommended',29),(2,3,'recommended',30),(3,3,'recommended',227),(4,3,'recommended',228),(5,3,'recommended',228),(6,3,'recommended',228),(7,3,'recommended',229),(8,3,'recommended',229),(1,3,'recommended',33),(2,3,'recommended',34),(3,3,'recommended',35),(4,3,'recommended',36),(5,3,'recommended',230),(6,3,'recommended',230),(7,3,'recommended',230),(8,3,'recommended',230),(1,3,'recommended',37),(2,3,'recommended',38),(3,3,'recommended',39),(4,3,'recommended',40),(5,3,'recommended',40),(6,3,'recommended',40),(7,3,'recommended',40),(8,3,'recommended',40),(1,3,'recommended',41),(2,3,'recommended',42),(3,3,'recommended',43),(4,3,'recommended',44),(5,3,'recommended',44),(6,3,'recommended',44),(7,3,'recommended',44),(8,3,'recommended',44),(1,3,'recommended',45),(2,3,'recommended',46),(3,3,'recommended',47),(4,3,'recommended',231),(5,3,'recommended',232),(6,3,'recommended',233),(7,3,'recommended',233),(8,3,'recommended',233),(1,3,'recommended',51),(2,3,'recommended',52),(3,3,'recommended',234),(4,3,'recommended',235),(5,3,'recommended',236),(6,3,'recommended',236),(7,3,'recommended',236),(8,3,'recommended',236),(1,3,'recommended',55),(2,3,'recommended',56),(3,3,'recommended',57),(4,3,'recommended',57),(5,3,'recommended',57),(6,3,'recommended',57),(7,3,'recommended',58),(8,3,'recommended',56),(1,3,'recommended',59),(2,3,'recommended',60),(3,3,'recommended',61),(4,3,'recommended',237),(5,3,'recommended',237),(6,3,'recommended',237),(7,3,'recommended',237),(8,3,'recommended',237),(1,3,'recommended',63),(2,3,'recommended',64),(3,3,'recommended',65),(4,3,'recommended',65),(5,3,'recommended',66),(6,3,'recommended',66),(7,3,'recommended',66),(8,3,'recommended',66),(1,3,'recommended',67),(2,3,'recommended',68),(3,3,'recommended',69),(4,3,'recommended',70),(5,3,'recommended',70),(6,3,'recommended',70),(7,3,'recommended',70),(8,3,'recommended',70),(1,3,'recommended',71),(2,3,'recommended',72),(3,3,'recommended',73),(4,3,'recommended',238),(5,3,'recommended',239),(6,3,'recommended',239),(7,3,'recommended',239),(8,3,'recommended',239),(1,3,'recommended',75),(2,3,'recommended',76),(3,3,'recommended',77),(4,3,'recommended',240),(5,3,'recommended',240),(6,3,'recommended',240),(7,3,'recommended',240),(8,3,'recommended',240),(1,3,'recommended',80),(2,3,'recommended',81),(3,3,'recommended',82),(4,3,'recommended',83),(5,3,'recommended',83),(6,3,'recommended',83),(7,3,'recommended',83),(8,3,'recommended',83),(1,3,'recommended',84),(2,3,'recommended',85),(3,3,'recommended',86),(4,3,'recommended',241),(5,3,'recommended',241),(6,3,'recommended',241),(7,3,'recommended',241),(8,3,'recommended',241),(1,3,'recommended',89),(2,3,'recommended',90),(3,3,'recommended',91),(4,3,'recommended',92),(5,3,'recommended',92),(6,3,'recommended',92),(7,3,'recommended',92),(8,3,'recommended',92),(1,3,'recommended',93),(2,3,'recommended',94),(3,3,'recommended',95),(4,3,'recommended',174),(5,3,'recommended',174),(6,3,'recommended',174),(7,3,'recommended',174),(8,3,'recommended',174),(1,3,'recommended',97),(2,3,'recommended',98),(3,3,'recommended',99),(4,3,'recommended',100),(5,3,'recommended',100),(6,3,'recommended',100),(7,3,'recommended',100),(8,3,'recommended',100),(1,3,'recommended',101),(2,3,'recommended',102),(3,3,'recommended',103),(4,3,'recommended',105),(5,3,'recommended',105),(6,3,'recommended',105),(7,3,'recommended',242),(8,3,'recommended',242),(1,3,'recommended',107),(2,3,'recommended',108),(3,3,'recommended',109),(4,3,'recommended',111),(5,3,'recommended',243),(6,3,'recommended',243),(7,3,'recommended',243),(8,3,'recommended',243),(1,3,'recommended',112),(2,3,'recommended',112),(3,3,'recommended',112),(4,3,'recommended',112),(5,3,'recommended',112),(6,3,'recommended',112),(7,3,'recommended',112),(8,3,'recommended',113),(1,3,'recommended',114),(2,3,'recommended',115),(3,3,'recommended',116),(4,3,'recommended',117),(5,3,'recommended',244),(6,3,'recommended',244),(7,3,'recommended',244),(8,3,'recommended',244),(1,3,'recommended',119),(2,3,'recommended',120),(3,3,'recommended',245),(4,3,'recommended',246),(5,3,'recommended',247),(6,3,'recommended',247),(7,3,'recommended',247),(8,3,'recommended',247),(1,3,'recommended',124),(2,3,'recommended',124),(3,3,'recommended',248),(4,3,'recommended',125),(5,3,'recommended',249),(6,3,'recommended',249),(7,3,'recommended',249),(8,3,'recommended',249),(1,3,'tolerable_upper',127),(2,3,'tolerable_upper',127),(3,3,'tolerable_upper',128),(4,3,'tolerable_upper',128),(5,3,'tolerable_upper',127),(6,3,'tolerable_upper',127),(7,3,'tolerable_upper',129),(8,3,'tolerable_upper',129),(1,3,'tolerable_upper',130),(2,3,'tolerable_upper',130),(3,3,'tolerable_upper',131),(4,3,'tolerable_upper',132),(5,3,'tolerable_upper',133),(6,3,'tolerable_upper',133),(7,3,'tolerable_upper',133),(8,3,'tolerable_upper',133),(1,3,'tolerable_upper',134),(2,3,'tolerable_upper',135),(3,3,'tolerable_upper',136),(4,3,'tolerable_upper',137),(5,3,'tolerable_upper',138),(6,3,'tolerable_upper',138),(7,3,'tolerable_upper',138),(8,3,'tolerable_upper',138),(1,3,'tolerable_upper',139),(2,3,'tolerable_upper',139),(3,3,'tolerable_upper',139),(4,3,'tolerable_upper',140),(5,3,'tolerable_upper',140),(6,3,'tolerable_upper',140),(7,3,'tolerable_upper',140),(8,3,'tolerable_upper',140),(1,3,'tolerable_upper',141),(2,3,'tolerable_upper',142),(3,3,'tolerable_upper',143),(4,3,'tolerable_upper',143),(5,3,'tolerable_upper',143),(6,3,'tolerable_upper',143),(7,3,'tolerable_upper',143),(8,3,'tolerable_upper',143),(1,3,'tolerable_upper',39),(2,3,'tolerable_upper',40),(3,3,'tolerable_upper',144),(4,3,'tolerable_upper',145),(5,3,'tolerable_upper',146),(6,3,'tolerable_upper',146),(7,3,'tolerable_upper',146),(8,3,'tolerable_upper',146),(1,3,'tolerable_upper',147),(2,3,'tolerable_upper',148),(3,3,'tolerable_upper',149),(4,3,'tolerable_upper',149),(5,3,'tolerable_upper',149),(6,3,'tolerable_upper',149),(7,3,'tolerable_upper',149),(8,3,'tolerable_upper',149),(1,3,'tolerable_upper',150),(2,3,'tolerable_upper',151),(3,3,'tolerable_upper',152),(4,3,'tolerable_upper',153),(5,3,'tolerable_upper',154),(6,3,'tolerable_upper',154),(7,3,'tolerable_upper',154),(8,3,'tolerable_upper',154),(1,3,'tolerable_upper',57),(2,3,'tolerable_upper',155),(3,3,'tolerable_upper',156),(4,3,'tolerable_upper',157),(5,3,'tolerable_upper',157),(6,3,'tolerable_upper',157),(7,3,'tolerable_upper',157),(8,3,'tolerable_upper',157),(1,3,'tolerable_upper',158),(2,3,'tolerable_upper',159),(3,3,'tolerable_upper',160),(4,3,'tolerable_upper',161),(5,3,'tolerable_upper',162),(6,3,'tolerable_upper',162),(7,3,'tolerable_upper',162),(8,3,'tolerable_upper',162),(1,3,'tolerable_upper',163),(2,3,'tolerable_upper',163),(3,3,'tolerable_upper',164),(4,3,'tolerable_upper',164),(5,3,'tolerable_upper',164),(6,3,'tolerable_upper',164),(7,3,'tolerable_upper',164),(8,3,'tolerable_upper',163),(1,3,'tolerable_upper',165),(2,3,'tolerable_upper',166),(3,3,'tolerable_upper',167),(4,3,'tolerable_upper',168),(5,3,'tolerable_upper',168),(6,3,'tolerable_upper',168),(7,3,'tolerable_upper',168),(8,3,'tolerable_upper',168),(1,3,'tolerable_upper',169),(2,3,'tolerable_upper',170),(3,3,'tolerable_upper',171),(4,3,'tolerable_upper',172),(5,3,'tolerable_upper',173),(6,3,'tolerable_upper',173),(7,3,'tolerable_upper',173),(8,3,'tolerable_upper',173),(1,3,'tolerable_upper',95),(2,3,'tolerable_upper',174),(3,3,'tolerable_upper',175),(4,3,'tolerable_upper',176),(5,3,'tolerable_upper',177),(6,3,'tolerable_upper',177),(7,3,'tolerable_upper',177),(8,3,'tolerable_upper',177),(1,3,'tolerable_upper',178),(2,3,'tolerable_upper',179),(3,3,'tolerable_upper',180),(4,3,'tolerable_upper',181),(5,3,'tolerable_upper',182),(6,3,'tolerable_upper',182),(7,3,'tolerable_upper',182),(8,3,'tolerable_upper',182),(1,3,'tolerable_upper',183),(2,3,'tolerable_upper',184),(3,3,'tolerable_upper',185),(4,3,'tolerable_upper',186),(5,3,'tolerable_upper',187),(6,3,'tolerable_upper',187),(7,3,'tolerable_upper',187),(8,3,'tolerable_upper',187),(1,3,'tolerable_upper',188),(2,3,'tolerable_upper',189),(3,3,'tolerable_upper',190),(4,3,'tolerable_upper',190),(5,3,'tolerable_upper',190),(6,3,'tolerable_upper',190),(7,3,'tolerable_upper',190),(8,3,'tolerable_upper',190),(1,3,'tolerable_upper',191),(2,3,'tolerable_upper',192),(3,3,'tolerable_upper',193),(4,3,'tolerable_upper',194),(5,3,'tolerable_upper',195),(6,3,'tolerable_upper',195),(7,3,'tolerable_upper',195),(8,3,'tolerable_upper',195),(4,4,'recommended',3),(5,4,'recommended',2),(6,4,'recommended',2),(4,4,'recommended',250),(5,4,'recommended',250),(6,4,'recommended',250),(4,4,'recommended',251),(5,4,'recommended',251),(6,4,'recommended',251),(4,4,'recommended',134),(5,4,'recommended',134),(6,4,'recommended',134),(4,4,'recommended',199),(5,4,'recommended',199),(6,4,'recommended',199),(4,4,'recommended',252),(5,4,'recommended',252),(6,4,'recommended',252),(4,4,'recommended',253),(5,4,'recommended',253),(6,4,'recommended',253),(4,4,'recommended',254),(5,4,'recommended',254),(6,4,'recommended',254),(4,4,'recommended',36),(5,4,'recommended',36),(6,4,'recommended',36),(4,4,'recommended',144),(5,4,'recommended',144),(6,4,'recommended',144),(4,4,'recommended',44),(5,4,'recommended',44),(6,4,'recommended',44),(4,4,'recommended',232),(5,4,'recommended',149),(6,4,'recommended',48),(4,4,'recommended',150),(5,4,'recommended',150),(6,4,'recommended',150),(4,4,'recommended',57),(5,4,'recommended',57),(6,4,'recommended',57),(4,4,'recommended',255),(5,4,'recommended',255),(6,4,'recommended',255),(4,4,'recommended',65),(5,4,'recommended',66),(6,4,'recommended',66),(4,4,'recommended',256),(5,4,'recommended',256),(6,4,'recommended',256),(4,4,'recommended',208),(5,4,'recommended',208),(6,4,'recommended',208),(4,4,'recommended',257),(5,4,'recommended',257),(6,4,'recommended',257),(4,4,'recommended',258),(5,4,'recommended',258),(6,4,'recommended',258),(4,4,'recommended',211),(5,4,'recommended',211),(6,4,'recommended',211),(4,4,'recommended',92),(5,4,'recommended',92),(6,4,'recommended',92),(4,4,'recommended',259),(5,4,'recommended',260),(6,4,'recommended',260),(4,4,'recommended',261),(5,4,'recommended',261),(6,4,'recommended',261),(4,4,'recommended',262),(5,4,'recommended',262),(6,4,'recommended',262),(4,4,'recommended',263),(5,4,'recommended',264),(6,4,'recommended',264),(4,4,'recommended',112),(5,4,'recommended',112),(6,4,'recommended',112),(4,4,'recommended',117),(5,4,'recommended',118),(6,4,'recommended',118),(4,4,'recommended',265),(5,4,'recommended',265),(6,4,'recommended',265),(4,4,'recommended',192),(5,4,'recommended',249),(6,4,'recommended',249),(4,4,'tolerable_upper',128),(5,4,'tolerable_upper',127),(6,4,'tolerable_upper',127),(4,4,'tolerable_upper',132),(5,4,'tolerable_upper',133),(6,4,'tolerable_upper',133),(4,4,'tolerable_upper',137),(5,4,'tolerable_upper',138),(6,4,'tolerable_upper',138),(4,4,'tolerable_upper',140),(5,4,'tolerable_upper',140),(6,4,'tolerable_upper',140),(4,4,'tolerable_upper',143),(5,4,'tolerable_upper',143),(6,4,'tolerable_upper',143),(4,4,'tolerable_upper',145),(5,4,'tolerable_upper',146),(6,4,'tolerable_upper',146),(4,4,'tolerable_upper',149),(5,4,'tolerable_upper',149),(6,4,'tolerable_upper',149),(4,4,'tolerable_upper',153),(5,4,'tolerable_upper',154),(6,4,'tolerable_upper',154),(4,4,'tolerable_upper',157),(5,4,'tolerable_upper',157),(6,4,'tolerable_upper',157),(4,4,'tolerable_upper',161),(5,4,'tolerable_upper',162),(6,4,'tolerable_upper',162),(4,4,'tolerable_upper',266),(5,4,'tolerable_upper',266),(6,4,'tolerable_upper',266),(4,4,'tolerable_upper',168),(5,4,'tolerable_upper',168),(6,4,'tolerable_upper',168),(4,4,'tolerable_upper',172),(5,4,'tolerable_upper',173),(6,4,'tolerable_upper',173),(4,4,'tolerable_upper',176),(5,4,'tolerable_upper',177),(6,4,'tolerable_upper',177),(4,4,'tolerable_upper',181),(5,4,'tolerable_upper',182),(6,4,'tolerable_upper',182),(4,4,'tolerable_upper',186),(5,4,'tolerable_upper',187),(6,4,'tolerable_upper',187),(4,4,'tolerable_upper',190),(5,4,'tolerable_upper',190),(6,4,'tolerable_upper',190),(4,4,'tolerable_upper',194),(5,4,'tolerable_upper',195),(6,4,'tolerable_upper',195);
/*!40000 ALTER TABLE `reference_intake_by_age_and_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexes`
--

DROP TABLE IF EXISTS `sexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexes` (
  `sex_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sex` char(9) NOT NULL,
  PRIMARY KEY (`sex_id`),
  UNIQUE KEY `sex` (`sex`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexes`
--

LOCK TABLES `sexes` WRITE;
/*!40000 ALTER TABLE `sexes` DISABLE KEYS */;
INSERT INTO `sexes` VALUES (1,'Female'),(2,'Lactating'),(3,'Male'),(4,'Pregnant');
/*!40000 ALTER TABLE `sexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Create a view that combines all those tables
--

CREATE VIEW `dietary_reference_intake` AS
SELECT age_from, age_to, sex, nutr_no, tagname, type, amount
FROM
    reference_intake_by_age_and_sex
    JOIN age_ranges USING(age_range_id)
    JOIN sexes USING(sex_id)
    JOIN reference_amounts USING(reference_amount_id);


/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27  0:22:32
