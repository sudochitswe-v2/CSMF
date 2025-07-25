/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: csmf_uat_01
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
('20250711112927_LoanApplicationFeeChanges_AddNewCol','8.0.17'),
('20250715173617_DocsAddVerifiedStatus','8.0.17'),
('20250715183639_AddLevelToCustomer','8.0.17'),
('20250715195001_AddEligibleCustomerLevelToLoanProduct','8.0.17');
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
('1f82a69a-d573-4541-92fe-94ad5ecb89d8',NULL,'LoanOfficer','LOANOFFICER',NULL),
('c493e807-17bb-4dc8-97a4-0dba78465dbe',NULL,'Manager','MANAGER',NULL),
('eb8530bf-8ccd-4eda-a421-cb677cf27805',NULL,'Administrator','ADMINISTRATOR',NULL);
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
('34929716-20c7-4f14-8cd6-379ebd7dc64c','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('493fa62b-7ab1-4e74-9a86-113adf26b4f8','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('549348e7-1118-436b-b6aa-693597074b9e','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('7f27f072-c158-496d-b6c4-dab62fc071a3','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('bc8a1ef4-6c42-40f5-adb9-7ac7ed1fc9e0','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('c7621c7e-f8cc-463c-91df-0dd46e43ff0d','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('dc7d5a4d-fee2-4ac8-bfa5-5118b15ebf3e','1f82a69a-d573-4541-92fe-94ad5ecb89d8'),
('2a451511-043f-4442-9d00-e9cd4a7b2d5d','c493e807-17bb-4dc8-97a4-0dba78465dbe'),
('6e862637-63c6-4116-91b4-ff95d875e7d2','c493e807-17bb-4dc8-97a4-0dba78465dbe'),
('b5ccc963-a5e5-4cdd-8a4d-a783a7482d40','c493e807-17bb-4dc8-97a4-0dba78465dbe'),
('5a859863-145d-49c6-b4e0-060302cf5bc7','eb8530bf-8ccd-4eda-a421-cb677cf27805');
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
('2a451511-043f-4442-9d00-e9cd4a7b2d5d','Aung  ','Ko Ko','aung.koko@csmf.org','AUNG.KOKO@CSMF.ORG','aung.koko@csmf.org','AUNG.KOKO@CSMF.ORG',0,'AQAAAAIAAYagAAAAEPFuwQlqqomTqUCeFz+02XJeCF29T4fJRa/WnsHvaabs6oLimRSwUBn3ahsMrlzVrg==','LHNBSIILZBAR4MSOUY77UJ5CNLK2BL7W','d0546de7-5d46-4ccd-aabb-d107b9aafcc2',NULL,0,0,NULL,1,0),
('34929716-20c7-4f14-8cd6-379ebd7dc64c',' Ei ','Phyu','ei.phyu@csmf.org','EI.PHYU@CSMF.ORG','ei.phyu@csmf.org','EI.PHYU@CSMF.ORG',0,'AQAAAAIAAYagAAAAEMZTuroU042HTrch2w0O5Le/RaGIE9DjSOK1rslTkN40/M4/XCtewgjpBQ1clPqxBw==','I5E46RGCNJNONFCH4LA4U6EFHZQUXED4','96bc1aba-dae5-4bcd-9123-3743115ec2d6',NULL,0,0,NULL,1,0),
('493fa62b-7ab1-4e74-9a86-113adf26b4f8',' Poe ','Ei San','poe.san@csmf.org','POE.SAN@CSMF.ORG','poe.san@csmf.org','POE.SAN@CSMF.ORG',0,'AQAAAAIAAYagAAAAEI7x9vK4BDiwR1N1P+UBLvrhJ+xuSsmAd4MJmgdcdwZplCSh4koeHjk0Kry8AaaeUQ==','OHLPHYT7DAG3EVAIRAEGH2TX6GWTDNKH','0fa6cc6f-d743-417f-9e95-fabc41f07b24',NULL,0,0,NULL,1,0),
('549348e7-1118-436b-b6aa-693597074b9e','Min ','Thura','min.thura@csmf.org','MIN.THURA@CSMF.ORG','min.thura@csmf.org','MIN.THURA@CSMF.ORG',0,'AQAAAAIAAYagAAAAEBhbPe+/Gh1RAtoWLKeIyLlguLucXYL6Tu3byZV7laXu8zMgNUVWr8ows58ZtSgvWg==','PL7RL44JS5VEJZ6IWV5XVNUGSSVMQTOV','40ae4580-2a1a-418a-b1b1-244e83f529f9',NULL,0,0,NULL,1,0),
('5a859863-145d-49c6-b4e0-060302cf5bc7','Admin','User','admin@csmf.org','ADMIN@CSMF.ORG','admin@csmf.org','ADMIN@CSMF.ORG',1,'AQAAAAIAAYagAAAAEG+bTd0YUrONoshmR/yr3Nh3Ms2otxXT31bCp38J1Wk/MwdDZxqUDM27dP5F9s2Zew==','4IW3BRGW3XSEYLWOD6C2GFTCOQELA3TX','5202555a-ea49-4a4d-b224-40d88eeafd84',NULL,0,0,NULL,1,0),
('6e862637-63c6-4116-91b4-ff95d875e7d2','Zaw Myo ','Naing ','zaw.myonaing@csmf.org','ZAW.MYONAING@CSMF.ORG','zaw.myonaing@csmf.org','ZAW.MYONAING@CSMF.ORG',0,'AQAAAAIAAYagAAAAEFhnRFLpFXWxv2l27mM8J5rFIIRrHFuShdg/h4sVwvXYuV/5TlQJdib7K8ME8RzaWg==','YWU73TK6AM6P762GXHBKVDHI4AIFBZ2J','3f1459f7-72c6-4e31-ac58-9cc20e2364e8',NULL,0,0,NULL,1,0),
('7f27f072-c158-496d-b6c4-dab62fc071a3',' Nwe Nwe ','Oo','nwe.oo@csmf.org','NWE.OO@CSMF.ORG','nwe.oo@csmf.org','NWE.OO@CSMF.ORG',0,'AQAAAAIAAYagAAAAEDOFd0yCWz184n8IfB8Y6luFUlGSPSlS5aNWJyycUyLeRCUJ2IexoBYqGC8xgOrthw==','H7N6E7LLA7HZFLRL47QDTXFG4S45ODSC','77bbc246-f2ab-4ea5-8f1b-5213701cb11e',NULL,0,0,NULL,1,0),
('b5ccc963-a5e5-4cdd-8a4d-a783a7482d40','Myint ','Myat','myint.myat@csmf.org','MYINT.MYAT@CSMF.ORG','myint.myat@csmf.org','MYINT.MYAT@CSMF.ORG',0,'AQAAAAIAAYagAAAAELW2MAO3H3uWEg7ivT8cAf/A9HpOZ5ulw4ybYYGXb9bnvK/OpyRsm/4Yl+vMDSSrZA==','HXQCWKKRLXFU5SME7CCRPSSVC55VVM23','380652fa-1c7b-49ef-96b1-4b3bed2a17df',NULL,0,0,NULL,1,0),
('bc8a1ef4-6c42-40f5-adb9-7ac7ed1fc9e0','Thanda',' Aye','thanda.aye@csmf.org','THANDA.AYE@CSMF.ORG','thanda.aye@csmf.org','THANDA.AYE@CSMF.ORG',0,'AQAAAAIAAYagAAAAEOPoIjT+fCZWlGnzhQiJblcZ/2N0Nm9BbGod25WBYraINaRBU/lSwxH+eO+/CbyDhw==','JGITMVJE6CGB4SENJNYZIKCLFEUWMPA3','a4007e0d-7c67-4f6f-874c-4435bc8fbf3f',NULL,0,0,NULL,1,0),
('c7621c7e-f8cc-463c-91df-0dd46e43ff0d','Sai ','Latt','sai.latt@csmf.org','SAI.LATT@CSMF.ORG','sai.latt@csmf.org','SAI.LATT@CSMF.ORG',0,'AQAAAAIAAYagAAAAEF68E2qfQxNTYWkZhfNUbRqZmfQ98a6zZyu19qOMOWJF/kVI4Vpe5gou0J/WH5oxbw==','SMRDITGDLMWDVX2WQOWD2LQCSDDSWZDR','dddcf299-628b-4111-af32-ecd175a46acc',NULL,0,0,NULL,1,0),
('dc7d5a4d-fee2-4ac8-bfa5-5118b15ebf3e','Phyu Phyu ','Khin ','phyu.khin@csmf.org','PHYU.KHIN@CSMF.ORG','phyu.khin@csmf.org','PHYU.KHIN@CSMF.ORG',0,'AQAAAAIAAYagAAAAEJkr+srqaA8brNXXcX5in3rxjdI7Bu0UCyMjVV5uLo265amQSNO4uTGMd88Grr71iw==','MDL3IDK74VQ466ZUXRYLD46F3DAKU5KQ','e6926041-e7ba-46f8-8e57-27760b2e3671',NULL,0,0,NULL,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_users`
--

LOCK TABLES `branch_users` WRITE;
/*!40000 ALTER TABLE `branch_users` DISABLE KEYS */;
INSERT INTO `branch_users` VALUES
(1,1,'2a451511-043f-4442-9d00-e9cd4a7b2d5d',NULL,'Admin User','2025-07-17 00:20:24.307844',NULL,NULL),
(2,1,'bc8a1ef4-6c42-40f5-adb9-7ac7ed1fc9e0',NULL,'Admin User','2025-07-17 00:21:02.319680',NULL,NULL),
(3,2,'b5ccc963-a5e5-4cdd-8a4d-a783a7482d40',NULL,'Admin User','2025-07-17 00:21:59.862497',NULL,NULL),
(4,2,'dc7d5a4d-fee2-4ac8-bfa5-5118b15ebf3e',NULL,'Admin User','2025-07-17 00:23:04.577458',NULL,NULL),
(5,2,'c7621c7e-f8cc-463c-91df-0dd46e43ff0d',NULL,'Admin User','2025-07-17 00:23:31.095793',NULL,NULL),
(6,2,'7f27f072-c158-496d-b6c4-dab62fc071a3',NULL,'Admin User','2025-07-17 00:24:20.695398',NULL,NULL),
(7,3,'6e862637-63c6-4116-91b4-ff95d875e7d2',NULL,'Admin User','2025-07-17 00:25:15.305328',NULL,NULL),
(9,3,'549348e7-1118-436b-b6aa-693597074b9e',NULL,'Admin User','2025-07-17 00:35:53.144715',NULL,NULL),
(10,3,'493fa62b-7ab1-4e74-9a86-113adf26b4f8',NULL,'Admin User','2025-07-17 00:36:39.095194',NULL,NULL),
(11,1,'34929716-20c7-4f14-8cd6-379ebd7dc64c',NULL,'Admin User','2025-07-17 00:36:45.996419',NULL,NULL),
(12,1,'5a859863-145d-49c6-b4e0-060302cf5bc7',NULL,'Admin User','2025-07-19 02:38:28.000282',NULL,NULL),
(13,2,'5a859863-145d-49c6-b4e0-060302cf5bc7',NULL,'Admin User','2025-07-19 02:38:28.000283',NULL,NULL),
(14,3,'5a859863-145d-49c6-b4e0-060302cf5bc7',NULL,'Admin User','2025-07-19 02:38:28.000284',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES
(1,'Head Office','ygn.main.office@csmf.org','9797105707, 9767678198','Jasmine Road, Insein, Yangon','Admin User','2025-07-16 23:36:57.971370',NULL,NULL),
(2,'Mandalay Main Office','mdy.main.office@csmf.org','9799512377 ','35th Road, Chan Aye Thar Zan, Mandalay','Admin User','2025-07-16 23:37:15.694560',NULL,NULL),
(3,'NayPyidaw Office','npt@csmf.org','4700700700','No (2) Ward, Myothit St,Lewe, Naypyidaw','Admin User','2025-07-16 23:39:22.899099',NULL,NULL);
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
  `level` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_customers_branch_id` (`branch_id`),
  CONSTRAINT `fk_customers_branches_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(1,'Myo','Ko','myo.ko@gmail.com','09420012345','No. 15, Thiri Myaing St, Hlaing Twp, Yangon','12/HLANA(N)123456',1,'Thanda  Aye','2025-07-19 01:47:09.596741',NULL,NULL,'Level0'),
(2,'Thiri','Kyaw','thiri.kyaw@outlook.com','09777123456','Apt 3B, U Wisara Rd, Dagon Twp, Yangon\r\n','12/DAGON(N)234567',1,'Thanda  Aye','2025-07-19 01:48:54.742263',NULL,NULL,'Level0'),
(3,'Ye','Htut','ye.htut@hotmail.com','09950112233','Bldg 10, Rm 4A, Pyay Rd, Kamayut Twp, Yangon','12/KAMAY(N)345678',1,'Thanda  Aye','2025-07-19 01:49:26.444901',NULL,NULL,'Level0'),
(4,'Hnin','Hnin','hnin.phyu@gmail.com','09789112233','No. 45, 35th St, Chanayethazan Twp, Mandalay','5/AHSNA(N)456789',2,'Phyu Phyu  Khin ','2025-07-19 01:56:12.996350',NULL,NULL,'Level0'),
(5,'Soe','Lwin','soe.lwin@outlook.com','09252034567',' No. 23, 73rd St, Pyigyidagon Twp, Mandalay\r\n','5/PYIGY(N)567890',2,'Phyu Phyu  Khin ','2025-07-19 01:57:30.878969',NULL,NULL,'Level0'),
(6,'Su','Pyae','su.pyae@yahoo.com','09400123456','No. 9, 84th St, Amarapura Twp, Mandalay\r\n','5/AMRPU(N)678901',2,'Phyu Phyu  Khin ','2025-07-19 02:01:03.927358',NULL,NULL,'Level0'),
(7,'Nay','Tun','nay.tun@gmail.com','09797101010',' Bldg C-5, Thuya St, Pyinmana Twp, Naypyidaw\r\n','14/PAUKK(N)789012',3,' Poe  Ei San','2025-07-19 02:03:20.552129',NULL,NULL,'Level0'),
(8,'Pyae','Sone','pyae.sone@hotmail.com','09455020202','Block D-12, Padauk St, Ottarathiri Twp, Naypyidaw','14/ODEKH(N)890123',3,' Poe  Ei San','2025-07-19 02:04:27.061597',NULL,NULL,'Level0'),
(9,'Eaindray','Phyo','eaindray.phyo@outlook.com','09765100011','No. 7, Mingalar St, Zeyarthiri Twp, Naypyidaw','14/ZEYAR(N)901234',3,' Poe  Ei San','2025-07-19 02:05:29.782550',NULL,NULL,'Level0'),
(10,'Wai','Lwin','wai.lwin@gmail.com','09799223344','No. 1, Bo Ywe St, Mingalar Taung Nyunt Twp, Yangon','12/MINGA(N)012345',1,' Ei  Phyu','2025-07-19 02:07:08.776164',' Ei  Phyu','2025-07-19 02:24:36.068538','Level1');
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
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix_documents_customer_id` (`customer_id`),
  CONSTRAINT `fk_documents_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grantors`
--

LOCK TABLES `grantors` WRITE;
/*!40000 ALTER TABLE `grantors` DISABLE KEYS */;
INSERT INTO `grantors` VALUES
(1,1,'Aye','Mya','aye.mya@outlook.com','09791098765','No. 20, Shwe Bon Thar St, Pabedan Twp, Yangon','12/THAKN(N)789012','Thanda  Aye','2025-07-19 01:48:23.505453',NULL,NULL),
(2,3,'Khin','Mar','khin.mar@yahoo.com','09450098765','No. 7, Maha Bandula St, Kyauktada Twp, Yangon\r\n','12/PABDN(N)901234','Thanda  Aye','2025-07-19 01:50:02.008728',NULL,NULL),
(3,5,'Win','Htet','win.htet@hotmail.com','09765098765','No. 3, 26th St, Chanmyathazi Twp, Mandalay\r\n','5/CHANM(N)678901','Phyu Phyu  Khin ','2025-07-19 02:00:00.746396',NULL,NULL),
(4,6,'Kyaw','Moe','kyaw.moe@gmail.com','09960112233','No. 18, 10th St, Patheingyi Twp, Mandalay\r\n','5/MADAY(N)789012','Phyu Phyu  Khin ','2025-07-19 02:01:38.234372',NULL,NULL),
(5,7,'Sandar','Myint','sandar.myint@outlook.com','09420088776','Apt 2A, Dekkhina Thiri St, Zabuthiri Twp, Naypyidaw','14/ZABYT(N)890123',' Poe  Ei San','2025-07-19 02:03:57.970756',NULL,NULL),
(6,8,'Thet','Hnin','thet.hnin@gmail.com','09777889900','No. 5, Zabu Thiri St, Tatkon Twp, Naypyidaw\r\n','14/PYNMA(N)901234',' Poe  Ei San','2025-07-19 02:04:55.229115',NULL,NULL),
(7,9,'Myat','Thu','myat.thu@yahoo.com','09250011223','House 1, Shwe Pyi Thar St, Lewe Twp, Naypyidaw','14/LEWEE(N)012345',' Poe  Ei San','2025-07-19 02:06:02.043818',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_application_fees`
--

LOCK TABLES `loan_application_fees` WRITE;
/*!40000 ALTER TABLE `loan_application_fees` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_applications`
--

LOCK TABLES `loan_applications` WRITE;
/*!40000 ALTER TABLE `loan_applications` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_fees`
--

LOCK TABLES `loan_fees` WRITE;
/*!40000 ALTER TABLE `loan_fees` DISABLE KEYS */;
INSERT INTO `loan_fees` VALUES
(1,'Processing Fee 4%','PercentageOnPrincipal',4,0.00,'Admin User','2025-07-17 00:14:26.593266',NULL,NULL),
(2,'Admin Fee 15K','FixedAmount',0,15000.00,'Admin User','2025-07-17 00:14:40.915475',NULL,NULL);
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
  `eligible_customer_levels` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_products`
--

LOCK TABLES `loan_products` WRITE;
/*!40000 ALTER TABLE `loan_products` DISABLE KEYS */;
INSERT INTO `loan_products` VALUES
(1,'Personal Loan  5 - 45 Lakhs','Unsecured personal loan for immediate financial needs without collateral requirements. Ideal for debt consolidation, medical expenses, home improvements, or other personal expenses.\r\n',500000.00,45000000.00,'Months','Fixed',12,NULL,'Flat',12.50,'Monthly','Monthly',1,'PercentageBased',2.00,NULL,'Principal',5,'Monthly','Admin User','2025-07-16 23:57:27.074672','Admin User','2025-07-17 00:04:22.384829','Level0'),
(2,'Consumer Lease Financing','Lease-to-own financing for consumer goods including electronics, appliances, furniture, and other household items. Customer gains ownership after completing all payments.\r\n',2000000.00,112500000.00,'Months','Fixed',6,36,'Flat',9.00,'Monthly','Monthly',1,'Fixed',NULL,80000.00,'Principal',3,'Yearly','Admin User','2025-07-17 00:04:08.893279',NULL,NULL,'Level2'),
(3,'Vehicle Leasing Loan',' Comprehensive vehicle leasing solution for cars, motorcycles, and commercial vehicles. Includes option to purchase at lease end with predetermined residual value.\r\n',12500000.00,900000000.00,'Years','Interval',2,7,'Real',7.50,'Monthly','Monthly',1,'PercentageBased',1.50,NULL,'Principal',7,'Monthly','Admin User','2025-07-17 00:08:37.240200',NULL,NULL,'Level2;Level3'),
(4,'Mortgage Loan',' Long-term secured loan for purchasing residential property. Property serves as collateral with competitive interest rates and flexible repayment terms for homebuyers.',225000000.00,4500000000.00,'Years','Interval',5,30,'Real',6.25,'Monthly','Yearly',1,'PercentageBased',3.00,NULL,'Total',15,'Yearly','Admin User','2025-07-17 00:12:13.776045',NULL,NULL,'Level3');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_transactions`
--

LOCK TABLES `penalty_transactions` WRITE;
/*!40000 ALTER TABLE `penalty_transactions` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_schedules`
--

LOCK TABLES `repayment_schedules` WRITE;
/*!40000 ALTER TABLE `repayment_schedules` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_transactions`
--

LOCK TABLES `repayment_transactions` WRITE;
/*!40000 ALTER TABLE `repayment_transactions` DISABLE KEYS */;
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

-- Dump completed on 2025-07-19  2:38:45
