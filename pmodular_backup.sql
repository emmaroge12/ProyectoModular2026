-- MySQL dump 10.13  Distrib 9.6.0, for Win64 (x86_64)
--
-- Host: localhost    Database: django
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c240cd9c-3687-11f1-b0d9-64006afe8316:1-146';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add student',7,'add_student'),(26,'Can change student',7,'change_student'),(27,'Can delete student',7,'delete_student'),(28,'Can view student',7,'view_student'),(29,'Can add professor',8,'add_professor'),(30,'Can change professor',8,'change_professor'),(31,'Can delete professor',8,'delete_professor'),(32,'Can view professor',8,'view_professor'),(33,'Can add student tutor',9,'add_studenttutor'),(34,'Can change student tutor',9,'change_studenttutor'),(35,'Can delete student tutor',9,'delete_studenttutor'),(36,'Can view student tutor',9,'view_studenttutor'),(37,'Can add conacyt scholarship',10,'add_conacytscholarship'),(38,'Can change conacyt scholarship',10,'change_conacytscholarship'),(39,'Can delete conacyt scholarship',10,'delete_conacytscholarship'),(40,'Can view conacyt scholarship',10,'view_conacytscholarship'),(41,'Can add thesis',11,'add_thesis'),(42,'Can change thesis',11,'change_thesis'),(43,'Can delete thesis',11,'delete_thesis'),(44,'Can view thesis',11,'view_thesis'),(45,'Can add thesis professor',12,'add_thesisprofessor'),(46,'Can change thesis professor',12,'change_thesisprofessor'),(47,'Can delete thesis professor',12,'delete_thesisprofessor'),(48,'Can view thesis professor',12,'view_thesisprofessor');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$1200000$UiJV763Z0NG65KDiOLw1NP$s/sr1GTeYaqYN64E9eOe55NlWgkHoX1PnlFkjWDxCSk=','2026-05-01 16:39:52.213920',1,'emmanuel','','','',1,1,'2026-05-01 16:39:38.507452');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_conacytscholarship`
--

