-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: rdbtoonto
-- ------------------------------------------------------
-- Server version	5.7.9-log

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

--
-- Table structure for table `t001_database`
--

DROP TABLE IF EXISTS `t001_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t001_database` (
  `C001_DATABASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C001_DATABASE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`C001_DATABASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t002_table`
--

DROP TABLE IF EXISTS `t002_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t002_table` (
  `C002_TABLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C002_TABLE_TYPE` varchar(255) NOT NULL,
  `C001_DATABASE_ID` int(11) NOT NULL,
  `C002_PHYSICAL_NAME` varchar(255) NOT NULL,
  `C002_LOGICAL_NAME` varchar(255) NOT NULL,
  `C002_IND_ASSOCIATIVE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`C002_TABLE_ID`),
  KEY `C001_DATABASE_ID_idx` (`C001_DATABASE_ID`),
  CONSTRAINT `FK_T001_TO_T002` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKt5v2hc1iahvdxl20y08a3j7hu` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t003_column`
--

DROP TABLE IF EXISTS `t003_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t003_column` (
  `C003_COLUMN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C003_PHYSICAL_NAME` varchar(255) NOT NULL,
  `C003_LOGICAL_NAME` varchar(255) NOT NULL,
  `C002_TABLE_ID` int(11) NOT NULL,
  `C003_IND_PRIMARY_KEY` tinyint(1) NOT NULL DEFAULT '0',
  `C003_IND_FOREIGN_KEY` tinyint(1) NOT NULL DEFAULT '0',
  `C002_FK_TABLE_ID` int(11) DEFAULT NULL,
  `C005_DATATYPE_ID` int(11) NOT NULL,
  `C003_IND_DESCRIPTION` tinyint(1) DEFAULT NULL,
  `C003_IND_ASSOCIATIVE_KEY` tinyint(1) DEFAULT NULL,
  `C002_AK_TABLE_ID_1` int(11) DEFAULT NULL,
  `C003_AK_COLUMN_ID_1` int(11) DEFAULT NULL,
  `C002_AK_TABLE_ID_N` int(11) DEFAULT NULL,
  `C003_AK_COLUMN_N` int(11) DEFAULT NULL,
  `C003_LOGICAL_NAME_2` varchar(255) DEFAULT NULL,
  `C003_IND_COLUMN_CHECK` tinyint(1) DEFAULT NULL,
  `C003_IND_UNIQUE_KEY` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`C003_COLUMN_ID`),
  KEY `FK_T002_TO_T003_idx` (`C002_TABLE_ID`),
  KEY `FK_T002_TO_T003_FK_ID_idx` (`C002_FK_TABLE_ID`),
  KEY `FK_T005_TO_T003_idx` (`C005_DATATYPE_ID`),
  KEY `FKro2eoxoxnx9sodk0lqmd7p9ys` (`C002_AK_TABLE_ID_1`),
  KEY `FKnucnnor18i92n364i49e9mwjy` (`C002_AK_TABLE_ID_N`),
  CONSTRAINT `FK43t3s791t1x8b07x0p49retvw` FOREIGN KEY (`C002_FK_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`),
  CONSTRAINT `FK99dqxjxkjrtwr6kch4hqkxsb8` FOREIGN KEY (`C005_DATATYPE_ID`) REFERENCES `t005_datatype_db` (`C005_DATATYPE_ID`),
  CONSTRAINT `FK_T002_TO_T003` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_T002_TO_T003_FK_ID` FOREIGN KEY (`C002_FK_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_T005_TO_T003` FOREIGN KEY (`C005_DATATYPE_ID`) REFERENCES `t005_datatype_db` (`C005_DATATYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKbrq9bix9aktmakiqxk8gv6nb6` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`),
  CONSTRAINT `FKnucnnor18i92n364i49e9mwjy` FOREIGN KEY (`C002_AK_TABLE_ID_N`) REFERENCES `t002_table` (`C002_TABLE_ID`),
  CONSTRAINT `FKro2eoxoxnx9sodk0lqmd7p9ys` FOREIGN KEY (`C002_AK_TABLE_ID_1`) REFERENCES `t002_table` (`C002_TABLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t004_record`
--

DROP TABLE IF EXISTS `t004_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t004_record` (
  `C004_RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C002_TABLE_ID` int(11) NOT NULL,
  `C004_TABLE_COLUMNS` varchar(255) NOT NULL,
  `C004_COLUMN_VALUES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C004_RECORD_ID`),
  KEY `FK_T004_TO_T002_idx` (`C002_TABLE_ID`),
  CONSTRAINT `FK_T002_TO_T004` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKi2vp9scqhet6tg6bdix1rm3v` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t005_datatype_db`
--

DROP TABLE IF EXISTS `t005_datatype_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t005_datatype_db` (
  `C005_DATATYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C005_DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`C005_DATATYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t006_check_value`
--

DROP TABLE IF EXISTS `t006_check_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t006_check_value` (
  `C006_CHECK_VALUE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C006_DESCRIPTION` varchar(255) NOT NULL,
  `C006_ABREVIATION` varchar(255) DEFAULT NULL,
  `C007_CHECK_SUBJECT_ID` int(11) NOT NULL,
  PRIMARY KEY (`C006_CHECK_VALUE_ID`),
  KEY `FK_T007_TO_T006_idx` (`C007_CHECK_SUBJECT_ID`),
  CONSTRAINT `FK_T007_TO_T006` FOREIGN KEY (`C007_CHECK_SUBJECT_ID`) REFERENCES `t007_check_subject` (`C007_CHECK_SUBJECT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKrdir765o3xw1u19373k8s0w19` FOREIGN KEY (`C007_CHECK_SUBJECT_ID`) REFERENCES `t007_check_subject` (`C007_CHECK_SUBJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t007_check_subject`
--

DROP TABLE IF EXISTS `t007_check_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t007_check_subject` (
  `C007_CHECK_SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C007_DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`C007_CHECK_SUBJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t008_database_domain`
--

DROP TABLE IF EXISTS `t008_database_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t008_database_domain` (
  `C008_DATABASE_DOMAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C008_DESCRIPTION` varchar(255) NOT NULL,
  `C001_DATABASE_ID` int(11) NOT NULL,
  PRIMARY KEY (`C008_DATABASE_DOMAIN_ID`),
  KEY `FK_T001_TO_T008_idx` (`C001_DATABASE_ID`),
  CONSTRAINT `FK_T001_TO_T008` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKp2xywmq1bw74he5e61l0tyi9s` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t009_column_check_value`
--

DROP TABLE IF EXISTS `t009_column_check_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t009_column_check_value` (
  `C003_COLUMN_ID` int(11) NOT NULL,
  `C006_CHECK_VALUE_ID` int(11) NOT NULL,
  PRIMARY KEY (`C003_COLUMN_ID`,`C006_CHECK_VALUE_ID`),
  KEY `FK_T006_TO_T009_idx` (`C006_CHECK_VALUE_ID`),
  CONSTRAINT `FK_T003_TO_T009` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_T006_TO_T009` FOREIGN KEY (`C006_CHECK_VALUE_ID`) REFERENCES `t006_check_value` (`C006_CHECK_VALUE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKe60pjh7s6347o2pvo7eyunmwi` FOREIGN KEY (`C006_CHECK_VALUE_ID`) REFERENCES `t006_check_value` (`C006_CHECK_VALUE_ID`),
  CONSTRAINT `FKiqha46f5t341cypf8uewk71c9` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t010_table_db_domain`
--

DROP TABLE IF EXISTS `t010_table_db_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t010_table_db_domain` (
  `C008_DATABASE_DOMAIN_ID` int(11) NOT NULL,
  `C002_TABLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`C008_DATABASE_DOMAIN_ID`,`C002_TABLE_ID`),
  KEY `FK_T002_TO_T010_idx` (`C002_TABLE_ID`),
  CONSTRAINT `FK1cftrdckmllvlye6vkj0qcja1` FOREIGN KEY (`C008_DATABASE_DOMAIN_ID`) REFERENCES `t008_database_domain` (`C008_DATABASE_DOMAIN_ID`),
  CONSTRAINT `FK_T002_TO_T010` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_T008_TO_T010` FOREIGN KEY (`C008_DATABASE_DOMAIN_ID`) REFERENCES `t008_database_domain` (`C008_DATABASE_DOMAIN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKbq22p96ii7piowfutxf3tx3xq` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t011_class`
--

DROP TABLE IF EXISTS `t011_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t011_class` (
  `C011_CLASS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C011_CLASS_NAME` varchar(255) DEFAULT NULL,
  `C008_DATABASE_DOMAIN_ID` int(11) DEFAULT NULL,
  `C003_COLUMN_ID` int(11) DEFAULT NULL,
  `C016_ONTOLOGY_ID` int(11) NOT NULL,
  `C002_TABLE_ID` int(11) DEFAULT NULL,
  `C007_CHECK_SUBJECT_ID` int(11) DEFAULT NULL,
  `C004_RECORD_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`C011_CLASS_ID`),
  KEY `fk_T011_CLASS_T016_ONTOLOGY1_idx` (`C016_ONTOLOGY_ID`),
  KEY `fk_T011_CLASS_T002_TABLE1_idx` (`C002_TABLE_ID`),
  KEY `fk_T011_CLASS_T007_CHECK_SUBJECT1_idx` (`C007_CHECK_SUBJECT_ID`),
  KEY `fk_T011_CLASS_T004_RECORD1_idx` (`C004_RECORD_ID`),
  KEY `FKn2lohk5sq13mirac040oxygwy` (`C003_COLUMN_ID`),
  KEY `FKpl6kkwe55plwpe8o8lisup30t` (`C008_DATABASE_DOMAIN_ID`),
  CONSTRAINT `FKhk1j7oi6kv6ux38vudwb1xana` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`),
  CONSTRAINT `FKiiy72pvdbcnrjj72blw09tqvf` FOREIGN KEY (`C004_RECORD_ID`) REFERENCES `t004_record` (`C004_RECORD_ID`),
  CONSTRAINT `FKmb4fu278pd5pb7q4wmpkadudy` FOREIGN KEY (`C007_CHECK_SUBJECT_ID`) REFERENCES `t007_check_subject` (`C007_CHECK_SUBJECT_ID`),
  CONSTRAINT `FKn2lohk5sq13mirac040oxygwy` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`),
  CONSTRAINT `FKpl6kkwe55plwpe8o8lisup30t` FOREIGN KEY (`C008_DATABASE_DOMAIN_ID`) REFERENCES `t008_database_domain` (`C008_DATABASE_DOMAIN_ID`),
  CONSTRAINT `FKtjjkwwkrbksrm9mgpufg5yjf2` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`),
  CONSTRAINT `fk_T011_CLASS_T002_TABLE1` FOREIGN KEY (`C002_TABLE_ID`) REFERENCES `t002_table` (`C002_TABLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T011_CLASS_T004_RECORD1` FOREIGN KEY (`C004_RECORD_ID`) REFERENCES `t004_record` (`C004_RECORD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T011_CLASS_T007_CHECK_SUBJECT1` FOREIGN KEY (`C007_CHECK_SUBJECT_ID`) REFERENCES `t007_check_subject` (`C007_CHECK_SUBJECT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T011_CLASS_T016_ONTOLOGY1` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t012_hierarchy`
--

DROP TABLE IF EXISTS `t012_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t012_hierarchy` (
  `C011_SUPER_CLASS_ID` int(11) NOT NULL,
  `C011_SUB_CLASS_ID` int(11) NOT NULL,
  PRIMARY KEY (`C011_SUPER_CLASS_ID`,`C011_SUB_CLASS_ID`),
  KEY `fk_T012_HIERARCHY_T011_CLASS1_idx` (`C011_SUB_CLASS_ID`),
  CONSTRAINT `FK76qbmccup4w1xtk0403g0tdph` FOREIGN KEY (`C011_SUPER_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `FKcrh0tw9q6gxyheebua08qx1ud` FOREIGN KEY (`C011_SUB_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `fk_T012_HIERARCHY_T011_CLASS1` FOREIGN KEY (`C011_SUB_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t013_datatype_property`
--

DROP TABLE IF EXISTS `t013_datatype_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t013_datatype_property` (
  `C013_DATATYPE_PROPERTY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C013_DATATYPE_PROPERTY_DESCRIPTION` varchar(100) DEFAULT NULL,
  `C016_ONTOLOGY_ID` int(11) DEFAULT NULL,
  `C018_DATATYPE_ID` int(11) DEFAULT NULL COMMENT '\n\n\n',
  `C013_IND_COMMON_CONCEPT` tinyint(1) DEFAULT NULL,
  `C013_IND_DESCRIPTION` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`C013_DATATYPE_PROPERTY_ID`),
  KEY `fk_T013_DATATYPE_PROPERTY_T016_ONTOLOGY1_idx` (`C016_ONTOLOGY_ID`),
  KEY `fk_T013_DATATYPE_PROPERTY_T018_DATATYPE_ONTO1_idx` (`C018_DATATYPE_ID`),
  CONSTRAINT `FK67goxyjcnbtg7v99454g96hb6` FOREIGN KEY (`C018_DATATYPE_ID`) REFERENCES `t018_datatype_onto` (`C018_DATATYPE_ID`),
  CONSTRAINT `FKsyftv96wq3p7g3eu1ljb9su8i` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`),
  CONSTRAINT `fk_T013_DATATYPE_PROPERTY_T016_ONTOLOGY1` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T013_DATATYPE_PROPERTY_T018_DATATYPE_ONTO1` FOREIGN KEY (`C018_DATATYPE_ID`) REFERENCES `t018_datatype_onto` (`C018_DATATYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t014_datatype_property_domain`
--

DROP TABLE IF EXISTS `t014_datatype_property_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t014_datatype_property_domain` (
  `C013_DATATYPE_PROPERTY_ID` int(11) NOT NULL,
  `C011_CLASS_ID_DOMAIN` int(11) DEFAULT NULL,
  `C014_DATATYPE_SUBPROPERTY_OF` tinyint(1) DEFAULT NULL,
  KEY `fk_T014_DATATYPE_PROPERTY_DOMAIN_RANGE_T011_CLASS1_idx` (`C011_CLASS_ID_DOMAIN`),
  KEY `fk_T014_DATATYPE_PROPERTY_DOMAIN_RANGE_T013_DATATYPE_PROPER_idx` (`C013_DATATYPE_PROPERTY_ID`),
  CONSTRAINT `FK9oelemvo01c3yg80xba9h4yj` FOREIGN KEY (`C013_DATATYPE_PROPERTY_ID`) REFERENCES `t013_datatype_property` (`C013_DATATYPE_PROPERTY_ID`),
  CONSTRAINT `FKcwn5tokbgf9tfrrsqclovbhif` FOREIGN KEY (`C011_CLASS_ID_DOMAIN`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `fk_T014_DATATYPE_PROPERTY_DOMAIN_RANGE_T011_CLASS1` FOREIGN KEY (`C011_CLASS_ID_DOMAIN`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T014_DATATYPE_PROPERTY_DOMAIN_RANGE_T013_DATATYPE_PROPERTY1` FOREIGN KEY (`C013_DATATYPE_PROPERTY_ID`) REFERENCES `t013_datatype_property` (`C013_DATATYPE_PROPERTY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t015_instance`
--

DROP TABLE IF EXISTS `t015_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t015_instance` (
  `C015_INSTANCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C015_INSTANCE_DESCRIPTION` varchar(250) DEFAULT NULL,
  `C011_CLASS_ID` int(11) DEFAULT NULL,
  `C016_ONTOLOGY_ID` int(11) DEFAULT NULL,
  `C004_RECORD_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`C015_INSTANCE_ID`),
  KEY `fk_T015_INSTANCE_T011_CLASS1_idx` (`C011_CLASS_ID`),
  KEY `fk_T015_INSTANCE_T016_ONTOLOGY1_idx` (`C016_ONTOLOGY_ID`),
  KEY `fk_T015_INSTANCE_T004_RECORD1_idx` (`C004_RECORD_ID`),
  CONSTRAINT `FK1h5ys6tqg9hralvbjwxyx7aga` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`),
  CONSTRAINT `FKa6r70f08p1oknil36fjf1fsrv` FOREIGN KEY (`C011_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `FKom0jr9b5x26lmtkh5xv9gps3v` FOREIGN KEY (`C004_RECORD_ID`) REFERENCES `t004_record` (`C004_RECORD_ID`),
  CONSTRAINT `fk_T015_INSTANCE_T004_RECORD1` FOREIGN KEY (`C004_RECORD_ID`) REFERENCES `t004_record` (`C004_RECORD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T015_INSTANCE_T011_CLASS1` FOREIGN KEY (`C011_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T015_INSTANCE_T016_ONTOLOGY1` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3377 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t016_ontology`
--

DROP TABLE IF EXISTS `t016_ontology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t016_ontology` (
  `C016_ONTOLOGY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C016_ONTOLOGY_NAME` varchar(255) DEFAULT NULL,
  `C001_DATABASE_ID` int(11) NOT NULL,
  PRIMARY KEY (`C016_ONTOLOGY_ID`),
  KEY `fk_T016_ONTOLOGY_T001_DATABASE1_idx` (`C001_DATABASE_ID`),
  CONSTRAINT `FKk22h5c31u6eve7r16o08ovn2r` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`),
  CONSTRAINT `fk_T016_ONTOLOGY_T001_DATABASE1` FOREIGN KEY (`C001_DATABASE_ID`) REFERENCES `t001_database` (`C001_DATABASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t017_disjoint_class`
--

DROP TABLE IF EXISTS `t017_disjoint_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t017_disjoint_class` (
  `C011_CLASS_ID` int(11) NOT NULL,
  `C011_DISJOINT_CLASS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`C011_CLASS_ID`),
  KEY `fk_T017_CLASS_RESTRICTION_T011_CLASS1_idx` (`C011_CLASS_ID`),
  CONSTRAINT `fk_T017_CLASS_RESTRICTION_T011_CLASS1` FOREIGN KEY (`C011_CLASS_ID`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t018_datatype_onto`
--

DROP TABLE IF EXISTS `t018_datatype_onto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t018_datatype_onto` (
  `C018_DATATYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C018_DESCRIPTION` varchar(255) NOT NULL,
  `C005_DATATYPE_DB_ID` int(11) NOT NULL,
  PRIMARY KEY (`C018_DATATYPE_ID`),
  KEY `fk_T018_DATATYPE_ONTO_T005_DATATYPE_DB1_idx` (`C005_DATATYPE_DB_ID`),
  CONSTRAINT `FKgc1g163ci8jv1lod3do7geu1v` FOREIGN KEY (`C005_DATATYPE_DB_ID`) REFERENCES `t005_datatype_db` (`C005_DATATYPE_ID`),
  CONSTRAINT `fk_T018_DATATYPE_ONTO_T005_DATATYPE_DB1` FOREIGN KEY (`C005_DATATYPE_DB_ID`) REFERENCES `t005_datatype_db` (`C005_DATATYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t019_object_property`
--

DROP TABLE IF EXISTS `t019_object_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t019_object_property` (
  `C019_OBJECT_PROPERTY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C019_OBJECT_PROPERTY_DESCRIPTION` varchar(250) DEFAULT NULL,
  `C016_ONTOLOGY_ID` int(11) NOT NULL,
  `C019_IND_INVERSE_FUNCTIONAL` tinyint(1) DEFAULT NULL,
  `C019_MIN_CARDINALITY` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`C019_OBJECT_PROPERTY_ID`),
  KEY `fk_T019_OBJECT_PROPERTY_T016_ONTOLOGY1_idx` (`C016_ONTOLOGY_ID`),
  CONSTRAINT `FKrp5ougah0fnomgf5ut3efqai3` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`),
  CONSTRAINT `fk_T019_OBJECT_PROPERTY_T016_ONTOLOGY1` FOREIGN KEY (`C016_ONTOLOGY_ID`) REFERENCES `t016_ontology` (`C016_ONTOLOGY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=765 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t020_column_to_datatype_property`
--

DROP TABLE IF EXISTS `t020_column_to_datatype_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t020_column_to_datatype_property` (
  `C003_COLUMN_ID` int(11) NOT NULL,
  `C013_DATATYPE_PROPERTY_ID` int(11) NOT NULL,
  PRIMARY KEY (`C003_COLUMN_ID`,`C013_DATATYPE_PROPERTY_ID`),
  KEY `fk_T003_COLUMN_has_T013_DATATYPE_PROPERTY_T013_DATATYPE_PRO_idx` (`C013_DATATYPE_PROPERTY_ID`),
  KEY `fk_T003_COLUMN_has_T013_DATATYPE_PROPERTY_T003_COLUMN1_idx` (`C003_COLUMN_ID`),
  CONSTRAINT `FK1h8uwdyrdjtgr5py0sketus5q` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`),
  CONSTRAINT `FK3fumgxcfi85ylh2xvw32th89f` FOREIGN KEY (`C013_DATATYPE_PROPERTY_ID`) REFERENCES `t013_datatype_property` (`C013_DATATYPE_PROPERTY_ID`),
  CONSTRAINT `fk_T003_COLUMN_has_T013_DATATYPE_PROPERTY_T003_COLUMN1` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T003_COLUMN_has_T013_DATATYPE_PROPERTY_T013_DATATYPE_PROPE1` FOREIGN KEY (`C013_DATATYPE_PROPERTY_ID`) REFERENCES `t013_datatype_property` (`C013_DATATYPE_PROPERTY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t021_column_to_object_property`
--

DROP TABLE IF EXISTS `t021_column_to_object_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t021_column_to_object_property` (
  `C003_COLUMN_ID` int(11) NOT NULL,
  `C019_OBJECT_PROPERTY_ID` int(11) NOT NULL,
  PRIMARY KEY (`C003_COLUMN_ID`,`C019_OBJECT_PROPERTY_ID`),
  KEY `fk_T003_COLUMN_has_T019_OBJECT_PROPERTY_T019_OBJECT_PROPERT_idx` (`C019_OBJECT_PROPERTY_ID`),
  KEY `fk_T003_COLUMN_has_T019_OBJECT_PROPERTY_T003_COLUMN1_idx` (`C003_COLUMN_ID`),
  CONSTRAINT `FKpb856xnpnnog7p41q1a3f99y5` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`),
  CONSTRAINT `FKt248lsd4i9j436pcbvu03ufc6` FOREIGN KEY (`C019_OBJECT_PROPERTY_ID`) REFERENCES `t019_object_property` (`C019_OBJECT_PROPERTY_ID`),
  CONSTRAINT `fk_T003_COLUMN_has_T019_OBJECT_PROPERTY_T003_COLUMN1` FOREIGN KEY (`C003_COLUMN_ID`) REFERENCES `t003_column` (`C003_COLUMN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T003_COLUMN_has_T019_OBJECT_PROPERTY_T019_OBJECT_PROPERTY1` FOREIGN KEY (`C019_OBJECT_PROPERTY_ID`) REFERENCES `t019_object_property` (`C019_OBJECT_PROPERTY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t022_object_property_domain_range`
--

DROP TABLE IF EXISTS `t022_object_property_domain_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t022_object_property_domain_range` (
  `C019_OBJECT_PROPERTY_ID` int(11) NOT NULL,
  `C011_CLASS_ID_DOMAIN` int(11) DEFAULT NULL,
  `C011_CLASS_ID_RANGE` int(11) DEFAULT NULL,
  KEY `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T011_CLASS1_idx` (`C011_CLASS_ID_DOMAIN`),
  KEY `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T011_CLASS2_idx` (`C011_CLASS_ID_RANGE`),
  KEY `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T019_OBJECT_PROPERTY1_idx` (`C019_OBJECT_PROPERTY_ID`),
  CONSTRAINT `FK7iil0daxusnbx6my8w3npl2j` FOREIGN KEY (`C019_OBJECT_PROPERTY_ID`) REFERENCES `t019_object_property` (`C019_OBJECT_PROPERTY_ID`),
  CONSTRAINT `FKhlvs46m0wfrhwn54woa9hvsr2` FOREIGN KEY (`C011_CLASS_ID_DOMAIN`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `FKpp8jc2psw73mtqyf2p41oycrf` FOREIGN KEY (`C011_CLASS_ID_RANGE`) REFERENCES `t011_class` (`C011_CLASS_ID`),
  CONSTRAINT `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T011_CLASS1` FOREIGN KEY (`C011_CLASS_ID_DOMAIN`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T011_CLASS2` FOREIGN KEY (`C011_CLASS_ID_RANGE`) REFERENCES `t011_class` (`C011_CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T022_OBJECT_PROPERTY_DOMAIN_RANGE_T019_OBJECT_PROPERTY1` FOREIGN KEY (`C019_OBJECT_PROPERTY_ID`) REFERENCES `t019_object_property` (`C019_OBJECT_PROPERTY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_type`
--

DROP TABLE IF EXISTS `tb_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name_database` varchar(45) NOT NULL,
  `name_xml` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-05 13:27:27
