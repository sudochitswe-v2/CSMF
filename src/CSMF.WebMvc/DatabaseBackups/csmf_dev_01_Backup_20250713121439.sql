/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: csmf_dev_01
-- ------------------------------------------------------
-- Server version	11.4.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `migration_id` varchar(150) NOT NULL,
  `product_version` varchar(32) NOT NULL,
  PRIMARY KEY (`migration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES
('20250628214409_Init','8.0.17'),
('20250706105702_ChangeEntityNameFromLoanFeesToLoanApplicationFees','8.0.17'),
('20250706110837_LoanFeeMasterData','8.0.17'),
('20250706121535_DataTypeChanges','8.0.17'),
('20250708173212_RepaymentScheduleChanges','8.0.17'),
('20250709184113_RepaymentTrxChanges','8.0.17'),
('20250711112737_LoanApplicationFeeChanges','8.0.17'),
('20250711112927_LoanApplicationFeeChanges_AddNewCol','8.0.17');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroleclaims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) NOT NULL,
  `claim_type` longtext DEFAULT NULL,
  `claim_value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_asp_net_role_claims_role_id` (`role_id`),
  CONSTRAINT `fk_asp_net_role_claims_asp_net_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `aspnetroles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `id` varchar(255) NOT NULL,
  `system_user_id` varchar(255) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `normalized_name` varchar(256) DEFAULT NULL,
  `concurrency_stamp` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RoleNameIndex` (`normalized_name`),
  KEY `ix_asp_net_roles_system_user_id` (`system_user_id`),
  CONSTRAINT `fk_asp_net_roles_asp_net_users_system_user_id` FOREIGN KEY (`system_user_id`) REFERENCES `aspnetusers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES
('05d0e087-fdfb-46cd-bc45-405119a46ca6',NULL,'Manager','MANAGER',NULL),
('82e0f629-1607-429f-a29f-d87cf2c4043a',NULL,'Administrator','ADMINISTRATOR',NULL),
('dd6d08b9-f2fb-4cad-b5fe-8878229bca53',NULL,'LoanOfficer','LOANOFFICER',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `claim_type` longtext DEFAULT NULL,
  `claim_value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_asp_net_user_claims_user_id` (`user_id`),
  CONSTRAINT `fk_asp_net_user_claims_asp_net_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `login_provider` varchar(255) NOT NULL,
  `provider_key` varchar(255) NOT NULL,
  `provider_display_name` longtext DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`login_provider`,`provider_key`),
  KEY `ix_asp_net_user_logins_user_id` (`user_id`),
  CONSTRAINT `fk_asp_net_user_logins_asp_net_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `ix_asp_net_user_roles_role_id` (`role_id`),
  CONSTRAINT `fk_asp_net_user_roles_asp_net_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `aspnetroles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_asp_net_user_roles_asp_net_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES
('0be1c386-2633-4ff1-8ced-794a4a2ca99f','05d0e087-fdfb-46cd-bc45-405119a46ca6'),
('bf6fd8b8-b488-4cdd-b46e-122bf89c8f94','05d0e087-fdfb-46cd-bc45-405119a46ca6'),
('bf6fd8b8-b488-4cdd-b46e-122bf89c8f94','82e0f629-1607-429f-a29f-d87cf2c4043a'),
('bf6fd8b8-b488-4cdd-b46e-122bf89c8f94','dd6d08b9-f2fb-4cad-b5fe-8878229bca53');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `id` varchar(255) NOT NULL,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `normalized_user_name` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `normalized_email` varchar(256) DEFAULT NULL,
  `email_confirmed` tinyint(1) NOT NULL,
  `password_hash` longtext DEFAULT NULL,
  `security_stamp` longtext DEFAULT NULL,
  `concurrency_stamp` longtext DEFAULT NULL,
  `phone_number` longtext DEFAULT NULL,
  `phone_number_confirmed` tinyint(1) NOT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL,
  `lockout_end` datetime DEFAULT NULL,
  `lockout_enabled` tinyint(1) NOT NULL,
  `access_failed_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserNameIndex` (`normalized_user_name`),
  KEY `EmailIndex` (`normalized_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES
('0be1c386-2633-4ff1-8ced-794a4a2ca99f','HO','Manager','hq.manager@csmf.org','HQ.MANAGER@CSMF.ORG','hq.manager@csmf.org','HQ.MANAGER@CSMF.ORG',0,'AQAAAAIAAYagAAAAEKb6uFjS5szHwV4XklZe0oNwbaEdHClhgblBeuYLAuhtCa87MizNP0e/GqPHLBa/zA==','NOMADVBG4PWENN7L6WLP7QXUO4QJCVB5','1924319e-8e51-4eb2-ab8d-dd9316a5d5fc',NULL,0,0,NULL,1,0),
('bf6fd8b8-b488-4cdd-b46e-122bf89c8f94','Admin','User','admin@csmf.org','ADMIN@CSMF.ORG','admin@csmf.org','ADMIN@CSMF.ORG',1,'AQAAAAIAAYagAAAAEJ9OXW/x87LWgm8nVOUa+2PWZtv3TJG+ChyN6nAhdv3lwEfjAATFxPlTropd8MKSPg==','TOXV46FCGPRI34XDP4YFDOVNCUL6FMPF','5fb882cb-7861-4062-966c-c5e7cd2c62f0',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusertokens` (
  `user_id` varchar(255) NOT NULL,
  `login_provider` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`user_id`,`login_provider`,`name`),
  CONSTRAINT `fk_asp_net_user_tokens_asp_net_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_users`
--

DROP TABLE IF EXISTS `branch_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `user_id` longtext NOT NULL,
  `system_user_id` varchar(255) DEFAULT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_branch_users_branch_id` (`branch_id`),
  KEY `ix_branch_users_system_user_id` (`system_user_id`),
  CONSTRAINT `fk_branch_users_branches_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_branch_users_users_system_user_id` FOREIGN KEY (`system_user_id`) REFERENCES `aspnetusers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_users`
--

LOCK TABLES `branch_users` WRITE;
/*!40000 ALTER TABLE `branch_users` DISABLE KEYS */;
INSERT INTO `branch_users` VALUES
(4,1,'bf6fd8b8-b488-4cdd-b46e-122bf89c8f94',NULL,'Admin User','2025-07-13 00:42:26.085780',NULL,NULL),
(5,2,'bf6fd8b8-b488-4cdd-b46e-122bf89c8f94',NULL,'Admin User','2025-07-13 00:42:26.085899',NULL,NULL);
/*!40000 ALTER TABLE `branch_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `email` longtext NOT NULL,
  `phones` longtext NOT NULL,
  `address` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES
(1,'Head Office','ygn.main.office@csmf.org','9797105707, 9767678198','Jasmine Road, Insein, Yangon','Admin User','2025-06-29 04:23:27.029331',NULL,NULL),
(2,'Mandalay Main Office','mdy.main.office@csmf.org','9799512377 ','35th Road, Chan Aye Thar Zan, Mandalay','Admin User','2025-06-29 12:40:03.682451',NULL,NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `email` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `address` longtext NOT NULL,
  `identification_number` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_customers_branch_id` (`branch_id`),
  CONSTRAINT `fk_customers_branches_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(1,'Owen','Bard','owen@hotmail.com','88888888','ORCHARD ROAD','12/SAMAKHA(N)000001',1,'Admin User','2025-06-29 12:46:51.442452','Admin User','2025-06-29 12:47:58.268752'),
(2,'test','test','test@test.com','88888888','ORCHARD ROAD','12/SAMAKHA(N)000002',2,'Admin User','2025-06-29 18:15:48.422459',NULL,NULL),
(3,'test','2','test2@test.com','88888888','ORCHARD ROAD','12/SAMAKHA(N)000003',1,'Admin User','2025-06-29 18:16:07.178707',NULL,NULL),
(4,'Owen','Test','test3@test.com','88888888','ORCHARD ROAD','12/SAMAKHA(N)000004',1,'Admin User','2025-06-29 18:16:28.808568',NULL,NULL),
(5,'test','4','test4@test.com','88888888','ORCHARD ROAD','12/SAMAKHA(N)000005',1,'Admin User','2025-06-29 18:16:52.469998',NULL,NULL),
(6,'test','test','test5@testcom','88888888','ORCHARD ROAD','12/SAMAKHA(N)000006',1,'Admin User','2025-06-29 18:17:45.042780',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `content_type` longtext NOT NULL,
  `size` bigint(20) NOT NULL,
  `data` longblob NOT NULL,
  `extension` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `document_type` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_documents_customer_id` (`customer_id`),
  CONSTRAINT `fk_documents_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES
(1,1,'ST-1031_web_01_1080x (Square 512x)','image/png',104840,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ôxÔú\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\0\0Òİ~ü\0\0ÿ¥IDATx^ì`EÇßİ¥ z¯Ò¥#½‰€P@ÅŠ½¢Ÿ€½PÄ®ˆ]AE¬HQ)Ò{ï½…Bzîrßû¿Ù½Û\\\nÉ%@æ†Û:;;;óŞ›ns3¤Ñh4\Z¦Xa7~5\ZF£Ñ#´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñh4\ZM1D\0\ZF£ÑC´ Ñ\\À¸-î\\r¾«Ñh\nm\0h40çK	k@£¹ğ±¹c[£ÑeŒœŠŸtşÏnã_Ş¶ñ/²±w\\éé|ÜF66íİît¾ÎM»ƒÜ¸–o²áûàæëpƒxÉ×¸İê¸ÃáÀrº\\ä`ì|½ïOwñµ|ù<»¯ç\rà€ÈóqB£Ñ\\0h@£)â¸X«lª*ìâ(.á:Kññgèt\\awòø	:~ü8?I\'Os	IIw†ãã)11‘ÒÒ\\ìC:9N1\0\0Œ‚\0G (ğÀ  \n£°°põ\ZJ‘Tºt*S¦E•)MÑÑe)ªT)\nåó¥ø7ªD$•,U’BùZÓ€°¢\r¦h¢\r\0æ<8ƒìéNg%iãvºKõ¡C‡(&&†öíÛGû÷ m[·ÑŞ½ûhçÎrŞÉ¥{Üëâë¥tÿP-\0oDß¢T}ö›÷ÅãyªŞ #6T\'à×¢¬møã›åñJù?m;9¤v€¶K øaT«Vj×®MuêÔ¡êÕ«SÅŠ©|ùòü[‰Š0!“ûàŸé4\ZÍ¹G\0\ZM!cU·RÑÎYÀ©“§hç®´mÇÚ¾}\'­^½Š¶mÛB‡¥k (ÓR]j|+_ÓO(d¶Ô¶‘••>…šõVËûc\0ğz\0ßƒ»Ğ´`\nësQ“€»X¥K˜á`˜ÊÛhJ¨ÀÆ@ıú—P«V­¨^½zâªW«.†ƒù|mh4…6\04šÄTîPzi.§l”ÚW¬XI›7n¤%K–ĞÊ•khÏ¾=|Æ(aüËZÕ-J×8”¹V¢¡\r¤Ÿ±aØ¬Ä•â6auÍö¬•|NM	E	Ş!c8q^Ân„ÛRkĞ¦ukjŞ¼95lØˆZµnE!aÊxpàR²³Ñ£Ñh\nm\0h4r’Ó™Fqqq´ƒKõ+W¯¦eË—ÑÒeKiÇ¶íœÛ ù\"(4›ƒËáªd\re‡Ó¢¡¡q0²3\0|ô­øÅ\\mûi\0XÉÎpÛ\Z4Axà›Ïb\0xàM(z—Óéé\\Ø Ş%Ô¦MjÑ¢]vÙeÒ¤BÆMñø­Ñhr6\04š\\à©rçì\"%|VTnW:9¹”…¿qã&úçïYá/¥5kVÓÉ“\'¥™=ñ¥úÜ’Õìé|În“sĞ•Vå•YÑš¥ßÌU÷YaÕ»¾~Á\'Ï»˜º˜ÙP0¹%Lp8cG³À¸7†Ña¢^Ÿÿó5\0_åmçÓÖø*[¶,5mÚ”Ú¶mKİºv£Kê_B%J”š–\0xÃmh4¹C\0\ZM6 k@™ ƒˆ¢fĞ#ÿè±£´wÏ^š3kı;w.mİ²•NÇ–!xèÄg7ÛëñoâÎŒ\0—³¹\0ÇD[•_–Q…a.ÿ\0N™‡2\06ŞWïòe\0H à^)Ã¹0\0Ô%ê\ZÕ¤ q/}øpÙ²ÑÔ AêyÅÔ½[7ªY³•.…;Å/ï4\ZMh@£É§Ó)¥øÔ´4Qøh»ŸòóZ¿n½ôĞG‡<ä({Ï÷ÀPĞêÜ‚~•*U”æ‚ë®À¿Íy¿…Ë·@§I|oƒ‹˜	ò§Ñg´ ÑX9»ÔÔTÚ¼y3Íœ=‹~úi\níİ·—bOR%Uvè¥o³©1ïb\0@à8†çÉQÍ¹B¾	cv¸Ä¨A8p õéÓ‡êÕ«KÁÁA|5:r‰6\04\ZF\0\Z\rãæÒ|Rr­_¿~ùåúí·ßèHÌQJJM….jÜ<¹ÊC)( ó¥L]p~ğeè0Åc`Ğà¨W¯^Ô¨aCiNÊ¦3¡FSœĞ€¦X!ÉÅ@şEÂG5ÿæM›hêÔ©ôÍ·ßÊ<©©iÒÉÏåâ+Ğ¯—«* Jì”\r`lª6}ÍùÁ7î1¢À<f³¹¥© vÚ4ôæ›©oß«è’ºuÕ¨9o~H¦ø \r\0M±Imô˜çSæN›ö\'}ıõ×´nİ:JIIáójv:¯ò€vÇl{Şsb\0ği·Ù¡\r—ÀP0v5Eù´FOÆ  º´é¥tÛm·Q¿~ı¨dÉ’Rc \rMqB\0š‹\Z$o¥˜QÅŸLsçÏ£ï¾ışdåŸ”˜¨J‰r!;,”cÉ\r*g¨û¥§»¯À.=óMÅ‚ß³Œá?÷˜ñ†½¸\"é€¿Gr¹œü­ÔL‹4`À\0ºõÖ[©uëÖCÀL;\ZÍÅŠ6\04HÒ¦KKK“Òş¤I“è³Ï?§={÷ªyóY°cH®ñyŸqëFÍ³`Ïp^•ö¥€ª	`Š’ a2“éİŠ•9w·ñmœƒkÜ¸1İqÇbDEEy&Ò†€æbD\0š‹$e†Ç‚=9)•–¯XN&L 3fP||¼y+~V†,Ğ%ácŸT‰^áU›8fdŞ4u¼B]ÏO37®9_¨8À@±I\036oxñ*ÁÌàú¬î)8Î—øQoå}6ÒÄ”Ì3à–I†®ºê*ºûî»e¢°°P9oŞ-mh.t´ ¹(@2FiÿØ‰ãôç´i4áÓÏiÃ†\r21K†ì)5(J2Ş\"¼qÌ*Ê-5ı(xÉt²;2S†ÇÁÈ2§g5‰‰(c»p(êâ\' ÀAÍš5gCà.êÓçJ*S¦´4˜ó%j#@s!£\r\0Í‰™lñ·mÛ6)íÿüëïÒ“ß<a\r(‚š¡\"g¬z­(\0¶\ZßnãwQMC›(ºéÑG•ªl@höHMsÑwß}Gß|ó5ŸWMn·“\rL:v”RpJr2­gÃ	×¥»àº®iÓ&Ô¾}{JNN‘9vïŞE‹/‘sVä{°Ñå87¯ì0¿SQÃ—vÄ}µjÕiÈ!4tèÍT½j\n\nÂÜ\ZÍ…‹6\04$˜CøĞƒÿı÷ß§¿şú‹Îœ9CiºgÁª|°e+.\0ÓÊ•/KåË•“ñëó,¤íÛ·çBiâ…ÜtÛ­·ÒøOÆKÈ;ó}Ó§M§ëo¸\nå‡İî¦i|ÓéÌw°jÅJêÚ­+¥qüÔ|òÉ\'¢øØ34&ĞK/¿L¯½şšœ÷í_P±bE*Yª:y’?!F@vUñƒp™iÇš†p¼téRtİu×Ñ}÷ŞKõêb’¡à×h4\nÚ\0Ğ\\0 ©b¾}LÍ»zÕ*\Z=fıûï\\)•š8§äŒ+²2\0Î	¨jÇ³¥m¥y´É«ğBC­š ÚşÅŸJá¡atôèQjÔ¸©·/ÃY@|4nÜV¬X!ûÒWÙ²yµiÛFšK@xX„¬\\UJöŠcÇQzue	c„,˜KºK¸´ß°Q#¹ï€EyÖ²ñl¤fDD)Ù`—I”°‚_jJ\n‡7–´aÃzr¹~ı	[n¾WQÀW±›áµ±áFWôìI#G¤&›P`@€œ×#4\nMw¦ˆ‚jğäädúï¿ÿèúëÒ½zÑÌ™3eüş…:˜•¯PÚ^Ö–\rD¯¾ú\ZÍ3‡ªV©j\\¡ÀT¶Ÿ]®,EF„ËZø?NLñ	qìINmöÙ»w?qÜPşpéT£F\rŠó I“¦ò<+Ñe¢©J•*¢ĞqO™èÒT¿~=Vj.Ù9|ˆöìİ-×\n;Ô*Ô¯_Ÿ:¶oÏFK(E•ŠztëJ<ütª»8T¢êlš@¿ÿñuêÔ‰n4ˆ–-[&µRæ”Ä\ZMQG\0š\")Úœ—/_.Õ®èˆ5kÖßR‚5KµÖ’æçWN•2­ÿ%,=½ÏR¶háBš÷ï\\úæË¯è±Ç†S§©eËr^)\\7\r8€ÊFGKm@©ÿwÆ©\\‚×E¼mßºu3úIà¨ÂX17hØ@J¨p;w¥A`Ñ\'€ãştèĞAJµ&;wîâ0‘8•x5@ø}äQ\n	‘o#äÓfmË%õØˆP›9ÃÆ„İ!jVíÂ+fgD§N!ÊÊ•oŠ\'=á[±C¸0±ÔôÓ©Çå—ÓĞ¡C¥Y\nqé¥±f„FSTÑ€¦HÁŠv~ôä¿é¦›¨K—.ô÷ß\nÀ?¼ªêü\0…ºoß>éoö3ÀâA˜|¸œ.™¤æ»ïVË×à½=ªvr	Jã² Ñ–Í¢A­Šºk—®Æ+zVî–S®íÈ†	âJÕı¸Èatœı÷,UàK¹rå©—ò¡–åy>şÖ¬Y3C8r+Wª$ï¾ûé…]6ZÒÆy%›WHKK•u$P#ğÈ#Ğ={Î›±©Ñäm\0hŠRšr:)Íå¤],<xè!º¬}{úõ÷©äbmèæ’½›1=?´#¦æ….À}^ÇJKœõ˜r¨¶u¿~á©êvÊo`ƒjÕ®A-Z6£:ukK›°©àğ¼¸¹ôÊ¶Ë;q’u®CIÒN\Z7âûÜRêíÜ©5á}ààó®4½;î¶øÙèl—‡	}`ü÷ßBc©bó¨yóf|Ì.5—µm#Ç|©]«6Ÿ\"‡#ºtêÂ‚Ï¶Qº3fNŸeÂù=Ø™áºë®»dü¼	Â‡ãuëÔQK+ÈÙ,à8å/DÊ—§ñŸ~JÛ¶n¥&}G¼÷}ôÁû4mêï´o÷núeÊjßö2y/ô—@œgå\nß4$Æ‹ıg\'iĞpéˆ{\0%§:é³/¾¢f-[Ñ#Ÿ¤½ûršætÃï.Ñeø£Ñœor/M4šBÀ„ø…ò?qâ½ôÒKÒNşå—_JOô‚æªÂ/½ôRúlÂÚÊ\njã†\r´dÑbZ¿níİ»‡¾›øµiƒédUÇ8+xÇ7fª¸ÆjuPdà!6zLP_³f8Æòå+¤ŠÚPƒúõåyÍ›7ÏÔşğ¬\rêShHˆ´ã7nÜD£¶\"&&†<˜)<ááátÇ·Ëqë×²^WªdI*et6Ì*•*Ó¬Y³é–›‡Êâ=VàŒ–¾}ûJÿçŸ¾H¥\r+WRR\"½ûî»RÃ3fÌ:yê6rŒ8ñCæ\\£\r\0Íym¤hÏ?}ú4}ñÅRÕŞıqqqª½å»Y¢S½ç¡,ÏµàwSP@ =ÿÜs´`ş|ºé¦›©2++;Û!ÆQ’ŒŒ¤ë®½†æÌÍFÌË¬nµ\0e¸( ZÕªÆÊ¶Á%õ©wïŞrà}?øàéüˆmÀ4È‡Ç{œáÙŸš\\º\r\r¡n]»ŠÊJ•bÅ_«f-jÛ¦\rÆ	Â°wï^1Òx‡_B•üÙºùæ›¨B…\nx€4uìÙ½‡N±ÂóøÍ?øv5kÔTû™pSpP0}ıÍ×Tÿ’zÒŞ°š˜Mèg\0‡¡wO<ñÇó‹b”EÌWG<¼ğÂ‹Ô¶íe2Cll¬Ä‘÷Ù}¦°Ñ€æœ\"Â¿ü!˜æLãß,êÙ³§´›îØ¹C]hâöU|Ğ$ĞçV`Ğ[cÇÒ¨#¥“›õ2Î!,J†~Ÿ¢Ç†?B~ôñ}\\îVaf·uëyg+è•_­Z5ºÿşû¥„k*ü6j¨š@\0Ï™3±´gÏ.¹„_”ş1L¯›1ößƒñBæs:uê˜á\Z|/”¼åò5èÇ\0@<ü°øÍ&š\\ûñ\'Ó–­[½Ê™cˆ`µêÕÔ¾Ï÷Ã3ûôéM;v2(P+„aŠ7m¤ã0<,8v‹w.#îŠ\"û÷ï£x®p-\\¼Xj·Šrx5?Ú\0Ğœ3L\r—œ’Bë7n ¡·ŞB7Dë6¬ebgè-Y\"y*µ¢`aiv?W°Ò¶±»–KöwŞy‡Ø#Pj\"Š‹…8Jèé2DaE†¢{Ó!4bÄ\\zÅL|üŞì¥\Zmá\'Ê¯—¢o6¼Pï‹çÜsï=Ô°aCÙÏ½²àë#)-56¬[\'á53;~{ö¸œÚµk\'ŠîøÉä²ôÀõmZ·¡=zÈ=\0}\næÍÿ¯W-û×¯__ªS»\nÿâ÷ñcÇè§)?³1·Súñ›æ\ZjIjÕ©å	›Ä­áG\0ß|Çm·Ë»›FÂñå7_QËÖ­¨e«ìZÒÇãÇK;ºº€­à`6œîã~#ì¦+j H0¢/YBı¯îO÷±Á·\rŞ4t¶äW.ªáÖ\\¼˜2A£)4¬‚\r¿¨;ömºœKı¿ış»ª•³¹WBøîµºÜ¶èQ#Fpé<•œÊ2¸{Æ_Qó–-¨Aƒôì³ÏPrR\"ÔŸI\'gºê»ğ¿ÿ=NMš6ö(;´Ø¿_üğÀ· :;<,Ü£üM0à[o½%5y“ÒÍ›7O¶­`JÛ°Ğ0cèûï¿§“\'O{|5§Î:{Œ€ªÿ»vÉ61”úÈQ£ÄwÓıòë¯23j;Ô¨\rşşò‡‘\05”’‡µà’ğuK–,–ñöxÎáÃ‡9>Ÿ ?şDN\'&%ÑÄ‰“ä˜š`© 0ß¢ğ@ÜÆó;MœøÔ|}2şŠ?/ÇÍ|¢Ñœ´ )t ğ!ØĞÖ¿xñbêyEOzå•Wètl¬œG\'µs\"øP{`qPÖ™ÕPfZ´hAõ6m3”;¹t{ËĞ¡ÒSıĞáCôöÛoÓK/¿(çP‚E5;Jö¡¡¡ôêk¯IiŞìï€é|3Àˆ*‰Îqã\0ñ†ûºvíJ4æ	,ëÖ­gÃ#Ù8¦(_¾¼çiÓôéÓéà¡ƒÆEÕjUQÎ÷kçt$ÆÒŸ€ÿ:wì,«åIÿ}6äNÇ¦	Ÿ}-G»wï–šyAqDuêÔï|¿7FP …Üñâsªí×c}4	¼ğÂ4wî|êİ»İ{ß}b¨¾!x_õ¿@Í„™>ÎxÊ‘#Gh½z÷¢åË–«š¢s‘4\ZF\0šB\"Ãí ÜÑæ}ôØ1\ZÁ¥èŞ}úĞ†õ¤êCúÈí°8NRíï‹W B6æV<š\n¥Pè(äè2e¨k—.4pÀ\0ºúêşÔìÒKe\nW5		`:¢.;S€İ[Ç•«V­¢8VvPêØÇï\'§µkÕô¸¸Êô¡×½¨^İKÄ(\n’÷ÏïS\r…öâ‹/RÉ’%Œ]ó*_gEİ‡j{ô>Ç<æ¾W£&:\'®Z¹Jö3(QŞ„rÇõ3fÎà’8*Ò]NzêÉQ2?\0({ÌÔ¸qız1\\0ZÀéä¸WŞˆ«U«–2\n|”\\Rr’”è}©\\¥\nÍš5“^}õU*U¢¤øqæLœŒÀ4ÇP–ùRú€oG\rüA¸Mòío¶ÀDÄCU4¸\\n­Ñ£gO\Zşøãtâä)É;0¨TÍ‰÷O£)H²’¶\ZM¾€ r±@UBÌEÿóµïĞ>øè#iû¡-W\"ùaK9û”ÁA`b¼5ŸÃígÁ¼Ïá°I5üwßM¤ÛwĞ¬¿fÒ$Şşñ‡hÉ’E´yÓºû®;¥×>:–©àğŒ’`Íšµp@¶›•ıaVn6øÍ\nÃÆá\nLNL¦÷Ş{ßê…x€˜GÉÔA·İz›KKM¥µÆH\0+ì…¼œÌrˆ‹\r ”ªU¯.=Ş=áÊäŒ‹x&/A6~ŸX6TöØïñÿ«-†mß¾N?Aÿòw2åÇ.¶¥öféâãªö¤U›Vj\"!b‡¾	gâiÈà!Ô¶u\ntˆ¡g‡CMGéRQ*–wLåëşšù—7\\¸k!<>ü1j9ôæ›å9ii)j¢\"‹§\nù—ış\Zòı8í\Zş[ŸQ ½àû -{¾§‘”Ô4\ZÿéêÒµÍ›¿€÷SUí˜åO£)H´ )pPê„à9CNıú÷§ªÒË;\\ÙWx@pã™wßsÍŸ7Ÿ¸Nªä­Â_”kµjôî{ïI5x¥J•øgV&XÂ×1ææŠŠ’û}•F49#µ\ræõpı9ÌÉw0”kXÃ!à—ıõÔ“t(&ÆÓyÎ|Âí·ßN7–mkI5[øF4cYß…yúZXÃ…‹fÌ`ÅËÏÅ¶j …y\rÎÅq©{Ë–-|€ïüàıHµ¼	Â4hĞ úê«¯èßÿ•¸		1Î*°„.šÄü3üÂşÛãÆ‰¡ù|AEGGÓgŸ}&³í•)SF¾S~@xáZ¶hA£G¦…ÿı\'‹%-[¶T†_b…Dß¹\nÄÇVç~ıúÑ/¾H±±§Õ´ÂM0H4š‚D\0š<%5…fÏM=º÷ Ï\'|Æ¥d5n_”(ˆ8u}a‚*÷G}„Æ}[)~>æQ¶Œ¹_üuhß•átª^­z‹’ûeKMke†ë ÂÌÂÜñãÇhùŠåry=\\ÚµeY_x,[Œ¶_+*D{÷í¥ñãÇÓè1£¥öÄ,÷Á…Ëò¾0$ ÌÏõ;ş|	«5LpXYqÉ”ìmÒ–šVä:>·k÷n:vì˜„ûµkÕ¢«Ù¨Áù,ræëäñg*Vp™Ê_~ùZTél¸4à˜yŞÏ11uêT*QÒ;ë`®1kLØ¼ªZ¥²tÄ›7w.=üĞCÔªeKªÅßµEótïİÃhúŒioóèÒ¦M=Ï.l$~ù;a…Ë÷Ø(•¾+Vª¦™	3cœh4ùA\0\Z¿1…´éP]y„•Ä#FrIpíŞ½‡Ks(¹°²¹%êD)´,å©Ì^wvD[…¢!à10ÙyîùgÉnÌÊ‡«Fô*?eNÆ\"8§şêÔ­C?şø•B	_yEGcp¨3Ù¸t(>ğ)å‡rèÏÀe0çüÇâ>0\0ĞáË\nöŞÿ}©øò‹/hİÚuò|3lxŞé¡‡ÊPC‘ãìÇ¾½{å½}IJL¢Õ«W‰‚ÃäKÛ¶mËŸü˜3k¶ş÷ŞstÚóUŒr§q,£/j5Õ«×O­÷šqıÙ§è®aÃdùc3]ùÃ®U«Vô„ôşW×du]ähççp¸ÓeÂ¥…ÿ“‰›=£;¼áo˜\0	ñ\rC EËæækğ,ä›uë6Pß+ûÒ/¾ÀÆÙIyOëC¹zw&´ É7@¨¦\\´xõëß>ålJŠª¶¡Š_q†ò7\\fX°IOlÃå(q(¯2Q¾£-ÿÉ§FQhˆ*ù„ç×ß~¥.İºÊ˜ò{î»OªX=UÎ|!Bˆ©oßxı\rÕ¾Ï‡7mÚ”IáV¬X‘š4Áğ>å»õĞÆŸäÓ¡\r¦üN§SªÓYtË¾	FE|ùÕWbÔ ×ş“O’9€ª£À³lôôSO+¿2Ş5|\rîŠAéşäIuÌÂÊU+¥FÂdÎì9–¸T ¼K/VÈÿ*W®L7ß¤æ,0á€©‘1\"âLB¼ôÿP*˜p\0Gê5¨¯†Z£ŞL)÷Ÿ~úIÔùöÛoÅhÉª¶a<x°“Ì*Pş×\\İŸ~øa’,s,Ïµ„Ãé\0²|Ù²l˜|JáŞa“…ŠƒŒo’cÇ•f•+WJzÅÂQ¹«Òh²G\0\Z¿@)DJĞ\\Š…ùè£¨ÿÕWÓúuë¥Dl*ü¢#œ´|‰ÈB9Ú€Ñ&û¥—ªjZÓ•e¡}EÏÆ}*»vî¤ûïÖ¬YGûö ¯¾ú†n¾åJec¡SêJÈN7Şt£ÿƒ2^¸p¡bh2<ã–[nU;`;v\\zÖ[Áõ%#½UÖ¨îÆ1+è )¥töıPm?mú4#l^JpÉû×_W½ésI\"—ôÅè€b†\"g >Ğk»æ±…‹ŠÂ·‚\Z	(3n1aQéÒ¥³n6R0½eË–ÔºM™™¯S—ÎôĞƒÊ2ÎF”ØdŞ4‰QÅ\'#ÂÃ¥ïÀ¸qã$Máùè\'qï½÷JI}éÒ¥´f¥dÉRTµjO¸rï‡+\Z5l M,Xç\0÷ Vñ€Æ–ƒ‡ÑŸÓ§Ó*6àdr¹SQ¯^=êy9§\'³ªâ\\â¶ó»³±¶r5]yå•RK”˜”(ña~7ëwÕhr\r\'\Z&Ï8ÓœâvíÚåf¡äv;‚İ@v¼âU¿A¡îÀ@µsà q|< (Ìâø>7_ŸÑyÏW¬\\Å=îİ÷Ü±qgÜN—Ë=wşwdÉRîÀuM¿«û»]é\\eğ?Ü´3ÜÁ¡áF;åg{ô›cÜÎt§åJÅ¬Y³ä½J–,)ïi=Í\nÉ}ààwDÉò<Ï;±+UÊ½s×Nu¡Lî§G=éâçÁuîÜÙíâp[Ÿ•«Uu…rœñ{8ÜuëÕs?qÂ¸Báäë’S’İ½¯ì#×¨81ß\'£q±t\Z9Jğô.İºÊó&¼k\Z5Ü±±±rŞ„°œ		q³aåŞ³gÇğå—_Êıüíx°iáÑÇ“ç˜Q·iÛVwHx˜»tÙh÷=÷İëŞ¹{·Ä\Zn.å*£¢¢Üßÿ=ß™‘Óqqîú\rK:;«ãøŒ,UÂ½lùRƒ\n‰‹ÿœü7çßÜU«WwÛîğÈ÷=äNu¦©1.¾fò”ŸrŒësáìv‡;44Ô}Í5×¸8 yqg~WëwÑhÎ†®Ğä	N3ÒÕ’¶Õ¹kúkÖLY®%tT’aN\\f5$¨öu¥&œ³á:Iz8†ò—é”™ç@Ç3¾Öí’1û\n¶|ù2zè¡)22BJÂÚ·—‰a>P©Reïê‡Ènã°£t«àZ\\şöØ·éàÁCrÌ\næÁGÉ=ã1B@za{\nš6ªX±İvëüü\0Ï;9ø½±hP€Ãgæ>¾o/†âñ/¦<>|ôAõ6Ÿ2¦ämĞ —ìlâìö@Ú³w?½ûŞ2&+ùáA¢×_ı¬UàæólMåw˜0ásúòëoé»‰ßÓO?ıL«V­!LÖ—ÎáÆğÊ˜£Çè?§Ñ¿óæÑüÿş£ÅK–ÒäŸ¦Èy|ãv:R™èrø\"ät¹e>û±ãŞáçğ÷æoŸÎC<HL8ìR’G<«’¶*¥–ˆˆ¤ÒQe¨IãKé·ÇQ­\Z5¤¦=î\'L˜ µ:lØ¨°ó=	ÿS§O“÷·~O4³œ>­&“2¿{vàü5W_CM.½Tü€Su>6:°ï\0İqûtèP9l”–ì¤¯¾øŠ’¼“\'áÊú\r.‘ë¥iÈ¨uğÇå§«Tg:M›1“ºõèNÿÎŸK©®T3vå\Z•®sFà„¢ÑäšÔÔTw—¼yæ)‰ ”gG)4Si%zUêÏ¿vqé³GÏîÕk×¸YéH)%K8àäöÖmÛİ¥JGIMÄ}ÜŸá\Z¸Õ«×pé®„”ş½Käì÷ÓÏ>-eBUFU 4õÎ;ïHI´I“&n6<%,üŸÆ—<tÈ]¡Re	#Â\ZÈ¿¸6>>^®3IKKs³1!ñ]¾œ{ßş}Â7üñ\'¤Ä*~¥×èrÜ;wív?yÒ½|ÕJ÷÷?şè~ö…çİWôéí/™‡Ri°;˜¿‰=\0%uşufºñs!aá†‹ã8†sa%ÜQeÊº6nê¾ağ÷mwãs¸/óóQênß©£;…ÓŒ3]•¶ñ§bc¹äŞÈQ¢¤{ùòåJ­Ø>uê”û‘áº«T¯Æß&Ø]÷’zòİQ£ƒûÍ«ÿùw<Ûó<#¾²r%¢J¹7nŞÄ÷{Kığ+•ÓÒào–ğÃ¡¶.$$Ì{ê´zÁöÛ9>ğmTùë¬q”WggÄo©2QîwŞÇ}&1Îœ’$µf€Fs6´ É8\'JTÑ¢Úñºë®óTù*åÃÎ\"¤”ËŸ`”u/©ï<e\n+’V¨ªWJÀTšuÇOÆºG=õ´(s(ØA7ánögâÜÕªVwX•+NT[×¬SÓ}ôøQ£)@÷Ş¾}»¼kxx¸›KÌnÖcê;l:ycé²îê5kó³Cİ*TtÏ=[®±²fÍ\ZwXÇ‰_Á¡!¢ÌUø.6b>ûüKOØ¬JÍÁlp\"¼,ø=ñîq9\0¦‚Ën?»ãÖ0ø3÷³sgUVâK–-“f4Õ@‰§¦¥º;wí&×´k×ÎœœœIaÁxKq¦¹“ø›ã×z\néñæ[nå8G:3g	«éğM&º]ŞÃÂÏuòW“87‡°³0nà‡i\0Ôäï™’’*M7\0Ï\\»~_§¸¬iÆ]o—*]†©ó¾×šûùqâÇ/\\0%÷ÜŸ;æè147¦à¯\Zİ 9+œN¤Öúõëe\nÖ©Ó¦YªQ³ÃZY›,£\0J•*IÏ>û,­X±œ^w!ó­ÙÄjwß|÷t|sÌ›ªšÙ±}»T+[	£×_ïYß^€6>t˜şùçŸU´Ø®]»6•(Q‚’SSé¹^ S§3“GgöV­ZĞ¦MhÕª•´cÇö+è™¼óÎ;2G‚	‹eZ¹b¥Ï›9ã/\Z=æ-ºcØ]ôÖØ·œL$Ä\'Hç8||…˜#G¨c§T©JeªX©\"uêÜ‰xğA:~ü8-_¹’ûßÿ2u<DÜcD\0šğkç0uñü!ñ‘ˆ*Ì¸7tèĞ“!QişöÛãdh(Ö°‚Ÿ|ü	ätÁ:TÒÒ6¬áÀ÷aœ~Vàš€\0=òè#2™Ï0şAA…?‘ÒüçŸ}FW_}5íÚµË3BàBJ\'šóƒ\rV€±­Ñd\0Bmà˜Õí‘áÒ1nmÔP4„1x^mK¾G&¸q§Ë„7×\\s-½øÂ‹2K_€Ãê—hlù?66–¼Az²C +a¯Úé¡8ì?@Q%KÊ]¦b_»v=uêÔ™’RŒö]é› \\¿~WÑä\'g˜÷oÔ¡C\'1B¸8H7Ştÿä™áN…D¹ì@üÍ˜1ƒ Ùm¹ˆ3Ì¸OeS¿Y­¤\'¡`EWĞ˜a(ğÖwRàÜtÇÏ»ãŞ¡è²Ñ²¶€ïuæ>”İ¾}û¤7ü»rdÖ°°Pù~µjÕä=ó¹D»÷ì¦&›R*‘8õù.!AAÔ\r˜ëÙp\\¼x!}ıÍ7|”¯5â\ZÏTß‡Ó-§‰g}šìq1Z¸øMË–/§‘#GÒÒ¥K8ì|³û4şá]9ïH<±«X¾‚Ì–ˆ•ÃÃ3®.™]ühŠ/y”Òšâ€)tñåaG˜†ËÁÊqCşå¨o¤ï¶¹Ê¿rå\nÒáî«/¿ \Z5ª{”¿&\\¬ .BÕsÚÅ´iÓÔ…F\ZR—®]²TÚ7n”Ép|Á´³6L&Äa™<e2=öøc2¿>”—·ó•é¼a…òŸ9s&İvÖ0¨±\"éˆ•/¦÷mÑª%=÷üóRÒÆpHkœ!.O<)ÓwéÒ…öìÙÃ\n-wâScF+ğ{âÄ‰œN°l³q004óï¿ÿ¦ûï@æ%È\n”ü±”ó;ïŒ“É‰Ì\Zt:mÓº5Í™=›>a£6Bùg<fk¼îºëdAL8…÷ÔiO“º@“S`Àa66¬S?eÊ%DX !±ˆâ7KJ±ÙØW%TQşjÃ¸8 ÃB¥–%K–RıKĞãÚ\0€°¶\nşµë6P×nİDØ	Æ³q/ªâÿücªì›Í6şÃÊk¸Ç‰*uK\r@éÒQ´‚KlU+W“k|ëÓ§/ı=÷¹ØÜ.ë>úÑÔ¬EsÓfÌÿx‚¿111Ríÿõ×_g˜h\'ë\Z\0„3Ã¢0Kl÷À¯YÁ×æ6®ó@a—\Zİvã{y_[Æè×ªQ“ªV­*“!>8 ó:tHâáÂH8“ìÂÚ¬Ù¥2ëŸİ¡ÎcV¬yY»¶²T²½B^k®(ö/¾ø\\&ÁBÌtbú„æ¼Cå*Õd~Ï÷ÌY¿+Ç&0ÀÜ\nh‹ât5(|›Ä4\Zm\0h2\0E‹Ò3Ö»¿õÖ[iíÚµ¼‰iJ5AQË•†\0òÈìIÉ/€~6&á¹ê*U…ä	åşã?R$—ö!Ô¬\0VŞ{ò©§èİwß“kQ\"‡l„2\r£¸ôÖ¬Y3ãj Â9rä“²\0†\'¢6ÇÊ•-K˜ §bùŠr%À5hØˆ¶íØ¡Jvü,ƒ‹ß0OãFéÊ+ûPı\r¤Ùa÷Î]2›fØ‹=uJâáEÈğde\0ğâÛpxš‡Lf ãùŒøúY0º`1ØäÕxCš‚8\ršMB8p`[&ÂùÖÙ\0faß-Õáÿüû·:$wØ)!!Ê•/ËŠ}F¼~È¶Ä£˜¬Óì‡¯R¥ŠôİwßQ{~†Ü*ş«ûÌTŠï·hñbêÒ­»¤!ëT¾ş’³€á®.yV‡d’®šlP™ı\nû›j.´ ñ\0¡j˜õ\r³½aq˜t.Y…¬h|kIÔS°ßX3ÚŸÊÂóæÎ£#GÒ–­[¨RÅŠ´jÕj™ƒŞFÃ!g§N¥t(ãĞYÀ9Œ\"åÀ¥nVË”È’’“iĞàAR=«„e\0]İ¯}óÍ7,×A–;~ŒK¡UeY]•eØY‹­&¢<´€=¯˜F…¡èš4nLË—-ÇÙ§bOQùrå3õ§€òÆeH#Ù‘êÖ­K¿ıú«t£”ÁpAZ³*Y¯¼ö*½üÊ+ê@Aç™,@ø4CÔ­[>ÿüsjÖ´I†N‰Ö0jŠ\'…Ÿ5P‚˜ÏíïhC„2ç^HØ8)4üñÇXA¦ë\\G7m”ŞşèüõÚë¯\n*XõÎ®Z¹2=ùä“rÌ\\†×ı\00¥®ÕÎÅ5¨fşéÇÉôÜsÏQ·îİeºO?ıTV«ƒnxõI“&‰Íeç4E‰S§bé„Ï:%K””>&RCƒüÍ‘ÖkÖ¬A“&N”æìKj²Ú¼\r%ßìÒKiö¬ÙT»NöC™Èp›7oÎÔi#Î%f¾E²ß¾};İpÃ\r´xñ\"iŠ@x¬ùAS|Ñ5\0\ZQüpPv#FŒğ,@°\nfˆóRÈ5\0Àê¿5ô´^³j5Õ¨‰İ|ÌpX€¦}‡´mó6uÜ(+¡^S†øU¨PAáŒ8„è{€ÅƒT¾•ãÇNP³æÍéØÑcj6=PÕY¦HãS€ï:çï¿©}»ö²o‚¥~B\'—4Ğ¼EsšøíwR²9z„n»ívšÇ×ÀHÀ7‡jÖÉ4ù§Ÿ(ªT)Î\rJ™âş¹œÆ°hŒhk{;jÒê\\ROò˜pj\0€ùş&%KDĞøñŸPï^½%|fM—ïušâƒ®(Æ@ajY¬	ÿ	†Ç\\†Ç™\n2kXX¸Ñn¸\\\0“7!ƒk3:U®·QrR²,7l–ºÌ°¢öÛo½ÅŠG½„7Ö²¿yèP:Í%3TíŠ0çs*\\v™^JÂúÎIÉ)t×İw«eic@+ÿ•VÄñçB;?³Ó‰yÔ÷ÃwìÜ©3mÙ´™~šüÍ=›ÌŸ/Ê—T(Wşœúõïß_®G¤—>}úÈˆQşHüiÃdo<Hj“0O€zŠzÚÒeKÕØ1OdA•*•)*ªoÁSóâ³Ü”0rå¶;î ‰“&rØÓ%ïkŠ7Ú\0(Æ¤±@LHL ×ßxyöYJå}7¦üÌ‹pÍş¢L`¸ªÒMc GÇÉÒ×IRå€aR—?ÿœ&cÿÅ\0óìz°ğíÙór6TçASY£”†UîúöëGû0a¼o{Ä+_Uà?Aƒ\r¡{=¥<Ã?M	Øtœnìö\09yòdu¿\'v||*Y²$]sõÕÔ­kW\n	V+¢_\0nİ¶m»Ô¡Ê×c.\0D¯¤	©1â41åç)tÃ XÉ;©s—.’àÌ´3ã¯™äÊ¦ê]í»)\"2\\Vµüï¿ùÔ¨Q>ÄÊ‰Ût\0Ş\rµ{÷?ø ½ÿá‡ŸÏOÖi»8£\r€b„™ÑQ*Fu$–ˆ}şùèM.9–\0@Ïøo¼‘š6½Ô8’?DasXŸyæ)Ñ™ÁVáwË9Òoç0ÙË’eK¨e›VôÊë¯QÌ‘‰s±Ã6f­{÷½w©U«Öô×_‰1`·«]p’cAÃ~\":8Y?üğÃôãä<5ê‹f~\'¤—M7ÊÄP§cceä–&ğé§2²DÒÿáÎñŸ§[†¥4N?¥Ë”¦¦Mš(O\\ãä’ÿt,éŒN‚Y¢‰±o¥-[PíÚuèo6:`lø6IåMÄ<ÿüóôê«¯Ql\\œ·iBSìĞ}\0ŠøÔp¨ÄØôá?N?üğ½TYú9yŸ¹€/YW#â9ÑÑehÌ˜1t3\0;ví–	\\N<ÁçŒ‹ò¦\\ıK1·\r½Å¢˜Ò¹´ÆÂí…çé-‹Qƒö{´Ñ’ÃPä¼Ì†I£Æe¦AŒ$8|8†6mŞD‰	‰¾‚ã¹Ãü>F©H;³õ»e÷Bæ5Y·Ü/íê¸ñ‡ã¹ñûü’Áhãğcmøƒ¦Q#GQõê5d|<™`¢Ÿ~úI:•bâ¡Àà zløc2%5V7Ì Èùµ,˜OO=ı”ŒœÂéüó	ŸáÁr\ZW®^»F†!ªá†\n¬˜i‚¶ø{ï¹‡Æ¾ıV†	0(¾Q3ãÅŸ~¾F«9çghùÁ³±²æk¯¼JQQj®\0pÁ»š|£\r€bzúC˜`ö|¦MŸ.™İèN8ªGN!ëäsé¥MdèJD¸ÉÏ»ù¦›(99UöÏ&h²LšrJMvªV½*-œÿŸLk‡D/ìK›·ÎWüàçá™òlã¶á ½×æ®ó†G¹›áÃ¯qLÎ™áÇ/+·šïcĞs¨Ñ@sŒ7ZLÅ’.FšUTœ¨ûÏÊ°PW‰ßÒ÷Ã8ß}€=7çï7Éˆë÷-Q\"‚Ú´iC=/ïI\r6¢Ô´TQâşù\'­_·¯qSxD8½1z4İyÇÊHæûU|(Ì·ÂÒØ“&}O+V¤Ş½zy\rj¾şVâ?öX†˜1Ï£„&%Ä¨’c–¼úê«¯Ğh6 Qc‡c\0M`ş\"É\0Î¥0h®8€Ş~ûm*!ùÀ·Msñ¢\r€b8A§¶»îº‹şı÷_ã(Ä¶W¨eË–¥yóş¡:µëˆ¼ğS‚ÍM/½ô2½şúØdá“³0Ë:iâFu%7ŒZP¥3Uª²·LüşºóÎ;E¡Y1ŸyA&û£/,ÒÜS‚_ã`ERe`@ ba5Œ\0k¼Hœ°˜ µC0 t°Ö¿Š\'óZø0@ZÒL6£6|O>”Va}\'¼3ŞÑL‚P„Ø6\r ¨Ò%é6`ÑéÏœ|!áU7ø€…­i\Zşôbƒ`îÜ¹>€º¦v­Zô×Œ¿¨Fõê²/ù„ïğûĞĞ[n‘š\0kd^ƒ#÷øæ73nÑ7	½;îm™6YFÄFŠæâF\01æ§Å/V;s˜†\rF,0Î©Lî*„$0lØí2np`0ó	¨b½éÆ›höÌÙ,ğ”PÍ¬“&ce…shc-S¦4ÍŸ7Ÿj×©\r	Ç§•s²òêÕ«7-\\¸P]k?ó7k¿‹ÌÒÑÑÜ¬hQ¢—~	|Ø\"¹Ô†õJ–,AåÊ•¥reËS™èÒl„•§R¥JQHH°”èDñ³?JÑM!`€ãF\0úDàqˆµ ÎÄÇÓ±c1tüøI6 ĞÑ#Ç(îL>}FV)Œ=}\Z*ßæ8 Êù‡4æû¬ÜSØßÉ“6ğşEœ°ÁôóÏ“©{÷J©Caói¬…ñĞƒÊÈ\0´ÑÃ0EÉ§wxKk¼?vLfˆD”Õ\0Àd<‚÷ûï¿Kó@€#À“p÷Î];eªê£G0E±±éò™¿¹¤şıúÒ| éJšF,“gi.N´pƒO‡’?„ô™7oZBá\0AúèÃèÖ[†òê0e‚UúztëA{÷ï“êĞì’`ÖÇù˜a\0`{àÀëéË/¿¤\0.áš\0dö¢EKèò=¥:ÕôË‚Ù=³PÈ±„œ=è·\Z\Z&UËåË—§Š•ÊSƒõe^L[ÈŠ= \0%z;oŠÇ[áİğ¨€IwcZİì…v¨ön4™Èûámˆ{4%aÉYeX&%%S—X =ç÷ñw‰9\"ó\'¤H3ğ#²iã>§ßÉ\0qW¥j%\ZıÆtíµ×I\Z;Âïƒ‰©–,Z$ÊŠ{Ü¸qÔ°AC1ÌPZ_µlX>†TF ˆ^|ñ\ZşèpÃ€ğŞƒëÊ¾WÒâÅ‹#ŠÂ6\0\0ô}ÿ~ı9ß~Èé.”‚ƒ‚ÉE°4-Ú\0¸1?)ª8“ÓRe¢“awc4O•)Æoa\0Pz(Iü=g5nÜ˜MŒÂgÎœ¿iÀÀÒöšiÚUCä6i†‡‡É’»—µmÃ÷¨ÒØVHÏ<û¼ÌÓnåœ\Z\0gSü‚-¼DUªT¡Z5kQ£Æ\r©iÓÆ¼_IÚæ1šÂf°qµT³/V!o}Ç³	ÿ¬²·Æ™:fâë§tnãÓ0¸TS‚‹v³Q°qÃFÚ´i³ÌÇpğÀAùæP|lğ·Ê&ò˜\nÔ´ØeåÈ‘#FĞÿx‚6¬_ÏÇ½Š8\"<\\jş÷Äÿ(\"2‚ßgŒ8áóO=ù$÷6\"F¡V¥êk¯½V¦§¶¶µã\nŒËä‘‡iÂ„	¼Ã8sç\'>Îš8½â¯½æ\Zúğ£¤_¦å¶\Zş¥#MQE\0!ø¤p(ÇO {î¹‡şb©ô…·ú·°\r\0”`ë×¿„ı·0Ãüı&¯~ƒ^~ùåÌ’ø!üÛ²ò7çõÿèãOd8`\\Üi~×Œ%KóİÏI²÷\0Y+9ÌjØ¨Q#Y¢¸U«VWõe,:”ªáUPUïqnï»˜ß8+¬ï˜_mõÃ÷y¾~cß\Z.ùác67;V,(	\'\'\'Ñ¦›hÕêU´nİ:Ú±}‡,¹k}7á|\0Æ·ÃJ-•¤Q¼_æøìÑ£»tDt˜q€qÿX)ÓğZ©[§Ô”‹.KnŸøûş‡ï¥Ã!Ò0æ.ÈêÕógKæ(ô£¹ş†hì[oQé¨(iê0ï=›šm\0\\„ dˆ±½Xğæa.Qüğãê„O5«Ã(Í¸%S  4ÁÂÂlà€4iâ¤LBM’õÇÔ©R}ïIˆş¾ö‘G•iXwlßÆ~e-¨Ìgz²÷(TC™+ÅpI½zÔö²Ëdø\rr	+q€äro¸lP¼Ø@G5ó]2~¿¢–u³[œP Ê0ğ¾‹“QaÅIôÀ_¾|9mİºM ´T§ü*Ÿø,o¡â1Ş|°ä!y/~§\'ø²/ñ¾qœÚñ/k×N–ÿ5	“	‰Ú´n#ûğ	ïãbı¦Ô©c\'Q q$ïk}g3OøŸW}ãŞëÒÌx/Ìoğî»ïR\0\0ªÊ[x8›_šm\0\\DàSÂAéb	İ—¸tıÑÇy«ØÏ± ƒÿ¦×^y…üquÊZi[íÜµ+íÙ»GÄ„Ô\0U—è½®.MÆw5ñ<;~û¿?:R…³Ğoİ¦µmÓ†Ú¶mKe¢£ùÙ,hùñh;Æ·’m	¾Ÿº½¸\0¨ıEs¼¾*‹—,¡Å‹–Òš5«)!1QÅ¥hm“Æs\n)ra\0\0trœ;ïºì²¶Æ#úå×_d^\03.>1ÙÏı÷İ‡ˆ’cøgÑY°k÷n´cÇ9.œg\0 ÏÇ£<B#xBjğğL?Îæ—æÂ@\0(ù;Û˜€c{å8“óõ‘MAÏ˜`¥×WÈ>d5X¶l]Ù§{+ùòT(d§ó=±®@éÒ¥©S§ÎÔ¾ÃeÔ´iS1<í¨9øQ¬ñU¬la²ªuëÖÓ¢E‹Ø XD\'OÆ’Ë‰´ì‡¹TÖ…˜ÚµsG†ÎrH×7İtıüóÏ²ŸÎyò;ï¤	ã?•}\0±‡šº!C†ĞŸÓ§!ñ˜°9„ÛxW¿ÄöYâ#+¥c#G ÿ=ş˜ôy0eu­æÂC\0	RÂâ?Í÷ß_ÚÖÍLš?À¼Óÿp \'u™Òed\"–aµ\Z\0èöÍ·ßĞ=÷Ş›¡c[‘6\0mŒ¢ÚkKG•¦Î]:S×®é’K.¡ààVú|	ş“¸ãkq¹6\0²Æªœ8ºÌ	wĞDÀ%Ï8N×[6o¥ş™KK–.¡S0ÒQã£¢5K\nÙ\0@º.-³i^Öî2)!Tû·ãı;wJÉ5?MŸ!µA&»0Ö_{í5YâÚLJùã­²iNı¢J>ºL\nc¥Œ6zt¬DíÉ™¸8¯qà«¤ı0\0à:+¾òò‹tÛ­·R‰%ä´pq \r€|>8T“¢M}âÄ‰4|øğŠ4?\0ª«!Ø06\Zóš›öò*\0p=ÂÙ±cúã÷ß)œ—Û¬kdã“Î<õÔSôáGÊu h\0&3¼Æ,yQQ%¥_ÿ«ûS£†dÔ‚ğ«sII\0/ù©ÂÕp\\rüb^‚µk×Ñ¯¿üJ[¶le£7ãU}“œƒ\Z\0€a×^{\r½öê«T©REZ¿a=§ó’1„sÑÂET¹R¥Œy†Óæ¸…•*:AJ‡@Î§Ùaæç*U*ÊÚşúZ«VM*YBÙÇ\"?‡¢_ı•Ş7“Ujn“³å§œòthH½ÿŞ{üÜò¾0€6.l´p\0á\0aƒeJxğAJJJ2e¥ =—ıùÊ¸ıÆ|ù˜@è…_ô\"TTæ%(Ü2¤íî—…HÌjSñ‰Ã!veß¾´hñ\"ÙÏÏ´§şc‰(Â÷¶]ã·Víš2åk÷İ):º´ÑY\rÆ¥é¸<ÃõV2æ¶;š³€¸D©900ˆÓ!+7N‹GbbhÖ¬94KØ‡yÛì_Á«›@†t”ñ{æ„MPşXdçÈ‘zá…çe,ıÏ?ÿBİ»uã¾[z×›éaËÖ-tEÏ+øÚ£V•²FŒÜ}×]ôÄˆÇe¶>Õ¤„ûT=\ZjÑd¤‡%æĞaºíöÛèß¹ódı‚Ü\ZÔ¾iÕŠãµté(úê«¯¨S§NÓĞ\\¸hà±¤¤¦Èò¸hKDéòÎš™ı2\0øäoT3ş9õO™oãùa\\€<–®”¼R@	â³	hàõ×Ë¾Ç˜`!sˆ…W‡NéĞÁC|à˜LÕóŞHÃğ¼fÍ›ÑÁƒe2Ô`ˆ1ÄAWQmY( …*„´uŸÑM€]&#Z½j•ŒxY·v½|ã‹°Ëø\rr*iû¾3>5fi´Ë<¯¼òªt¢ó¬\r`Ày†î²¥ËÏš-!ÑÏà«/¿”&¦@VèVÌÔã›SâÏÄÓUı®¢¥Ë–‘ËH“ù2\08¤p¨Ñø‘ã² 4$4S\r—æÂB\08(ùoŞ¼Y&9xğ r±Ç\0ğÈ9dü<e7[ü¥è·ß~£6mÚJÇBTßoŞ²E•(ü6\0°(Ê²A1kÖß2,OàéÅiQ±ÿ5ü>Nç¹P–ˆ1™nWÚsÓ¥×KpèÔU™Kxüş¸H•½Äx‘à«w“-u¸Ì€O¼i ß@±Aá£&Š÷Ğ¡™\0jş‚¹””˜l| ‰P9ïÁÁüÎøö‡¢¸´<}Ú4ºôR,ƒ­ZöÍG¢_Ã˜1oÒoŒáğbIjœQDFÜTµj5š:u*ç“ºr¿Ã¢p±e5\0ğlO8ØÏ;wÈÓ„$¬pÉ©µ\0\0Pó,j«V­*ırºOS´q¼ÀÛš(ÿ#GĞĞ¡CiïŞ½ªD\n8?J¦4ó¥_%ıôÓdêÜ©³ø…vÆ¹sÿ¥­[·Ê>DZ^2¾\\j\\a„5V¬X)í™AAÁr¥	ˆ49¸\\éôßåxáÁOƒÒ·„MàC¥J•¤H•nîİy¿¸!ä_ü³Æ±‰ö7süğ¾ï·0Œÿ -šÕÑ0¢¢ÊPÇN¤™ñ»oß>r±ÒÅ·“O\'Wû|‹|`~küb”šá0ê¥^º¢¼Ñ©WÀ¡Óú`„ÈÌY³¥éKlFQãÊÀ{`4Éï¿ÿF\Z5ğv&ÅàĞofú_3dÕÍıü5Î0\ZkA ?ÂÆ\rŒ#æÍY“9½z1.ñ|ìØ1²Ø³gOO€œîÕ]|Š#š¢Xòì0|½G)3ª¥¦º8‡b2\0ÃVÇ~ë´±òÍFÆÆ¢(İ»u?‹9öµì`\0Œ9J:0BJM%ÿâ¹ññ	rKÁ#PÎx/´©âU±¨Î½÷ŞM?üøƒ¬šˆvOG\0ÚQ­%u‹œ•lbJ¾á´ò/¬qÊÎív²R\"*W¾¬ô7™4q\"İxãR›ã{ş±Ü“Ùå1òl{ê4\ræç¾ôò+”šæ”y¦ÏHsW]Õ—.úš5kÊ\nFÎ éSòÚèã?¢KÙH£Â$ø~àÀê}e1 Ç½3îç÷¼ç~5ŠÆ, é¡wï>êŞü¾ÿçdÃu³çÌ¡^|‰âÙÇºæ<šm\0\\€ £¡ôÿÉ\'ŸH¯_CKçÌşåèMìÆgEf´:?øûï9Æ–¢—ZP`Â)\'g¢‚Afq,4¾üò+š8ñ{51»Ã‡c¨oß~²*YÁÃÏ€²0!QåáMC‡ŞL?ü0‰n¾ù&\n£\0½ö¡üñ.¦ñ¥:úù:óœé²x_yœñlËó5ùÅ§âğ=°”1¾›*	Ã˜û~Ò$V˜×SH0ª­ù¶÷ø¸<bıöì@úÇHD¯¾ò\Z]Ù÷*YÓWq(©v­šôÏßÓ!ƒÔl{È|Ó]wİIıú]å	Â+aæ{V­^M:w¢óç‹²G	ù~Ê”)2—†Ô†ğ>Ò,F\np¨ŒpåŒõ2;„—Ó°áœ.7}ñå—ì¾¦ÓgâeêjÓ€Ó\\è>\0(ù£Šsüc›Ëçb\0xAµ7caÄŸZmgƒÙ“B)¿mÚ´¢¹èIÃ‚æä©“tÙe—Ñ¾}û¥J“#‚\'\'Î–¼0*\0ê¦ıù\'‹£aÃî¢C‡‰ğ*xğb*<ÉMĞYêÆ!7Š¢@<d³§Ç\n#LšÂG}7ùŸÓ-zŞOšô=Íœù%&$É—Í”Nó1„0«´‹C•+W¤Ï?ÿ‚ºvîlêê™¸\ZŠüå—_£×_{•ÊW(GË—-§²åÊyüÂµ¬ÒeB¤×¤\'O\"ĞÊcÁFU*W¦uk×z&ìQ=kö,6$úKòÍnvL0Ã +q^Ù»—Ô°ˆñÁNşÕ4—\"4çd,TùcZ]PXgÍkg»ÀMaaáÔ¬Y³BÏAM@ub©RQÔ AF°öU\0üï‚¶şS§béÚë®£şı¯¦Ã‡ğğ”ìğ¾!Ô«×4á³	2=+ÖĞ·Ùñf¬ğ³,æóe5ç|;|Sµ]¾|9\Zşè#4áÓO©WHN*ĞÕûà4ŞŸÆ½û¥É2É\n„..îMú‡t>½ë®»eùgÏì‘Œ›óÉš5kdÍ“§N©ƒÆyèqÇwÊğ<œŞºe«zÀYe€ \0òĞCÑú(™ßÉÓIsA k\0.ğ™ Œ±æúuÈb#Ç¥T1g\r®ÊæKéÖ&pìØ±4pÀ@ºûŞ{de3Üƒ‰fÏMQba…~\0è\04}Ætúäãñ´qãFJJI–K—uå°áÉ)y™Š¾Ğ“ ¿§¬eÏaD	¥y‹æt¿gí:ux_=AñÏğğ¾« {õY2_Uëµqãfúè£iÃ†œTz°Û26uù’›tï=ƒ\r¢7ß|S†Ù¦§»hè-·Ò/¿üJv1¼kÕª•ÁŸ£GP×®İ$ß[†5ˆÊ–-+tÑ¤ ‰™r¾îº²\0mÙCm&öò¬ÂyöD&Ì°Aác»AƒKhÊÏS¨zÕjò³©Pu}ÔUt\rÀ2sll,1‚¶Éjw*ßš.{p2ûĞùèÕW_¡Ûo»M:À}õå²z_ºK’Úéïşá`èJ*4·²°‚°™ûï¿2¡L™ÒrÎK!+t¿pSÍZ5ø]_¦Ñ£ß :uëò;©xQ²a†@´:ÈñchŠÊğÃ¼Xõî©§FÉ˜{±\noÚøşû¨wïŞ´qÓ&z÷½÷é·ß~£CëjÖ¬éQ°&Ï>ûœëË\nÜ‡	‘P»€•¡”ñ\nû÷ ùóWy1û»¨\Z†ü½«Î-Û¶ĞÓÏ<C§bO‰aQ%€&3zà\0Úı±ºß¸qãd|³[ä_cÛ+ÃÚåLûØğÇ¤iˆÅlúôé#«`\\>ÆÀ£ôo~ÅJ©¿~tÇíwPÕjÕ(†ï9~ü¸¤t„kÎa2Ïã7+—gPú6«ï¥\nßÍaI§°Ğ`\Zrã\ZÉÆS.õã]åò‡çÃe%²|Â`Æu†ÃâƒÚ>·hŠÙ¥)ÔAÖ©]‡z^ÑKÖòÇ:ş.W\ZºğÖ4uöœSÚµÚG£I“&Ñœ9sd†C€y`T#<x4jÖ0kàc?æ¹¨³\ny»“\'OÑ÷?ü@UªT¡&ÓğÇ—fIëü\"¸Îä¤î»_”ô‚óáƒø“ÌwT~Û$œ\ZˆB3~„_å.…y½¦h¡›\0Š0ø4pî!q—Ò1dÎœÏCt¾©”rœäŸ8ógÆ¼âÿ[H•*V”}”yÑ\n‚£F¤/¿úŠÅ¦Pc¬~vÀwÌi¾–†%Í™ó/-g¤Š5;Î&òœ4}ªßá£†\riÄÈÿQõjÕÅhÉÔFi\n^gÅ+d`õƒßÁj|yüÓ5²Jo’ÄøûyÒ\ZšŠøónß¾Ş=švîTUîŒ4SÚÌ)]›÷ewÏ—ÓŸN%‡á®úaòtË-·È¾‰o\0ü3kéğ{Uß¾4mú4JKó\Z\rMš6¢Ÿ§L¡jU«±¿üÇyó¶Ûo§É“§WäßwL7:—*Q‚¾åB\nš\rQ˜°Ævq¢9h ˆb~TıoÙ²…®¼ª¯t³ÛåxA€êÿ&MšĞÔ?ş råËYÔ†ÒéÕW_¥>}®¤Ö­[«S¹\0aG_Ï¿ø‚¾úú[Úµk\'\0eÊXÒ³(dÈ@””\"#KÒĞ›o¦ÁƒÉ{\nº}^“Ä ³IŸ›Y9~óÍ7”œ„¾.ö‹ëd‹i(úÁ%õëÑêU+ùYª\r5X¿ÿş‡ô@-*×‘odŞ½ùenï³a¨!ªDW]u}ùÅgT’´5ßa†Ï.]»ŠáNöœû=ä¬ö‰Ù«W¯®f\näcFk›¦ˆ¡\r€\"\nJª(íc¦¿;î¸ƒş™û¯·¥sR^AÂ®yóæœa§ŠåËgğ|Õ\0çQµX¦LãLîÀ}(ı#qÍ=‡FM‹/É |¬Ûù\"ƒbO§úõ/¡‰*W®,û´ É-Ú‡t¼}ù¥—¥6\0ãİÏJ>€€@mŞ¸QšÔ¤ÔÌyäÄÉ2Çî»<šç.©w‰4xÉh\0\0Ôza¸ğ¯¿JÁ¬Œo¾C³\"†ßbœA€°a¾…7ß|‹¢¢¢((0@\0EÿSª¦PA)Óå¢ô5ô1ÏwQù—»Q¡ä×­[KW^Ù—8(ÂNÆù³¾´qiS’šàŒ’ñãÇ³apR5I`v0¡ĞÉÏhÑ¢—4’²¼¦ €ß¡!ÁtçwĞ§ã?¥ÊU*pàìğ†Óhr‹™fÜ.ªQ½*}ğá{4hğõ2Ö¹\ré:;—dr¬¯¾B9_`ÿJ³ñI|ø!™‡ãúiêSe°V-[ªë|@\'^	|óÍ1ôÖ›£=Ê˜áDŞ…ò¿ÿşû<oşúË/ôÇPRR¢g(±¦è¡k\0Š ø$Pşb…¿e[€p‘êÉ‚“ñ@4¬ß€~ùe\nÕ¨Q#“ 3÷¶3gÎÈj`×u×]G÷İw5lØPæÇu’ Œduôøqß¿jÕêL~æ=éñõÒÆø[³f\r\Z5rÕ­[W\rAÒ\n_S¥ysÈÜš5«éÍ1oÊ¬~‡Şz·Ï¶èNpúŒ§¹óæÉÜş&²@ë‡4ğ/rÂêÕ«e>LÉ«2\ZxW&:š¾üâsºüòrŸoˆ°şÀSO?Å†Í‡’U%ß lÁ31ªhÊ”Ÿ©Eófª–F÷•šó‡PÄ@ÆÆja{÷ï§»î¾›áŒ\r‹İ,éã×P‚¢äò–™Í’¹‰ÒÃ6ÂóÇÔiÒ&]FÕX¯‡¢_°h!mØ¸Ö®_GŸ± AE`P —¼«Hi½€ÑËùº×³ò_Åwå\'ÓCBÁ»‚S#(0ˆ®½¦?=óì3ÒÃ9\0£ä#4šü éJK\r¬X¡õ`¥zŒÓöŞ½{ÄpV˜Š]>ijZ*-\\¸®ìÓ‡•hI9fæ?O>äÎÅT‰Ó<&à‘ZBœãà¶jÕ’~ûõjÛ¦µäCkh _0ZgÀõ×ÓO?ÿ<X¯Ìx–hŞ°~=õëß‚9Ÿb$+V™¢9?h ˆa÷ùå—e¾Ì¿ÍùÄkÃã×Pn†pRÊ.çÌ„êÀ¶mÛH‚ûï@†\n-Y²DÎ!#\"/ªYùNÉD?:u¢ò,\\0©|öÍ¬\'ÙXÀ#fõ?š~ıí7úiòO2iIt™h6`î¢¥Ë–K_€|gv¹ï©:7•.Sšñ?\Z<xd7;û‰¦€át…f€ÛËÚøw*n3}ËO~KÒ|ûÑ£Gé_6ª/k{™Ì\n(‡-y[è°rõ*š0a<p@:b’°o¿ıF¦V×[óÑŠ+déğ5k×H`­¹Ä4`àCË#ıâğáCR{Ñ¾};) Hm„ái¾e‚&ßè&€\">ª×§Nû“îæÒ?,{.¯Ë9‡‘9U\r€Q½m­æÎ¦ãòX£Fè½÷Ş“ÃLH4oŞ|ê%+…y??¶‘)ÑÛ¹té2ôã?P‡ö—É9ßÌºnÃzºüòË¥\0‚Œm%,8D†¦ç sŸôø:Qè¦#Ïÿì³ÏRÍ\Z5d?“0ÑM\0šBÇF;wî¢‘öîSËqK:tç§£®™ÖÕfdd$İzë-tóÍC©*íX0s‚`Yî?ù˜fÍš%Õù˜ÛbÄˆ‘4jä(QàO¯;Vül(@ŸOşé\'\Z>|¸ù¡ÄìÌ+1´°iÓ&2)Ò½÷ŞG[¶l6ªíùº\\çÕÌ±âÿî›¯E^„°\\Tñ£\r€ó6\0Š\0æ\'@FÆd\Zı¯¹Z:ä©V>dôíõfS•m±iùtY(ZTõÃòşñ‡)ºl´aJ¨»wïÙ+íöx¶ù|ü\"S¢RºÓE%J”¤‰¿£>½{eÊ¬5{Îl\Zrãb´XÏÃ‡MYú®ô°ùÜ³£Jüx_¼S=è±Ç†Kõ(:;Á—Loo¦ÀJœ˜§ã­·Ş¢¹sçr:EºæÔ(ùÑ7Ušû9¥M>g½ÍÈ#N‡üÍRÓÒ(şL<r_ÊøŒáÿûaŠ_Ïí¸•ój(F¿ñ:~ó-Ï¼\0¦¸Kà8¿ö½²/}ôáGT¡|9Ú¼euëŞƒbcO™Aà_c#Àt¤ÄĞ@ŒÌ	\rS5‹>2EsîÑÀyÆŒ~Tı£4=jÔ(šôı$ÉÚVnËãĞ\"d®\Z5«Ët½2½)cú\0Ã\"%5•JGEIfÖ	€Î@ÏúIl`qV,]¶”\r–k¤T‘	ö¸`:±G,È‚ƒƒhØ°;hàÀë¹Ä£š-4š¢\0fëüá‡É²¼uZšK)·LyÖ›ıÆ§fY`ğàÁôé§(Ë	[2dj0z`òäÉåo®	`‚æ³{î¹—^|á%Šgålœ9k¬<˜’â]¸(;rV#¨ÇtË‡cÆŒágDHs€6\0Î?yÓ*šBÁétŠ•Ùş~üñGQÈŞöld’¼gd®Şÿ€*BùsæD	\Z¥v¬çLün¢”(Pm)“Šğ9t ƒ\0P­˜\0µ˜…ì—_~QûĞºuš>mšÌQøî¬@xJDFJ¿ˆAƒkÁ¡)r „~ÓM7Ò“O>IX7\'…Xp”+W^yùi\ZP5†^Ä¡kØ8‡L‘	Œ²È’˜­oô£éMVÌaa¡r¾àúPŞ’|³‚Ï<\rL{ü/H’S’=}‡òã¯&ÿhà<ƒ\0%‹YşP‡Œçé„Ã%h¸¼\0ıˆN|=/ï!™Ï€J_¾b95oÑ‚®¾újºÿşûèÄ‰ÒÆ×ªukúîÛï(æĞa:qìíŞµ›^yåUªT©’´-b¶°[o½•~şùgñ_ü4ÂÚ¼YsºªïUr@ejœD˜óîÌ Ió——§÷Ş{Wš3`”`”64E\r»İA={ö”Å¦¢¢JqòG6s\n°n½zõ’‘7ÈjÖ<±ÿ~º¢×´hÑ\"r9Ñ@õO°^ƒ&4÷İ{¯\Z-`W‘¿øò+ñûôi4¨÷ğWYã.Ìa’ÆçŸ^ÖÁH)|ˆ¼Ğ†ÀùB\0ç$z´ç!3`şüƒè1ËÑlCÌ«â÷À·İ|óæ¦dúƒJÕù®]»d,1g9ŠŒˆ ·Ç¥ÿæÏ—\0##\"EˆU®X‘øßc´ví\Z.A\\-÷£Šó†7i¢”Ì…üÊ«¯Ò×_ÃÇø€¿a6AÛ½8Œ{&jÔ¸}úéÇT§Nm6œ˜FS´€BK§&MÓ‡¾/+û¥»]ô¬T!\\ÁÑ¡CGù…ÿò*zúc\nq\'+] gÒQo“ş9õêÔ¥ysçÒUWö•B€ÀA“ùyšîãò6n,,¹Æ?Ûwî ñŸ§Ä¤D1\04çm\0œG’’’hÁÂ…ôÕ7¬@qPr›ÕåLÁë¢.;y}àÿ¾›ø>|{²ĞOãÆ\riÎì9ôÀıÈø\\5<Gu5„q€¿¨R%é»o¿•¶;’šÂ‚á~úòË/ÉÉ‚.Õ™F£ÇŒ¡7Şx]”¿g®‚|ˆ”üİÔ¾C{\Z;v•Š*ÉG°¦¿-ÃÜ\ZMQCæàÔZ¥Jeúè£d3M{ŒÛMæÂAf®ûûï¿iÃ†\r²\rƒYJ÷üXÔœ¡™¯7—ìçÏ›G\Z4”óÊ¨¶Ñ±£Gé¦›†Ò;ãŞá}ÎqœÇeÉlušÿa‡H@\r\n>ÿœÖ­ß 5‹¨Ğ¥ÿó‡–¦ç$x(´û=vTªÅœiiÆÙŒø×`c¥YŠU¦²°‘ÉÊ—¯ }ĞÎ‡’üß³ÿ‘)zsF\02íØ±c©¥L9j£Ä„Dzxø#ôÎ»ïĞÛïŒ£_zIªö2cJ¼ƒ™üĞLñÜ³ÏH;¤O rZ£)’˜ÊÔt0 Gyƒzöì!VQC ÒrÁå~¥}ßªö­á0A¾Â0ÀÉ?NöLï;q?†õö¾òJúóÏ?Õ¬‡â¥ò…ƒ6­[ÉŒƒA\\\\½øâÒqsø†SsîĞ£\0Î1ˆnÓ\08KcŞz“Ş}çÙWsısF°(|»Ñ“8=×ãÚá¿‹6r	\0‹…È~æ˜÷ï<*W¾,5iÚDÍ˜çûåÅLçƒ‚y’ĞaCxn¼é&rr†EfàCMÎ©ë¬¶$24ö–Ü†…œD¤awİ!ÏÈØëÙ7R\Zñ}¦aä	ôëùàÃèçŸáü€ãgÄË>r\0ó`,[ºŒJ@éó>œ“\ròÛe™ßÉr\r”ktt4½ùæ›tÃõ7HcSáº8@Ó§O§{ï»—9.²BNù…G<1Bj\nOœ<Iİ»÷ ıûÈ½VrV#,Ø?#çÊ/ú½şÚë²b\'ìk#àÜ£g<Ç ‘#«`îîõlu£×pR\nË`¥)232ÜY`ÀuÆíuëÔ¥ÖlµãypPøuëÖ‘ÙËP(>\"ÃY&9#3ª1Ç|ŸB¿\0Ì#ğÅ_Èôòœá%Ó‹3š‰\\„ÛÀnwS``\0İvûmtûm·IiÅÆÇ2!ï˜{5šó†‘VQ¼ˆ1ú˜9P-å‹sŞk<NÈ.?¹Éã0fìlÓºµäKX(±£fçD€®]»ÒçŸ.kôCÑJŞå»Qòÿè“éÌÎ~X‘~tîÔIj®¾ú\Z\n\n`™IX~Lú‡”Üq-¤ÖÙÁUŞ0Cl À³aãFêÕ»·È\ZßÅŠ4ç]pAt£ãß±ÇéŞ{î¥™³f\Zj’³ˆ¥äŸg,%Ì”·bù\nŠÇ$õ\\kÆÊX JcAñéøñôÆ˜Ñ2^ø×_¥víÚqØT&ÇÂ?:u¤›6wd\Zëœw®À@»Ì>vİ€k¤ÍRge\0h4(.Ö™(•6ás™÷#ëÔÍi?r\0ùº\\¹²4{Ö,ª_¿>çuy\n5èÔ\'+ò¾™ÿqOBR\"9’>g£M„òØt\"Œ`xñÅé¶[o¥Ğ09†>8øß™æ¢[n¹•~ùU\rÆì /jÄzíÍ7ßL£_M‰¡ŒÀ*§4…Kş¥·&W ÑÃ¡z.…3%&èÁ˜XH$÷‚LòhJØ¹k½ğÂó\"<Î\'â™°Ä1Û×Ã†Ñ#GĞÑcÇdQ ŒÙµ‚kóÇÏŠpèÈôàCÑ€×q	EUOj! ¹Ø@ÍÛ n ;î¼‚ƒ¥VÎñğ¬x=y4 Ÿ;vœB\'¸P}äiø‡R<æõP|U~Â9,dÔ¯_?šğÙg”f„Ãª X=M\n÷ÜsJù5©ƒóg\0=÷Üsn,üÁš¿1´xİúuÒ\n²Ñ*4…6\0Î!ÈèHè;zôhş—/Í/Õş†Ë‚?üˆ^zé%ÏP ë³°	‡9Å{÷éCS¦L‘Î?È˜èiß®½·ô’0WAÌaÙ.”\0pSHH =ğà}tuÿ~,\\ 8IZÂ©Ñ\\L@ßtãtÓM7³q¼kœÈ¬,·lŞBıú_M‡ò(W€ÊH8äïyÿ-¼ù”’EÍ ÉD^o¿ı6ıöÛïT½F\rxé[^V®Z)¥vôàÏ/\'FA½øÂÒìˆæ\n³BsnĞÀ9%q(|$xÌª·}ë6ò»†Û¢ôor£d °Pô–Ï:ì½>f4õíwı·h¡„~ğØ={öĞ3lÉ_vY[£\'±*5`n}ôøpİ\0ñí‚hRX¹r…dR™Á+?™ÔëŞÉ%T\n´Ó}÷ßËÊÿ*BÊòç÷Ò2@s1b1Ø‡½‰†Şr“¤{ìç¥³l&Ød™•+WRûöí¥SöÅ˜g¥{ä÷û|@¦ôŞwà€ä5Ï¡oÀâ…‹è®»î–)zÅğ7Úä:v©\\pyåÕWèò=iÃ†M,a¦ùáÆ¢FhŒÒœ;t€sJái©i´cçêß¿¿LÌƒÄo®ÊÅŸ‚3”g\'gå]š–/]F•*U¦í;vJO^¬#îù¤øågÀWl–*UŠªV«J±§NÑ¡Ã‡E‘ËµÆc±ağÍ7ßÈì{æ½Pú×ºşœ:UüùÄó*Ø\0HGoÿĞ`ºí¶Û¸$4Q§°aõÏxOæân‰Ş{ÿ}.uÿÆòŠyÀÈyÀTÔ˜Aù¨VíZÔ¶];\n\n¢M›6ÑÒ¥KqBj \\Æš\0˜øëÙgŸ¡‡zUrÌŠä~ösóæÍt÷½÷ĞòeËx×£äY&?jÄíJ“>Ki„NÊfó‚é·¦ğĞÀ9\0V-¬Û¸ÓqôÆè7èƒ>°$nşåL…ë|ÏŠå&|:nz‹yP3ñûIÒF‡ª@(nñÒhW÷ıÔªMÏÎ¥†Ë¨QãÆtå•WRnİÉq9SôWè}eÆ¥ƒı¶şÙ\0@[ã A×Ó°awÊóÙ3u\nq¢\r\0MqÓ::¿ıöXšöçtdHÃss+|àüÉE\nµ‰ÿç‘¥ø8öYØË#0Â¦sç.ôŞ»ïÒ%õêyd‘5·á„øYFS§¤`’ìÃ•/5‚|Î·?ñøãôØcÉÈèh†Ë++56\0ÎPÌqgÎĞ¶¤1Á\r†ÜxáÄí‡Ğ­kW)‘›kkÛùm|0Ÿ8Aİùí·ßPRbû‹¶uöÜÇ;ŒŞ¿¯ìã\Z4`f@“#Gb¨cÇN´oÿ>ãˆŸ\0šø¯¹º?=ôğƒbXÅ„Q\0šâÒ:\'y”ş_yåúçŸX‘úä<Á\nŞhJ¡ÎùÉ4\0\0dJØ/¿ô\r2D:ô™³3·A^-[¶”|ğAZ¿aƒt^„´ÈISäÛ\0`J„GHóEƒ†\r¥IC6\0\nSš&`œbr}4ş:ÅÊŸÕ´Ç)›<o C`®oë­ÈB¨ŞÑ¥ËĞûl¹Ï˜1ƒZ¶iÍG8sJ[>~ ø:v¸#œF\'Ada_åÕÄ< ÷š÷ù\' Ğ®è¦®]:I§¿ YT½‹éÓi43’ÆÑûŞF£F ËÚ¶eEjIÿY¹Âwˆ#8–/XF.ÈD¯@óæÎ£›oº™‚3(•8æ@)¼W¯Ş´~½šNó˜#²s†&¾ÿá‡†Ò\\jD€¦pñG’kò\02NZZª,Ì±õ2Æÿx‚îº{:tU«Ê(ÈÎ¢LíJ¡vhßfÏœIo¼ñEÉÔŸ>_˜”ˆï0¨Àüùó©K—.ÒA%‚ö¹•]C¶ì1öXfø“ ë®Ñ€àà`Y\ry$Y-KÊ—/O_óôí©Q½ºQ¢Ïòü¬Ù³d ëIsª©É­r¡°A\ræÔ?§ÒæM›(™MšÂE\0…”+zıc\r~±Á@ßü(µ\0yÌõ2óı÷?H¯_ÌÖ…‰|¬˜\n;\"\"’†?ú(+ôtÅ=jw/Èd§N«{ï=ô×_3èÚk¯¡¾}ûÒ®]»ùŠìÂ…ã¹3ùÊ•*K5§šÛÇtæÖhL_ÑöıÚ«¯PÅŠT¦) Píß»w/iû·æXÈ\'äÿãÇË\Z˜‚{ÛöísÒÑrDjür—×óâ\0òòã>öÔL\"¦Ó<º@!hÅ[gX±şóï¿2vVÙ@Fr£Íßˆvä«¼~OU Æí£Ú>€ºvëNï°‘Q¯^=~6[v|B	á_õOš“~œü=óÌ3tèĞa¹”ˆÂ´¿jÉ_Ìø‡p+BjnØ{.kÔK!J—¢>|_VHÃqY1Íx¶F£œ 8¿lÛ¶yd8%²2Ì$ıh~CV{ùå—iÄÿW9×Ì{ì÷Ò]Ã†É0ÁtÈWº´½{*…œW\ryfÊ£°°p.ÜL¢vm/£°Ğ0O?\'-3\n]P ÓÂaù\\tøûğƒ¤\rõĞò.ÿsb–m‡¥Í7ù¶mlX¸d	Ğö:Ğ˜7ßTÕg’sÙq8à5‹µ7ßt#­\\±œnºq°”Ä±*×É“\')>>Ãi*çì~¿½b\"3¸†f<{ê©\'Eùc:Q³P‘ã½\ZM1¹¢víÚR\"ÏªªŞ`C¼ıö8Ú¸y3¹8¿C6(G{:–öîİ+M\0é’÷ÑÙ3¨éÌ<0D%q!äó	ŸÉª¡™Œ M¡\r€B\n%ê•«VÑBsÖ­lÒ±,ö—ÖL`n{ô(;Làsš3†\0b¦¯%K–¨Çe‘£¢¢daŸY³fRıú—(ËÛôŞÌóYÜ—ÃlÖPİ}÷İÔö²¶,XÜ¢üÕ=¦Óh4V ôí\\¿¢×tÃ\r7ğ&ŸüÏ3¸Ó?òØ£¿\0ÙşòË/—‘I†U\rgùCÄ‚Ú ;1\"bãÆ^ìk\n½\Z`!\0E8P²~ê™§Õò™œÁ¼y½uÌlU¢bqg\rî­P¡¢(ÔÇ¹t€É„ª×¨N‡”ùP %wvÇ£¯¿úZ†¶k×BBB2d0³ö¡J•*tÇwP2[Ùk×®ñ¬ëo—?c›Ê9!ƒâ·ú¬\Z\rƒ=¯É‰``ˆ™.Í|¯FS<‘¢¶ŒüÒ´iÚ¼e3‰‰1Œ~õ·Ìf£}ûöR¥Ê•©e‹Æ1V\0Ô¦UkšüãÒ×©ünâ\rWaa…2Ÿ‹_Ğg\n“A~¡ÿ‚IÆğiòƒîP`ÒŸ3	ñ4{ÖlºãÎ;(Õ˜yK­ö§¯ôğMÇY|	|´Éõëw•¬ÖW²¤j¯Ç­ğeŞÿàzcôŠ;\'C1u/B­@ÍZµèí·ÆRïŞ½Åkæ1·œ|ı·ß~Kwßs·qÄ„¯0áJõD…5 ^ÿLÃÀívQİ:uèÃ>¤ğ0ÌêeV8‚lîÕhŠ=Şü`ö¹9yâ$Ñ÷IŸ5·96^¬lÙöäò“Câ[0çÿóçSÍš5\rYà–æA,ôğ#ÓÅ²*S?u]aQòkÈ&ìa+\"\"‚~øá{Yê‹\Z™F€6\0\nÍIM6 W-¬×ø3ñœ©&È¶JÒ¢òåµ%;] ±£÷>&õ‰ˆŒğ”¦åÿ…„„Òÿ{Bó)iœP‰`ìŞ½›ntİ|ËPÕÑÇíéà!•Ï¿øÜØ³ÂWyòšõ4¾†Ÿ[6º,½øÒ¶`>âdçmÈş^¦¸cæLÓ‘ß}ê©§Ä6çùPXóqıÙ²gÃÇNĞC=LNc˜îCî:t¨û5ëC–”ÿ­/‚_ÔH|ıõ·Ò7	5ªº¬Zğh €A{VÊZ±r-^¼˜2‹:‡êıœ¨P¡½ÿşû¬†ñÀ\0ğq g^ÌëLbÍ(8õıò3uèØ>üğCÉP\0%&|F+–/—c^Ø_„9á G‡?BÕªVS}4\Z ³±îvQÓ&MhØ]˜6ü˜yÛjTç\rtşdüxµcäï –/ï¼óEG—“}A·ÛÕš¡°gÎšI»ví’æ\0ÈVSŞi\nm\0 H ¨şGbÅ¤))©–ëGÂåÌşÈ#±2­¢‰lÀ30İ/–\r\r	ñ))0Æ£OŠ¥\'x‚zö¼œ–-[Æ™ß-µXšX†f\"a¶©¥„±ÚX§N•!bœÒh4şaŠP·îİŒé¿òSÏ=û,mİºEFI$N<%#…¼pöÌ@˜En6ÏÉyEhpU©R•Ú¶mCíÚµÍşŞ\\\0‘tút}ùõW2$rU×,º@ Ê2ÆÑ¯X¾’Bqqgü,øã“¸©Zõj´xÑb™¯*J\Zµ;vì ÊU*SéÒ¥Éa´J6ãó\Z5¤;wò—Íü`ë2¾èXsË-·PLLŒÌ¾¥òhìAK¦ uêÖ¦÷ßOV“dÅA@ï/|À\Z!>~h4\Z…YpğŠg‡4+b­ñ>ÎÛT‡[>ù+L?;thO3gÎ~D£ß|‹>úğ#©j—øŒ|‹Â„ì‹¿jiaŞ‘	ÅJ•*IU*U¦êÕ«³Â¿ŒZµjMõêÖ¥ˆÈpv‘´ÿàjİºµtRV«æLV¥{\'Ñe¢èÏ?ÿ¤Z5kQd	o(qYÜ£É=Ú\0(\0…phï?zô(=ÿüôÃ÷?È¸Zïr¿y\0™ı{ó­ÑôğC«cœĞÉ¯oß«dış2Ñe¤§—.qƒº„ÿî½çZ¹r+öÃtòÔ)1JL¬\0nÁ#•Ù@æe’å@}ü‘¬.æIRìmÀ\"´ Ñd‰¯€5<ì»{àş(-MåÏ²ÜoçÁ\0€¿÷¾{èŸ¿ÿ¡­[·ò3Qmó	¸FÉµÀ€@ªZ­\ZUå’=¦*¾ì²Ë¨eËT®\\Y.ñ‡zVî“0ãùFOçß§Ÿz†Şzë-NßüïC–Êœ¥“‹†?:œ~ğ!™ÖF‰wdQöşiÎ6\0\n\0(V´¥£msş¸n Ç,‰Ó(¥çZá¹©jÕÊ´xÉ\")ı,\0FM/¼ø¢ÚçÏV¿AZ½zµÚ7€B‡Òw:tæÌÚºe+mÚ´‘Ö¯_O{÷í£ıì:$5	(µg¨úÏ`\0Höb§A&ŒwA»$7lØítûm·%¾O\0\ZMñUlélÇË1Î3_ı\r}ñù—œÇÑ&~æõìra\0XÁmÈ³2ûgÕ¨¨RT•=jóš7k&Ê«óE„GH$é‡à!³·Ïó°ï1\0ÒYŞ æ-Z¨~G¾ùß‡,•9r³?U«V¥©¿ıAUªVQ\"ùZñ-«{4¹F\0\0¢íS˜Mì¼üÒ+|Ôš0so\0 \rJò¯½ú*=şØpÎbê“ÇOQÃÆ<K	8¤­}úŒ²Ÿf©ßì¥¡>}ûõ£yóæÉ1•Ëğ‹pšÉA²;ìg‘DŒwÁê¨öûtÂ\'²Ÿ¾O\0\ZMñUl²Š\'“îvJÍâ}÷İOÛ·í`#@å!UÀ.\0([6šÆŒC­Û´¦ê¬ü¡äQÛ€ü‹p`˜ È,	r6\0d®Şùä(é`˜)ÿû2wÛùYÆû6]}Í5T¾\\y–ñI\0ùÃZäÓø	JÑ©\\â;CS~ù¬vCFQîì s—+WKÓ·rfóf7¬ĞåoÚk.VâX¯v0ş|/\rà° ª_2\ngì•«WÓ¢…å²7¹1¾–Ö½iáã9³7Y@Ï<÷4_Å×B¡gp>÷bßz^£Ñd	ò¹Õ™yyÖÁyË; ¾‘·9Ïæc¤Q|üªY«:Õ­[Gæİ·Ã_Pı^?±Å%F)D ÖÏårÓÉØXš¿`ıüë/²„/ú$ C2œ©^îgcIù=¾ïl:[:‡ƒeÓÄ‰?PB|\"‡7‘Òœ.˜g‘Nš³¡¾Æo@Q…–˜@+V¬¶4óÜûàPTTé‰ûÎaÃèÑG¥²ÑÑrM£FèŠWgsÂúÒK/Éhx)<òt£Ûn¿Mªç$¿k4šs&ò2äFŸ>\0ş‘œ’Lo½5Vš1ÏÆ¢Å‹é…_ ÁƒQã&eÇÿ÷?jÙ¢%:¼³õ™œ‰§#F°ÌÊ¿Á¿jÕ*Ú¼y¥pxÏfLhr‡nÈ\'Î4\'%¥$QÌ‘#²‚×ìÙsŒ3^PF-^–@™âS”-W–6nXO%ŒŞ®¾ sß§&P›6m¨w¯^°ÿå>,œˆ˜é³fa}qå\'t:ÿ¿øgŞü¹Ò‘ë}‹ÿ¬øİéVë×}îm·ÛIM›6¥÷Ş{WJ$6ó%5\ZÍ9!1!‰xğQÚ¹c§äsAŞ\r\r\r¥Ù³fQƒ\r(!!‘‰¡½{÷ÑU}ûzäşGoüƒn`¹—&kôºâ\néŒ\\**J®1IOw‰<\Z:ôš?>ñ¿¬i>rîÊ+¯¤·ß+C8Ì>eJ.MŞÑ@>IKM£x.ı¯^³š®¹úZJJN1ÎøÇ#<LcŞxóKÖÕoæ$ÈHüØÆ’èm‹NƒXÿ»v:Ô¬ysêØ¡UªT‰J–*E!Á!teß+iÁÿá®¬\r\0©š?‹µÎ×„†ËÔÄ$‡´ Ñœ[8ï®^³üqU£\'µxyW‡fŞE^F»#\\˜9~â¸´³Cy·lÙJ|…Ãzı]»w£µk×ÉÄ7Ç¼)CŠ½¹[6Š|“¬<ºRÖÈÍ0Àì0\r\0\0CeÖ¬¿¨NÚY‚19šqN“w´O0îÿØ±c\\~O–ıUÙÄ[ÚGº÷m\nÏ	Ìİ¿?\Z5r$Õ«W—3gFC +³\0;uê$ópnaõ­ˆ6<‡#@2M™Òed]şµk×Jïa(yOõan‡ÿñ‹˜yñÖ[‡ÒwŞ¡ò;Ğmú\ZÍ9Çå²‰şkæ_äLuq6ûğäk	È.çõt—SÖ™úûTÏ5hûÿ÷ßE<ôÈ#ùùMP@ÁPÅëo¸^j&PK ¾ˆ\0ùã¦x€>\\æA	ÃÄg\'CĞäm\0ä´§£cŞáÃ‡eu¾}û°úW‰Õj\0˜äÖÀH€ˆˆH\Z0àZúßÿş\'ëƒÃÜîğd/ø„ qãÆÑ¤ï\'Ñ‰S§Tfæö€@y.Âjgá€¶8l›Š”¹5\0°¿ªU¯JŸ|ò±”Ğù/‹ i4šB!cfCVF\0«„8qR†ú^s6²3\0 @°ùï?ÿPûvíqP®Q²Ä.\rsÑ\"“eË–²ò¿bX&\Z‰Â/vıÑ6¾@ÕjUé?~§\nå+È¤c˜§@ãÚtÊ˜5ãé.\\Hû÷ï÷/ug¼Áş¯¾ú†Úµë@>:œöîİ“­ÿÈ èˆ7vìX™è¥£¢¤ö İé”LÌÛq½7Såu3ü¼÷Ş{),4LüÍ³7\ZÆP¢°8ähö»eèPœäj8?È,°m£×_{Ã+;øÃÕµõÁÌû/]}õÕt$æ<ãƒF8Å¹D\n7ùÁÀÜË—­ ”Ô4r¹Ø±Np¦ÉÚ\0ğT…™Àüa”ªU•4_@œ9GãÇ§-[Òcÿ{œ:hœA†Ê˜ğ‘)+Wª$cn×­]\'†@XX¨œS½p­×›3§ÀÊÛXÉÔmÛ¶•mFs®ñÍ“ì8o_Ñ«—·?”¯5{›.×xo€ŒY°`Œp,ş`çáfÍ™-ë`=‘…8‹ ÉyL4d§;ÈTá;uàÓfáï[T§f¼ßÏ¿üB‰		2ûªzÆ´à\'N.YÃ@OWÕË•á„™Î1ŠêÓ0\rò¼åf¦\'mé²4æG}D\r5¦‘£FÉ¨#e\"Àî \nåËÓ{l¬]³†ºvëª„‚‘ÙÄzçOoº¬±Ü|HH\rvG¦v?Fs°æI‹\r•šB5Aª*÷uÙaÊš@€±ÃÑšµkS¥Ê•Õq(¿L™B®»âãäˆš—\0gmA£X^mÙº™fÍü‹î¼óNºeèÍ|\rNáÏW+VZEß+¬c Kœgõš³¢\r€<‚D‹Ó\\õoöìÙò›i¾Bcvß~g\réÅ_¤ØXL¤ÎeÊ\0œË0\"\0Cvuòƒİa£nİºQ:u¤£F£)*¨Ezš]z)µhÑÜ2½·RÂ^—wÚ·ï@ÿüóŒ$²bÊ\ZJn½õVJãJù¾ „şĞƒPÕÊU¥Ó1BqeŸ>T¦tiuàÑXhí¿ÿR*Ë6Ä4ş¡\r€<`U°Èph§ÿıßMc9ÇqşÂ€<F¼öúkÔ¨Izëí·éÔ)Uõ†óâøZ\\‡ê;XËªÀÂÃÃèæ›oöL)¬ÑhŠ\nJ& }ıî§\0™!%\0„€)œ¤D70`æŒRŠ÷½²C{ì1QòrÌM¦ƒA–æ¤Ï>ÿBÂ†iÃùEG—åÂDw¹Ç?lär¦Óï¿ÿ!rÏ7û˜òO“;´$aó+ÿÍ[¶Ğ¦Í›%á‹Â…ã\r?j¶²Çš-ãjá?AO?ı4]ÊÖ?Öõ?qâ„„aLNI¡W^}E:ÊøŞ9-ì¾}ûÊ¬_Ö§ÑhÎ?ªŠ?jÖªAW^Ù‡·Yç«Ã\ZİÈÊÛa©UPCŸzè!zã7D¡Êß”GucVÍOü#¥¤ZæGa‡\r¦š+ò!C6lØH»ví\0›-—ò†6\0òª›$Á¥¥ÒßÿşãQş’=\nJégÀÌTÊøÅ†Mú\"¼üòËÔªU+zíõ×Ù08Î¥ÿù´tÙR>ïÀàTT\r\Z4Xzÿj4š\"ˆ!\Z ûn»í\náB€SË3inúkæZµj%oy;£¦ñöÛo§¯¾úJö!~XåªÓr	b#„d…Ô•+á—-ZP\Z5ù•wĞäšO‹-–É‰ —uÉ?ïh  a%=´ÿ\'Ä\'ĞÔ©S3çŒ–®ªöB©?æH½ü\nm[ÓwßÅ\nŸöÇ\"6ª0ĞŞ¡=e£ËÈ¾´ãÙ‘±•Óh4E0àº|•„å^ÎŞ/½ô²T¯C·‰¡İ r²Îs­³¶QÉ4¶lÕ’R¸Ğ$58Î—G–ˆ¤ë¤€|Lâƒ0Í˜1Cæbq:±J¢î˜W´`é\"‘Áâ\\µzµ”º‹\ZfÚÇXÜÎ°’áŒÌ˜{¼×—,Y’‚\\nÑh4E”\r\Z$y7?@\nÌùûoZºd)íÛ¿®¹öZZ0:Éd,„xÁóëÕ«G#GŒà{—Ğ¿ÿüK];wÉ¤˜¼^¦öÓ/Ì~ºwï^\r#@“7´`Á¢ª	m`sçÎ•¶qAFæÉïÄ\n¹Ñ‡O*KƒÚI–ÑdÇÁ–çeç2€)}¹ôP96$7Pdd˜Ô`<¯Û­ªÚ²¼W£ÑœG8×r¾w§c&ÑÔ¯_?UK\'yÚ,™çåÚ÷¡TŸ|ú)ºêª«d5>ttf	 †:³ì’~}xFº‹J—*A\\G3gL£¥‹ÑK/¾DõêÔ¥ À@¾È&Ã“Í¥Êáê_r	]ÂîlXå¯ÜILJ”Îh–…l6k%4¹C\0y\0ÃıĞ`\0üÍ–q~JÅ°|¯¿~ Õá’Õğ™ó\rg3\ng+}€qD£Ñ\\(`~|ŒÍÇª ùş,[º”¶oß!ûVåPÚÇÄ`|ğ¾´õ÷í7Ô¹sg‘g“èS„YE³ªEÈ-Ö&Àj¨¨pÉ:\'šÜ¢\r€\\bZñññ´~ızédçÍ6.4#*s—±TfõjÕd†¿U+WĞš5kè¹ç“é|Ív¬óŞ5®îß_–ÜÌŒ¶²5š¢N©R%éŠ=xùÕŸ<«zö§Ëøf”ö1É\ZBmTeÕğG‡‹,Daè{î‘ÎÂ0²Rè8b×7å®íÑ£E²±àww\"¾Í\0XşºX¶ùyá \r€<‚*±eË–É¯¿sPcXMŸ+ûPhH9T§N-zæé\'©lÙ²’)rYµ—§ê½Ü`~ÈCÈ‘—ğh4šóË#‘J.¡„}ıõ×SpPïù_Ê(´ *ÿÚk¯¥iÓş¤-›6Óë¯½F5kÖÌU	>ÍåCaúôéë¡¨1Á–vùY¨pó»ÆÅŸ¡%K–H\r€&ohéKœ\\2G\">wšfı=‡ÒÙ2VS^²ÅËÛy!((®»î\ZV®˜Ã.Á¾ı¤M,ì³e¨BQú^¦îœ)K”ˆğ>Kg\Z<:Ùh4EÓH§ªÕ*Së6­Y¦ğnŞÄT\"\"#é¿ÿÑ“¾§Ë»÷éÀ1)d•ïğ`H\n+÷äÔTZ½v-=ùÔ“²¢éUıûÑˆQ#eö>\\Pà¹ë®»Ä?JîhòÇm³Y&ŸIH 46TğlMîĞ’<—`èæº>°?:¤ª›ü¥B…ŠÔ°ACcOù3ş<ÎHÊÒÎ-\nç’áó›ğÕıÈĞ7İt“lëN5\ZÍ…ò/ò«W@ÁbD\05úõøKjJ\n-[±ÜØËL	|àÀ~zçİw¨K÷®Ô¶};zûwèÄñR°Ø»oŸÌ	\0Ğ²\0×©S\'Š.-Çò\nÊ^ğcóæÍtút,%\'%‘Ó˜Hsv´ ì¡˜SR’¥½™!c)ÛˆJë±ìéÒ¹s†!:6öÿë¯¿e‹qöÕ€LËÇ²ê$Aß~û-İvë­TµJ©Ë÷ıFïÿ-[°‘RAŞ;ÛÚé%¬“FSÔ©WïªW·.o± 5yy#¾˜ğ™„|œ@Ÿ¨_ıUVlÖ¼9=ùä“´jå*¹r	ó§`Ò4t¤şnÒD‘–8çLsJû}ƒ†\r²—59€{ \'13+d3†h#<fMÎh	 ğ“’“éï¿ÿá„ë§¢åô\re~íu×Jf09|$†–.]\"ÛÈh[ºd1MŸ>n»ı6VğU3­À×±CG\Zpí\0\ZÿÉxZ¹b%Í™3‡ºtébœõ¬÷Ò †îh4š,	>ğúëEYú£d6Ú²e«ôô7AèÒ¥Ké®»î¦¶m/£YnÌš9K:J{Áó2>óÏ©SiıÆôË/¿Pß«úÊ(‚ÿkœõ°0[b\"j\0œº3`.Ñ@.@âr±¥\Zsğ0mßº“3ÿYÒ:¢ğUØ’ıLíqv¾.²DµnİJãô#\\øßBY±ÏÎşâƒôêy9+ıÊÔ£{7šÀ\n~*”\'sÎ\0dâk®½FòY¢µlÑ‚ÎdÈx¹À—rì“;êÔ®Iõ/©Ç43Æg@—ü5š\"\nò*òfÆ<ùÕ¦ukYOÎdÈ÷^…™s± Šgåúõ·iãæ-ôêë£©5+ı®İ/§o¾ûö<Ä×@¦A()‘Qøƒ¼´‚¥ÌÑÇè–[n¡yóæÉÊ~ş\Z&è…ç@r®[·^fŒO8Ãr‘e6ÿirFKò³ ‰ßå’q¦{öìV‹íøYàtº¨eË–T®\\9r	ÕW“šÌÏ‘]ïà™x6.CõÚ‰\'³$¥óË{ôğd,dıĞV‹ugŒ\0ô¸ür\n\rÓ½ÿ5š‹È(Vş¨!dunõ?şX–~é¥eøä:1ç¬¤Š˜F~ #GHáEjXóïíE–ògÖ3Ú­Ğ°xñúç¯µŠ!×\\}µDº™6ccciÁ¼ù)ñğ?tnI7†6oÖLÚı­)|áÂ…ö/¿2?+ªt)ºœ\r\0ø‹÷¿ÔYFs¢ä•›úõë+ı‹ò&BÃp;SAFä¹½İQ˜d¨NíÚ2ÛèW_~A}ô‘²ËjâÏÄSj\nÖ0j²E\0g¥}(T¯¯^³\ZEv¥-6€µ9 kp±‚ƒèŠ+zy”*¢3à¢E‹d\" 6mÚPÏWÈ|•°øP\ZMœø-_Ìå}vPÌ}ú`¹O#®8i’\'SúünÒ¤‰,$bÍ„™LyY«Óä\rßøËÉi4Gš5©FõêÆ^A‘UºE!Iıš	tnîÏ… qãÆIÏıuk×Ñ·ß|Mƒ‡¢«¯îÇŠY<òŞ“{l´dÉRé””È†‰^àlØøãøÓÅ†äädYsÃæM4xĞ`Š‹Ëc;»¬Ù¿dñbUıÏÄ´ÌM5‹Ìâr¢×?—ş9àôÁƒ©uë6tœÃ€KñµÖ®]Eõë7ÀììtôèjÖ¬;vœìvÕYPù­Èö£íÏ\0Ã…^ıUêĞ¾½Ïõ¼}vG“-¾q—9.³]|Cïwôni4¹Ç&+î©ÚÄßÿÆ}[¶3áOßC†Xå Pk´mÛZ†úõîİ‹š6i*×ÊYşõÊ@uF mÚ´Iöı	O©R¥èÏ?—YU±’ÕL¦\Z?¾xñ\0JÖ$š\0¶oÛ&ı\0ÌDëëdRãŞìè×ï*\npğUÙ\\%,Ut–ó(Õ#ó”,Éç‰}ÖãÃ¸fíZiJpøŒÈ-éÒQÔ¨QCygMAÂñiv´26\"TÃ*çf—nó:Ï¢Nâøn6¾L§Ñä”ÊÛµ»Œ‚ƒ13 ×ø÷‘yf?!–Y(¸ ö²cÇôÔÓOË*€1‡ÑôiÓhäÈ‘\\HiNv¾Fä;„pŸÕajàüpêÔIY·ÀÉ)ˆ2-ÏrF\09€ö~5ü/‰–¯X!cô³ÂL¼g£yóæŸÈ™‡¯ÇBÆ;•Aá=_µjúşûïiÏîİôË¯¿JçOÆcĞJ?iÒ$rùTµåÜ×¾]{*YÂ8¢ñ,â_?³%îbeîuévvøµËÎeé®1Â )Æ¸©\\ù²QHùµ•Ò\\²D	6*ÚÑ“O=Eş1UäÔß³çĞÏ>GíÛ·£ ÀÌ5’VpÔt(DõèÖ‡óšda —NïgC7d¢Ê%kTÃß}Ïİ´vÍ:Ä™m&3iŸ-\"1–¿aÃÔµkWºîÚk©oG¢dÏ~¢×ªäñ>)ëØœ/@9šñ9§NÅR›¶meMloHr‰Q}HcÇ¥K›5‘ıŒ‡äw„³~[‰}CñòqTG¢$_v”ÎFWªAThÚÜN>ç$gz09SƒÈ™fg «“!–ÑŸLI	Á”ÌiËIO˜ ~Â¸”ASüØ€@…G†PdI¬É@QtšrS` ›‚‚Ò(8D…Fj:ßg³a*U¢¬ªÂÛR…ªÒ×€ğM#yL3šõMüßÂEôä¨\'9½8T’ğû´F?üğ½jÊ•+Ë~©&M¤8Q)†¼xD†Çğ.A\r€yŸq˜âÎÄQå*U(Í™&CÕñÜ‡C¥[´hAŸ|2*W®,K[LšŒh -¨ú?yò¤L~1pà@eUæ!1f‡dN”ÕªU¥l%_Ï~7½ôR™\0ˆUœ7³JøÀÜ÷MÊ-¡Ë{^.CóŒa\0T¬X¾ùæk\n	AÕ`1Ä†ÙÍÒ93@ \"†•â4qs<¹q\r+`—3˜âO;8-¤²²wĞÑ#Étp<;ËÇÒ(áL*¥¥pÚIuRrr\nş~ìUº(zx®ş¾vYBL·ª!ÀW¶»¡èø<—øİ8›$\n]\rµ±âgc È.FAdd¨¬Ôí z\r¢©L™p*L¡á	|%ß“Äşá}ø^.Ró ¾·7	kÁXœ0í™3ñJ%¤JšôÈÇÅ‹QëV-d_¥¬¬SÒ¶UÉ$ÆÇÓ¾ıûå~ô±zàŒ3jÅÀîİ»Ó’åË¤–A<™;ğ%\"#è©S©jÕj]º…f¹¢©h -òràÀYoú¾ûî“6®‚0\0¬ OÂ@ÅRšM›6¥!C†P‡©fõêœiXíóy(3óZ³>ÜãÿAï¿ÿ¾:W…pıõ×Ñ#<\"J§8âJwª—Ç:Òƒ™¿b‚ƒb;èd¢‹¶m9JûvÇ²‚O£ø3)”œd(wV²nVÜ\\>7>h:Di|N­ÄfÎû€ÿm(Ù¨]Igê¾&Ì<öç\r¡‡¶	şEÎ?l< Ö\0¶ƒÍF6G\Z‡‚¯•Œ\n ¦-ÊQƒz%©J9¢@YásòÅ0/}…iî…«æÂÆ”!ø¯½ú\Zıõ×Ş6bAº}ê©\'é¥7dDå#å·ç¹ìXù_Ñ§7mØ°ÙAçåóPpH°Ô„\"_ vâ­qcq£Ü—ÀTgŸş™Ô´F•,A‘‘’g4™Ñ@6 £Óªÿ¿üúkzïı÷ä¸+O(ıî\"ÂÃ©nİºtë­·QçÎé’K.ñLlÍ\n			Ô®C\'Ú²e³dê<!ÊŸKŠ¬øŞzëMi¼˜\0Ÿ(TG:ë÷ãm(RV×..Í>O\'O¦Ñ¦5±´kqÓé3gDx¸\\¬œİÁœ.ì|5üAÅ»õ!Ê˜‚<ÅQ‰K<O„Ô:r…3˜ÁX@’Á0 Ñù7¿5|âc*Ø¨…À3\\\\Ïg%-°/ütlÃÁHH¥à 7•¤†MKR›¨jµHr8ù\n6$±ˆ§ì”g#ÒcSsa*b(VÌ>:jÔ3…)äAÑB>vîÜæÌš-2Ä\nJñ»wï¦õë×Ó¡C‡èşûï—g#­£ÉëÊ¾}e¼>Z«‚‚‚hÛ¶mT¡|’=gõëßŸó¤!òl\0¤ÓğáÒw£J*Èº)º k´\rhÿ?vâ¸şØcR ä!1š`¢,U…ÏÂ™c;]ª}Mø8K\\Oæô!8$H&ıÁºŞ½zõ’)1 ®ß¶u5kÑRF*ä\ZQ\"&é2ÁO?ıD¡l_Rßû\nøNNş­õ|ĞèH‡vy»K|<æp2íßOkV§=»()Å)¥zÕöÈ%{|(^£š^\r§Rà\nUV_6·¨vy…4-`‘\rüÇN4°ò5]NÀøP‡½x¿£İã§y‘ÚÇdKeã1J”¥–mËS‹6eXØ†S@`ß‡x€aÂ÷°n»Óx<Ñ—ZD\\xJâü=Ñ<Õïªk¤\nŞLk¹–mœn1?\nFíŞµ‹,r¦ç¡Ã‡©çWHÁ	“—U©TYÆûCÑ#Åâ	Ï½ğ<½şú…ÿİ7ßÊ\"Bèˆ° Ùõ’õeZ_!á2éÑ½;½5v,U®P‘Ó¾·@vr¶¸’Ë˜-†@–²C{Ùæ-[D˜ú+Û·oO>ø uïÑƒªT­’ÉbÙ	Yd¢m[·ÒèÑoÈüÙuêÖ¡G}„­äÙ4é‡ïó¦ü3 ÊŒ­Zµ¢ĞĞ Îş¾]ÑúO)J~”ØQ=ÏûbçtÑñôç‡é™Q«èõWÖÒ×_ì¡•«OÑ©¸JI…²7ı@•9J f¼ˆ§°§úÛå7Şp?œò¥tßcêD šX®åï“G´û§35ŒK§93Ñ¸—×Ó;¯­¡¥ÿÅQb2®CÉßpâ›4n6\nÔæ\"J0„\rşV­[’C&ŞAÚÉ+nŠ=EK—-%—Qs£14$TVKÅ¬¤¨%Øğ\0íÚ½Û8¯èİ»·Çæ\0Ó¦O“_³r}[\Z5l˜eNÛ¶o¥„„3ÙQ5Y£\r\0H(pH¸NV¬p\'N—ù¥óÃÀé­1chÚSiÛ–­tğÀš6m\Z½øü|n\05ªß€‚=Ïj›…8‡–1:ùÁa!OÆ§«úõ£×ßx]®õ»ÃN­[·ÎğÜ‹”dYıQ*§;èŸ÷Ñ3ÃWÑûc¶ÑŒ©ûèØ	.¥¥¹ù?Ñä6_µmA”•0ÊîxQ%,å0F›ÃÉ¯™æ¢ıûÒèÇ¯ÑK#6ÑO“öĞáÃNNóœÖ¤‰\\¬¹HAŸ\"‡´‘cI^Àx~$¬¿şšÅòhÊŒÀ°ÀÆË5HA+ÓgLWû¼ƒf€Z5kQ™2exiÒN+W­–Q2r\r;ÌS€‚‰ÿØ)æğ:u2V=SÒµ&+´è„•š–J©©)´uë6Q¼ù¡M›Öl%sB½b£¨RQÔ½[w\Z9j}÷İw´jÕ*:vì(-Y¼ˆÆò1İ{ï½2™ªç1}pVíW¡´‘q/kÛÖØ»ğP¥TSs| j’[Zz=j£Y3÷Ò‹O® ÷ßÜJ³¦¦øD5$·Ø¥yÀÅ5!¦ø2İEB†ä!‰ÿç´Ä‚Ûm 3‰É4oî1zã¥4áÃ5´}k¹œ¨`£ïUup¸×ŒgÍÅBË–-”\"Ï‹-dc\"£±Ü[¦*çÔÆr‹s%Í›?Ÿ0O	ÚÿÑä°wß^*Yª”ÇxŞ¹c;ÄL§»CüPgıKwxFo¡#7šs/¶NA¡û\0ø€è@\'¬i}0æ°,P1áóÏ¼	È•û‰{03ÖÁû¤ZËló2»ƒùF=ªaqmlè+°g÷Ú²umØ´‘V¯YCÖo ãÇIE¬z•ç^¼v²tjĞ >ÿ)gÄ¢®ôOp,h0´MªæQÅ­š+=…\0%$¦Ó¦µ§hù’c´mS_£ª¶*®¡Ü@^£íâÀ\ZØ6ÒŸÑÆ\nUP£V)êÒ³\"5jFAaN5s¥\'@äÉuŠÜ§-bŠ¾µUØ¿ãÎ;ië–í¼‡¼åUä¹‚åFhP0íß¿_\n+&P¼˜›$™P téÒ4bÄZøß\"Z²d‰LY4á\r‹åìÇtÇ·SJrŠtn9k–Ì½âLócQX†ßwÿıtßİ÷P•*U<}ã ¸£\r\0N§S:ÿ<|ˆ{ì1úKæò`\0 ±aêŞeË–P`P qT\0YE»Õ\00Ï£úJj\0øœ9)ĞÑcGé¹gŸ£¯¿ù:ï£,À-·¥{î¹‡Ÿáo?‚s	Â\r!Äñ”F.;[õSé):~(…æ-ØKV§P|”~\nPgˆ/¾O—Š;S‡O $2ĞîÏ‘%Àÿ*T´SÇ®¥©U›ª„	\"mFH÷é,Díø¹—ÊZÄ\r²2\0ÆOß~;‰¿ŸóÃ\0àÒÿ?ü@W_}µqP-õ‹*üİ\\Ò7p˜Íœ¨à¼+må¬ô“jÕª¥¬jº}ûv:}\Z¼IŞÃ…7íÑãrzí•W¨Zµj².€6\02“Ç˜- ‘\"Á¢ÉÎ;½,r÷¡\nj[³[·l¥lùºØ¢5Ïùú‡á›<=Õÿ|½lñXQs^ç¬>ˆZ„#l©mnJI¢µËbéƒwVÑ«¯®¥R(6!™œñl`5¹ÜgNˆ£É\ZÃ*Âº$ñ–JG\'Ó/ß¥×_]ANİMq±ÁÒEæ6à_OĞ\\°àb~~¿aƒ! ³fÎ10œ,°¤y³æÍE–ápP¼©f²ò7ÏÁøX¸p1½ûŞ{´båJ:ÇÊ7û›e%\\D»wï‘g¢F×it–6Ÿ©Qè\Z\0PÚG•\0û÷ë/ºÕ÷è`Æ•`p¢ƒKHHˆ,µ‹ê°f—^JíÛµ“åwá0­&;\'MşQµª.À‹§ Ï_	ºiÓ&lœ wmÆëÎ\n¬cf•›1c[å\\ò“NpE(¼“ñ^üÃÿ9mtú”‹Ö­9@óş9DG9dQ‘tJæó|ŞCM­‹WR¥š\0u³(6MÖ˜ßŸãÉ–Æñ)uTl:!ÚÈá¤¥\\Ô¥gjİ¾\n•ˆH•óªí×š°Ù Ô\"¦h©ôËŸ¥õk®@))œ?òZÀÀÇzuëÑúõkğ\0Ù‡¿ßMšHÃî¾+CCúŸXğ¤O­dV°È¿y\0ï‰W\rg¹úãßS½zõ¤ÓaXh˜§V×(òşÅ/rL\0Ó\0ïß·OÒ‹¿B·¡Çmjª“Š¡7ÓÄI?Ğ=D=®¸œöîßËùÅë7Úı·ïÜN§Ïœ–ã8“1±ÚdJâİ»9l*»åzêú¹z`a¡½Qo\rµ/uüŠv[<D¿MŞJo¾¸œ~ışáÂÆ[\ruÂV’ÍHötÌÎ§âÆ†!J†òÇ%ş}Å‹Ä•‘–XÙ‹‘ëÆ¬—vrr<¦pÌ‹\r Ÿ>B£ßXD‹ÿ;AIgØàBÜË}ø^vs¤\'ÃMßßËFÁÁ¡2Ñ˜ŒÁ÷ä§í;wĞCu-0\"ÀMU«U£àN\rªŸRş–t&ş…S—ç„r7%5Mú\'8¹ô¯éÜï¾ŠÆªŒdÀ¤$Ú½gq”)À´£Ò´[Vß+íQz\0‹``.ì:uêPËV-è¡‡¢¯¿ı––.]*µHÃë×opú¬ò&l\0­¡b@GÛÆŠÈA¸é³Ï×Ğ«/ıGÿÌˆ§Ó§Y)¥s‰ŸKú6c‚S®?ì,ïe6ú˜ÏĞd7MØˆ²¥°´HfCŒèÇ¯÷ÑØÑhİZ¬‡ÈFX¾XÖK#@Stñ~U€F1æJÒßÜY4}ÆZ´p½6ú\rj×¾=õïß_:RSùÊ„ZÆ6^¦İ6®Á1øÅÍ%v”Üı_Ÿ5¯˜òşš2VãE7ø€Ä‚€X]ï÷Ş¥Ÿ¦Lñt¾ym°‚„\ràƒ‹ÿĞb„„ÂRVçvíŞE\r9C¢š×;ì˜Çdò ¸¨Re¨lÙh1ü‚-o|ò÷ßWš\"äĞyjÀS­âH&×e%ƒ~ÇÍš¹ƒV/;B®´P3gb60bÁ-õûF)ßø6fÜšş©Ùû¸˜G°k^§ÉÄ¬Š]üÏñ-54N\nr!îÈ˜B5kÛhÀõ­©jM,¸’Èù#„K“S-bŠ¨‰´\"kN0,å|ÕyÎf†É¨QP#¨€ò%x%/%\"ğ/®Cdùòå¨jÕªT¶\\9™ >+ü\rP­Úµ¥ABB\"uêÜ‰vî@SgŞ0åÁ·İ\"ë¸`e@ŒT0§T7Ïw´`Áÿ©(÷péÿÑÇ£Õ«Wûm\0”+[–êÔ­K›7mòNkÉÂIËÅ\\Ñ³\'ıñÇ’ß`\0àø¯¿ıFCn¬ÚÎø±ø<ÈDæ/.:z{ĞæÎ˜–sêÔß)4$D:g\0ƒ·4Êè—j>H§T{::Ls¦m£åKPbJ)V;|ú8:ÒİXÙ‘…Ò\nüÈ¨h$O›¯b1«,³¾¥å°&Tœ™ßã[â˜Ó*»t7V“ €TjÓ±<õ½¦E”H!Ò+—¸äC6óa4k\nëx} Äš›9Fƒ&§ù‰?p&@>ºÚÌôU†ŒÂdd)¦®R¥*U­V…jT¯A5kÔ¤z—Ô£Kê×§êÕ«I¤ôÌ‡ròº\n#üBsh§NiÅŠUr,/HØ.:Ğ›o¾)C±àš9«6\0:gZ@5,XÓ¡\0‘¿ô¿újú÷Ÿ¿)æĞ!Ú±mığıDzêÉQÔ§OoªQ­:]vY;N‰øHŒH°D›6aaŞ—Lhµ \rëœßÊß\0Ãb`œ{ÌLçÂê·2#á™¸0šñû!zí¹Y´ô¿X.õGòù¾Õw|G iaä{U¨ø0â\ræ•8>ä+Ç¬Wkr‡Š/eœJ[.Ç½ìÙÜ,¼Y ÚÉéŠ ÅsÏĞ˜æÑ’ùg(%-€Ü¬+àäow6õ¡97˜_B9T¿Cb®’\n*à‚,P_^¹ìA:xøá‡iÂ§ŸÒœÙs¤í“›­[»šşäBÎ‡¼OO<ñ8]İ¿—ôëRpp°t@Fß(cøn\Zò$9n—¦P0åvLLŒL>d6h2¢\r\0è!ŠD‚Ä‚ö+Ôx9{&0QãM±@;ùµ;lTµjºæškè¹ç£Ÿ§L¡­[·ÒÈ#<	UÖÈ»ví¤°ĞPr~`¼¬ùXd2É,>.¯Ô¨QC¬ou¿qğb3–§uÛ’éÌ™ úã×CôÂs³iæÇ(=5šU<Úët¯ıNÃvËPšòıv\ZÿŞ*:t\0MV$#XÄ 3®Ö-0\n©RÅŠ¼¥€,¹ëî»èÖ[n•YL£ËF‹aoƒœ3›²Åç4îÃ<*ù2#œN§§yBãE\0H fB…pøğaOu”š2wÚÒTææ³æ[qLœá¯´Gy¼TÏşà½÷e©ÎŸş™^|é%ºêª~T«V-Š.#«\0füÌF‡›F\ZYš5ryo\0Åÿ¹lŸf£¹ÿœ¡7^YL3§¦´¤’üél`‚\\s.Ã¥ñş¦(éó·Ã×uºhÇV7½7f	Mıå0Ò!|µ2š¢ªå³Vş8fºì8A©ß¼ÊW&I¡È‚—-¾§ÙÓ\r\Z;ş]˜5Õ4\0àr-/‹Ú\0°`Zˆ0\0;Aé.NÎRœ·hÂ4¾è¨¡hf\nüÂ!Êêkìğ‡Š/o£:Ö8zå^Õ·/=9rıüÓO´aİ:Z¾l©4\'Ü}÷İê~Îp9Ãç¡ô\r‡Ú¬Sß´I#9\n33Øøí1qO:ÖõFiŸåJ µk“iÜ›ëiÊO{(öt¨,BãrCñs<sPQSgãó’ñ]TLjÎ?üø{ FßK09İ©t&!ˆfNßKïŒK{÷À6_³Y,*à+4iÒÙ“]Vù.gœN.4âBoÃA¦ÉŸ!«djsÎØğ	óôãXrJ\n;q‚vïİKkÖ­•şPßNüÎL!\"«W«&%È.S^YİÙ@õ?:uÃ€|?»Ì,^hÀ,E\0r§ØÙ™/N°˜{zÿıË‰IZpØ3Éé	rÃ€ªV©B­[µ¢R¥Jæ¾-K<6ŸÊ¡`E\Z\Z*bdÜoN/\0œ6;9aù¸ÉávPÌA¢ßYK__M{w³aàdÁ¥föS1 0Øe9Å±÷]4E	ã[IïÿtÖ2+\0&Úk£wF/¦i¿ï¢Äã[£¶€Ó_:i#àü£:«~AÁ†l±ä31¼¹3;pv÷î]ò5MÇYªß:(“ªÍ7>şäc\ZşØcÔ»OojÕº•,”†)€/»ì2\ZxÃõôÔÓOãN‘‘²t±¿zJÿøñã\"×ñn¹1\ZŠÚ\0ğÊ_f<rÄ\'Ñ!ªr—x`H`8_·nİ¨É¥M8‘·¥~˜&NœÈ%ùet$æ°ôx•kÓY$ªÍ³Î¡	\r‹i¨>¹³€­ ô_¾|y1PFõl?sVn`¯m\\â=C4ùç]4ú%´eK<¹Ò)€‹LÒÃø¾‡?ï¦):x¾;\0HqÚé¯{éÓÖÒ‘#é\\Dúx	_sA&UŠ…ÈÙ±s§±¥À4êhmİª5uêĞz÷îM?ü}üñÇ4wî\\–[iÿşÇFj  O8!™…‚°ˆpiúô·äûĞĞ4\04Ñ@6À7ÑåN)‰re‡U­àÏÚuë$Ñß9ìNêÖ½5jÒ„j×­Cƒİ s\rüóÏ?´cÇNJaÃ#»d\'§²q‚a‰şg’±·è\0è¯™ğâ%µ†’}m”–n§å+cé­—VÓÜÙ1”œÄ™\ZıĞÂo¶P84E$é°}K:}8víÙ‘FéœPÒeA\'3\rÀi}¾“qòşŠ6ùh—\0ÿPúF<ªâÏ&s`4bt\0Œ³&r8T‡e€Ò‡FM\0Œ€“{	Ú\0°€’”ˆ!#.:„N€FIF9VXJ»eG5™áÜ˜ú¨0,y?Ÿq&.8L¿ÿş\'\ZõõíßŸš·hI•+W¡®]»ÓÈ\'Ÿ¢É?M¡Õk×IšøÃÏ8tè\0%&%dxV@òŠ‚V™ÃjªV­f„Çf€¿ì¿rNFªÆ¡äŒÆ™-&&™>}%}óéz:uÂ.ëÌF­C:ß\0îÉÊi.,N­ÿ“äåÀ\n‚H+v:é¦Ï?\\GëÙ0´szD?˜tÌ€¹d™g- ßïãqœXÉ–/_÷ı”œ•Ñ	5¨\0şbşıêÕ«“=À¡äÚñÑPd§şöpx»K—.Râ‡A “¡ÄáÌğæÈn\0æıšŒhÀ‚$0şÅ4ÀÇGzô(û.]ºRŸŞ½eZÌºuëJÕ{v q&±…{š/^Lcß\ZK7*Kdb«fÍšÑ=÷Ş+«eáZ%]¯^]c/Ÿˆñ`\nn{ÌS\0Ë=˜Ï?Ao¿¶vp‰œaêzY\\†(»„·ğ«¹¸Á\'†Qf(›ué:s:€¾ÿb/-_t’Ó§7j†`P¢O€IçÈ)›\0 ;1tZFŠÊ÷…^_¸³Ñ°AC\ZÿÉxU@1®‹;M))É¹º?+pß±cÇ¤Yë»hC #:·™ˆrâÒ\'Ô”TVÈI¼íµ’Eyå2İ ƒİèÑoĞ¿ÿAóçÍ£Õ«ÖĞóÿ3Îú¢D¤İî„G¨ŞÒ6Âl€)–-[¶ĞW_}E}ô‘\'ûº±hZ)„nfJ3–ád\'şÛèÄ	§Œÿeò~JL²SšK+yMF¤\0Èÿ%&8éÇ/vĞšåGHúÊHO¹Ìdš2¤fÍšüËÛl·g…sv dwlß!Û¦\\é{e_úø£e	sÔøHçcÛèİ*ôx{ìÛ´jÕ*ŠæëÌ{Q‹Šc˜Ø_ğ^ˆ~]Øö•ŸÅm\0`%+,Ä“î¤S±\'ò7d„pxx„TˆÃ”|NŸ5Nú‚g TŸõ³Pu–e‡x?@¦+[¶œ±çx\0ù BÎŠ%ÆÂùÇiÌ›ió¦Jv¦Sºß]Œ›\n|a\"/CÆtÃ\\˜‚ÂŒ¡Ü\Z—Y[/„	BÎìl6Ju9èû¯öÑæ\r±œÌÙ.½È§3ö5…‹*_•¯±ïhú›‚µSXÉ\n,1ĞM7İDÛ·n£éÓ§Ñ§Ÿ~Jï½û}õå—4kÖ,Ú½{7Ğ÷ßŸ©0‚;\n=ù²3…å:šRué?3Ú\00@©-Ï)i©””ÈÛ¨Şæ„a%Â)\' ¡¼\n$4Dõ\\E‚ô`¿OÅ2®e•ó&Hd\0XÈ¦•ÁÇ{ì°>{6¯õÍ8Á9¾ÈRÄ™ÀãÆÎ÷JLñ3Óm:~\"•>ÿhı4q\'%¥¤ñ„É\nê_\r	+JàKÂ!TêË¢ÿŞgU\\¡½Ú–Î¥ãó`N{…Šg¹Ÿïq£8`\'w ƒÒƒ”ssI–Û|‚ø;[0§	vØv:ø™¸ŸıÇ3äÛ³ÿ¾á4/fÒ)H#±pÁ‹Â\0P}Z`$&¦¸éû/vQìI3O<+ğN.vNMœöÔqM9Ä_¤T©RÎi)‘÷Dõû´©´}çN•GÔ!™ÕëôèÖnzİwÏ=4dğ`êĞ¡ƒô\ZO†Òÿ“¤•+WŠ¬ÊâF¿©\\ÈÃ/Â¦QøÊ›b\rY:+¸ØÓ§¼V¬`¬}hVGS`üıI¬£š%HØèü”õóÌPşqSdd™‹aø‹Ó)^YÍ³‚\\´ä\0{}-m\\›È¡‡õfRk{Sş\0	\r-øå7á_1xŠ	†\r›~nrò~G|ˆ\"‚)02”\"¢KPX¹RZ1ŠB*Á•¦ĞJe(¼r4E.¼²±_¥,…WS.´Z4…V¦*eÄ…²‹¬Z–¯‰¦0ö#Œı-W’‚ËD…‘-”…şN\\Jæèöh¨MÙ6œ™.Íp\Z?JşÇO¦ĞOßm &ŞÂ;\Z \rğ.\ny?]šÂÂ-ãíƒƒÔaş‚ÿÿïqÄ8•­Üå¿xé\Z5j”tÌHQ=u&.\\N9y;İy«Ú\00@{?,EŒ\0HLLÎ—€v­à`ïb;ö\0JKqŠ…I}<¥|FSƒ+ÍIéHì)\Z.ß°\'á²@~@-I\\B0}ıå\Zúáë}Ëª_ä²_c­ˆD„‘UÇ…Ó‘Îã?˜Kîa²—àoV.’r)Š¬Í®…óo» J%Ù• Wt¹K“½$+éH.ÉGrÉ>ÌNşÔŞUÎæÙ¶[œ÷<;6,‚ídu­€Qìot(QV~nh2T3š‚ù7¸Fi\ngC! d(Ù#CÈ„š—ù=ØhQUèp‘XÎ˜áÍÎßaÓÚ8Ú².ó‚tğ iŸ¯	HsÓ‰í{%_êªÜÂ!88„€ü\0`Îœ9tÛm·Ò‰cÇ$9BâäTK©ŒrN½\\Pr±üíßiĞ\r7ĞI6&¬ı•ür»1[!R\r\Z\'5\n½°¦¥ÄÂ¤É“\'Ó»ï¾‹TkœåMÃVÊ>º¼Ç±Ø¦î-Q¢„H0¬{‡{ú´Œõ‡u|ôHŠ•ª˜uğØÑct$æˆœÃÄ‰|=:¿à¾ÄÄJHL”Î‰Ùe„³~FVíÚµ¥Ñ£_÷¼–éWÎ÷â\ZÕšïæRÿşƒ)ôõ×+èğ¡6X¸ôŒf{ª\\#Ùû&|(g¯Ïf?@óƒi¼©¡—èµÀf‹‡Ê™n ƒ‚ÂÃDØ¡´aÃZæ:¶ñ¢üŸzk”º¹µkÌËÎv¹çÍ}¢ÀúTÆ7Â·²óIªòİø×áâps©&-)™œÉ©,àØ`ƒÒéâïÂ…G¾Y¿ğÍtl>×|œj›goù›à˜]Úàø>şÁå¸GÄÔà0 Öñ‹Ò¹\Zª®—ÏªşcÔ/Î#ìh“PHø$d\\ÊwQ•Ê¡ôÔ³mØ¨Iä‡©&øâHuÑŞßPµ:5)½y5Ü)d—4ş\0£ÊNwÜ>ŒvìØ£É74¾#~<ß3äZï7ÁÿµëÔ¦Ñ¯¿Aİ»w—)ÎÍã’ù:ÃgùE\'½5k×ÒØ±oÑŒ©9QLáaÍŒõ»ŸMîIş}ååWèŠ^WÈ¨ª’,—ƒX0Å=\riÀ\0N`\0`ËçŸN_}ùT_¤?ˆQÙÎ2ºø˜‘@ız—ĞÒ%K¤)\0ä%‘Át@4]št§T_5oŞR†¬È2\\¬¸îÚ«iøcÃùZUvöp±º`¥áà\"­X~œ~ø~%X—ÊÂşÜW§eñ¦ÒÜ oÃ\nÊ`§€À\0Qø †’=$Pª÷¡´¤_<2|Ã76\r¦ª56Ë§-x¿›¡ÌM8œf)Ê–šNÎxÌi´ã–õ	UìÊ6’w‚/Ê4@´qºcï Èœğ]6Ş—3ü‡æ³¯û•–J|4„ŸœFál8qj Xø\r00ÜûĞmü‡\Z$ø£°Q¢ÛAI\0:Êatpú¬AujD+(€\\ìw˜;„MşmÜEMŸDIaJpk\näçQ£¦E‹–ª&	Ïü^g\'£Lá´ ó›\Z4ˆ:vì@åÊ•¹èæ´sútí;°Ÿ-\\H3şú‹ì;(±Í%ĞM²–¹¹\0ñÄ4`À\0™R½d‰’„‚\0£\r€üÄîE,P\0»wï¡?ü~š<…•:‡ôŸ Y“¦){A^¿Ü#ÿXèò31$°BÅJ2Ö6+²—„É{ü{†ÑÍ7ßÌ×æÖ\0`¤”A¿ÿ¹…fÎ9Di©Aµ#·Ÿc\0q!%{ù3Ş„	L‚‚)˜KõÈÜá!dgÅ‚sN66.¦\"¸6QN§vo	DÁ¥R£öâÂ1\0,´€—H6;:Š2ü^éI)”–˜,µHÎT\'9ÒübhrB\\ğKŠ¨äüIÑö¹›\\|ÜådeOåŠ§2îd*ëL¢h>WÊ–J¡ÎD\nv¦HmC{…_Og=ş…ÂwJ²q€Àğ&âÖÉ;.şñA”b+I«‚KÓ[êM4µ\n;IÁá%(¬Y4Åşºâ~[Keú6¢Ğ[RİÛ´¦)XøÓÑÛo¿C¿ıöï¿~\0€Ó\"j­ø[£ùQ–4—„€e×U!\'7vé›„ãª–ÈJ~T”i\0<xÿıtË¾ªU«R)6\0‚ƒT:Ê•¼ˆQO#‰Ìl_<}ú´qÔ?J”,É	İÒCé7iØœ²ÏÛI‰‰Ò!áô7C”.]F2cf2“ óãÓ\\‘ôå—ëhæ´VœIm\\ºäÌ|îzøKhÄI~eeïæ>ÚÂÃ¢KRÉ\nÑTºvEŠ¨Må#øEƒ‰‚9”.V>Nh%QpøD!a¼‚¡Åy·ò ïÎ3gp?æ×qÙÓØ9)İÁß,ÂAAåÂ©dõ²T²ZYŠ¬RšJV.CeÂø\\¥±ÖFM“ÍCÉÍû”î\n¢’)Nj”v’º8cèª´Ãtmâ>ê–t”\Z$¥²É±áLæ´\05ï¦Tî‰”ÀJ=! ˜ƒ(™·Óğ?Rm”jç’=—ôQËÄ‚¿DZUH>J]RöÒ%é±txËQŠÿkøb»Åtò×5D,¬+tlBAìO~Ò¿&\'èm­v%-å|\'\\ üQ3…&*tÈCm+”?°qš¦:~¤ù}ê«·\":Ã\'4¡&Õl\"ÔhÀ£À4½X¨äLüQ*(˜3f2SN-\'`VS?œ‚/8”Ï†³$z3á›¿ÆåtÚXÓÚs<7È¥f¸H–\'š	\\ˆÌÈošîàg`7âN‡Ğ{ï-£åËĞ\'PzÍˆvä?Gşƒ»MDiÁ©=?ŒÔ‰jè4.È»BÈQ*œB¢KP©ªå©tõ\nY©”\':ÅqXÒaÈı@ùo\'w%äòeZÁYQwäûµ\n¼j§ğ‹f¬´h}#üR8Úæ¥iÄÍÆáœ\\Zw£$Ç§3,ˆã³4•¨\\–ÊÖ¨B5+SZùä¦:î$êè<L}ÒPïäCÔ6ş\0UL‰“Já´à²ò¶Tü“=Ó†;@ú\r¨çñğğ=2şÏB³› Ğƒ¤¦!,5‰ºÆ¢Šë6‘}÷)\n>’D4k\'\'Ù)¨F)J©ÆÖ¨W…+æ	)kìçŒYHAÇb1È9m¡Z?44„n¼q\rş(=ıÔ“4fôôş{ïĞ5×\\cïfæBáÈØ2~“ÌÀ2M¦:ö„A£›\0““éèÑ#²ŠßSO>I+W­6Î(0æä&º†\rF~ğh¨|l<Å™!.>Ê²…]ªdIÿŠN‚°¸Q%…_t”AÍ2—éÉplÛöÔ²Uk±œÔ,X~³—™Ë\\ôùç¨NšrÜ§Èçp/,!¼$ÆAã?\\AÇÃ0°úÍbİ¸\rä%õ˜—B9Á´\'ã¶ñ#, ˆK|Ü1ó!Fö V.nÎÀr¥„×ƒ3¾“qõR<GíÃĞ‚_x¨)\\ÿ”‚Q5E\rşfP„S‚É;P¸6ŞqÈ7¥¨WgTŒBË»áOª]q=áÍTşÖÓò-\\¼ec¿Ê&Ÿ¦*I\'©Ì©Tùô)*áŒcƒÏNNéA\0Ÿü#§<ƒçgßGm¥Û¨ú°Îd¿¼9Ùè0ªtÍt¯)Hì´`Á,«1ö\\æ¸F)\ZÊ~ïŞ=2Vÿ¯™ÑÌ¿ş’&ÊùóÈ’ã\"gøZ¸±ãÆÉ°>ìø~»¬—şö^—/e¤—^—÷¤\'Y®cm‚¨¨(o§Äb´À \n“Ø\08v„vïÙ-ÖëÆ›åœ™@òb\0<õÔSôüsO‹r\0Á]½F\r:ÃşaL€Õ_|åoPP…‡‡Sdd¤ÇEDDÈªZ	¾¿şš™©úêì™„\\:+.E÷İWTµJ%iƒ“R°h	ÿã\"Kc§ËF;÷¸é«Ï×Ğ™#v1Ëá•UÛœğŞ¬ÂÊÏEµ ñXeCÁ.(<”($ˆÙ\0d…o“	`”šfÑ„$ ì”Ï¥ÄÍ¶?ë¥òHÙ‡‚Q>uÀ~´™sXùC¢ÄŒ¾åœ©T‚ÃÆá	 À`»A\r\n¦@şnA|3ªVñ6É¨şä7Mb2>1‰âÓ(i.ÅEåÎ¤PtìIŠ?E%“OQ “L.™»8n\\¤_”èU(ü!§<“µ`À÷¥T¡F¯\\O)Ql£¦ÃPFÅ]p6Zµr\r=òèp–œj8Õ¨‘ÌqÂ	¾ëwß}M}ûöU#jx;TªU«&ûV÷ÉøOd)`ìx¾ñ-³òßJNéç¬°€ï];w¡ç{NFhiÀ‹6\0D†Ù9\n`=ôàƒœwÉ9ÕaI4÷À¸·ß¦¸/®M—¶§¨ÒQ”˜¬VÊ2WÀBâÃVn„+ZİïóÍœ}¸Xiğ©àà\0š8ék*_>Z†ÊA¸Cõ¡ä\'JÓÀ~…ÑÊÕ‰ôã”¬ü\\²”>Ûì”ßêIÉYUâNõ\'µè@¶ ;…… \"¤‡~@\0?ŸáÄßøC°ø.y&ª¹G*,*<YcÄÓE`\0 ÷<ÂŠ¢Â¼´İEB¨Z‰PªB%9Ã‚)ØHAˆÃtÕNÔ(·Û%ÒøŸüÈ×fÿ”o.¾\".İIiñ‰|2R÷ï¢ø˜£d‹O!WB*ƒ\\)ƒ@\0Œ/#½æ•œòLN\0>GDºTòîËÈÁéé ÀÅ†	ß„ï«R‡?!ÒdÇÆ\r›Yv=d´Ï›ñ›9=Š“¿CëV­è™g¡n]»±š±“¦ÊÍDß|û\rİu×]HŞ{üv6r#s³ÅÛµ—…‰°JéÒ¥e$‚È_3,Å”Ü}â€’’¢Ñ0iJœ¦ò—ä‡„d$¦³Q®|9–—P_ßŒ±ıÎ4öÓø“„Ïííép\\²Áò¸99d‚¬2BvÇ½@ù\"Ó±¾•fãØOşOÚ‰mXëŒ…§hÊÌÃtúx\nß•*½·!`C«á\\Nv¢4\r‡>¨ºÇ_˜6Ê> €•=¶2R±ET-§fÇÃìyå¢¤…Rz ƒÒØ$ˆ$ò:ˆji¯c\nüÅm¾sÖÎhçƒÂbg=‡os^›ÃÚÌ˜ƒ®ä·w.AhÒíª”\"_Æ–Fî\0ôœwˆÉY9ÄM½Ê‡Ğ}õJÓı—V¥¡MªÒ•KÒ¥%T-ÌN¥]bK%‡+…c/ïqR`:Ç(Ş™ßß\\Ğ\nñˆ>\0˜ÊÙ‘BA®$*ËÏªT\"ˆJ×ˆ¦ŠÚPİk{Sõk.§ÊWu [İòä’Úš@¤Y†}R~ù`ã¬\\NÀĞËÎsRdÇZduRĞ3äú{+Å|¿€Ï`B6v` ÅMnQñÈqÊŠU†òİ³V’ïËÙeÙ²•4`ÀõÔ÷ª«hÑÂ%äJãïÂÇQ[ƒN€©,ûl¤JóœÈ>öÏ¢ü=~eã\n‚Ää$yÃT™\nX§]À \nĞv…	yvîÜ)mø²†´‘îARmó`|ûí·Ô½{Wi#ã’îşû©^İKø9FZo&PO)œONß|ó•.[šÃÁ™Üæ¢\0V˜f59=ˆ~ùç ­Üœ@îÄ\0J<|„R’Y¡ (‰Ì\nÕÄÛFğ!oXÓX@pÉUÏ¸\0UkXÿ·Âòp£í¯WÊ›ïám¾C~‹;µ¬´YİqZfã‡Ó™%íÔ$2€Z”+AÑ!Î—{‘å;ÀÀ±¦MÙÁ?‰[µ8®l¼œã9ƒpçka$!•Â4JIL¢c;öPÜÚÇ”®<ÊG!–Áº\n¡•£)åL*¹’ÎPzˆ‹êŞİ—Í+³a“$éÈÍJ¥¸—â\n¾vÚ¹c7İ{ï”šÊF–å³æî»),4Œš6m*Ãq±\n&1ÃŠ¦ññgd™˜ê¥Á(´5nÜ˜Ş3†ªW¯!K³G°œB8Š{ÚÑ\0ƒ(0\r€;vĞwÜAÇÏh\0ˆXÌ]b…bá…Î{p0öíİÇ÷Z>87\0Jı%JDĞ·ß}A%£Jòc¸¬Z.¦pÉÿç™ÇhÓ8)‰ÛØ8 47%ÆÅËš(—C¡˜:äÁAL´#“ºàªp¯•26Ç“z#œ,œ÷º@ô>VÆ«è Ã¨Q©6ØH3’¢×9Øh3ñ¤M‰^\\èæ¸÷Æ³Ä½qMn0?‘¤oö‚šÕ=ï»È~&‰öÿµˆRC@8\\=.<bgƒD™#iQnªu{7\niW‡Ãå¤\0P¶\\Xa(.(`ïıtçwqÉdÔ‘© Ïö•2e_PóvÎ‡pÉ%—HÓlÍšµ¨\\¹rÁ†\nj,‹»`ˆ\r:×!Á›.?`]ìØØX:qâ„{÷ì|¾ÀØ6´#“rFp§Q€ËM	)Áôİ/1´~O\Z%cø9é6\'¹¹\ZV:’JT(M‘¢(¢bi\nçípş\r-Aá¥Â)0à³Î`¢˜gN5îÓîr¾¤s–À0B+¶ÓHeÙxº»VI\ZŞ¬µ-L¥‚8^9í”J7â•–h²À÷Q÷gÎyã]3Q‡2gw\\‡¶~ÔÔ m=ÓGZj<¥Ÿ:I©ûQü}dçR¦HÅuÆ½…ƒØ@ƒôà¢èn\rÉÖ¦\n¿š8p1œïËjüF<âtiÈÀ¼(çÂÔãù†ÃVÜ•}Vè\Z\0Ê?6î4ÅÄÄHÀí·ßÎ\nüŒœ3ù›çèbê¹7\'é]ˆ W®\\Eúü›)Ê›‚èÄq7Mœz„öIbµ€¥‹9¨\"Ü!]¶qÏ»â×¢`<˜‚839éÿâôğşP®°“0Ã ô;°Hš‹bÃ©GÅH.õGR+64 ã_¦-”öQ}*ñU\\ãzï=æ7Âmè<\'53¼#Óòòo\0o`Î¬6ˆöZwB%Äœ dvg¦”Sq|\\ê„”¸FÂ®ö­ÜwTi	ÙaFõ>&J\n yÁÇhG‰ctâØQŠ;}†\"ÂÃ©RåJÔ²U+êÚ­‹L1+“\\%>ìßˆî¸c˜L<¦jõTÿœÈr-T9`¤‡ºµjÓØ±c¥&\0s„‡…ë\Z\0&+IRLQ	AÄE”( ¤4=Ó‚XğÒŞ#éôş‡éğ1.ƒ†É›‹­‡‰Œc:.¯r&Å™Ì 	e‘Œ¤t–õÅ	3\n”ˆSq…êëeìôXË²Ô©*â?€RÒÃÈÅ¿*ıùDbêXNQª¾µrÖÚ\0i4rbF@öÓü¦ÄÆÑ™í{éÀÿÙ»\n\0«ª­ıİœîd†NI%QÁîîÖ§¿õì§ÏxvûìÆîÆxb  \n(bÑİ0ÃôÍ}kŸ3sg˜&aî7lîÉ}v®Ø{íµÇOÃ_¯|‚9/}‚åŸOBá¬9¬Ú\0·/¯	¢|+&àÿ5“Ö²ÄJúhŸBcHæ;¦Swü˜P—g}ˆ)S~Ä¼ù°nÃzÌ_¸ø?ş8N>ùd¼ôÒË•å6DE5íµ€d¨&è\'Şöß((#´ÂV\0	¶™‡÷!ì\ncîŠ\0{g)ÊKDÛ—# 1U-à+ÂŒj†(\Z[p2 öú@—šèà	á´^‰8¦w:İ¢YÁ·Tç÷µxµÔSÎµµ#©cz9S­‚.ù%£wEë÷á/©@ÁÜ%X>a2ş|õ}Ì{ãc,ÿŠÿœ‡ĞÆbøD(ñK:ü¡€\nAÌ^\0*…	óµV­Fü4ùÑØ8{õF [GÌ_6_·PæR@¶AjŒôÉáj®@)/÷á™gÁ	\'œ€W^y]—ğ–•V !$	W\r3²j¨§Œ£Ø&aOóFéX¢S\03°+W®Ğ)€³Î:6TßÀ,Ê‚HkìFÂnp[«¨CÎ0²3RqåOã‹©¥(+\'u¯Æ\rÏÇş)’È«ŠGR\\]ã\'cáğ/Ñ Ú©ŒŠqÔçm±é±laNûÈ	™%c»D£í—\Z#»\'#I—JËRFdÔN©2XÚPØşl£J#ä\0OÈ¨EÀ(ó—¢\"èG©¯BÚëmÔ¡[åP*3!K×Â±¢\0Î•kà“IûÕq‰(DñÃ¥õä9ô;üá‰Ô¿oÕ»~»4§ÙŞŒĞbÚ\n§AâR²àèÑäTBx|Üã˜Tü³ºvÔÙÿ¬U&‡ËåFbB\"vØ¡:vì„={¡{nÈÉÎVãU½KÖ0fŒXºd9ÎŒ˜Ğé(ÖÌfê¸9LµUé€ÕŸz÷è‰{ï½WÚBOtèĞ!:`!*\0j\n\0tX±n]Ş³ˆ­ı7E\0ØÚ \0—‚¡{İ‚°7].XFÒ9H|CVŞ¢h>ÈÈÉ¤Øj\\!ŸŞxÄ:+°[~öÎJ†Óá“;ìr‘„Ç>&±²»#¯9u©&7è	Ñ #ˆµ…kñó_¿à‡ß~Ä¢\r‹°ªx6†*tùµ}¾Î&âòLrCqØÑ“‰]Óº¢³+U„\0—hõ$„ñË;*û	\"®*pX€˜\ncØ:d\"è¤_)\'É\'7xŠËíƒPçøc<’w‡\Z>õå3˜¼áÉ\ZÓYnµ‚€õLdQJ^ée255))Éò›†ÜÜ\\uYÛ©SGäää\"-5qññê}“eèAÉ*ªP]@«~ˆ¡¾g˜”Ö)ËæivbÉâeøÇ?şOGU\"™c»eV»î%Œß\0XïIñ‰:Š´½#*\0\"\0.<÷Üs+\0íY\0àJ*—#Ãö»îØéÌÔ³ªª½’`FÑ$°ôìÒ$cÕ‰s¯^w\"²=Aì•¹|Rª—‘ò¹oª„Ï‰@8„ßş·¿û“çMGq T\Z¢Oê”ş¸Tã5U0¯\nS®€œ!Ä8 ®öJ€4œœ~ˆ0PMÛ†S˜¿YZhĞš€¶=sxbßµ;Â¹à—KLCÑåÏëSŞÀ§K¾tI„)ÛşÜW¬X•4lf]IÑ´ø#µœ¤nx(ôDÀåº5INNA^^6L„„ã6–ñÒ×‚ıÎ¦°¿×~\0³ğkú¤*í]\0èİ»7î GÈa/I…<«mlÇˆŠ@°›8½aÕ	ÿÚ#¨5Ñz\\5;ÍB;íÌm$\"ºtJİn7<ÉÄ¥Ä &9Yña•—ŠRTæ_]ğª¬\'nÁ3gÅ\\÷Üm¸èÅ«ñåœI(\r–È·D;sqEAA5áç0ºyGƒ¼Ï¯è¨€Òñr©ÿËæà¹U?`£«TÒ]EÜ\r¶1tºáHÏ‚gĞ „ò» Èi2s`hƒÀ¥³gßóx<xâñ\'ğã”)˜4q\"¾›0ûî»/®¾ú\Zt­LJù…`4	é•÷äºƒSz¬g93RTT‚eË–cÚ´ŸñÄOá¼ó.À©§œ›o¾M¾9\r\nähŒ9¿Å·-pË^\ZS2lKydß¬l[©©·E°7D!`› ñt‰†A—¹œ”nn‚ÜhM-¨õÁÜT˜Î¼	á¢ÑPbÚ†(ápx„é\'Å!!%Ş8)_wi¢i˜‘Œ±d4åúJÈ²#©†ÖJûsU@\0¯|ı..ò\ZLZ<I˜N.a>¬>—t[§Ã­lŒi o|NópÔ^yš\\5«6Ìu¶_jüLø/¡µ»áG”ÅĞÏ€D¦÷ôıÏax‰W‚ÆÑæ[¶İ›t°4‚ÂĞ];\"¦_?ÒàgrôyJ>Éé·ü¦Ç%ËãNüÔSOEjJª	Nßıõ7t“—®¿ÁÒèì¦ÛN»üÚ·ë\nàş¾Š\n¬Y»ãÇÇ5×\\«ßæ·&~?Q„…b«¾ögìóv	S\0ş\0=\0Jkæ$Ô(—v	É‹‡IEr£*Ä¿(¢€›pØ4Ehã7A	 A†vé\0¡0ç‰…Ñ@ÍºEÃÉ¹Uq0€Ãí@L|bcŸwœCxT@ŠÚ\r¯”÷>	èè„ß)åî\nHÃ¢•?ÛOİ¥ïpCzQ\\V†»Æ>ˆ§ş÷Öû\náU˜ïL\Zø+\"€K4g7¥Ó4Éğ«ÀÙryÖn¯dşdòÏ)õÿcp&l˜-íÄ^´=÷²(š°	ÌK°20¾–Bˆv\n‚@\\<¼=zÀİ¹eøtò£%|Šö.ÉW^RÄ#¥R.$XÙ`^ü~Ÿ.|ş¹Ğ½{¹DƒFI¿Äa‚•m»ôú¦¡&¸ı4§Wl\r8  °&|İx?şÜyçİøùç())“4•¡ıÂ”A0 ‚¡\ZÇQ\ZcÚw®R¿1^ic¬g©ÏMk{ûET\0°`ŸÏ§C5a3€ö2‡hS»Tg)Õ˜E›ƒaRf\\ÂøUÛOï…ÛkÁR\rÈÃb½Ø1\ZºO>S?é¡†²¡|®öVŒŸ;>\'×Â›xH˜Ù6¯ºê*ÜşŸÿà¨#DRb¼E°9ç/õ¬Ÿf$¿œÈğ{‘_/Œ”{2È-©W Œ/6ş…â¸YêÇaŒ-\nN®ÌLÄ„pV^½ß6EçBfbÒ)˜õËL<üÈ#ºOËjñ¢E˜:õG<øĞƒømöïÕæ¬ZvD¢òf#ƒé>%Å¥øôÓOqùe—ãÄ“NÄ“O>T\n6j·iH©úÇ¥•í*İ›kVÿ´óàt]Uˆ–F\rp‰­€k‚4Ätÿö‹€îrHËævF˜¶*Dë„ñ;‘‹aş8)CwH5~ù_Ë’ÅI-¼‹¼±n—ıË}ó¾A©e(ÇÍ/ßƒÉ«ßé­˜ŒÜ0s\rÕqÇ‡[o¹—]z^yåŒû’j6öÎ•æÜ]È¸q~÷Ñ¸ºçäÊÖ8’0I16Hü7Ì‘\'…(†Üæ[\0ì,8ûôEylŠÎ÷Û\Zm`ÉqÚ$Á•ŒÁ]vTÍÿ†İ€.;©?÷¡Ã‡«VNÆ{õÕW›wXH6ì‚³`ù•£\rVzù¯\'çwN>ùÌ˜>ÿøÇY8çœsU0(**RÄ´\rÚ>º\'J0ÔÑm	\\Ò>ê`Ë\"*\0Ø`¿–ÎM\"ãæF,t©V¢£\0>¡ÎYo!Zß~AæÀÁŠw†‘ Zv|¢0~Ñì©E˜Gá³òŸºúõˆÆ?,#ñòtÍ2ÈÚøŸ™Ÿ\'8ÌÍcÙ?óŞ˜¶x†\\\r*SÖÁJ›‰I @·®¥2Şu``ÿºté2ib’ÌİTGòœÉÈ)õàôì]òêˆÓA#¯ï‹–ˆ #l£ü|\'\"˜)˜Â–€¦¯´ş…‹³z%bK×#6 Â‹B>Á¾gkŸLk€CÑNFôØ	‰!)YnP%yİ(Œª¼´\\˜•±V¯Ÿ¸³¤¤”Yn,<½BÃ0\'b¥NĞ±cFŒƒ:Gu8âˆMî!ß¯oœxÂ‰¸í¶ÿ`Â·ßâ¡Â}÷Şé3fbæÌ_pÌÑÇâí·ßÃ	\'œ„î³gÿ¿ŸSCŒ¡åÊ²µ@Á¥R˜Ü†àñJ;’|Y£eQD—\nH@HPV®Z‰óçãÑGÅ—ãÇ[w«ckùóo\r¢×às‘Ói¤°‹Z!º°\\RÂx”AÄy… V\rS³Ìh8Î¢S†Âcù¥÷º®®2Ñ%)dZã—\'øš>c`†©y—÷Ùœ8<qö¢ıß\rŸú	0uVùŠ*eC‡\rÅgãÆ!))YÛí¸OÇ©<2ÎêpÀíã¤ÔÁØ+¥·(ñø¸|Ş^;ÓŒ\\„%ğâ!ÏŸ KEk~¯5À¹~~‡ëûÃ¢•yœñˆIHcáJK’kÉH¹¤T‘rpK!—£w}ø ş*\'Â™›wHá±jôÈs{<naŞñºløğaÈËï€ì¬,dgç sçNèÚ¥‹<çDEE…\Z÷ıõ÷ßX¸`!áLŸ>]ã‰Ãøñ_aÈ´î˜Šx‘ pÁ­š9=1åÇ)øü‹ÏññÇ«÷9®V8ğÀÔÿÀ¦+0Ú¤œ_xñE<ÿü‹Ö‚¢S•-D»ƒ”5[Ã	\"´vúièÑ½;r¤Şãbc7i7Û#¢€€„´¨D€•«t8ñÅ_À{ï¿oİ50š‰µş´+Û…0:÷=\rûìe–	ì\0ªÃãÔíœ½1Â¥H@¸_¯’†{+lFí\n8qhš#Òİğ+7ÏW1~ÛXÏhézŸhãçßw%ş(úÛ¸ÁØñò×ƒ{¼Ú§ÏØqÇA(//Ç·&èò5rÂJ‚FÆ)Ï%ùá\\ŞmodU$¡ÈÂ\rK?ÆzW‰:)âdî‚NúN¤¶\nX2œ\ZÑ”Ê=A2zæSÒC£»˜x8bcàNN€+E„ØDãÔÈƒÿÍù\Z/ıôª>Ç÷µİÖ’èœœlì´ÓNØa‡¾v@nN–:úÉÊÎFĞïÇ†‚\rX¶|9æ/˜9Âì—,Y‚år¾rÕ*¬]³^GZ˜BÎÛä‘v´½¸ñÆ‰\0âÖò­ğUèÈ‹ÇíÖÑ¾ó·Ä÷şûïbíºµ×Z,X¸\0S§NÕx’“’0räHwü1j´HA¦-Ááp«³œ?üØºB´€}ãœsÎÁ±Ç‹nİº!+3+*\0Xˆ\n\0\n\0Å¥%J\0¸uïk¯¿†W_}ÕºkªÚaqÙ@Fç£Ñoè¡XÚbT\0¨–]Äz=Æ[.—È‰°D´$„•¨F·ßÁÀ©]râ*íÕº%°™·\r]zgGœƒÿiîL\\ñÂ¿àõ˜<^ß‘8µÖ,fN˜áëª]Âx˜*‘j³0B.¿hıÂ(å#ûxºàØœ‘ğâğÈÚ¯ñ³¡¼Ç)Oê#“Ê+ö¸PëÂÎA˜y•?µsÔĞÁ¬0÷ƒröN!Ô^¯î¸T|œ§~}K=¸±Ö%\0têÔ	ÉÉÉR.ÜÚ;ˆ²²2=.))•ãRŒ¸)’y•{(Tò¶úyMæ@¡ VÒ2zôhİMnùŠeØ¸q£ÚıçÖÛĞ¡CŞyï]<üĞƒº\r¸D ÿ˜3y×¦ò›‘~ıúª0‘f®·8põÕ×bòä­sb\0´™9à€ıÕPT\0¨BT\0°¸‡ÿš5kT+øø£ÕˆMªIglBŞ‹Ëør#)koì¸Û‰ªÛ³\0`²,ÿIuÒSÃDBR<ÜÔ6…9òZşS ”mÙ×	‰ˆúâ±~—·0\ZN!˜#û9\"¬8è¼§\nÂä„	?1n,^šòºî Ò„‚.¨LkÒ6Áâsd0æL3¿‘®}©\'sYWbp}§ƒĞ)”„ÏËÇk§Š$âQü1™¸.c_\nE\0¨z½•À„²ü˜MÃüm€6´p;E0‘\"¢`;ë¥X\\‹)…‹ñké2”;*”a3¦Ô”4Ñèº«Ö]RRR­oR{§`Ï\"¡7D¢1¿æ³vÜú+·sç3´#ˆÑÕœ> BÜFYG)B* tìÔıúöÃ˜=Ç wï>HIi‹^èhGáÀ™gyó²™ËÌ«üµGº§vÅ²ş×u×cÌ˜1:)\\lLL¬ƒ-jºÌö»a³10¸]nÄÔÒ8Øì>Ñ^êÚiíÕÛ=XïTÉdÃHà³G4)\Z<%îdÚÌŸĞëÕ@†F*™\0ÕwÚ(j<GÆ_ùË)-\r…QÌ]8_¢!‘Õë&T[5j$rssäYëºBNø¬jƒ\Z ò¾0ËOP7\n‘_ï/…_¾KçAÖù‹%¶êéj=ĞX’£Â.İn˜\n9-öÂƒXl—áĞ\n¼Y67¯ù–NÅÏyAt;d$n½ÿvLøî;\\vùåêù–ÿ;ôé£šy$Øw«¶ş´\n(²NË+Ê•ù;¥L¥:‘ŸŸ½öÚK½ùæ›xúé§qå•WbÄˆEhIÙ„¶´”–•è´R5´bùm)Ğ±±J^ı?\n¢:uÛa3şÈÀáÃMw\ncQµÏ¦Cç?Ô¸üµğĞÍq{—dš	CÓ¤„xÇÄ:”\'B\0oÈ5eø\r/]ÓH-#6Q\0ŠòA49¬­Ì&x¬ç2©`À¢­+äó;~ø_|şş˜=Ï<õòóòÔÀŒïU×ÈìXí ƒ¶&Èó©A7b]8\\NüVºZ’!\0³*ù/\rUèù–Í)8ü¯r’¯C9ş­Á+Sqõªqİªpßª¯ğUù<\\ÿß;ğõãñÄKOáÊ«¯ÀAƒ1ãçéxeìKX·f-nü×xı7Ì»Àî¿6\"ûtäõÂZDpHš5Xñ˜Ñ!éWÁ\0ÒRS0rä\\tÑ?ñÊ+cñÂ‹ÏãÆoÀ>ûìƒŒŒx=^‘ĞºkÃµ¢Ü‡ò²2ëlÛ]»SHdİEı\0TGt\nÀ%ßÕ«WcÙ²e˜4in¾ùVøfƒÃ/­†£Bí€îëî‰ÉÄğ½o“¬$Hg0CcÄö6Àïr»”ù{cE•²Ñıû”ù;…/ÕO$ª\rãKzåô°ìd‰\" ŒÁÜeRÆò1µúÖ¸rÌÁcı_®-_¹ÿyíü\\0C˜5ÍØãÁG~ Z$ãP5VÂ¢%K±û{`ÕÊ5|0&î*&\'V„>”sİàp\nş¯ËA(òùpÛ²ÏQä*@˜¢<™öà‰NÇ#ä“µH3`&¬¼[é\"ÓJA\\a”„K±¼l-ş¨X‹iÅKQ,…_„/ËCŸ—ÿ™<n³b¹Déd–ã×°Ğ.ƒUs¸ùD7…Ä‘Ù×®âÿş}°ÓàÁ5jºvélm/,‚U0¨Sjàg×yMD¶Ÿ6ƒ–-_‰³Ï:ÅÅ\"D4¶«vË&¤¬¹œóî;îÄĞ¡Cu+`Ê¼Şˆş²ı¢º}Â±ƒÓ»ZÍ¢a§m‹wó0}9€€¯\0A	yÖv2<\\N<±nÄ%{“+eã¾Â!iÎÙò)²˜ê	ºÔË\n°>W¹4€jÛ¶öO—»ŒOËŞb83»„Q8±fÕ”®,EçœNú¼ÜĞç8Õ³W/95çdŒ‡];wÁ§fF$¸¤\"t>Z?lÚ(mhJ@#:ÎƒçÇv€K¾÷gÙ*øu%Ä(	#û$&ã-ã¸HX¾–E@4şV Kæàá¥ßàêÅŸàá5Sñiñ<¬pU Èã€î” õÀ$˜7IW0Ee’¿¤Q˜ªNb0nyH¥|XF›µC®“oÌ´\r.ëXó4\r=æÜ{ï÷éGxğÁqÆé§£WÏÊüù ÚˆäRiİ_küÚ Ø¾è¨¬”#\0‘eSWùµp# §üœ£‰í”\0ÖŠ¨\0`Ì_Š0ş4]«»\r5åBB`T”s¸¹ıwêFA°ˆ‹Šíô:Ÿè†[ˆ6×Â\r²éuM[z¿/ˆ2QSÉÜ9´nƒ´“ŒšÅO–Â†YYÀÆÕ%(^ãƒÇƒ:ô†G4qiúG£¦L¬Ç‘`›ÌÌÌ^)Ì{“)ªê \0Àïò^©Ü)Ï‡/7ü‰\nT\\ÂÜ¸×>A¶#ç-Õ$8·Ï²Ä„ñ[pî]õ?\\¿l^X?¿×Á/ı¬Üevú3<Fò\"	­Uá–ë‘õÓBIÜŒöšš‚=öØW_s5Ş}ç¼òòËøç?ÿ‰;­6íQÎµŸµOPPZ¶t™îy°­S0		‰:²¦}§ıVS‹#*\0XP}H:­y9<L¯_:Ìhi$æíWvIÚÙøİ(,Z%çÌ«ŞÛ6ÈøibŸ”€¸¤©HÑŒƒJn\n•(\\n/”Š6«öA)Q£å-\\J˜ÏˆËRV-.ÀÆUEÂü‚ÂCè‘Õy®\\Ñj\r\"¨{Î9ø÷¿ÿÅ‹—¨ƒ\Z‚Éİ°~ƒ×¶SæŒ©pÒÃ´ãVÍÀŠĞI*Råª¥Ëı,G¢2à–õô”â¹•SqßÚğ§·	à]I°<äTËEúÃ&¨kø¼…¡å—ËÂzöèÓO?\r>ğ\0Ş}ïmÜ|Ë¿qĞAˆĞ•.y±F’ÄQnlK\Z²%‹—\Zz\'a‹ô6\0ÖWBb‚\nmÜà‰>¶‘¬µ¢6\0ü~¿ºÁ\\ºl)şş{nºñ&ü=wJú¤f€RèR{,.&]ÒÍáíŒŞÇ¢gÿåÜ¸%¶é&@Â-\ZgLbŒ\nv&ËÕókJ¡\n)\r>Ë-wc~ŒÉLÀ d/â„ĞĞÜOY^Ğ%ZUk…©Ï)\\”~$ˆ†/×ƒÂQÈŒ¹ıïw&âÙ)/ à²Sª=\0·¦¦óş}ûéò%¯7Ÿ|ü	ŠKÌr3‚ß`İ2‘Z)‡Ê	2zOĞ‹ 0a2gm\nzÏ‡qPLoœ6\\ˆ¾>Ş09\nğü²°…rÆ‘†\0|Âíƒt¬r©Á$ûgóõ-;Éd¦ü±ó`	\0ÕíSš›H-%ë—îa=ê	ğ À!CĞµkWeìòÃÄ 0ÏštÉq}_Ó*ÁÊK»‚¤ıÚë®Ç¤I?ÈIU™Ûví•F„Â:×^{:_êØ1I‰‰jÙ_¶WD\0Ñ7‹\0°d	æÌƒG~D­°Iê)D{-®ÑZ¸ô+6g/y’²ª°-4.õ!l§+†o„àö¸Ô¿U}ZVÃ±crÍqù‘ááÔ€0wICY0Ëå‰‚ ´  0?W1z•û1ÀçD2½àIË¢ßa˜OMxS×Ï”N‚Sz ¬æ66B+¶\'âHf¤C»­òW•.~A\n¦’wÑúŸÎŠ\\\'®NÙ}còëåk›ƒæBÒPæuâÑe_â×P|#(É#Ô|\'»bDØqJ>9Â¹róAÖ8mP[\Zª×ógòh`ŞÜµ0`-¾+ii©Ø}·İpÈ¡‡Sèni…Uñ˜ò3åÙ¨vÒ^\0iWT€şïœó°`şp€ƒ°ÛÑ^i€ƒ:œw¾\nx999jXÛ¯Û#ª(Êö¥\rBŠiy,š\"İ†ÚëF·ĞĞ‹Ú”¿l¹TzÀêÜvhÿˆ$O<æR3‡Ç‰ø¤89n]‚l—\"w·[ˆÁ,¦<ø¹Üƒ¿+Â(®\0<¡ r ÌğO\"&%Äc•Ç-õÀi\0Ÿˆ\018e—SĞÕ•¯nz¹ÁĞßMëÇÎkÿşığöÛoëŞôôwOT>m=¤çrl492Y£;„Ê§†bĞ;©œÍœö¥¨AşÛÆ¥’÷ÕÂèı‚’gº8ÓpdÆ@ÜÒq?œš;n\Z÷I}Ğë!Û¤±Ã0<jyH;É‚óút|ã×cì‹/à²Ë.UìïÊ°k†Í‚Ï´Fz·h\0XXX¨Ç¤\r‘Ì¿=Ã)}2;+Û:“sB·•¼µ¢€jCtÄ!@ºé¬tá)0ä³=‚Æi.Ñ\ZEÒ/[ŠP BçÆØ9¶PC±ëË-õ›‹ø”xá·ÂV8Ù¼…à™‘ü<Â±!Ãå`¸hé.j”x$«ä|JŒ¼Âè94/Õ”—ƒ3GŠtw†ä…Öè¡ªÈRG–öOÍßŒn\0ƒÁˆ§|={ö2æ6ÿ¯z˜Ú/	Ÿ”è¥0Oí£#\rúñf¢\\\"ş®xäÑ\r9½é81y®ë°ˆï‡´P<:»3ÑÙïE_<821Ø™…îHDŠu’w¥¿Ñ6+ºyÔÂ¼\rë&>{î¹\'zê	<öøÃØ{ï=‘’š(ıœ5BAX·¯b|‘¿›½µM!R\0Ø–ÀU2éiij]ú·)\\7¬ãíş@@anÄªU«1åc‰Í&#İ^ÛŸÌÏã±Ú}8ìGZ‡ğÄ¤ˆFÊZ¯·¿\\T¥[‡Ò…gpĞ&6Ş§‡Ì6(¹o×!×µ(­ñ°g	ŒrCİà=jŞú”0&.—+sº+u_P*qNB:gåá¯eQ.­L5G\nŒKgs…ñ-˜?O×œ/[ºŸ|ò‰úº×\',\"g¿«¥#\'Bíú†2qlÆNpÊÅ ÓÛTĞÎ B¾1ní¯èêNÇÁY;â„ôÑß•-ùrkºù…8x1,½vKí=â{b÷˜îØ9­3vJé\"yw¢¨¬¥?B´¤¤\"ycº4O\ZL-ÚmWaNTp0ËwÃºÖûˆ#ÿFãÏÎÎ2Qr)Ø&B¯AêcÕÛOÄsö;u¿ÚFáÀ¯³fén‡öù¶‚¯G2Ñ†&==]Bºû6«½¢š–NS­9o¯`1pùÕÚµk1oŞ<üôÓOêÊ“=› p“’vTe°ÓL­ÇnÏC^÷!¢‰rØÚ\rb§¯µqé˜¼Ùp!&†Î}\\êÕ£m1öÜ=Á)ƒ®%Aì/\0­ó_|Î=°°d%ıöyÌ+§B—îÁAÍDÙ#ë‹—uıºul—‘C´]¿0ú` Œd\\–»2œñrG¾§ÓMİùrV¥»i/ƒn*u×IIk‚+\rÔG€<¯içrâªkõR¸ÜY‹`¯\0ëËğw°@d¢ˆÌUB®Éu+ŠJĞ„„şğ#Ã íÀ­Z}óWo˜’‰Â ,õÿÌ3Ïàå—¹\ZuÛ)Ÿ¤„8Ü~ûíº;$m\0ÒÒÒjuõ¾½\"*E€‚óş4ÉÌÌÔcëNDh Ñ³‚ü+Y¿LÇ‚Î 0!^o¿`qm/½úÅ\'Ä\nÑ§æß>òÄUn—_òÀz LæOã9\'º$çáÊƒ/Â^İvG<¥)6š.³ºiü\'‚F…KX²0äşî\\\\Üi?¤»âUp°µê¦‚%òw¯Ï÷ÇÀtÂÏ]ø¨iË=m^µV‡ŞUcDH¥ÎòBq8É;ç¤îŒ=sûÂ+m´¶WY¿Zïü“_ºí<x\'Ü{ï=xî¹gqÄá‡K{à.‚yÖ^\\i£9¹İ6A%çï¿ş²Î¶-P\0´şt‰·Ğô(ó¯BT\0° E‰‰Ù8‚%55Õ4ù\'$GCûóBYñÒé…H#NòÔ¾›\0™?ı|ÇÇs}?­ÙshÛ0l-^´ßLjÀaŸ¶.Î_sùµiŸpüx¤áŒá§á²1 oB¸ÃN—·=\n>—Ä#åS\n¡SEN„ó:B¶p](0šæú\00qÈ÷ÈÄ%pŒ)$ßÔş$×Í4ˆsm_Ó3¹aFD¸B\"Œr/0Éµ­üÏ/şÅa©OaöF ³b‘ÜH@¾áñbï½8¿ÿ$~ø!6T¾Ëg¤,CÆkcõƒ„-[¾Ü:Û¶’’û¯Q dşœ#ŠñÆ\";\'!!$È6YiW°¹…!”-^)š\'¯YƒtÓmÊ²ÈX¤Õª¯vÑjcã¼ˆ‰Æ(×Hê9ÌL¸m5nª»’\r2¾xQNó8Å$N}÷“ÙÉ3t”ã&ç”çwÌŞ	W|ÎÛåÿ0 ©â\\qºè\\Ç<Mí›eC&êAˆör	ØİÑ	ÿÈØ—u9\0‡ÅôER¹µ\n@ŞŒÍAµ8¬‚×”ÉEæÓüÚ9“ LÙhæj¸b`¦s%Zñ%Xù\r~t­@™Wr$BŠ6[Ö­”\rãJ-\'$%âè£ÆØ±/âæ›ÿ¾;ì`¿Ş¯üV\rAAA!V­¢ƒ°m\\öG rEÊö2JØÚˆÚ\0D€Ca6lÀÊ•+1şB<ÿâ7îS%B*A*]iÇÅ¥Òd2Nôq\rÒòv0„9rbºÍÂŒÀ˜ÙhÙDlB¬Ô´°”|4\n”ƒAìWâ«4T´AöÌö©½j«“—ü® ,ÆÔ_¿Ã’e¿`E°%9pºN@\'w2ò3Ğ)1YÎD¤‡D˜%¯•w›äÿšm-h¦MŸÑosäAm6»¹ÁB|ºö7üX\"·Ş\0—	Š.ÒF‚oÒÆ€Ó\"Y9é8ú¨£qÀ~û!Y4»©{õÊ§‘Ûee¾e°…òØÎñõWßâßj®Ò“¶•m\'wN8áõ÷——‡Ä„Di{¦ÛûÈ@T\0ˆ@ @II‰\n\0sæÌÃ§Ÿ†gŸ}N\'™ÕP„xµoHnD½Ìïv2:ï¸·œÆH‡¯9OÚ6¡tI½×ëDl|n³	Km„¾­ı2¥œëwÂş¾0v)¡\0“34^7Qâä\07#RF¢tÖT” (T¢sèÉxu¸ãAÖŒ&èCu¿«Ed´rnŸò³­FóoeÜ’ò`\0nù[î,Åëfà·Š5( Ã G®™}h­ô {f6ÿçÉØ}ÄH$§¦²r56UúõHP)\0DÖ;Z›ÃÃıï¼û®m[\0Gsÿyş¹ØÿıÑ£G\0ìmmlï@´‡D€²JVVö6Ø@$Rë…ëgK~=rfq¶©§pHeşqtëkßèö„°S	\" t¹Ë/uAÆÏa|ş2±ÙÇdlÜg€ù•—Ü^¤vì‰ÌP2z“Ğ[´ÿ¬çöƒºj@§­¬w.jSäik—`e$UaaêS‚+ğĞ²¯0Ñ·Ü¥p‰0Ä\r’Ò×8Á4RNÅ?3vÁmÇ‡}öß[´şdvR+®(Z~\0³ÿ}›,Vûs9¨Íô·wf_¢@(1rH™ËDbb<èĞ¤„ğVjÛ$;eEóá•Ã¯0€¶Ù1l5uæã\nÁçFlB<.îäÇy<¹^Gh› Î¡o\0B^ä”…#¼a”—«¯\nL•@‹ğà»á	»D`p!œ’ƒP§¨fé³†Ô9÷ï\nÒ±N‡rÄeöä°¿ô;¡5Áè™O.Ó{¿à<³f–¹J¥,r]ÒË{ÜR.Ü°j`8\r—fŒÁ¥öÁ ä\\dvÏ–VZËRE¨Ù?ù”¢¨4˜‘òáìIyYÌ_(×¤–x}ÑşÉìé,77Wi@úª#ÚK\"ÀB©Ñ¸|$;\'»²Ç¦B@È\rG°« HC+ëN[ƒ¤TşBR@ŒhıÌl´Õ4odz@‚ŸCŞ\\ûoò²yºË\"º«œ†éÆ6¯#Êã“uT÷)ÌEFÅãÍFİšÌ)Ÿ†ñ}Å2|^4eî &ÊÃå\"Ìøœ.„ä~·`.J\ZKóöÂPW.¼<N$vÎ‘üñÙ­š“mR\'N)÷Ù³g£¬¼\\m2¶%PhÎÎÉÑ]]B£×¢¨m«Ö›	J‡\0ìQ\0®èÒ¹‹º	6kÚªfÙXEúwbãÊù¹¸Õl[í¢õÓŸB¬È°~Ú·OKö\0u/dP«Tÿ›—GÊ¦[wT¸ª„£j°5»­ı¼Ô™ÏëÄä5óQáä\"ÚYÉò  eáÂÙ©#qm—£0(©7Ü¡Xèîné‰qr\'Ç(óoÌ˜1ÃêSÛs¤öOzn+QíSD€\Z‰Vf[–{<^İ>’;n[KÂºu³D ÚbÇssŠæï…Ç+ÌÀ²$oß¦Oc7ùMb¤#®VÙkî\ZS\rò5bÖdLJ\ZĞ¥‹ZÍsÔÄŠ­M€CûŞ\0GBX_±^»hõÊo˜vöğvÂí÷ÇnIİàYÔéw‹Ä½+LaxSJáO§uÚN¾¶°ˆ§M›fŸY¿Û\05£s—N:ôoûu±ézUˆ\n\0µÀˆ•†Ó¥Sg•Í<ì¶A€”E8}(ß8şŠ\"ëJ€rD6I.Ãï!Àm]3sÜ[bÎºÕ é¦õ?w¸ş×Ì|=½õQSn0D \n;ÌŠ\0ú>ÏÍG86+a\\>)#¹£åV{œ|ˆ­öæKêR¾Ñ#¹¼~Qì%tA\n.H†ãÓG\"¡,A‡ø]’f—SKFŸw9\\ˆMMD9÷pHš»maÕ°rå*ÌŸ?_é[cš^›E„=\';vì¨¾ÿIÏL>«‡í¤QDÀn¶äHÿÑrÅº»m@§2„(Ó?|áŠßäŠé4[fXXˆŒ	Iñp“ù[”\0zßzµıÁ%Ò—ŠjÌM€Í&?´î—ĞXS…\0sô¸×µ‚1	p‡¸º£-@ò#Ùï\n»š;×gì…[sÂMùbp\\wÄ†hœE\'-v/3Sm<ö‹Ü½ƒä1¬ŞíÑ’(ZÓ¦M­ÜëdÛ‚´i*]»vÖá*sQf_;¢@\rØÌŸÆ#\\>’€œ¬¬VÖ”¶$HFÉlÈôØ¸r¦2Ÿ6aŠ¢#6!Nï¶i±r:uËà¥® ¦z‚Ø çÁ h(As7=¿|3—\0oçîR#%	še î7!@\rl.t‹ÏE\'g\Zb|œ® kc2ÿÚÉP¹´‡Ønp‹öçÂà³Q4JÆ¤o}ÿıDs¼\r‚\0““’”†3ĞËÅ\ZV!*\0Ô€=ÀCA€$HlkĞùc·×ÎC8b·´­Å0¨å‘$¦Ä«¤e:iUGİºŒ¬¥ ùá¸…ùÍ!ó‹8fÄz±,Ö­{êsYG;\Z‡te§Ë\rg‡„2sõŠÑ©9¯Ô‰&|®6âRGó:%âĞ,½8Ò£a€ÂzE´‡m¹äSÄI¯Nó$H~r“Ì¨®”[t@K€eèP§?Mû	.}ÙöĞ¥Kõb/ıÛ•‰–@T\0¨6{ÎÈ?â\\Ò¶éaî’æEÀïF…¿kW-Ğ5Úì#[’ÆÚ]5D¯‰‰qÊü¸â›BïÁ%sU¬¤İsòÊÈ(‡@§\0Àç±NL‹Ã*\'gÀ%¿Slh<ç—ö\Z×µÂ©™ò3²£e¨GU°™,CëÕ9kI4¯[>ä„\'Òí™=N…¸%°¾™¶Ètğ—çñI‰(OÍ_ÊË#hPhÄ1˜6`Ú†	QÔmÒ³„éOÿy|>ºˆ4mRÃ6„={¨æO\ZÎ)\0Û ŠêØ¶j½`\0¶å(}´Í\0Ñ˜[¢A‡+°~ùt9°í–ÓlïòŠ°•¯Èö²/zè£ ×ÁÏò†0!Ñ…y^;åºi\r…Gø=ì|a˜óàãT€êİfN½]@y:ˆMI„3!N¨™üEÑ|„‚A|ıõ7Æ9Ô68Î<uíÚ\r^¡ßÁeàH@›\"Z*5ÀÆC¢Ë)\0Úp=irr2©±õÔ–;è¦”ı–Æd±±lÜfˆ«®PğaãêTøäÌ%šÕ$\"\0ùÇ‰æo†‚­ëÛ˜eÍ·Ë‰XùÙètã§/V¸¹…)Ê!`sõHP›fSQ{É)éúç€\\o?Ú1“êaÈ/*~RïNfGD¹Îî`có¥E](.)ÁO?ıdm[ ıNMMQšcæş©ĞEQ;¢@ ÁåG8\nÀ$B¾ÜbJ.Ú±ĞYÃ›F8¡7öŞ{O<ÿüs˜2yRRE8i\"HH…(*œ\'ŒÂ-ç­KZ5~2*áVÎ‡0ÿÉ£äÏfRõ~7í°m@‹Âê	‡¹KÜ.ü%õ^D›\0ënC„#?—À8àÁ0>NJí¨¸hÁô=@|¯,¸Ùæ¥ı%ö–ÂUÙáQdˆbs \r¡õII±ueÛ[µ\ZoÇ\'Ä«\0`ÛD±)¢@\rØÚ‡ÿm—À¸äkDJ´\r±ÓˆJ¾Kƒ½Aƒàßÿş7æÏŸ‹OÇÃ	\'^½û oß¾•Ï7$§ô7¿zñOENªZ­Îùk­ÎëE|¼0)\n9ò]£ëò!‡2»M/Ôíš«ÚÈ¸cêvb£Ee:%c9G^øÛ)ëÕ)m—Ú‹õ<³G‚ÄŒ¸Ø¸²cå˜eÀÜTWoÙ!Šú@L§hÃ_ÿZÚˆS…†m	dø4\0Œ‰ñ\"Æ2âæµ¨\0P;¢@`£±WP\0èİ»·µ·<l‚ÑåÓårª\'ÂK.¹Ó¦ş¨áúë®ENv2QÒ<¤ógI¾Ùäô¹…ó¯ıK„2ù0§Z	’<ÎûÓàû8]ÕÓ»½vR;×dò<v	ÏqD¤ŠÃÈ…í£\\™Tb¨	¨‡ÁŒ¹Ñ/\"Ğ>rÔ¶ÀÑ·•+VèÀ¶Z€”gvèÓGé¶Gèwtø¿~D€zÀùZ‘R\0àJ\0+µ8lmßêdú™™™8íÔSñÉGŸà÷ßÇ½wßƒıÓwÒ>ŠæzJ9BÁß}öŞ)))M“æå»°¾²uØ¸ú/‰´õ:™¿+Ö‰˜„8<¢ËñÛÂôí°½ƒåQáRNÉ>-€&A^To€ÊNÛÈ¤8ïåÎÏ@(Ö[+ûg~ìnEÃAú0yòd”Wpÿm		ñèÔ¹³ÒlDµÿú\0ê%I\n©©©ÈÉáúê–çõÃ\\¦EB&™é8ì°CğÚë¯á·ßfáÙgÅ^ÂØù}{ ˜ÏQÉW\rÉ\nlÚ¹¹0z1º½g£…\0á:!x„Yø°bÑw¢Ù_k˜ÒÚ=§0ı8aşÜ¦S3%IÜ­¼X\"y½¶ûí,2í°Ë!ZŞ š2Ñõôr?R`ª/xäi­æy^9ĞöËIå°lïæVƒÊ,(şš$Û^hM„BA¼÷Ş{MSZü>÷†`MVJrµ…&€ÌŸ6R4\0LˆO¬œÊ¢vDK¦ˆ²¡’WMô²î6®ÏÊÊÂ˜=Çà¥—Æbê´ixûÍ7qÄa‡!--	§ìPuT=ğOâ\"yÖYgWw5¶ƒ“µP )X7¥ÅKõJK€i“ÄhÜn.õK¢Qš49‰^½¬\\XOZà·íPõİkÿPÿ\0R>—0ÿP\0.El’ÜšĞp«á°Ïgµ»|ÛGùİ@|7ã}“0‚‘üF4¶ª(\Z‡¿şşË–/³Î¶è^½—ĞR·›ô*²MÖÇÀ…VÇ©Òæ’ø)\0lm§-#*\0ÔJdªdşlHıĞóæH”ŒgÈĞ!xàşğÃäIjÌwÜqÇ#?/ŸZÉ\ré¶¿Æ\n-Z„±cÇâ¨£Byy¹6nş\r>ÙÙÜ¦)KŸô¬[:£e%fÑæ¸¥oB‚0z¢„»nİ‡¤şó„ùwq…áq!L\Z)!$õ\rN‡€\Z\0g(Œ Æ~Ã^Ûêp¥½ˆöæÈKƒ›Âb-†>ú~@\r‹šŠæØBñÍ;ï¼?şø#&~ÿ=.¿ì2ºJ%«9PZít¡_¿~HJLÔ©[ú0*ÉªE„(¢=¬°‘p\n€\0çÿÉ`Õ@3˜ç÷¿øüsœÁùèÜ¹œ¯vS7o;ì06çœs¾øâüğÃzÏ¤¥&‹Pp¤7ÆQŒá\n¬[ö+¾r6³nÃÃMæŸ¯¦Qæ_7´¤…ù\râzz~.vì–N½rÑYBÇîYÈê¬{$°V((Ô6üÍv`_THú*8.€=µÒ¶Á´»…1Åæ¦!.-Q§ôº¢h\ZØ—×®]‹ï¿›ØlmØëõH|M#5-\r#Gš€!C†àÎ;îÄ¤ï\'êÔDs@ €œÜ¤§¥#^h5™?iw´áÔ¨\0PØ ©±S:åŠ€aşyy\ZßHÈ¬°nı\ZüúëÌˆ).«…JÇTËo‚Ì7ÈâäP	~ş`\0ß~ÿ\nŠ6êp(ÏßxëMíÜ*ÑJ8æØ£%¢5ŠIû:\njP‡WW ùŠeE+Q´v6\\.‘í1ØFÀWSãv/Lß/L‹QTò(ÌÈ„¨[7»M„¸şO¥¾Ş0ÊMEª”;²Ã§7w”™€N=²Ñ½O¤ç&ÂCÔf4\"	NiS6§%½¯dbƒ!\nÀ%mÉØ°\"ìĞ!IHÄì˜°[Ú´!®ˆ übdŠªÎÊ`òÅæàtº1qâdl,âÚi\'4.åÆ\rr,\rŠíTJÜ!õñÂóÏá{îÄ;ô+}]è÷Ş\'­Ø4È«Ò@#ÃˆÃ×¡CeÍq‰sœ(X‹.¸*Ó´ÙtUã£ÇVÛƒk\\|¼ÒmÒp¥QÔŠÆ•òv6&jÿtO©uh³\Z”ÏçÃ›o½UÅìm0Nék¿Íš…[n¹cÆŒAIII%ïÕ«7\r¤ÇDH®ıõ×º§™bÇ!V\Z=i}ã$}¾`òäaÑœ¯¥ÿ•ËeaMÉª\njüqñ^8ªpP0 öZ»»İAˆı÷W“Î\rùpXçl$\ná4-C¦Ô	}$°¨ZÇrG„…ŒŒTtêÒ¹®(R\\ ÀÀ Å`y9t•¥ˆd—íLwXì‘.)6L\'Ì¶m;˜ËQl¢a¿k5aa°İqÀà’‹¹,y*>øà}9ß¿Òöhs M:ìĞÃLEj«5`=¾òÊ+æ¤‰ 0<x§„N\'(½V\ZÍQæ_/¢ÀfÀÄ¡$³©„İºwA\\\\óæ«>ûôSé±òi	ü1v¹†\r†;ï¼¿üòfÎäV½F«#.¹äb¸]Ü\\Åhı4¨«\Zª$C†Õã¦‚qV®ƒ¿pµ¤ËÓhFíÅçiÜ,Á‰vÂÚAf-5‰ì\0pP^Ò!\r\0ßsy\\HÎHF—^™ˆMqÀôéHQˆ\\ß„¿´B—ŒVjzí\0ÊÔ¥ÍÄ÷Ì×=Œ (š\n2\\nüóçŸbÑ¢ÅÍšû§&}ÖYg!!)QëÉ+ŠÆ¾ûî‡Şÿ\0¿ŠÒÂiÉÔ”¥Uu)¤£O>õ$}ìQufF%†Ï.Y²3fÌ°j\Zè\rµc§Nš®øø8Õş]B+£¨Q  ³]çæä\"-=İºÓ4¬\\¹R\ZüLëÌt\nìì ü\rü^{íµªÎ$¿GqöÙgoíHy¹ğÀƒhCd°ôW –öM„j¡eX8ë3é \Z:Øf É0F:!Õ™ÓˆÏ¶–¯ù5“%qA?vÍJGg—^ÁÈò±#ËÏ†êûò\'qx=Èíœ]R%Îá\\ÒV|‹Ød4–öRê,O~\Z„˜3Í<L{{ÉG[G_{õ5Ušƒdaî4<VzdU[¦[´ÿî]»á¡ÄßÏÁ=÷Üƒİ»›jÀï÷«bsÅW`ÀÀØ}İñğ£ÿÅ»ï¾‹\nIgsĞ1?_}¡$ŠöÏ%€œVh¤î²]\"*\0ld¦d¸j ŠF0ƒwÚQîÉ)«ÍuÕ‰Èy-	@Ï?ÿ‚5´KM8pÿıç©Õš³¢Ä=aÂ^ñxñ¡HÜóçÎÓ9³C:XŸ5Ôô(++“wåœ‘êØñÑ$}Ü?ní†¿€ò¥ğ€›Ò-¾¶ \"e©hÿjyÎ Ãı&Î³2lo`p8^5]9Áqnì’\"íK´—u/eh‚¢˜9Ûª¹UŞg›ãø	JMO@×îğºå¼¤\01åa’º”8ÚØ\Z+ƒ”…Ñöù+ù\Z”†€Ed4•FÍ=¶g3ûo\'>¢¨\r,0¶\r.\\Œi?ı,×HW¬¹ÿ\Z`YW*\Z›ÀÄµûn{ sÇNpi›cl¼Ãw¤.¤^x=%)	]t~ùŞ}ëmŒ3\Z	Üâ›õÊ¶//Ñè™íšò7$ºúê«qÍu×›ùÿÆÀ¦mh‡0xğ`¡Ñ.ıYHO£Ì¯E§¢¨Ûn$Ôo½0^N$KOLLÒå€¨œûj²ä„	ßaÍš5Ê¬ùzZZ:N8áó®>¨m~ÕJØÓ¤S›#íKÇÒMW+±dîW…6,MĞ Gw\'ÜÌÊ†íNe	Fr!Gê~ïìaşA˜Âğ;Ô\nÊ\nGâèÜ3ngb4\ZíkK$i±ƒ[²LHG(,Â&İ¯»`å˜×£h:¨õ¿óÎÛ¢p4–»nŠ/¿c;ÿûß—(+-µ®Ö*K‡z(>ÿô3ü0q.½ì2õyâöT’¯¬ŞfÔ3iirJ2z÷î£Ëÿ8ÿÏïsd\"ŠÍ#J©\0:” TiZ±¦gd  µ=‡cŞ‚´\r¬^½\ZßKçà<˜NËIC¾á†Ğ¹sgÖ§³Œ»ï¾[\r[‚5Úı¦UÆ×ï{ï¿¥K–¨Ğ`\Zú®õ~Ã š—üQ¢_±ğ8üë­ëõƒÒ6—ßğ7ŠÚ¡-…şDHù1&=xC\Z@HÇ]šWØgPÊŞd\rîwç<Õ“=\"„E“n†HØªà¿†Ù;áNŒGl—*œæZ[Mt;ÁªU«0áÛ	ëşu€#‘ãÆÃáGİöØÿ}ìQ,]¾A¶2Z½şé¯@~ûì°îºÃØ4=÷ìsØyÄİ¿ÄNRİ#\rí¡tZ6-MGh9ü¯4SîE™Ûæ-£€\ršŒ—Œ™!A$MµÈ&i=aı6\\¢÷ì³ÏÂç÷ÉëÊÂ•ésmÿ”)S4ìµ×^úmó|×^{-V¬X¡Œ„ }d æÿÉ\'«‘ \nÒ)ªu¬Fö1ÕR¥i„B+uE€°Ñ^Ù©ùµZ\"“ôÇÅÇÀåaZù±í,€hún)ÏI1èïBĞáÑ!p…s7\rdö>\'—nŠ-‚Xş>£×µÜ!\'bE\0Ï¶I0].ée?B²–raÓeIh·ˆ¢I`ÿÿèãQ\\\\lÊÓ¢#ÍGfÍú\r—^z™ú$9÷¼óğ×_i¯×ê²>Yu<ÖÎãÇW_ÇWã¿ÂÑG­FƒM†õæ“şhŸ•œ”Œø¸xÿoÔö„h)5UË´‘\r0P$YQ·¨®D¶ö#„Ÿ~šŠUÂĞ•ØQj–@GAÜŞ—{DvZç}şùçØyçñßGÃŒ_fâ·Ù¿áÃ>ÄaGSN9ë×¯—çŒx`A 	ÔüˆD/ŒÃrcéœ\"aĞ L˜ïÙ=Ü/yã½pzE‹uÒó\\‘`i©1ƒœ9C1è(mi×ŒTí}ôğ§>øà&ç¶˜ÇP78­ ‚Aîì\0‡d]÷Üá´DOõjk3àÖ¿®0bâ\\ˆœ!åP¡€EÁr‹¢ñ !ñºõëÔ¸ˆ™vÔ’ ÆïÂÚukñÊ«¯`Â÷ßI‹ã(–¡=u¨	\n*P#FŒÀK/½„qŸŒCRb’u§±`‡r\"1Ãÿ; 1>q1qˆñp‹qQXj)bSDK©à°zl\\,âÕÉD·nİ‘‘aV4Iº–w\n7âî{ïV½®.ckòæ/PíŸSW_s5vÛm7ì:j=î8|õõ×ºÖ×–ôi³°ÿ~ûaÔ®£”4ö[ğ\nÌıû+%$´ãYİœİËn8ôÖVÌÖKÊff§ñR£Rã–Èõmæ_Y®-·D\Z! oÌP„D@Sª\\‰–ûNsÁ6DT>G\0YƒúH9ERs ôBŠğ¥—^®4 n*HKè¦7-M„Uã¶ii„š–š†SN>E¯lYôM²fí\Z¾PI¿ìÖ­gú®Ó~š†¢¢¼ÒdäwÌGvN–(gñ•óÿt	¹/\0\0™lIDAT\\õ±(êCT\0h(YÆÇq AİvÙeÑ¸›n`Ãôúkoà×Y¿)ó®\rÔü9Äû·+“·¯ùäZd\'ƒ¦t}è¡‡ê4Â»ï¼‹[n½EW-4Ü#`õÂ‰ğ—-›yÆ¯L‹n~=ˆ¡(ÚÓê†íGÁhøANñ`‡Øh¹¬—Ö³—à„[´4O×H\ZĞwdWo;õÅ‘wĞ	oï\\ 1Î”“À*¶(\Z2[®}_µj5>ıtœÛ¸ñáŞëÅ¸që–ä·Ü|3ºwï¦š57ñQA@*ë”“OU­›í$d¿Ï­Vùç]p>¦ÿü³*8´u²…\0>SVV§Ÿ~ºY#LÂ°aC…Çê@Ò@ùnrŞ·D€F€Òe¢HšÉI‰ˆ‘ÎÑ³gOe‚Uƒ_»ƒ%¥¥8N´ø…š6+WÙYÆYT\\„K/»¯¾şš\ZØÕü\n;-^é¡kÂwğÆo`Ğ@NO¸1bØpì1z´é)MD˜Ëõ|«±àÏ	Ú¡´“hé— Ì¶\\×„E›SM°X8ÌMc©,9Û53^ŠIÊL8œu[%jJµéõTF@S!M¾‘7´?™©òI®@`zÌ3m\\ã‘¤xtÿ6ˆ´ü\"BuƒL™sô/¾ğ\"~öK«eé“4Œ‹Ê÷?IOOÃ5×^_~™‰W^~I7sJt.¸à\n\"¿@g?kW¯ÆXIÇèÑ{è§~øÊ+,…Eâ:õGuPd]°~*^Ôúéş76&V—j»„&U)<g3èŞö‚(Ån Ø!(\0ÄÆx\'Úbb<:vÌC~~!Lü«oæ«X”˜ñ.\\´»ï±yôQÌ;k×­Ãé 7‹ß`?<ıÌSÚ˜ƒajßæu¾Gß\0ûí»/¾şê+¼óö;:xˆv”à¯½æZ}®>ØšBmA¾ªÙZ»d\"Ê‹™\nc‰§Ñ×pñ¾^5ù‰¢:ÒÅ8¬ÍU{e¤ QÚ‰®ßwDû‘ ÏØ-.å‹„Ávoºì¼BÚm´mµA›Ÿ«Ù;õÔ$I²«Áê&¦iµdmƒ`»âTáÿû‚:õgš]€CŠÙ|¤%i^¡}G}&|ó5&ÿ0	÷Ü}:wêd=mÂ\Zaüã>şDGKy\n†0å‡É8ñÄ“Ğ¯Üÿ}Xµzyä¿•ŠNSÀ)ÙN;!7\'[	“’’t4’é%(t›1‡(êƒCˆ|Óka{ƒ”TiY©ÎÅ/\\´/Â—_~©ÌWï4J)Q¶AŠÇR\rtÛIÉ–ë ¹W€½í¦ñâe„jüaì\\Nsıõ7X+ä¾/ÎßdœôvÀcÒ¤Iz]™zä÷7ù®¤Ïéğ#¹ã>è3üD¸cbŸà•<…Ñ©4&¾ídşCâ\\82;	.øYİ[Á`\0Ë¿œ‚²9á”¶eì¶¾ü’„ÄöOG·ë‡ß-LÃZ,§HQ¼ZS@ˆ‚}ZÿW{Ÿ«¯¹?ş8UÎ«ú$…PşßRÏ!üï¿› ´Æ]­½²üµ¤4>éûZ]Öç8¬á…ê¨€\r\n¶o^§\"EaEW@	¸Lµ± m<å”“0F\'ÄvëŞ\ri©©ªôXOèÿ£uÛ¶>hO¶ÄÆKi“»r	\n›Kh`‡0Ì™KğÔ¢ŸÎ’¦9í0zÌ|ôá‡/‚Ç{î©iâóÚ!+ßä»Üyp=|ú),X0_¯5†\0Ø e¹S‡ù](X3¥KŸ˜åùõÂK››õäHØ\'3n¿ÁÆWA‹À!Âe‡¡ıá”6h#vÈLÜò;¸Â:„kÛ–Õ-¢h\0s`ò”uh½9LÏ~—ëê—-[†€ßvÆ6S]§æ³R]•õDã¿Y³f©¯”êàsîm£ıR…FË¤oMi‹\\v‹Ş}z‹\"n7N»„(\Z¨\0ĞHèj€ØX3ä§RçÀ¥M¶ Q¥T-UÃ’NÅo=\Zã>ıŸ}ööŞko‘€]p³S±÷™¾É74\\óØc©‘â•W\\åËWh´ÚaM(V˜	\n1ÿ×Oå !]Ùzäv´	U!¬ÌÕVh8ÌÏml÷ÊŒEŠÖ…´­Ö»Îì¤õí&İÖ%–Vsek…#1ˆ”a=àã&F¶®Ñ<UãŒQÔ)—ââ<ñÄ“ÒıY€Ò\'m)ª‘’j×ß|û5†Šã?ß|ı\rÊJJ%niÌŒRşØûù	Ò©‡~\'NÄùçŸÜÜ\\½N’CÍŸBm\Z\Z\nf‡Òıû#==]èp²Ğáx=ÜüÇ^¥Ô˜8·oD©w#ÁËe&Ôş(ŒØy„6ğ–…iÈ]ºtÁË/½ŒqŸ|‚]Gîªß!Œ¤…Ú‘äwİºuxø‘G°Û¨Q¸òª+±hÑ\"Ş•ĞtÊi¼¯ÓøP˜W(X÷+-øQ‡£RwuH=àª«_¸18Î‰DCé	~·! [R\"$‰\0 şÜÛ\03%#ñu‰ƒ+3IÊŠåÅ?#@1hQÊsvˆ¢v°*¹›èâÅ‹åÈ\ZšobÉÑ†(Yè\Zc-))ÆçŸŠÃ;£÷gŸ}+W­ÔçŒZ°© @úÄ¥ƒ>ø :3{ôÑGÕg\n…ƒæÌùÛ pBR;L„\ZüQãò?®Ìâ7š’çíQ °‡«h£+u÷©^İ{ C¥]¹¯Ä¿ùà\\ÿÀñù_àÈ£„‹óf–M\0;$Fi3`ÿÃ>b®¹öZ,àŠyNë–BØ_¹?¿\rŸo­|€_1e…K8—S$¥P0Œlg{f$\"&È6AÿœJÙz p“•ŠPló–†¶È”ÉwL‡GúÃÖÔ£-«aXºt)^ı\r’„&Ã¦mt4F{¡ÓO;M—ÔqP†›—ı6k6.¾˜Şÿ†ãŠ+¯Äìß~—J$¡Bb„;»9À-„¿ÿş{Œ?G~¸\Z$WÖ³P4ñòòĞ«WOu–ÆıY8å@:g?Š†#*\04”4Ùè(}r®Œ‚\0;—¡4¿!²‘¿)º‡F¿¯‚İÙ8ì÷äSOaè°¡ê&xÙòåjT‰ê¯µÜNüEËñ÷ÌOt”Z9¥¡Záƒíf£Ÿ0¼B÷ÊˆCŠ;V‡UI$·¶o{uçtÀ“Á­ƒy…ÉÖM”2şJó‰¶ÆƒÆuO>ù\n7 \Z¾K£Ûo¿={ôÀO<‰ßOÄî»íÆ›\ZHsV¯Y£÷öØctÈ!øì‹Ïuz >ÄŠ 1b¸W\\¡ËQ3Ñøô2\rÃ‡\rÅK”/¡»±±q–Qa´õ4Q ˆld*ãøK«YZ š%w¤fÒÈíP6¯ªÆ¥—^¬7lPPA@«(/Ç‹cÇbĞ;âòË®ÄÊ«ä²|—Ã»pI0UËwBÁ€t/;ş>¤zÚjI_}Ğ9BIÃŠß>Céúùğ„Œ‹`Gt‚V»¸10ŞRS¤|}	wsø¿…Gc\Z\nã@Zı\0øbÎì,×+-„õO!`Ë¥Ën%ü\"ç„µ¥ê”ï4®-n×ĞşîÄOÓ¦ã‡¦H»#ƒ&}0t ›Ò—\Z°èÀ‘G]v®•Cƒ=İû2âª½O¡£´¬ß|ó\r8òH8\0ÿ}ìq¬á  \nˆîHM9ê%ñªø+uüÔSÏÈÛ¤H\\9dèScAabèĞ¡ê}”¶X4À®²ü¢±hZ-DQ9\n@)”\0GúîĞ·Ùó\\”1(‰xÀzÌ\nb°»4—²œŞyX¾l©uµz‡·ÁiJ}Ì1B(¦aì‹/âş{ï«æ+ ±`î¸Å¬üöİër,N÷ İ1šåv‡™vÍI‡ËGÍˆDP°şm=§¶	ÊÊ|pÅ%!•WÈ%)rTmF´…`ÎÈŒ¦¿Ğ@X˜GÑ0”””à‘GßZN×p8ıÖ[n±æÑR4ú»ıöÿ¨-@•Ön`œ‚¸êª«Ğ¯_\\qùøó¯?«×¤T8×ş¿õÖ[æ¤èÛ¯’h•bl°Hmzh<¢@#ÁFf,ZéuÊ«3dşv9ÒzÈü4”(ÕfçäXÑ°+™öÜsÏêvœóæÏWA£æÜ›¾l]ãËì\0&}?o¾ş:z÷î-évi\Z÷3Fµ¯¦Âìè@ñº?1ï×Ïàù•ù;è»ÀJÊö\nW0ŒÑ±Èw”Áq$Æ)åÅ`Êlq0Ü76pÃ(i¿ŞüÎğ¹¹|•Š¶^¥‘yi–¿–0Ûn ıwìK/aÉ’%JH—šÚ£é5”\nEç®]U[\'ßìÙ¿ãùç_ú1£Šö¨Cdà\Z~‡´+V®DxòI6Lçû¿\Zÿ\rÂÜ.XşqóÖuu&ÍşÀ°yP™á«c„v%%ÑöŠsÿ‰ğx¢ÚsĞ°ÒbĞ®ÛåV!ÀèÚµòóò¬\'š6tB¿¯ºT_V^†ëo¸¡º$.ÏEö\'v]¯×ıöÛ¾ùŸ|ü1ï4X™³éÖ×]{]ØpP“ôİÂô9¤,ùùŠÖ	‰àprä—¶H~u\Z…\"ĞÛ@ßÔDî¹¤¬¶\"oµ`ÒÅdm,Fyi¹2\\GB\nüY™rƒÂIÓÚBsÁÏ|#H{Ô6¹u’ÒÎàÀ_ş‰÷ß{¯ò¼9ÈÉÉÅE]d³½xDûn(èà³O?ÃA„ÁC†àÑÇÃc>*ñÔL\'ã­>²PHo¹[‡Ôâ?99Eè.—ÿƒÖ¦Ò³íQ `£¤¥,—¡p#\n\n»îº«h×5¤åF€soåeeªåSªÖeQÚùD\rŞ­^ù}Î½‡ÃIC,;ìŒÿßÿ0îã0r—]*ŸSÃ@‰Œ¶ßÿîºû.öí4ï8Ÿ.t„Ü¨”bÊ7OªÕ»¯rÎöG%‘RÍÄHMí’—xîôÇz³æü)ØaK‚ßãÈ‘@E\0«Vˆ &ô–C»tïâÉï*õ«+¶ì/1môè.uÃãôèÔïI‹¬l—Q¢‹–PÛ./¯À=÷Ü\'¿TH_šVN*JßrË­HOÏ%şòë/˜=û7>¥çÓétkÜşõ®¼òJ¬\\E;%Ò`Uà9‰\\] àaRÁ=÷­ST¸„Şªƒ¡h;i2\ZÇ¢¨Î—Ù#\0º$%9ƒí¨ÇM5|†Ï>ÿL\Z¶uQ‹.8¿Zcçh×ƒÃ=Ÿ}ö9Ş|ã\rŒ1Üº[î&øÍ·ßàĞÃÅ~ûí‡Ï?ÿÜt~ë~cÙe¹©]éº…˜;õ}e6M%Fí\"„…è#Á	¿3ˆ!)^t¡9»¶¶\n¢„ƒ^¬[½Aµm­=©\"\Zrzã\0!ü[¥Æ¬zÊEp†ÆÆŞœi©íéË–Ÿ;w®–Yu4®üH?FÜÇwì&Ltè¡¢,LÄ¡‡¢¶NF‚mávİˆ8srrĞ«wo$ãOäÒ?ùõ¸¸x4Šæ *\04ì0\\‚b&\'qSŠd]`ß\rçóheûê«¯bÍºuB®i\ZeŞ¿ôÒË°ï¾ûêær;àØãÓ€ŞxãMì2b„î\nÈ÷	2x2şï¾ûNçã<ü]K÷Â´èÚ¥Î:ël}¶9p…D°lögX»t¶¤Óº±ÀXØ¥–vIO†\'Dí¿\nöü¿Z,~2wµÒ ¤&Êê•P²±\\Î©-‰P •ÄøhÌ‰œli4ÀÛ²ĞşÀ¶XT7Wp”Šçò¢°`u¬üï½÷Ş¦öÚ¶\ZW‹ÜSäö;ş£JÁOpĞÊ…vCo¼ş&>üğCuyN…§¡ı[i®ñ0+’l\ZX[Ø(¨pd•Fñ		Jÿâcã+ã¢éˆ\n\0Í;§(\0Ğ/\0w±³\Zª°i\ZömBƒ!._¶\\…\0û5vø$‰ûí·ŞÆôŸ§cÚ´ixiìK2tˆóG\"bòäÉ8üˆÃqÀâëo¾FE…ñ½M\'FtÎ1qâ$<ôàjXù‘&€Ì†Œ%èóaö¤W¨Ø W¥cÓ@—˜m‹ Ó7Œ? ¿qa?F¤% Ei`ÇIºşZ,srv	átbõêµ(ØPDŞj®ësü•’ŞØô„câ•Ùò‘ÖLaMh*ŠËµ\\8­jd@GQì»«V¯Æwİ…²²2ë*ëY~\ZYh6Ó<ş„ã°ë.#µì@DS¡½ÇøêËñB/Dmœì›•-¦­&òÑš¡ğStù;hĞ öWÇ?±qˆ¥‹Æ‹Q yˆ\n\0Í Ù8S’“–’Œ¼9èÛ§·4^³´©Ñ\0ß÷İw?æÍ›+„\\Ş—ï0®}ÍïØYYYFÛ—ëNBèĞ`Ò?(Óßwÿığåø¯à„>ĞQôßÿ\0=ô232àv{ğßGUû…JKâZBm AÒ ·Ãôyï\n¡¢p	ş˜òôoáúß¶2ŞrĞÒÁ&ää®~R>ÂdwLˆÁ d{­4Ë¤îĞZ`ºh éÆÏ¡ÿpĞƒU+6 `}¡$)È”Ê÷­À3Ñº¹xŠöá¬*ÄZŸz´eöI»•öÂ•å.)W–Ÿ–c‘ \0Ï=÷   @GğŒM€Ô9´úcCÀ¥Á©)I¸ë;¤Xm‡7LD<²®™vÂ#jŞçüß9øqÊdœwŞ9ˆ‹‹‘Gíy|3—_÷÷ítÖêc¤‡Óœìl¡­©ÈHKWEÈ#´ËNnm4ËQÔ¨\0Ğ 13m\0ÈL9\"°Ûn»5k½=ïŠ+ñÒé\n\n¤¡×Ş¹´ã‰´@ÆÏ%‚œã§¡_@„íÅÕà@¿~ıÔÏ\0Á¾×³{\\ıõ\"p4Q[èÀ.ø°rÎ×X1g¢hs1@hë»œm°.¤Ü¥<s¤îG¦¦\"N§×EˆÚAk-(¦¼EGD>ÑüW­ÃÆµ}DÒA2ĞTZ¿Oşsd¦ÀG¹Áº¶%sò,®Ğ4ª;`¹¶%¿ßÀ:|ûí·0mjõm~«£á¥F+ı+¯¾\nÙ9ÙrfŞ£İ§ï¼óNlØ`è\nÛõ„©¤¬ì,<pÿı˜<ùì³ï¾êøÌlòÃûŒ©åÀïqT•^Vããô˜´V>c¢‰ˆ\n\0-\06FÛ3 í€ËUúôéîëoØEãÀÎGIêÔŸpè!‡ã¯¿şâE\rÚğå×ç«À·ß|‹Ã?BÑI?@[ó=[\n¶Ãúõëpñ%£ÂçSMKÉ­\\?÷œÿÓ›ÆOaÀ,ÇŸ?¾òu5JH\Zû¶\rg(F4ÿxxÀğ¬xdºıŠëm=£$jRÔÖ*Ê}Xºx\r\nÖ•j#ò¬õ\\Ùä+‚.ë˜M >áXÜrß#tØ~^B«B˜Qù†\"I‰\0\"À¨»bşÙx»‡Ó§ÏĞuôRznBmhX]õêÕ—\\t±DÇé*ƒÒÒR\\~ùå¸í¶Û°ÓN;©Ó\n‘_4±;àr¹±CŸğÑ‡á½wßU×ÁûzK‚ñí8hG¤«»u#\0pÅi­\n\'\rËnõ *\0´Ø(íQ\0†¤ä$ì1z4\\l¬ÒP\Z›ğÒoê?ª÷¿Ã?·Jå<à©gœ={áÀRÆïó´CGvÕš mÀÇŸ|‚O?ı!İ Æ€‡yäaµ[0T·‰ÔWóB°bf~õ,\\¾pğ9ä PÂø¶æF»OĞ‰BwŠwIÿæsË¬¨³ë˜AÊ4DCŠ‹Ê±tá\n}Òtú‰µC’¯O8RõXËŒÁ@«ƒi‹k\n´eØ¦,•ı¥®Äo°u×­[;î¸S„ı€NšQš…c÷×†Õ«xÚ´Ÿô—±Ñ¿ûŞ{øõ·YZÿËW®À)§ŠÑcFãÇiSU‰a¨|Y¾C»#Ú?tĞA\" LÇ­·Ü¬ôÃhLzêªQ£vUÆOÛ*NCV:×ÜØ£ \\7¬ã(š[[âğšO4ì’²R›_´x‘îÏ/7¥ÅÖOÑjj[•çòË!z.ı¡U?}pÿöÛo(..–[ì|Î<kŞ±ß3?6ìø&Nšˆ3O?Ã,ïğrNN¶QøöÛˆ×kDPª§Y4J¾ã”2(-PW¥º6¬HT:3h×şâ—\"¢Í¡]²ê¨jMJòVkú-A–L9jiÓ³ß‚õ%X³j½ì„\0³Zø5iıÕ?ûºÍGØ†œO@?çŒ­‚yºf›lIğ32Œî©Hí—¯ÂËÒ$Ğ<³½‚|¶¤¤7İôo,Z¸H™¿©»¿ó—õ$°+Y±ù‚[»f\r^}íuüşûï¢XÑÁÓD¡(ä”íÌ–-[^xK—/ÓU\0ñ	‰f¸_â°Aåg×Q#qòÉ\'cÕªUïlI™I[ChH]Øiğ9r¤¨æäæª\rSåÚ+Œ¾é_ˆÂˆRQ´ØÈT)±Ò\0¥ÖÑ£GK§áÜ°õPÀ_Whh#Àg9lÆQŠƒEjœCc`C¸ô’K1lØP9Hzuø^%ş†BÒDÓ²°HéÒAWÎûùGÜaÑ2ù×È´·5Å#ÀNi1ÈwUÔèAÍ¨äF€%Ç){Î×W”ø±lÑ*¬_S¨Ìß(ju—mmíPx?—Ç²YÙRu$Ñû!øŠËEÃäH…SŠ\ZZùóm\"Ô‰4ôì3ÏâçŸ§ƒ¨@P¿Áœ<Pëmöá «T`4s2Pz\Z}çw0xğsÌ±XºdĞº¯l\"¬ùğ/¼ #<p?\n\n­›ÕAÁ¡S~G‰ëµ‰RºaÑÆÑjútfÆ%Š©\"\0èÒ¿øx1írËˆÚÛ:¢@‚LÕ^˜\"@ZZ*ºwï®†w¡@3—Ä™6¿ih\0´/ŠĞ¯o_¼+ş¿üi’¾jQI§JLHÀc=¦KmšÒiå+Ç\0cHŸ æÏxkç—œ{æ×Ì}†ö‚ª´rŠ£cœ;§ÅIV©mo|”—ûQ¸ºË®€Ÿt8d,ÉqéˆPİ¨-µZÓ1n„â½t ‚[üYR¨¤\\O¶ÕE£uàÃ>’ğ±¶/í/¶dÔXÈkä—Ü\r499I.Hÿ”äoii¦N¦ßTÔl Ö9ÿ¿şõ/İøı÷ß×QÎHp%ÔÆ¢¸õÖ[Œ²Ä×$\"`z\rˆÎ]ºˆ\"•¦#\0I‰IˆñÆ˜ûJG¢h	D€†í(…+\"±ò˜XÄZÃíõÁ––#C%tÙO-Á=j©z\'Á:f\'ãOHˆÇÅ_‚ñãÇcï½÷V	=·örÓ©¸wÀ5W]-GV<›¡:›¦™o)—ïi&,ÂŒ	ÏcÕ²BépËNøäkNI‰km§“sHœúC²¤yÿŒ$	AUÖAK§µª>ª9\rd4ü\ná—+–aíª©\"–$ËTnp	 9xDàöÄ&˜ú¡ñ§}L¡Nx(œ•y%/Ú†Z:?u#(ÌÂ¹NÚ‹æcË}·íAò®íÉ!ZÿÏºç>íÈìjgxì›ìvH!¡R§ò¯pÔïé§ŸÆS~-ş²£hÓ´¤—¯j}o¤#!şşë/œvÚi8òÈ#1cÆÓ´xö¹ç1{öŸòÍª~İÄÄÄb×‘»\"91iJK™·hÿ.¡šK¦»i¢nDm\0Z6ãâp,;0÷ÍæšÕÕkVcÅò•z¯U`níà|İ;ì Ägœq†4ÒaÇ1ÏÔFpy…ó}tÌm>M~6}®n0&-f.9W0€U‹ç#¯k¸â“åŠ[¾mbåµ£ş»[\"qı¼Ghàôx‰çGI›UZ:ú_åODŞ”%C8Âú5%Xµ¢¾rÜü¶Ö@\0E”:Q±”×8B,Ú\0WqIÕÅ-\0¶Q§Ó”ıûi\Zô»ŸŞ~h¼Éû²åËpÅW ¸¸´ªn‘Ç\rƒºÉßi§®qÒ¡×ÔŸ.üØcAZz\ZV¯^ÂÂ*\\ÖWØ¼e§€Ï.X°@•ÍŸ?_=Ÿ–ÓàôÓPVZ^#İ§8üŸ™‘©.€32Ò‘’œ—ÛşTşXAMBÓD´(êGÔ1PJ\n2RÓšœŒıöÙG§Z´¾¥± …®õ§Ç¿¯¿ş»ï±‡Zì²§¨F!Ï²CsŞ˜F…´3I‹‹S#*ù7¢³Š. Z¿U¾SÇ?Š²µr…ß2–óí´úgJS½AìšäÕóÚˆ\\Ë2+FÆ‚“Rô;Q\\àÃŠ%±am!¢5{¤dYŠ-ñI%î’Ø„x\rà||å(AkƒL¿°Ü?É©Mb}·y^»n®¾êZl”š¥Fš\0ÆÙ§woüçöÿ(ódY³İr(K”o¼ñ&õú­ôÿ³Îú:uì¨ïĞfIé…€­¼6ß|®¼¼/¿ü*†ßGu6Ğé”~\'24¤‘cÆŒ®\\NÍ¹.ıS7ÄÖ3D]éŠ¢qˆ\n\0­\06VYÑ@ç¯’’Tš6lX³jCà–Ş½{7¼ÿÁxä¡‡‘ššbnDvBé8´ü}ş…çÕa‡ô–-[Ñ›8rĞ·Ür‹\Zİ4ÒõUsH~Wó0ı³göË]yCèiıİV»2Sè—úô8‚Ø]´ÿ$áR´ög°ÓO4ù×–o^“r«…ÿš±bQ!J7ú…Iz…I»„ø™ïó³ÕSÒt„„ğ[“Ö•-\0I|¨\"ÿ†ùjË4í¥%å¸áúë±hÑb5Òk	pÃœ§Ÿ~¢ù×„]Îö‡ŒGı/fÎü~ğ!:è@¥]›û-ûwaÑFüüóOf¡  ÀÍÌ²²²‘œ’$´3)©ÉˆáÒ?R“ˆ¾²½6”FT\0h%pØßvÄÀµÇ»ëNV-\r§Hö”ÚùÍ3Î8S÷	ØsÌjèÃy3ÓuÌ+‡ö>úh\\pá…X³~V­YK/¿L\r{Ø¯¸æ·° \0óæÍk6¦š‹ ¸CDñªY˜=éÂf‚KÛ!¨ÏÖÆÛ\0„®u÷``\\\\\\</`©ØSM§FWXòJ`ŞKÊFÊD¾S¸¶Kæ­Fñ†R¸¤ì§#4Õ×}%.ú\'°Ãf¡\"äIĞ¢-*\08¢,(–’”LµÑ&Ğ*6OkÿŠ\n?naû?ÿTûœHÍ¹fh88ğ€ƒ±óˆÚïIìÃ˜L±K\Z0“Ftàx÷íw0Î\\<óäSØKèG4y_µpÇô$İö–çú,`h.èìgÌ£ukó9NHN‚—ëş9z!	¶MøÓ˜’ˆ¢nÔGA¢hl÷Àº\" E$YNddªÆİÒ`çËÏÏ×]»}ôQ$\'%WËìß@ €±cÇb§Á;aüø/•ÑÛ7n>úäceø“&MÂ0‘ÄŸ|ê©:\Zéµ:Ä,ñ†D{¹‚Xó×xÌò>üüsr¯jÕ>aj[–ñ4‰á\0HO&ìÔÍ¸€A™l³À÷%h4,\'jöAË+°hÎ*¬Z¾^˜CÀ\Z]Øô[$ˆ‘aSXñ×ònM~»=Ş<Ù²`º™?_a	‚Ì‡u}{A@ú$ıp—¿–Æ§ŸÃ”)\r‰—m¹ŠÙSi9ıôÓ•.üı÷ß¸é¦›tw@£l˜ÆVÛk<v5J‡ü322™ÉyÿD¸İF8ÉÃz*Š–DT\0h%PZ§äÌù+úàT\0q¥¦$7Rš¯ÜøÔSOÁÔiS±×Ş{™ÎbÄT}ğ‰æ½xñbuôQ8÷üó°qcÑ&;½ÒPèŸ]¨û	pJ€ilÖ@\r„DÛ¥vIæ¹xöûX8s<!\\¡]?õ\nëÉ6„Š2ì™‹L>øT¨\rdbŸ“äÔ§Dï—²ñ—U`ù’ÕXº`-B>)ÎÅ62Æ¦ƒZœ6BÍ·,­•6&ùÜ¸zÂÔ~å\nËÑÛ2h$üÈÿ«sğ´İa_ÓîÖB£aÑ;ógé\"‘]«¤¸?ş8şøãéA”=Oê]ûfäƒÒ“¼Ü¸öÚkÕêÒÄI¸èâ‹—×A’Hú`B£AÚ\náP@üŒ=Z§K“Døà/§0bcãLQÔøû›\nÆÕ“E#]ĞŠP&/\r”›»õ$p(^¸š+ğu:\Zzõ•Wt\r?§ôºşoÀu¾/½ò²ÎóÓ{ áû¦×Tû¾\\âæ13¦Ï4ú5rs¿yi¬‚0—™å%£çHzÁŠY\"$%\"9§3ÜÂ\0©ë´0[şÙéÜZà×»Äyp`f¼J”™~îhÊ$²dXTzyq3`RA_«V¬Óİûüå!]Ë¯ä¸>Âª÷í2’ãÈç7¡õ\'LŸ,+Exõry”ß7Ï7·nü.P¨kwêªmƒ_líïnmø}<õô3øàƒ÷¥™_Ów…åV–}sÁ\"\\¿~½hğáğÃ‡ÛKg\\ÆH™%ÏåÉŸùş :vÌ×%Ëdø‘ß¯<²r;tÀŞûìƒóÏ?sæÎ:ö‡^g{Õß†Ö›¶Oî-Àe…u—ScùŸ•™©ö	n\n\\.,Ïé+Vô•Ÿiîåv»ÕEÑ\n`gğH§ãp\Z‡µR““4Ğ]»v’ÌP²	U¢¡ á˜4é{|Ì¡{9ZF8›/X°\'Ÿ|\n.üçÅX½j-÷]‘—Ø½Í\\j\Zv áqp>šs}^½ÆùI«_·\0ä«ÂìhÀ¦:¯¤Ã%ZÏœÉ/`ÙŒñ:JæºuyÒø7om˜n/)= C˜¿¤*äà–µ!{WŞ[#}<İ|q™¡V’,n¿(w`íò2,š·E*àäfB\"±\ZUP“ïÕ>Äê‡å¸æ}Í‡êm4PNmõç¢E!Uß±¾LÒ`§{Û†ÏTæÿö[ïš>fÕ‘™¥§FMá¯öP\'\"ëŞ\n!z\0”²ıìóOqÛÿQDb‘‡Ã:b8şûØ£˜6u:şùÏbàÀ8çìÿCI\rt\r”™3ÉÊ¯ÙNš§L:}ğTWùTÕ[mif¨„vó<¯ó;ìĞ;ôíÔÔ$uIÎåŠ‰‰IğzbEöH»RQáÖ´ÎjéŠ¢YØ<eˆ¢Y ¶o{dÃ¦0ÀtÈCIÜnÂMkÊfdáª«¯ÂJúq·à«ğaìØ1j·İğÙgŸéĞnÛsÊn,ÿK§¦Æ7úK˜ûËç8Ëp@fëô)±Ù\Z ¹]ĞÄÈ4/:&¶ĞÒM;É‡µ©ñ¯Y¶ç¬ÂºµëUÔÌn­[ †ùÕŸ-•K7”ˆ@È½´Í‚ıõé§R7¼Aö·n´\0êZfL\'=ÿıïñÑGªb`3ä“N<	]t!¢e	ã§æMÃåúÀ©Ã•+Wâ¼óÎÓ}Ošƒ°.WÁ¨vKiBm·¿Ì§7Éç«ao[\ZÑ)€VFÍ!12ã²òr¸=n¬Y³+W¬°±Cc@m!„¢EXµz5;ôP,\\°\0gœy†zc§n|œ[Ô2©üPë	JÖ¯ú\rÎ ™vPcA·:¨ßòi\'}	9CèìãàIpû)¬TQjA›R¥úÁ§=.·0ş Ö¬,ÄšÅ¢iùõc4Ö¤FUã–Ï²É~i¢B+	ÖÿÌk£!Ò†n¥,¢_ê~T«ãUaØ\nåÑZğUğôÓÏâwßQFZ½ŒíĞxğõüü<¼õæ[ø}öl¡)Õ1~2ë	ß~‹C9é™zS†ÜlgÆŒ™j§DÁÄŞ Œ ­ºë®»”ágdf©p@Ïç¦L™bå¡‘ˆÈ\"—½‡nù›Y9ôŸ%J’hÿ\"¨±aD9U¢iÅE-¡¿%eĞ(ê%ÿ¢¢\"õ¼µpáB,Z¼óæÏÇ³Ï>ƒâ’Ğ)OSdÌÖ›ÂHÜ.œyÆªYpW/ö‡t°Èm›ÓLÂ:G8``üùçŸjÏ`†0›\0~a´n]Vg„·vè}úŒ<Zc…\'1íæ¾™n-T	æ÷:ÊqzÇLä‹JÊQ\n#\0ØİDÎ+çkm˜4\Z˜_3¼­6aüER\'6 XÁé{ŠƒÃ¾‘‹Êù¶,8ğàôQşÇl87¬–TU•7Ek’Ö1€İ>Á÷6düWU»~Ÿ?ò_|üÑÇªùkİ[íH\0Í³y¾áåmËÊÎÄG~ˆvÜ	…8îøãñı÷­ûUip±ï€ÿıïº*‰ßeÛ^-‚_aA¡îë¯×˜}‰œ|ÊÉÂôƒªvØèÔ©#n¿ıfhÿì&4ü;÷Üs.]»¢s§ÎÈëĞ‰I‰º¤Ùê$Ú+ÁÃˆÓ(š‡èÀ‚MH)US(--Õvì‰ñâÏ?şPi¸)tÖî°|—’|E7é0½¤E	·Äå‰ñà„Ç[o¼!Rz\n&LøÖ\"ìÔí•—´Kç¦VmHQe«ç¡¼¨év€ÓÅ|TşçRÁMfK,Ï°=~kLJ$˜¹GÎW2mU0å]ÚR˜uÊ&\'”ÈøVû°zEJ\nËèËÖûê‡‡zjE`ılQÈ7ş2¸V.EXUåEşßèzm$¤XãÇô+9FËHÿkío·6Ô¶Æ²ò\nüçöÛñÕWßHßh_×rµî›öÕ„¼J¹qÃ±·ßz#Fì¬qr¥Ñ1Gƒ_…9ÏˆÛĞˆÕ«×èöÂ‡q¸.ñ¥Ñ-÷ÙOÏH¯ì]ìóÌWÃ<\"R/+-SGA&|§Ïğ[‘¡á0ia~øáèÒ¥‹:şáÜ~‡<*¥ÓÈ8u)²yÍ„(ZQ`ÁnĞ\0È4uU€JâsæÎÁÆÂ|JŸiK°Óír9qô1Gã‰ÇŸ@Bb¼:ñHGıV„\0óLSÒ.ïX¯)ÓTÒã@ñº…Bx6\"³S8b„¹òj55ï–ı¨øá\n¢‚Ø?;	1á <!\ZEŠB¯•Ìš$Õ$Zÿ·ˆ8ÓH¢Æ]üåA¬_]Œ‹×£´Ø§£06=‹$lUk¼^Û­-„°¯ÁË!ÓºbS{z[,w­KÊ-nç.ğä&P>«ò—Ük°/y*))Å¿oş7&ŠFÎ¹xú©ºÏ ÿ7©Œ¹µwŒîó±ç^{\n“4}ƒÌ’Úó‘G¡t…Kıjâw¹F/{Fhàö:ëO.TˆÀrò©§à¿ş4IÔúPq71½UàûÜ!u/I7çü9}‘“ƒÌô`\"—2ë7›÷¹(êAëPÔ(j…ÛíVã\ZÒ Ì?>.‡rhµFßÖ@CÆ#„ <óÔSºO7Ù´K´˜«®¸Rİ—Rµ`§®-4œ89-DĞåÃº¹ßbÆ7Ï¾\"QÂioíUß\n èA7¸t~º~\Z\\Bs¼p…„èé(Ê¦\\ˆ9320L‡hu\"#øËÂX±¤\0‹ç­Å†Õ¥’)¾o«‰ÚÊŠa«@>Ë¥VœMª6ÜºÀá~5•¼ûÖJ][ßoŸŒß‚ÅÜ×®]‡K.¹S¦L•SÓ¿uT.‚ù7¤#?ñ9èà*ÚaEÉfD÷¹Ï?ÿ<¡½&èsà†nÀ¤Ifš@Z^·Ûß=ˆï¾ûNmìÑ\n;µ-ÑF½^\ZA\'%™ÕQ™™™J¹÷ÿ&Ì?ŠVET\0Ø‚`ãf#§1\r™å.‰èÜ¹3v9RŸÙjL ìéjGu^MƒBfºI\'ósÓ7áÊ«®”ç¹øƒ…|/24Ì7›#ã—¸~¬[2?~ÁÒµê%LºÊun6]Ñâ9Ğ?4É‹n^Ñâ-»†\nw@xx@Mú„$Ñ81è‘Ä˜).ç«(òcõJaüVbãú2uâÃ<0…•ÃüõÂ”U‹NÙ4:\rÃà2	eê·˜c–=·§öm(¶ÊÔÜkoB€1Š“Z—¾±dé\\tÑEºV¾\nR®–€S6ßLÚm”Zñ3:2JÆj‚d$N„„ç}§œr²›Ò¦°.rµßN8Ë–®0QÊï–WTàã?ªQ ôU+âæ´Q~—iïĞ¡ƒîFÈ}\nh€˜”@¯\"è›„V¡Æi-‹èÀ†Í8ÙØ9P!»2D\næĞ\\Y™hm\0ò§æâ‰\'\nyZ7²­ÕÍÿ&/\\V´÷^{iº§Ll:le0¤‰ÏÕ\"¡5ã‰¨:ÛB.^#\ZõïHÍÍC\\|¶¼ça€ª*ÙFË€.ˆ{zØ\';	qa®•æ·©Ùbg¬8N”ºsˆ£şú‹…ñ¯\\±…ëJQ^æcDú³¦ùÓ`~6¦ÖfCÊ^Ë×¯„»BˆôÖ¬§‡DOÁNµÍ	êˆeÁLG{€ñ­LŸ1×\\s5V­^SaVN5V›\\±|¹:ò¡á¯ğ2c¶ƒ\r®6ÚÿıÕ8pÆŒé’ös¯´¤3~™‰ã=Nû:…	NQp‘wŞy%r_ãÓ6kÓÀhrssqÔ‘G¨æÏc\néiéºó(ÓP­½5ÿ“QlQ`ƒ\rÜ$´	0†¤gdbÖ¬ß*-l«u†-óUÎ;ï\\<òÈÃÆ_Ó¬×7÷â%‹ñÉ¸qÖ;ívh„ÁS/wIÜ!_V.ú±¢%$fv•«ÑPD\0P‚Ú|¤8$?Ù.<˜|ÚuDp…G>È”¸ÿ†u%X³|Š\nŠuM?©~3rºõ!ùtºğm„{c‘äC/+3­İYr\0¸Ù‘\'=I»ôT%º=	\0v±ğÁG¸ë®»QX å(ù2™ˆÍ„%\0Pğó÷ß8áøŒÅ|ªõT9¤²±×Ş{ëJ„œ¢ôEÓ,aÑ¢Eº:iß}öÑôò:-ş¹Zà·ß`švÆA‚é8ö¸c+=şuÈí ÿ¥_sJ£µÛZ›\"*\0l°¡³SPâeg¨ğUÀãU7¼óæÎIœÃÜ[ì¬¢5\\qåå¸óö;„¸Ğ¿éşuuÏuÖëÒ#Z\nÛ0¹¾·ê‡¾%ÿqY^Ëñ‚åX·t¾Rdæõ–4ÑÜ®iqG‚ŞçvMOÀqÔBÉ¨ÁWå˜Ùp9ÜÂøCX»ºë$Tš=(¸Uf³]ƒkñCğë¯^­ÙÙR@Hã7Û{ã]H³.²0¹ŞºŸnAĞÒ¿O>ñŒn¶EG\\,·M€&\"R½ÀŠ+Ğ­[weÖö=\\]Ä%º\\Zg×ë’´fô»«á.7ûb?7Ìİ_~ù={ö@¿şı+ßéŞ½şúë/Ìúí7ëš¹Ş˜÷Ã5j7ì¼óÎÈHOÓå~¹4ü¥‡ÌŸé‹bË£eT¨(\Z\rÛ v\0œ£a ·À¹ëHtêœ/½†Ú¥G†‰ÿ<^®½î\Züû¦›D+tZD\",Úƒ?N›*Ú·m}Ã€Ç÷Ü{:5ŠÜ]°ù¢¡{›\'³*cáoïaú§ÃY²V¾-Ú#}¸ıjce46jú~a4½½aŒH§Ï ÆGf„ WşíŞ\rkŠ°láj,¿Eë‹òéöJ„h`Ê¦zhp7Äqq(OğSŞÒù ıà[WNN%©±˜M›/N:Ø\Zûİpı¿ğŞûïíÚ)9àVsaÑ\0\n¥\\£O-º’©‡ŒĞÛn»Mû™<MW¸¤oÚOÓ0ş«¯Ø!tåéÃBì…æ\\qå•¸ï¾ûTĞ{òÇiÈË.¿³fıj—¼N|òÉ\'†.ğ}+FÃ¢W:äbİG!!>iéÈLÏDjJª2şHÃ¿(¶,¢#\0[	ìÈløü¥&É¹¹òŠ2íl¸Y™\n°ºä&DÙîª-¦ƒëoo½õ\\}åUr.š°ôKev\0nıÏmj¨ÈáALÁ_ÿ¥nAùŒMœsl‡¦CÓ!€K‹Ö/ÿ¡¤`V,šƒ”œ®ˆKÊ„§Ò[Xä·ê\'X~—ÙaÌËB\Z…aùd<$E¥ÅaÑö‹°au!J6–Ã_a\\¶rE€¦CòF‚k>ÇërÚN‰ç¯\"°7nàs9¢N[Œû`¸¤è8ú•²¸D5…ÚÖáĞÍ³®ºêjÌ›7W™rõt73ò:iÄÿıßYºá×.»ìŒ9sæ`ù²åÖ@aa\nŞ{ïÍ!|¶N _¿ş8ëì³t‰]¿úê5ŞÓö-ñ\r2T5şÿ}ñ…ö[:*//Ãä)SÔ‡\0G#é`é’¥š¦÷e–­ş½8ùä“u¸?;+yyy:BA:iùßÚm-ŠM\0¶´3Z#;1Yéè“\Z÷¢…å9khŒÌ¥\ZZ®³Pø`GüÏnUËez¤±›Jş\"ÀSkˆ•ûGqdã“[ş`\0gÿßÿá¯¿şÖxlx=œqêièÔ±“æÙäÎm½æ<\'ËŠóÿaÑÄ‹±jŞ4Ñ ¼HÎî.É©*SƒšåU…¼Ÿ,Ç!ùÙè\ZãV(«@¡høkWmDÁú2”—ùV%_ˆ“Uö•±×È‹Ú—Ú©\0Àò£\0@{òu«á²<H6¹Ú\Z~ZŠ˜‚@Ê®=àJ«jî[âû§~(¬„„)¿†|P˜0çû©SPRxµ…†€}OTeœ<ğ€nÛ«W/œtÒÉ>|~ÿí7¬Y»VÚ.w­ëş¹œN¾ 4¥wO>{\"ºuí†şıûKŒUßæt‡û‡ˆ ğÉÇŸ¨2iÏZ‰oéÒ%øúëoğÕ×_é4¤æKÅâ¦\ZşcÆ`ÇwD0}ºú¥\r\0WA%Ä%èrbù€¢¡eEË!*\0le°Ñ³Ã²úEâp\\Pˆ/§æÍ›§:ÚCZQ\0àº\\úü¾ğŸV\n$$$tzÁ?/À\'ŸŒÃÏ¿€øÄÄˆÏ†…H|ÿÜöŸJaığÃÃ›o¾‰ÓN=U7ùàv¡s«-…j\"Hè°GËA’“F‚X³ôW—##§³ğ¯y†Ä7|¾ê\nu¤)çCs³ĞSâ(f¿~E!Ö¬Z‡²’2ıAy%d·ü§3Ôÿ5•šÿä•ê÷ÚÌ\n±âÜ2Ë\n´¬ìlµ&Xd\0XÖ	#:Áª,Ç›­üñF€‚,c0ÊÙüìóÏt#§Ê%s•ÒqóÁáşC9Ï<ı´n‹k3Geî½û€n¿»÷èÙÂüW¯Z…ùàØcUa–}±S§N˜3çoÜ{ï½ÈËÏÇÀà¶5m	ÌJ×.]uTıÛ§t\'ˆ?şü3™©}Y€f5\0zôè†ƒ>)©©ÈHÏĞtq@BB‚æE[}T\0Øòˆ\n\0[•\r^ú™v! ì„eå:œ˜‘‘©’~ĞÚŸ¿:šßY¸Ôi¸ç2ÿêP BÒC­à¼sÏ-çUÜzË-3z´~‘t‚\n×¯[·V‰É.ÃGà•—^Æe—^ŠLéàŒ—6Ü|ä§Ÿ~Òıš×Áù\rj%\\»NÃ½¢uK°|Ñ,$dæ#6%Cøµ\nazãÀ>‰ıÌI^åùÌp†J§®+AÉºb”—#P!D\\4wn‰«ÛâòYıÌ_ÕYë,;´WXIgb¼‰ğ•\'L*\0µn¾øM[\0ğî€¸.YzÎ9í­Î´=0\rfªnúôé¸âŠ+U8ÜĞGÁÓf‚L—Ì=öP/‰ÉIZ.f‚JÊI\\jğ©¡ïÿ3Ï8Sİø~øÁ8h zv7şüùğ Ñº_xáE|üáGjp7hĞ ¡+4\\5q±¿wé&BÀÎ;ãCy†Cÿ!JR!•y“Ÿ¦Ôó‘(LşØc—o‹æ/4¡Cn®nøCíŸ#¶‹_MO¾EóaQü(¶&Ø¸-&‡ù¸&–CytÔ¥sgì¹ç*Õ·ØÉïºëNüS´|vw«Ë£¬¬g}6^{í5v¤ P¯¼úªj;ìĞWŸ£ç0î,V³#Ç\'Äãí·ßÂh T£h6ªÇ¯B@ØğÆEøõ³Û1wê{’iØtÍvÁôŠşî¢S>äØ»L´£2¹BBGc”{Œ»züÛHéYf@ ÆØîŠK”s)–¨¶Í€Ÿ`É6–¨WE‚Ÿn+()-Åã?+¯¼\nÖÕšh™÷ï?\0/óçùæúL‚ô¯K.º³~¥ND¸5›\rQÃï‚óÏ?O/»ì2<óÌ3z½&vßm7Œ}ñÅM–6ú8à\0î§öOšÆy\Z<GÎûG±u­…­[ú¥@O{”i$CI™B\0—Íì°Ã-*!3.jÿ=ô.ºğ\"97Í€Ä¦¨¸güãL¼ñÆë:*Ág¸,:ß£´vÍ\Z¼.LÿY!(3D#:æÈ£Lj	Œ9!.o½õ¦h5»Ë7hğŞ,ak,¸+¡#àÇÒŸŞÁ¤nEÁÑĞÂTS‹	†Ğ¿<„1\"Ø$èè§ªÙ·FZÚ;h#Q‘’W—îğKØ¢¥SPªN‰8÷\\s2g«@Ú0ıé_xá…xóÍ·Á‘B§!8B`M/›ö™]w©t@Ï­?µµW¾“(ÊÃQG­C÷´`Ùq´à’‹/AîİÕØïŠ+®P{Ûq0î\r\"ĞÜÿà:©+¬¾k`ç©*\r\rÁĞ¡C±ãƒDˆIÒ¡2ºûå¨`”ù·D§\0ÚØ1lß\0Dyy¹vjÛ<®Bã:d$Â¢!ì½ïŞ¸ï»…`H<V‡_·~N;ãt5\"ñ8âğÃqÕU\\Àg¬w…pTø|8ıô30xğàªiƒú ïz=^ì³Ï>xıõ×uƒ”æ¢Š@Iš¬¥Fœ³¦“ É:¬˜÷|\"¬tÈÌÆ()ÊŞ\\›-i\'s£$s!=Û3”øóO~Ãñ±¢Éy.Ø CµÜ* V(#FÉúsæÆ!}Dk`F˜ÔV¬¶Óç}÷ßÿ€\ZÈ™¼G$H™~M4O\\bôÜÕsı†õØkÏ1\"|S+WM\rª;q5¿h?Ëe~Ük„ÊÄ{ï½§Îƒ¾Ÿø½ÒN1PX(*)Æi§ñãÇ›>¥ÀA ‡æ¬áùRoG‰Ì¬ËáñøÇyÿÚşÔ<bË!*\0´(Ñµ:9¿Gí; B\0çÚ)ddf˜¥Ò‰\ršØiÈ(EÊç²%î9zŒFÅµÄ§Ÿ~\ZÆÿïK},I$÷7ßzK5»ëë¯5R¡£L³\\dŠ˜Îyóç©7C>W3uÅÅÅ8ïüs1cæ.šœ~‘DC…p©Ï\0Ëj9ö¡x¥”×ü?Ğ+>é‰©ğğ›æŸõuù_ò£Ø¿8íÍ9h9Ó 4q;Ae;”?—”e8.^®‰àT\\(Áš6¶*ZH-\0»hµèåÏÃ\r²Fu×ké¬älAHÛ-ÿ‡É“ñ¯İˆ‰\'K?Z	”aPøc5û¼ M!`é²¥Ø{ï½”°ÈYâ´šŸöÓOxïİ÷Ğ£gOÄ‰  \"m¥^å®Û3ÍœçÿéçŸ0Wú\'1ù‡ÉX¶b9F\Z…ó/¸\04N«ŒÁú%LLŒ\rCRR\";îhävÈUæ¯–ÿYYHKMCB|‚µbuDöå(¶,¢@ƒ=\n@éœ#4Æ#sKˆWéY-ê•5±ÓX„›Dı‡Iù±Cß~jLôÍ·ßhÜ|äÒK/Ã‘‡^kç$A°¯EHùş»	xèá‡°ß~ûé´Á¯0\\Épò)§¨«`æ­JŸi:ª§‹ÇÕÿÜA/ÖWlÄ”%SQ¸±DJpÇ\nuS=ªŒCGpåP‹TB%-·ĞÔ¢n¨Yß.ÓJLÒ2	È¯åF¶…ÁÂ1dì×ß´ûb«Ã|„£â+–¯Àİwßƒ±/½„\r8×/÷ø¯2Ï‘	Š8ÖC6¦<ò™¦Sm³gÿ†¿çüıöİOú¾Wb•x…QÓzı†\r:UWZVŠ>={UÔV7œî£àk¯¾&ô¤B€™3gâwßÅ´©Ó,ƒ?|Ÿya|<İ|ø]Ò,\ZıÒn(U¹óÔ½ı%Æ\'ªÒPZ£=EÑ0D€6v\rVg# (‚uÂ³~ız¬ZµJ®6±Óhg&¸lÏ‰œŠ7ßx¿şú«]~ŸîE_xáÄÅÆêW\"ƒı?÷¸Ÿ6m\ZÎ=ï\\|şÅxìñÇEÚÏ©¦œV8îøã0~ü×rÏ’ş5	ör$ïPëi!¨ïYzõã’AN\rĞÅ­ßÀÂÂ˜1ï7$xã‘“	µ½°aîòŸ¢@ua	@\n¦¬Hm«—Pó`ÇÄrçÊÔı\0n®È’ßnEÏ‘.ãí·ßÆí·ß©Îvè—ƒeaîG¦¡ãjÉl™43\rüñ»\ZøtàAºÅ¯$FïõèŞ\r½{÷ÆÕW]…—_yE§ØÈx¹Ÿ~Í¾Ä<P_»v\r¦JŸÕ8$p*AŸÕ‘3‹öh°Ñ—5\nAåA­à{´WÚm·QÈÈHÓiËóu{«ßº™Ö(¶,6‰b«ƒ—Ã~Ô¦i=ËÎËN”’œŒƒ:yyùÒq÷@jÙ¶¦İ0°³1¸9QQîÃ’%KùQeÌdÒ7Şx#R’’ôiü‚ùJX×ŸzÚ©¢ñï‹ò²2|òÑGÈÉÊ6CHXÖ­[Ã8ßOœ¨iå>ä„yŒDÊX1½‡¼k®Û÷ì¯ÕÆ_xÇXô„K„©U¾•xfúË¸wÜ˜µ~|N¿jÓ&€Ó]¸rˆ7Š*H]y=ğvïo~w„tHš%ÌĞÂ( Tøi¯a]ka°í˜æãĞ9õ‰ßsÎ=O=õ4JJKt”ÊF»-D†H˜¦°âÛô™*;ùÕGøBd¨òÿrü—8KnE˜f_§bÀ‘™½öÜo½eví»âÊ+0dÈ¼8v¬®âai`§†yºúêkÔÿ¦ˆLC´ÔŸ¼JäåuÀ¾ûîƒ$¡Y¤W´; Ó®lâ”fm­ÔÅ¢h(s8Ãz\\\nD£š\\Ñ®ÓRèL#]wÔâ\\›C´$a«Ò?ĞCmØcİ8Ààpp.ß¥ó´n>|:ò¨Zc\\¶|.¹ôR}æİwŞÁˆ;cÜÇŸ¨OïHæOĞ¦€F„S&OE@ˆ,	#5C|©B†Ğ¯_|õÕ—øìÓqxü‰ÇEK`ZÌ}óLı0qm\Z¸g¿3è’Oˆn£ÇneUlì¡ ÎÅCãÇcß>…EåK•0sı¿ÑüåIÉKSC{Gmå©BQHÊõ×©œ=û C‹Š€”o#Ú^À‘¥`YECùN£Áü¸\\fôgÎœy¸îºëñ¯ıK„à%zMn›ïê¼CUÑ°	ìTÖ÷ŒÛ–ÛãÂ9çœ¡C‡Èy72Ô„ÄÅUœ\nüöÛopè¡‡bíšµÚ×´½	Sßu×]ñÁèR;ÎëŸsî92t(Ş–şÉå‘±’vŒ¦ÍOMXß¯ªo{¥$AÒ «jIÁg©¨œ|ÊIB“„$+ÊæŸ˜@æO£¿š#ÕC[Q ‚Ã¨ıs$€A}HG>B4k;tÌšÌ·)°;ãAŒ˜ØX^Ñ>OBÀÆ|èAµúúiÑ’JŠ±×^{áı÷ŞUË^£1UÌŸÄjêÔ©Ê\\é#“iç‹«¾ùú›äûgy&¾ùæäåv0ñµ@ê„ËƒRgSÖü„ÿ|rÆşğ\"VU¬·ùq±@ |l·ºqeå ¾÷@T$¤©øYïj2¤Şå>i…Y×i4ØE¸P»\'–-[†;ï¼gŸ}6¦ş(ªº=f{“ ¼åÛ›sŠ0Æ7^?üyæé­ó7ôK§OŸı÷ßOñåvjµ?\r:Ÿş…jŞ\nh\'tÒI\'aä¨]Õ[!†ûî¿o¼ù†–EK€i‰‰Å1Çƒd¡K¤Sú§Â¢Ãş4fa«åK3Š–‚C*±¥zY-»Z8ÜGIÎG8÷¿xñb•ô7lØ€ï¿ÿ^4è¯¤sSkµöh&8‡Hd‡z°jcï¾ÿnºé&,X¸@‰\riò>ûì­{…Óy™y$V¯Zƒåİ™¿ü\"gò|ŞŸ&šÊƒ>ˆO<ÉäQîÓn_I°œ¯ááÔSOQÇB!:êiph™¥Ëi0§DÎtfcÌ»c¿A£‘NÖQIÆ¶ß8¬Ìíƒİˆ))GÁ_¿À½±P\'ëv3@AÂëFÆ\rûÁÛ?Ş D*»ÙM^ôYí3¯¼ò*>xÿ}íWfE\r^•xOõ·%ë‘ı†sãÏ?ÿ¬îA&ÍøŸ!àòË/Wæ¬i¨gô 2=ºté¢ùtîÜYä1“^¾9gîög¹æ÷aéÃ»í±;v¹«\nñ!L<ÚŸ#@_\Z\rÓÃÑ:ºùİy—]Tó§ÓŸNùÕ‰nôãñ\Zå„ÑÖøVmQ \rƒUc®İİ¸q£ºÔ]±r–.]ŠEÅøøã0sæ/Òá­—Z\0œ^¸ü²ËñáGá×YŒ›®uÙ‡8äƒ…½ n>ynkÿ$8+V®ÄÑGé3¦¹åÈ—ãIÂ”X80|Ä<÷ì³èÓ»E@Qàÿv#äïÏ?ÿŒQ¢½˜ùøÖ†aAá`.!Œ94Œ\Z¸;Fõ\Z)Bh1B`C\Z0	Aešå(X1Ûö»“?3úä\n°qÉÎ!&,ÌE.j9Yš4oÕ;õƒo8cÜH½b4‡t‚\'(Ìj_5}ó³.ÈğV‰PúşïëPyi©ñ¥AÆi¦™$şˆäq„€hZ=Ê;’	ºñæ†Z\\!Ã2®¨¹şºëÀ=7l0v\nöÇ<>ıìS9ã‹u·«Jã&S¥Àµı}­İşx¿‹/ÂAÂ”çÎ™kåıŒyâ”mìïXı•h¡Á€¼Cÿ»ãßgß}’œ‚œÜtëÚUµz3¥\"Áøíí¾EÛBT\0hã`õ0PKàr@¬X±Bç,W¯[‹uëÖéæ;óç-´ŞhØO©ÕÛßU.ÄÂ)]ùè£Ò)\05vÇ¦@r°¿ÿñ‡²T#a:tıï•W^K/¹T76a\\u!(ßäDÏ?÷¼œ5ø·\\a7bâ1¢ûPìÙkwtŠï·EÌB$ƒ$¢u`{ìNd,¡Âõğ-œg9ı„…y»å×£LIXş¿9°TC2/Ú)#{!¢	#\0¶àÈÑ²×^}&LPW¾fn›ß­™Q³íZ‚Š\r»=7©•™Jlÿ½{÷Â“O>©¶2néSU_‘v.ıù«o¿Á?ÿùO,Z´H®Øi©B	4|²SçÎº´Orq$NÒLÃ?ÒˆO:S&O6å_#64¯fI‡¢¡\0?EàG}$RSSt‹ßº(óç\0W+P\0\"ì/W‰Q´%D€6VV‘ü#ÑàÎw¶°R4îU«W+ó}õµ7t™énM‡M\0mPûw¹8á¸ãñØ£V®ó·Á´qTâ(~ûãw½F\"dìßO<ñ†\r®ç6ñ¢fF\rH=ƒñŠü##Y_°AíhG ¤FßÙ¢\"N»6NJ8Eu% o~wÔ{?ôÌîƒXJÂ¢]EóµµÅHloİIõÎpRÎ€ÁÅ\"ˆ._.•É{Fã\rÃxµlâÜH;c(Òöî\'qHË¨W\0Fcº†ÕnÃ\"$ûğçŸãõ×^Ç´Ÿ¦¢¢œ´ªZ¶7¶:¾ÃP»ı7­ù®Ù?ñÄqçw\"c™\",màJƒ{ï½=ü0ÊÊËô›&-\rv,†Íé9ñÓÑ½kRgŸã§8Q ıèàƒÑÑ¸M\0Û#\0\0ºté(ÆIÂü“„áçèr¿Üœ|µAàĞ¿\n#Qñ°>¡?Š­‡¨\0ĞÆY=<¦O\0\ZåQ\0 1Ór!¶«EX²l…nÊÃi‚æÂ&‚D8ÄÈ]GâóqŸªÀÈ{ı¤yä‘ªÅ„øñ>é\r×ıõ³pÃõ×#+ÓöhŞ-)*Âc=¦Ó={ö4×åó÷äÓOãâ‹/6Tc‹Ll\n\ZÒ!¨›\n9Š¤§æâĞşû N$Ä%*a7CİUØ»ÛˆqÇ,eáóÃ½n\r‹— TQ¤®—A{èÛ.›êe‰@Œ™\'î„´CvÒr±ÂºS,ÆÆ2çHØ¤&áƒ>ÄâEKtÊŒ²ƒi¯&2Æ*H««E¸°ÛwSê‘¯fegâ®;ïÂqÇWéøÆn÷BlUh?ùÔS0Y´s.Aä-óM>Õ€ön1l;}|“ÛëûöÙ{/¹`Xí“P¡œƒìrª¿cÙ\04R\0 !òÉ§œ(?™fßÎıggçê@º®ö)O£@ÛDT\0h\'°«‰Z²m)\0\0şı÷ßº.¸¬¢\\z;·¾\"}œuwÀú›@))ÉxiìXìÀ•’ÿÿ6kö?è@õ“NWò]n\"DŸœ+ä;üç)çÏŸÿû¿ÿSmå³Ï>S6¡ Ú	Ìúí7=ç½|—£\\ùpß}÷áî»ïÆœ9é(ƒ–jh-¡Ü^©;ìFrl\"†w†]»ïŒiİDó¥\rh’î2HB/ú™N¨1;ÕámÌ(ËÀl\\ë(+Dùœyğn\\+íÏ/õÅòĞV õZ\"+¤¶2N)Ï±ü8\nT½ùÖw½ûë¯¿ğé¸Ït˜£–zßnÏ›0¾Öİ‡\rŠç{N‡şy­¶¯/X°\0»í1FGëh¼KØïÛ¿õõÇšmŞ~–#s/½4p\0fÌœ©«y\n7r:Fo+êïç›CX´ûD5Ş¥ñ!]“sôÓºB)-]…şšé‹¢m#ê	°ŒÌ“¿¶w-[(àÜ<;æŸşa:»Õk\'E\rã)++Å—_~©Fè%øeÆrÈ!X­Cõù™?İ¿óÎ;6|¸¤Qô7› H<ãÆS­„ÖÈÈûõëgîYøîûïñàÃUjj&İD×_Î?ï<Ñ>NÖ¬Ğs!GC6EÓò¹y˜xÃÎ Ê‚%X°n&Ïÿ3ÌÔ¼\'Ç¤ Á¯~¸^2—[óQUÛ6˜I«ÆÈàİ1ğdå¢ÂíE¨d£tîc˜yU½n\n*å1½3?°£0êUÂ‚N-¹\\X½j\r¾ùfî¸ãxßÂü©Îoh]_u\Z-	yŸwŞ¹xñ…×!·’	Ööun‡›/\Z3÷ßg¿%ìçÂ<ëz†}á£>–´8qá…¡°°@û_KSu±ëÒ¥³úà?FóÏFzZš®jHú£h[ˆ\0´3ØÕ”èÑ5°=@Û\0jASš†Ï>ıT—9i§ÜŒ&To°›È”9ÔHKj2õ#8\n6¨]îZF‚Üw¼R«—WI‚øÌ5×\\ƒ§zJ©AĞG\0×\nÛà°ûgœ¡ÛÛiÕ}ä[ô×ı,çLïŸ¢ùrê)øuÖ,½V‰Ö\Z°@×KËz<¨ŒŞHÆÉß ÜØ­û(ìØ§~ÑğTfİÖa¦N¸LĞ%5*\Z¡hÿÁÒu,]\0çšmGNº\\¬œrI9¬ÒO%eè‘çÍõ‚Â\"LŸ>]w­ûiÚ4”—Wå(UßÒdj\n[Š´\r6ß~ûµ®{·¡ÂŠu\\“1rs¡óÎ»\0c_~Ivu_üõ§{sLV»»¼Î8j>Û”ò PÏş|à`øˆáHJLBnn\n1¹99êê—ÂAäH^íQ !²º(Ğ€ŒŸFs¸¯pãFL™2_}ı•y¾9€j°†˜ñ“iS°à?Œ‘½K×®xù¥—°óˆÍ§\"`†ÀOE ¡³¾GÏk×_}%b«×¬F^½PÁ¹[‹¨S\0à(—:î5f´^‹ÄÅ—^‚\'|Ò:³Ğš€0rÊCü³UmÊ”†fòç	ÁŒè:ƒó¢{^OÄºcá¢6+…SÅ¤ø4c©Q`X*{µ38-mÊ†S?NÍ‹;@`Åø/‚ÛˆÈ[Uş9up‘Ì)€ãwCIq‰îŠGQ“&M6Ûa[m•?¦PÀ2q´Ãkä;·ßq»®tÑSéé›œ6›ó÷Ü}ÏİÕÒÆTqÚlô˜½0wî9kxºkæ±.0æ—…5öİg_ì²ËÎ:\r—%\ZÇü|İŞ—£)IÉ\rNSmQ Â®6\Z2U\n\0	°mJËÊğÕ7_‹ælê°“ÖÕQëorÏ¦Ö<¤m…Èq8ö¤OÔùş$!‘à¼=ı\0TN8ôê©§ªÕr·nİ¬«|6„G}W_}µ\Z*…ÔëÀ	\'œ „ô]F	z »ø’KğÔ“OËY!@’Îşs‹.ˆåÏãÂàÎ;bpÎ ÌîŒ¸l¹Mg,e¢íÊ;Î’Œ•„äJã0‚B{\0,µİbş*4Ià&MnÑÜËşúáÂõòT1a/Êå:”K!Vc~g\'~\n¯Ã´é?£¼¢BG\rjƒ-\0Øh>Ã«lïœbˆü†‰Ÿ!ªßMøCÆº\rpÑ…ª->óñGé~v_°Kgòä°ÿÀWácâ%*s¿¾t7‡Ù6¼<¤JÑòKt5¼×Ş{«u?­ü;æåë~\rä”£íç¿9éŠbë!jĞÎ¡Ãïn·ş²3²“Û6ÜŠ“Óˆ&wRû5ùµãğÈ7÷ÚsO¼øâX!Õ—ÒãÚ†õëÕ=hä7I4(\0Ğh(œ¿<ıôÓu‡N	¾G-ƒ®SÓR«¦\nÁ5ìò³Ï?ÇÏ?ı¬ç‘Ø\ZÄH¿)‰2Ÿİ\\Ï!š „%ë—aÚ¢Ÿğù__á×%³°®tÂR~I±)’r¬‘	”ãñå«5òÔ¾À|˜<¹åÌ?èÊÒNcs;Âé•¶ZV„Òp1æ”¯À%sñò†éxsıLYú\'¯\\¿›5ñ-)ZŠÃÔsÕÖ¬w·Û…#†ãá‡Æšµkté«\rö9®„øaò$tëŞÇ<&MšÄL¾úr<N<ñéFHV!QşïÔ©\\Ò¾AİäcóéßRm›CÿÜİo¿ı÷E|\\¬îôÉş˜ß!Oû1Iwìôl©tEÑ²ˆ\0´sØÕG\'AÅÅÅ:´ÈQ\0Npe\0™ñ\'Ÿ~†Y³~«|¶fg­¿	ˆUİ¯ùîA¨ÃğtBMË›¸Ep‘¤å‘‡Áa‡bÖ×ƒ/¾øBm\nl£(¦‡ïÜÿàC8_ââ×ùUóesV×ÀN;í¨††<pŸîçŞR.’7»\\lânÀc3Ò9qZµ“µëx1èÚ=2º WnwtËê‚W¼îX¸iÿÀz©Cûmë`y°D(˜ÒÂ\0‚¿hôë±`ıÌ[µóVş¿KÃçj‘1»<¤@Øé‚Èõ¶Íšm±qíºa`]»vÅ\r7\\¯L<V4}¶íÓÏ8ãÆ}ª#]ìæÓøM§ö{´ŒyÛmÔ®øô³ÏÔIi#„S„ß\n}ô1øR„¶¢1yn\ZVÒ6%İÃ†Óİı¸ˆ{Nş:é&?´ÅQÿ¬c;J;¯Q´+D€vÈê£Àé\02~µÍŸÁšµëğÅÿş‡_ù•´¨‘„RîE\n\0$R¯“ĞuíÖO?õ4~øáÜsÏ=Æ\"[¾ÁQ‚Ë.½×]wnjTŒ•C«‡~¸\nvº˜‘#Gbœ.ê{@ˆïD¦šóç\0´\0Şã0ìW_ÇÎÃ‡ëŞ7üë|ôÑ¸:V´<˜şê€\r^79 lÊIFõœ#t–ãŒAnLò’:¢[fOtÊÉFzJ*=‰ˆÁÀãğòm­\Zr9Ë±0S|‘¥Tı:?)5S·9hŒÖKÖ(µ¦ƒı¦=ĞÂß<’¼”Ã‡²@©†•ë¥-®Z‰ÅëçaIñR¬­XÈ‡€Ô©3w8Ÿ[˜¼LeßÜHBéXÓ[OÛ¬Ù×®7ÚŸpZêŸœ‡ôô-_;FÚŞĞï­·ß”ïH-ê§)\0ğWê[š=°\nĞ™–[ãºåæ›«S²Xµr%Fí¶;–.]¶Ù4×ÌccĞò`ô#GîŒÑcÆ¨ÿìœ,tÈí rå71ŞûÛ+‘*ICT\0h—ˆ\n\0ÛXdvÔ9Ğ’%úKû\0|şùçøí÷ÙjÄÇJ·	QäÆ7µ¡!M„\ZµûQ%òë\nÁŸ}öYB$øˆ>&Ï™;#v¡BƒxÑ’˜Ö#F˜xê ztÄ•G.¸àµGàóÌ#ç=öX\nL²$Ì³nMhêt”@òäòÁíp#;6I$äÄd!?\'Y™ÈHÉ@²3^§±Â\\ÜnÖ!ßÆÊ2£[‰G¯ZuarNaDn1˜5`—”0eyÅDÿl1œª§¦¥O´úÒ\n*‚>”SßPZˆåkVcuá:,-Y†Bÿzlm€_´~WÀŒ~¨PÅ1ôSÜP¦-‚LKÜè·ÂK‡>µ´A\Z%^yå•xî¹g­R3¨éPÇnkññqxó7°ßûIiT†Ó\0t¨Å½\nZrù^ƒ@ãVÉë{¸ÏôïƒÌ¬,ïï×y¹yº½/‡ı9:W³OÖÕG£hÛˆ\n\0Ûìjä¯í(ˆ^Ç8À‘\0\n%%%øôsNÌ2Ëê´õ9f!\ZÒDHhÍoÃ&(4ìâ1]•~ıõ×zlÇÆùşÛn»\rwÜy‡uÅàœ³ÎVF^¡‰Ä…^ˆgyFÓG£B@p~’ Óâ<ì¨†’&¯L‰¯=4{\Z:Ü.5†,åI—ºFËtÆã\' ñ\"Ä#Ñ¤ÄdõÆ–’˜„Ô¸T$Æ&Ããò¨3¦ùe}¸E``9(“±Š–%aBaè¡p\0ş _>Éı\'ÊQTQ‚¥ÅØX´Q„ËB	³/í~C¨E(/P\"ïPå•:ç^û™DW2w¦_Y—¦ÍµU@Û©´¡™3g¢oß4oµÁ/÷\r7şKX«¦°ØÎôPa·5jÍ\\;ÿÃä‰fëŞÈògîºë.Ü|Ë­Gsjÿ^kÀ!BÓ2tèõã‘˜”ˆ´´T€òóhñŸ‹Ô”T¸Ù–êè“[2½Q´¢À6»:9`öH\0ìÖmX¯Ú5…€Jƒ;‹ó¨64¤‰ÔN\0ä=uàÛoÇW˜eR6è÷ŸÎ…–G)fefá—é3‘^yS\ZiiiJ@#qî¹çâ…^Ğg^}õUû·Ÿ)ílôè=Ô+ZÕ{’Æv$\0p×AÕ˜%­´`ÊíræoH9Î‰²oŞ°‚2!³6›ÏztbX´ÙX¹íĞêlğQ£´Ê¢\rEğğ‡(4E”£#“·ÒÂ—hÉ ‘+Ñ=#äš[µWOõ´×jÇ Ôv¯íàŞ{ïÁÅıS’Ë|‘ÁÛm©*|é”ˆ‚¬¶«\ZµİÖìº;òÈÃ0öÅ±ğÆÄè¹B	ˆà~Øá‡cüW_óTŸ·ßiM8¥şhğÇ‘ºTégÉÉôñŸ¥#vrr’œŒ˜˜8y®n|K¤3Š–Gõ–\ZÅ6Ésnt`îÒEƒkø¹uç‘G‰)aÒnKB­Ä>2´\0„(¹$	ùÇYgY«0iâD¬^µJÓÀ@wÂ·ßş¤¥§iÚ8qÓM7éqm sßgŸ}pÈ¡‡\n®jÎ?ñ8~ùå‰W®é«ò…ÊÖÔ‡S±S´JúÍa>ÂNS,+…±Ó`Ğ­»ºƒx¢©å\\ø•Gãğ‰f_ò£¨¼HÂF”ËP&Aò«¡åş2Õæ•™‡œ\\\Z\\A‰SãuKÚä›,[-VÎ»%m4m”t\n¤ƒS¿Ú:Ô\n^o‹b§Ëµæ—L²¨Íÿ&Íá°Á–®¿×^s²¨ T>şø¼øÒX+N+È{œ[çn›9¹ÙÒ®íoÙ¡9ˆŒ§*g3>cÆì‰¸¸x¥9YÙ:ïOoiiér=A4ÿ*‹ÿ(¶D€mì¤vG%Aáú];æççë^Fz:âãâÔ³—:î‘çH°”hÙ‚@¥@Ğ<˜a`=ôM‡\r•rº€«¸ÔËşÜ»íSO>E™:ß#Óç¦Aô÷^Ècããqßı÷©6Å3nn{ë-·˜‡„¼š!Y–I;\"`,éRúÇê5İ©†wdúÜwÀº¦Oñ	a¾Rn:2`ãeNp¸4˜¡>WõËkU.„ƒ|GÊMƒ&¥\n¬ë]~•ş\\AóK¡€eÍõş0¥m—»øÃÌmsÛ€6+Løî[I¦•¹´nÍZ|õå—Êèuÿë}bĞÁÕu×_¯í—Üb#ÁsÚEÜüïã÷Ù³«•Û<—>üĞCò¾>]™fA#ˆË\n¡P\0»ŒÜûî»¿0~ùç +Ó0Îù§&§Âëå:~Ÿ!Šm\rÚÌ¢Ø6ABÄ‘\0Jõ:œ\'B\0-ò9¬·×^{bİw—\'É¨Í;-	4îï_á÷Ã\'A	¢EH¸)ÊŒ3ô¦366V\rúŒ–eŞ]¸hîàÎ¨IH9}ÁgÎ?ÿ<ôêİG®X„Xâºä’KŒ«Xedív…´LÅ°¬\"›‚†¼ùLUéóZÍwå.Q‹ƒqÚ¡ù ?‹ßÿüS™7NEİxãMxÿı÷M^#Ú%‡Èo¸îzü[˜»-ürj¤fÛ%Ö®]‡³Ï>[WD&•ïí¾ÛnÕeµ4ØG˜îİ¥ïï¹çHLLPMßXúç* Í`Ÿ¤á§Ö\\ËgmQ`‰vh¹K\rÜîÜÜ­StãIbÃ¹?c*ƒ®…X5B9¨	½ûÎ;3f4æÌ›§\Z)µô_|Q‡÷™F\Z-^tÑEfk`ke¯]}ÍÕ(*.2kG*W^q%ÜrŸdŠorÃ!î2(ŸïG›w$”aEü6v»ª+luDj¹-\0ÚJüğÃ¤J;Fö§½öÚ[™÷ï yfŸ‘Ü›2p9qõÕWá–[oÓ8¢fßb¿øé§Ÿ@?lœrá½` „©?NÅ˜Ñc0ş‚Ê¾Ğâoí¿ÿÊüIÈü9U˜—×ó;êh\0™¿Ö\'ó¦u[İGÑ>õ¸Ãîœ¶ @‚d[ò’ÉºÜ.äæt@œtø%K–êò9BI•Õ¯#;zÍ°9ÈSúÿŠå+ğî{ï¢_¿şº¦úÒK/CAa¡~§ÿ€xáùtC!“ ûìsÜu÷]šZœqú™šn|nğN;!-5Õœ¡¢± \riìHæßôEÑÚˆ¬ƒ*h®Û¡ ŸõÍaùÊå­r®Ì¹Ñí *mls‰‰Éê«‚çnú3vì‹øè£Ñ½GİÕ’ßĞ œ5r$RS“ñ5÷ã6L–ÉĞ¤Xœ¶™>cú\rèÎ»àÎ»îÂyœ5k×VKCUhä{R.<ìĞÃ0xÈ`ÄÅÇ«7÷ÑBQ¸å/óWÕ×Ì·M™67\rQ´5DWlã`õÚU\nrm|y¥Ÿ\0® \02N2MÎµ,\ZtYytÊœÎ7×…Í5ŸHâËg©YĞhïÓOÇé5\Z}üñÇ¢õìÁ‡õZAÁŒ\Zµæ/˜§çCÆ÷¾«Ô¦jG¸Êà‰\'Ğó`=ib„#¤Ì!]S³İqM=ı_Dú˜h,È)€Î›;ÇŒDI¼\\V;bØPí7l“/¿ô2<êHë*ĞÎ…«Sè¯B72²Pé&€Ë%¥OS\0àˆ€íYĞtÀ–mÃII	8âˆÃÑC„:ÍÊÍÉÍ?[ó—+@²”Ëù¬)4Õ<bÛ@tŒt‡j%VçeÇ¦+RûqÈR?§èê“×úôéƒã?N}øëºĞ¡–ìöL	!~P„âøãÇî»ï&Z“ù–èX¸ÿşÕFÀ^¸ÌŠ¶|£¦¸ÁûdşÜ^˜>¶hTéñp3Ï»iÊ¢h-Øí‚‹\Z8½ìMøö[Lö#fÌœ¡aúôŸÕÁÎ9çüŸjº::Ñ\Z†°n¹=oŞ¼Ê\Zæ6¸ÜÒš¶4ÜÃ‚¬j…î}1vìXa¾Iš^öA“vóÓ²jÕjL›6g„$ë2Â–ëyü&ûøñÒ·{õê¥iaûíØ1_·õÍÀfşLsãÊ\'ŠöŒèÀv€È*æ1G*|ÊŒ9@gA\r FSTZ¢KóŞ{ï=¬’{JˆZp ò—{¡S;ºşºëœ’¢ÒèìßÇ.#GªáŸJ ‚íˆ‰\'ªkVÆ™\Z2\ZRÑÉÏ3¦WéšŞØZC†Æï¿eË–ã7ŞÀÿ¾üsæü­û¼×\nÑN+Qcxµ ²¼¤7i{d¢]ÙB\'OÿøÇ?Ğ³§0µÄYû|7¢ŒåÛÛŸş…óÎ;OíO›´Ãú`Ï<ó4N>éD‰ši\nã·ŞVÁ£oß¾:µ¶9|öÅç8ıŒ3PXP`ùßxëĞ¿\Z’®ú!ï[}‡èÔ±8ò…Ñgffè¶¾´âò`zŞäÈ\\Õ°ÿ¦ˆ\nÛ&¢Àv„HÂG! (ó\\%ßŞ7€BÀ!R…ñ‘hêsş«\Z„í¬&!Ø\\ó©pD¾Ã¸{öìx\0{ƒ:ß}÷½¹I¥ò3°ÿ\0]M\rE/GÄIà±\'ÇUW]­¶6Z^\0 ÖÒ-P9¯;dğëªñ¿pá\"õ^8vìKz]ÉømD€ºQoy…¥ìã1fÏ18ïÜs1bÄÎj©îŠlÖoMØ1°]ŸxÒIøæ›	Ú7×v	mk’®œù<şøcZßü¢Í_#Û¢¯ñ˜¿‘âÈ7¾ÅqÇ§¶/Dä»\Z«%ì4$]› ¢ìt‰¢ô.ï¤€²ÿşû#==MË+=#y9¹ê13·C.âãâ•ñ3°/F±}!*\0lGˆ¬j“HuÌ‘\0\nü]+BÀú\rÔ·ÿW_}Ÿ~úY\0¢:ÑÚ<±ªù<Qó>CâCjÖ¯¿ò‚uÃ\0ƒÔ€Ú€E‹a·=v×ÑŠjÊbpÓï6.·C]sõÕ’†M‰%Ë‰¶• QfV•8×x>*lŠJ&V³¼¤.¥€É“\'©Æ­mF[‡u_PÅm˜+FÓ–ö.q¬Y½{Œ­[CHŸ¶5IWÏ=0sæ5š¥înÛÅD¶ÅBaìô[±ÓN;éèïÙ9áoQq1.½ìR¼òòË|¼Ú»•x¬MQYv#cçÆÁO¼NœÉÌÈÒ]ıò;tĞsNØ¾ı£Ø>¥BÛHpl¢Ã_2]\Z1Q«¥!ç9,È9Îœ¬,¤&§àƒÑ%CÜD…D³!„³>ØéˆL…º\'–zNp‡8jZRˆÈç™^ç\"N_l	:T—+š4Š†g.+x\\VVj­t2Ğ> ÆëU¢[ÁJ>9úb44£)6·<Û$È4Ô7–Y/oÊŒÖçÃ†\rÓùõÚ0û÷Ù˜;w®K©	S5ÁğcÒäÉÊ\\ùn^^>.½ôr¬_·^Ê–ÏZ¢€|‡»Û=üÀCºt´1`[ºt¹ñ=SóL3ÁvøÎ;ïèF:ÜÛâ”SNÁ\'Ÿ|¢÷˜\0îKñá\'aø°xí•×Ìõ:Ñ¼¶ ­N:·éŞO4ÿ”Ôdd¤¥!/7WwíÌÏÏCZzzå~şªõó“ÍûlíÑ€í5«œ„˜Ki-Í)\0{4À(¯ğ«—=q’‹øm®ùØÏ55ã¢cY‚Ã˜S¦LÑyJ|–›ÿì»ï¾ò S§3,¥Ì …G\0($}ÿıôí×WóÄØù¿bşÅ—je]™\ra€Lç;ÄäISP*å;ó—™˜şÓÏøyúLx~•r_ÍB¼1åÕ¦Q©‘J~ªUŒÛ™Ğpaø£v…=ÇŒÆğÃUHúäÓqÌ1ÇYOŒƒÿB¸ä’‹qï=÷È10oQQ1‚EJùqº\nÊÜ„Ï>ı)if©(Á7¨½ï½Ï¾ø~âDs±h}H^8¬şÖ[oãàƒ–kŒÃÜçÛ—_q9¾ûî;e¼|uÎ¶úúë¯#Ÿ¾*®¼R‡ÿù]\n.İ¹ÑŠ»&˜ÏZÊk³42¾¤Ä$qäáèÒ¥“¤!ÜÏ?/·ƒÎõçvÈ×5ÿ‰ññÕ†ûír´¢Ø~Ğ818Šm$‘Á	 U3\r…h`Å×!Yrƒİ»Šfs’.ryÈš¹ElFo 1lh¨	ú•g¨ğÔ€ÑøÌ_iy®¼ú*Ñ®Dx\r Q¦A“K‡çåYr‚\0G?®»îZìß_7»ÑA`ùé%¿dÓÍÒÒ\"M¡Ñ|Í·]NvècÅ8äºûn»ã²K/Å+/½ˆ™3¦cùò¥¢©í#O\n×!É±Èõ7Hıp>yÓòi}˜ôÔjC}÷\"Àvwî¹çà_~ÿû&Œ=Zç£¹ŸÃ~û€ÑrÎreY³8\\rÂ²ïíwôKÙèŠ			I8îØã¥Œ½RVF«eİÿ:kn¾åf3’â¾|šm¸öÚ«MıéúöÍ@¾Å¦D&/-Õº±Ú}İuzJ¿)×è™¡DÚçQÇ‹aÃ†«Í×ş±‰sÙ«NÿH Ê&¡	Ì_û|¼s§.8íôÓĞE~SS‘›•‹üÜr½+:æwFfzÆ&Ì_ÁO6ş³Ql¨Ñ¢ØadRÒÓÓu‰`ÇNU‚\0µ5îÔwâ‰\' wŸŞ›‘VÓÆÑˆÏ>ÿ\\G)lp@º$\\d¶ï½÷>{î9\Z4ÈòcŞ|ì¼ó.¸äâ‹Í‰q2—Úö\' 1`M:\Z1x§Á•l#²Ôø,·ïíÓ»w¥ó\Z…ô¹~ï=÷ªÛY®pàZq\nõùBØò0¹²Û\rÌè*WİÈÆÄ˜²¨E°#È´ÒE­\r\\íÁİ#g$Ø¸³åøñã­+&njç´Ğ´a‚xååWğÇè÷\"±ç{!/?ß:«•Æ÷­hñ&SW]ºtÑsŞ«\r>uam´\"Ø&vÙe$N8áxdge###]5~öaN‰ĞàsşqqÜÑ/Jò£¨B´5D¡ #q 1áğ%	¹MDòòóô75-U­ˆ;äPì/L)>bH¾µ@Ë!ŞSN=G}4fÏş‹/Åm·ıÇ,§I	°3F5²N8?Lü/ñ4h c1‘5Œ—Äô™§ŸVÇ)Ô²øÉÙ³gãÉ\'¬-iäÅ4E2õ\n·Û(ë¬:øŸ¯9çÍë‡z(.øçø×ÿÂG|ˆ¹ÏÁŒé?á“O>ÆÿûŞÉzzó`Òß;dLŒW´P³Y\róg‡úÀûÉIÉ*Ò]3µuZÅÿç?·áÕW_Á§ãÆá‡Iñë/3ğÛ¬ßğëÌ_ğõW_áæ›ş­Şå8\"W÷‰Ï4Ø[>Û°S!)ÂàwÂÑG¥ç|OËJ/nºÃuõftÇzC~vèÛWÓÉà¨M—èó5ŸÇíÂ‘‡®BÂæÀdÓvé’åX±|¥~•eBA‡óştøc§12Njûà¨…¹h9P(<âˆ#THL’:¢ğn÷[\nï´í¡æeşQlŠh‹ˆbP“¦@Ç):¢¶ÓQ4¦ÑÚ8ÏHÂwÂ‰\'\"·C¶PC3×½>Ò,\0ÓÇ?­š=ìPXw”+s£–mÑL·ÂGqÎ:ë,aÜd	<ótçw¢Gî‡Ù¿¸´\\pÄ/Ä=\"¿|VG\0jµÙşıû[gÕ¡ÏÊ{$Ô•snËzÙ¥—©ğ ¹“_2q\n\nœ+?çÿÎVon\r°$uV3aÂ|÷İ|óí·øVÂ#<Òàúb{xüñÇ1í§i˜9s¦ÖÃºôò*sÌQØcôè³C_e:Üm’íeè°¡¸îºëä[ßèG„AJ9rI%÷·É8	æ÷úë¯W†V\r’æÏ¿üÖmØ`]0`½ŸsÎ9rNG„ñá‡ª…~äx¼Ûî£àro~\r¿‚Âõ˜7®¾ËEáí ƒª>zS‰M¯…$=ÍÖ™şr:Ë\nûõëkFîDhç5úóïÜ©“\ntğå¡{DEMD[E• £Q¦$ÿ¨-Ä‰Ö`k\\Ğ¹SgHd(P(8áøã±ãƒ„`KSÒ‰qİæ¹Ú@í›ó»‹ŠğçƒÎ÷Ìœ©0¹·Ûn£1p µ}>,AòPZVŠ\'|\\®8¿NÓ€Ê<nÔ0<òœvê)\Z5Oúxø‘‡ñ£0Â´ŒŒJFÀ_¢¢¬\\ÒbŸpW7\Z¶±£ÕÖÙ¸	SZjš–7ÓE>xÔQGbäÅ)\Z¬½ÔMïÉ/­Ê›Í›/kò¦üü\\Ğ;í´#†Ù	ÃGCß¾}”	kùÕ`¾U—Ec\rÁ]fz¦÷s^mìgø?äR¥Ğ\"Q2Í]»vÃSO=­ågR_RSSä·\n,s‡¤…èŞ½»\n[¯Huë/­÷?x“tpÀş\"z6ÉÓò•+0ÑBµEŒ,­½z×“÷H³ı0}hXn¬%Ë–ŠPô“ÜsI1i®%RË\Zä	ipü¦	õ×ÓfaÕ5Ë¼|è°!8åÔ“µnã‘-‚:ı:æåkµ™¿WyÖWQÔ†hËˆ¢ná¢&Fí‚Ä„šºBÃ‘”¤$¤¥§âÀÀ!‡Š8at­:èõ9ÿ÷ğØÚœ¤›é=asşa¡!D>†quU­·jØ4Œ_ı>ô€2´´Ô\ZI	£D“r¿P\0ˆzåpqMPÈâ3fY_yÅæ\Zq‘é0øÊ+*—Ãm’—ÈÕv”´§ #kX–K–.­‘_Éqe¹ÒÓŸÏWy#¿7r—]Ğ¿o?=7àİP5€eşûï¿[g%Î=÷\\İõ±ZQÈ³¯¾şš‰<Ôzi<hØ|UŞ¸ºeöo¿YgÖ]I\'çÅ$\0T\"„ñãÿ‡‚¸ÿ¡1lø0|øÑG\"XuZ#=5A! i‚€hh(É\r¯öÙ{¤ÒæBÚN~‡<E¢[_ùsäíˆ}—S=*øl&mQlŸˆ\n\0Qlc;Ææ28Lú\nè$„¦³n&Bæ•(÷€3ÿñÕ>ZLOí”ìœsÏQÏ…d\Züóùü¸ÿ¾”ĞÛùh(¨å>üğÃ¢ñ¦YW„‰s¿ğÂ°± P™3—SE‚ß fZC†©&\0p=@¿!‹¨Ë5ÚUpßu:™9ìğÃD;7»ËÕ„·ß~Ÿ@„Ad½oØÆq„ZÁËŸ_˜udºêƒD¡—jb™hÀ´Ë8p¶	îŒÇ\r™(0õ6så¨ÀÈ‘#õXoøm:¨±Aíš>´ùÅ—©ÉŞzë­:Äo·I\n.3gÌ!Èl‰³Ï:ËDÓA¦&\"´°˜íxk51û·Ùê«à†ş…\r\nÌ¨…äEŸç_-ï4\n~P_ÿ8ëèÕ»·hı	ê>;?/O?Gè¸ÆŸåÅÍtµAQlQ ŠÍ‚DÚ­ˆi¹M-ƒó½ò;äëê\0Î?’øĞ	Êî£v×¡mRq[siYÔŒ/Œ:PwÔ3ùŞSO?mi}$Vh`2Î8ı4°ß¾ú8ßözcD3¿J^rb’j¯1ëĞ¹hš‘€¶#w)zcÕ‡¹iQAAje8š@&Éå‹ÿ¾ñ&sÃBdùÙéáÚs;›Uß«ÄÆÄ™g-ğ\r\nH&^;Ô~?„…HŞ¬K\n:9¾´öAàn’k×®Á³Ï>+šül¹gâäòMQS,.­Œñ˜•|nÎœ9j›@¡M§\'ø¦ü£‘[¿şUB“]^áÃÿ¾øÂœD`÷=F[u#Ïò–çde[Âù÷r0QZj¨•·()­ÀÒÅËÔ™“³²¬°	\"/F~¹aĞ%ŠÂüÙ÷öŞgosÌÑÆÊ_úšnHÔ©“Î÷çI_Ì–¾GÍŸÂIû3ÿjÛ¢@\r™	0ßhyLfO!€tÌï„¬ŒL¤&\'#I´Ñ{ì“N<^„al\"4Å¯nQå³E\\©zê)xò‰\'/ÊŠ+…I«»Ã99Yj&`Mˆ ƒÌKmÆuwÜu§yEÒ­sÒò¼ÇíFt$^{õu,Z°»í:ª\Zqeà²/=–xÈ˜hˆ8`à@¹Æ«¼ÆôéÓ•YF‚E\\l,=æôèŞ]ß%èÉÛÙ*ğWÂ¯¿ÎD&ImXo×\r¹ïõxM>¬‡™\Z{ÁÌå×‰\\—²¦,g¶f|N˜ª‚$!j§ ?¬ÚÿêÕksPägçÏ_`>l!&&VG–x‰Ë…#/Ì³ı%æš‚çİwß·Úä\n/}Q¿W	‰ƒL†q|ÓÎ3w·ÜuäÈÊoÙ»š“O\r´¼+ËÙÓL»\nWÖÌ{6Ì÷í¨¥X¡AwƒÁ€”qÎ<ãŒ\Zµ«ô»Dé_	*p®¿K§Î*ĞWG|Bœ\nUìoÕÚ´ü±~Tø‰¼¢Ø~\0¢h\"	5úÈHÏĞ¡GÎ?r–6\\sÌ{\\’uöÙgëÎy\\Bg#2úÂæÀG?şX<şè£Êñ\Z´£ºaåvÃ4\Zlìor®üé§TÛ†Z]Å’ó¹¸ÿoïÜ£ìªê;¾\'ó~Ïçd2¡ĞæEå´B(/y¸ *H$¸€¬®şá<D]¶(«Z•\n­\"ê*¸DhºŠAm+°\ná!DH\"$B2“çä1™;“ş>¿s÷373“ É$çû™ìœsÏcŸÇ=÷|{ïßşí*7‚Š)w\Z‚¯&—ËyŸt†—MCÓú¥Û¾äŸcÕüÏñóşQ-!/K—>kÛó^Ù8! Ã«éãşûÉ‚9cCÉ0\r¥MBÌùpŞøˆ¹1ÍÆööğè£ÿ•ÿ”PnF	FU„};;;İ[ÿkDúK9S’÷g|Ğ£>¦–\ZƒW<fBßòù¿\"1ŞòçD/ˆ?MõD Ú|î»ÿ~Ÿmpn§Ÿ~z¸rÁ‚0~ÂøÄ!·y¬İôá7Ç½¦».ßoÒŞ¯×¹zbÄˆáÅJ;9í\r^Œ/ŞâF\0Ÿq\ZÄg\0ÁË/ÿXo%™‘¼ \\˜†d¯	q¥‰ÍŒğûW^]|±Çé\'T1µcJJÕĞûƒÒ$‘öhãŸk%­(´œÃÎ‘ »—ÿÙò´Eë¸˜	÷ƒq\0Èİeë_zé%¹bÛ:­Õóæx„c~ğÁİÙ’e¾ÜòÈíéò<8ü\0ØFv]•Uf€¡ó–‡ŸŒKÎw\\8Ï¼qãÆü§ö:ë¬yŞı†nğÑ‰Š‡1¡×İóŠı#0\0¹×Ì1pN¼÷Ş{Ãê×Wç×$P£ğ•¯|Å´8÷ûŸ=’ş„Sq:œ5Û—ºë®»ÂW¿úÕäÚ\rßÖæùØ\"÷#5¢™¯*À°›Ò29|âóíŞe¿¯EÑ2¹Å«ûéyããuØïŒßÎ~ÔÊq=“B…\01\"¢‘xéTTVx)—’ˆûä\rJ*”§3İJa¬D3×^à&ˆö¢ë¥_½·›¸æ_~…4$ö\"÷êÖ’°kgW¸ùæ[Ãi§ıEXüø’Ğ“CÈÙf$/BÎ¥ÇGp»ñÆıºØ±]úÜ³á´¿<=\\Ãõá7ÿóß^r§+`¼ş4QÀÈÏ_Ä–NøóÜ‰ù½òÊ+>ò\"c,sÉ%—øıŒyÍñ§d!ßW–¯H\Zò~¥ÖÙiRcAÍsôEàÿ.\0®ÕòL—û“ÜkwOW.léØœ:,ûì\rÿ|çá‘G	ßøÆ7ÂuŸÊ{ìç¯aíÚµ”‰p¿9×“Äm(OEjDÌwj0(¨\rˆùDfÍœeFÚß†^œ(\r¾‹Ÿ=ğ³Ğ¹m{RÅmËHÜGb<óÌ3á“Ÿü¤@IW8¾XÿÖzwVô+ğÿ’ëôt°±›é-v-55ÕáÌ3?>1~˜>½-TÚwßÔØ&=ÁEñçşò[«­©õg#}„)2\0Ä;‚m¹uµu.XTOÒC`ò¤‰aü„q¡¾¾Ö#Ñoşü+Â´¶iŞ^™Ï@iğÒ‹/>XéáDüeÓ°±lêêë¬ôú¡ŞÎã¤ÛfÛömDÑ¾÷‡?ô1ÕO>å”p”rêÎ—Ô\0änçCn„6îç_xÁÅiİ:F•„»ï¾;Ì;·ßí =ıÅ—,ãï÷~%ëˆÀ—ÜkH†§e’öğª¿íX&ŒÔ´··û]O¹`¼¥ò°Q¸ˆÖ÷¾÷¯á[ßúf˜0>0Œ*RM\0<Cî„Äücå\\yÿİg>&NäùÓL@MÁv_ùÒçfÛqláûYBü1ˆpéG?Vüaer®~c\n{òáàbç3füY¸òÊùaÎœSÌ¨òg‘k ©mZ›ÕŞõÖŒm/õ €‘ƒ!@¼+àpWYQéíÿt\r¤¤Ò6}º½¼¦åã‘ó\Z–_~ÙåáÂ/tç,^Ü‡š.n¢şôŸ†7Ö¼áÂğ¥ÛnsñçìHx©¿ñÇ5áG?úÑ€UÚRR@i–êâş\0/üÎ„Ê dQ,Ó¥ÄÖÛÒS›$İß^ğm†\"HyR>N²ãG¿§{{²#¢ÅÁ‹Šq±µä^óüÙy{Êÿ%å\'ùmãzªª¯¹úšğØ¢Ç¼iˆí8^yYE(Kù† h”şqøó€?¶¬±ˆğ©¡±!|ùK_ö£z@\";¡š3f8âßÙ¹İÛüÏ8ó72¼ÁÃòæÏÿ`’êƒEPz9İ’6ıú†z‘ìâŸoëg~l³‰]£;tºø‚ÓG2\0Ä»‡½”pìBü¨¦$|‹	~KËÔ@e¼—ëLô«kªÃ{ß÷¾pµ•°éS]ğî>˜ªPƒ°ÈêÊW†S¬”ÏxwY	¼¿ü$ 8ˆj,]F j\0¢¨ãIi-B^KŸYêë‡ª ‹àwŞéqbuz„2îR¯‘f}‘cn-\ZŒxËW¬Øçtuí	K—.õî€ßıîwıÜ%/—Ë¹Ï5”¼gÌœ>ÿ¹ÏÛıK„\Z+n2Ò×	fFäçúƒQqÅÇ?nÆÕ‰…}–,Yâ÷­¾jşé›ßôĞÕ.ëß\\Ÿ<gĞàúO?ı´pÕ‚î«@×EíıÄT@ø£ø\'±6ê¼+êÀa‡…x{È\0ï\n¼Œı…lÿh›¤—ÁI&ŸZ§L\rS§´„6+ÑøØäG\rµUÕ¡¹¡1œwÎ¹aá5×†¶©­V(²·2ŞûV2*ÉÅÛ%–D÷ŸØšŸ	úŞ²°yÓvêçB®›Òq‰§BxW°k¬©«µ]Æø°¯y/_¾ÛûÖûVîA€¤mîDº£™yn¶=›&åÀ$ñ™Qı—>¥ç4½==î¸V8Ÿôy\rßIÒdĞ\ZÃË‡!*…ñöh0÷æúuaŞ¼yÀèÓŸş´;3â¼†72sÉÃ\Zì£	å¥eW}mM>VD|~_lºuËÖğÛß>ü÷‡¼I¦ï¨™eáË_¼­`¿lÜÔ~µdq¾š¯w#|è¡‡Âù\\ŞÒÉáÆÏ}!¬^½ÆîŸmÌ÷™T1øqKü^èy=dì™Çá´®€>õ^C6yÕıÇ„cÚş$LkæUşô6á·T‚­äÃB\'¿³Á’#aè·‡oJ~Ôà­LIQ<fútwf¢:˜Zš;œÅè¿Íòä|`^ÂïÎöjÚÕı³ÿo/w[îİ\0ó/aªïÓ|tY£Úí;6mòa‚‹«¸éÁ€3%×âıáÕ×^u\'Â‘@‰»tL™©ÿ±v’Ï0#nåá‡mŸ(’ì>yò”|Xá$¦\\ÇÃ?\\XÌ3æş!@SQz=µ\'K~½$üıíÿæ9Ï`:çœ³ÃüùóÃRúë÷£ÄCşŞy…<h6aÿk®½Æ»T^qÅáñÇß§kæ¡dÂÄ	á2{Æ/¹ôÒ0îè¤IŒ ZTı3ÒâÔÖ©>ŞŸc[|\\Ü‡÷u	1ld\0ˆw•ti#À«zí%FI†[L$Ö#zW_}µGôÃs›!cG#TyóÿÉO~â¡ésNµòîİ]…k\'ğâÿ<:•ày‡ã+ĞÙiœÖdÛö{îñÒ?ûÓ+¡˜×^]e÷4ñün*+³íKûj\"ŞWŞJç¤á@ 5æÍëƒjij*ÒCâB±“¤oo«b³M$,‹û!ñ¼óÏ·Ü|Køß\'Ÿf ä,ÒM7İâ¡‹¹G@VUf„İô…›¼›%0Úá‡.¸ üÛ}÷…m;íZòxŒ]gßMçÓ†@>œÆÎÙgÿ•W÷.¹ÑJüÍÍa¢»òá·Ğ6½Í›|¸—4ÿğ›qÿƒt®\"›È\0^^ÑÀÁ‹Ú€Ì$:9Ñc€pÂ¬§Ô3gÎœpıu×ùèuee£ëE¬OÚ¼éb6¥eJøèe÷İ_?ÇÀ÷¿ÿÄ~úşÒ²e‘Ä\0ØŞ¹½ß‹}ûöm\0\'ÂÅ<ÿÂï¼ê~$PÍ^e\"]Œû\0»H™\\	µÅQè‰Ñ\'‚ï\ZCÅ`E?	D1}ıÜ»ôıŠ°\rÃÿrÑc¾\r=¾şõ;Â_dÃyŞ´Òhoş9sN\n×_ÿ©0÷´„ú†:ïCÉâÄ	^â\'?¢ôÑŒ°Yªª*½Ö¬ØÇDˆ\0qÀá%kx¹Q\n¤Úñ§ôCj™Úâ£b Pâ%yÎ¹ç„…¯\r\'œp¼íg%Ù1IXZò,PöÒÛœ\0Cvœ|û{wwoxäá_„nøHJùœÿëo¼6mêğA„ğk „ë/u;GºÔí²m]´\\öö†»îş—ĞŞÑî×ÀşT•ÚOüÖ®¿¯Ô<ÈüĞÓ?ö\\¥Ó²ıäeËİ[õ89îtC%¡/7jmn¿ıöpÿı÷»@?õÔSÔOş˜¸î\rííaùVÚm+	c—\\y~}b$Ø×ì÷6&b>,Xp•=#­aŞ¼³ÂÍ·Ü-ZdFTg²Cj[O‡¾ÍPYYN<é}áÚ…í>×ÚÚÚšĞTß¦Lœ¦µX‰êô0­uzh™ÔÆoQ½×zÅÊég:„x79”¿‘A¢o\0/EÄ>¶º1Ğf/Æ¶6¯ ´®®&Lœ4Á»Ò<{öl{¹î;äğpÅğ`Àõí0a¢­—¡€?0wn¸ä¯/\rOš0Æ—;5\0›·l±º6nwÜq‡7#\0FRq\0j{îù~UÚÃQ©¦/fç+qĞÑg o{ü7ˆÂH0#úïóıš\\å×&Pûñµ¯İ^hIû\0pm›·lTàØ{ºÃÎ¹˜Ñ$Š\\zï	ï\r®º*œwîyáèqG¹10v\\sgómmS-µú3Îó¿ƒkñıx•şùâ`Qb?®Ñóö™ ıÈñò§Z›¶eª—q Ã‹{ËÖ-¡csGØºu[Ø¹s—·ïéîíáé§—†åË—ÛrJÑ}¥%ˆÓùX):„É£$8Èñã¹¾çøã=°ĞÉ\'ì½¾óoû½`÷Sçœ\Z~ı›_÷;ÎªU«Â{L\\¢Ÿ~Ü”äøõ\rá©\'Ÿôjú4—_vExè?ÿÃÎ3æ11ä£ìqMø= ô¯™óbÏÌc4üÃí·ûH8?²ü¶/~1œ}ö9añ’ÅaÉâÅa™İƒõëó]ôz\0•-–£Ïs>~Éùk+°O©?~ÚÀì;\Z”BĞ#;	»o{œâ=sÖÌpòÉ\'ySÑ1é¯_ol]íıMnğŒ{´ûºÔÖÖ»‘çÆX>¥1PSr¥ñj…8ĞÈ\09^ü”Œwî¢šy»[:L<¶†-›·úgŸal)oêÀxÚÄóå‚c\Zù&]Ú’ùÅàÂv\\¨äğûCÜ¼XšgÍ\nan©5 ñ¦¶¦&,^¼$|è‚½·AdğóHÎš\Z\Zí>ıŸw+KsÑE‹~õ˜C~Á\0ç\ZóAş]Ríx·Şzkøìg?ë\"å§’>…ü¹Ñ+€±ò×¬]}ô—á÷ş ¬ycïÏu³¡l»»÷xÿŞlP¼<»~Fû$9\"YØl~£ˆoTØĞˆóEÛ¥ùóaÛÇãú$qîc¡SOã}øé‚°WUU{3WSc½.jjnömù.hŞ¡Wßµ7ÍäÅ?Mñ•q ‘ 9éG@ĞI$bğSŠ¤f€ñ¬Cd¨Vf=‘İèwÔ“>å8ìàüˆÄ¢>LŸ~Œw=¤[ÛPìc˜`!LÏ.]ê¡x©bfğ^ºâqOÉ{o¾ô<¸1Ñìß¹óÛa³}\'›6mv?‡í›<jâÊ•+|´C2¢ºï&:tX“\nwŒ¡Úh¢>gÎÂŒ3C­•ò¹;´ñ¾c­®®ÁûğãÇB3—÷å¯®öşüŒÕO¿!F2\0Ä!§øÄ@Ü<¿FĞó¦3’Ú€¨5ˆéùçŸË–-ó0ºt#ß¡„m´’œ·•‚KËü>Ø/)r_†bßkİk¥ÑÊğá_ì%Qæ«+«CMm]øş=ß«W¯6)ês:Œ¸)=5×a×®İşı8GÖÅûİ—Wl\n<ïÑ_‹\0Lh³?éÄ“Â±Çg÷¡ÆKúååe¡¼¢ÌD¾ÎGîk6Áon:Ê\\1ª-a¼áøXQôé§IEˆÑ€\01êˆBÇ£‰¸ î±F\0ñÇÀ `Ç4º—E1zõÕWÃÓKŸ\rk×ş1ä|„ÀÃó…Ï{¸?Ñ¯Ó«­ßß#î‡Áî_ñyÅÏ‡ëıè>a„µ¶NñÕmÓÄŠöıòPV^ácô#úu\ruVÒoc\ZêjÌhLªúÍÏn†oaŒÉşaÄ‘†\01êà‘L?–Ìçr¹B@ôFµ4\r°<\Z¹ŞğÖ[<hÏË/¿âû’‡¾µ¿AúQôkHÅp~¦‹í7„Ş§#ÀH€ÃSÜè^šŒY@Ïæ	0tìqÇ…¹sOG57Ûuwî+/-÷ö|í!>?^üMÍ>ÆUşÕ8÷UTzj9?üNåï×áyÄ‘ˆ\01êHXâ4]#€ø#ü±6€)Ÿ½i ·Çıº»sa×Î]aÙï—yAûÆ‰ãÕ@}¾=|´ü$Š…bçõN„e¨¼‡›ïh¹o#¦€&Œ^ÊC\0*Ú÷órsde‰¶üºšÚÀ¸ıD¯lllò6~º´ÖÔÖ˜PeÏ–•ôó÷Kmıb´#@Œjz<i\" F\0C€ªJşÑˆşÛv$Í]»“f{3»7úK/½V¬Xºö$Ã÷’%6¼ÉGÓ¯áp3\0â ¿^Ò=rEìízèÁÀœûfÍšfÎšá\0Îz<øL”—W…*öæ£šC}]}h²R>şDík¨oğöıR3ÊÊ	¹œ<Cñö1\0â©½ıÛ)Ä»Š\01êìE¸)åS½Ï4:b\0líÜ\Z¶lÙ¶mİa†@gŞXèò¼è~FÙÕ«V™1°,¼şúë¶µ8Ä·ó‘`\0ÀA}Å¤<ö÷`ç8ÛùÔXI~Ê”©áøã÷¶}Ä¾¢¼Ì½ôiãwÏ}[VWÛàÕû|n°»òáI­\0FÍJè~!¦‚\0q˜ @–ÄÇ–)†\0¥ü\\.çÉ›¶\'ÍÛ¶mÛ“î„ÄèÜnÆ@Ş``[l!ÖÀ×¬	¿{ñEïÂÖ½ÇÖÙr|\\Nxa§D°$¾èÅè¡PòO½Îì{êíéµÒ9!{C•‰ö”É“Â¬Ù³}ÌıÆúF¿€€Sê÷^UUî¹OÕ>Ã9¢·–6ªÿí3ıüi ¥è%ª§DŒvd\0ˆÃ’âÇ–ÏôÑÆ‘a§i\0‘>\04	D?Öc(Äí0\"Èƒ˜ÔĞŸ‘ùvvíNò÷ÿJi¼y1 é’Ä¾\'Jê„›}üLj·©¹ÉHò*şŠJş˜pâÃƒ±§”Ï”*~÷è·õˆ>µ!1	q¸#@ô{Œm6ñèNFŸ£‰\0±§€±7×à4hë¨E aØçÕU«ÂòËÃÆ\rÂÖmÛ’ş¥?qhIÙ¾tÓäîĞÔØìmù³f½\'´¶Nu# Äl6ªìé·_QVáb7?|=SÄ#\0ÑwÇ>K^Ú/-³G*é)‘ d\0ˆ#‚ÁcjºsIÔ@D¡O‹4\0¢Àg¦\rˆı\\Î§,{kÃ[^3€#!5}qôÅ¡„¼cÇZ¦´„Ù³g„	\'ó@x•¿‹·}OÕÕ>XF\0}õıtI±Ošl›òrOC	¾\0q$ @ÑÄÇ›)	#€&Œ€(ü1\0Ë¨5`m1Xß³·×	ÛÏñë©X¹rexíµ×Âºukı3‡ò’\"â0\"°móÆDf~Şf?ükåî0šbÎ¾7î/¥õ	\'„c=Ö‡N&êÜ±ûWVF +é[I¾\nQ¯¨ôZ€Xâ§”ù|–#şˆz“¡	¾8‘ h{¼c©c 600\0ğÀ`ÓİôØİeFÁĞ»`·‹6‚4´wtøˆ}«Ì XÿÖ[×ğÉ¢0ŒD»%Ş™4qRhÖ\Z¦·µy|DGMşá¹Ow¼Øø×××ºĞP×Xz\0Ä?]ÒGÜ©êOñ÷ @‰È\0™†Ç?\Z±v Š>µÌcDš‚];};ÂçØ\'ß¼@sƒÿY›:6…µëÖ†uk×ù´Ã$„ÑüX#\Z$£û!cÉçÌüó\0×KÄ<jdèR×Û›L)İO?ŞÇÍŸÚÚê}îñÖg[/éŞßîc¥|DßÑùÔÓ¯„_“8ññ¹¦º&”–$ÿ¥å}¥}	¼È\"2\0„Èƒ!€{Û¿	lˆÍ|öèƒ»¶{€¡ˆc†ñØ.Ù/q&dÛ(*D#Üİµ;´ol7n6lo¾¹ÎóÂx «\ZíÔüËè.QóJMì	²3yò”0nÜX÷ØgĞ›7÷jyÚù™›Ÿ¶|æ©ö§ÔÏĞÂÕ¶Œî{,s>3\0(ÕÒ—&\07Øñ§ï¾}5{]e\0ˆl\"@ˆ\"rD<N ú\r ö±F€ÏÔ°,60OJj	’\Z…¤„›ˆ?9òf?j\Z63Ôñ–Í¡½½#l0aÛÖ­n@ü×iÛRRe?¦ìÇğauZº|Şš=±Ï:cÓûFîÚh[¤Drp}œ#SÎ‘¶zJàŒ~Ç2ÚíxRsóØĞØĞ\Z›ê]˜YOâúH,cê\"nÆ\0óäEŠ^ú±íe±„Ïº8ïùÚŸçI”¾\"8YF€ƒÀO#ş<49mDÂØ|6˜gY4â6ä™G¥i\n _>°œè…Ñ Ø¶…¨†ÉÀGL½6¢\'çN‰Ô à˜èûZŞ&n`\0ô#ÿ+Ã±’Ùwd\0 ®ˆ³—ª™§dnBL\0âä777¹à#ÔÕ•‰p³}ùÒÒrß¯·7çù!ÜQøÙ\'Š¬Æg=Ó(öoJğãşåeå^½Ï<%ò2\0DÖ‘ Ä~(ş‰ şˆ4DÃ –úIQø1â2D›}bïò`yœöšØr¶AÔ™Oû‘ö&Çg[„i·¥]»w|öà hù`4ì°´ËÇş4=` 0 R¯m‡èa8ĞÜĞ\'€L“8×ˆxT»Óo>V³76Ô\'ëL|éN‡@ó™it¨ƒ$ËÏ®ë _ßÖçÏçòrúâ³oRâby!ö,\'±/BOŠÇŠ)æÓpîvBÉÈ\0b?ìï\'‚óŸV*gŠğºøRR7BŸ®`Ê6>oû¹1`óäÃ`5„)&Ÿ\\·	¶MÓFAÇØÛëSï¥^;MÖs¶‰ÀS\n¶O#×`ÿKe™E¥.àÛ³Œ 5^Ò^OÍ‚åæëèéíø^@¼d[_fÇ©0‘Gh9f4\0¢³âç£{>ÇõÑ(ğcÙúx/\\üù£jÃ°1|d\0ñ‰?!ßÔÏ	áîéM|{ÖÇ\Zø9\Z|¦ô×GeÀ|ÜãÄš\0½ÇÇ:ğó01äøÌb\n¤ÅÑ÷gEM/¬·åìcâ\ZÛïIe¥å¶ÃÂ6ñ¡Çp K^ei¥-Kbï—»Ó^R;@>Œ‘€WT”‡ÚÚ\ZìŠò$¼.âEÁçXÌ#ìäÅ6ésŒál#„èC€ï~BˆË)ûg<D6j\"F!F‹¹-‹bOMA\\F\"¯h°œÏ‰`F-s+‘Ç<YÏ1©îç3¡…ó\"¡—~zÈº¶.j(¢>†„	àËMŒÇ˜P²×„ÜD¹¢Ôò°å&îxÚ#à•&èä›ÊJ*7ñÀ\0 F ´lŒ­KJÿ¬+	ÉzË\nÇ*-³“HÎ…sì\'„>2\0„8€öóŠBhEAGèe4\rxu}Ş\0\0¶Ç\0ˆû’â~Ì“)nËº˜X÷IÃ:‡ö_t×d™’{Ş\0ğjv[aåıÀˆÉ.Ö•ø$UüşgÆFuyoÛ¾$ñcy˜ÈÓoŸ6Ï·ÔòóÖ‚Ä7\0€ã@¬ÆÖ	!,2\0„8ÀõCèXÏÔãä…‘e¾Üşğ	ˆŸò¸c\0¢ØG‘g>Š=ó§‘âåc¬dn‡v:—’½\0–üJæVòçy+±³;çÃç2Ir€¦[Æş¦ö¬ëË#ÉßáÂ¿¯Ğ“ŸâÀ#@ˆQLZÄû	£-Šş‘bÁ	Af‹kÜ˜g=†MqDÅX\0´ÇGXq›Hz^1z‘ ÄBğ8Kô^Èf¾¿ö;Å?ßßwí3â6ÅÆÃ`w;!Ä¡E€B‘ATW\'„Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „Bd\0B!D‘ „BdşARÑÌ¨òà¼\0\0\0\0IEND®B`‚','.png',NULL,'ID','Admin User','2025-07-13 11:40:43.222105',NULL,NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grantors`
--

DROP TABLE IF EXISTS `grantors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grantors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `email` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `address` longtext NOT NULL,
  `identification_number` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_grantors_customer_id` (`customer_id`),
  CONSTRAINT `fk_grantors_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grantors`
--

LOCK TABLES `grantors` WRITE;
/*!40000 ALTER TABLE `grantors` DISABLE KEYS */;
INSERT INTO `grantors` VALUES
(1,1,'t','t','t@test.org','8888888888','-','123123','Admin User','2025-07-04 03:34:43.449224',NULL,NULL);
/*!40000 ALTER TABLE `grantors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_application_fees`
--

DROP TABLE IF EXISTS `loan_application_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_application_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_application_id` int(11) NOT NULL,
  `fee_name` longtext NOT NULL,
  `calculated_amount` decimal(18,2) NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `status` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_loan_application_fees_loan_application_id` (`loan_application_id`),
  CONSTRAINT `fk_loan_application_fees_loan_applications_loan_application_id` FOREIGN KEY (`loan_application_id`) REFERENCES `loan_applications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_application_fees`
--

LOCK TABLES `loan_application_fees` WRITE;
/*!40000 ALTER TABLE `loan_application_fees` DISABLE KEYS */;
INSERT INTO `loan_application_fees` VALUES
(3,36,'Admin Fee 15K',15000.00,'Admin User','2025-07-11 18:13:14.257938',NULL,NULL,'Pending'),
(5,44,'Admin Fee 15K',15000.00,'Admin User','2025-07-11 21:36:25.110199',NULL,NULL,'Paid'),
(6,45,'Admin Fee 10%',8000000.00,'Admin User','2025-07-11 22:49:05.931893',NULL,NULL,'Pending'),
(7,46,'Admin Fee 10%',400000.00,'Admin User','2025-07-12 02:22:07.034128',NULL,NULL,'Pending'),
(8,47,'Admin Fee 15K',15000.00,'Admin User','2025-07-12 03:25:59.040291',NULL,NULL,'Pending'),
(10,58,'Admin Fee 15K',15000.00,'Admin User','2025-07-13 11:43:14.045740',NULL,NULL,'Paid'),
(11,59,'Admin Fee 15K',15000.00,'Admin User','2025-07-13 12:11:20.460055',NULL,NULL,'Paid');
/*!40000 ALTER TABLE `loan_application_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_applications`
--

DROP TABLE IF EXISTS `loan_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` longtext NOT NULL,
  `principal_amount` decimal(18,2) NOT NULL,
  `release_date` datetime(6) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_period` longtext NOT NULL,
  `interest_method` longtext NOT NULL,
  `interest_rate` decimal(18,2) NOT NULL,
  `interest_cycle` longtext NOT NULL,
  `repayment_cycle` longtext NOT NULL,
  `repayment_day` int(11) NOT NULL,
  `total_interest` decimal(18,2) NOT NULL,
  `total_fees` decimal(18,2) NOT NULL,
  `total_repayment` decimal(18,2) NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_loan_applications_customer_id` (`customer_id`),
  KEY `ix_loan_applications_loan_product_id` (`loan_product_id`),
  CONSTRAINT `fk_loan_applications_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_loan_applications_loan_products_loan_product_id` FOREIGN KEY (`loan_product_id`) REFERENCES `loan_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_applications`
--

LOCK TABLES `loan_applications` WRITE;
/*!40000 ALTER TABLE `loan_applications` DISABLE KEYS */;
INSERT INTO `loan_applications` VALUES
(36,1,1,'Active',5000000.00,'2025-07-11 00:00:00.000000',6,'Months','Flat',5.00,'Monthly','Monthly',11,126000.00,0.00,5126000.00,'Admin User','2025-07-11 18:13:14.070682',NULL,NULL),
(44,1,1,'Active',5000000.00,'2025-07-11 00:00:00.000000',6,'Months','Real',15.00,'Monthly','Monthly',10,218500.00,0.00,5218500.00,'Admin User','2025-07-11 21:36:24.958914',NULL,NULL),
(45,2,1,'Active',80000000.00,'2025-07-11 00:00:00.000000',2,'Years','Real',20.00,'Monthly','Monthly',5,16666000.00,0.00,96666000.00,'Admin User','2025-07-11 22:49:05.920511',NULL,NULL),
(46,1,4,'Denied',4000000.00,'2025-07-12 00:00:00.000000',6,'Months','Flat',20.00,'Monthly','Monthly',10,0.00,0.00,0.00,'Admin User','2025-07-12 02:22:06.664364','Admin User','2025-07-12 03:25:14.045921'),
(47,1,6,'Active',1000000.00,'2025-07-12 03:27:10.408884',6,'Months','Flat',5.00,'Monthly','Monthly',10,24000.00,0.00,1024000.00,'Admin User','2025-07-12 03:25:58.997821','Admin User','2025-07-12 03:27:08.662168'),
(57,1,1,'Active',6000000.00,'2025-01-01 00:00:00.000000',6,'Months','Flat',5.00,'Monthly','Monthly',10,150000.00,0.00,6150000.00,'Admin User','2025-07-13 02:47:36.094643',NULL,NULL),
(58,2,1,'Active',90000000.00,'2025-07-13 11:43:36.989727',3,'Years','Real',30.00,'Monthly','Monthly',15,41625000.00,0.00,131625000.00,'Admin User','2025-07-13 11:43:13.953403','Admin User','2025-07-13 11:43:36.989615'),
(59,1,1,'Active',100000.00,'2025-07-13 12:12:03.160421',6,'Months','Flat',5.00,'Monthly','Monthly',15,2500.02,0.00,102500.02,'Admin User','2025-07-13 12:11:20.441957','Admin User','2025-07-13 12:12:03.160415');
/*!40000 ALTER TABLE `loan_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_fees`
--

DROP TABLE IF EXISTS `loan_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_name` longtext NOT NULL,
  `fee_type` longtext NOT NULL,
  `fee_percentage` int(11) NOT NULL,
  `fee_amount` decimal(18,2) NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_fees`
--

LOCK TABLES `loan_fees` WRITE;
/*!40000 ALTER TABLE `loan_fees` DISABLE KEYS */;
INSERT INTO `loan_fees` VALUES
(1,'Test','FixedAmount',0,5000.00,'Admin User','2025-07-06 18:28:13.651986',NULL,NULL),
(3,'Admin Fee 15K','FixedAmount',0,15000.00,'Admin User','2025-07-11 15:00:53.715202',NULL,NULL),
(4,'Admin Fee 10%','PercentageOnPrincipal',10,0.00,'Admin User','2025-07-11 22:48:17.198552',NULL,NULL);
/*!40000 ALTER TABLE `loan_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_products`
--

DROP TABLE IF EXISTS `loan_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `min_principal_amount` decimal(18,2) NOT NULL,
  `max_principal_amount` decimal(18,2) NOT NULL,
  `duration_period` longtext NOT NULL,
  `duration_type` longtext NOT NULL,
  `min_duration_value` int(11) NOT NULL,
  `max_duration_value` int(11) DEFAULT NULL,
  `interest_method` longtext NOT NULL,
  `interest_rate` decimal(18,2) NOT NULL,
  `interest_cycle` longtext NOT NULL,
  `repayment_cycle` longtext NOT NULL,
  `late_penalty_enabled` tinyint(1) NOT NULL,
  `penalty_type` longtext DEFAULT NULL,
  `penalty_percentage` decimal(18,2) DEFAULT NULL,
  `penalty_fixed_amount` decimal(18,2) DEFAULT NULL,
  `penalty_calculation_base` longtext DEFAULT NULL,
  `grace_period_days` int(11) DEFAULT NULL,
  `recurring_penalty_type` longtext DEFAULT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_products`
--

LOCK TABLES `loan_products` WRITE;
/*!40000 ALTER TABLE `loan_products` DISABLE KEYS */;
INSERT INTO `loan_products` VALUES
(1,'6 Months Assetless','-',100000.00,5000000.00,'Months','Fixed',6,NULL,'Flat',5.00,'Monthly','Monthly',1,'Fixed',NULL,10000.00,'Principal',3,'Monthly','Admin User','2025-06-29 12:53:13.906563',NULL,NULL),
(2,'Mortgage Loan','Test Mortgage Loan',10000000.00,300000000.00,'Years','Interval',1,3,'Real',20.00,'Monthly','Monthly',0,NULL,NULL,NULL,NULL,NULL,NULL,'Admin User','2025-07-10 21:41:30.260023',NULL,NULL);
/*!40000 ALTER TABLE `loan_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_transactions`
--

DROP TABLE IF EXISTS `penalty_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_application_id` int(11) NOT NULL,
  `repayment_schedule_id` int(11) NOT NULL,
  `penalty_amount` decimal(18,2) NOT NULL,
  `penalty_type` longtext NOT NULL,
  `penalty_date` datetime(6) NOT NULL,
  `status` longtext NOT NULL,
  `description` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_penalty_transactions_loan_application_id` (`loan_application_id`),
  KEY `ix_penalty_transactions_repayment_schedule_id` (`repayment_schedule_id`),
  CONSTRAINT `fk_penalty_transactions_loan_applications_loan_application_id` FOREIGN KEY (`loan_application_id`) REFERENCES `loan_applications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_penalty_transactions_repayment_schedules_repayment_schedule_` FOREIGN KEY (`repayment_schedule_id`) REFERENCES `repayment_schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_transactions`
--

LOCK TABLES `penalty_transactions` WRITE;
/*!40000 ALTER TABLE `penalty_transactions` DISABLE KEYS */;
INSERT INTO `penalty_transactions` VALUES
(1,57,205,10000.00,'Penalty','2025-07-13 02:54:32.508149','Pending','Late payment penalty (153 days overdue)','LoanMonitoringService','2025-07-13 02:54:34.005545',NULL,NULL),
(2,57,206,10000.00,'Penalty','2025-07-13 02:54:43.546387','Pending','Late payment penalty (125 days overdue)','LoanMonitoringService','2025-07-13 02:54:43.900085',NULL,NULL),
(3,57,207,10000.00,'Penalty','2025-07-13 02:54:56.417507','Pending','Late payment penalty (94 days overdue)','LoanMonitoringService','2025-07-13 02:54:56.755106',NULL,NULL),
(4,57,208,10000.00,'Penalty','2025-07-13 02:55:02.260401','Pending','Late payment penalty (64 days overdue)','LoanMonitoringService','2025-07-13 02:55:02.489975',NULL,NULL),
(5,57,209,10000.00,'Penalty','2025-07-13 02:55:10.627377','Pending','Late payment penalty (33 days overdue)','LoanMonitoringService','2025-07-13 02:55:12.182681',NULL,NULL);
/*!40000 ALTER TABLE `penalty_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayment_schedules`
--

DROP TABLE IF EXISTS `repayment_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repayment_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_application_id` int(11) NOT NULL,
  `installment_number` int(11) NOT NULL,
  `due_date` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `principal_amount` decimal(18,2) NOT NULL,
  `interest_amount` decimal(18,2) NOT NULL,
  `fee_amount` decimal(18,2) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `outstanding_principal` decimal(18,2) NOT NULL,
  `status` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_repayment_schedules_loan_application_id` (`loan_application_id`),
  CONSTRAINT `fk_repayment_schedules_loan_applications_loan_application_id` FOREIGN KEY (`loan_application_id`) REFERENCES `loan_applications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_schedules`
--

LOCK TABLES `repayment_schedules` WRITE;
/*!40000 ALTER TABLE `repayment_schedules` DISABLE KEYS */;
INSERT INTO `repayment_schedules` VALUES
(118,36,1,'2025-07-11 00:00:00.000000','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,5000000.00,'Paid','Admin User','2025-07-11 18:13:14.259540',NULL,NULL),
(119,36,2,'2025-08-11 00:00:00.000000','Installment 2',833500.00,21000.00,0.00,854500.00,3333000.00,'Paid','Admin User','2025-07-11 18:13:14.262537',NULL,NULL),
(120,36,3,'2025-09-11 00:00:00.000000','Installment 3',833500.00,21000.00,0.00,854500.00,2516500.00,'PartiallyPaid','Admin User','2025-07-11 18:13:14.262550',NULL,NULL),
(121,36,4,'2025-10-11 00:00:00.000000','Installment 4',833500.00,21000.00,0.00,854500.00,2499500.00,'Pending','Admin User','2025-07-11 18:13:14.262556',NULL,NULL),
(122,36,5,'2025-11-11 00:00:00.000000','Installment 5',833500.00,21000.00,0.00,854500.00,1666000.00,'Pending','Admin User','2025-07-11 18:13:14.262560',NULL,NULL),
(123,36,6,'2025-12-11 00:00:00.000000','Installment 6',833500.00,21000.00,0.00,854500.00,832500.00,'Pending','Admin User','2025-07-11 18:13:14.262565',NULL,NULL),
(124,36,7,'2026-01-11 00:00:00.000000','Installment 7',832500.00,21000.00,0.00,853500.00,0.00,'Pending','Admin User','2025-07-11 18:13:14.262612',NULL,NULL),
(132,44,1,'2025-07-11 00:00:00.000000','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,5000000.00,'Paid','Admin User','2025-07-11 21:36:25.113735',NULL,NULL),
(133,44,2,'2025-08-10 00:00:00.000000','Installment 2',833500.00,62500.00,0.00,896000.00,3333000.00,'Paid','Admin User','2025-07-11 21:36:25.120038',NULL,NULL),
(134,44,3,'2025-09-10 00:00:00.000000','Installment 3',833500.00,52000.00,0.00,885500.00,2629000.00,'PartiallyPaid','Admin User','2025-07-11 21:36:25.120078',NULL,NULL),
(135,44,4,'2025-10-10 00:00:00.000000','Installment 4',833500.00,41500.00,0.00,875000.00,2499500.00,'Pending','Admin User','2025-07-11 21:36:25.120082',NULL,NULL),
(136,44,5,'2025-11-10 00:00:00.000000','Installment 5',833500.00,31000.00,0.00,864500.00,1666000.00,'Pending','Admin User','2025-07-11 21:36:25.120087',NULL,NULL),
(137,44,6,'2025-12-10 00:00:00.000000','Installment 6',833500.00,21000.00,0.00,854500.00,832500.00,'Pending','Admin User','2025-07-11 21:36:25.120092',NULL,NULL),
(138,44,7,'2026-01-10 00:00:00.000000','Installment 7',832500.00,10500.00,0.00,843000.00,0.00,'Pending','Admin User','2025-07-11 21:36:25.120095',NULL,NULL),
(139,45,1,'2025-07-11 00:00:00.000000','Fee: Admin Fee 10%',0.00,0.00,8000000.00,8000000.00,80000000.00,'Due','LoanMonitoringService','2025-07-13 02:49:56.843996',NULL,NULL),
(140,45,2,'2025-08-05 00:00:00.000000','Installment 2',3333500.00,1333500.00,0.00,4667000.00,76666500.00,'Pending','Admin User','2025-07-11 22:49:05.932136',NULL,NULL),
(141,45,3,'2025-09-05 00:00:00.000000','Installment 3',3333500.00,1278000.00,0.00,4611500.00,73333000.00,'Pending','Admin User','2025-07-11 22:49:05.932145',NULL,NULL),
(142,45,4,'2025-10-05 00:00:00.000000','Installment 4',3333500.00,1222000.00,0.00,4555500.00,69999500.00,'Pending','Admin User','2025-07-11 22:49:05.932150',NULL,NULL),
(143,45,5,'2025-11-05 00:00:00.000000','Installment 5',3333500.00,1166500.00,0.00,4500000.00,66666000.00,'Pending','Admin User','2025-07-11 22:49:05.932154',NULL,NULL),
(144,45,6,'2025-12-05 00:00:00.000000','Installment 6',3333500.00,1111000.00,0.00,4444500.00,63332500.00,'Pending','Admin User','2025-07-11 22:49:05.932162',NULL,NULL),
(145,45,7,'2026-01-05 00:00:00.000000','Installment 7',3333500.00,1055500.00,0.00,4389000.00,59999000.00,'Pending','Admin User','2025-07-11 22:49:05.932166',NULL,NULL),
(146,45,8,'2026-02-05 00:00:00.000000','Installment 8',3333500.00,1000000.00,0.00,4333500.00,56665500.00,'Pending','Admin User','2025-07-11 22:49:05.932172',NULL,NULL),
(147,45,9,'2026-03-05 00:00:00.000000','Installment 9',3333500.00,944500.00,0.00,4278000.00,53332000.00,'Pending','Admin User','2025-07-11 22:49:05.932175',NULL,NULL),
(148,45,10,'2026-04-05 00:00:00.000000','Installment 10',3333500.00,889000.00,0.00,4222500.00,49998500.00,'Pending','Admin User','2025-07-11 22:49:05.932179',NULL,NULL),
(149,45,11,'2026-05-05 00:00:00.000000','Installment 11',3333500.00,833500.00,0.00,4167000.00,46665000.00,'Pending','Admin User','2025-07-11 22:49:05.932184',NULL,NULL),
(150,45,12,'2026-06-05 00:00:00.000000','Installment 12',3333500.00,778000.00,0.00,4111500.00,43331500.00,'Pending','Admin User','2025-07-11 22:49:05.932188',NULL,NULL),
(151,45,13,'2026-07-05 00:00:00.000000','Installment 13',3333500.00,722000.00,0.00,4055500.00,39998000.00,'Pending','Admin User','2025-07-11 22:49:05.932191',NULL,NULL),
(152,45,14,'2026-08-05 00:00:00.000000','Installment 14',3333500.00,666500.00,0.00,4000000.00,36664500.00,'Pending','Admin User','2025-07-11 22:49:05.932197',NULL,NULL),
(153,45,15,'2026-09-05 00:00:00.000000','Installment 15',3333500.00,611000.00,0.00,3944500.00,33331000.00,'Pending','Admin User','2025-07-11 22:49:05.932200',NULL,NULL),
(154,45,16,'2026-10-05 00:00:00.000000','Installment 16',3333500.00,555500.00,0.00,3889000.00,29997500.00,'Pending','Admin User','2025-07-11 22:49:05.932210',NULL,NULL),
(155,45,17,'2026-11-05 00:00:00.000000','Installment 17',3333500.00,500000.00,0.00,3833500.00,26664000.00,'Pending','Admin User','2025-07-11 22:49:05.932215',NULL,NULL),
(156,45,18,'2026-12-05 00:00:00.000000','Installment 18',3333500.00,444500.00,0.00,3778000.00,23330500.00,'Pending','Admin User','2025-07-11 22:49:05.932219',NULL,NULL),
(157,45,19,'2027-01-05 00:00:00.000000','Installment 19',3333500.00,389000.00,0.00,3722500.00,19997000.00,'Pending','Admin User','2025-07-11 22:49:05.932223',NULL,NULL),
(158,45,20,'2027-02-05 00:00:00.000000','Installment 20',3333500.00,333500.00,0.00,3667000.00,16663500.00,'Pending','Admin User','2025-07-11 22:49:05.932229',NULL,NULL),
(159,45,21,'2027-03-05 00:00:00.000000','Installment 21',3333500.00,277500.00,0.00,3611000.00,13330000.00,'Pending','Admin User','2025-07-11 22:49:05.932234',NULL,NULL),
(160,45,22,'2027-04-05 00:00:00.000000','Installment 22',3333500.00,222000.00,0.00,3555500.00,9996500.00,'Pending','Admin User','2025-07-11 22:49:05.932237',NULL,NULL),
(161,45,23,'2027-05-05 00:00:00.000000','Installment 23',3333500.00,166500.00,0.00,3500000.00,6663000.00,'Pending','Admin User','2025-07-11 22:49:05.932241',NULL,NULL),
(162,45,24,'2027-06-05 00:00:00.000000','Installment 24',3333500.00,111000.00,0.00,3444500.00,3329500.00,'Pending','Admin User','2025-07-11 22:49:05.932245',NULL,NULL),
(163,45,25,'2027-07-05 00:00:00.000000','Installment 25',3329500.00,55500.00,0.00,3385000.00,0.00,'Pending','Admin User','2025-07-11 22:49:05.932249',NULL,NULL),
(164,47,1,'2025-07-12 03:27:10.408884','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,1000000.00,'Due','LoanMonitoringService','2025-07-13 02:50:03.664342',NULL,NULL),
(165,47,2,'2025-08-10 00:00:00.000000','Installment 2',166500.00,4000.00,0.00,170500.00,833500.00,'Pending','Admin User','2025-07-12 03:27:12.173908',NULL,NULL),
(166,47,3,'2025-09-10 00:00:00.000000','Installment 3',166500.00,4000.00,0.00,170500.00,667000.00,'Pending','Admin User','2025-07-12 03:27:12.173910',NULL,NULL),
(167,47,4,'2025-10-10 00:00:00.000000','Installment 4',166500.00,4000.00,0.00,170500.00,500500.00,'Pending','Admin User','2025-07-12 03:27:12.173911',NULL,NULL),
(168,47,5,'2025-11-10 00:00:00.000000','Installment 5',166500.00,4000.00,0.00,170500.00,334000.00,'Pending','Admin User','2025-07-12 03:27:12.173912',NULL,NULL),
(169,47,6,'2025-12-10 00:00:00.000000','Installment 6',166500.00,4000.00,0.00,170500.00,167500.00,'Pending','Admin User','2025-07-12 03:27:12.173917',NULL,NULL),
(170,47,7,'2026-01-10 00:00:00.000000','Installment 7',167500.00,4000.00,0.00,171500.00,0.00,'Pending','Admin User','2025-07-12 03:27:12.173930',NULL,NULL),
(205,57,1,'2025-02-10 00:00:00.000000','Installment 1',1000000.00,25000.00,0.00,1025000.00,5000000.00,'Overdue','LoanMonitoringService','2025-07-13 02:50:06.481964','LoanMonitoringService','2025-07-13 03:00:00.265368'),
(206,57,2,'2025-03-10 00:00:00.000000','Installment 2',1000000.00,25000.00,0.00,1025000.00,4000000.00,'Overdue','LoanMonitoringService','2025-07-13 02:50:06.485684','LoanMonitoringService','2025-07-13 03:00:00.274559'),
(207,57,3,'2025-04-10 00:00:00.000000','Installment 3',1000000.00,25000.00,0.00,1025000.00,3000000.00,'Overdue','LoanMonitoringService','2025-07-13 02:50:06.488652','LoanMonitoringService','2025-07-13 03:00:00.283062'),
(208,57,4,'2025-05-10 00:00:00.000000','Installment 4',1000000.00,25000.00,0.00,1025000.00,2000000.00,'Overdue','LoanMonitoringService','2025-07-13 02:50:06.491796','LoanMonitoringService','2025-07-13 03:00:00.291556'),
(209,57,5,'2025-06-10 00:00:00.000000','Installment 5',1000000.00,25000.00,0.00,1025000.00,1000000.00,'Overdue','LoanMonitoringService','2025-07-13 02:50:06.494625','LoanMonitoringService','2025-07-13 03:00:00.299138'),
(210,57,6,'2025-07-10 00:00:00.000000','Installment 6',1000000.00,25000.00,0.00,1025000.00,0.00,'Due','LoanMonitoringService','2025-07-13 02:50:06.497511',NULL,NULL),
(211,58,1,'2025-07-13 11:43:36.989727','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,90000000.00,'Paid','Admin User','2025-07-13 11:43:36.998693',NULL,NULL),
(212,58,2,'2025-08-15 00:00:00.000000','Installment 2',2500000.00,2250000.00,0.00,4750000.00,87500000.00,'Pending','Admin User','2025-07-13 11:43:37.003981',NULL,NULL),
(213,58,3,'2025-09-15 00:00:00.000000','Installment 3',2500000.00,2187500.00,0.00,4687500.00,85000000.00,'Pending','Admin User','2025-07-13 11:43:37.004008',NULL,NULL),
(214,58,4,'2025-10-15 00:00:00.000000','Installment 4',2500000.00,2125000.00,0.00,4625000.00,82500000.00,'Pending','Admin User','2025-07-13 11:43:37.004014',NULL,NULL),
(215,58,5,'2025-11-15 00:00:00.000000','Installment 5',2500000.00,2062500.00,0.00,4562500.00,80000000.00,'Pending','Admin User','2025-07-13 11:43:37.004017',NULL,NULL),
(216,58,6,'2025-12-15 00:00:00.000000','Installment 6',2500000.00,2000000.00,0.00,4500000.00,77500000.00,'Pending','Admin User','2025-07-13 11:43:37.004046',NULL,NULL),
(217,58,7,'2026-01-15 00:00:00.000000','Installment 7',2500000.00,1937500.00,0.00,4437500.00,75000000.00,'Pending','Admin User','2025-07-13 11:43:37.004051',NULL,NULL),
(218,58,8,'2026-02-15 00:00:00.000000','Installment 8',2500000.00,1875000.00,0.00,4375000.00,72500000.00,'Pending','Admin User','2025-07-13 11:43:37.004054',NULL,NULL),
(219,58,9,'2026-03-15 00:00:00.000000','Installment 9',2500000.00,1812500.00,0.00,4312500.00,70000000.00,'Pending','Admin User','2025-07-13 11:43:37.004059',NULL,NULL),
(220,58,10,'2026-04-15 00:00:00.000000','Installment 10',2500000.00,1750000.00,0.00,4250000.00,67500000.00,'Pending','Admin User','2025-07-13 11:43:37.004062',NULL,NULL),
(221,58,11,'2026-05-15 00:00:00.000000','Installment 11',2500000.00,1687500.00,0.00,4187500.00,65000000.00,'Pending','Admin User','2025-07-13 11:43:37.004064',NULL,NULL),
(222,58,12,'2026-06-15 00:00:00.000000','Installment 12',2500000.00,1625000.00,0.00,4125000.00,62500000.00,'Pending','Admin User','2025-07-13 11:43:37.004066',NULL,NULL),
(223,58,13,'2026-07-15 00:00:00.000000','Installment 13',2500000.00,1562500.00,0.00,4062500.00,60000000.00,'Pending','Admin User','2025-07-13 11:43:37.004070',NULL,NULL),
(224,58,14,'2026-08-15 00:00:00.000000','Installment 14',2500000.00,1500000.00,0.00,4000000.00,57500000.00,'Pending','Admin User','2025-07-13 11:43:37.004073',NULL,NULL),
(225,58,15,'2026-09-15 00:00:00.000000','Installment 15',2500000.00,1437500.00,0.00,3937500.00,55000000.00,'Pending','Admin User','2025-07-13 11:43:37.004076',NULL,NULL),
(226,58,16,'2026-10-15 00:00:00.000000','Installment 16',2500000.00,1375000.00,0.00,3875000.00,52500000.00,'Pending','Admin User','2025-07-13 11:43:37.004080',NULL,NULL),
(227,58,17,'2026-11-15 00:00:00.000000','Installment 17',2500000.00,1312500.00,0.00,3812500.00,50000000.00,'Pending','Admin User','2025-07-13 11:43:37.004084',NULL,NULL),
(228,58,18,'2026-12-15 00:00:00.000000','Installment 18',2500000.00,1250000.00,0.00,3750000.00,47500000.00,'Pending','Admin User','2025-07-13 11:43:37.004087',NULL,NULL),
(229,58,19,'2027-01-15 00:00:00.000000','Installment 19',2500000.00,1187500.00,0.00,3687500.00,45000000.00,'Pending','Admin User','2025-07-13 11:43:37.004089',NULL,NULL),
(230,58,20,'2027-02-15 00:00:00.000000','Installment 20',2500000.00,1125000.00,0.00,3625000.00,42500000.00,'Pending','Admin User','2025-07-13 11:43:37.004091',NULL,NULL),
(231,58,21,'2027-03-15 00:00:00.000000','Installment 21',2500000.00,1062500.00,0.00,3562500.00,40000000.00,'Pending','Admin User','2025-07-13 11:43:37.004093',NULL,NULL),
(232,58,22,'2027-04-15 00:00:00.000000','Installment 22',2500000.00,1000000.00,0.00,3500000.00,37500000.00,'Pending','Admin User','2025-07-13 11:43:37.004095',NULL,NULL),
(233,58,23,'2027-05-15 00:00:00.000000','Installment 23',2500000.00,937500.00,0.00,3437500.00,35000000.00,'Pending','Admin User','2025-07-13 11:43:37.004098',NULL,NULL),
(234,58,24,'2027-06-15 00:00:00.000000','Installment 24',2500000.00,875000.00,0.00,3375000.00,32500000.00,'Pending','Admin User','2025-07-13 11:43:37.004100',NULL,NULL),
(235,58,25,'2027-07-15 00:00:00.000000','Installment 25',2500000.00,812500.00,0.00,3312500.00,30000000.00,'Pending','Admin User','2025-07-13 11:43:37.004102',NULL,NULL),
(236,58,26,'2027-08-15 00:00:00.000000','Installment 26',2500000.00,750000.00,0.00,3250000.00,27500000.00,'Pending','Admin User','2025-07-13 11:43:37.004104',NULL,NULL),
(237,58,27,'2027-09-15 00:00:00.000000','Installment 27',2500000.00,687500.00,0.00,3187500.00,25000000.00,'Pending','Admin User','2025-07-13 11:43:37.004106',NULL,NULL),
(238,58,28,'2027-10-15 00:00:00.000000','Installment 28',2500000.00,625000.00,0.00,3125000.00,22500000.00,'Pending','Admin User','2025-07-13 11:43:37.004110',NULL,NULL),
(239,58,29,'2027-11-15 00:00:00.000000','Installment 29',2500000.00,562500.00,0.00,3062500.00,20000000.00,'Pending','Admin User','2025-07-13 11:43:37.004115',NULL,NULL),
(240,58,30,'2027-12-15 00:00:00.000000','Installment 30',2500000.00,500000.00,0.00,3000000.00,17500000.00,'Pending','Admin User','2025-07-13 11:43:37.004118',NULL,NULL),
(241,58,31,'2028-01-15 00:00:00.000000','Installment 31',2500000.00,437500.00,0.00,2937500.00,15000000.00,'Pending','Admin User','2025-07-13 11:43:37.004129',NULL,NULL),
(242,58,32,'2028-02-15 00:00:00.000000','Installment 32',2500000.00,375000.00,0.00,2875000.00,12500000.00,'Pending','Admin User','2025-07-13 11:43:37.004133',NULL,NULL),
(243,58,33,'2028-03-15 00:00:00.000000','Installment 33',2500000.00,312500.00,0.00,2812500.00,10000000.00,'Pending','Admin User','2025-07-13 11:43:37.004135',NULL,NULL),
(244,58,34,'2028-04-15 00:00:00.000000','Installment 34',2500000.00,250000.00,0.00,2750000.00,7500000.00,'Pending','Admin User','2025-07-13 11:43:37.004139',NULL,NULL),
(245,58,35,'2028-05-15 00:00:00.000000','Installment 35',2500000.00,187500.00,0.00,2687500.00,5000000.00,'Pending','Admin User','2025-07-13 11:43:37.004141',NULL,NULL),
(246,58,36,'2028-06-15 00:00:00.000000','Installment 36',2500000.00,125000.00,0.00,2625000.00,2500000.00,'Pending','Admin User','2025-07-13 11:43:37.004144',NULL,NULL),
(247,58,37,'2028-07-15 00:00:00.000000','Installment 37',2500000.00,62500.00,0.00,2562500.00,0.00,'Pending','Admin User','2025-07-13 11:43:37.004147',NULL,NULL),
(248,59,1,'2025-07-13 12:12:03.160421','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,100000.00,'Paid','Admin User','2025-07-13 12:12:03.168644',NULL,NULL),
(249,59,2,'2025-08-15 00:00:00.000000','Installment 2',16500.00,416.67,0.00,16916.67,83500.00,'Pending','Admin User','2025-07-13 12:12:03.169957',NULL,NULL),
(250,59,3,'2025-09-15 00:00:00.000000','Installment 3',16500.00,416.67,0.00,16916.67,67000.00,'Pending','Admin User','2025-07-13 12:12:03.169963',NULL,NULL),
(251,59,4,'2025-10-15 00:00:00.000000','Installment 4',16500.00,416.67,0.00,16916.67,50500.00,'Pending','Admin User','2025-07-13 12:12:03.169966',NULL,NULL),
(252,59,5,'2025-11-15 00:00:00.000000','Installment 5',16500.00,416.67,0.00,16916.67,34000.00,'Pending','Admin User','2025-07-13 12:12:03.169968',NULL,NULL),
(253,59,6,'2025-12-15 00:00:00.000000','Installment 6',16500.00,416.67,0.00,16916.67,17500.00,'Pending','Admin User','2025-07-13 12:12:03.169976',NULL,NULL),
(254,59,7,'2026-01-15 00:00:00.000000','Installment 7',17500.00,416.67,0.00,17916.67,0.00,'Pending','Admin User','2025-07-13 12:12:03.169979',NULL,NULL);
/*!40000 ALTER TABLE `repayment_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayment_transactions`
--

DROP TABLE IF EXISTS `repayment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repayment_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_application_id` int(11) NOT NULL,
  `repayment_schedule_id` int(11) NOT NULL,
  `amount_paid` decimal(18,2) NOT NULL,
  `principal_paid` decimal(18,2) NOT NULL,
  `interest_paid` decimal(18,2) NOT NULL,
  `fee_paid` decimal(18,2) NOT NULL,
  `penalty_paid` decimal(18,2) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `payment_method` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `created_by` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` longtext DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_repayment_transactions_loan_application_id` (`loan_application_id`),
  KEY `ix_repayment_transactions_repayment_schedule_id` (`repayment_schedule_id`),
  CONSTRAINT `fk_repayment_transactions_loan_applications_loan_application_id` FOREIGN KEY (`loan_application_id`) REFERENCES `loan_applications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_repayment_transactions_repayment_schedules_repayment_schedul` FOREIGN KEY (`repayment_schedule_id`) REFERENCES `repayment_schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_transactions`
--

LOCK TABLES `repayment_transactions` WRITE;
/*!40000 ALTER TABLE `repayment_transactions` DISABLE KEYS */;
INSERT INTO `repayment_transactions` VALUES
(8,36,118,15000.00,0.00,0.00,15000.00,0.00,'2025-07-11 00:00:00.000000','Cash','test ','Admin User','2025-07-11 20:45:22.676933',NULL,NULL),
(9,36,119,800000.00,800000.00,0.00,0.00,0.00,'2025-07-11 00:00:00.000000','Cash','test ','Admin User','2025-07-11 20:45:22.679843',NULL,NULL),
(10,36,119,50000.00,33500.00,16500.00,0.00,0.00,'2025-07-11 00:00:00.000000','Cash','test','Admin User','2025-07-11 21:04:58.606979',NULL,NULL),
(13,44,132,15000.00,0.00,0.00,15000.00,0.00,'2025-07-11 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(14,44,133,800000.00,800000.00,0.00,0.00,0.00,'2025-07-11 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(15,44,133,96000.00,33500.00,62500.00,0.00,0.00,'2025-07-11 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(16,44,134,704000.00,704000.00,0.00,0.00,0.00,'2025-07-11 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(17,36,119,4500.00,0.00,4500.00,0.00,0.00,'2025-07-12 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(18,36,120,816500.00,816500.00,0.00,0.00,0.00,'2025-07-12 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(19,58,211,15000.00,0.00,0.00,15000.00,0.00,'2025-07-13 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL),
(20,59,248,15000.00,0.00,0.00,15000.00,0.00,'2025-07-13 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL);
/*!40000 ALTER TABLE `repayment_transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-07-13 12:14:39
