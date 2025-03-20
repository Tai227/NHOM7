-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: websitebanve
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add danh gia',7,'add_danhgia'),(26,'Can change danh gia',7,'change_danhgia'),(27,'Can delete danh gia',7,'delete_danhgia'),(28,'Can view danh gia',7,'view_danhgia'),(29,'Can add quan tri vien',8,'add_quantrivien'),(30,'Can change quan tri vien',8,'change_quantrivien'),(31,'Can delete quan tri vien',8,'delete_quantrivien'),(32,'Can view quan tri vien',8,'view_quantrivien'),(33,'Can add nguoi dung',9,'add_nguoidung'),(34,'Can change nguoi dung',9,'change_nguoidung'),(35,'Can delete nguoi dung',9,'delete_nguoidung'),(36,'Can view nguoi dung',9,'view_nguoidung'),(37,'Can add ve',10,'add_ve'),(38,'Can change ve',10,'change_ve'),(39,'Can delete ve',10,'delete_ve'),(40,'Can view ve',10,'view_ve'),(41,'Can add phim',11,'add_phim'),(42,'Can change phim',11,'change_phim'),(43,'Can delete phim',11,'delete_phim'),(44,'Can view phim',11,'view_phim'),(45,'Can add chi nhanh',12,'add_chinhanh'),(46,'Can change chi nhanh',12,'change_chinhanh'),(47,'Can delete chi nhanh',12,'delete_chinhanh'),(48,'Can view chi nhanh',12,'view_chinhanh');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$pdgdcdK7I1E3d4MXh69uKC$fCCKLd1wBylhgsJcCAgBDy1++wZZ2KvDxdZDAxAcONQ=','2025-03-19 15:58:13.067527',1,'admin','','','bestcaythue007@gmail.com',1,1,'2025-03-13 06:45:17.143832');
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
-- Table structure for table `cinego_chinhanh`
--

DROP TABLE IF EXISTS `cinego_chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_chinhanh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_chi_nhanh` varchar(100) NOT NULL,
  `dia_chi` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_chinhanh`
--

LOCK TABLES `cinego_chinhanh` WRITE;
/*!40000 ALTER TABLE `cinego_chinhanh` DISABLE KEYS */;
INSERT INTO `cinego_chinhanh` VALUES (1,'Cinego Nguyễn Du','116 Nguyễn Du, Q.1, Tp. Hồ Chí Minh'),(2,'Cinego Tân Bình','246 Nguyễn Hồng Đào, Q.Tân Bình, Tp. Hồ Chí Minh'),(3,'Cinego Kinh Dương Vương','718bis Kinh Dương Vương, Q.6, Tp. Hồ Chí Minh'),(4,'Cinego Quang Trung','Lầu 3, CoopMart Foodcosa, 304A Quang Trung, P.11, Q. Gò Vấp, Tp. Hồ Chí Minh'),(5,'Cinego Huỳnh Tấn Phát','Lầu 2 CoopMart, 1362 Huỳnh Tấn Phát, khu phố 1, Phường Phú Mỹ, Quận 7'),(6,'Cinego Sala','Tầng 3, Thiso Mall Sala, 10 Mai Chí Thọ, Phường Thủ Thiêm, Thành phố Thủ Đức'),(7,'Cinego Nguyễn Văn Quá','119B Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12, Tp. Hồ Chí Minh'),(8,'abc','123'),(9,'Cinego Nguyễn Du','116 Nguyễn Du, Q.1, Tp. Hồ Chí Minh');
/*!40000 ALTER TABLE `cinego_chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinego_danhgia`
--

DROP TABLE IF EXISTS `cinego_danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_danhgia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `diem_danh_gia` smallint unsigned NOT NULL,
  `binh_luan` longtext NOT NULL,
  `ngay_danh_gia` datetime(6) NOT NULL,
  `nguoi_dung_id` bigint NOT NULL,
  `phim_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinego_danhgia_nguoi_dung_id_1c16f53c_fk_cinego_nguoidung_id` (`nguoi_dung_id`),
  KEY `cinego_danhgia_phim_id_9e6b2cc8_fk_cinego_phim_id` (`phim_id`),
  CONSTRAINT `cinego_danhgia_nguoi_dung_id_1c16f53c_fk_cinego_nguoidung_id` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinego_nguoidung` (`id`),
  CONSTRAINT `cinego_danhgia_phim_id_9e6b2cc8_fk_cinego_phim_id` FOREIGN KEY (`phim_id`) REFERENCES `cinego_phim` (`id`),
  CONSTRAINT `cinego_danhgia_chk_1` CHECK ((`diem_danh_gia` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_danhgia`
