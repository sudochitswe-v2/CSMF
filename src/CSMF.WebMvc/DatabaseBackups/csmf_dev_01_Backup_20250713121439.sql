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
(1,1,'ST-1031_web_01_1080x (Square 512x)','image/png',104840,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�x��\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\0\0��~�\0\0��IDATx^�`E��ݥ z�ҥ#���P@Ŋ�����PĮ�]AE�HQ)�{ｅBz�r���ٽ�\\\n�%�@���:;;;�ޛns3��h4\Z��Xa7~5\Z�F��#���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���h4\ZM1D\0\Z�F��C���\\��-�\\r����h\nm\0h40�K	k@���c[��e����t��n�_޶�/���w\\��|�F66���t��M��ܸ�o������p�x�׸�����r�\\�`�|���Ow�|��<����\r����qB��\\0h@�)�X�l�*��(.��:K��g�t\\�aw��	:~�8?I\'O��s	IIw���)11���\\�C:9�N1\0\0��\0G�(��� \n���p�\ZJ�T�t*S�E�)M��e)�T)\n���7�D$�,U�B�ZӀ��\r��h�\r\0��<��8���Ng%i�v�K��C�(&&����G���m[��޽�h�Νr�ɥ{����t�P-\0oDߢT�}�����y�� #6T\'�ע�m����J�?m;9�v���K��aT�V�j׮Mu�ԡ�իSŊ�|���[���0!�����4\Z͹G\0\ZM!cU�R��Y����h箝�m�ھ}\'�^���m�B���k�(�R]�j|+_�O(d�Զ���>���V��c\0�z\0߃�д`\n�sQ���X�K��`���hJ���@���P�V��^�z�W�.���|mh4��6\04��T�Pzi.�l��W�XI�7n�%K��ʕkhϾ=|�(a��Z�-J�8��V���\r�����a��ĕ�6au����|NM	E	�!c8q^�n�ہ��RkЦukj޼95l؈Z�nE!a�xp�R��ѣ�h\nm\0h4r�әFqqq��K�+W��e˗��eKiǶ�۠�\"(4����d\re�Ӣ��q0�3\0|����\\m�i\0X��pۍ\Z4Ax���b\0x�M(z����\\ؠ�%ԦMjѢ]v�eҤB�M����hr�6\04�\\�r��\"%|VTnW:9����q�&���Y�/�5kV�ɓ\'���=��ܒ���|�n�sЕV�Yњ���U�Yaջ�~�\'ϻ����P0�%Lp8cG���7��a�^���5\0_�m����*[�,5mڔڶmKݺv�K�_B%J����\0x�mh4�C\0\ZM6 k@� ���f�#�豣�w�^�3k�;w.mݲ�NǞ�!x��g7���o�Ό\0���\0�D[�_�Q�a.�\0N��2\06�W��e\0H �^)��0\0�%�\Zդ q/}�pٲ�ԠA�y�Խ[7�Y��.�;�/�4\ZMh@����)��Դ4Q�h����Z�n���G�<�({���P��܂~�*U������y��˷@�I|o���	��g���X�9���Tڼy3͜=�~�i\n�ݷ�bO�R%Uv�o��1�b\0@��8���Q͹B�	cv�ĨA8p ��Ӈ�իK��A|5:r�6\04\ZF\0\Z\r���|Rr�_��~������H�QJJM�.j��<��C)( ��L]p~�e�0�c`���W�^ԨaCiNʦ3�FS����X!��@�E�G5��M�h�ԩ�ͷ��<��i�����+������*�J��\r`l�6}���7�1��<f�����v��4�曩o߫蒺uը9o~H����\r\0M�Im���S�N��\'}��״n�:JII��jv:��v�l{�sb\0�i�١\r��P0v5E��FOƐ� ���t�m�Q�~��dɒRc�\rMqB\0��\Z$o��QşLs�ϣ����d埔��J�r!;,�c�\r*g�������.=�Mł߳��?���񆽸\"逿Gr�����L�4`�\0���[�u��C�L;\Z�Ŋ6\04HҦKKK����I���?�={��y�Y�cH��y�q�Fͳ`�p^������	`�� a2��݊�9w��m��kܸ1�q�bDEEy&҆��bD\0��$e�ǂ=9)���XN&L�3fP||�y+~V�,�%�c�T�^�U�8fd�4u�B]�O37�9_�8��@�I\036ox�*������)8Η�Qo�}6ҍĔ�3��I����*���e���P9oށ-mh.t���(@2Fi�؉���i4���iÆ\r21�K��)5(J2�\"�q�*�-5�(x�t�;2S����2�g5���(c�p(��\' �A͚5gC�.���J*S��4��%j#@s!�\r\0���l��m�6)�����ғ�<a\r(���\"g�z�(\0�\Z�n�wQMC�(����G��l@h�HMs�w�}G�|�5�WMn��\rL�:v�RpJr2�g�	ץ�����i�&Ծ}{JNN�9v��E�/�sV�{����87���0�SQ��v�}�j�iȐ!4t��T�j\n\n��\Zͅ�6\04$�C�Ѓ���ߧ����Μ9Ci�g��|�e�+.\0��ʕ/K�˕����,��۷�Bi��tۭ���O�K�;�}ӧM��o���\n���i|���w�j�J�ڭ+�q�ԝ|��\'���34&�K/�L�������_P�bE*Y��:y��?!F@vU�p�iǚ�p�t�Rt�u��}��K��b����h4\n�\0�\\0 �b�}Lͻz�*\Z=f���\\)��8��+�2\0�	�jǳ�m�y�ɫ�BC�������J�at��QjԸ��/�Y@|4nܐV�X!��W�ٲy�i�F�K@xX��\\UJ��cǏQ�zue	c�,�K�K��߰Q#��Eyֲ�l�fDD)�`�I���_jJ\n�7�����a�zr�~�	[n�WQ�W��ᵱ�FW��I#G��&��P`@���#4\nMw����j���d��������z�̙3e���:���P��^֖\rD���\Z͞3��V�j\\��T��]�,EF��Z�?N�L�	q�INm�ٻw?q�P�p�T�F\r����I���<+�e��J�*��qO���T�~=Vj.ُ9|����-�\n;�*ԯ_�:�o�FK(E��zt�J�<��t��8T��l���@���u�ԉn4��-[&�R��\ZMQG\0�\")ڜ�/_.ծ�5k��R�5K�֒��WN�2���%,=��R�h�B���\\��˯�ǆS��e�r^)\\7\r8��FGKm@���wƩ�\\��E�mߺ�u3�Iਝ�X17h�@J�p�;w�A`�\'���t��AJ�&;w��0��8�x5@�}�Q\n	�o#���fm�%�؈P�9�Ƅ�!jV��+fgD�N!�ʕo�\'=�[�C�0���ө���СC�Y\nq�饱f�FST���H��v~��馛�K�.���\n�?����\0��o�>�o�3��A�|��.��枻�V��ཏ=�vr	J㲠і͢A���k���+zV�S��Ȇ	�J����at���,U�K�r����y>�֬Y3C8r�+W�$����]6Z��y%�WHKK�u$P#��#�О={Λ����m\0h�R�r:)��],<x�!��}{�����bm�撽�1=?�#��.�}^�JK���r��u�~��v�o`��jծA-Z6�:ukK��������ʶˎ;q�u�CI�N�\Z7���R��ܩ5�}���4�;�����l��	}`���Bc�b�y�f|�.5��m#�|�]�6�\"�#��t�϶Q�3�fN�e��=ؙ�뮻d��	���u��QK+��,�8�/Dʗ��~J۶n�&}G��}���4m��o�n�e�j��2y/��@�g�\n�4$Ə��g\'i�p�{\0%�:�/��f-[�#����r��t��.�e��ќor/M4�B�����?q����K�N��_JO����/��R�l���\nj�\r�d�bZ�n�ݻ�����i��dU�8+xǍ7f���juPd�!6zLP_�f�8���+���P����y͛7����\r�ShH���7n�D���\"&&�<�)<���t���q�ײ^W�dI*et6̎*�*ӬY�閛���=V����}�J����H�\r+WRR\"���R�3f�:y�6r�8�C��\\�\r\0�ym�h�?}�4}��RՏ��qqq����Y�S��,ϵ�wSP@ =��s�`�|�馛�2++;�!�Q�����뮽��̞�F���n�\0e�(�Zժ�ʶ�%��w��r�}?�����m�4ȇ�{��ٟ�\\�\r\r�n]���J�b�_�f-jۦ\r�	°w�^1�x�_B�����曨B�\nx�4u�ٽ�N�����?�v5k�T��pSpP0}���T��z�ޏ���M�g\0��wO<���b�E�WG<��Զ�e2Cll�đ��}������\"���!��L��,�ٳ����عC]h��U|�$��V`�[c�Ҩ#����2�!,J�~��ǆ?B~��}\\�Vaf�u�yg+�_�Z5������k*�6j��@��\0ϙ3��g�.���_��1L��1�߃�B�s:u��\Z|/����5��\0@�<����&�\\��\'Ӗ�[�ʙc�`���Ծ���3���M�;v2�(P+�a�7m��0<,8v��w�.#�\"���x��p-\\�Xj��rx5?�\0М3L\r���B�7n����B7D�6�ebg�-Y\"y*��`aiv�?W�Ҷ���K�w�y��#Pj\"���8J��2D�aE��{Ӑ!4b�\\z�L|����\Zm�\'ʯ��o6�P���s�=԰aC�Ͻ���#)-5�6�[\'�53;~{���ڵk\'���������mZ��=z�=\0}\n�����W-�ׯ__�S�\n����c��)?�1�S���\ZjIjթ�	�ĭ�G\0�|�m�˻�F���7_Q�֭�e��Z����K;������`6���~#�+j H0�/YB���O�����\r�4t��W.���\\��2A�)4��\r��;�m��K���������WB��܁��Q#Fp�<����2�{�_Q�-�A����PrR\"��I\'g����=NM�6�(;�ؿ_�����:;<,ܣ�M0�[o�%5y��͛7O��`J۰�0c���￧�\'O{|5�Ν:{������v�61���Q��w����23j;Ԩ\r���\05�������uK�,���x��Ç9>���?�DN\'&%�ĉ�䘚`� 0ߢ�@���;M����|}2��?/��|�ќ��)t �!��ֿx�b�yEOz�W�tl��G\'�s\"�P{`qP֙�PfZ�hA�6�m3�;�t{�С�S���C���o�K/�(�P�E5;J������k�Ii����|3���*��q�\0���v�J4��	,�֭g�#�8�(_���i�����ࡃ�E�jUQ��k玝t$�ҟ��:w�,��I�}6�Nǝ�	�}-G�wyAqDu���|�7FP�����s���c}4	���4w�|�ݻ�{�}b��!x_��@̈́�>�xʑ#Gh�z���˖���s�4\ZF\0�B\"�����}��1\Z����}�І���C���8N�R��W B6�V<�\n�P�(��2e�k�.4p�\0�������Ke\nW5	�	�`:�.�;S��[Ǖ�V��8VvP����\'���k����������^�K�(\n����S\r���/Rɒ%�]�*_gE݇j{�>�<��W�&:\'�Z�J�3(Qބr��3f���8*�]Nz��Q2?\0({�Ըq�z1\\0Z���Wވ�U��2\n|�\\Rr���}�\\�\n͚5�^}�U*U���q�L���4�P��R��oG\r�A�M��o��D�CU4�\\n�ѣgO\Z���t��)�;0�T͉�O�)H���\ZM���r�@UB�E����О>��#i��-W\"�aK9���A`b�5���g����I5�w�M���wЬ�f�$���hɒE�y����;��>:������`͚�p@�����aVn6��\n���\nLNL���{��x��G��A��z�KKM���H\0+셼��r��\r���U�.=�=��䌋x&/A6~�X6T������-��m߾�N?A��w2��.����f�����U�Vj\"!b��	g�i��!Զu\nt��g��CMG�RQ*�wL������7\\�k!<>�1j9���9ii)j�\"��\n�����\Z��8�\Z�[�Q ��� -{�����4\Z���ҵ͛���SU��O�)H��)pP���9C�N�������;\\�Wx@p�w�s͟7��N���_�k�j��{�I5x�J��gV&X��1�揊���}�F49#�\r��p�9��w0�kX�!����ԓt(&��y�|���N�7�mkI5[�F4�cY߅y�ZXÅ�f�`�����j �y\r��q�{˖-|������H��	�4h� �ꫯ�����		1�*��.���3�����Ɖ���|AEGG�g�}&��)SF�S~@x�Z�hA�G�����\'�%-[�T�_b�D߹\n��V��~���/�H���մ�M0H4��D\0�<%5�fϞM=����\'|ƥd5n_�(�8u}a�*�G}�ƍ}[)~>�Q����_�uhߎ��t�^�z����eKMke���������h���r�y=\\�ڵeY_x,[��_+*D{�������1����,�����0$����;�|	�5LpXYq���mҖ��V�:>�k�n:v옄��kբ�٨��,�r����g*V�p��_~�ZT�l�4��y��11u�T*Q�;�`�1kLؼ�Z��tě7w.=��CԪeK��ߵE�t���h��io��ҦM=�.l$~�;a����(��+V���	3c�h4�A\0\Z�1���P]y���#FrIp�޽�Ks(����%�D)�,��^wvD[��!�10�y��g�n�ʇ�F�*?eN�\"8���ԭC?���B	_yEGc�p�3���t(>�)�r���e0����>0\0���\n���}���/h��u�|3lx�顇�PC���Ǿ�{�}IJL�իW����K۶m����3k�����s�t��U�r�q,�/j5ի�O���q�٧�a�d�c3]�îU�V���W�du]�h��p��e¥�����=�;��o�\0	�\rC�E���k��,�u�6P�+��/����IyO�C�zw�&���7@��\\�x��ߏ>�lJ�����_q��7\\fX�IOl��(q(�2Q��-�ɧFQh�*�����~�.ݺʘ�{�O�X=U�|!B��o�x�\rվχ7mڔI�V�X��4��>����Ɵ�ӡ\r��N�S��Yt˾	FE|��WbԠ���O��9�����l��SO+�2ޞ5|\r�A���Iu���U+�F�d��9��T �K/V��*W�L7ߤ�,0�ဩ�1\"�LB���P*�p\0G�5���Z��L)��~�I����o�hɪ�a<x���*P��\\ݟ~�a�,s,ϵ���\0�|ٲl�|J��a�����o��cǎ�f��+WJz��Q���h�G\0\Z�@)DJ�\\���裏���W��u�Dl*��#��|��B�9ڀ�&�����jZӕe�}EϞ�}*�v����֬YG�������n��Jec�S�J�N7�t���2^�p�bh2<�[nU;`;v\\z�[��%#�U֨��1+� )�t��Pm?m�4#l^Jp����_W��sI\"����b�\"g�>�k�汅��·�\Z	(3n1aQ�ҥ��n6R0��e˖ԺM���S���Ѓ�2�F��d�4�Q�\'#�å���q�$M���\'q��JI}�ҥ��f�d�RT�jO�r�+\Z5l M,X�\0��V�Ɩ��џӧ�*6�dr�SQ�^=�y9�\'���\\�󻳱�r5]y�RK���(�a~7�w�hr\r\'\Z�&�8Ӝ�v���f��v;�ݎ@v��U�A���@��s�� q|< (���>7_��y�W�\\�=���ܱqg�N��=w�wd�R��uM����]�\\e�?ܴ3����F;�g�{��c��t��JŬY��J�,)�i=�\n�}��wD��<�;�+Uʽs�Nu�L�G=����u�����p[����Uu�r��{8�u��s?q¸B���S�ݽ��#ר81�\'�q�t�\Z9J���.ݺ��&�k�\Z5ܱ��rބ��		q�a�޳g����_������x�i�����Q�i�VwHx��t�h�=���޹{��\Zn.�*������=ߙ��qq��\rK:;����,U½l�R�\n�����7���U�Ww�����=�Nu��1.�f�r��s��v�;44�}�5׸8 yqg~W�w�hΆ���	N3�Ւ�չk�k�LY�%tT�aN\\f5$��u�&���:Iz8�����@�3���1�\n�|�2z�)22BJ�ڷ��a>P�Re�����n㰣t���Z\\��ط���Cr�\n��G�=�1B@za{\n�6�X��v���\0�;9���hP��g�>�o/���/�<>|��A�6�2��mР��l���@ڳw?���2&+��A��_��U���lM�w�0�s���o黉��O?�L�V�!L֗����ʘ���?�ѿ��������K��䟦�y|�v:R��r�\"�t�e>���������o��C<HL8�R�G<���*������Qe�I�K靷�Q�\Z5��=�\'L� �:lب��=	�S�O���~O4��>�&�2�{v��5W_CM.�T��Su>6:��\0�q��t�P9l��줯������\'���\r.��iȨu�����Tg:M�1����N�ΟK��T3v�\Z��s��F�������Tw���y�)���gG)4Si%zU�Ͽvq�GϞ��k׸Y�H)%K8����m�ݥJGIM�}ܟ�\Z�ի�p鮄����K�����>-eBUFU�4��;�HI�I�&n6<%,��Ɨ<t�]�Re	#�\Zȿ�6>>^�3IKKs�1!�]��{��}�7��\'��*~���r�;w�v?yҽ|�J��?��~����W���/��Ri�;���=\0%u�uf��s!aᆋ��8�sa%�Qeʺ6n�a��mw�s�/��Q�nߩ�;�ӌ3]���bc����Q��{���J��>u���ᏺ�T���&�]��z��Q���ͫ��w�<��<#��r%�J�7n���{K��+����o��á�.$$�{�z����9>�mT��q�Wg�g�o�2Q�w��}&1Ν��$�f��Fs6���8\'JTѢ����T�*���\"��˟`�u/��<e\n+�V��WJ�T��u�OƺG=��(s(�A7�n�g��ժVwX�+NT[׬S�}��Q�)@��޾}��kxx��K�n�c�;l:yc���5k�C�*TtϞ=[���f�\ZwXǉ_��!��U�.6b>��KOجJ��lp\"�,�=��q9\0���n?���0�3��sgUV�K�-�f4�@�����;w�&״k�Ν���Ia�xKq�������z\n���[n�8G:3�g	���M�&�]�Ý��u�W�87����0n��i\0���*M7\0�\\�~_����i�]o�*]����ך��q��/\\0%���;��147���\Z���9+�N�����e\n֩ӦY�Q��ZY�,�\0J�*I�>�,�X��^w�!���jw�|��t|s̛���ٱ}�T+[	���_�Y�^�6>t����U�خ]�6�(Q��SS�^�S�3��Gg�V�ZЦMhժ��c��+虼��;2G�	�eZ�b�ϛ9�/\Z=�-�c�]��ط�L$�\'H�8||���#G�c��T�Je�X�\"u�܉x�A:~�8-_�����2u<D�cD\0��k�0u��!��*̸7t���!�Qi����dh(������|�	�t�:T��6����a�~V���\0=��#2��0��AA�?����}FW_}5�ڵ�3B�BJ\'��\rV����d\0Bm������1nm��P4�1x^mK�G&�q�˄7�\\s-��2K_���hl�?66��Az�C�+a���8�?@Q%K�]�b_�v=u�ԙ�R��]雠\\�~W��\'g��oԡC\'1B�8H7�t�����N�D��@�͘1� �m��3̸OeS�Y��\'�`EWИa(��wR���t�ϻ�ޡ�Ѳ���u�>�ݾ}��7����rdְ�P�~�j��=�D���&��R*��8��.!AAԁ\r���p\\�x!}��7|��5�\Z�T߇�-��g�}��q1Z��M˖/��#G�ҥK8�|��4���]9�H<��X��̖����3�.�]�h�/y�Қ�)t��aG�����qC��o����ʿr�\n���/��\Z5�{��&\\� .B�s�Ŵi�Ԏ�F�\ZR��]�T�7n��p|���6L&�a�<e2=��c2�>�����a��9s&�v�0��\"鈕/��mѪ%=���R��pHk�!.O�<)�w�҅����\n-w�ScF+�{�ĉ�N�l�q004������@�%�\n�����;ɉ�\Zt:mӺ5͙=�>a�6B�g<fk���dAL8���iO��@�S`�a66�S?e�%DX�!���7KJ����W%TQ�jø8��B��%K�R�K���\0���\n���6P�n�D�	Ƴq/����c���6���k�ǉ*uK\r@��Q��KlU+W�k|�ӧ/�=����.�>���ԬEsӎf���x��111R����_g�h\'�\Z\0�3â0Kl���Y���6��@a�\Z�v�{y_[��תQ��V�*�!>8 �:tH���H8���ڬ٥2�ݡ�cV�yY���T��B^k�(�/��\\&�B�tb����C�*�d~���Y�+�&0��\nh��t�5(|��4\Zm\0h2\0E��3ֻ���[i�ڵ���iJ5AQ˕�\0���I�/��~6&��*U���	���?R$��!Ԭ\0V�{���wߓkQ\"�l�2\r���֬Y3�j��9r䓲\0�\'�6�ʕ-K���b��r%�5h؈��ءJv�,���0O�F���+�P�\r��a��]2�f؋=uJ��E��de\0���px��Lf �����Y0�`1���xC��8\r�MB8�p`[&����\0fa�-������:$w�)!!�ʕ/ˊ}F�~ȶģ�������R����w�Q{~��*����T��h�b�ҭ��!�T������.yV��d���lP��\n��j.���\0���j��\r��aq�t.Y��h|kIԏS���X3ڟ����Σ#GҖ�[�RŊ�j�j���F�!g�N�t(��Y�9�\"����nV��Ȓ��i��AR=��e\0]ݯ}��7,�A�;~�K�UeY]�e�Y��&�<��=��F���4nL˗-���bOQ�r�3�����eH#���֭K����t����pAZ�*Y����*���+�@A�,@�4Cԭ[�>��sjִI�N��0j�\'��5P�����hC�2�^H�8)4���XA��\\G7m��������\n*X�ήZ�2=��r�\\���\00�����5�f������s�Q���e�O?�TV��nx�I�&���e�4E�S�b��:%K��>&RC��͑�k֬A�&N���Kj���\r%���Ki���T�N�C��p�7o�ԏi#�%f�E�߾};�p�\r�x�\"i�@x��AS|�5\0\ZQ�pPv#F��,@�\nf��R�5\0��5��^�j5ը��|�pX��}��m�6u�(�+�^S��U�PA��8��{�ŃT����NP������cj6=�P�Y�H�S��:�￩}���o��~B\'��4мEs���wR��9z�n��v����H�7�j��4���(�T)�\rJ�����ưh�hk{;j��\\RO�pj\0���&%KD���P�^�%|fM��u�⃮(�@�ajY�	�	��\\�Ǚ\n2kXX��n�\\\0�7!�k3:U��QrR�,7l��̰���o�ŊG��7ֲ�y�P:�%3T�0�s*\\v�^J���I�)t��w�ei�c@+��V���B;?�Ӊy���w�ܩ3mٴ�~��͞=�̟/��T(W�������_�G��>}�ȈQ�H�i�do<Hj�0O�z�z��eK��1OdA�*�)*�o�S��ܔ0r�;�&r��%�k�7�\0(Ƥ�@LHL���x��y�YJ�}7����p���L`���Mc G����IR�aR�?��&c���\0��z�����r6T�ASY���U����G�0�a�o{�+_�U��?A�\r��{=�<�?M	�t�n��\0�9y�du��\'v||*Y�$]s��ԭkW\n	V+�_\0nݶm�����c.\0D��	�1�41��)tàX�;�s�.���̴3㯙�ʦ�]�)\"2\\V����ԨQ>����t\0�\r�{�?� �����O�i�8�\r�b���Q*Fu$��}���M.9�\0@��o���6��8�?DasX�y�)љ�V�w�9Ҏo�0�˒eK�e�V���Q̑�s��6f�{��w�U����_�1`��]p��cA�~�\":8Y?������<5�f~\'��M7��P�cce��&���2�D����񟎧[��4N?�˔��M�(O\\���t,�N�Y���o��-[P��u�o6:`l�6I��M�<����ꫯQl\\��iBS��}\0���p������?N?��TY�9y���/YW#�9��eh̘1t3\0;v�	\\N�<�猋��\\��K1�\r�Ţ�ҹ������-�Q��{�ђ�P�̆I�ƍe�A�$8|8�6m�D�	������>F�H;���e�B�5Y���/���������h��cm���Q#GQ��5d|<��`��~�I:�b��� zl�c2%5V7̠���,�OO=��������	���r\ZW�^�F�!��\n��i���{﹇ƾ�V�	0(��Q3�ş~�F�9�gh������k��JQQj�\0p���|�\r�bz�C�`�|��M�.����N8�GN!��s�Md�JD��ϻ���(99U��&h�L�rJMv�V�*-���Lk�D/�K����W�����l��� �����G���ïqLΙ��/+����c�s��@s�7ZLŒ.F�UT����ʰPW�����8��}�=7��7����-Q\"�ڴiC=/�I\r6�ԴTQ���\'�_���qSxD8�1z4�y��H��U|(̷��ؓ&}O+V�޽zy\rj��V�?�X��1ϣ��&%Ĩ�c����ꫯ�h6�Qc�c\0M`�\"�\0��0h�8��~�m*!���Ms�\r�b8A������_�(ĶW�e˖�y���:�눼��S��M/��2����dᓳ0�:i�Fu%7�ZP�3U���L�����;E�Y1�yA&��/,��S�_�`E�Re`@ ba5�\0k�H�����C0�t�ֿ�\'�Z��0@Z�L6�6|O>�Va}\'�3��L�P��6\r���%�6`��Ϝ|!�U7�����i\Z��b�`�ܹ>���v�Z�׌��F��/�������[n��\0kd^�#���73n�7	�;�m�6YF�F���F\01��/V;s��\rF,0ΩL�*�$0l��2np`�0�	�b��ƛh���,�P͎��&ce�shc-S�4͟7�jש\r	ǧ��s���ի7-\\�P]k?�7k������ܬhQ��~	|�\"�Ԇ�J�,A�ʕ�re�S���l���R�JQHH���D�?J�M!`��F\0�D�q�� ���ӱc1t��I6 ���#�(�L�>}FV)�=}\Z*��8����4����S��ɓ6��E�����ϓ�{�J�Ca�i���Ѓ��\0���0EɧwxKk�?vLf�D���\0�d<����K�@�#��p��];e��G0E��������������| �J�F,�gi.N�p�O��?���7o�ZB�\0�A��Ï��[���0e�U�zt�A{�����`����a\0`{�����/��\0.�\0d��EK��=�:�����=�Pȱ��=�\Z\Z&U��˗����S��e^L[Ȋ= \0%z;o��[����IwcZ��v��n4�����m�{4%a�YeX&%%S�X�=���w��9\"�\'�H3�#�i�>���\0qW�j%\Z��t��I\Z;���,Z$��{ܸq԰AC1�PZ_�lX>�TF �^|�\Z��pÀ����ʾW��ŋ�#��6\0\0�}�~�9�~��.����ɁE�4-�\0�1?)�8��Re��awc�4O�)�oa\0Pz(I�=g5nܘM���gΜ�i�����i�UC�6i���ɒ���m�����VH�<����n�\Z\0gS��-�DU�T�Z5kQ��\r�i�Ƽ_I��1��f�q�T�/V!o}ǳ	�����ƙ:f��tn��0�TS��v�Q�q�Fڴi���p��A��P|l��&��\nԴ�e�ȑ#F���x�6�_�ǽ�8\"<\\j����(\"2��g�8��O=�$��6\"F�V��k��V������\n��䑇i	��8s�\'>Κ8�❯��\Z�𣏤_��\Z���#MQE\0!��p(�O��{�b�����\r\0�`�׿���0���&��~�^~�����!�۲�7�����Od8`\\�i~׌%K���I��\0Y+9�jبQ#Y��U�VW�e,:���UPU�qnﻘ�8+��_�m���y�~c�\Z.��c67;V,(	\'\'\'Ѧ��h��U�n�:ڱ}�,�k}7�|\0Ʒ�J-��Q�_���ѣ�tDt�q�q�X)��Z�[�����.Kn�������!�0�.����gK�(�����h�[oQ�(i�0�=��m\0\\��d���X��a.Q����O5��(͸%S��4���l��4i�LBM���ԩR}�I�����G�iXwl��~e-��gz��(TC�+�pI�z����d��\rr	+q��ro�lP��@G5�]2~���u��[�P��0��Qa�I��_�|9mݺM��T��*���,o��1�|��!y/~�\'���/�q���/k�N��5	�	�ڴn#��	��b���ԩc\'Q q$�k}g3O��W}�����x/�o���R\0\0��[x8�_�m\0\\D�S�A�b	ݗ�t���y��ϱ ����^y��qu�Zi[�ܵ+�ٻGĝ��\0U�轮.M�w5�<;~��?:R���oݦ�mӆڶmKe����,h��h;Ʒ�m	�����\0��E�s���*��,�ŋ�Қ5�)!1Q��hm��s\n)ra\0\0tr�;��첶�#���_d^\03.�>1����݇��c�g�Y�k�n�c�9.�g\0��ǣ�<B#�xBj��L?����@\0(�;��ۘ�c{�8����MA��Ϙ`��W�>d5X�l]٧�{+��T(d��=��@�ҥ�S��Ծ�eԴiS1<�9�Q��U�la��u��ӢE�� XD\'Oƒˉ����Tօ�ڵsG��rH�7�t���ϲ��y�;�	�?�}\0����!C�Пӧ!���9��xW���Y�#+��c#G���=���y0�eu���C\0	R��?���_���L�?�����p�\'u��ed\"�a�\Z\0��ͷ��=�ޛ�c[�6\0�m���kKG���]:S׮��K.���V�|	����kq�6\0�ƪ�8��	w�D�%�8N�[6o���KK�.�S0�Q㣢5K\n�\0@�.-�i^��2)!T����;wJ�5?M�!�A&�0�_{�5Y��LJ�㭲iN��J>�L\nc��6zt�D�ə�8�q૤�0\0�:+���tۭ�R�%䝴pq�\r�|>8T��M}�ĉ4|���4?\0��!�06\Z���*\0p=�ٱc����)��۬kd���<��S��G�u�h\0&3��,yQQ%�_���S���d����sII\0/����p\\r�b^��k�ѯ��J[�le�7��U}���\Z\0�a��^{\r���T�REZ�a=��1�s��ET�R��y������*:AJ�@Χ�a��*U*����Z�VM*YB���\"?��_���7����Ujn��姜�thH���{�܁�0�6.l�p\0�\0a�eJx�AJJJ2e� =���ʸ���|��@�_�\"TT�%(�2��H�jS��!ve߾�h�\"��ϴ��c�(����]�V�2�k��):���Y\rƥ�<��V2�;����D�900��!+7N�Gbbh֬94�K؇y��_���@�t��{�MP�Xd�ȑz��e,��?�Bݻu��[zכ�a��-tE�+�ڣV��F��}�]�Ĉ�e�>դ��T=\Zj�d��%��a�����߹�d���\ZԾiՊ��t�(�ꫯ�S�N��\\�h�������hKD��Κ��2\0��oT3�9�O�o��a\\�<����R�@	�	h���˾ǘ`!s��W�N���C|��L���H��f͛ѐ��e2�`�1�AWQmY( �*��u��M�]&#Z�j��xY�v�|㋰��\rr*i��3>5fi��<���t��\r`��y��Ϛ-!����/��&�@V�V���S����U����˖��H��2\08�p������ 4$4S\r���B\08(�o޼Y&9x� r��\0��9d�<e7[����~�6m�J�BT�o޲E�(�6\0�(��ʲA1k��2,�O��ŏiQ��5�>N�P���1�nW�sӥ׍Kp��U�Kx�����H���x��w�-u����O�i �@�A�&��С�\0j������l| �P9������������<}�4��R,��Z��G�_Ø1o�o���bIj�QDF�T�j5�:u*瓺r�âp�e5\0�lO8��;wȐӄ$�pɩ�\0\0P��,j�V�*�r�OS�q��ۚ(�#G��СCi�޽�D\n8?J�4�_%���d�ܩ���vƹs���[��>DZ^2�\\j\\a�5V�X)�AA�r�	�49�\\����x��O�ҷ�M�C�J���H�n���y��!�_��Ʊ��7s���0��� -���0���P�N����o�>r��ŷ�O\'W�|�|`~k�b���0�^����ѩW����`���Y���KlFQ���{`4���F�\Z5�v&���of�_3d������5�0\ZkA�?��\r�#��Y�9�z1�.�|��1�سgOO����]|�#���X��0|��G�)3����8�b2\0�V�~�����F�Ƣ(ݻu?�9���`\0�9J:0BJM%����	rK�#�P�x/���U��ν��M?������vOG\0�Q�%u���lbJ���/�q���v�R\"*W���7�4q\"�x�R��{��ܓ��1�l{�4\r����+���y��HsW]՗.���5k�\nFΠ�S����?�K�H��$�~���}e1�ǽ3������~5��,��w�>������d�u��̡^|��ِǺ�<�m\0\\� �����\'�H�_CK�̎���M��gEf�:?���9Ɩ��ZP`�)\'g��Afq,4���+�8�{51�Çc�o�~�*Y��π�0�!Q��MC��L?�0�n��&\n�\0�����.��:��:��x_y��l��5�����=��1��*	Ø�~�$V��SH0�������<b���@��HD���\Z]��*Y��Wq(�v�����Ӑ!��l{��|�]w�I��]�	�+a�{V�^M�:w��狲G	�~ʔ)2��Ԇ�>�,F\np��p��2;��Ӱ�.7}��쾦�g�e�j���\\�>\0(����s�c���b\0xA�7cağZmg�ٓB)�mڴ���IÂ�䩓t�e�Ѿ}��J�#�\'\'Ζ�0*\0���\'����a��C���*x�b*<��M�Y��!7��@<d����\n#L��G}7���-z�O��=͜�%&$ɗ͔N�1�0���C�+W��?���v�l�ꙸ\Z���_��_{��W(G˗-����y�µ��eB����\'O\"��c�FU*W�uk�z&�Q=k�,6$�K��nvL0� +q^ٻ�԰���N��4�\"4�d,T�cZ]PXg�kg��Maa�ԬY�B�AM@ub�RQԠAF��U\0��S�b��뮣����Ç�����!ԫ�4�	2=+�з��f��,��e5�|;|S�]�|9\Z��#4��O�WHN*����4ޟƽ���2�\n�..�M���t>�뮻e�g�쑌��ɚ5kd͓�N���y�q�w��<�޺e�z�Ye��\0��C���(����IsA�k\0.𙠌���u�b#�ǥT1g\r���K��&p�ر4p�@���{de3܃�fϞM�Qba��~\0�\04}�t����q�FJJI�K�u���)y���Г ���e�aD	�y��t�g�:ux_=A���𾫠{�Y2_U�q�f��iÆ��Tz��26u���t��=�\r�7�|S�٦��h�-��/��Jv1�kժ����G�P׮�$�[�5�ʖ-+�tѤ ���r���\0�m�Cm&���y�D&̰A�c�A�Kh��S�z�j���Pu}�Ut\r�2sll,�1���jw*ߚ.{p2�����W_��o�M:�}���z_�K������`�J*4��������2�L��r�K!+t�pS�Z5�]_�ѣߠ:u��;�xQ�a�@�:��ch���üX�Fɘ{�\no�����w�޴q�&z�����~�C�j֬�Q�&�>����\n܇	�P������\n�����Wy1���\Z�����-۶���<C�bO�aQ%�&3z�\0����߸q�d|�[��_c�+�ڞ�L���Ǥi��l���#�`\\>����o~�J��~t��wP�j�(��9~���t�k�a2��7+�gP�6��\n��aI���`\Zr�\Z��S.��]����e%�|�`�u����>�h�٥)�A֩]�z^�K���:�.W\Z����4u��Sڵ�G��I�&ќ9sd�C�y`T#<x4j�0k�c�?���\ny��\'O��?�@U�T�&�����fI��\"�����_�������wT~�$�\Z�B3~�_�.�y��h��\0�0�4p�!q��1dΜ�Ct���r���8�gƼ��[H�*V�}�y�\n���F��/�����Pc�~v�w�i���%͙�/-g��5;�&�4}�����\ri���Q�j��h��Fi\n^g�+d�`����j|y��5�Jo����y�\Z����n߾��=�v�TU��4�S��)]��ewϞ�ӟN%����a�t�-�Ⱦ�o\0�3k��{U߾4m�4JK�\Z\rM�6���L�jU�����y��o�ɓ�W��wL7:�*Q���B\n�\rQ���vq�9h��b~T�oٲ�����t����xA���&M���?��r��Y�������W_�>}��֭[�S�\0aG_�Ͽ�����[ڵk\'\0e�Xҳ(d�@��\"#K�Лo����{\n�}^�Ġ�I��Y9~��7����.���d�i(��%����U+�Y�\r5X�����@-*בod����en�a�!�DW]u}��gT��5�a��.]���N���=������W��f\n�cFk����\r�\"\nJ�(�c��;�������sR^A®y��a����g�|�\0�Q�X�L�L��}(�#q͞=�F�M�/� |���\"�bO���/���*W�,����-���t�}����6\0���J>��@m޸Q�Ԥ��y���2�<��.�w�4x�h\0\0�za����J����o�C�\"��b�A��a��7�|����((0@\0E�S��PA)���5�1�wQ�����Q��׭[KW^ٗ8(�N�����qiS�������ǳapR5I`v0����hѢ�4������ߡ!�t�wЧ�?��U*p������hr��f�.�Q�*}��{4h��2��\r�:;�dr���B9_`�J��I|�!�����i�Se�V-[��|@\'^	|��1�֛�=���Dޅ����<o���/��PRR�g(���k\0� �$P�b��e[�p��ɂ��@4�߀~�e\nըQ#� 3��3g��j`�u�]G��w5l�P��u���du��q߿j��L~�=����ƞ�[�f\r\Z5rխ[W\rA�\n_S�ys�ܚ5���1oʬ~��z�϶�N�p����������&�@��4�/r��իe>Lɫ2�\ZxW&:����s���r�o����SO?ņ͇�U%��l�31�hʔ��E�f��F�����P�@��ja{�炙��\r��,���P���򖙐͒����6����i�&]F�X���_�h!mظ�֮_G���AE`P ���Hi������׳�_�w�\'�CB���S#(0����?=��3��9\0��#�4�� �JK\r�X��`�z���޽{�pV���]>ijZ*-\\����Ӈ�hI9f�?O>���T��<&��ZB���jՒ~��jۦ��Ckh _0Zg����O?��<X��x�hް~=��ߏ�9�b$+V��9?h��a����e�̿���k���Pn�pR�.�̄���m�H���@�\n-Y�D�!#\"/�Y�N�D?�:u��,\\0�|�ͬ\'�X�#f�?�~��7�i�O2iIt�h6`˖K_�|gv��:7�.S���?\Z<x�d7;������t�f�����w�*n3}�O~K�|�ѣG�_6�/k{��\n(�-y[菰r�*�0a<p@:b��o��F�V�[�ъ+d��5k�H`���4`�C��#����CR{Ѿ};) Hm��i�e�&��&�\">�קN�����?,{.��9��9U\r�Q�m��Φ��X�F���ޓ�ÁLH4o�|�%+�y??��)�۹t�2��?P����9�̺n�z���˥\0��m%,8D��� s���:Q�#����R�\Z5d?�0�M\0�B�F;w�����S�qK:t秣����fdd$�z�-t��C�*�X0s�`Y�?��f͚%����bĈ�4j�(Q�O�;V�l(@�O��\'\Z>|�������+1��i�&2)ҽ��G[�l6����\\������E^��\\T�\r��6\0�\0�\'@F�d\Z���Z:�V>d���fS�m�i�tY(ZT�����)�l�aJ��w��+��x��|�\"S�R��E%J�����>�{eʬ5{�l\Zr�b�X���MY�����ܳ�J�x_�S�=�ǆK�(:;��Loo�����J���㭷ޢ�s�r:E���(��7U��9�M>g���#N����R��(�L<r_������a�_���j(F��:�~�-ϼ\0���K�8����/}��GT�|9ڼeu�ރbcO�A�_c#��t���@��	\rS5�>2Es���yƌ~T��4=j�(���$��V�n���\"d�\Z5��t�2�)c�\0�\"%5�JGEIf�	��@��Il`qV,]��\r�k�T�	��`:�G,Ȃ��hذ;h���ģ�-4��\0f���ɲ�uZ�K)�Ly֛�ƧfY`�����(�	[2dj0z`����o�	`��{^|�%�g�l��9k��<���]�(;rV#��t��cƌ�gDHs�6\0�?y�*�B��t�����~��GQ���ld��gd����*B�s�D	\Z�v���L�n��(Pm)���9t��\0P���\0����_~Q�кu�>m���Q��@xJDFJ��A�k��)r��~�M7ғO>IX�7\'�Xp�+W�^y�i\ZP5�^���k�8�L�	��Ȓ��o���MV�aa�r���P��|����<\rL{�/H�S�=}���&�h�<�\0%�Y�P������%h��\0��N|=/�!�πJ_�b95oт���j�����ĉ��תuk����(��a:q��޵�^y�U�T���-b��[o��~��g�_�4�ڼYs���Ur@ej�D���̠I󗗧��{W�3`�`�64E\r��A={��Ŧ��Jq�G6s\n�n�z���7�j�<��~����h�\"r9�@�O�^�&4��{�\Z-`W�����+���i4���WY�.�a����^��H)|��І��B\0�$z��!3`����1��lC̫�����|��d��J���]�d,1g9�����ǎ���ϗ\0##\"E�U�X����c�v�\Z.A\\-����7i�����ʫ���_�����a6A۽8�{&jԸ}���T�Nm6���FS��BK�&MӇ�/+���]���T!\\�ѡCG������*z�c\nq\'+] g�Qo��9��ԥys��UW��B��A���y����6n,�,��?�w�񟎧ĤD1\04�m\0�G����h���7�@qPr���L��.�;y}�����>|{��O��\ri��9�����\\5<Gu5�q���R%�o���;����~���/�ɂ.ՙF�ǌ�7�x]��g��|����ԾC{\Z;v��*�G���-��\ZMQC���Z�Je��d3M{��M��Af����iÆ\r�\r�YJ��XԜ���7���ϛG�\Z4��ʨ�ѱ�G馛��;���}�q��e�lu���a�H@\r\n>��֭� 5���Х�󇖦�$x(��=vT�Ŝii�ٌ��`c�Y�U�����ʗ� �}�·��߳��)zsF\02�رc��L9j�ĄDzx�#�λ���_zI��2cJ������L�ܳ�H;�O�rZ�)����t0�G�y�z��!�VQC��r���~�}�����0A��0��?N�L�;q?�����J���?լ�����6�[Ɍ�A\\\\����qs��Ss�У\0�1�n�\08Kc�z��}��Ws�sF�(|�ѓ8=���Ή6r	\0���~����<*W�,5i�D͘����L��y��aCxn��&rr�Ef�CMΩ묶$24��܆��D�aw�!�����7R\Z�}��a�	�����������g��>r\0�`,[��J@��>��\r��e���r\r�ktt4���t��7HcS�8@ӧO�{ﻗ�9.�BN��G<1Bj\nO�<Iݻ����ȽVrV#,�?#��/�����b\'�k#�ܣg<� �#�`���lu��pR\n�`�)232�Y�`�u��u�ԥ�l��ypP�u�֑��P(>\"�Y&9#3�1�|�B�\0�#��_������%Ӌ�3��\\���nwS``\0�v�mt�m�Ii���2!�{5��VQ����1��9P-�s�k<N�.?���0f�lӺ��KX(��f�D��]���.k�C�J��Q��蓏���~X�~t��Ij���\Z\n\n`�IX~L�����q-����U�0Cl���a�F�ջ��\Z�Ŋ4�]p�At��߱���{�f\Zj�����g,%̔�b�\n�ǐ$�\\k��X� JcA�����Ƙ�2^��_�v��q�T&��?�:u���6wd\Z�w��@��>v݀k��R�ge\0h4(.֙(�6�s��#���i?r\0��\\��4{�,�_�>�uy\n5��\'+��qOBR\"�9�>g�M���t\"�`x���[o���09�>8�ߙ�[n��~�U\r�� /j�z��7�L�_M�����*�4�K���&W �áz.�3%&���XH$��L�hJعk����\"<�\'�♰�1�םÆ�#G��c�dQ �ٵ�k��ϊp����Cр�q	EUOj!���@�۠n�;���V΍��x=y4� �;v�B\'�P�}�i��R<��P|U~�9,dԯ_?���g�f�ê�X=M\n��sJ�5���g\0=��sn,����1�x��u�\n��*4��6\0�!��H�;z�h��/�/���˂?��^z�%�P 볰	�9�{��CS�L��?Ș�i߮����0WA�a�.�\0pSHH =��}tu�~,\\ 8IZ©�\\L@�t�t�M7�q��k���,�l�B��_M��(W��H8��y�-������E� �D^o��6����T�F\rx�[^V�Z)�v���/\'FA������\n�Bsn��9%q(|$x̪�}�6�ۢ�or�d��P���:�>f4��w��h���~��={��3l�_vY[�\'�*5`n}��p�\0��hRX�r�dR��+?�����%�T\n��}�����*B�����2@s1b1؇����r��{�祳l&�d��+WR���S�Řg�{���|@���w���5�ϡo�⅋讻�)z��7��:v�\\py��W��=iÆM,�a���ƢFh��Ҝ;t�sJ�i�i�c��߿�L̃�o��ş�3�g\'g�]��/]F�*U��;vJO^�#�����g�Wl�*U��V�J��NѡÇE�˵�c�a��7���{�P������:U�����*�\0HGo��`��۸$4�Q��a��xO����n��{�}.u����y��y�TԘA��V�ZԶ];\n\n�M�6�ҥKqBj \\ƚ\0����g���zUr̊�~�s���t�����e�x����Y&?j��J�>Ki�N�f�鷦���9\0V-�۸�q���7�>�$n��L����|ϊ�&|:�nz�yP�3��I�F��@(n��hW��ԪM�Υ�˨Q��t�WR�n���q9S�W�}eƥ�����\0@[�A�Ӱaw���3u\nq�\r\0Mq��::���X���tdH�ss+|���E\n����瑥�8�Y��#0¦s�.�޻��%��yd�5�ᎄ�YFS��`���Õ/5�|η?�����c����h��++5�6\0�P�qg����1�\r��x���ЭkW)��kk��m|0��8A����PRb���u���;�޿���\Z4`f@�#Gb�c�N�o�>㈁�\0�����?=���bXŎ�Q\0���:\'y��_y���X���<�\n�hJ����4\0\0dJ�/��\r2D:���3�A^-[��|�AZ�a�t^���IS��\0`J�GH�E��\r�IC�6\0\nS�&`�br}4�:�ʟմ�)�<o C`�o��B��ѥ���l�Ϙ1�Z�i�G8sJ[>~ �:v�#�F\'Ada_���< ����\'�Ю覮]:I�� YT����i43�����F�F���ڶeEjI�Y���w�#8�/XF.�D�@��Σ�o���3(��8�@)�W�޴~��N��#�s�&�����\\jD��p�G�k�\02NZZ�,́��2���x��{:t�U��(�΢L�J�vh߁fϜIo��E�ԟ>��_����0������K�.�A%�����]C��1�Xf�� ��р��`Y\ry$Y-Kʗ/O_���Q��Q�����ٳd �Is��ɭr��A\r��?���M�(�M����E\0��+z�c\r~��@��(�\0y��2���?H�_�օ�|��\n;\"\"��?�(+�t�=�jw/�d�N��{�=��_3��k���}�Ү]�����3�ʕ*K5����t��hL�_���ګ�PŊT�) P�߻w/i���X�\'���ǎ�\Z��{���s��rDj�r����\0���>��L\"��<�@!�h�[gX����2vV�@Fr��߈v䫼~OU ���>��v�NﰑQ�^=~6[v|B	�_�O��~��=��3t��a���´�j�_���p+B�jn�{.k�K!J���>|_VH�qY1�x�F�� 8�l۶�yd8%�2�$��h~CV{��i��W9��{���]Æ�0�t�W���{�*��W\ryfʣ��p.�L�vm/���0O?\'-3\n]P ��a�\\t������\r���.�sb�m���7���mlX�d	��:И7�T�g�s�q8�5����7�t#�\\��n�q��ı*�ɓ\')>>��i*��~��b\"3��f<{�\'E�c:Q�P��\ZM1��v��R\"Ϫ��`C���8ڸy3�8�C6(G{:����+M\0���ُ3���<0D%q!��	�ɪ����� M��\r�B\n%ꕫV�Bs֭lұ,���L`n{�(;L�s�3�\0b��%K���e����da�Y�fR���(������Yܗ��l�P�}������,Xܢ��=��h4V���\\���t�\r7�&����3��?�أ��\0����/��I�U�\rg�CĂ� ;1\"b�ƍ^�k\n�\Z`!\0�E8P�~ꙧ����y�u��lU�bqg\r�P��(�ǹt�Ʉ�רN���P� %wvǏ����Z��kמBBB2d0���J�*t�wP2[�k׮��o��?c���9!�����\Z\r���=��ɉ``��.�|�FS<�����Ҵiڼe3��1�~���f�}��R�ʕ�e��1V\0ԦUk����ש�n�\rWaa��2��_��g\n�A~���I��i��P`ҟ3	�4{�l���;(՘yK������M�Y|	|����w���W��j�ǭ��e���zc��;\'C1u/B�@�Z����R�޽�k�1��|���~Kw�s�qĄ��0�J�D�5�^�L���vQ�:u�Ï>��0��eV8�l��h�=��`��9y�$��I�5�96^�l����C��[0����S͚5\rY���A,��#���Ų*S?u]a�Q�k�&�a+\"\"�~��{Y��\Z�F�6\0\n�IM6�W-���3�&ȶJҢ���%;] ���>&������������{B�)i�P��`�޽�nt�|�P������!���Ͽ��س�Wy��4����[6�,����`>�d�m��^���c�Lӑ�}ꩧĐ6��PX�q�ٲg��N�C=LNc��C�:t��5�C����/�_�H|����7	5���Z�h��A{V�Z�r-^��2�:�����P���������\0�q�g^��Lb�(8�����3u�؁>��C�P\0%&|F+�/�c^�_�9���G�?BժVS}4\Z� ���vQ�&Mh�]�6��y�jT�\rt�d�x�c�� �/��EG��}A���՚��gΚI�v��\0�VS�i\nm\0 H���GbŤ))���G�����#�2���l�30�/�\r\r	�))0ƣO���\'�x�z����-[ƙ�-�X�X�f\"a������X�N�!b��h4�a��P��݌���S�=�,mݺEFI�$N�<%#��p��@�En6��yEhpU�R�ڶmC�ڵ���\\\0�t�t}��W2$rU�,�@ ʎ2�ѯX��Bqqg�,�㓸�Z�j�x�b��*J\Z�;v��U*S�ҥ�a�J6��\Z5��;w���`�2��Xs�-�PLL�̾��h�AK� u�֦��OV�d�A@�/|�\Z!>~h4\Z�Yp��g�4+b��>��T�[>�+L?;thO3gΐ~D��|�>��#�j���|�싿jiaޑ	�J�*IU*U��ի�¿�Z�jM��֥��pv����jݺ�tRV��LV�{\'�e���?��Z5kQd	o(qYܣ�=�\0(\0�ph�?z�(=�����?ȸZ�r�y\0���{����C�c���ɯo߫d��2�e���.�q������Z�r+��t��)1JL�\0n��#�ٍ@�e��@}���.�IR�m�\"���d���5<���{��(-M�ϲ�o��\0����{蟿���[��3Qm��	�Fɵ��@�Z�\ZU�=�*��˨e�T�\\Y.�zV�0��F�O�ߧ�z��z�-N���C�ʜ����?:�~�!��F�wdQ��iΎ6\0\n\0(V���ms��n �,��(��Zṩj�ʴx�\")�,\0F�M/������V�AZ�z��7�B��w:�t��ںe+mڴ�֯_O{����:$5	(�g���`\0H�b�A&�wA�$�7l��t�m�%�O\0\ZM��Ul�l��1�3_�\r}������&�~���ra\0X�mȳ2�gը�RT��=j�7k&���E�GH$��!������1\0�Y���-Z�~G��߇,�9r�?U�V����AU�VQ\"�Z�-�{4�F\0\0��S�M���+|Ԛ0so\0�\rJ��*=��p�bꞓ�OQ�ƍ<K	8��}����f������>}���y���1����p��A�;�g�D�w�ꁨ��t�\'���O\0\ZM��Ul��\'��vJ��}��O۷�`#@�!U�.�\0([6�ƌC�۴�����Qۀ��p`� �,	r6\0d����(�`�)����2w��YƎ�6]}�5T�\\y��I\0��Z���	Jѩ\\⎍;CS~���v�CFQ�� s�+W�Kӷrf�f7���o�k.V�X�v0��|��/\rఠ�_2\ng앫WӢ���7�1���ֽi��9�7Y@�<�4_��B�gp>�b�z^��d	�ՙyy��y�; ���9��c�Q|��Y�:խ[G�ݷ�_P�^?��%F)D����r���X��`���/��/�$�C2��^�gcI��=��l:[:��e�ĉ?PB|\"�7�Ҝ.�g�N������o�@Q����@+V���4����PTT����a���G����rM�F�芞Wgs���K/�hx�)<�t��n�M��$�k4�s&�2�F�>\0����Lo�5V�1�Ƣŋ�_���Q�&�e�����?j٢%:��������#F��ʿ��j�*ڼy�px�fLhr�n�\'�4\'%�$Q̑#�����s�3^PF-^�@��S�-W�6nXO%�ޮ��sߧ&P�6m�w�^���>,������fa}q�\'t:���g���ґ�}������V�מ}�m��IM�6���{WJ$6�%5\Z�9!1!�x�Qڹc��sA�\r\r\r�ٳfQ�\r(!!�����{��U}�z��Go���n`��&k���\n�\\**J�1IOw�<\Z:��?>�i>r��+����+�C8�>eJ.M��@>IKM�x.��^�����ZJJN1���#�<Lc�x��K��o�$�H��ƒ�m�N�X��v�:Ԭys�ءU�T�J�*E!�!te�+i��ᮬ\r\0��?���ׄ����$���ќ[8�^���qU�\'�xyW�f�E^F�#\\�9~⸴�Cy�l�J|��z�]�w��k�ɐ�7Ǽ)C���[6�|��<�R���0��0\r\0\0Ce֬��N��Y�19�qN�w��O0��رc\\~O��U��[�G��m\n�	�ݿ?\Z5r$իW�3gFC +�\0�;u�$�pna���6<�#@2M��ed]��k�J�a(yO�an���y��[�ҝwޡ�;�m�\Z�9�岉�k�_�Luq�6���k	�.��t�S����T�5h����E�<��#���MP@�P��o�^j&PK ��\0��x�>\\�A	��g\'C��m\0����c��Çeu�}���W��j\0����H���H\Z0�Z����\'�����d/���q��Ѥ�\'щS�Tf���@y.�jgံ8l����5\0�����U�J�|���/� i4�B!cfCVF\0���8qR��^s6�3\0 @���?�P�v�qP�Q��.\rs�\"�e˖��bX&\Z��/v��6�@�jU�?~�\n�+Ȥc��@��t��5��.\\H����/ug�������ڵ�@�>:���ݓ��� �7v�X������� ��L��q�7S�u3����{),4L�ͳ7\Z��P��8�h��e�P��j8?�,�m��_{�+;��յ��̝�/]}��t$�<�F8��D\n7����˗����4r���Np���\0�T����a��U�4_@�9G�Ǐ�-[�c�{�:h�A�ʘ�)+W�$cn׭]\'�@XX��S�p�כ3����X�Ԟm۶�m�Fs��͓�8o_ѫ��?��5{�.�xo��Y�`��p,�`��f͙-�`=��8���yL4d��;�T�;u��f��[T�f��Ͽ�B�		2��z����\'N.Y�@OW�˕ᄙ�1���0\r��f�\'m�4�G}D\r5���Fɨ#e\"��\n���{l�]���v몄����z�Oo����|HH\rvG�v?�Fs���I�\r��B5A��*�u�aʚ@���њ�kS�ʕ�q�(��L�B�����䈚�\0gmA�X^mٺ�f�����N�e��|\rN���W+VZE�+�c K�g����\r�<�D��\\�o����i�Bcv�~g\r��_��XL��e�\0��0\"\0Cv�u��a�nݺQ�:u���F�)*�Ez�]z)�h��2��R�^�wڷ�@���$�b�\ZJn��VJ�J�����ЃP��U��1Bqe�>T�tiu���Xh��R*�6�4��\r�<`U��ph�����Mc9�q�<F���kԨIz����)U�����Z\\��;X˪������o�L)��h�\nJ&�}���\0�!�%\0��)��D�70`�R����C�{�1Q�r̐M��A����>�Bi��EG���Dw��?l�r����!r�7���O�;��$a�+��[�Ц͛%��\r?j��ǚ�-�j�?AO?�4]��?��?q℄aLNI�W^}E:���9�-�}�ʬ_���h�?��?�j֪AW^ه�Y�Ý\Z����a�UPC�z�!z�7D��ߔGucV�O��#��Z�Ga��\r��+�!C6l�H�v�\0�-��6\0���$��������Q��=\nJ�g��T�ʏ�ņM�\"����ԪU+z����08Υ���t�R>���TT\r\Z4Xz�j4�\"�!\Z��n��\n�B�S��3�in�k�Z�j%oy;�����o����J�!~X��r	b#�d�ԕ+Ꮧ-ZP�\Z5��w�䚐O�-�ɉ �u�?�h  �a%=��\'�\'�ԩS�3瞌����B�?�H��\nm[ӝw��\n���\"6�0�ޏ�=e��Ⱦ��ّ���h4E0�|���^��/���T�C����� r��s���Q�4�lՒR��$58ΗG������|L�0͘1C�bq:�J���W��`�\"���\\�z����\Zf��X�ΰ��̘{�ח,Y��\\n�h4E��\r\Z$y7?@\n���oZ�d)�ۿ����ZZ0�:�d,�x���իG#G��{�п��K];wɤ��^���/�~�w�^�\r#@�7��`���	m`s�Ε�qAF����\n���O*K��I��d����e�2�)}��P96$7Pdd��`<�ۭ�ڲ�W�ќG8�r�w�c&�ԯ_?UK\'y�,������T�|�)�ꪫd5>ttf	��:��~}xF��J�*A\\G3gL����K/�D��ԥ��@��&Óͥ���_r	]��lX卯�ILJ���h��l6k%4�C\0y\0����`\0�͖q~JŰ|��~ ������\rg3\ng+}�qD��\\(`~|��Ǫ���,[���o�!�V�P���`|����7Թsg�g���S�YE��E�-�&�j��p�:\'�ܢ\r�\\bZ����~�z�d��6.4#*s���Tf�j�d��U+WК5k�瞓�|�v���5����_��̌��5��N�R%銞=x�՟<�z����f��1�\ZBmT�e��G��,Da�{���0�R�8b��7���ѣE���ww\"��\0X���X���y�\r�<�*�e˖ɯ�sPcXM�+�PhH9T�N-z��\'�lٲ�)r�Y�����`~ȍCȑ��h4���#�J.��}���SpP��_�(��*��k��i���-�6�믽F5k��U	>��Ca���롨1��v�Y�p��ş�%K�H\r�&oh�K�\\2G\">w�f�=���2VS^����y!((����\ZV���.�����M,�e�BQ�^��)K���>K�g\Z<:�h4E�H���*S�6�Y��n��T\"\"#��я���˻����1)d���`H\n+���TZ�v-=�ԓ���U��шQ#e�>\\P�뮻�?J�h��m�Y&�IH�46T�lM�В<�`��>�?:�����B��԰ACcO�3�<�H���-\n��������7�t�l�N5\Zͅ�/�W@�bD\05���KjJ\n-[����L	|��~z��w�K��Զ};z��w���R�ػo��	\0в\0שS\'�.-��\n�^�c���t�t,%\'%�ӘHsv���졘SR����!c)ۈJ���ҹs�!:6��믿e�q���L�ǲ�$A�~�-�v�T�J�����F��-[��RA�;���%���FSԩW��W�.o� 5yy#�����|��@��_�UVlּ9=�䓴j�*�r	�`�4t��n�D��8�LsJ�}��\r��59�{ \'13+d3�h#<fM�h	����𓒓����맢��\re~�u�Jf09|$��.]\"��h[�d1M�>�n��6V�U3��ױCG\Zp�\0\Z��xZ�b%͙3��t�b������ ��h4�,	>���EY��d6ڲe���7A��ҥK鮻m/�Yn̚9K:J{��2>�ϩSi�ƍ��/�P߫��(���k����0[b\"j\0��3`.�@.@�r��\Zs�0mߺ��3�Y�:��Uؒ�L�qv�.�D�n�J��#\\��BY�������y9+��ԣ{7��\n~*�\'s�\0d�k��F��Y��lт�d�x���r�;��ԮI�/��43�g@��5�\"\n�*�f�<�զukY�O�d��^���s���g����i��-��룩5+���/�o����<��@�A()��Q����������[n�y����~�\Z&���@r�[�^f�O8�r�e6�irFK� ���q�{��V���Y�t��e˖T�\\9r	�W���ϑ]���x6.C�ډ\'��$���{��d,d���V�u�g�\0���r\n\rӽ�5��Ȑ(V��!dun���?�X�~�e��:1������F~��#G�H�EjX���E���g�3ڭ��x��篵�!�\\}�D��6ccci���)���?�tnI7�6o�L���)|���/�2?+�t)��\r\0�����Y�Fs��䕛���+���&B�p;SAF乽ݐQ�d�N��2��W_~A}����j���Sj\n�0j�E\0g�}(T��^�\ZEv�-6��9 kp�����+zy�*��3�E�d\"�6m�PϞW�|���P\ZM��-_��}vP�}�`�O#��8i�\'S��nҤ�,$b̈́�LyY���\r����i4G��5�F���^A�U�E!I��	tn�υ�q��I��uk�ѷ�|M��������Y<�ޓ{l�d�R����Ȇ�^�l�����ņ��dYs��M4x�`���c;��ٿd�bU��Ĵ�M5���r��?��9�����u�6t�ÀK�֮]E��7���t��j֬;v��v�YP�������\0Å^�U�о����}vG�-�q�9.��]|C�w�ni4��&+������Ǝ}[�3�O�C�X� Pk�m�Z����݋�6i*��Y���@uF mڴI��	O�R���?�YU���L�\Z?�x�\0J�$�\0�o�&�\0�D��dR������*\np�U�\\%,Ut��(�#�,��}��øf�ZiJp���-��QԨQCygMA��iv�26\"T�*�f�n�:ϢN��n6�L�����۵����13�����yf?!�Y(����cǎ���O�*�1���i�h�ȑ\\HiNv�F�;�p��aj��p��IY���)�2-�rF\09��~5�/���X!c���L�g�y����ș���B�;�A�=_�j����i����˯�J�O�c�J?i�$r�T���׾]{*Y�8��,�_?��%�be�u�vv����e��1 )Ƹ�\\���QH����\\�D	6*�ѓO=E�1U��߳���>G�۷����5�Vp�t(D������da �N�gC7d��%kT��}�ݴv�:ęm&3i�-\"1��a�ԵkW���k�oG�d�~�ת��>)�؜/@9��9�N�R��meMloHr�Q}Hcǎ�K�5�����w��~[�}C��qTG�$�_v��FW�ATh��N>�$gz09S�șfg ��!���LI	�����i�I�O� ~¸�AS�؀@�G�PdI��@�Qt�rS`�����(8D�Fj:�g�a*U�����R��ҍ׀�M#yL3���M���E��\'9�8T����F?��jʕ+�~�&M�8Q)��xD���.A\r�y�q����Q�*U(͙&C��܇C�[�hA�|2�*W�,K[L��h -��?y�L~1p�@eU�!1f�dN�ժU�l%_�~7��R�\0�U��7�J����M�-��{^.C�a\0T�X����k\n	A�`1Ć���93@ \"���4qs<�q\r+`�3��O;8-���w��#�tp<;���(�L*��p�IuRrr\n�~�U�(zx���vYBL��!�W�����<���8�$\n]\r���gc �.FAdd����z\r��L�p*L��	|%ߓ���}�^.R󠾷7	k�X�0�3�J�%�J����ŋQ�V-d_���SҶU�$��Ӿ���~��z���3j���ݻӒ�ˤ�A�<�;��%\"#菩S�j�j]��f���h -�r��Yo����6��0\0� O�@�R�M�6�!C�P���f��iX��y(3�Z�>���A���:�W�p����#�<\"J�8�Jw����:҃��b��b�;�d���m9J�vǲ�O��3)��d(wV�nV�\\>7>h:Di|N��f����m(٨]Ig��&�<��\r���	�E�?l<��\0��͞F6G\Z�����\n��-�Q�z%�J9�@Y�s��0/}�i��Ɣ!�����\Z����6bA�}�\'��7�dD�#���X�_ѧ7mذ��A���PpH�Ԅ\"_�v�qcq�ܗ�Tg���ԴF�,A���g4��@6 �������kz����+O(��\"�énݺt뭷Q�Ν�K.�Ll�\n			ԮC\'ڲe�d�<!ʟK����z�Mi��\0�(TG:���m(RV�..�>O\'O�Ѧ5��kq��3gDx�\\�����.�|5�AŻ�!ʘ�<�Q�K<O��:r�3��X@���0���7��5|�c*ب��3\\\\�g%-�/��tl��HH�� 7���MKR��j�Hr8�\n6$����g#�cSsa*b(V�>:j�3�)�A�B>v�܁�̚-2�\nJ�w����ӡC�����g#����ʾ}e�>Z����h۶mT�|���=g��ߟ�!��l\0����ҝw�J*Ⱥ)� k��\rh�?v���cR �!1�`�,U��c;]�}M�8K\\O��!8$H&���޽z��)1 �߶u5k�RF*�\ZQ\"&�2�O?�D�l�_R��\n�NN���|��H�vy��K|<�p2��OkV�=�()�)�z���%{|(^��^\r�R�\nU�V_6��vy�4-`��\r��N4��5]N��P��x����y��ǝdKe�1�J���m�S�6eX؆S@`߇x�a���n��x�<��ZD\\xJ��=�<��k�\n�Lk��m�n1?\nF�޵�,r��Ç��WH�	��U�TY��C�#��	Ͻ�<������7��\"B��������eZ_!�2�ѽ;�5v,U�P�Ӿ�@vr���˘-�@��C{��-[D��+۷oO>� u�у�T���b�	Yd�m[����o���u�֡G}����4����3�ʌ�Z���� ���]��O)J~��Q=��b�tю������Q���W���_졕�Oѩ�JI��7�@�9J f��������7�p?���t�c�D �X����G����35��K�93�Ѹ���;������Qb2�C��p��4n6\nԎ�\"J0�\r�V�[�C&�A��+n��=EK�-%�Qs�14$TVKŬ��%��\0�ڽ�8��ݻ���\0ӦO�_�r}[\Z5l�e�N۶o���3��Q5Y�\r\0H(pH�NV�p\'N�������1ch�Siۖ�t���6m\Z���|n\05�߀�=�j��8��1:��a!�OƏ�������x]����N�[���܋�dY�Q*�;菟��3�W��c�ь����	.����?��6��_�mA��0��xQ%,�0F��ɯ�������ǯ�K#6�O�����N�N�֤���\\��HA�\"���cI^�x~$�������hʌ���ƍ�5HA+�gLW���f�Z5kQ�2exi�N+W��Q2r\r;�S�����)��:u2V=Sҵ&+��脕��J��)�u�6Q���M��l%sB�b��RQԽ[w\Z9j}��w�j�*:v�(-Y����1�{�2���1}pV�W���q/k��ػ�P�TSs|�j�[Zz=j�Y3�ҋO�����J����D5$�إy��5!��2�EB��!����Ă�m�3��4o�1z�4��5�}k���`���Uup�׌g��B˖-�\"��-dc\"���[�*���r�s%͛?�0O	����w�^*Y���x޹c;��L��C�Pg�KwxFo�#7�s/�NA��\0���@\'�i}0�,P1��ϼ	ȕ��{03����Z�l�2���F=�aqml�+�g�ڲumش�V�YC�o��ǏIE�z��^��v�tjР>��)gĢ��Op,h0�M��Qŭ�+=�\0%$�Ӧ��h��c�mS_���*���@^����\Z�6ҟ��\nUP�V)�ҳ\"5jFAaN5s�\'@��u�ܧ-b���Uؿ��;i����U乂�FhP0�߿_\n+&P���$�P�t��4b�Z��\"Z�d�LY�4�\r�����t��SJr�tn�9k�̽�L�cQX��w��t���P�*U<}㠸�\r\0N�S:�<|�{�1��K��`\0 �a��e˖P`P�qT\0YE��\00ϣ�Jj\0��9)��cG�g�����:�,�-��{��o?�s	�\r!��F.;[�S�):~(��-�KV�P|�~\nPg�/�O��;S�O $2��ϑ%��*T�SǮ��U���	\"mFH��,D�����Z�\r�2\0ƏO�~;�����\0���?�@W_}�qP-��*��\\�7�p�͜��+�m���jժ��j�}�v:}\Z�I�Å7���rz�W�Z�j�.�6\02�ǘ- �\"���Ν;�,�r��\nj[�[�l�l��آ5������<=��|�l�XQs^��>�Z�#l�mnJI���b�wVѫ���R(6!���l`5���gN���\Z�*º$�JG\'�/���_]AN�Mq���E�6�_O��\\��b~~�a�!� �f�10�,��y���E��pP���f���7���X�p1���{�b�J:��7��e%\\D�w�g�F�it�6��Q�\Z\0P�G��\0���/����`ƕ`p��KHH�,���f�^J�۵��w�0�&;\'M�Q��.�����_	�i�&l��wm���\n�cf��1c[�\\�NpE(���^���9m�t���֭9@��9DG9dQ�tJ��|�CM��WR��\0u�(6M֘ߟ�ɖ��)uTl:!�����\\ԥgjݾ\n��H���ך��٠�\"�h���˟��k�@))�?�Z���zu����k�\0ه��M�H��+CC��X�O�dV��ȿy\0�W\rg����S�z���aXh��V�(���/rL\0�\0�߷O���B���mj�����7��I?�=D=����������7�����N�Ϝ��8�1��dJ�ݻ9l*��z���z`a��Qo\r�/u��v[�<D�M�Jo���~������Ɛ[\ru�V��H�t�Χ�Ɔ!J���%�}ŋĕ��Xً��Ƭ�vrr<�p��\r��>B��XD��;AIg��B��}�^v�s�\'�M���F���2ј�����;wЁC�u-0\"�MU�U���N\r���R��t&����S���r7%5M�\'8������������d��$ڽg�q�)���Ҵ[V�+�Qz\0�``.�:u�P�V-衇������.]*�H���o�p���&l\0��b@G�۝Ɗ�A����Ы/�G�̈�ӧY)�s��K�6c�S�?�,�e6����d�7M؈����HfC��ǯ����h�Z���FX�X�K#@St�~U�F1�J���Y4}�Z�p�6�\rj׾=���_:RS�ʄZ�6^��6��1���%v���_�5������2V�E7��Ă�X]��ޥ��L�t�ym���\r�����b���RV�v��E\r9C���;�ǝd� ��Re�l�h1��-o|���W�\"��yj�S��H&�e%��~�͚��V/;B��P3gb60b�-��F)��6fܚ������G�k^��Ĭ�]���-54N\nr!���B5k�h����jM,����#�K��S-b����\"kN0,��|�y�f����QP#���%x%/%\"�/�Cd���jժT�\\9��>+�\rP�ڵ�ABB\"u�܉v�@Sg�0����\"�`e@�T0�T7�w�`����(�p�����իW�m\0�+[��ԭK�7m�Nk��I��\\ѳ\'�����`\0�����FCn������<�D�/.:z{��Θ�s���)4$D:g\0���4���j>H�T{:�:Ls�m��KPbJ)V;|��8:��X����\n�Ȩh$O��b1�,����&T��ߍ�[��*�t7V����Tjӱ<���E�H!�+���C6�a4k\n�x}�Ě��9F�&���?p&@>����U���dd)��R�*U�V�jT�A5kԤz�ԣK�ק�իI��̇r�\n#�Bsh�N�iŊUr,/H؏.�:Лo�)C���9�6\0:gZ@5,Xӡ\0�����j����)��!ڱm���Dz��QԧOo�Q�:]vY;N��H�H�D�6aaޗLh��\r뜝���\0�b`�{�L��ꁷ�2#ᙸ0���!z�Y���X.�G����w|G�ia�{U��0�\r�8>�+ǬWkr��/e�J[.ǽ���,�Y���銠�s�И�ђ�g(%-���+��ow6��97�_B9T�Cb��\n*��,P_^��A:x��i§�Ҝ�s�����[����B·�OO<�8]ݿ���Rpp�t@F�(c�n\Z�$9n��P0�vLL�L>d6h2�\r\0�!�D�Ă�+�x9{&0Q�M�@;��;lT�j��k�瞣��L��[���#<	U���v��Pr~`���Xd2�,>.�ԨQC�ou�q�b3��uے�̙ ���C��s�i��(=5�U<��t��N�v�P���v\Z��*:t\0MV$#X� 3��-0\n�RŊ���,�����[n�YL��F�ao���3����4��<*�2#�N��yB�E\0H�fB�p��aOu��2w��T���[qL�᯴Gy�T����e�Ο��^|�%��~T�V-��.#�\0f��F��F�\ZY�5ryo�\0Ŏ��l�f�����7^YL3�������l`�\\s.å���(����u�h�V7�7f	M��0�!|�2����V�8f��8A�߼�W&I����-����\r\Z;��]�5�4\0�r-/��\0�`Z�0\0�;A�.N�R���h�4���hf\n��!��k����/o�:�8z�^շ/=9r���O�a�:Z�l�4\'�}���~�p9���\r���SߴI#9\n33���1qO:��Fi���J��k�iܛ�i�O{(�t�,B�rC�s<sPQSg���]TLj�?���{�F�K09ݩt&!�fN�KK{��6_��Y,*�+4i�ٓ]V�.g�N.4�Bo�A�ɟ!�djs���	���XrJ\n;q�v��Kk֭��P�N��L!\"�W�&%�.S^Y��@�?:u��|?��,^h�,E\0r����/N��{z���ˉIZp�3��	r�À��V�B�[��R�J�-K<6�ʡ`E\Z\Z*bd�oN/\0�6;9a����vP�A���YK_�_M{w�a�d��f�S1 0�e9ű�]4E	�[I��t�2+\0&�k�wF/�i����[����_:i#���:�~A��l��31��3;pv��]�5M�Y��:(��͝7�>��c\Z��cԻOojպ�,��)�/��2\Zx�����O�N���t��zJ����\"��n�1\Z��\0��_f<r�\'�!�r�x`H`8_�nݨɥM8���~�&N��%�et$��x�k�Y$���Ρ	\r�i�>������_�|y1PF�l?sVn`�m\\�=C4��]4��%�eK<��)��L�����?�):x�;\0Hq��{���ґ#�\\D��x	_sA&U���ٱs����4�hmݪ5u�Ёz��M?�}���4w�\\�[i���Fj��O�8!������pi�������4\04�@6�7��N)�re�U����u�$��9�N�ֽ5j҄j׭C�� s\r���?�c�NJa�#�d�\'��q�a��g����\0����%���}m��n��+c魗V���1��ę\Z���o�P84E$��}K:}8v�ّF�P�eA\'3\r�i}��q���6�h��\0�P�F<���&s`4bt\0���&r8T�e�҇FM\0���{	�\0�����!#.:�N�FIF9VXJ�eG5��ܘ���0,y?��q&.�8L���\'�\Z���ߟ��hI�+W��]���\'���?M��k�I����8t�\0%&%dxV�@�V��j�V�f��f���rNF����ƙ-&&�>}%}��z:u�.��F�C:�\0���i.,�N�������\n�H+v�:��?\\G��0�szD?�t���d�g-����q�Xɖ/_�������	5�\0�b���ի�=������Pd���px�K�.R�A ��������n\0����h��$0��4�ǏGz�(�.]�R�޽eZ̺u�J�{v q&��{�/^Lc�\ZK7*Kdb�f͚�=��+�e�Z�%]�^]c/���`\nn{�S\0�=��?Ao���vp���a�z�Y\\�(���𫹸�\'��Qf(�u�:s:���b/-_t���7j�`P�O�I��)�\0 ;1tZF����^�_��ѰAC\Z��xU@1���;M))ɹ�?+p߱cǤY�hC #:���r��\'�ԔTV�I��Ey�2ݠ����o���A��ͣի����3���D���G���6�l�)�-[��W_}E}��\'���hZ)�nfJ3��d\'����	���e�~JL�S�K+yMF�\0��%&8��/vК�GH��HO��d�2�f͚���l�g�sv�dwl�!ۦ\\�{e_����e	s��H�c��ݏ*�x{�۴j�*����{Q��c��_�^�~]�����m\0`%+,ē��S�\'�7d�pxx�T���|N��5N��g�T���Pu�e�x?@�+[����x\0��BΊ�%����i��i�Jv�S���]��\n|a\"/C�t�\\����\Z�Y�[/�	B��l6Ju9������\r������.�ȧ�3�5��*_�����h����SX�\n,1�M7�D۷n��ӧѧ�~J��}��4k�,ڽ{7���ߟ�0�;\n=��3��:�Ru�?3�\00@�-�)i�����ۨ��a%�)\' ��\n$4D�\\E���`�OŞ2�e��&Hd\0XȦ���{�>{6����8�9��Rę�����JL�3�m:~\"�>�h�4q\'%�����\n�_\r	+J�K�!T�ˢ��gU\\��ږΥ��`N{��g���q�8`\'w��҃�ssI���|���;[0�	v�v:������3�۳���4�/f�)H#�p���\0P}Z`$&����/vQ�I�3O<+�N.vNM���qM9�_�T�R�i)���D�����}�N�G�!�����֝nz�w�=4d�`�С���\ZO�������+W��ʏ�F��\\��/¦Q�ʛb\rY:+��ӧ�V�`�}hVGS`��I���%H�������P�qSdd��a��ӎ)^Yͳ�\\��\0�{}-m\\�ȡ��fRk{S�\0	\r-��7�_1x�	�\r�~nr�~G|��\"�)02�\"�KPX�RZ1�B*����Je(�r4E.���_�,�WS.�Z4�V���*eą���Z����0�#��-W���D��-����N\\J���h�M�6��.�p\Z?J��O��O�m &��;\Z \r�.\ny?]���-�탃�a������q�8����x�\Z5j�t�HQ=u&.�\\N9y;�y��\00@{?,E�\0HLLΗ�v��`�b;�\0JKq���I}<�|FS�+�I�H�)\Z.߰\'Პ@~@-I\\B0}��\Z���}˪_�_c��D��UǅӑΎ�?�K�a���oV.�r)��ͮ��o��J%ٕ Wt�K��$+�H.�Gr�>�N���U��ٶ[��<;6,��du���Q�ot(QV��~nh�2T3���7�Fi\ngC!�d(�#C������=�hQU�p�X������a��8ڲ.��t� i��	HsӉ�{%_���!88����\0`Μ9t�m�҉c�$9B��TK��rN�\\Pr����i�\r7�I6&����r�1[!R\r\Z\'5\n�������ɓ\'ӻﾋTk��M�V�>��Ǳ���-Q��H0�{�{�����u|�H������u���ct$戜���|=:����JHL�Ή�e��~FV�ڵ�ѣ_����W���\Z՚��R���)���+��6X��f{�\\#��&|(g��f?@�i������f���ʙn�����Dء�a�Z�:����zk����k���v���}���T�7·��I�������ps�&-)��ɩ,��`�����G�Y����tl>�|�j�go����]���>���G���0���ҹ\Z���Ϫ�c�/�#�h�PH�$d\\�wQ�ʡ�ԳmبI䇩&��Hu���P�:5)�y5�)d�4�\0��Nw�>�v�أ�74�#~<�3�Z�7����Ԧѯ�Aݻw�)����:�g�E\'�5k��رoь�9QL�a�����M�I�}��W�^WȨ��,��X0�=\ri�\0N`\0`��N_}��T_�?�Q��2����@�z���%K�)\0�%��t@4]�t�T_5o�R���2\\����ګi�c��ZUv�p��`���\"�X~�~�~%X�����W�e��� o�\n�`���\0Q�� ��=$P������_<2|�76\r��56˧-x����M8�f)ʖ�N�x�i����	U��6�w�/�4@�q�c����]6ޗ3��������J|4����F�l8qj X�\r00܍�Ў�m��\Z$���Q��AI�\0:�atp��AujD�+(�\\�w�;��M���m�EM�DIaJpk\n��Q���E���&	��^g\'�L� �\Z4�:v�@�ʕ���s�t�;��-\\H3����;(��%�M����\0��4`�\0�R�d����\0�\r����E,P\0�w�?��~�<��:����Y���){A^��#�X��31$�B�J2�6+����{��{���7�����\0`��A����f�9Di�A�#��c\0q!%{�3ގ�	L��)�K����!dgłsN66.�\"�6QN�vo	D��R����1\0,�����H6;:�2�^�I)���,�H�T\'9��bhrB\\�K����I�����\\|��deO劧2�d*�L�h>WʖJ��D\nv�HmC{�_Og=���wJ�q���&���;.���A�b+I��K�[�M4�\n;I��%(�Y4�����~[Ke�6��[R��۴�)X����o�C�����~\0��\"j��[��Q�4���e�U!\'�7v雄㪖�J~T�i\0<x��t˾�U�R)6\0��T:ʕ��QO#��l_<}��q�?J�,�	��C�7i؜���I���!��7C�.]F2cf2� ���\\����h�V�Im\\���|�z�Kh�I~ee��>��âKR�\n�T�vE��M��#�E���9�.V>Nh%Qp�D!a����y�� ��3�gp?��q���9)���,�AA�©d��T�ZY��R�JV.C�e��\\���FM��C������\n��)Nj�v��8c誴�tm�>�t�\Z$��ɱ�L�\05�T����J=! ��(����?�Rm�j�=��Q�Ă�DZUH>J]R��%�tx�Q��k�b��t��5D,�+tlBA�O~ҿ&\'��m�v%-�|\'\\��Q3�&*t�Cm+�?�q���:~��}���\":�\'4��&�l\"�h���4�X��L�Q*(��3f2SN-\'`VS�?��/8�φ�$z3᛿��t�X��s<7ȥf�H�\'�	\\���o���g`7��N��{�-����\'Pz��v�?G���MDi��=?�ԉj�4.ȻB�Q*�B�KP���t�\nY��\':�qX�a��@��o\'�w%��eZ�YQw���\n�j���f��h}#��R8��i��Ǝ�\\Zw�$ǧ3,��4��\\��֨B5+SZ���:�$��<L}ҏP��C�6�\0UL��J���T��=�ӆ;@�\r�����=2��B���Ѓ��!,5������6�}�)\n>�D4k\'\'�)�F)J��֨W�+�	)k��YHA�b1�9m�Z?44�n�q\r�(=�ԓ4f���{��5�\\c�f�B���2~���2M�:��A��\0�����#���SO>I+W�6�(0��&��\rF~�h�|l<ř!.>�ʲ�]�dI��N���Q%�_t�A�2���pl��ԲUk����,X~����\\����N��r�ܧ��p/,!�$�A�?\\A��0���bݸ\r�%���B9��\'���#, �K�|܁1�!�F� V.n��r����3��q��R<G��Ђ_x�)\\����Q5E\r�fP�S��;P�6�q�7��WgT�B˻�O�]q=��T����-\\�ec��&��*I\'�̩T��)*�c��NN�A\0��#�<��g�Gm�ۨ���d��9��0�t�t�)H�`�,��1�\\�F)\Z�~��=2V����̿��&���Ȓ�\"g�Z����ɰ>��~�����^�/e��^���\'Y�cm���(o��b���� \n��\08v�v��-��ƍ�圙@�b\0<��S��sO�r�\0�]�F\r:��aL��_|�oPP���Sdd��EDDȪZ	��������완\\:+.E��WT�J%i��R�h	��\"Kc��F;�����Й#v1��Uۜ�ެ���E���XeC�.(<�($��\0d�o�	`��fф$ ����Ͷ?��Hه�Q>u�~��sX�C�Č�圩T����	��`�A\r\n�@�nA|3�V�6ɨ��7Mb2>1���(i.�E�ΤPt�I��?E%�OQ���L.��8n\\�_��U(�!�<��`���T�F�\\O)Ql���PF�]p6Z�r\r=��p��j8�ը��q��	��w�}M}��U#jx;T�U�&�V���Od)`�x���-���JN�笰��];w��{NFhi��6\0D��9\n`=�����w�9�aI4����ߦ��/�M�����Q���V�2W�B��Vn�+Z݁����}�Xi���\0�8�k*_>Z��A�C���\'JӞ�~���Չ�㔝���\\��>����I�YU�N�\'��@� ;�� \"��~@\0?�����C��.y&��G�*,*<Yc��E`\0��<�¼��EB�Z�P�B%9��)�HA��t��N�(��%������f��o.�\".�Ii�|2�R�����d�O!WB*�\\)�@\0�/#�敜�LN\0>GD��T������� �ņ	߄�R�?!�d��\r�Yv=d�ϛ�9�=���C�V��g��n]��������D�|�\r�u�]H��{��v6r#s�Ő۵����J�ҥe$��_3,Ŕ�}�‒���0iJ���䇄d$��Q�|9��P_ߌ���4���������p\\���99d��2Bvǽ@�\"ӱ��f��O�OډmX�댅�h���t�x\nߕ*��!`C��\\Nv�4\r�>���_�6�> ��=�2R�ET-�f���y墤�Rz����$�$�:�ji�c\n��m�s��h��bg=�os^���̘���w.Ah��\"_ƖF�\0��w��Y9�M�ʇ�}�J���V��M���Kҥ%T-�N�]bK%�+�c/��qR`:�(ޙ��\\�\n�>\0��ّ�BA�$*�ϪT\"�J׈����P�k{S�k.��Wu [����ښ@�Y�}R~�`��\\N���ΝsRd�Zd�uRО3��{+�|���`B6v`���MnQ��qʊU��ݳV�����eٲ�4`������h��%�J����Q[�N��,�l�J��>�Ϣ�=~e�\n���$y�T�\nX�]� \n�v�	yv��)m������AR�m�`|��Խ{Wi#�����^�K�9�FZo&PO)�O�N�|��.[������\0V�f59=�~�� �ܜ@��\0J<|�R�Y��(��\n���F�!oX�X@p�Uϸ\0UkX����p�힯Wʛ��m�C~�;���Y�qZf���%��$2�Z�+A�!���{��;����M��?�[�8�l���9�p�ka$!��4JIL�c;�P�����<�G!���\n���)�L*���Pz����ݗ�+�a�$���J����\n�vڹc7�{����F�����),4��6m*�q�\n&1Ê���gd�����(�5nܘ�3��W�!K�G��B8�{��\0�(0\r�;v�w�AǏ�h\0�X�]b�b��{p0�����Z>87\0J�%JDз�}A%�J�c���Z.�p����hӎ8)���8�47%����(�C��:���AL�#����p���26Ǔz#�,���@��>Vƫ�èQ�6�H3���9�h3�M�^\\���ƳĽqMn0?��o����=��~&�����RC@8\\=.<bg�D�#iQn�u{7\niW���\0P�\\Xa(.(`��t�wqɝdԑ� ����2e_P�v·p�%�H�l͚��\\�r��\nj,��`�\r:�!��.?`]���X:q�{���|���6�#�rFp�Q��M	)���/1�~O\Z%c�9�6\'��\ZV:�JT(M��(�bi\n��p�\r-A��)0��`��gN5���r��s��0B+��He�x��VI\Zެ�-L��8^9�J7���h���Q�g�y�]3Q�2gw\\��~�Ԡm=��GZj<��:I��Q��}d�R��H�uƽ���@�����n\r�֦\n��8p1���j�F�<�ti���(�������Vܕ}V�\Z\0�?6�4���H����\n���3�����b��7\'�]��W�\\E���)ʛ���q7M�z��Ib����9�\"�!]��qϻ���`<��839������P���0à�;�H��béG�H.�GR+64��_�-��Q}*�U\\�z�=�7�m�<\'53�#���o\0o`��6��ZwB%Ĝ�dvg��Sq|\\ꄔ�F®���wTi	�aF�>&J\n�y��hG�ct��Q�;}�\"�éR�JԲU+�ڭ�L1+�\\%>�����c�L<�j��T���ȏr-T9`����j�رc�&\0s����\Z\0&+IRLQ	A�E�(���4=�ӂX���#�������1.��ɛ�����c:.�r&ř� 	e���t���	3\n��Sq���e��X˲ԩ*�?�R���ſ*��Db�XNQ���r��\0i�4rbF@������љ�{���ٻ\n\0����ݜ�d�NI%Q���֧��쎧�xv�����xb� \n(b��0���}k�3sg�&a�7l��}v��{��O�_�|�9/}��OB�9��\0�/�	�|+&��5�ֲ��J�h�BcH�;�Sw��P��g}�)S~ļ��n�z�_���?�8N>�d���˕��6��DE5���d�&�\'���((#��V\0	����!�\nc�\0�{g)�KD��#�1U-�+j�(\Z[p2���@����	�^�8�w:ݢY��T���x���Sε�#�cz9S��.�%�wE���/�@��%X>a2�|�}�{�c,�������b�D(�K:���\nA�^\0*�	�V�F�4���8{�F�[G�_6_�P�R@�Aj����j�@)/��g��	\'��W^y]��V !$	W\r3�j�����&aO�F�X�S\03�+W��)���:6T��,��Hk�F�np[��C�0�3Rq�O㋩�(+\'u��\r���)�ȫ�GR\\]�\'c��/� ک��qԝ�m��laN��	��%c�D��\Z�#�\'#I�J�RFd�N�2X�P��l�J#�\0OȨE�(�\"�G��B��mԡ[��P*3!K�±�\0Εk��I��q�(D�å��9�;����oջ~�4��ތ�b�\n�A�R������TBx|��T���v����U&���FbB\"vء:v섞={�{�n���V�U�K�0f�X�d9Ό���(��f�9L�U�՟z��{�W�BOt��!:`!*\0j\n\0tX�n]�޳���7E\0�ڠ\0���{݂�7].XF��9H|CVޢh>��ɤ�j\\!��x�:+�[~��J���;�r���>&���#�9u�&7�	��#���k��_����~Ģ\r���x6�*t��}��&��LrCq�ѓ�]Ӻ��+U�\0�h�$���;*�	\"�*pX��\nc�:d\"�_)\'�\'7x���P��c<�w�\Z>��3����\Z�Yn�����LdQJ^�e255))����\\uY۩SG���\"-5q���}�e�A�*�P]@�~���g���)��ivb��e��?�OGU\"�c�eV��%��\0X�I�:���#*\0\"\0.<��s+\0�Y\0�J*�#�������Գ����`F�$����$cՉs�^w\"�=A����|R�����o��ω@8���������MGq�T\Z�O���T��5U0�\nS����!�8 ��J�4��~�0PMۆS��YZhК��=sxbߵ;¹��KLC����S���K��tI��)���W�X��4lf]IѴ�#���nx(��D��5INNA^^6L���6���ׂ�Φ���~\0��k��*�]\0�ݻ7��G��a/I�<�mlǈ�@��8�a�	��#�5�z\\5;�B;��m$\"�tJ��n7<�ĥ� &9Y�a����RT�_]��\'n�3g�\\��m��ū��I(\r�ȷD;sqEAA5��0�yG��ϯ言��r�����U?`��T�]E�\r�1t��Hςg� �� �i2s`h����g��x<x��\'��)�4q\"��0��/���\Zt��LJ��`4	���亃Sz�g93RTT�e˖cڴ���O��.������o�M�9\r\n�h�9���-p�^\ZS2lKyd߬l[���E�7D!`� �t��A�����nn��hM-����T�μ	Ꮲ�Pbچ(�px��\'�!!%�8)_wi�i�����d4��JȲ#���J�sU@\0�|�..�\ZLZ<I�N.a>�>�t[�íl�i�o|N�p�^y�\\5�6�u�_j�L�/����G���πD�����ax�W����[�ݛt�4���]�;\"�_?��gr�yJ>������%��N���SOEjJ�	N����7t����������N��ڷ�\n����\n�Y��Ǐ�5�\\���&~?Q��b���g��v	S\0�\0=\0J�k�$�(�v	ɋ�IEr�*Ŀ(���p�4�Eh�7A	�A�v�\0�0牅�@ͺE���Uq0���@L|bc�w�CxT@��\r���>	���)��\nHâ�?�Oݥ�pCzQ\\V���>������\n�U���L\Z�+\"�K4g7��4����ry�n�d�d���)��cp&l�-��^�=��(��	�K�20��B�v\n�@\\<�=z�ݹ�e�t�%|��.�W^R�#�R.$X�`^�~�.|��н{�D�FI��a��m�����&��4�Wl\r8���&|��x�?��y�����())�4���A0 ��\Z�Q\Zc��w�R�1^ic�g��Mk{�ET\0�`�ϧC�5a3��2�hS�Tg)՘E��aRf\\��U�O��k�R\r��b��1�\Z�O>S?顆��|��V��;>\'�xH��6���*�����#�DRb�E�9�/���f$����{�_/��{2�-�W �/6��⸐Y��a�-\nN��L��pV^��6E�Bfb�)���L<��#�O�j�E�:�G<�Ѓ�m����ZvD��f#��>%ť���Oq�e��ēNēO>�T\n6j��iH��ǥ��*ݛk�V����t]U��F\rp���k�4�t�����rH��vF��*D���;���a��8)CwH5~�_˒�I-����n���}�A�e(��/߃ɫ�������0s\r�q��[o��]z^y����j6�Ε��]��q~�Ѹ�����8�0I16H�7̑\'�(���[\0��,8��Eyl����\Zm`�q�$����]vT���݀.�;�?��Ç�VN�{��W�wXH6삳`�����\rVz��\'�wN>�̘>���Y8�sU0(**R�Ĵ\r�>�\'J0�яm	\\�>�`�\"*\0�`���M\"��F,t�V����\0>��Yo!Z�~A�����w�� Zv|�0~��E�G������?,#��t��2���ڎ����\'8��c�?����x�\\\r*S��J��I�@�����2�u``���t��2ib���TG���)����]����A#�� #l���|\'\"�)���������z%bK�#6 ��B>��gk�Lk�C�NF��	�!)YnP%y�(����\\���V�������Yn,<�B�0\'b�NбcF���:Gu�8�M�!߯o�x���`·���}�ޏ�3fb��_p�������	\'����g���SC���ʲ�@��R�܆���J;�|Y�eQD�\nH@HPV�Z�����Gŗ��[w�ck��o\r���s��i���Z!��\\R�x�A�y� V\rS��h8΢S��c������2�%)dZ�\'��>c`��y��ٜ8<q�����\r��	0uV��*eC�\r�g��!))Y��Oǩ<2��p������+��(���|�^;ӌ\\�%�⎎!ϟ�KEk~�5��~~���â�y��IHc�JK�k�H��T�rpK!��w}� �*�\'��wH�j��s{<na��l��a����,dg�s�N�ڥ�<�DEE�\Z�����X�`!��L�>]㉏����_aȐ����x��p���9=1��)���������9�V8������+0���_x�E<������S�-D���5[�	\"��v�i�ѽ;r���bc7i7�#������D���t8��_�{�o�50�����+ۅ0:�=\r���e��	�\0����휽1¥H@�_���{+lF�\n8qh�#���+�7�W1~�X�h�z�h���w%�(�۸����׎�{�ڧ��q�A(//Ƿ&��5r�J�F�)�%��\\�modU$���\rK?�zW�:)�d��N�N���\nX2�\Zє�=A2z�S�C���x8bc�NN�+E���D�������\Z/���>����֒蜜l��N�a��v@nN�:����F��ǆ�\rX�|9�/��9��,Y��r�r�*�]�^GZ�B���v������\0����U�ȋ�����������b��Z,X�\0S�N�x���0r�Hw�1j�HA�-��p���?�غB��}�s�����nݺ!+3+*\0X�\n\0\n\0ť%J\0�u�k���W_}պk���aq�@F��o�X�bT\0��]�z=�[.�ȉ�D�$���F������]r��*�պ%���\r]zg�G���i�L\\�¿���<^ߑ8��,fN���]�x�*�j�0B.�h��(�#�x��؜�����گ����)O�#��+��P���A�y�?�s��Ў��0��r��N!�^��T|���~}K=���%\0t��	���R.��;���2=.))��R��)�y�{(T��yM�@� V�2z�h�Mn��eظq������СC�y�]<�Ѓ�\r�D ��3yצ򛞑�~���0���f��8p���b���sb\0��9����PT\0�BT\0�����5kT+������M�IglB����r#)ko�ۉ�۳\0`�,�Iu�S��DBR<��6�9�Z�S �m��	���⎱~���0\ZN!�#�9\"�8輧\n��	?1n,^����҄�.�L�k�6��sd0�L�3����}�\'sYWbp}���)�����k��$�Q�1��.c_\nE\0�z�������M��m�6�p;E0�\"�`�;띥X\\�)���k�2�;*�a3�Ԕ4�身�]RRR�oR{�`�\"�7D�1��v��+�s�3�#����> B�FYG)B* t�����Ø=Ǡw�>HIi�^�hG���g��y����̫��G���vŲ��u�c̘1:�)\\lLL��-�j����a�10�]n���8��>�^��i���=X�T��d�H���G4)\Z<%�d�̟���@�F*�\0�w�(j<G�_���)-\r�Q�]8_�!���&T[5j$rss�Y�BN��j�\Z �0�OP7\n�_�/�_�K�A���%���j=�X���.�n��\n9-�Xl���\n�Y67���N��yAt;d$n��vL��;\\v�������;�飚y$�w����\n(�N�+ʕ�;�L�:�������K����x��q�WbĈ�EhIل������R5�b�m)б�J^�?\n�:u�a3�����Mw\ncQ�ϦC�?Ը������q{�d�	CӤ�x��:��\'B\0o�5e�\r/]�H-#6Q\0��A49����&x��2�`�����+��;��~�_|���=�<��������U���X��&��A7b]8\\N�V�Z�!\0�*�/\rU����)8��r��C9���+Sq��qݪpߪ��U�<\\��;������KO�ʫ���A�1���xe�KX�f-n�׍x��7̐���6\"�t����ZDpH�5X��!�W�\0�RS0r�\\t�?��+c����o�>�샌�x=^�кk���܇�2�l�]�SHd�E�\0TGt\n�%�իWcٲe�4in��V�f��/���B���������o��$Hg0Cc��6��r���{cE�������;�/�O$�\r�Kz����d�\" ���eR��1��ָr��c�_�-_��y��\\0C�5����G~�Z$�P5V¢%K��{`��5|0&�*&\'V�>�s��p\n���A(��p۲�Q�*@��<����N�#��H3`&��[�\"�JA\\a��K��l-��X�i�KQ,�_�/�C����<n�b�D�d��װ�.�Us��D7�đ������}����5j�v�lm/,�U0�Sj�g�yMD��6��-_���:��\"D4��v�&������;��СCu+`ʼވ������}���ӻZ͢a�m�w�0}9���\0A	y�v2<\\N<�n�%{�+e���!i���)���	���\n��>W�4��j۶�O���O��b83��Q8�f���,E�N�����8ճW/95�d��];w���fF$��\"t>Z?l�(mhJ@#:΃��v�K��g�*�u%��(	#�$&�-�HX��E@4�V�K������ş��5S�i�<�pU���� ��$��7IW0Ee���Q��Nb0nyH��|XF��C��o̴\r.��X�4\r�=��{���Gx��q�駣W��������Ri�_k�� ؾ����#\0�eSW��p# ������\0֊�\0`��_�0�4]��\r5�BB`T�s���w�FA������:��[�6��\r��uM[z�/�2QS��9�n������O�YY���%(^���:�G4qi��G��L��Ǒ`����^)�{�)��\0���^��)χ/7��\nT\\�ܸ�>A�#�-�$8�ϲĄ�[p�]�?\\�l^X?���/���ev�3<F�\"	�U����BI�������=��W_s5�}�������?��;��6�Qε��OPPZ�t��y���S0		�:��}��VS�#*\0XP}H:�y9<L�_:�hi$��WvI����(,Z%�����6��ib������Hь�Jn�\n�(\\n/��6��A)Q��-\\J�ψ�ˁRV-.��UE����C��y�\\�j\r\"��{�9�����ŋ���\Z��ݰ~���S挩p�Ï��V����I�*R媥��,G�2�����⹕Sq�����	�]I�<�T�E��&�k�������z���O?\r>�\0�}�m�|˿q�A�Е.y�F��Q�nlK\Z��%��\Zz\'a��6\0�WBb�\nm���>�����6\0�~���\\�l)��{n��&�=w�J���f�R�R{,.&]�����Ǣg��ܸ�%��&@�-\ZgLb�\nv&���kJ�\n�)\r>�-wc~��L��d/����OY^�%ZUk���)\\���~$��/׃�QȌ���w&��)/ ��S�=\0�����}���%�7�|�	�K�r3��`�2�Z)��	2zOЋ�0a2gm\nz�χqPLo��6\\��>�09\n�����rƑ�\0|��t�r��$�g��-;�d����`	\0��S��H-%��a=�	���!CеkWe���� 0Ϛt�q}_�*��K������ǤI?�IU��v�F��:�^{�:_��1I��j�_�WD\0�7�\0�d	�̝�G~D��I�)D{-��Z��+6g/y�����-4.�!l�+�o����ԏ�U}ZVñcr�q����Ԁ0wICY0�剂����0?W1z��1��D2��Iˢ߁a�OMxS�ϔN�Sz ��66B+�\'��Hf�C���W��.~A\n��w���Ί\\\'�N�}c���k���B�P�u��e_��P�|#(��#�|\'�bD�qJ>9¹r�A��8mP[\Z���g�h`���0`-�+ii��}��pȡ�S�ni�U��3�٨v�^\0iWT����`�p�����^i��:�w�\nx999jXێ��#�(���\rB�iy,�\"݆��F��Ћڔ�l�Tz���vh��$O<�R3�ǉ��89n]�l�\"w�[��,�<��܃�+�(�\0<��r ��O\"&%�c��-��i\0��\018e�S�Օ�nz����M���k������o����wOT>m=��rl492Y��;�ʧ�b�;��͜���A��ƥ��������g�8�pd�@��q?��;n\Z�I}��!ۤ��0<jyH;ɂ��t|��c�/��.U��ʰk�͂ϴFz�h\0XXX�Ǥ\r�̿=�)}2;+�:�sB������jCt�!@��t�)0�=����i.�\ZE�/[�P�B���9�PC���-�����x��V8ټ�����<��!��`�h�.j�x$���|J����94/Ք��3G��tw�������RG��O�ߌn\0�����|={�2�6��z��/	���0O�#\r��f�\\\"��x���\r�9��81y����P<:�3���E_<821ؙ��HD��u�w����6+�y�¼\r�&>{�\'�z�	<����{�=���(��5BAX���b|�����M!R\0ؖ�U2�iij]��)\\7����@@anĪU�1�c��&#�^�۟����}8�GZ��Ĥ�F�Z���\\T�[�҅gp�&6����6(��o�!׵(��g	�r�C���=j���0&.�+s�+u�_P�*qNB:g��eQ.�L5G\n�Kgs��-�?Oל/[��|����\',\"g���#\'B���2ql�Np�Š��T�ΠB�1n���N��Y;���ߕ-�rk���8x1,�vK�=�{b����9�3vJ�\"yw����?B���\"yc�4O\ZL-ځmWaNTp0�wú���#��F�����2Qr)�&B�A�c��O�s�;u��F����f�n������G2ц&==]B��6������NS�9o�`1p��ڵk1o�<���O�ʓ�=� p��v�Te��L�Ǎn�C^�!��r��\rb���q�阼�p!&��}\\�Տ�m1��=�)��%A�/\0��_|�=��d%���y�+��B���A��D�#닗u��ul��C�]�0�` ���d\\��2��rG���M��rV��i/�n*u�IIk�+\r�G�<�i�r��k�R��Y��`��\0���w�@d���UB��u+�J�����#Á ���Z}�W�o���� ,���3��嗹\Zu�)���8�~��;$m\0���ju���\"*E�����4����c�NDh� ѳ��+Y�L�ǂΠ0!^o�`�qm/���\'�\nѧ��>��Un�_��z�L�O�9\'�$��ʃ/�^�vG<��)6�.��i�\'�F�KX�0���\\\\�i?���Up��ꦂ%��w�����t��]��i�=m^�V��UcD�H���Bq8�;��=s��+m��WY�Z���_��<x\'�{�=x�gq��K{�.�y�^\\i�9��6A%����ζ-P\0���t����(�BT\0��E���8��%55�4�\'$GC��BY���H#N�Ծ�\0�?�|��s}?��sh�0l-^��Lj�a��.�_s��i�p�x����1�oB��N���=\n>��#�S\n�SE�N��:�B�p]�(0���\00q����%p�)$���$��4�sm_�3�aFD�B\"�r/0ɵ���/��a�Oa�F��b��H@���b�8��$~�!6T��g�,C�kc���-[��:۶������Q d��#���\";\'!!�$�6YiW���!�-^)�\'�Y�t�mʲ�X�ժ�v�jc㼈��(�H�9�L�m5n���\r2�xQN�8�$N}����3t��&��w��	W|����0 ��\\q��\\�<M�eC&�A��r	���	����u9\0���ER��\n@ތ�A�8��ה�E����9��L�h�j�b`�s%Z�%�X�\r~t�@�Wr$B�6[֭�\r�J-\'$%�裏�ر/�����;�`��ޯ�V\rAAA!V����m\\�G rE��2J�ڈ�\0D�Ca6l�ʕ+1�B<��7�S%B*A*]i�ť�d2N�q\r��v0�9rb�����h�DlB��Դ��|4\n���A�W�4T�A�����j����� ,��_�Òe�`E�%9p��N@\'w2�3�)1Y�D��D�%��w�����m-h�M��os�Am6���B|��7�X�\"��\0�	�.��F�o�ƀ�\"Y9�8���q�~�!Y4��{�ʧ��ee�e�������W���j�ғ��m\'wN8�������ĄDi{����@T\0�@ @II�\n\0s��ç��g�}N\'���P�x�oHnD���v2:︷��H��9O�6�tI���Dl|n�	Km����2���w��0v)�\0�34^7Q��\07#RF�t�T��(T�s�Ɏxu��A֌&�Cu��Ed�rn��F�oeܒ�`\0n�[�,��f්5(�� G���}h���{f6����}�H$���r56U��HP)\0D�;Z�������m[\0Gs�y�����ѣG\0�m�ml�@��D��JVV�6�@$R��gK~=rfq����pHe�qt�k�����S�	\"�t��/uA��a|�2����dl�g�����^�v��P2z��[�������j@���w.jS�ik�`e$Uaa�S�+�в�0ѷܥp�0�\r���8��4RN�?3v�mǞ�}��[��dvR+�(Z~\0��}�,V�s9����wf_�@(1rH��Dbb<�Ё���Vj�$;eE�����0���1l5u��\n��FlB<.���y<�^Gh��Ρo\0B^䔅#�a����\nL�@�����	�D`p!���P��f鳆�9��\n��N�r�e��䰿�;�5��O.�{��<�f��J�,r]��{�R.ܰj`8\r�f�������\\dvϖVZ�RE��?����4�����IyY�_(פ�x}�����,77W�i@��#�K\"�B���|$;\'���ǦB@�\rG�� HC+�N[��T�BR@�h��l��4odz@��C�\\�o�y��\"������6�#��uT��)�EF���Fݚ��)���}�2|^4e�&���\"���.��~�`.J\Z�K���PW.�<N$vΑ��٭��mR\'N)�ٳg���\\m2�%Ph����]]�B�ע��m�֛	J�\0�Q\0��ҹ��	6kڪf�XE�wb������l[���ӟB��Ȱ~ڷOK�\0u/dP��T���Gʦ[wT����j�5����ԙ����5�Q��\"�Y��  e��٩#qm��0(�7ܡX��n鏉qr\'�(�o̘1��S�s��Ozn+Q�SD�\Z�Vf[�{<^�>�;n[�Kºu�D �b�ss����+���$o��Oc7�Mb�#�V�k�\ZS\r�5b�dLJ\ZХ�Z�s�Ċ�M�C��\0G�BX_�^�h��o�v��v����nI��Y��w��Ľ+LaxSJ�O�u�N�����M�f�Y��\05�s�N:�o�u��zU�\n\0�����ӥSg��<�A��E8}(�8��\"�J�rD6I.��!�m]3s�[bκ� ��?w�����|=��QSn0D \n;̊\0�>���G8�6+a\\>)#���V{�|����K�R��#��~Q�%tA\n.H���G\"�,A��]�f�SKF�w9\\�MMD9�pH���maհr�*̟?_�[c�^�E�=\';v쨾�I�L>����QD�n��H��rź�m@�2�(�?|����4[fXX��	I�p��[��\0z�z���%����j�M��&?���XS�\0s��׵�1	p����-@�#��\n����;�g�[s�M�bp\\wĆh�E\'-v/3Sm<���ܽ��1���ђ(ZӦM���dۂ�i*]�v��*sQf_;�@\r�̟�#\\>�������V֔�$HF�l��ظr�2�6a��#6!N�i�r:u�८ �z�� ���h(As7=�|3�\0o��R�#%	�e �7!@\rl.t��E\'g\Zb|���kc2���P����np������Q4JƤo}��Ds�\r�\0�����3О�ō\ZV!*\0Ԁ=�CA�$�Hlk��c���C8b����0��$�ī�e:iUGݺ��� �ᐸ���!�8f�z�,֭{�sYG;\Z�te��\rg��2s��ѩ9��ԉ&|���6�RG�:%��,�8ңa�zE��m��S�I�N�$H~r�̨��[t@K�e�P��?M�	.}��ХK�b/�����@T\0�6{�Ȟ?�\\Ҷ�a��E��F��kW-�5��#[���]5D���q�����B��%sU���݁s���(�@�\0��NL���*\'g�%�Slh<��\Z׵©��3��e�GU��,C��9kI4��[>�\'���=N��%�����t���I�(O�_��#hPh��1�6`چ	Q�mҳ��O�y|>��4mR�6��={��O\Z�)\0� ��ضj�`\0��(}��\0ј[�A�+�~�t9���l�򊰕����/z� ����0!хy^�;�i�\r�G�=��|a����T���fN�]@y:��MI�3!N���E�|��A|��7�9�68�<u��\r^���e�H@�\"Z*5��C��)\0�p=irr2���Ԗ;覝����d��l�f���P�a��T���%��$\"\0��ǉ�o������eͷˉX���t�/V���)�!`s�HP�fSQ{�)���\\o?�1��a�/*~R�NfGD���`c�E](.)�O?�d�m[ �NMMQ�c����EQ;�@ ��G8\n��$B��bJ.ڱ��YÛF8�7��{O<��s�2yRRE8i\"HH�(*�\'��-�KZ5~2*�V��0�ɣ��fR�~�7�m@���	��K�.�%�^D�\0�nC�#�?��8��0>NJ�h��=@|�,����%���U��Qd�bs \r��II�ue�[�\Zo�\'ī\0`�D�)�@\r����m�����kDJ�\r�ӈJ�K��A�����7�ϟ�OǍ�	\'�^���o߾��7$��7�z�OEN�Z���k���E|�0)\n9�]���!�2�M/�����ȸc�vb�Ee:%c9G^��)��)m�ڋ�<�G�������c�e��T�W�o�!��@L�h�_��ZڈS��m	d�4\0���\"�2�浨\0P;�@`��WP\0�ݻ���<l�����r�\'�K.�Ӧ�����ENv�2Q�<���g�I���������K��2�0�Z	�<������8]�ӻ�vR;�d�<v	�qD���ȅ�\\�T�b�	������/\"�>rԶ�ѷ�+V���Z��gv��G�G�wt��~D�z��Z�R\0�J\0+�8lm��d����8��S��G����ǽw߃��w�>��zJ9B��}��)))M��廎���uظ�/���:��+։��8<���������Q�RN�>-�&A^To��N�Ȥ8����@(�[+�g~�nE�A�0y�d�Wp��m		��Թ��l�D���\0�%I\n�����������\\�EB&��8�C�����f��g��^���}{ ��Q�W\r�\nlڹ�0z�1��g��\0�:!x�Y��b�w���_k���=�0�8a�ܦS3%I�ܭ�X\"y����,2�ˏ!Z� �2���r?R`�/x�i��y^9��ˎI�l��V����,(��$�^hM�BA���{MSZ�>��`MVJr��&�̟6R4\0L�O��ʍ�vDK������WM���6����=�ॗ�b�ix��7q�a�!--�	���PuT=�O�\"y�YgWw5����P )X7��K�JK�i��h�n.�K�Q�49�^���\\XOZ��P��k�P�\0R>�0�P\0.El�ܚ�p���g��|�G��@|7�}�0���F4��(\Z����˖/�ζ�^���R���*�M������Vǩ���)\0lm��-#*\0�J�d�d�lH����H��g��!x�����Ij�w�q�#?/�Z�\r鶿Ɲ\n-Z��c�⨣�Byy�6n�\r>����)K���[:�e%f�渥oB�0z���n�݇����wq��q!L\Z)!$�\rN��\Z\0g(����Ə~�^��p������K���b-��>�~@\r�����B��;�?��#&~�=.��2�J%�9PZ�t�_�~HJLԩ[�0*ɪE�(�=���p\n��\0���`�@3������s����ܹ��vS�7o;�06�s������z�Ϥ�&�Pp��7�Q��\n�[�+�r6�n��M���Q�_7����\r�zz~.v얍N�r�YB��Y�ꐬ{$�V((�6��v`_TH�*8�.�=�Ҷ����1��!.-Q�����h\Zؗ׮]�ￛ�lm���H|M�#5-\r#G����!C���;�Ĥ�\'��Ds�@ ������#^h5�?iw��ԏ�\0P� ��S:劀a�yy\Z�HȬ�n�\Z���̈).��J�T�o��7���P	~�`\0�~�\n�6�p(��x�M��*�J8�أ%��5�I�:\njP�WW���eE+Q�v6\\.���1�F�WS�v/L�/L�QT�(�Ȅ�[7�M���O���0�ME��;����7w����N=�ѽO��&�C�f4\"	NiS6�%��db�!\n�%m���\"��!IH�옎�[ڏ�!����bd����`����t�1q�dl,��i\'4.��\rr,\r��TJ�!������{��;�+}]���\'��4ȫ�@#ÈÐסCe�q�s�(X�.�*Ӵ�tU��Vۃk\\|��m�p��QԊƕ�v6&j�tO�uh�\Z���Ûo�U��m0N�k�͚�[n�cƌAIII%�ի7\r��DH���׺���b�!V\Z=i}�$}�`��aќ�����eaMɪ\nj�q�^8��pP0��Z���A���W��\r�pX�l$\n�4-C��	}$��Z�rG����Tt����(R\\����ŏ`y9t���d��LwX�.)6L\'̎�m;��Ql�a�k�5aa��q�����,y*>��}9߿��hs M:���LEj�5`=���+椉�0<x���N\'(�V\Z�Q�_/��f�ġ$���ݺwA\\\\��>��S��i	�1v��\r�;����f��V�F�#.��b�]�\\�h�4��\Z�$�C��㦂qV���p����hF���i�,��v��Af-5��\0pP^�!\r\0�sy\\H�HF�^��Mq���HQ�\\����B��Vjz�\0�ԥ�����=��(�\n2\\n���bѢ�͚��&}�Yg!!)Q��+�ƾ����\0����i�Ԕ�Uu)��O>�$}�QufF%��.Y�3f̰�j\Z�\r�c�N����8��]B+��Q� �]���\"-=ݺ�4�\\�R\Z�L��t\n���\r�^{��$�Gq��go�Hy����hC�d��W���M�j��eX8�3頞\Z:�f��0F:!ՙӈ϶���5�%qA?v�JGg�^���#�φ���\'qx=�휎]R%��\\�V|��d4��R�,O~\Z��3�<�L{{�G[G_{�5U��da�4<VzdU[�[���]������=�܃ݻ�j����bs�W`����}�����Żﾋ\nIgs�1?_}�$���%��Vh��]\"*\0ld�d�j ��F0�w�Q��)��uՉ�y-	�@�?��5�KM8p����՚���=a�^��x�H�����9�C:X�5��(++�w圑����$}�?n톿������-���\"e��h�jyΠ��&ΐ�2lo`p8^5]9��qn�\"�K��u/eh�����9۪�U�g����	JMO@���弤\01�a���8��\Z+������+�\Z���Ed4�F�=�g3�o\'>��\r,0�\r.\\�i?�,�HW���\Z`YW*\Z��ĵ�n{�s�Npi�cl��w�.�^x=%)	]t~���}�m�3\Z	���ʶ//����7$���q�uכ�����mh�0x�`��.��YHO�̯E����n$�o�0^N$KOLL�����j��	�a͚5ʬ�zZZ:N8���>�m~��J�ӤS�#�K��MW+�d�W�6,MРGw\'��ʆ�Ne	Fr!G�~��a�A���;�\n�\n�G���3ngb4\Z�kK$�i��[�LHG(,�&�ݯ�`�ףh:�����ۢp4��n�/��c�;��ߗ(+-���*K�z(>��3�0q.��2�y��T����f�3iirJ2z����8���sd\"��#J�\0:��TiZ��gd ��=�cނ��\r�^�\Z�K��<�N�IC��йsg֧����[\r[�5���U���{ￏ�K���`\Z���~� ���Q�_��8������6���7�ڡ-��DH�1&=xC\Z@H�]�W�gP��d\r�w�<Փ=\"�E�n�Hت����;�N�Gl�*��Z[Mt;��U�0��	���u�#��ƍ��G�����}�Q,]�A��2Z���@~�����4=��s�y�ݿ�NR�#\r�tZ6-MGh9��4S�E���-��\r�����!A$M��&i=a�6\\�����������sm��)S4��^�m�|�^{-V�X��� }d����\'���\n�)�u�F�1�R�i�B+uE���^٩��Z\"�������aZ���,��h�n)�I1��B���!p��s7\rd�>\'�n�-�X�>�׵�!\'bE\0�϶I0].�e?B��ra�eIh���I`����Q\\\\l�Ӣ#�Gf��\r�^z��$9�����_i���>Yu<����W_��W���G�F�M����h�������x��o����h)5U���\r0P$YQ���D��#��~��U�Е�Qj�@GA�ޗ{DvZ�}����y���GÌ_f�ٿ�Ï>�aG�SN9�ׯ��x`�A�	���D/��rc�\"aРL���=�/y�pzE�u��\\�`i�1��9C1�(mi׌T�}��>��&�綘�P78����A��\0�d]���DO�jk3�ֿ�0b�\\��!�P��E�r���!���Ը���vԒ�����uk�ʫ�`���I��(��=u�	\n*P#F��K/��q��CRb�u��`�r\"1���; 1>q1q��p�qQXj)�bSDK���zl\\,���D�nݑ�aV4I��w\n7��{�V���.ck��/P�SW_s5v�m7�:j�=�8|��׺�ז�i���~�aԮ��4�[��\n���+%$��Yݜݝ�n8��V��K�ff��R�R����m�_Y�-�D\Z! o�P�D@S�\\���Ns�6DT>G\0Y��H9ERs��B��^�4 n*HK�7-M�U�ii�����SN>E�lY�M�f�\Z�PI��֭g���~�������d�w�GvN�(g���t	��/\0\0�lIDAT\\��(�CT\0h(Y��q A��v�eѸ�n`���ko��Y�)�\r��9���+�����Zd\'��t}衇�4»＋[n�EW-4�#`��-��yƯL�n~=��(����G�h�AN�`�ؐh���ֳ����[�4O�H\Z�wdWo;�őw�	o�\\ 1Δ��*�(\Z2[�}_�j5>�t��������Ÿq���|3�w連57�QA@*딓OU���$d�Ϟ�V��]p>����*8�u��\0>SVV���~�Y#L°aC���@�@���nr޷D�F��e�H��I����ѳgOe�U�_���%��8N����6+W�Y�YT\\�K/�����\Z���\n;-^�k�w��o`�@NO�1b�p�1z��)MD���|����	ڡ��h�� ̶\\ׄE�SM�X8�Mc�,9�53^�I�L8�u[%jJ���TF@S!M��7�?���I�@`z�3m\\㑤xt��6���\"Bu�L�s�/��\"~�K�e铏4����?IOO�5�^�_~��W^~I7sJt.��\n\"�@g?kW��XI���{莧~��+,�E�:�GuPd]�~*^����76&V�j��&U)<g3����(�n �!(\0��x\'�bb<:v�C~~!L��o�X���.\\���y�Q̝;k׭�� 7��`?<��Sژ�aj��u�G�\0��/���+���;:x�v�௽�Z}�>ؚBmA���Z�d\"ʋ�\nc����p�^5���:��8��U{e� Qډ��wD�����-.����vo��B��m�m�A����;��$I����&�i�dm�`��T����:�g�]���C���|�%i^�}G}&|�5&�0	��}:w�d=m�\Za��>�DGKy\n�0��8�ēЯ��}X�zy俕�NS�)�N�;!7\'[�	���t4��%(t�1�(�C�|�ka{��TiY���/\\�/_~��W�4�J)Q�A��R\rt�Iɖ령W�����e�j�a�\\Ns��7X+��/���d��v��cҤIz]�z��7������#��>�3�D�cb���<�ѐ�4&��d�C�\\82;	.�Y�[�`\0˿���9ᔶe춾�����OG����-L�Z,�HQ�ZS@��}Z�W{����?�8UΫ�$�P��R�!�ￛ ��]�������4>��Z]��8��ꨀ\r\n�o^�\"EaEW@	�L�� m<唓0F\'��v��\ri����XO����u��>hO����Ki���r	\n��Kh`�0̙K�Ԣ�Β�9�0z�|��/�Ǟ{�i���!+���yp=�|�),X0_�5�\0ؠe�S��](X3�K������K����H�\'3n���WA��!�e����6h#v�L��;��:�kۖ�-�h\0�s`�uh�9L�~���-[���v�6S]��R]��D�Y�f�����s�m��R��FˤoMi�\\v��}z�\"n7N��(\Z��\0�H�j��X3��R���M� Q�T-U��N�o�=\Z�>��}���ko��]p�S�����74\\���c����W\\���Wh��aM(V�	\n1��O�!]�z�v�	U!���Vh8��ml�ʌE�����ֻ�����&��%�Vsek�#1��a=��&F���<U�Q�)���<�ē��Y��\'m)���j��|�5���?�|�\r�JJ%nǐR����	ҩ�~\'N��矏��\\�N�C͟�Bm\Z\Z\nf����#==]�p���x=���^�Ԙ8�oD�w#��e&��(��y�6�i�]�t��/��q�|�]G��!���ڑ�wݺux��G�ۨQ��+�h�\"ޕ�t�i����P�W(X�+-�Q��RwuH=�ફ_���18ΉDC�	~�!�[R\"$�\0����\03%#�u��+3Iʊ��?#@1hQ�sv��v�*����ŋ��\Z�ob�ц(Y�\Zc-))����;���g�}+W���Z�� @�ĥ�>��:3{��G�g\n�����۠pBR;L�\Z�Q��?���7����Q����h�+u��^�{�C�]��Ŀ��\\�����_�ȣ����f�M\0;�$F�i3`��>b���Z,��yN띖B�_��?�\r�o�|�_1e��K8�S$�P0�lg{f$\"&�6A��J�z�p���Pl󖆶���wL�G������-�aX�t)^�\r��&æmt4F{��O;M��qP����6k6.������+����~�J$�Bb�;�9�-����{�?G~�\Z$Wֳ�P4����ЫWOu���Y8�@:g?��#*\04�4��(}r���\0;��4�!���)���F�����8���SOa谡�&x���jT�꯵�N�E����Ot�Z9���Z��f��0�B�ʈC�;V�UI$��o{u�t�����y���M�2�J󉶞ƃ�uO>�\n7�\Z�K��o�={��O<���O���ƛ\ZHsV�Y����ct�!���uz�>Ċ 1b�W\\���Q3���2\rÇ\r�K�/����q�Qa��4Q��ld*���K�YZ��%w�f���P6��ƥ�^��7lPPA@��(/ǋc�bЎ;��ˮ����|��ûpI0U�wB��t/�;�>�z�jI_}�9BIÊ�>C�������`Gt�V��10ލRS�|}	ws���Gc\Z\n�@Z�\0�b��,�+-��O!`˥�n%�\"焵���4�-n�����OӦ��H�#�&}0t �җ\Z����G�]v��C�=ݏ�2���O�����|�\r�8�H8\0�}�q��  \n���HM9�%��+u��S��ۤH\\9d�ScAab�С�}��X4�������hZ-DQ9\n@)�\0G��з��\\�1(�x�z�\nb��4����yX�l�u�z���i�J}�1B(�a�/��{��+��`�Ŭ����r,N� �1��v��v�I��G͈DP��m=��	��|p�%!��W�%)rTmF��`�Ȍ���@X�G�0�����G��ZN�p8��[n���R4������-@��n`���ꪫЯ_\\q���?�פT8�����[��ۯ�h�bl�Hmzh<�@#�Ff,Z�uʫ3d�v9�z��4�(�f��XѰ+����s��v����WA��ܛ�l]���\0&}?o��:z��-�vi\Z�3F������@�?1�������;��J��\nW0����w��q$�)��`��lq0�76p�(i�����|����^��yi���0�n �w�K/aɒ%J�H��ڣ�5�\nE�]U[\'��ٿ���_��1����Cd�\Z~��+V��Dx�I6L���\Z�\r��.X�q��uu&����yP��c�v%%���s���x��sаҏb����V!��ڵ���\'�6tB���T_V^��o���$.�E�\'v]�׍������|�1�4X�����]{]���pP�����9�,����	��pr䗶H~u\Z�\"��@��D���\"o�`��dm,Fyi�2\\GB\n�Y�r��I��Bs��|#H{�6�u�����_����{��9����E]d���xD�n(��O?�A��C�����c�>*��L\'�>�PHo�[���?99E�.���֦ҳ�Q�`���,��p#\n\n�h�5��F�so�ee��S��eQ��D\r��^�}ν��IC,;�����0��0r�]*�S�@�������.��4��8�.t�ܨ�b�7O�ջ�r��G%�R��HM풗�x���z���)�aK�����@E\0�V��&��C�t����*��+��/1m���.u������I��l�Q���P�./��=��\'�TH_�VN*J�r˭HOϐ�%���/�=�7>����tk������J�\\E;%ҍ`U�9�\\]��aR�=��ST��ު��h;i2\Zǝ��Η�#\0�$%9���M5|��>�L\Z�uQ�.8�Zc�h����=�}�9�|�\r�1ܺ[�&�ͷ�����~���?��t~�~c�e��]麅�;�}e6M%F�\"���#�	�3�!)^t�9���\n���^�[�A�m�=�\"\Zrz�\0!�[�Ƭ�z�Ep���ޜi������;w��Yu4��H?F���w�&Lt萡�,Lġ���NF�m�v݈8srrЫwo$�O��?����x4�� *\04�0\\�b&\'qS�d]`ߏ\r��he�ꫯbͺuB�i\Ze޿��˰����r;���Ӎ��x�M�2b��\n��	2x2���N��<�]�K�´�ڥ�:�l}�9p�D�l�gX�t��Ӻ���X����vIO�\'D�\n���Z,~2w�Ҡ�&��P��\\Ω-�P ���h̉�li4�۲����XT7Wp������`u����ަ�ڶ\ZW��S��;��J�Op�ʎ�vCo��&>��CuyN����[i���0+�l\ZX[�(�pd�F�		J��c�+㍢�\n\0�;�(\0�/\0w��\Z��i\Z�mB�!�._�\\�\0�5v�$��������cڴixi�K2t��G\"b���8���q����o�FE��M\'Ft�1q�$<��jX��&�̆�%��a��W�� W�c�@��m� �7�? �qa?F�% E�i`�I���Z,srv	�tb��(�PD�j��s�������c����LaMh*�˵\\8�jd�@GQ컫V�Ɲw݅��2�*�Y~\ZYh6�<����.#��@DS�������B/Dm�웕-��&�њ��St�;h� �W�?�q���ƋQ�y�\n\0� ��8S�������9�ۧ�4^����\0���w?�͛+�\\ޗ�0�}���YYYFۗ�NB��`�?(��w��������>�Q����\0=�232�v{��GU��JK�ZBm A� ���y�\n��p	����o��߶2�r���&��~R>�dwL���d{�4ˤ��Z`�h���ϡ�pЃU+6�`}�$)Ȕ����3Ѻ�x��ᬎ*�Z�z�e�I����.)W���c��\0�=����@G��M�ԝ9��cC����)I��;�Xm�7LD<���v�#j����9�q�d�w�9����G�y|3�_���t��c��Ӝ�l����HKWE�#��Nnm4�Qԏ�\0��13m\0�L9\"��n�5k�=�+���\n\n���޹�㉴@��%��㧡_@�����@�~���\0��׳{\\��\"p4Q[���.��r��X1g�hs1@h뻜m�.�ܥ<s��G��\"N��E��Ak-(��EGD>��W��ƍ�}D�A2�T�Z�O�sd��G����%s�,��4�;`��%���:|��0mj�m~���F+�+��\n�9�rfޣ����Nl�`�\nێ������,<p���<������l��������qT�^V������V>c����\n\0-\06F�3����U�����o�E���GI�ԟp�!�㯿��E\r��������|��?B�I�?@[�=[\n�����p�%���SMKɭ\\?���ӝ��Oa�,ǟ?���u5�JH\Z���\rg(F4�xx��xd����m=�$jR��*�}X�x\r\n֕j#��\\��+�.�M >�X�r�#t�~^B�B�Q��\"I�\0\"���b�ٍx��ӧ��u�RznBmhX]����\\t�D��*���R\\~���۰�N;��\n�_4�;�r��C��ч�w�U���zK���8hG���u#\0p�i�\n\'\r�n� *\0��(�Q\0���$�1z4\\l��P\Z��Ґo�?����?�J�<�g���={��R����CGv՚�m�ǟ|�O?�!ݠƀ��y�a�[0T���W�B�bf~�,\\�p�9�P�����F�OЉ�Bw�wI����sˬ���A�4DC��ʱt�\n}�t���C���O8�R�X�ˌ�@��i��k\n�eئ,�����o��u׭[�;�S���N�Q���c�׆��xڴ�����ѿ��{���YZ��W��)����cF��iSU�a�|Y�C�#�?t�A\"�Lǭ�ܬ�ÞhLz��Q�vU�O�*NC�V:��أ \\7��(�[[��O4쒲R��_�x���/7���O�jj[����!z.��U?}p���o(..�[�|�<kޱ�3?6��&N��3O?�,��rNN�Q��ۈ�kDP��Y4J��2(-PW��6�HT:3h���\"�͡]��ꨐjMJ�Vk�-A�L9ji��ߍ��%X�j��\0�Z�5i��?���G؆�O@?����y�f�lI�32��H헯���$�<���|���7��o,Z�H�������$�+Y���[�f\r^}�u����X���D�(����-[�^xK�/�U\0�	�f�_�A�g�Q#q��\'cժU�lI�I[ChH]�i��9r������\rS��+����_�RQ���T)��\0��ѣGK��ܰ�P��_Whh#�g9l�Q��Ej��Cc`C���K1l�P9Hzu�^%��B�DӲ�H��AW���G�a�2��ȴ�5��#�Ni1�wU��Aͨ�F�%�){��W���l�*�_S���(ju�mm�Px?��ǲY�Ru$��!���E��H�S�\ZZ��m\"ԉ4��3��矧��@P���<P�m�� �T`4s2Pz\Z}�w0x�s̱X�dк�l\"���/��#�<p?\n\n���A��S~G����R�aя��j�tf�%��\"\0�ҿ�x1�rˈ��:�@�L�^�\"@ZZ*�wﮆw�@3�ę6�ih\0�/�Яo_�+�����i��jQI�JLH�c�=�Km��i�+�\0cH� ��xk���{���}�����r��c�;��IV�mo�|���Q�������t8d,�q�Pݨ-�Z�1n��t��[�YR��\\O��E��u�Ï>��/�/�d�X�k��\r499I.H����oii�N���T�l �9����/������Q�Hp%�Ƣ����[����$\"`z\r��]��\"��#\0I�I��Ƙ�JG�h	D���(�+\"��X�Z������#C%t�O-�=j�z\'�:f\'�OH���_����c��V	=��rө�w�5W]-GV<��:���o)��i&,	�cղB�p�N��kNI�km��sH��C��y��$	AU�AK���>��9\rd4�\n�+�a��\"�$�Tnp	 9xD���&����}L���Nx(��y%/چZ:?u#(�¹Nڋ�c�}��A���!Z�Ϻ�>���jgx��vH!�R���p��駟ƏS~-���hӴ���j}o�#!���/�v�i8��#1c�ӎ�x���1{���ͪ~����bב�\"91iJK��h�.��K���i��nDm\0Z6��p,;0�����kVc��z�U`n��|�;��g�q�4�a�1��Fpy��}t�m>M~6}�n0&-f.9W0�U��#�k���[�mb�����[\"q��Gh���x��GI�U�Z:�_�O�Dޔ%C8��5%X���r���֏@\0E�:Q���8B,�\0WqI��-\0�Q�Ӎ���i\Z����~h������p�W�����n��\r�����i���qҡ�ԟ.��c�AZz\ZV�^��*\\�Wؼe���.X�@�͟?_=��ӎ���PVZ^#ݍ�8�����.�32ґ�����T�XAMB�D�(�G�1PJ\n2RӐ������G�Z���� ����ǿ����ﱇZ첧�F!ϲCsގ�F��3I���S��#*�7���. Z�U�S�?����r��2�����gJS�A����ڈ\\�2+FƂ�R�;Q\\�Ê%�am!�5{�dY�-�I%؄x\r�||�(Ak�L���?ɩMb}���y^�n���Zl���F�\0�٧wo����(�dY��r(�K�o��&��������:u���fI酀��6�|���/��*��Gu6��~\'24��cƌ�\\N͹.�S7��3D]銢q�\n\0�\06VY�@篒�T�6lX�jC���޽{7���x䡇���bnDvB�8��}����a���-[ћ8r���r�\Z�4��UsH~W�0��g��]yC�i��V�2S���8��]��$�R��g��O4��זo^�r�����bQ!J7��Iz�I�������S�t���[�֕-\0I|�\"���j�4��%����h�b5�k	pÜ��~��ׄ]����G�/f��~�!:�@�]��-�wa�F���Of�����̲�����$�3)�Ɉ���?R�����6�FT\0h%p��v������NV-\r�H�����3�8S�	�s̞j��y3�u�+���>�h\\p�X�~V�Y�K/�L\r{د�淰�\0���k�6��� ��CD�Y�=��f�K�!�����\0��u��``\\\\\\</`��SM�FWX�J`��K�F�D�S��K�F�R���#4��}%.�\'��f�\"�I��-*\08�,(���L��&�*�6Ok��\n?na��?�T��H͹fh88�������I�ØL��K\Z0�Ft��x��w0�\\<��S�K�G4y_�p��$�����,`h.��g̞�uk�9NHN����9z!	�M�Ә���n�GA�hl���\" E$YNdd����`�����]�}�Q$\'%W���@ ��c�b��;a��/���7n>��ce��&M�0�ğ|�:�\Z�:�,�D{��X��x̝�>��sr�j�>aj[��4��\0HO&�����A�l���%h4,\'j�A�+�h�*�Z�^�C�\Z]��[$��aSX���nM�~�=�<ٲ`��?_a	�̇u}{A@�$�p���Ƨ��Ô)\r��m����Si9��ӕ.���߸馛tw@�l��V�k<v5J��322���y�D��F8��z*��DT\0h%PZ����+��T\0q��$7R�����SO��iS���{��b��T}���x�bu�Q8���qc�&;��P�]��	pJ�il�@\r�DۥvI�x��X8s<!�\\�]?�\n��6��2��L>�T�\rdb����ԧD�U`���X�`-B>)��62Ʀ�Z�6Bͷ,��6&�ܸz��~�\n���2h$����s��a_���B�a�;�g�\"�]����?�8����A�=O�]�f�ғ�����k����I��⋐��A�H�`B�A�\n�P@���=Z�K�D��/�0bc�LQ����\n�ՓE#]ЊP&/\r������$p(�^��+�u:\Zz��Wt\r?����o�u�/�����{�����T��\\��13�ϐ4�5rs�yi��0���%��Hz��Y\"$%\"9�3��\0���0[����Z�׻�yp`f�J��~�h�$�dXTzyq3`�RA_�V������!]˯�>ª���2����7���\'L�,+Ex�ry��7�7��n�.P�kw�m�_l��nm�}<��3�������_�w��V�}s�\"\\�~�h������Kg\\�H�%��ɟ�� :v��%�d��߯<�r;t������?s��:��^g{�߆֛�O�-�e�u�Sc������	n\n�\\.,��+V���i��v��E�\n`g�H��p\Z��R��4�]�v��P�	U�� �4�{|̡{9ZF8�/X�\'�|\n.���X�j-�]��ؽ�\\�j\Zv �qp>�s}^���I�_�\0���h��:���%ZϜ�/`ٌ�:J�uy��7om�n/)= C���*����!�{W�[#}<�|q��V�,n�(w`��2,��E*��fB\"�\ZUP���>ď���}͇�m4PNm���E!U߱�L�`�{ۆ�T���[�>fՑ���FM��P\'\"��\n!z\0�����Oq۝�QDb���:b8��أ�6u:���b���8���CI\rt\r��3��ʯ�N��L�:}��TW�T�[mif��v�<��;��;����$uI�劉�I�zbE�H��RQ�ִ�j銢Y�<e��Y��o{dæ0�t�CI�n�Mk�fd᪫��J�q���a��1j����g���n�s�n,�K���7�K����8ˍp@f��)��\Z��]���4/:&���M;�����Y��º��U��n�[����՟-�K7��@���͂��駞R7�A��n�\0�ZfL\'=�����G�b`3�N<	]t!�e	��M�����Õ+W����}O���.W���vKiBm����7��ao[\Z�)�VF�!12��r�=n�Y�+W����Cc@m!���EX�z5;�P,\\�\0g�y�zc�n|�[�2��P�	J֯�\rΠ�vPcA�:���i\'}	9C����Ip�)�TQjA�R����=.�0� ֬,ĚŢi��c4֤FU�ϲɝ~i���B+	����k�!҆n�,�_�~T��Ua�\n��Z�U�����w�QFZ����x����<���[�}�l�)��1~2�	�~�C9�z�S��lgƌ�j�D��� � ��뮻��gdf�p@ύ��L�b塑��\"����n��Y9��%J�h�\"��aD9U�i�E-��%e�(�%���\"���p�B,Z����ǳ�>���)OSd�֛�H�.�y��YpW/��t��m��L�:G8``���j�`�0�\0~a�n]Vg��v�}��<Z�c�\'1�澙n-T	��:�qz�L�J�Q\n#\0��D�+�km�4\Z�_3��6a�ER\'6 X��{��þ������,8���Q��l87��TU�7Ek��1��ݞ>��6d�WU�~�?�_|��Ǫ�k�[�H\0ͳy���m�����G~��v�	�8��������Uip�������*��e�^-�_aA���ט}��|���􃪝v��ԩ#n���fh��&�4�;��s����.]��s������I�����$�+�È�(�����MH)US(--�v����?�Pi�)t��|��|E7�0��E	��������[o�!Rz\n&L��\"�ԍ���K�VmHQe�硼��v���|T��R�MfK�,ϰ=~kLJ$��G�W2mU0�]�R�u�&\'���V��zEJ\n������ꇝ�zjE`�lQ�7��2�V.EXU�E���zm$�X���+9F�H�k�o�6ԶƁ��\n������W�H�h_�r���Մ�J�qñ��z#F�qr��1G�_��9ύ��Јի���q�.��-��O�H��]���W�<�\"R/+-SGA&|���[���0ia�~���ҥ�:���~�<�*���8u)�ÿ́(ZQ`�n�\0�4uU�J�s����|J�iK���r9q�1G�ǟ@Bb�:�HG�V�\0�LS�.�X�)�T��@�Bx6\"�S8b���j55�����\n���?;	1� <!\ZE�B��̚$�$Z���8�H��]��A�_]��ף�ا�06=�$lU�k�^ۭ-�����!�ӺbS{z[,w�K�-n�.��&�P>���k�/y*))ſo�7&�Fιx���� �7����w����^{\n�4}�̒��G�t�K�j�w�F/{Fh��:�O.T��r�����4I��Pq�71�U���!u/I7��9}������`\"�2�7���(�A�P�(j���V�\Z� ��?>.�rh�F��@C�#��<��S�O7ٴK�����RݗR�`��-4�89-D��ú��b�7��\"Q�io�U�\n��A7�t~�~\Z\\Bs�p����(ʦ\\�932�0L�hu\"#���X��\0��ņե�)�o����ʊa�@>˥V�M�6ܺ��~5����J][�o��߂��׮]�K.�S�L�SӿuT.��7�#�?�9��*�aE�fD���?�<���&�s��n��If�@Z�^���=���Nm��\n;�-�F�^�\ZA\'%��Q���J���&�?�VET\0؂`�f#�1\r��.��ܹ3v9R��jL���jGu^M�Bf��I\'�sӍ7�ʫ�������|/24�7�#㗸~�[2?~�ҵ�%�L��un6]��9�?4ɋn^��-��\nw@xx@�M��$�81�Ę).�(�c�Ja�Vb��2u��<0�����U�N�4:\r��2	e��c�=���m(����koB�1��Z���d�\\t�E�V�\nR���S6�L��m�Z�3:2J�j�d$N���}��r���Ҧ�.r�ߏN8˖�0Q��WT��?�Q �U+��Q~��i�С��F�}\nh���@�\"蛄V��i-�����8��9P!��2D\n��\\Y�h�m\0���\'\nyZ7�����&/\\V��^{i��L�l:le0����\"��5���:�B.^#\Z��H��C\\|���a��*�Fˀ.�{z�\';	qa��淩�bg�8N��s�������\\���JQ^�cD�����`~6���fCʝ^�ׯ��B���֬��DO�N�͎	��e��LG{��L�1�\\s5V�^S�aVN5V�\\�|�:����2c��\r�6����8pƌ��s���3~���=N�:�	NQp�w�y%r_��6k��hrssqԑG���c\n�i��(�P��5��QlQ`�\r�$�	0���gdb֬�*-l�u�-�U�;�\\<����_Ӭ�7��%��ɸq�;�vh��S/wI�!_V.���%$fv���PD\0P��|�8$?�.�<�|�uDp�G>Ȕ���u%X�|�\n�uM?�~3r��!�t��m�{c��C/+3��Yr\0�ّ\'=I��T%�=	\0v���G�뮻QX �(�2��̈́%\0P����8����|��T9�����{�J����E�,aѢE�:i�}����:-��Z���ߎ`��v�A��8��c+=�u����_sJ���Z�\"*\0l���SP�eg��U��U7����I���[쬢5\\q����;������uu�u���#Z\n�0����ꇾ%�qY^����X�t�Rd���4�ܮiqG���vMO��q�BɎ��W��p9���CX���$T�=(�Uf�]�k�C��^���R@H�7�{�]H�.�0�޺�nA�ҿO>�n�EG\\,�M�&\"R����+Э[we��=\\]�%�\\Zg�뒴f����.7�b?7�݁_~�={�@���+��޽���/���7뚹����5j7����HO��~�4���̟�bˣeT�(\Z\r� �v\0��a ����Ht�/����ڥG���<^���\Z����D+tZD\",ڃ?N�*ڷm}À���{�:5��]����{�\'�*c�o�a���Y�V�-�#}��jce46j�~a4��a�H�ρ��Gf��W���ށ\rk��l�j,��E����J�h`ʦzh�p7�qq(O�S������[WNN%���M�/N:؁\Z��p��������)9�Vsa�\0\n�\\�O-�������n�M��<MW��o�O�0����!t���B��\\q啸��T�{��i��.��f�j��N|��\'�.�}+�FâW:�b��G!!>i��L�DjJ�2�Hÿ(�,�#\0[	��l���&ɹ��2�l�Y��\n���&D��-���oo��\\}�Ur.���Kev�\0n��mj���AL�_��nA��M�sl��C�!�K��/���`V,������Kʄ��[X��\'X~��a���B\Z�a�d<$E��a����au!J6��_a\\�rE��C�F�k>��r�N�篝\"�7n�s9�N[���`���8����D5�����ͳ���j̛7W�r�t73�:i����Y���.��9s�`����@aa�\n�{��!|�N�_��8��t�]���5���-�\r2T5��}��[:*//��)Sԇ\0G#�`钥����e����8��u�?;+yyy:BA:i���m-�M\0��3Z��#;1Y����\Z����9kh�̥\ZZ��P�`G��nU�ez���J�\"�Sk���Gqd�[�`\0g���᯿��xlx=�q�i�Ա�����m��<\'ˊ��a�ċ�j�4� �H��.ɩ*S���U����,�!���\Z�V(�@�h�kWmD��2���V%_��U����ȋ�ڗک\0��\0@{��u��<H6��\Z~Z���@ʮ=�J��j�[����~(���)��|P�0����SP�Rx����}OTe�<��n�۫W/�t��>|~��7�Y�V�.w������N��4�wO>{\"�u����K�U��t���� ��ǟ�2i�Z�o��%���o���_�4��K�⦁\Z��c�`�wD�0}���\r\0WA%�%�rb����eE�!*\0le�ѳò�E�p\\P�/��͛�:�CZQ\0�\\����V\n$$$tz�?/�\'���Ͽ���Ĉφ�H|�����Ja�����Ûo���N=U7��v�s�-�j\"H�G�A��F�X��W�##���y��7|��\nu�)�Cs��S�(f�~E!֬Z���2�Ay%d���3��5���������\n���2�\n���l�&Xd\0X�	#:����,�����F��,c�0������t#��%s��q����C9�<��n�k3Ge���n�������W�Z����c�Ua�}�S�N�3�o�{�������5m	�J�.]uT��ۧt\'�?��3��}Y�f5\0z�膃>)���H��tq@BB��E[�}T\0��\n\0[�\r^��v! �e�:������~�ڟ�:��Y�ԏi��2��P�B�C��s�-�U�z�-3z�~��t��\n��[�V��.�G���^�e�^�L����6�|䧟~������\rj%\\�Ný�uK�|�,$d�#6%C��\naz��>���I^���p�J��+Aɺb��#P!D\\4wn�����Y���_�Y��,;�WXIgb����\'L*\0�n��M[\0�.Yz�9���=0\rf�n����+U8���G��f�L���=�P/��IZ.f�J�I\\j�����3�8S��~��8h zv7���� Ѻ_x�E|��Gjp7h� �+4\\5q��w�&B��;�Cy�C�!JR!�y�����(L��c��o��/4�Cn�n�C�#���_MO�E�aQ�(�&��-&���&�Cytԥsg��*շ����N�S�|vw�ˣ��g�}6^{�5v� P����j;��W���0�,V�#�\'�����h T�h6�ǯB@؏��E����1w�{�i�t�v����S>�ػL��2�BBGc�{��z��H�Yf@ ƍ���K�s)����̀�`�6��WE��n+()-��?�+��\n�՚h���?\0/�����L���K.��~��ND�5�\rQ����?O�/��2<��3z�&v�m7�}��M�6�8�\0��O��y\Z<G��G�u���[��@O{��i$CI�B\0����-*!3.j�=�.��\"97̀Ħ��g��L����:*�g�,�:ߣ�v�\Z�.L�Y!(3D#:�ȣLj	�9!.o���h5��7h��,ak,�+�#��ҟ����nE����TS�	�п<�1\"�$�觪ٷFZ�;h#Q��W���Kآ�SP�N�8�\\s2g�@�0��_x�x�ͷ��B�!�8B`M/���]w�t@ϭ?��W��(��QG�C��`�q����/A������+�P{�q0�\r\"����:�+��k`�*\r\r�СC�㎃D�Iҡ2���`���D�\0��1l�\0Dyy�vj�<�B�:d$¢!��޸�`H<V�_�~N;�t5\"�8���q�U\\�g�w�pT�|8��30x��i�� �z=^��>x���u��梊@I���F���� �:���|\"�t���()��\\�-i\'s�$s!=��3���O~���y.� C��*�V(#F��s��!}Dk`F��V����}����\Zș�G$H�~M4O\\b���s����k�1\"|S+WM�\r�;q5�h?�e~�k���{ｧ΃�����N1PX(*)�i�����Ǜ>���A ����RoG�̬�����y����<�b�!*\0�(ѵ:9�G�; B\0��)ddf���҉\r��i�(E��%�9z�Fŵħ�~\Z���K},I$�7�zK5���5R��L�\\d���y��7C>W3u���8��s1c�.��~�DC�p��\0�j9��x����?�+>鉩����u�_�ؿ8��9h9Ӡ4q;Ae;�?��e8.^���T\\(��6�*ZH-\0�h�����\r�Fu�k��lAH�-��ɓ�݈�\'K?Z	�aP�c5����M!`鲥�{ｔ��Yⴚ���Ox���УgOĉ  \"m��^��3͜����0W�\'1���X�b9F�\Z��/�\04N����%L�L�\rCRR\"�;�h�v�U毖�YYHKMCB|��buD��(�,�@�=\n@�#4�#s�K�W�Y-�5��X��D��I��C�~jL�ͷ�h�|��K/Ñ�^k�$A��EH���	x�ᇰ�~�����0\\�p�)���`�J�i:�������A/�WlĔ%SQ��DJp�\n�uS=��CGp�P�TB%-��Ԣn��Y�.�JL�2	ȯ�F����1d��ߴ�b��|���+����w߃�/��\r8�/���2ϑ	�8�C6�<򙦁Sm�g���������O��Wb�x�Q�z��\r:UWZV�>={U��V7���k��&��B��3g�w�Ŵ��,�?|��ya|<�|��]�,\Z��n(U������%�\'��PZ�=E�0D�6v\rVg# (�u³~�z�Z�J�6��hg&�lω��7�x����]~��E_x�����W\"��?���6m\Z�=�\\|��x���E�ϩ���V8���0~��rϒ�5	�r$�P�i!��Yz��AN\r�ŭ�����1�7$x㑓�	����a���@u�a	@\n��Hm��P�`��r�ʍ��\0n����nEϑ.�����ߩ�v藃ea�G����j�l�43\r��\Z�t�A�ů$F����\r�{���W]��_yE���x��~;�<P_�v\r�J��8$p*A�Ց3��h�ї5\nA�A��{�W�m�Q��H�iˎ�u�{�ߺ��(�,6��b����~Ԧi=���N�����:yy��q��@jٶ��0��1�9QQ�Ò%K�Qe�d�7�x#R���i���JX��zک����2|��G���6C�HX֭[�Ï8�O��i�>�y�D�X1����k������_x�X��K��U��xf�˸w���~|N��j�&��]�r�7�*H]y=�v�o~w�tH�%���( T��i�a]ka�����9����s�=O=�4JJKt�ʐF�-D�H�������*;��G�Bd���r��8�KnE�f_�b������o�ev���+0d��8v���ai`��y���k����LC��ԟ�J��u����$�Y�W�;���l�fm��Ţh(s8��z\\\nD��\\Ѯ�R�L#]w��\\�C�$a��?�Cm�c�8��pp.ߥ�n>|�:�Zc\\�|.��R}��w���;c�ǟ�O�H�OЦ�F�S&OE@�,	#5C|�B�Я_|�՗���qx���EK`Z�}�L�0qm\Z�g�3�O�n��neUl졠��C��c�>�E�K�0s�����I�KSC{Gm�BQHʐ�ש�=� C����o#�^���`YEC�N����\\f�gΜy�����K��%zMn���CUѰ	�T���ۖ���9眍�C��y72Ԅ��U�\n���op衇b횵�״�	S�u�]���R;��s�92t(ޖ������v���OMX߯�o{��$AҠ�jI�g���|�IB��$+��柘@�O���#�C[Q������s$�A}HG>B4k;�t̷̚)�;�A���X^�>OB��|�A���iђJ���^{����U�^�1U�̟�j�ԩ�\\�#�i狫�������g�y&�����v0�@��˃RgS����|r���\"VU���q�@ |l���qe� ��@T$���Y�j2���>i�Y�i4�E�P�\'�-[�;�g�}6��(��=f{������s�0�7^?��y����7��K�O�����O��vj�?\r:���j�\nh\'t�I\'a�]�[!���o����EK�i����1��d�K�S��¢��4fa��K3���C*��zY-�Z8�GI��G8��x�b��7l؀��^4诤sSk��h&8�Hd�z�jc��n��&,X�@�\ri�>��{��y�y$V�Z���ݙ��\"g�|�ޟ&�ʃ>�O<��Q��n_I������SOQ�B!:�iph���i�0�D�tfc��c�A��N�Q�Iƶߝ8���݈))G�_����P\'�v3@A��F�\r���?ޠD*��M^�Y�3���*>x�}�WfE\r^�xO��%���s��?���A&���!���/W�i�g��2=��t��t��Y�1�^�9g��g���a�û�;v��\n�!L<ڟ#@_\Z\r���:���y�]T�ӟN�Տ�n���\Z����VmQ�\r�Uc��ݸq���]�r�.]��E����0s�/�᭗Z\0�^������G��Y���uه8䐃����n>ynk�$8+V���G��3������IX80|�<���ӻ�E@Q��v#���?��Q�����ֆaA�`.!�9�4�\Z�;F�\Z)B�h1B`C\Z0	Ae��(X1�����?3��\n�q��!&,�E.j9Y�4o�;��o8c�H�b4�t�\'(�j_�5}�.��V�P����Pyi��A�i��$���q��hZ=�;�	���Z\\!�2�������=7l0v\n��<>��S9�u��J�&S����}���x���/�A�Ιk���y�m��X���h����C����g�}������t��U�z3�\"����E�BT\0h�`�0PK�r@��X�B�,W�[�u����;��-��h�O����U.��)]�裎�)\05vǦ@r����T#�a:t��W^�K/�T76a\\u!(��D�?���5���\\a7b�1��P��kwt���E�B$�$�u`{�Nd,����-�g9���y��ףLIX���9�TC2/�)#{!�	#\0���Ѳ�^}&LPW�fn����Q��Z��\r�=7���J�l��{�O>��2n�SU_�v.���o��?��O,Z�H��i�B	4�|�S�κ�Orq$N�L�?҈O:S&O6�_#�64�fI���\0?E�G}$RSSt�ߎ��(��\0W+P\0\"�/W�Q�%D�6V�V��#���w��R4�U�W+�}��7t���nM�M\0mP�w��8���أ�V����qT�(~��w�F\"d���O<��\r��6�fF\rH=���##Y_�A�hG �F�٢\"N�6NJ8E�u%�o~w�{?���XJ¢]E��Hlo�I��pR΀��\"�._.��{F�\r�x�l��H;c(���\'qH˨W\0�Fc���n�\"$������^Ǵ��������Z�7�:��P��7������?��q�w\"�c�\",m��J�{�=�0�����&-\rv,���9����kRg��8Q �����ѸM\0�#\0�\0�t�(�I�������r�ܜ|�A�п\n#Q�>�?����\0��Y=<�O\0\Z�Q\0�1�r!��EX�l�n��i���&�D8��]G��q����{��y䑪����>�\r������p���#+��h�-)*�c�=��={�4������O��/6Tc�Ll\n\Z��!��\n9����������N$�%*a7C�U��ۈq�,e��ýn\r�� TQ����A{��.��e�@��\'Cv�r�ºS,��2�Hؤ&�>��EKtʌ��i�&2�*H��E���wSꑯfeg�;��q�W���n�BlUh?��S0Y�s.A�-�M>Հ�n1l;}|������{/�`X��P����r��c�\04R\0�!�ɧ�(?�f���gg��@����)O�@�DT\0h\'���Z�m)\0�\0���ߺ.���\\z;��\"}�uw���@))�xi�X�������6k�?�@��N��W��]n\"D��+�;��)�ϟ�����Sm��>S6���	���7=��|��\\�p�}����Ɯ9�(���jh-���^�;�Frl\"�w�]�i�D�\r�h��2HB/��N�1;��m�(��l\\�(+D��y�n\\+��/����V��Z\"+��2N)ϱ�8\nT����w��믿���t���z�nϛ0�ց��\r��{N��y���/X�\0��1FG�h�K��ۿ��ǚm�~�#s/�4p\0f̜��y\n7r:Fo+���CX��D5ޥ�!]�s���B)-]���鋢m#�	����̓��w-[(��<;��a:��k\'E\r�)++ŗ_~��F�%��e�r�!X�C���?����;6|��Q�7� H<�ƍS���������g�Y�������Ujj&�D�_�?�<�>N֬�s!GC6E��y�x�� ʂ%X�n&��3�Լ\'Ǥ ��~�^�2�[�QU�6�I�����1�d���E�d�t�c�yU�n\n*�1�3?��0�UN-�\\X�j\r��f��x�����oh]_u\Z-	y�w޹x���!��	��un��/\Z3��g�%���<�z�}ᣏ>��8q����@�_K�Su��ҥ���?F��FzZ��jH��h[��\0�3�����5�=@�\0jAS���>�T�9i�܌&To��Ȕ9�HKj2�#�8\n6�]�ZF��w�R��WI���5�\\���zJ��A�G\0�\n���g����iՍ}�[���,�L��r�)�u�,�V��\Z�@�K�z<���H��ߠ܁ح�(���~��T�f��a�N�L�%5*\Z�h���u,]\0�mGN�\\��rI9��O%e������\"L�>]w��i�4��W�(�U��dj\n[��\r6�~���{��u\\�1rs��λ\0c_~Ivu_���{sLV����8j>۔�P��|��`���HJLBnn�\n1�99���A�H^�Q��!��(����Fs��p�FL�2_}��y�9�j�����iS��?���K׮x�����ͧ\"`���OE ���G�k�_}%�b�׬F�^�P��[��S\0�(�:�5f�^��ŗ^�\'�|�:�К�0r�C��Umʔ�f��	���:���{^Oĺc�6+�SŤ�4c�Q`X�*{�38-�mʆS?N͋;@`��/����[U�9up��)��wCIq��GQ�&M6�a[m�?��P�2q��k�;��q��t�S�雜6����}�����Tq�l���0w�9kx�k�.0���5��g_���:\r�%\Z��|�ޗ�)I�\rNSmQ��®6\Z2U\n\0	�mJ����7_��l갓��Q�orϦ�<�m��q8��O���$!��=�\0TN8�ꩧ��r�nݬ�|6�G}W_}�\Z*����	\'� ��]F	z����K�ԓO�Y!@���s��.�������;bp� ��l�Mg,e���;������J�0�B{\0,��b�*4I�&Mn���������T1a/��:���K!Vc~g\'~\n�ô�?���BG\rj�-\0�h>ël�b�����!���M�Cƺ\rpх�->��G�~v_�Kg�����W�c�%*s��t7��6�<�J��Kt5���{�u?��;���~\r䔣��9�b�!j�Ρ��n���3���6܊���&wR�5�����7��sO���X!՗��چ���=h�7I4(\0�h(��<���u�N	�G-��S�R��\n�5���?��?����\Z�H�)�2�ݞ\\�!���%�aڢ���__��%���t�R~I�)�r����	����5�Ծ�|�<���?���Ncs;�镶ZV��p1支��%s���xs�LY�\'�\\���5�-)�Z���sՍ֬w�ۅ#���ƚ�kt�\r�9���a�$t���<&M��L��r<N<��FHV!Q��ԩ\\��A��c���Rm�C���o���E|\\�������!O�1�Iw��l�tEѲ��\0�s��G\'A���:��Q\0Npe\0��\'�~�Y�~�|�fg��	��Uݯ��A���tBM�˛�Ep��呇�a�b�׃/��Bm\nl�(������C8_����U�esV��N;��<p����R.�7�\\l�n�c3�9qZ����x1��=2��Wnwt��W��X�i��z�C�m�`y�D(��\0��h��`��[��V���K��j�1�<�@�����͚m�q�a`]�v�\r7\\�L<V4}����8��}�#]����M��{��y�mԮ�����I�i#�S��\n}�1�R���1yn\ZV�6%�Æ�����{N��:�&?��Q��c;J;�Q�+D�v�����\02~�͟���������_������R�E\n\0$R���u��O?�4~���s�=�\"[��Q��.��]w�njT��C��~�\nv����#Gb�.�{@��D����\0��\0��0�W_���Ç��7��|�Ѹ:V�<����\r^79�l�IF��#t��AnL�:�[fOt��FzJ*=�������m�\Zr9ˁ�0S|��T�:?)5S�9h��K�(�����=���<���Ç�@����-�Z����aI�R��Xȇ�ԩ3w8�[���Le���HB�X�[Oَ۬׮7ڟpZ�����-_;F��Аﭷߔ�H-�)\0�W�[��=�\nЙ�[��曫S�X�r%F�;�.]��4��ccА�`�#G��cƨ��,t��r�71���+�*ICT\0h��\n\0�X�dv�9В%�K�\0�|�������j��J�	Q��7��!M�\Z��Q%��\n���}�YB$��>&ϙ;#v�B��xђ��#F�x� ztĕG.���G���#珏=�X\nL�$�̳nMh�t�@�����p#;6I�$��d!?\'Y��H�@�3^���\\�n�!���2�[�G�ZuarNaDn1�5`��0ey��D�l1������O���\n*�>�S�PZ��kVcu�:,-Y�B�zlm�_�~W��~��P�1�S�P�-�L�K���K�>��A\Z%^y�x�g�R3��P�nk��qx�7���IiT��\0t�Ž\nZr�^�@�V��{�����̬,����y�y��/��9:W�O��G�hۈ\n\0��j��(�^�8��\0\n%%%��sN�2���9f!\Z�DHh�o�&(4��1]�~���zl�����n�\rw�y�u�����VF^��ą^�g�yF�G�B�@p~� ��<����&�L���=4{\Z:�.5�,�I��F�t��\' �\"�#����d�Ɩ���ԸT$�&���3��e}�E``9(����%aBa�p\0��_>��\'�QTQ�����X�Q��B	�/�~C�E(�/P\"�P�:�^���DW2w�_Y��͵U@۩���3g�o�4o��/�\r7�K�X������Pa�5j�\\;���f����g��.�|˭Gsj�^k�!B�2t��㑘����T���h�ԔT�ٖ��[2�Q���6�:9`�H\0���mX��5��J�;��64���N\0�=u���o�W�eR6���΅�G)fef��3���^y�S\ZiiiJ@#q���^�g^}�U����)�l��=�+Z�{��v$\0p�A՘%��`��r�oH�9Ή�oް�2!�6��ztbX��X��Н�l�Q����\rE���(4E��#���h� �+�=#�[�WO���jǠ�v����{����S��|���m�*|锈����\Z����;���0�ű����B�	��~��c�W_�T���iM8��h�Ǒ�T�g����#vrr������8y�n�|K�3��G��\Z�6�s�n�t`��E��k��u�G��)a�nKB��>2�\0�(��$	��YgY�0i�D�^�J��@w·�����i�8�q�M7�qm s�g�}pȡ�\n��jΏ?�8~���W������ԇS�S�J��a>�NS�,+����`Э���x���\\��G���f_򣨼H�F��P&A���2�教��\\\Z\\A�S�uK��,[-V��%m4m�t\n���S��:�\n^o�b����L����&�������^s�����T>�����X+N+�{�[�n�9��Ү�o١9���*�g3>c�쉸�x�9Y�:�Ooii�r=A4�*��(�D�m�vG%A��];����^Fz:���Գ�:��H��hق@�@�<�a`=�M�\r�r����������SO>E�:�#��A��^�c��q����6�3nn{�-������!Y�I;\"`,�R�ǎ�5ݩ�wd��w���O�	a�Rn:2`�eN�p�4��>W��kU.��|G�M�&�\n��]~��\\A�K��e����0�m�����msۀ�6+L��[I����n�Z|����u��}b���u�_���b#�s�E�����ٳ���<�>��C�>]��fA#���\n�P\0����0~�� +�0���&����:~�!�m\r�̢�6ABđ\0J�:�\'�B\0-�9���^{b��w�\'ɨ�;-	4��_���\'A	�EH�)ʌ3��366V\r���e�]�h���ΨIH9}�g�?�<���G�X�X��K��Xed�v��LŰ�\"�����LU��Z�w�.Q��qڡ��?����S��7NE�x�Mx���M^#�%��o��z�[��-�rj�f�%֮]���>[WD&����n�e�4�G��ݥ���HLLPM�X��*� �`����\\�gmQ`��vh�K\r���ܭ�St�Ibù?c*���X5B9�	���;3f4�̛�\Z)��_|Q���F\Z-^t�Efk`ke�]}��(*.2kG*W^q%�r�d�or�!�2(���G�w$�aE�6v��+luDj�-\0�J��äJ;F�����[����yf��ܛ2p9q��W�[o�8�f�b��駟@?l�r�` ��?NŘ�c0��ʾ��o����I��9U����;�h\0���\'�u[�G�>���� @�d[�ɺ�.��t@�t�%K���9BI�կ#;zͰ9�S����+��{�_������K/CAa�~���x��tC!�� ���s�u�]��Z�q���n|n�N;!-5՜��� \ri�H�ߐ�E�ڈ��*h�ۡ ���a���r�̹��*mls���ꫂ��n�3v���ѽG�Ւ�� �5r$RS��5��6L��ФX���>c�\r�Ν��λ��y��5k�VKCUh�{R.<���0x�`��ǫ�7��BQ��/�W��̷M�67\rQ�5DWl�`��U\nrm|y��\0���\02N2Mε,\ZtYytʜ��7ׅ�5�H��g�Y�h��O��5\Z}��Ǣ�����ZA��\Z��/���C����ԦjG����\'���`=i�b�#�̍!]S��qM=�_D��h,�)�Λ;ǌDI�\\V;b�P�7l�/��2�<�H�*�΅�S�B72�P�&��%�O�S\0����Y�t��m�II	8���C�:�����?[�+@��ː��)4�<�b�@t�t�j%V�eǦ+R�qȏR?��������?N}�됺С���L	!~P�������&Z����X����F�^�̊�|�����d��^�>�hT��p3ϻiʢh-�킁�\Z8��M��[L��#f̜�a������9���j�::�\Z��n�=o޼�\Z�6��Қ�4�Â��j��}1v�Xa�I�^�A�v�Ӳj�jL�6�g�$�2�y�&���ҷ{��ia���1_����f�Ls��\'�����v��*�1G*|ʌ9@gA\r�FSTZ�K��{�=��{J�Zp �{�S;���된�������.#G��J �툉\'�kV��\Z2\ZRс��3�W���ZC��ￏe˖�7�����s������\n�N+Qc�x�����7i{d�]�B\'O���?г�0��Y�|7����۟����;O�O����`�<�4N>�D��i\n㝷�V��o߾:��9|���8��3PXP`�ߐx�п\Z���!�[}��Ա�8���gff趾���`z���\\հ���\n�&��v�H�G! (�\\%��7�B�!R��h�s���\Z�희&!�\\�pD�ø{��x\0{��:�}���I��3��\0]�M\rE/G�I�\'�UW]��6Z^\0���-P9�;d����p�\"�^8v�Kz]��mD��Qoy����1f�18��s1b��j��l�oM�1�]�x�I��	�7�v	mk����<��cZ����_#ۢ�񘿑��7��q���/D�\Z�%�4$]� ��t���.豈����#==M�+=#y9��13�C.����3�/F�}!*\0lG��j�Hu̑\0\n�]+B��\rԷ�W_}��~�Y\0�:��<���<Q�>C�C�j֯��u�\0�����E�a�=v�ъj�bp��6.�C�]s�Ւ�M�%ˉ�� QfV�8�x>*l�J&V���.��ɓ\'�ƭmF[�u_P�m�+FӖ�.q�Y�{��[CH��5IW�=0s�5���n��D��Ba��[��N;����9�oQq1.��R����|�ڻ��x��MQYv#c���O�N�����]��;t�sNؾ���>�B�Hpl��_2]\Z1Q��!�9,�9Μ�,�&�����%C��D�D�!��>��L��\'�zNp�8jZR���^�\"N_l	:T�+�4��g.+x\\VVj��t2�> ��U�[�J>9�b44�)6�<�$Ȑ4ԝ7��Y/oʌ��Æ\r����0��٘;w�K�	S5��c����\\�n^^>.��r�_�^ʖ�Z��|���=��C�t�1`[�t��=S�L3�v��;��F:���SN�\'�|���\0�K��\'a��x����:Ѽ� �N:���O4���dd��!/7Ww����CZzz�~������l����5����Ki-�)\0{4��(���=q����m����55�cY�ØS�L�yJ|������S�3,�̠�G\0($}�����W������b��ŗje]�\ra�L�;��ISP*�;󗙘����y�Lx~�r�_�B�1�զQ��J~�U����pa��v�=ǌ���UH��ӏq�1�YO���B�䒋q�=��10oQQ1�EJ�q�\n����>�)if�(�7���Ͼ�~�Ds�h}H^8���[o����k����ۗ_q9���;e�|�uζ���#��*��R���]\n.ݹъ�&��Z�k��42���$q���ҥ��!��?/�����v��5����Ն��r���~�818�m$��	�U3\r�h`Ő�!Yr���ݻ�fs�.ryȚ�ElFo 1lh�	��g�������_iy���*ѮDx\r� Q�A�K���Yr�\0G?���Z��_7��A`��%�d����\"M��|ͷ]Nv�c�8��n��K/�+/���3�c�򥢩�#O\n�!ɱ���7H�p>y��i}���jC}�\"�vw���_~���&�=Z磹��~���r�reY�8\\r²��w�K���			I8��㥌�RVF�e��:kn��f3��|�m��ګM�����@�ŦD&/-պ��}��uzJ�)����D��Q��aÆ������s٫N�H���&�	�_��|�s�.8����E~SS�����܎r�+:�wFfz�&�_�O6��Ql����adR���u�`�NU�\0�5��w�\'�w�ޛ�V��ш�>�\\G)lp@��$\\d���>�{�9\Z4��c�|��.���͉q2���\'�1`M:\Z1x���l#���,���ӻw��\Z���~�=���Y�p�Zq\n��B��0���\r���*W���Ę��E�#ȴ�E�\r\\���#g$�������+&nj�Џ�a�x��W����\"��{!/?�:�����h�&SW]�t�sޫ\r>uam��\"�&v�e$N8�xdge###]5~�aN����s�qq��/J�B�5D� #q 1��%	�MD����75-U��;�P�/L)>bH��@�!�SN=G}4f���/�m���,��I	��3F5�N8?L�/�4h c1�5�������V�)Բ��ٳg��\'��-i��4E2�\n��(�:���9���z(.���׍��G|������?�O>�����zz�`���;dL�W�P�Y\r�g�����I�*�]3�uZ���?���W_�����I��/3�۬����_��W_������8\"W���4�[>۰S!)��w��G��|O�J/n��u�ft�zC~v��W���M���5�����B���d�v��X�|�~�eBA���t�c�12�Nj�ਅ�h9P(<�#THL�:��n�[\n���e�Ql�h��bP��@�):���Q4���8�H�w\'\"�C�PC3׽>�,�\0��?��=�PXw�+s��m�L��Gq�:�,a�d�	<�t�w�G�������\\p��/�=\"�|VG\0j�����[gա��{$ԕ�sn�z٥��𠹓_2q\n\n�+?���Von\r��$uV3a�|��|���V�#�<���b{x���1�i�9s������*s�Q�c��C_e:�m��e谡����[��G�AJ9rI%����8	����W�V\r��Ͽ��m�`]0`��s�9r�NG�����~�x����ro~\r������7���E���>zS�M��$=́֙�r:��\n���kF�Dh�5���ܩ�\nt����{DEMD[E� �Q�$��-ĉ�`k\\йSgHd(P(8���㎃�`KS҉q����@���������̜�0���n�1p �}>,A�PZV�\'�|\\��8�NӀ�<n�0�<��v�)\Z5O�x����0´��JF�_���\\�b�pW7\Z�����ٸ	SZj��7�E>x�QGb���)\Z���M��/�����/k���\\�;�#��	�GC߾}�	k��`�U��Ec\r��]fz��s�^m�g�?�R��\"Q2�]�v�SO=��gR_RSS�\n,s�����޽�\n[�Hu�/��?x�tp��\"z6���+0�B�E�,���zד�H��0}hXn��%˖�P���sI1i�%�R�\Z�	ip��	���fa�5˝�|�!8�ԓ�n�-�:��:��k���Wy�WQԆhˈ�n�&F�Ą���BÑ���$������!��8at��:��9����ڜ���=as�a�!D>�quU��j�4�_�>�2����\ZI	�D�r�P\0�z�pqMP��3�fY_y��\Zq��0��+*��m����v��� #kX�K�.��_�qe�����Wy�#�7r�]пo?=7��P5�e���[g%�=�\\���ZQȳ�����<�zi<h�|U޸�e�o�Yg�]I\'��$\0T\"����������1l�0|��G\"XuZ#=5A!�i��hh(�\r���{���B�N~�<E�[_�s��}�S=*�l&mQl��\n\0Qlc;��28L�\n�$���n&B�(��3���>ZLO��s�Qυd\Z�����������h(��>��â�YW��s������P�3�SE�ߠfZC��&\0p=@�!���5�Up�u:�9���D;7��Մ���~��@�Ad��o��q�Z�˟_�ud��D��jb�h���8p��	��\r�(0�6s��ȑ#�Xo�m:��A�>���ŗ���z�:�o�I\n.3g�!�l���:�D�A�&\"����xk51��������\r\n̨��E��_-�4\n~P_�8��ջ�h�	�>;?/O?G�Ɵ��͐t�AQlQ �͂D����i�M-���;���\0�?���	��vסmRq[siYԌ/�:Pw�3��SO?mi}$�Vh`2�8�4�߾�8��zcD3�J^rb�j�1���h����#w)zcՇ�iQAA�je8�@&�����&s�Bd�����s;�U߫��ęg-�\r\nH&^;�~?��HެK\n:9���A�n�k׮���>+��l�g���MQS�,.���|nΜ9j�@�M�\'�����[��UB�]^�����D`�=F[u#���de[��r0QZj����()�����ԙ�����	\"/F~�a�%�������gos����_��nHԩ����I_̖�G͟�I�3��j��@\r�	0��hyLfO!��t��L�&\'#I���{쎓N<^�al\"4��nQ��E\\��z�)x�\'/ʊ+�I���99Yj&`M� ��Km��uw�u�yEҭs����Ft$^{�u,Z���:�\Zqe�/=�xȘh�8`�@�ƫ����ӕYF�E\\l,�=����]�%�Ɏ��*�W¯��D&ImXo�\r���xM>���\Z{�����\\���,g�f�|N���$!j��?�����ksP�g��_`>l!&&VG�x��˅#/̳�%暂��w����\n/�}Q�W	��L��q|��3w��u���oف���O\r��+��ӎL�\nWց�{6���X�A�w����q�<��\Z����D�_	*p��K��*�WG|B�\nU�o�ڴ��~T�����~\0�h\"	5��H�СG�?r��6\\s�{\\�u��g��y\\Bg#2�����G�?�X<�����\Z���a�v�4\Zl�or��駞TۆZ]Œ���o�ܣ��;�\'�~ϐ��d2���E��B(/y��*H$������<D]�(�Z�\n�\"�*�Dh��Am+�\n�!DH\"$B2���1�;��>�s��373� �$����s�c��=�|{����*7��)w�\Z��&��y�t��MC����۾�c������Q-!/K�>k��^�8! ë����ɂ9cC�0\r�MB��p����1����������PnF	FU�};;;�[�kD�K9S��g|У>��\Z�W<fB����\"1���D/�?M�D�ڞ|��~�mpn���~z�r��0~���!�y����7ǽ��.�o�ޯ׹zbĈ��J;9퐍\r�^��/��F\0�q\Z�g\0��/�Xo%����\\��d�	q��͌��W^]|���\'T1�cJJ�����$��h�k%�(��Î��������E븘	��q\0��e�_z�%�b�:����x�c~���ْe�������<8�\0�Fv]�Uf��󖇟�KΞw\\8ϼq�����:�y���n�����1�����#0\0���1pN���{���W��$P��|ō�8����=����Sq:�5���뮻�W�����\r�����\"�#5���*����29|���ޞe���E�2�ū��y��u����~��q=�B�\01\"��x�TTVx)�����\rJ*��3�Ja�D3�^�&����_������_~�4$�\"��֒�kgW���[�i��EX���ГC��f$/BΥ�Gp�������]�ܳᴿ<=\\���7���^r�+`��4Q���_ĖN��������+>�\"c,s�%����y��d!�W��H\Z�~���iRcA�s�E��.\0���L�����kwOW.l�؜:,��\r�|��G	���7�u��{��a�ڵ��p�9����m(OEjD�wj�0(�\r��Df͜eF�߆^�(\r���=�йm{R�m�H�Gb<��3ᓟ��@IW8�X��zwV�+�����t����-v-55���3?>1~�>�-T�w���&=�E����[����g#}�)2\0�;�m�u�u.XTO�C`�a��q����#�o��+´�i�^��@i�ҋ/>X��D�eӰ�l�����������f��mDѾ��?�1�O>�p��r�Η�\0�n�Cn�6��_x��i�:F����;̝;���=�ŗ,���~%����kH��e�����X&������]O�`���Q���������[��f�0�>0�*RM\0<Cď�c�\\y��g>&N����L@M�v_���f�ql���YB�1�p�G?V�aer�~c\n{���b�3f�Y����aΜS���g�k��mZ����֌m/�� ���!@�+�pWYQ���t\r���6}�����㑏�\Z�_~����/t�,^܇�.n��􁟆7ּ����ns���Hx����5�G?�рU�RR�@i����\0/�΄ʠdQ,Ӑ�����S�$��^�m�\"H�yR>N��G��{�{�#�����q���^���y{��%�\'�m�z�������آǼi��8^yYE(K�� h��q��?����𩡱!|�K_��z@\";��3f8��ٹ����8�72�������`��EPz9ݒ6���z���o�g~l��]�;t����G2\0Ļ���p�B���$|�	~K��@e���L��k��{���p����S]��>��P�����W�S���xwY	���$ 8�j,]F j\0���Ii-B^K�Y�뇪����w��qbuz�2�R���f}�cn-\Z�x�W���tu�	K�.�����w��%/�˹�5��g̜>�����K�\Z+n2��	fF����Qq��?n�Չ�}�,Y����j������.��\\�<g���O?��pՂ�@�E���T@���\'�6�+��a��x{�\0�\n����l�h�����I&��Z�L\rS���6+����G�\r�Uա��1�wιa�5׆���V(��2��V2*���%�D��ؚ��	�޲�y�v��B���q��BxW�k����]����y/_�����V�A��m�D���yn�=�&��$�Q���>��4�==�V8��y\r�I�d�\Z���!*���h0���ua޼y��ӟ��;3⼆72s��\Z�	�e�W}mM>VD|~_l�u�����>����I���e��_��`�l��~�dq���w#|衇��\\������}!�^���m���T1�qK�^�y=d��ᴮ��>�^C6y��Ǆc��$Lk��U��6�T����B\'����#a跇oJ~��LIQ<f�twf�:�Z�;������|`^��΍�j�����o/w[��\0�/a���|tY�ڝ�;6m�a�������3%������^u\'@��tL����v��0#n��m�(��>y�|X�$�\\��?\\X�3��!@SQz=�\'K~�$�����9�`:眳�����R�����C���y�<h6a�k��ƻT^q����ߧk�d��	�2{�/���0��I��ZT�3���֩>��c[|\\܇�u	1ld\0�w�ti#��z�%FI�[L$�#zW_}�G��s�!cG#Ty���O~⡁�sN����]�k\'���<:���y��+��i��d���{���?��+���^]e�4��n*+��K�j\"�W�J��@�5���jij*�C�B���oo�b�M$,��!�����|K��\'��f��,�M7�⡋�G@VUf��􅛼�%0��.� ��}��m�;�Z�x�]g�M��Ӂ�@>����g��W�.��J��͍a�����6�͛|��4��q���t�\"��\0^^����ڀ�$:9�c�p¬��3gΜp�u���uee��E�Oڼ�b6�eJ��e��_?������~��Ҳe��\0�޹�ߋ}��m\0\'��<����~$P�^e\"]��\0�H�\\	��Q���\'��\ZC��`E?	D1}�ܻ����\r��r�c�\r=���;�_d�y޴��ho�9sN\n�_��0�����:�C���	^�\'�?��ь�Y��*�֬��D��\0q��%kx�Q\n����Cj���b P�%yι焅�\r\'�p��g%�1IXZ�,P��ۜ\0Cv�|�{wwox��_�n�HJ����o�6m��A��k���/u;G���m]�\\��������������T��O�֮���<ȏ���?�\\�Ӳ��e��[��89�tC%�/7jmn���p����@?��S�O����\r��a�V�m+	c��\\y~}b�$����6&b>,Xp�=#�a޼��ͷ�-ZdFTg�Cj[O��͞PYYN<�}�څ�>׍��ښ�T��L���X���0�uzh��ƏoQ��z���g:��x79���A�o\0/E�>���1�f/ƶ6������&L�4���<{�l{��;��p��`���0a�����?0wn��/\rO�0Ɨ;5\0��l��6nw�q�7#\0FRq\0j�{��~U�ÁQ��/f�+q���g o{�7��H0#�����\\��&P���^hI�\0pm��lT�؎{��ι��$�\\z�	�\r��*�w�y��qG�10v\\sg�mmS-��3���k��x����`Qb?����� ����Z��e��q Ë{��-�csGغu[عs�������駗��˗�rJ�}�%���X):�ɣ$8��㹾���=���\'����o��`�S�\Z~��_�;ΪU��{L\\��~ܔ����\r�\'��j�4�_vEx�?���3�1�1����qM�= ����b���c4����H8?���/~1�}�9a��a���a�݃���]�z\0�-���s>~��k+�O�?~���;\Z�B�#;	�o{��=s��p��\'yS�1�_ol]��Mn��{�����ֻ�灐�X>�1PSr��j�8��\0��9^���wy�[:L<��-���g�al)o��x����c\Z�&]ڒ����v\\�����C��X�g�\nan�5 ����&,^�$|���Ad��H��\Z\Z�>��w+Ks�E�~���C~�\0�\Z�A�]R�x��zk��g?�\"姒>����+���׬]}����� �yc���u��l���x��lP�<�~F�$9\"Y�l~��oT�Ј�Eۥ��a����$q�c��SO��}����WUU{3WSc�.jjn�m�.hޡWߵ7���?�M�q � 9�G@�I$b�S��f��Cd�Vf=���w���>�8������>L�~�w=�[�P�c�`!L�.]�x�bf�^��qO�{o��<�1���߹��a�}\'�6mv?���<j�ʕ+|�C2����&:tX�\nw���h�>g�3C���;���c��������B3��寮�����O�!F2\0�!���@�<�F��3�ڀ���5����˖-�0�t#ߡ�m������K��>�/)r_�b�k�k�����_�%Q�+�CMm]��=��W�6)�s:���)=5�a׮����8G���ݗWl\n<�ю_�\0Lh�?�ē±�g���K���e����D��G�k6�on:ʝ\\1�-a���XQ���IE�р\01�Bǣ�� �F\0��� `�4��E1z��W��K�\rk��1�|�����{�?��ӫ���#���_�y�χ���>a���N��m�Ċ���PV^�c�#�u\ruV�oc�\Z�j�hL����n�oa���ađ�\01���L?���r�B�@�F��4\r�<\Z�ޞ��[<h��/���������A�Q�kH�p~���7���#�H��S��^��Y@��	0t�qǅ�sOG57�uw�+/-��|�!>?^�M͍>�U��8�UTzj9?�N����y�đ�\01�HX�4]#��#��6�)��i �����sa��]a��yA�ƍ���@�}�=|��$��b��N�e�����h�o#��&�^�C\0*���rsde���������D�lll�6~����֘�Peϖ����Km�b�#@�jz<i\"�F\0C��J�����v$�]��f{3�7�K/�V�X��$���%6��Gӯ�p3\0⠿^�=rE��z������f͚fΚ�\0�z<�L��W�*�棚C}]}h�R>�D�k�o���R3��	��<C��1\0⩽��)Ļ�\01��E�)�S��4:b\0l��\Z�l��m�a�@g�X���~F�իV�1�,���붞�8č���`\0�A}Ť<���`�8���XI~ʔ������}ľ��̽�i�w�}[VW����|n����I�\0F�J�~!��\0q� @��ǖ)�\0��\\.�ɛ�\'�۶m�ۓ����n�@�``[l!��׬	�{�E��ֽ���r|\\Nxa�D�$����P�O���{����9!�{C����ɓ¬ٳ}����F����S��^UU�O�>�9���6���3��i ��%��D�vd\0�Ò�ǖ���Ƒa�i\0��>\04	D?�c(��0\"ȃ��П���vv�N���Ji�y1 �ľ\'Jꄛ�}�Lj����H�*��J��p�Ã���ϔ*~����>�!1	q�#@�{�m6��NF���\0�����7���4h�E a����U������\r��m�����?qhIپt�䞞�����m��f�\'��Nu#��l6���_QV�b�7?|=S�#\0�w�>K^�/-�G*�)� �d\0�#��cj�sI�@D�O�4\0��g�\r���\\Χ,{k�[^3�#!5}q�š��c�Z���ٳg�	\'�@x����}O��>XF\0}��tI�O�l��rOC	�\0q$ @��Ǜ)	#�&��(�1�\0˨5`�m1X߳��	����X�rex��ºuk�3��\"�0\"��m��Df~��f?�k��0�bξ7�/��	\'�c�=ևN&�ܱ�WVF�+�[I�\nQ���Z�X⧔�|�#��z��	�8� �h{�c�c 6�00\0��`�����eF��л`��6��4�wt��}�� X��[���ɢ0�D�%ޙ4qRh��\Z���y|DGM��Ow�؞����׺�P�Xz\0�?]�Gܩ�O�� @��\0���?\Z�v �>��cD����];};���\'߼@s��Y��:6���ֆuk����$���X�#\Z$��!c�����\0�K�<jd�R�ۛL)�O?��͟���}���g[/����c�|D����ӯ�_�8�񹦺&��$����}�}	��\"2\0�ȃ!��{ۿ	l��|�胻�{����c���.�/q&d�(*D#�ݵ;�ol7n6lo�����x��\Z�����.Q�JM�	�3y�0n�X��g��7��jy������|�������ն��{,s>3\0(�җ&\07���}5{]e\0�l\"@�\"rD<N �\r ��F����,60OJj	�\Z�����?9�f?j\Z63��͡��#l0a�֭n@���i�RRe?����auZ�|��=��:c��F��h[�Drp}�#SΑ�zJ��~�2��xRs�����\Z��]�YO��H,c�\"n�\0��E�^���e��Ϻ8��ڟ�I��\"8�YF���O#�<49mD��|�6�gY4�6䙞G�i\n _>���Ѡض�����GL�6�\'�N�� ����Z�&n`\0�#�+ñ��wd\0 �������dnBL\0��777��#�Օ�p�}���r߯�7��!�Q��\'���g=�(��oJ����e�^��<%�2\0D֑ �~(�� ��4D� ��IQ�1�2D�}b��`y����r�AԙO���&�g[��i��]�w|��h�`4찴ˎ��4=` 0 R�m��a8���\'�L�8מ�xT��o>V�76�\'�L|�N�@�it��$�Ϯ�� _������r��oR�by!�,\'�/BO�Ǌ)��p�vB��\0b?��\'��V*g���RR7��B��`�6>o��1`���`5�)&�\\�	�M�FA����S��^;M�s���S\n�O#�`�K�e�E�.�۳� 5�^�^O͂�������^@�d[_fǩ0�Gh9f4\0������{>���(�c��x/\\���jÐ�1|d\0��?!���	���M|{��\Z��9\Z|���G�e�|܏�Ě\0�ǎ�:��01���b\n����gEM/����c�\Z��Ie����6���p�K^ei�-Kb�^R;@>����WT����\Z��$�.�E��X�#���6�s��l#��C�~B��)��g<D�6j\"F!�F���-�bOMA\\F\"�h��ω`F�-s+��<Y�1���3����\"��~zȺ�.j(�>��	��M�ǘP�ׄ�D�����&�x�#��&����J*7��\0�F��l��KJ��+	�z�\n�*-��H΅s�\'�>2\0�8���B�hEAG�e4\rxu}�\0\0��\0����~̓)n˺�X�I�:��_t�d��{�\0�jv[a�����.֕�$U��g�Fuyo۾$�cy���o�6Ϸ���ւ�7\0��@���	!,2\0�8��C�X���䅑e����	���c\0��G�g>�=�����c�dn�v:���\0��J�V��y+��;���2Ir��[�������#�ߏ�¿�Г���#@�QLZ��	�-���b��	Af�k��g=�MqD�X\0��GXq�Hz^1z� �B�8K�^�f���;�?��w�3�6���`w;!ġE�B�ATW\'�Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd\0B!D� �Bd��AR�̨��\0\0\0\0IEND�B`�','.png',NULL,'ID','Admin User','2025-07-13 11:40:43.222105',NULL,NULL);
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