DROP TABLE IF EXISTS `blogdemo_conacytscholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_conacytscholarship` (
  `conacyt_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  PRIMARY KEY (`conacyt_id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_conacytscholarship`
--

LOCK TABLES `blogdemo_conacytscholarship` WRITE;
/*!40000 ALTER TABLE `blogdemo_conacytscholarship` DISABLE KEYS */;
INSERT INTO `blogdemo_conacytscholarship` VALUES (5245,'2026-04-12','2026-04-12','ACTIVA','2152425354'),(12345,'2026-04-05','2026-04-12','ACTIVA','215245525'),(21354,'2026-04-01','2026-04-12','BAJA','216242535');
/*!40000 ALTER TABLE `blogdemo_conacytscholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_professor`
--

DROP TABLE IF EXISTS `blogdemo_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_professor` (
  `udg_code` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `udg_email` varchar(254) NOT NULL,
  `tutoring_number` int NOT NULL,
  PRIMARY KEY (`udg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_professor`
--

LOCK TABLES `blogdemo_professor` WRITE;
/*!40000 ALTER TABLE `blogdemo_professor` DISABLE KEYS */;
INSERT INTO `blogdemo_professor` VALUES (215242535,'Jose Luis Perez Armenta','jose@hernesto.com',0);
/*!40000 ALTER TABLE `blogdemo_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_student`
--

DROP TABLE IF EXISTS `blogdemo_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_student` (
  `udg_code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `udg_email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `current_semester` int NOT NULL,
  `admission_year` int NOT NULL,
  `udg_calendar` varchar(1) NOT NULL,
  `situation` varchar(20) NOT NULL,
  `last_job` longtext NOT NULL,
  PRIMARY KEY (`udg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_student`
--

LOCK TABLES `blogdemo_student` WRITE;
/*!40000 ALTER TABLE `blogdemo_student` DISABLE KEYS */;
INSERT INTO `blogdemo_student` VALUES ('2152425354','AnotherRandom','angie@bonilla.mx','2233223443',5,2015,'A','GRADUADO',''),('216242535','Emmanuel Roman Guillen','emmanuel.roman4253@alumnos.udg.mx','',0,2026,'B','DESCONOCIDO','');
/*!40000 ALTER TABLE `blogdemo_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_studenttutor`
--

DROP TABLE IF EXISTS `blogdemo_studenttutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_studenttutor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(10) NOT NULL,
  `professor_id` int NOT NULL,
  `student_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogdemo_studenttutor_student_id_role_cd6f8070_uniq` (`student_id`,`role`),
  KEY `blogdemo_studenttutor_professor_id_2d44c57e_fk` (`professor_id`),
  CONSTRAINT `blogdemo_studenttutor_professor_id_2d44c57e_fk` FOREIGN KEY (`professor_id`) REFERENCES `blogdemo_professor` (`udg_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_studenttutor`
--

LOCK TABLES `blogdemo_studenttutor` WRITE;
/*!40000 ALTER TABLE `blogdemo_studenttutor` DISABLE KEYS */;
INSERT INTO `blogdemo_studenttutor` VALUES (1,'TUTOR1',215242535,'216242535'),(2,'TUTOR2',215242535,'2152425354');
/*!40000 ALTER TABLE `blogdemo_studenttutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_thesis`
--

DROP TABLE IF EXISTS `blogdemo_thesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_thesis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lgca` varchar(255) NOT NULL,
  `title` longtext NOT NULL,
  `graduation_date` date DEFAULT NULL,
  `record` varchar(10) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_thesis`
--

LOCK TABLES `blogdemo_thesis` WRITE;
/*!40000 ALTER TABLE `blogdemo_thesis` DISABLE KEYS */;
INSERT INTO `blogdemo_thesis` VALUES (1,'Biomateriales y Polímeros','\"Síntesis de polímeros semiconductores y nanogeles mediante polimerización por emulsión con potenciales aplicaciones electrónicas y biomédicas\"',NULL,'','2152425354');
/*!40000 ALTER TABLE `blogdemo_thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogdemo_thesisprofessor`
--

DROP TABLE IF EXISTS `blogdemo_thesisprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogdemo_thesisprofessor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `professor_id` int NOT NULL,
  `thesis_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogdemo_thesisprofessor_thesis_id_role_30730f93_uniq` (`thesis_id`,`role`),
  KEY `blogdemo_thesisprofessor_professor_id_929a229b_fk` (`professor_id`),
  CONSTRAINT `blogdemo_thesisprofe_thesis_id_8438265b_fk_blogdemo_` FOREIGN KEY (`thesis_id`) REFERENCES `blogdemo_thesis` (`id`),
  CONSTRAINT `blogdemo_thesisprofessor_professor_id_929a229b_fk` FOREIGN KEY (`professor_id`) REFERENCES `blogdemo_professor` (`udg_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogdemo_thesisprofessor`
--

LOCK TABLES `blogdemo_thesisprofessor` WRITE;
/*!40000 ALTER TABLE `blogdemo_thesisprofessor` DISABLE KEYS */;
INSERT INTO `blogdemo_thesisprofessor` VALUES (1,'ASESOR',215242535,1);
/*!40000 ALTER TABLE `blogdemo_thesisprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (17,'2026-05-01 16:40:10.833247','1','emmaroge',3,'',4,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(10,'blogdemo','conacytscholarship'),(8,'blogdemo','professor'),(7,'blogdemo','student'),(9,'blogdemo','studenttutor'),(11,'blogdemo','thesis'),(12,'blogdemo','thesisprofessor'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-04-12 16:00:39.485997'),(2,'auth','0001_initial','2026-04-12 16:00:40.258101'),(3,'admin','0001_initial','2026-04-12 16:00:40.495005'),(4,'admin','0002_logentry_remove_auto_add','2026-04-12 16:00:40.507284'),(5,'admin','0003_logentry_add_action_flag_choices','2026-04-12 16:00:40.521496'),(6,'contenttypes','0002_remove_content_type_name','2026-04-12 16:00:40.661509'),(7,'auth','0002_alter_permission_name_max_length','2026-04-12 16:00:40.751016'),(8,'auth','0003_alter_user_email_max_length','2026-04-12 16:00:40.786164'),(9,'auth','0004_alter_user_username_opts','2026-04-12 16:00:40.798585'),(10,'auth','0005_alter_user_last_login_null','2026-04-12 16:00:40.888069'),(11,'auth','0006_require_contenttypes_0002','2026-04-12 16:00:40.890862'),(12,'auth','0007_alter_validators_add_error_messages','2026-04-12 16:00:40.901528'),(13,'auth','0008_alter_user_username_max_length','2026-04-12 16:00:40.993218'),(14,'auth','0009_alter_user_last_name_max_length','2026-04-12 16:00:41.088992'),(15,'auth','0010_alter_group_name_max_length','2026-04-12 16:00:41.123665'),(16,'auth','0011_update_proxy_permissions','2026-04-12 16:00:41.136763'),(17,'auth','0012_alter_user_first_name_max_length','2026-04-12 16:00:41.227751'),(18,'sessions','0001_initial','2026-04-12 16:00:41.283268'),(19,'blogdemo','0001_initial','2026-04-12 20:59:10.353664'),(20,'blogdemo','0002_professor_student_last_job_and_more','2026-04-12 22:50:28.769549'),(21,'blogdemo','0003_alter_student_admission_year_and_more','2026-04-12 22:53:04.331552'),(22,'blogdemo','0004_alter_professor_tutoring_number','2026-04-12 22:56:00.164542'),(23,'blogdemo','0005_studenttutor_student_tutors','2026-04-12 23:24:54.001311'),(24,'blogdemo','0006_alter_student_situation_conacytscholarship','2026-04-12 23:49:48.923480'),(25,'blogdemo','0007_alter_conacytscholarship_status','2026-04-12 23:50:56.260843'),(26,'blogdemo','0008_thesis','2026-04-13 00:40:34.822250'),(27,'blogdemo','0009_alter_thesis_graduation_date','2026-04-13 00:43:40.490801'),(28,'blogdemo','0010_thesisprofessor_thesis_professors','2026-04-13 00:57:49.017658');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pkiv5euzwx830osky11444xqs118ym2j','.eJxVjDEOgzAMAP_iuYoaTMBh7M4bkOM4hbZKJAJT1b9XSAztene6N0y8b_O0V12nJcIAFi6_LLA8NR8iPjjfi5GSt3UJ5kjMaasZS9TX7Wz_BjPXGQbQ1FoMQrGX5DsSK1HZegraU-LkFQUtuwY7oh4JW2qiqDhO3l2b4ODzBQspOHw:1wC1uZ:ajanxcX1JfwFdU_67_kSRz70c86GuQP4Z0-vLOS6znk','2026-04-26 21:00:07.892236'),('stibcpndjkt4hbz9mtggjbmdur2jvu27','.eJxVjMsOgjAQAP9lz6aplD6Wo3e-gXS7i0VNm1A4Gf_dkHDQ68xk3jDFfcvT3mSdFoYBOrj8MorpKeUQ_IjlXlWqZVsXUkeiTtvUWFlet7P9G-TYMgwgaKRDQUozG2YJjB5ZayOSPFFITGK9czoamoUDehs8U2DnenvtPXy-IcQ48g:1wIqu8:qA7khb9XKcIWQ6pFgzOkTr0xqcd_x7bN6Y7k77jyPyY','2026-05-15 16:39:52.234264');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-05 12:38:44