--

LOCK TABLES `cinego_danhgia` WRITE;
/*!40000 ALTER TABLE `cinego_danhgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinego_danhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinego_nguoidung`
--

DROP TABLE IF EXISTS `cinego_nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_nguoidung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_nguoidung`
--

LOCK TABLES `cinego_nguoidung` WRITE;
/*!40000 ALTER TABLE `cinego_nguoidung` DISABLE KEYS */;
INSERT INTO `cinego_nguoidung` VALUES (1,'nguyentt@gmail.com','Người dùng',1,0,NULL,'abc123xyz'),(2,'phanthiaimy@gmail.com','Người dùng',1,0,NULL,'abc123xyz'),(3,'hoangcho@gmail.com','Người dùng',1,0,NULL,'abc123xyz'),(4,'abc123@gmail.com','Người dùng',1,0,NULL,'abc123xyz'),(5,'nguyentt1@gmail.com','Người dùng',1,0,NULL,'abc123xyz'),(6,'abc@gg.com','NguyenTangTai',1,1,NULL,'pbkdf2_sha256$870000$d9BxEyETFU041iaGu0raR4$up/Q4tR/PjGDOe0RxcvIdq3sjxriYIUkYXuDwr7C4QY=');
/*!40000 ALTER TABLE `cinego_nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinego_phim`
--

DROP TABLE IF EXISTS `cinego_phim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_phim` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(100) NOT NULL,
  `the_loai` varchar(50) NOT NULL,
  `thoi_luong` int NOT NULL,
  `ngay_phat_hanh` date NOT NULL,
  `anh_phim` varchar(100) NOT NULL,
  `dao_dien` varchar(100) NOT NULL,
  `coming_soon` tinyint(1) NOT NULL,
  `is_now_showing` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_phim`
--

LOCK TABLES `cinego_phim` WRITE;
/*!40000 ALTER TABLE `cinego_phim` DISABLE KEYS */;
INSERT INTO `cinego_phim` VALUES (1,'Natra','hành động',160,'2025-03-01','phim/Natra.jpg','Phan Thị Ái My',0,0),(11,'Conan Movie 1 : Quả bom chọc trời','Hành động, Trinh thám',101,'2025-04-01','phim/Conan-1-Qua-Bom-Choc-Troi.jpg','Aoyama Gōshō',0,1),(12,'Conan Movie 2 : Mục tiêu thứ 14','Hành động, Trinh thám',102,'2025-04-01','phim/Conan-2-Muc-tieu-thu-14.jpg','Aoyama Gōshō',0,1),(13,'Conan Movie 3 : Ảo thuật gia cuối cùng của thế kỉ','Hành động, Trinh thám',102,'2025-04-01','phim/Conan-3-Ao-thuat-gia-cuoi-cung-cua-the-ki_Il6bIGS.jpg','Aoyama Gōshō',0,1),(14,'Conan Movie 4 : Thủ phạm trong đôi mắt','Hành động, Trinh thám',104,'2025-04-02','phim/Conan-4-Thu-pham-trong-doi-mat.jpg','Aoyama Gōshō',0,1),(15,'Conan Movie 5 : Những giây cuối tới thiên đường','Hành động, Trinh thám',105,'2025-04-03','phim/Conan-5-Nhung-giay-cuoi-cung-toi-thien-dang.jpg','Aoyama Gōshō',0,1),(16,'Conan Movie 6 : Bóng ma đường Beika','Hành động, Trinh thám',106,'2025-04-06','phim/Conan-6-Bong-ma-pho-Beika.jpg','Aoyama Gōshō',0,1),(17,'Conan Movie 7 : Mê cung trong phố cổ','Hành động, Trinh thám',107,'2025-04-07','phim/Conan-7-Me-cung-trong-thanh-pho-co.jpg','Aoyama Gōshō',0,1),(18,'Conan Movie 8 : Nhà ảo thuật với đôi cánh bạc','Hành động, Trinh thám',108,'2025-04-08','phim/Conan-8-Nha-ao-thuat-voi-doi-canh-bac.jpg','Aoyama Gōshō',0,1);
/*!40000 ALTER TABLE `cinego_phim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinego_quantrivien`
--

DROP TABLE IF EXISTS `cinego_quantrivien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_quantrivien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinego_quantrivien_nguoi_dung_id_b2856db7_fk_cinego_nguoidung_id` (`nguoi_dung_id`),
  CONSTRAINT `cinego_quantrivien_nguoi_dung_id_b2856db7_fk_cinego_nguoidung_id` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinego_nguoidung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_quantrivien`
--

LOCK TABLES `cinego_quantrivien` WRITE;
/*!40000 ALTER TABLE `cinego_quantrivien` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinego_quantrivien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinego_ve`
--

DROP TABLE IF EXISTS `cinego_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinego_ve` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thoi_gian_chieu` datetime(6) NOT NULL,
  `nguoi_dung_id` bigint NOT NULL,
  `phim_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinego_ve_nguoi_dung_id_14e788cc_fk_cinego_nguoidung_id` (`nguoi_dung_id`),
  KEY `cinego_ve_phim_id_4e1f54b7_fk_cinego_phim_id` (`phim_id`),
  CONSTRAINT `cinego_ve_nguoi_dung_id_14e788cc_fk_cinego_nguoidung_id` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinego_nguoidung` (`id`),
  CONSTRAINT `cinego_ve_phim_id_4e1f54b7_fk_cinego_phim_id` FOREIGN KEY (`phim_id`) REFERENCES `cinego_phim` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinego_ve`
--

LOCK TABLES `cinego_ve` WRITE;
/*!40000 ALTER TABLE `cinego_ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinego_ve` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-13 06:48:39.455416','1','NguoiDung object (1)',1,'[{\"added\": {}}]',9,1),(2,'2025-03-13 06:49:09.637000','2','NguoiDung object (2)',1,'[{\"added\": {}}]',9,1),(3,'2025-03-13 08:26:56.548668','1','Phim object (1)',1,'[{\"added\": {}}]',11,1),(4,'2025-03-13 08:28:00.167030','1','Phim object (1)',2,'[{\"changed\": {\"fields\": [\"Tieu de\"]}}]',11,1),(5,'2025-03-13 08:28:05.129638','1','Phim object (1)',2,'[{\"changed\": {\"fields\": [\"Tieu de\"]}}]',11,1),(6,'2025-03-13 08:48:52.024233','1','Cinego Lê Văn Sỹ',1,'[{\"added\": {}}]',12,1),(7,'2025-03-13 08:51:50.507660','2','Cinego Tân Bình',1,'[{\"added\": {}}]',12,1),(8,'2025-03-13 08:52:09.033515','1','Cinego Nguyễn Du',2,'[{\"changed\": {\"fields\": [\"Ten chi nhanh\", \"Dia chi\"]}}]',12,1),(9,'2025-03-13 08:52:41.558236','3','Cinego Kinh Dương Vương',1,'[{\"added\": {}}]',12,1),(10,'2025-03-13 08:53:03.806436','4','Cinego Quang Trung',1,'[{\"added\": {}}]',12,1),(11,'2025-03-13 08:53:40.695180','5','Cinego Huỳnh Tấn Phát',1,'[{\"added\": {}}]',12,1),(12,'2025-03-13 08:54:01.885415','6','Cinego Sala',1,'[{\"added\": {}}]',12,1),(13,'2025-03-13 08:54:29.373209','7','Cinego Nguyễn Văn Quá',1,'[{\"added\": {}}]',12,1),(14,'2025-03-19 00:17:07.275158','4','NguoiDung object (4)',2,'[{\"changed\": {\"fields\": [\"Vai tro\"]}}]',9,1),(15,'2025-03-19 07:34:56.959950','3','Conan Movie 2 : Mục tiêu thứ 14',3,'',11,1),(16,'2025-03-19 07:51:45.531301','4','Conan: Mục tiêu thứ 14',3,'',11,1),(17,'2025-03-19 08:07:52.850347','2','Conan Movie 1: Quả Bom Chọc Trời',3,'',11,1),(18,'2025-03-19 08:07:57.034579','5','Conan: Mục tiêu thứ 14',3,'',11,1),(19,'2025-03-19 08:08:00.714688','6','Conan 3 : Ảo thuật gia cuối cùng của thế kỉ',3,'',11,1),(20,'2025-03-19 08:08:03.626402','7','Conan Movie 3 : Ảo thuật gia cuối cùng của thế kỉ',3,'',11,1),(21,'2025-03-19 08:08:06.631754','8','Conan Movie 3 : Ảo thuật gia cuối cùng của thế kỉ',3,'',11,1),(22,'2025-03-19 08:14:47.326031','9','Conan Movie 3 : Ảo thuật gia cuối cùng của thế kỉ',3,'',11,1),(23,'2025-03-19 08:14:57.248252','10','Conan Movie 3 : Ảo thuật gia cuối cùng của thế kỉ',3,'',11,1),(24,'2025-03-19 08:57:08.936054','15','Conan Movie 5 : Những giây cuối tới thiên đường',2,'[{\"changed\": {\"fields\": [\"Tieu de\"]}}]',11,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'cinego','chinhanh'),(7,'cinego','danhgia'),(9,'cinego','nguoidung'),(11,'cinego','phim'),(8,'cinego','quantrivien'),(10,'cinego','ve'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-13 06:38:47.056709'),(2,'auth','0001_initial','2025-03-13 06:38:47.967847'),(3,'admin','0001_initial','2025-03-13 06:38:48.190517'),(4,'admin','0002_logentry_remove_auto_add','2025-03-13 06:38:48.203527'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-13 06:38:48.219162'),(6,'contenttypes','0002_remove_content_type_name','2025-03-13 06:38:48.329319'),(7,'auth','0002_alter_permission_name_max_length','2025-03-13 06:38:48.438845'),(8,'auth','0003_alter_user_email_max_length','2025-03-13 06:38:48.470073'),(9,'auth','0004_alter_user_username_opts','2025-03-13 06:38:48.470073'),(10,'auth','0005_alter_user_last_login_null','2025-03-13 06:38:48.564287'),(11,'auth','0006_require_contenttypes_0002','2025-03-13 06:38:48.564287'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-13 06:38:48.579884'),(13,'auth','0008_alter_user_username_max_length','2025-03-13 06:38:48.674077'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-13 06:38:48.752655'),(15,'auth','0010_alter_group_name_max_length','2025-03-13 06:38:48.783862'),(16,'auth','0011_update_proxy_permissions','2025-03-13 06:38:48.791873'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-13 06:38:48.894679'),(18,'sessions','0001_initial','2025-03-13 06:38:48.941564'),(19,'cinego','0001_initial','2025-03-13 06:42:32.668936'),(20,'cinego','0002_phim_anh_phim_phim_dao_dien','2025-03-13 08:24:20.444507'),(21,'cinego','0003_chinhanh','2025-03-13 08:44:38.668813'),(22,'cinego','0004_phim_coming_soon_phim_is_now_showing','2025-03-19 06:31:02.820941'),(23,'cinego','0005_remove_nguoidung_mat_khau_and_more','2025-03-20 01:04:07.315377');
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
INSERT INTO `django_session` VALUES ('s1ulpg02b0wjwdpss3ccsfcphtin6rqd','.eJxVzMEOwiAQBNB_4WwISwtbPHrvN5CFslI1kJT2ZPx326QHvc68mbfwtK3Zby0tfp7EVYC4_GaB4jOVo5geVO5VxlrWZQ7yIPJsmxzrlF630_4dZGp5X7NBdtFF5RAsa2StOpMgMAULtgfuOCQzODAdqT4So4bdIu5gGGwvPl_eEjeF:1tuvo5:DIB21phZLHppkJyIuWUlr60RUXioIc8OuwaK2ZPbYJw','2025-04-02 15:58:13.073849'),('ttrm2q8owfhlhhq2iznsqnu77tj3jzzr','.eJxVzMEOwiAQBNB_4WwISwtbPHrvN5CFslI1kJT2ZPx326QHvc68mbfwtK3Zby0tfp7EVYC4_GaB4jOVo5geVO5VxlrWZQ7yIPJsmxzrlF630_4dZGp5X7NBdtFF5RAsa2StOpMgMAULtgfuOCQzODAdqT4So4bdIu5gGGwvPl_eEjeF:1tugly:SAQ-AVJgv6Bw6cj6O-GzoUPKK6ieg9TJy7QH1ZgFGu0','2025-04-01 23:55:02.912399'),('u5nx9si9pdiqh92b27uhnqy2y5ka18aj','.eJxVzMEOwiAQBNB_4WwISwtbPHrvN5CFslI1kJT2ZPx326QHvc68mbfwtK3Zby0tfp7EVYC4_GaB4jOVo5geVO5VxlrWZQ7yIPJsmxzrlF630_4dZGp5X7NBdtFF5RAsa2StOpMgMAULtgfuOCQzODAdqT4So4bdIu5gGGwvPl_eEjeF:1tuoD8:su-OPaEVgUHLuf32jlX986a-4dNKnmHseaLcSJOdjIM','2025-04-02 07:51:34.277306');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20  8:29:12
