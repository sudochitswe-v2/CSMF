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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
(8,47,'Admin Fee 15K',15000.00,'Admin User','2025-07-12 03:25:59.040291',NULL,NULL,'Pending');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
(47,1,6,'Active',1000000.00,'2025-07-12 03:27:10.408884',6,'Months','Flat',5.00,'Monthly','Monthly',10,24000.00,0.00,1024000.00,'Admin User','2025-07-12 03:25:58.997821','Admin User','2025-07-12 03:27:08.662168');
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
(139,45,1,'2025-07-11 00:00:00.000000','Fee: Admin Fee 10%',0.00,0.00,8000000.00,8000000.00,80000000.00,'Pending','Admin User','2025-07-11 22:49:05.931997',NULL,NULL),
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
(164,47,1,'2025-07-12 03:27:10.408884','Fee: Admin Fee 15K',0.00,0.00,15000.00,15000.00,1000000.00,'Pending','Admin User','2025-07-12 03:27:12.173887',NULL,NULL),
(165,47,2,'2025-08-10 00:00:00.000000','Installment 2',166500.00,4000.00,0.00,170500.00,833500.00,'Pending','Admin User','2025-07-12 03:27:12.173908',NULL,NULL),
(166,47,3,'2025-09-10 00:00:00.000000','Installment 3',166500.00,4000.00,0.00,170500.00,667000.00,'Pending','Admin User','2025-07-12 03:27:12.173910',NULL,NULL),
(167,47,4,'2025-10-10 00:00:00.000000','Installment 4',166500.00,4000.00,0.00,170500.00,500500.00,'Pending','Admin User','2025-07-12 03:27:12.173911',NULL,NULL),
(168,47,5,'2025-11-10 00:00:00.000000','Installment 5',166500.00,4000.00,0.00,170500.00,334000.00,'Pending','Admin User','2025-07-12 03:27:12.173912',NULL,NULL),
(169,47,6,'2025-12-10 00:00:00.000000','Installment 6',166500.00,4000.00,0.00,170500.00,167500.00,'Pending','Admin User','2025-07-12 03:27:12.173917',NULL,NULL),
(170,47,7,'2026-01-10 00:00:00.000000','Installment 7',167500.00,4000.00,0.00,171500.00,0.00,'Pending','Admin User','2025-07-12 03:27:12.173930',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
(18,36,120,816500.00,816500.00,0.00,0.00,0.00,'2025-07-12 00:00:00.000000','Cash','test','Admin User','0001-01-01 00:00:00.000000',NULL,NULL);
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

-- Dump completed on 2025-07-13  0:56:11
