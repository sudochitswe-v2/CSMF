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
('5a859863-145d-49c6-b4e0-060302cf5bc7','Admin','User','admin@csmf.org','ADMIN@CSMF.ORG','admin@csmf.org','ADMIN@CSMF.ORG',1,'AQAAAAIAAYagAAAAEG+bTd0YUrONoshmR/yr3Nh3Ms2otxXT31bCp38J1Wk/MwdDZxqUDM27dP5F9s2Zew==','4IW3BRGW3XSEYLWOD6C2GFTCOQELA3TX','193b3935-1323-470f-ba2f-3e92a9a59c27',NULL,0,0,NULL,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_users`
--

LOCK TABLES `branch_users` WRITE;
/*!40000 ALTER TABLE `branch_users` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grantors`
--

LOCK TABLES `grantors` WRITE;
/*!40000 ALTER TABLE `grantors` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_fees`
--

LOCK TABLES `loan_fees` WRITE;
/*!40000 ALTER TABLE `loan_fees` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_products`
--

LOCK TABLES `loan_products` WRITE;
/*!40000 ALTER TABLE `loan_products` DISABLE KEYS */;
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

-- Dump completed on 2025-07-16 17:15:48
