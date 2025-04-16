-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinemadb
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add phim',7,'add_phim'),(26,'Can change phim',7,'change_phim'),(27,'Can delete phim',7,'delete_phim'),(28,'Can view phim',7,'view_phim'),(29,'Can add phong',8,'add_phong'),(30,'Can change phong',8,'change_phong'),(31,'Can delete phong',8,'delete_phong'),(32,'Can view phong',8,'view_phong'),(33,'Can add ghe',9,'add_ghe'),(34,'Can change ghe',9,'change_ghe'),(35,'Can delete ghe',9,'delete_ghe'),(36,'Can view ghe',9,'view_ghe'),(37,'Can add chi_nhanh',10,'add_chi_nhanh'),(38,'Can change chi_nhanh',10,'change_chi_nhanh'),(39,'Can delete chi_nhanh',10,'delete_chi_nhanh'),(40,'Can view chi_nhanh',10,'view_chi_nhanh'),(41,'Can add bai_viet',11,'add_bai_viet'),(42,'Can change bai_viet',11,'change_bai_viet'),(43,'Can delete bai_viet',11,'delete_bai_viet'),(44,'Can view bai_viet',11,'view_bai_viet'),(45,'Can add nguoi_dung',12,'add_nguoi_dung'),(46,'Can change nguoi_dung',12,'change_nguoi_dung'),(47,'Can delete nguoi_dung',12,'delete_nguoi_dung'),(48,'Can view nguoi_dung',12,'view_nguoi_dung'),(49,'Can add hoa_don',13,'add_hoa_don'),(50,'Can change hoa_don',13,'change_hoa_don'),(51,'Can delete hoa_don',13,'delete_hoa_don'),(52,'Can view hoa_don',13,'view_hoa_don'),(53,'Can add vai_tro',14,'add_vai_tro'),(54,'Can change vai_tro',14,'change_vai_tro'),(55,'Can delete vai_tro',14,'delete_vai_tro'),(56,'Can view vai_tro',14,'view_vai_tro'),(57,'Can add nguoi_dung_vai_tro',15,'add_nguoi_dung_vai_tro'),(58,'Can change nguoi_dung_vai_tro',15,'change_nguoi_dung_vai_tro'),(59,'Can delete nguoi_dung_vai_tro',15,'delete_nguoi_dung_vai_tro'),(60,'Can view nguoi_dung_vai_tro',15,'view_nguoi_dung_vai_tro'),(61,'Can add lich_chieu',16,'add_lich_chieu'),(62,'Can change lich_chieu',16,'change_lich_chieu'),(63,'Can delete lich_chieu',16,'delete_lich_chieu'),(64,'Can view lich_chieu',16,'view_lich_chieu'),(65,'Can add ve',17,'add_ve'),(66,'Can change ve',17,'change_ve'),(67,'Can delete ve',17,'delete_ve'),(68,'Can view ve',17,'view_ve'),(69,'Can add thanh_toan',18,'add_thanh_toan'),(70,'Can change thanh_toan',18,'change_thanh_toan'),(71,'Can delete thanh_toan',18,'delete_thanh_toan'),(72,'Can view thanh_toan',18,'view_thanh_toan'),(73,'Can add password reset code',19,'add_passwordresetcode'),(74,'Can change password reset code',19,'change_passwordresetcode'),(75,'Can delete password reset code',19,'delete_passwordresetcode'),(76,'Can view password reset code',19,'view_passwordresetcode');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$gESTB7c0VPt4pdy6TixKSa$UOUMtKMFnvSPlxhLjBjMSwOq7BU+V9herHqgz5vWJfQ=','2025-04-13 02:45:18.365426',1,'admin','','','',1,1,'2025-04-01 03:33:15.685910');
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
-- Table structure for table `bai_viet`
--

DROP TABLE IF EXISTS `bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bai_viet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_tao` varchar(255) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `tom_tat` varchar(255) DEFAULT NULL,
  `anh_chinh` varchar(255) DEFAULT NULL,
  `trang_thai` int DEFAULT NULL,
  `tieu_de` varchar(255) DEFAULT NULL,
  `loai` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bai_viet`
--

LOCK TABLES `bai_viet` WRITE;
/*!40000 ALTER TABLE `bai_viet` DISABLE KEYS */;
/*!40000 ALTER TABLE `bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_nhanh`
--

DROP TABLE IF EXISTS `chi_nhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_nhanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `duong_dan_anh` varchar(1000) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_nhanh`
--

LOCK TABLES `chi_nhanh` WRITE;
/*!40000 ALTER TABLE `chi_nhanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_nhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_bai_viet`
--

DROP TABLE IF EXISTS `cinema_bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_bai_viet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(255) NOT NULL,
  `tom_tat` longtext NOT NULL,
  `anh_chinh` varchar(255) NOT NULL,
  `trang_thai` int NOT NULL,
  `loai` int NOT NULL,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_bai_viet`
--

LOCK TABLES `cinema_bai_viet` WRITE;
/*!40000 ALTER TABLE `cinema_bai_viet` DISABLE KEYS */;
INSERT INTO `cinema_bai_viet` VALUES (2,'[Review] Địa Đạo Mặt Trời Trong Bóng Tối: Bản Anh Hùng Ca Kỉ Niệm 50 Năm Thống Nhất Đất Nước','Địa Đạo: Mặt Trời Trong Bóng Tối là tác phẩm kỉ niệm 50 năm ngày giải phóng miền Nam, thống nhất đất nước, đúc kết tâm huyết hơn 10 năm của đạo diễn kiêm biên kịch Bùi Thạc Chuyên.','https://www.galaxycine.vn/media/2025/4/5/dia-dao-mat-troi-trong-bong-toi-ban-anh-hung-ca-ki-niem-50-nam-thong-nhat-dat-nuoc-4_1743859602604.jpg',1,1,'2025-04-13 12:32:07.431417','2025-04-13 12:32:07.431417'),(4,'[Review] Phân tích và cảm nhận về Joker - kiệt tác điện ảnh không dành cho số đông','Joker chính là một kiệt tác điện ảnh, nên đương nhiên, khi một tác phẩm mang giá trị nghệ thuật thuần túy thì số đông khó mà cảm nhận được. Điều này giống như câu nói: \"Ai cũng có thể hiểu được nghệ thuật thì ai cũng là nghệ sĩ cả rồi\".\r\n\r\nCó 4 yếu tố đòi hỏi bạn phải có đủ, để lĩnh hội hết toàn bộ cái hay của tác phẩm này. Cụ thể là:\r\n\r\n1. Bạn phải là fan cứng của DC comics để có thể nhận ra những easter egg được lồng ghép trong phim.\r\n\r\n2. Bạn phải là người Mỹ hoặc am hiểu về văn hóa - lịch sử nước Mỹ để hiểu được bối cảnh movie xây dựng.\r\n\r\n3. Bạn phải có cảm quan nghệ thuật để thấy được cái đẹp trong từng khung hình và giai điệu.\r\n\r\n4. Bạn phải từng trải qua những ngày tháng cực tồi tệ trong đời hoặc có một lòng trắc ẩn sâu sắc để thấu hiểu cảm giác của Arthur Fleck.\r\n\r\nNếu bạn đã từng trải qua những tháng ngày bế tắc của cuộc đời, bế tắc đến tuyệt vọng, khi mà bạn không còn biết làm gì ngoài khóc cho sự bất lực của mình, hoặc bạn phải là người thật giàu lòng trắc ẩn, có lẽ bạn mới có thể phần nào thấu hiểu và đồng cảm với những gì mà Arthur phải gồng mình đấu tranh. Mặc dù vậy, phim hoàn toàn không hề cổ xúy bạo lực và sự sa ngã. Joker không phải hình mẫu đáng để noi theo và cũng chưa chắc đã là Joker mà chúng ta vẫn thường nghĩ. Bởi chính Todd Philips và Joaquin Phoenix cũng đã thừa nhận điều này.\r\n\r\nHãy đơn giản xem đây là một tác phẩm nghệ thuật lấy cảm hứng và bối cảnh từ nhân vật của DC Comics thôi. Cũng đừng quên rằng, thứ mà Joker lên án thực sự ở đây là sự mục ruỗng và vô cảm của một xã hội điên loạn, thiếu tình thương','https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/07/anh-joker-6.jpg',1,0,'2025-04-16 05:48:37.128644','2025-04-16 05:57:19.161029');
/*!40000 ALTER TABLE `cinema_bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_chi_nhanh`
--

DROP TABLE IF EXISTS `cinema_chi_nhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_chi_nhanh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `duong_dan_anh` varchar(1000) DEFAULT NULL,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_chi_nhanh`
--

LOCK TABLES `cinema_chi_nhanh` WRITE;
/*!40000 ALTER TABLE `cinema_chi_nhanh` DISABLE KEYS */;
INSERT INTO `cinema_chi_nhanh` VALUES (1,'CineGo Tân Bình','236 Lê Văn Sĩ, Phường 1, Quận Tân Bình, TP.HCM','02451257462','https://quangcaongoaitroi.com/wp-content/uploads/2020/02/quang-cao-tai-rap-chieu-phim-5.jpg','2025-04-05 16:01:15.187777','2025-04-05 16:01:15.187805'),(3,'Cinego Bình Thạnh','246 Nguyễn Hồng Đào, Bình Thạnh, Tp.HCM','0254585456','https://media.vov.vn/sites/default/files/styles/front_large/public/2022-02/dsc_8757.jpg?resize=p_8,w_','2025-04-06 16:42:37.776554','2025-04-06 16:58:31.717317');
/*!40000 ALTER TABLE `cinema_chi_nhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_ghe`
--

DROP TABLE IF EXISTS `cinema_ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_ghe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `loai_ghe` int NOT NULL,
  `phong_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_ghe_phong_id_3a1ae7ca_fk_cinema_phong_id` (`phong_id`),
  CONSTRAINT `cinema_ghe_phong_id_3a1ae7ca_fk_cinema_phong_id` FOREIGN KEY (`phong_id`) REFERENCES `cinema_phong` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_ghe`
--

LOCK TABLES `cinema_ghe` WRITE;
/*!40000 ALTER TABLE `cinema_ghe` DISABLE KEYS */;
INSERT INTO `cinema_ghe` VALUES (26,'A1',1,1),(27,'A2',1,1),(28,'A3',1,1),(39,'A4',1,1),(40,'A5',1,1),(41,'A6',1,1),(42,'A7',1,1),(43,'A8',1,1),(44,'A9',1,1),(45,'A10',1,1),(46,'A1',1,2),(47,'A2',1,2),(48,'A3',1,2),(49,'A4',1,2),(50,'A5',1,2),(51,'A6',1,2),(52,'A7',1,2),(53,'A8',1,2),(54,'A9',1,2),(55,'A10',1,2),(56,'A10',1,2),(57,'D1',1,16),(58,'D2',1,16),(59,'D3',1,16),(60,'D4',1,16),(61,'D5',1,16),(62,'D6',1,16),(63,'D7',1,16),(64,'D8',1,16),(65,'D9',1,16),(66,'D10',1,16),(67,'D11',1,16),(68,'D12',1,16),(69,'D13',1,16),(70,'D14',1,16),(71,'D15',1,16),(72,'D16',1,16),(73,'D17',1,16),(74,'D18',1,16),(75,'D19',1,16),(76,'D20',1,16),(77,'D21',1,16),(78,'D22',1,16),(79,'D23',1,16),(80,'D24',1,16),(81,'D25',1,16),(82,'D26',1,16),(83,'D27',1,16),(84,'D28',1,16),(85,'D29',1,16),(86,'D30',1,16),(87,'D31',1,16),(88,'D32',1,16),(89,'D33',1,16),(90,'D34',1,16),(91,'D35',1,16),(92,'D36',1,16),(93,'D37',1,16),(94,'D38',1,16),(95,'D39',1,16),(96,'D40',1,16),(97,'D41',1,16),(98,'D42',1,16),(99,'D43',1,16),(100,'D44',1,16),(101,'D45',1,16),(102,'D46',1,16),(103,'D47',1,16),(104,'D48',1,16),(105,'D49',1,16),(106,'D50',1,16),(107,'D51',1,16),(108,'D52',1,16),(109,'D53',1,16),(110,'D54',1,16),(111,'D55',1,16),(112,'D56',1,16),(113,'D57',1,16),(114,'D58',1,16),(115,'D59',1,16),(116,'D60',1,16),(117,'D61',1,16),(118,'D62',1,16),(119,'D63',1,16),(120,'D64',1,16),(121,'D65',1,16),(122,'D66',1,16),(123,'D67',1,16),(124,'D68',1,16),(125,'D69',1,16),(126,'D70',1,16),(127,'D71',1,16),(128,'D72',1,16),(129,'D73',1,16),(130,'D74',1,16),(131,'D75',1,16),(132,'D76',1,16),(133,'D77',1,16),(134,'D78',1,16),(135,'D79',1,16),(136,'D80',1,16),(137,'D81',1,16),(138,'D82',1,16),(139,'D83',1,16),(140,'D84',1,16),(141,'D85',1,16),(142,'D86',1,16),(143,'D87',1,16),(144,'D88',1,16),(145,'D89',1,16),(146,'D90',1,16),(147,'D91',1,16),(148,'D92',1,16),(149,'D93',1,16),(150,'D94',1,16),(151,'D95',1,16),(152,'D96',1,16),(153,'D97',1,16),(154,'D98',1,16),(155,'D99',1,16),(156,'D100',1,16),(157,'E1',1,17),(158,'E2',1,17),(159,'E3',1,17),(160,'E4',1,17),(161,'E5',1,17),(162,'E6',1,17),(163,'E7',1,17),(164,'E8',1,17),(165,'E9',1,17),(166,'E10',1,17),(167,'E11',1,17),(168,'E12',1,17),(169,'E13',1,17),(170,'E14',1,17),(171,'E15',1,17),(172,'E16',1,17),(173,'E17',1,17),(174,'E18',1,17),(175,'E19',1,17),(176,'E20',1,17),(177,'E21',1,17),(178,'E22',1,17),(179,'E23',1,17),(180,'E24',1,17),(181,'E25',1,17),(182,'E26',1,17),(183,'E27',1,17),(184,'E28',1,17),(185,'E29',1,17),(186,'E30',1,17),(187,'E31',1,17),(188,'E32',1,17),(189,'E33',1,17),(190,'E34',1,17),(191,'E35',1,17),(192,'E36',1,17),(193,'E37',1,17),(194,'E38',1,17),(195,'E39',1,17),(196,'E40',1,17),(197,'E41',1,17),(198,'E42',1,17),(199,'E43',1,17),(200,'E44',1,17),(201,'E45',1,17),(202,'E46',1,17),(203,'E47',1,17),(204,'E48',1,17),(205,'E49',1,17),(206,'E50',1,17),(207,'E51',1,17),(208,'E52',1,17),(209,'E53',1,17),(210,'E54',1,17),(211,'E55',1,17),(212,'E56',1,17),(213,'E57',1,17),(214,'E58',1,17),(215,'E59',1,17),(216,'E60',1,17),(217,'E61',1,17),(218,'E62',1,17),(219,'E63',1,17),(220,'E64',1,17),(221,'E65',1,17),(222,'E66',1,17),(223,'E67',1,17),(224,'E68',1,17),(225,'E69',1,17),(226,'E70',1,17),(227,'E71',1,17),(228,'E72',1,17),(229,'E73',1,17),(230,'E74',1,17),(231,'E75',1,17),(232,'E76',1,17),(233,'E77',1,17),(234,'E78',1,17),(235,'E79',1,17),(236,'E80',1,17),(237,'E81',1,17),(238,'E82',1,17),(239,'E83',1,17),(240,'E84',1,17),(241,'E85',1,17),(242,'E86',1,17),(243,'E87',1,17),(244,'E88',1,17),(245,'E89',1,17),(246,'E90',1,17),(247,'E91',1,17),(248,'E92',1,17),(249,'E93',1,17),(250,'E94',1,17),(251,'E95',1,17),(252,'E96',1,17),(253,'E97',1,17),(254,'E98',1,17),(255,'E99',1,17),(256,'E100',1,17),(257,'F1',1,18),(258,'F2',1,18),(259,'F3',1,18),(260,'F4',1,18),(261,'F5',1,18),(262,'F6',1,18),(263,'F7',1,18),(264,'F8',1,18),(265,'F9',1,18),(266,'F10',1,18),(267,'F11',1,18),(268,'F12',1,18),(269,'F13',1,18),(270,'F14',1,18),(271,'F15',1,18),(272,'F16',1,18),(273,'F17',1,18),(274,'F18',1,18),(275,'F19',1,18),(276,'F20',1,18),(277,'F21',1,18),(278,'F22',1,18),(279,'F23',1,18),(280,'F24',1,18),(281,'F25',1,18),(282,'F26',1,18),(283,'F27',1,18),(284,'F28',1,18),(285,'F29',1,18),(286,'F30',1,18),(287,'F31',1,18),(288,'F32',1,18),(289,'F33',1,18),(290,'F34',1,18),(291,'F35',1,18),(292,'F36',1,18),(293,'F37',1,18),(294,'F38',1,18),(295,'F39',1,18),(296,'F40',1,18),(297,'F41',1,18),(298,'F42',1,18),(299,'F43',1,18),(300,'F44',1,18),(301,'F45',1,18),(302,'F46',1,18),(303,'F47',1,18),(304,'F48',1,18),(305,'F49',1,18),(306,'F50',1,18),(307,'F51',1,18),(308,'F52',1,18),(309,'F53',1,18),(310,'F54',1,18),(311,'F55',1,18),(312,'F56',1,18),(313,'F57',1,18),(314,'F58',1,18),(315,'F59',1,18),(316,'F60',1,18),(317,'F61',1,18),(318,'F62',1,18),(319,'F63',1,18),(320,'F64',1,18),(321,'F65',1,18),(322,'F66',1,18),(323,'F67',1,18),(324,'F68',1,18),(325,'F69',1,18),(326,'F70',1,18),(327,'F71',1,18),(328,'F72',1,18),(329,'F73',1,18),(330,'F74',1,18),(331,'F75',1,18),(332,'F76',1,18),(333,'F77',1,18),(334,'F78',1,18),(335,'F79',1,18),(336,'F80',1,18),(337,'F81',1,18),(338,'F82',1,18),(339,'F83',1,18),(340,'F84',1,18),(341,'F85',1,18),(342,'F86',1,18),(343,'F87',1,18),(344,'F88',1,18),(345,'F89',1,18),(346,'F90',1,18),(347,'F91',1,18),(348,'F92',1,18),(349,'F93',1,18),(350,'F94',1,18),(351,'F95',1,18),(352,'F96',1,18),(353,'F97',1,18),(354,'F98',1,18),(355,'F99',1,18),(356,'F100',1,18),(357,'F1',1,19),(358,'F2',1,19),(359,'F3',1,19),(360,'F4',1,19),(361,'F5',1,19),(362,'F6',1,19),(363,'F7',1,19),(364,'F8',1,19),(365,'F9',1,19),(366,'F10',1,19),(367,'F11',1,19),(368,'F12',1,19),(369,'F13',1,19),(370,'F14',1,19),(371,'F15',1,19),(372,'F16',1,19),(373,'F17',1,19),(374,'F18',1,19),(375,'F19',1,19),(376,'F20',1,19),(377,'F21',1,19),(378,'F22',1,19),(379,'F23',1,19),(380,'F24',1,19),(381,'F25',1,19),(382,'F26',1,19),(383,'F27',1,19),(384,'F28',1,19),(385,'F29',1,19),(386,'F30',1,19),(387,'F31',1,19),(388,'F32',1,19),(389,'F33',1,19),(390,'F34',1,19),(391,'F35',1,19),(392,'F36',1,19),(393,'F37',1,19),(394,'F38',1,19),(395,'F39',1,19),(396,'F40',1,19),(397,'F41',1,19),(398,'F42',1,19),(399,'F43',1,19),(400,'F44',1,19),(401,'F45',1,19),(402,'F46',1,19),(403,'F47',1,19),(404,'F48',1,19),(405,'F49',1,19),(406,'F50',1,19),(407,'F51',1,19),(408,'F52',1,19),(409,'F53',1,19),(410,'F54',1,19),(411,'F55',1,19),(412,'F56',1,19),(413,'F57',1,19),(414,'F58',1,19),(415,'F59',1,19),(416,'F60',1,19),(417,'F61',1,19),(418,'F62',1,19),(419,'F63',1,19),(420,'F64',1,19),(421,'F65',1,19),(422,'F66',1,19),(423,'F67',1,19),(424,'F68',1,19),(425,'F69',1,19),(426,'F70',1,19),(427,'F71',1,19),(428,'F72',1,19),(429,'F73',1,19),(430,'F74',1,19),(431,'F75',1,19),(432,'F76',1,19),(433,'F77',1,19),(434,'F78',1,19),(435,'F79',1,19),(436,'F80',1,19),(437,'F81',1,19),(438,'F82',1,19),(439,'F83',1,19),(440,'F84',1,19),(441,'F85',1,19),(442,'F86',1,19),(443,'F87',1,19),(444,'F88',1,19),(445,'F89',1,19),(446,'F90',1,19),(447,'F91',1,19),(448,'F92',1,19),(449,'F93',1,19),(450,'F94',1,19),(451,'F95',1,19),(452,'F96',1,19),(453,'F97',1,19),(454,'F98',1,19),(455,'F99',1,19),(456,'F100',1,19),(457,'A1',1,20),(458,'A2',1,20),(459,'A3',1,20),(460,'A4',1,20),(461,'A5',1,20),(462,'A6',1,20),(463,'A7',1,20),(464,'A8',1,20),(465,'A9',1,20),(466,'A10',1,20),(467,'A11',1,20),(468,'A12',1,20),(469,'A13',1,20),(470,'A14',1,20),(471,'A15',1,20),(472,'A16',1,20),(473,'A17',1,20),(474,'A18',1,20),(475,'A19',1,20),(476,'A20',1,20),(477,'A21',1,20),(478,'A22',1,20),(479,'A23',1,20),(480,'A24',1,20),(481,'A25',1,20),(482,'A26',1,20),(483,'A27',1,20),(484,'A28',1,20),(485,'A29',1,20),(486,'A30',1,20),(487,'A31',1,20),(488,'A32',1,20),(489,'A33',1,20),(490,'A34',1,20),(491,'A35',1,20),(492,'A36',1,20),(493,'A37',1,20),(494,'A38',1,20),(495,'A39',1,20),(496,'A40',1,20),(497,'A41',1,20),(498,'A42',1,20),(499,'A43',1,20),(500,'A44',1,20),(501,'A45',1,20),(502,'A46',1,20),(503,'A47',1,20),(504,'A48',1,20),(505,'A49',1,20),(506,'A50',1,20),(507,'A51',1,20),(508,'A52',1,20),(509,'A53',1,20),(510,'A54',1,20),(511,'A55',1,20),(512,'A56',1,20),(513,'A57',1,20),(514,'A58',1,20),(515,'A59',1,20),(516,'A60',1,20),(517,'A61',1,20),(518,'A62',1,20),(519,'A63',1,20),(520,'A64',1,20),(521,'A65',1,20),(522,'A66',1,20),(523,'A67',1,20),(524,'A68',1,20),(525,'A69',1,20),(526,'A70',1,20),(527,'A71',1,20),(528,'A72',1,20),(529,'A73',1,20),(530,'A74',1,20),(531,'A75',1,20),(532,'A76',1,20),(533,'A77',1,20),(534,'A78',1,20),(535,'A79',1,20),(536,'A80',1,20),(537,'A81',1,20),(538,'A82',1,20),(539,'A83',1,20),(540,'A84',1,20),(541,'A85',1,20),(542,'A86',1,20),(543,'A87',1,20),(544,'A88',1,20),(545,'A89',1,20),(546,'A90',1,20),(547,'A91',1,20),(548,'A92',1,20),(549,'A93',1,20),(550,'A94',1,20),(551,'A95',1,20),(552,'A96',1,20),(553,'A97',1,20),(554,'A98',1,20),(555,'A99',1,20),(556,'A100',1,20),(557,'B1',1,21),(558,'B2',1,21),(559,'B3',1,21),(560,'B4',1,21),(561,'B5',1,21),(562,'B6',1,21),(563,'B7',1,21),(564,'B8',1,21),(565,'B9',1,21),(566,'B10',1,21),(567,'B11',1,21),(568,'B12',1,21),(569,'B13',1,21),(570,'B14',1,21),(571,'B15',1,21),(572,'B16',1,21),(573,'B17',1,21),(574,'B18',1,21),(575,'B19',1,21),(576,'B20',1,21),(577,'B21',1,21),(578,'B22',1,21),(579,'B23',1,21),(580,'B24',1,21),(581,'B25',1,21),(582,'B26',1,21),(583,'B27',1,21),(584,'B28',1,21),(585,'B29',1,21),(586,'B30',1,21),(587,'B31',1,21),(588,'B32',1,21),(589,'B33',1,21),(590,'B34',1,21),(591,'B35',1,21),(592,'B36',1,21),(593,'B37',1,21),(594,'B38',1,21),(595,'B39',1,21),(596,'B40',1,21),(597,'B41',1,21),(598,'B42',1,21),(599,'B43',1,21),(600,'B44',1,21),(601,'B45',1,21),(602,'B46',1,21),(603,'B47',1,21),(604,'B48',1,21),(605,'B49',1,21),(606,'B50',1,21),(607,'B51',1,21),(608,'B52',1,21),(609,'B53',1,21),(610,'B54',1,21),(611,'B55',1,21),(612,'B56',1,21),(613,'B57',1,21),(614,'B58',1,21),(615,'B59',1,21),(616,'B60',1,21),(617,'B61',1,21),(618,'B62',1,21),(619,'B63',1,21),(620,'B64',1,21),(621,'B65',1,21),(622,'B66',1,21),(623,'B67',1,21),(624,'B68',1,21),(625,'B69',1,21),(626,'B70',1,21),(627,'B71',1,21),(628,'B72',1,21),(629,'B73',1,21),(630,'B74',1,21),(631,'B75',1,21),(632,'B76',1,21),(633,'B77',1,21),(634,'B78',1,21),(635,'B79',1,21),(636,'B80',1,21),(637,'B81',1,21),(638,'B82',1,21),(639,'B83',1,21),(640,'B84',1,21),(641,'B85',1,21),(642,'B86',1,21),(643,'B87',1,21),(644,'B88',1,21),(645,'B89',1,21),(646,'B90',1,21),(647,'B91',1,21),(648,'B92',1,21),(649,'B93',1,21),(650,'B94',1,21),(651,'B95',1,21),(652,'B96',1,21),(653,'B97',1,21),(654,'B98',1,21),(655,'B99',1,21),(656,'B100',1,21),(657,'C1',1,22),(658,'C2',1,22),(659,'C3',1,22),(660,'C4',1,22),(661,'C5',1,22),(662,'C6',1,22),(663,'C7',1,22),(664,'C8',1,22),(665,'C9',1,22),(666,'C10',1,22),(667,'C11',1,22),(668,'C12',1,22),(669,'C13',1,22),(670,'C14',1,22),(671,'C15',1,22),(672,'C16',1,22),(673,'C17',1,22),(674,'C18',1,22),(675,'C19',1,22),(676,'C20',1,22),(677,'C21',1,22),(678,'C22',1,22),(679,'C23',1,22),(680,'C24',1,22),(681,'C25',1,22),(682,'C26',1,22),(683,'C27',1,22),(684,'C28',1,22),(685,'C29',1,22),(686,'C30',1,22),(687,'C31',1,22),(688,'C32',1,22),(689,'C33',1,22),(690,'C34',1,22),(691,'C35',1,22),(692,'C36',1,22),(693,'C37',1,22),(694,'C38',1,22),(695,'C39',1,22),(696,'C40',1,22),(697,'C41',1,22),(698,'C42',1,22),(699,'C43',1,22),(700,'C44',1,22),(701,'C45',1,22),(702,'C46',1,22),(703,'C47',1,22),(704,'C48',1,22),(705,'C49',1,22),(706,'C50',1,22),(707,'C51',1,22),(708,'C52',1,22),(709,'C53',1,22),(710,'C54',1,22),(711,'C55',1,22),(712,'C56',1,22),(713,'C57',1,22),(714,'C58',1,22),(715,'C59',1,22),(716,'C60',1,22),(717,'C61',1,22),(718,'C62',1,22),(719,'C63',1,22),(720,'C64',1,22),(721,'C65',1,22),(722,'C66',1,22),(723,'C67',1,22),(724,'C68',1,22),(725,'C69',1,22),(726,'C70',1,22),(727,'C71',1,22),(728,'C72',1,22),(729,'C73',1,22),(730,'C74',1,22),(731,'C75',1,22),(732,'C76',1,22),(733,'C77',1,22),(734,'C78',1,22),(735,'C79',1,22),(736,'C80',1,22),(737,'C81',1,22),(738,'C82',1,22),(739,'C83',1,22),(740,'C84',1,22),(741,'C85',1,22),(742,'C86',1,22),(743,'C87',1,22),(744,'C88',1,22),(745,'C89',1,22),(746,'C90',1,22),(747,'C91',1,22),(748,'C92',1,22),(749,'C93',1,22),(750,'C94',1,22),(751,'C95',1,22),(752,'C96',1,22),(753,'C97',1,22),(754,'C98',1,22),(755,'C99',1,22),(756,'C100',1,22);
/*!40000 ALTER TABLE `cinema_ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_hoa_don`
--

DROP TABLE IF EXISTS `cinema_hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_hoa_don` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  `nguoi_dung_id` bigint NOT NULL,
  `so_luong` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_hoa_don_nguoi_dung_id_28446a58_fk_cinema_nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `cinema_hoa_don_nguoi_dung_id_28446a58_fk_cinema_nguoi_dung_id` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinema_nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_hoa_don`
--

LOCK TABLES `cinema_hoa_don` WRITE;
/*!40000 ALTER TABLE `cinema_hoa_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_lich_chieu`
--

DROP TABLE IF EXISTS `cinema_lich_chieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_lich_chieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `gio_bat_dau` time(6) NOT NULL,
  `chi_nhanh_id` bigint NOT NULL,
  `phim_id` bigint NOT NULL,
  `phong_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_lich_chieu_chi_nhanh_id_5b607332_fk_cinema_chi_nhanh_id` (`chi_nhanh_id`),
  KEY `cinema_lich_chieu_phim_id_07549e4a_fk_cinema_phim_id` (`phim_id`),
  KEY `cinema_lich_chieu_phong_id_74e6e4fb_fk_cinema_phong_id` (`phong_id`),
  CONSTRAINT `cinema_lich_chieu_chi_nhanh_id_5b607332_fk_cinema_chi_nhanh_id` FOREIGN KEY (`chi_nhanh_id`) REFERENCES `cinema_chi_nhanh` (`id`),
  CONSTRAINT `cinema_lich_chieu_phim_id_07549e4a_fk_cinema_phim_id` FOREIGN KEY (`phim_id`) REFERENCES `cinema_phim` (`id`),
  CONSTRAINT `cinema_lich_chieu_phong_id_74e6e4fb_fk_cinema_phong_id` FOREIGN KEY (`phong_id`) REFERENCES `cinema_phong` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_lich_chieu`
--

LOCK TABLES `cinema_lich_chieu` WRITE;
/*!40000 ALTER TABLE `cinema_lich_chieu` DISABLE KEYS */;
INSERT INTO `cinema_lich_chieu` VALUES (12,'2025-04-13 10:55:22.180825','2025-04-13 10:55:22.180825','2025-04-01','18:00:00.000000',1,14,16),(13,'2025-04-13 11:42:54.406024','2025-04-16 07:21:26.269801','2025-04-11','18:00:00.000000',1,16,17),(14,'2025-04-13 11:43:20.418323','2025-04-13 11:43:20.418323','2025-04-11','19:00:00.000000',1,16,18),(17,'2025-04-16 04:47:34.573997','2025-04-16 04:47:34.575030','2025-04-30','18:00:00.000000',1,17,22),(18,'2025-04-16 07:33:59.324981','2025-04-16 07:33:59.324981','2025-04-01','06:00:00.000000',1,17,19),(19,'2025-04-16 07:38:31.716816','2025-04-16 07:38:31.717806','2025-04-15','07:00:00.000000',3,17,20),(20,'2025-04-16 07:39:11.766575','2025-04-16 07:39:11.766575','2025-04-15','10:00:00.000000',3,18,21),(21,'2025-04-16 07:39:33.840872','2025-04-16 07:39:33.840872','2025-04-15','20:00:00.000000',3,19,22);
/*!40000 ALTER TABLE `cinema_lich_chieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_nguoi_dung`
--

DROP TABLE IF EXISTS `cinema_nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_nguoi_dung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mat_khau` varchar(100) NOT NULL,
  `ten_dang_nhap` varchar(15) NOT NULL,
  `duong_dan_anh` varchar(100) DEFAULT NULL,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `ten_dang_nhap` (`ten_dang_nhap`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_nguoi_dung`
--

LOCK TABLES `cinema_nguoi_dung` WRITE;
/*!40000 ALTER TABLE `cinema_nguoi_dung` DISABLE KEYS */;
INSERT INTO `cinema_nguoi_dung` VALUES (6,'Hoàng Hồng Hà','ha@gmail.com','pbkdf2_sha256$870000$WOey6tawl7sQ1CY7p5CXD8$fApWW8TtEk5H02mo/IiGpmEPbYn7xVqhPo+KR3RqJ7E=','ha123',NULL,'2025-04-08 03:18:42.214339','2025-04-08 03:18:42.214363'),(7,'Văn Lâm Nhật','nhat@gmail.com','pbkdf2_sha256$870000$U6parDVN65IlSNfzaMWIoH$kxNraDbAD/CdfsVyhfA64yQBj8Tn1R8UCh+VUur++hM=','nhat123',NULL,'2025-04-08 03:23:13.774267','2025-04-08 03:23:13.774296'),(8,'C15sda','haivipsssspy123@gmail.com','pbkdf2_sha256$870000$IlNLBiIriqoNP6Lf1bGRXJ$VYjCJzLO8jzmhgOkQKLFNWLXo6ez9MdY2ZjpwXj/BBI=','ha1234',NULL,'2025-04-08 14:30:20.357989','2025-04-08 14:30:20.358018'),(9,'Long Nhật Huỳnh','long@gmail.com','pbkdf2_sha256$870000$EEiBt3fdeSl8XZsfm8E12F$1MmftGcet1HhZwqxGiRvJrRcMGaz3tthB64MQ/UeEi0=','long123',NULL,'2025-04-08 14:39:30.595984','2025-04-08 14:39:30.596603'),(10,'camcoduaxe','camcoduaxe88@gmail.com','pbkdf2_sha256$870000$u5e157GMRjEzOpKCY1Fzr6$hB+/okOgQyjBKpD6kxijO1eEKsYURJODYJq1L4QFdDE=','xe123',NULL,'2025-04-09 17:56:06.034109','2025-04-10 12:00:09.259872'),(11,'Hoàng Hồng Hà','huynhhuuhoang14@gmail.com','pbkdf2_sha256$870000$ep6gB3tlW5tHIqn70eYs1S$SSWNX2eEfsErfMtfndrQGLBlkA/c9QEte1uZPyiHUfk=','hoang123',NULL,'2025-04-10 12:07:53.075725','2025-04-10 12:10:43.327406'),(12,'Nguyen','bestcaythue007@gmail.com','pbkdf2_sha256$870000$jNBJhHWfsYSJvfdjbpwCBh$uSrnMeb2sRF+xnfCPK1syYsKvO9vkkoUF5lc88laON0=','tangtai',NULL,'2025-04-12 04:57:45.696356','2025-04-16 04:14:28.417159');
/*!40000 ALTER TABLE `cinema_nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_nguoi_dung_vai_tro`
--

DROP TABLE IF EXISTS `cinema_nguoi_dung_vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_nguoi_dung_vai_tro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` bigint NOT NULL,
  `vai_tro_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_nguoi_dung_va_nguoi_dung_id_1b21f50c_fk_cinema_ng` (`nguoi_dung_id`),
  KEY `cinema_nguoi_dung_va_vai_tro_id_d081ac7c_fk_cinema_va` (`vai_tro_id`),
  CONSTRAINT `cinema_nguoi_dung_va_nguoi_dung_id_1b21f50c_fk_cinema_ng` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinema_nguoi_dung` (`id`),
  CONSTRAINT `cinema_nguoi_dung_va_vai_tro_id_d081ac7c_fk_cinema_va` FOREIGN KEY (`vai_tro_id`) REFERENCES `cinema_vai_tro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_nguoi_dung_vai_tro`
--

LOCK TABLES `cinema_nguoi_dung_vai_tro` WRITE;
/*!40000 ALTER TABLE `cinema_nguoi_dung_vai_tro` DISABLE KEYS */;
INSERT INTO `cinema_nguoi_dung_vai_tro` VALUES (5,6,1),(6,7,1),(7,8,1),(8,9,1),(9,10,1),(10,11,1),(11,12,1);
/*!40000 ALTER TABLE `cinema_nguoi_dung_vai_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_passwordresetcode`
--

DROP TABLE IF EXISTS `cinema_passwordresetcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_passwordresetcode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `nguoi_dung_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_passwordreset_nguoi_dung_id_d1f32627_fk_cinema_ng` (`nguoi_dung_id`),
  CONSTRAINT `cinema_passwordreset_nguoi_dung_id_d1f32627_fk_cinema_ng` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `cinema_nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_passwordresetcode`
--

LOCK TABLES `cinema_passwordresetcode` WRITE;
/*!40000 ALTER TABLE `cinema_passwordresetcode` DISABLE KEYS */;
INSERT INTO `cinema_passwordresetcode` VALUES (1,'382250','2025-04-09 17:53:59.174598','2025-04-09 18:08:59.172631',6),(2,'930083','2025-04-09 17:56:25.895582','2025-04-09 18:11:25.895443',10),(4,'743953','2025-04-09 18:34:23.069926','2025-04-09 18:49:23.069619',10),(7,'332671','2025-04-10 11:48:47.679196','2025-04-10 12:03:47.678292',10),(11,'622929','2025-04-11 06:36:46.380542','2025-04-11 06:51:46.378662',11);
/*!40000 ALTER TABLE `cinema_passwordresetcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_phim`
--

DROP TABLE IF EXISTS `cinema_phim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_phim` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `dao_dien` varchar(255) NOT NULL,
  `dien_vien` longtext NOT NULL,
  `the_loai` varchar(255) NOT NULL,
  `ngon_ngu` varchar(100) NOT NULL,
  `danh_gia` varchar(100) NOT NULL,
  `ngay_phat_hanh` date NOT NULL,
  `trailer` varchar(1000) DEFAULT NULL,
  `mo_ta_ngan` longtext NOT NULL,
  `mo_ta_dai` longtext NOT NULL,
  `dang_chieu` tinyint(1) NOT NULL,
  `duong_dan_anh` varchar(255) NOT NULL,
  `gia_ve` float DEFAULT NULL,
  `banner` varchar(255) NOT NULL DEFAULT 'https://example.com/no_banner.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_phim`
--

LOCK TABLES `cinema_phim` WRITE;
/*!40000 ALTER TABLE `cinema_phim` DISABLE KEYS */;
INSERT INTO `cinema_phim` VALUES (13,'Conan movie 28 : Dư Ảnh Của Độc Nhãn','Katsuya Shigehara','Minami Takayama, Wakana Yamazaki','Hoạt hình','Nhật bản','10','2025-04-18','https://a.storyblok.com/f/178900/1200x630/7c033d60b4/conan-movie-28.jpg/m/1200x0/filters:quality(95)format(webp)','Conan khám phá vụ án bí ẩn tại Nagano phủ đầy tuyết, khi một ký ức từ quá khứ đẫm máu được đánh thức. Bí mật đằng sau “con mắt mù” dần hé lộ…','Trong phần phim thứ 28 Detective Conan: The Blind Eye’s Flashback, thám tử nhí Conan Edogawa bị cuốn vào một vụ án mạng rúng động tại vùng núi tuyết Nagano. Cùng với Yamato Kansuke, Morofushi Takaaki và Uehara Yui, Conan lần theo manh mối về một vụ án chưa có lời giải từ quá khứ, liên quan đến “con mắt mù” bí ẩn. Những ký ức bị lãng quên, một tai nạn trong quá khứ và mối liên hệ với các thành viên của Cục Cảnh sát Tỉnh Nagano dần được hé mở. Trong lúc đó, sự xuất hiện của Furuya Rei (Amuro Tooru), Kazami Yuya và thanh tra Kuroda khiến vụ án trở nên phức tạp hơn bao giờ hết.\r\nVới bối cảnh mùa đông lạnh giá, không khí u ám và các pha điều tra đầy kịch tính, bộ phim hứa hẹn sẽ đưa người xem vào một hành trình nghẹt thở, nơi sự thật và dối trá đan xen trong băng giá. Đây là phần phim đầy cảm xúc, tái hiện những mảnh ký ức đau thương và sự hy sinh thầm lặng của những người thực thi công lý.',0,'https://cdn.moveek.com/storage/media/cache/tall/67b752dce0c55330810245.jpg',50000,'https://i.postimg.cc/nVQGYVWg/484319786-658440386546254-74992194688172253-n.jpg'),(14,'Interstellar','Christopher Nolan','Matthew McConaughey, Anne Hathaway','Khoa học viễn tưởng, Phiêu lưu, Chính kịch','Tiếng Việt','8.6','2025-04-01','https://www.youtube.com/watch?v=zSWdZVtXT7E','Hành trình tìm hành tinh mới cứu lấy loài người.','Trong bối cảnh Trái Đất đang cạn kiệt tài nguyên, một nhóm phi hành gia mạo hiểm vượt qua hố đen để tìm hành tinh có thể duy trì sự sống cho nhân loại.',1,'https://th.bing.com/th/id/OIP.jVVUF1D1uEuSPvQtvM5uXgHaLH?rs=1&pid=ImgDetMain',120000,'https://static1.moviewebimages.com/wordpress/wp-content/uploads/photo/Jzf8rVaXzvbX2Z8EhTrvSnTanu6oXc.jpg'),(15,'Địa Đạo','Bùi Thạc Chuyên','Thái Hòa, Quang Tuấn, Hồ Thu Anh, NSƯT Cao Minh,...','Lịch Sử, Hành động','Tiếng Việt','9.0','2025-04-01','https://youtu.be/xh6IDHjvytU?si=n7Kp-8d8wjZVnY5R','Hành trình tìm hành tinh mới cứu lấy loài người.','Trong bối cảnh Trái Đất đang cạn kiệt tài nguyên, một nhóm phi hành gia mạo hiểm vượt qua hố đen để tìm hành tinh có thể duy trì sự sống cho nhân loại.',1,'https://cdn.galaxycine.vn/media/2025/3/25/dia-dao-2_1742873342430.jpg',30040,'https://cdn.galaxycine.vn/media/2025/3/25/dia-dao-1_1742874075591.jpg'),(16,'Tay Nghiệp Dư','Jame Hawes','Rami Malek, Rachel Brosnahan, Jon Bernthal','Hành đông, giật gân','Mỹ','8.5','2025-04-11','https://youtu.be/c0SG_zJarME?si=aH2QcLBCCqO4csyc','The Amateur/ Tay Nghiệp Dư kể về Charlie Heller (Rami Malek) là một chuyên gia giải mã thiên tài nhưng sống khép kín, làm việc cho CIA.','Cuộc đời anh bỗng chốc đảo lộn khi vợ anh bị sát hại trong một vụ tấn công khủng bố ở London. Khi cấp trên từ chối hành động, Charlie quyết định tự mình truy lùng những kẻ đứng sau, dấn thân vào hành trình báo thù đầy nguy hiểm trên toàn cầu, nơi trí tuệ sắc bén trở thành vũ khí tối thượng giúp anh vượt qua mọi kẻ truy đuổi.',1,'https://cdn.galaxycine.vn/media/2025/3/28/tay-nghiep-du-500_1743148894221.jpg',55000,'https://cdn.galaxycine.vn/media/2025/4/9/the-amateur-1_1744190210271.jpg'),(17,'Titanic - Chuyến tàu định mệnh','James Cameron','Leonardo Wilhelm DiCaprio , Kate Elizabeth Winslet , William George \"Billy\" Zane, Jr.','Thảm họa, lãng mạn, sử thi, chính kịch','USA','9.9','2025-04-30','https://youtu.be/kVrqfYjkTdQ?si=yOrbbWaeY-fugzFQ','Chuyện tình bi tráng giữa Jack và Rose trên con tàu Titanic huyền thoại, khi tình yêu bị thử thách giữa thảm họa chìm tàu kinh hoàng.','Titanic là một bộ phim nổi tiếng của đạo diễn James Cameron, ra mắt năm 1997, kể về chuyện tình bi tráng giữa chàng họa sĩ nghèo Jack Dawson và tiểu thư quý tộc Rose DeWitt Bukater. Họ gặp nhau trên con tàu Titanic – con tàu được mệnh danh là “không thể chìm”, trong hành trình vượt Đại Tây Dương năm 1912. Bất chấp khoảng cách về giai cấp và sự ngăn cản từ gia đình, tình yêu giữa Jack và Rose nảy nở mạnh mẽ và thuần khiết.\r\n\r\nTuy nhiên, thảm họa ập đến khi Titanic va phải một tảng băng trôi và bắt đầu chìm dần giữa biển khơi lạnh giá. Bộ phim không chỉ khắc họa một chuyện tình cảm động mà còn tái hiện một cách chân thực và ám ảnh về sự hoảng loạn, mất mát của hàng ngàn con người trong vụ đắm tàu lịch sử.',1,'https://blob.cede.ch/catalog/10011000/10011245_1_92.jpg?v=2',75000,'https://www.bochcenter.org/assets/img/titanic-header-bdd1c2a263.jpg'),(18,'Vô Hạn Thành','sotozaki Haruo','Shimono Hiro','Hoạt hình','Nhật Bản','8.9','2025-08-15','https://youtu.be/U0eSjZtRq8o','Thanh Gươm Diệt Quỷ: Vô Hạn Thành là phần đầu tiên diễn ra khi trận chiến cuối cùng giữa Sát Quỷ Đoàn cùng Muzan và bè lũ bùng nổ tại Vô Hạn Thành.','Kamado Tanjiro gia nhập Sát Quỷ Đoàn sau khi em gái Nezuko bị biến thành quỷ. Trong quá trình trưởng thành, Tanjiro đã chiến đấu với nhiều con quỷ cùng với các đồng đội Agatsuma Zenitsu và Hashibira Inosuke. Hành trình đưa cậu đến với cuộc chiến cùng những kiếm sĩ cấp cao nhất của Sát Quỷ Đoàn - các Trụ Cột - gồm Viêm Trụ Rengoku Kyojuro trên Chuyến Tàu Vô Tận, Âm Trụ Uzui Tengen tại Kỹ Viện Trấn, cũng như Hà Trụ Tokito Muichiro và Luyến Trụ Kanroji Mitsuri tại Làng Thợ Rèn. Khi các thành viên của Sát Quỷ Đoàn và Trụ Cột tham gia vào chương trình đặc huấn để chuẩn bị cho trận chiến sắp với lũ quỷ, Kibutsuji Muzan xuất hiện tại Dinh thự Ubuyashiki. Khi thủ lĩnh của Sát Quỷ Đoàn gặp nguy hiểm, Tanjiro và các Trụ Cột trở về trụ sở Thế nhưng, Muzan bất ngờ kéo toàn bộ Sát Quỷ Đoàn đến hang ổ cuối cùng của lũ quỷ là Vô Hạn Thành, mở màn cho trận đánh cuối cùng của cả hai phe.',0,'https://cdn.galaxycine.vn/media/2025/3/21/demon-slayer--kimetsu-no-yaiba--the-movie-infinity-castle-2_1742546619891.jpg',70000,'https://easycdn.es/1/imagenes/animanga-0_348591.png'),(19,'Joker','Todd Phillips','Joaquin Phoenix , Robert De Niro, Zazie Beetz, Frances Conroy','Tâm lý, hành động','USA','10','2019-04-10','https://youtu.be/zAGVQLHvwOY?si=V7u_Vliw-JbIfdjj','“Joker” là hành trình tăm tối về sự tha hóa của Arthur Fleck – một gã hề cô độc biến thành biểu tượng tội ác trong thành phố Gotham hỗn loạn.','Joaquin Phoenix trong vai Arthur Fleck – một người đàn ông sống bên lề xã hội, làm nghề hề và khao khát trở thành diễn viên hài. Sống trong một thành phố Gotham u ám, đầy rẫy bất công và bạo lực, Arthur bị xã hội chối bỏ, đánh đập và xem thường.\r\n\r\nDần dần, sự cô lập, đau khổ và tâm lý bất ổn đã đẩy anh đến bờ vực của sự điên loạn. Khi những tầng lớp xã hội giàu có và quyền lực ngày càng lấn át người dân thường, Arthur – trong hình dạng Joker – trỗi dậy như một biểu tượng của hỗn loạn và phản kháng.\r\n\r\nKhông đơn thuần là một bộ phim về ác nhân, “Joker” là bức tranh phản ánh sự mục ruỗng của xã hội hiện đại, đặt ra những câu hỏi sâu sắc về lòng trắc ẩn, sự phân hóa giàu nghèo và sức khỏe tinh thần.',1,'https://m.media-amazon.com/images/M/MV5BNzY3OWQ5NDktNWQ2OC00ZjdlLThkMmItMDhhNDk3NTFiZGU4XkEyXkFqcGc@._V1_.jpg',55000,'https://w0.peakpx.com/wallpaper/700/371/HD-wallpaper-joker-movie-8k-banner.jpg'),(20,'Doraemon và Cuộc phiêu lưu vào thế giới trong tranh','Yukiyo Teramoto  Xem thêm tại: https://www.galaxycine.vn/dao-dien/yukiyo-teramoto/','Mizuta Wasabi','Hoạt hình','Nhật Bản','8.0','2025-05-23','https://youtu.be/w6ytXVyupwU','Cùng nhóm bạn Doraemon trở về châu Âu thế kỉ 13, vào thế giới trong tranh ở phim mới Doraemon The Movie: Nobita\'s Art World Tales.','Chuyến phiêu lưu mạo hiểm vượt thời không tới công quốc Artoria sẽ mang đến bất ngờ gì? Phim Điện Ảnh Doraemon: Nobita Và Cuộc Phiêu Lưu Vào Thế Giới Trong Tranh dự kiến khởi chiếu tại các rạp chiếu phim từ 23.05.2025.',0,'https://cdn.galaxycine.vn/media/2025/3/11/doraemon-the-movie-nobitas-art-world-tales-2_1741663608345.jpg',40000,'https://image.tmdb.org/t/p/original/vncMpsAUDnL1JOb73e5q48gX32S.jpg'),(21,'Bí Kíp Luyện Rồng','Dean DeBlois  Xem thêm tại: https://www.galaxycine.vn/dao-dien/dean-deblois/','Mason Thames, Nico Parker','Phiêu lưu - Hành động','USA','9.2','2025-06-13','https://youtu.be/6lnYqNYj0o8','Câu chuyện về một chàng trai trẻ với ước mơ trở thành thợ săn rồng, nhưng định mệnh lại đưa đẩy anh đến tình bạn bất ngờ với một chú rồng.','Phim mới How to Train Your Dragon / Bí Kíp Luyện Rồng khởi chiếu chính thức 13.06.2025 tại các rạp chiếu phim toàn quốc.',0,'https://cdn.galaxycine.vn/media/2025/2/17/bi-kip-luyen-rong-500_1739776695143.jpg',90000,'https://cdn.galaxycine.vn/media/2025/2/17/bi-kip-luyen-rong-750_1739776701532.jpg'),(22,'Tội Đồ','Ryan Coogler  Xem thêm tại: https://www.galaxycine.vn/dao-dien/ryan-coogler/','Michael B. Jordan, Hailee Steinfeld','Kinh dị - Giật gân','USA','8.3','2025-05-09','https://youtu.be/LxbcPHt_uNM','Sinners / Tội Đồ kể về 2 anh em sinh đôi mắc kẹt trong cuộc sống thực tại rối ren, cả hai quay trở lại quê nhà để có một khởi đầu mới, để rồi phát hiện một thế lực ác quỷ đang nhăm nhe chờ đợi họ.','Sinners / Tội Đồ khởi chiếu chính thức 28.03.2025 tại các rạp chiếu phim toàn quốc.',0,'https://cdn.galaxycine.vn/media/2025/3/18/toi-do-500_1742267857122.jpg',65000,'https://example.com/no_banner.jpg'),(23,'Avengers: Endgame','Anthony Russo, Joe Russo','Robert Downey Jr., Chris Evans, Scarlett Johansson','Hành động, Siêu anh hùng','USA','8.4','2025-04-01','https://www.youtube.com/watch?v=TcMBFSGVi1c','Trận chiến cuối cùng chống lại Thanos của các siêu anh hùng Marvel','Sau khi một nửa sự sống trong vũ trụ biến mất, Avengers lên kế hoạch nghịch đảo thời gian để đảo ngược hậu quả của Thanos',1,'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SL1183_.jpg',80000,'https://i.pinimg.com/736x/29/7d/e0/297de0761b0c756266d74ca50d03cc1d.jpg');
/*!40000 ALTER TABLE `cinema_phim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_phong`
--

DROP TABLE IF EXISTS `cinema_phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_phong` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `suc_chua` int NOT NULL,
  `tong_dien_tich` double NOT NULL,
  `duong_dan_anh` varchar(1000) DEFAULT NULL,
  `chi_nhanh_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_phong_chi_nhanh_id_5799e398_fk_cinema_chi_nhanh_id` (`chi_nhanh_id`),
  CONSTRAINT `cinema_phong_chi_nhanh_id_5799e398_fk_cinema_chi_nhanh_id` FOREIGN KEY (`chi_nhanh_id`) REFERENCES `cinema_chi_nhanh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_phong`
--

LOCK TABLES `cinema_phong` WRITE;
/*!40000 ALTER TABLE `cinema_phong` DISABLE KEYS */;
INSERT INTO `cinema_phong` VALUES (1,'C15',50,100,'https://led.vn/wp-content/uploads/2021/06/man-hinh-led-rap-chieu-phim-3.jpg',1),(2,'C16',50,100,'https://cdn.pixabay.com/photo/2024/02/12/17/49/theater-8569119_1280.jpg',3),(9,'C14',50,200,NULL,3),(10,'C13',50,200,NULL,3),(11,'C12',50,200,NULL,3),(12,'C11',60,100,NULL,3),(13,'C10',50,100,NULL,3),(14,'C9',50,120,NULL,3),(15,'C8',50,130,NULL,3),(16,'RAP1',50,200,NULL,1),(17,'RAP2',50,100,NULL,1),(18,'RAP3',50,200,NULL,1),(19,'RAP4',60,200,NULL,1),(20,'RAP5',60,100,NULL,1),(21,'RAP6',100,1000,NULL,1),(22,'RAP7',50,100,'https://www.galaxycine.vn/media/2023/12/25/galaxy-sala---tam-diem-mang-xa-hoi--dan-sao-dinh-dam-check-in--6_1703500496534.jpg',1);
/*!40000 ALTER TABLE `cinema_phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_thanh_toan`
--

DROP TABLE IF EXISTS `cinema_thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_thanh_toan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phuongthucthanhtoan` varchar(50) NOT NULL,
  `trangthai` int NOT NULL,
  `ngay_tao` datetime(6) NOT NULL,
  `nguoidung_id` bigint NOT NULL,
  `ve` json NOT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `tong_gia_ve` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_thanh_toan_phim_idx` (`tong_gia_ve`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_thanh_toan`
--

LOCK TABLES `cinema_thanh_toan` WRITE;
/*!40000 ALTER TABLE `cinema_thanh_toan` DISABLE KEYS */;
INSERT INTO `cinema_thanh_toan` VALUES (26,'Tiền mặt',0,'2025-04-12 08:35:21.389116',6,'[60, 61]',NULL,100000),(27,'Thẻ tín dụng',0,'2025-04-12 08:46:08.056190',6,'[64]',NULL,50000),(28,'Chuyển khoản',0,'2025-04-12 08:50:28.389368',6,'[65]',NULL,50000),(29,'Chuyển khoản',0,'2025-04-12 08:52:24.939379',6,'[66]',NULL,50000),(30,'Tiền mặt',0,'2025-04-12 09:03:52.185947',6,'[67]',NULL,50000),(31,'Tiền mặt',0,'2025-04-12 09:17:25.433278',6,'[68]',NULL,50000),(32,'Chuyển khoản',0,'2025-04-12 09:22:36.477804',6,'[69]',NULL,50000),(33,'Tiền mặt',0,'2025-04-13 02:46:42.969928',6,'[70]',NULL,50000),(34,'Tiền mặt',0,'2025-04-13 11:14:55.733256',6,'[71]',NULL,120000),(35,'Thẻ tín dụng',0,'2025-04-13 12:14:40.636837',6,'[72]',NULL,85000),(36,'Chuyển khoản',0,'2025-04-13 13:27:20.761203',6,'[73]',NULL,85000),(37,'Chuyển khoản',0,'2025-04-13 13:36:31.214024',6,'[74]',NULL,120000),(38,'Chuyển khoản',0,'2025-04-13 13:54:03.224430',6,'[79]',NULL,85000),(39,'Chuyển khoản',0,'2025-04-13 15:45:56.283746',6,'[80]',NULL,85000),(40,'Thẻ tín dụng',0,'2025-04-16 07:05:00.121249',6,'[81]',NULL,120000);
/*!40000 ALTER TABLE `cinema_thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_vai_tro`
--

DROP TABLE IF EXISTS `cinema_vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_vai_tro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_vai_tro`
--

LOCK TABLES `cinema_vai_tro` WRITE;
/*!40000 ALTER TABLE `cinema_vai_tro` DISABLE KEYS */;
INSERT INTO `cinema_vai_tro` VALUES (1,'KhachHang');
/*!40000 ALTER TABLE `cinema_vai_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_ve`
--

DROP TABLE IF EXISTS `cinema_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_ve` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  `ghe_id` bigint NOT NULL,
  `lich_chieu_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_ve_ghe_id_e0f7d9bb_fk_cinema_ghe_id` (`ghe_id`),
  KEY `cinema_ve_lich_chieu_id_47c3b837_fk_cinema_lich_chieu_id` (`lich_chieu_id`),
  CONSTRAINT `cinema_ve_ghe_id_e0f7d9bb_fk_cinema_ghe_id` FOREIGN KEY (`ghe_id`) REFERENCES `cinema_ghe` (`id`),
  CONSTRAINT `cinema_ve_lich_chieu_id_47c3b837_fk_cinema_lich_chieu_id` FOREIGN KEY (`lich_chieu_id`) REFERENCES `cinema_lich_chieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_ve`
--

LOCK TABLES `cinema_ve` WRITE;
/*!40000 ALTER TABLE `cinema_ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_ve` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-05 16:04:10.464903','2','chi_nhanh object (2)',3,'',10,1),(2,'2025-04-05 16:50:53.951334','2','ghe object (2)',3,'',9,1),(3,'2025-04-05 16:51:12.080365','3','ghe object (3)',3,'',9,1),(4,'2025-04-05 16:54:30.862277','1','ghe object (1)',3,'',9,1),(5,'2025-04-05 16:55:14.611751','4','ghe object (4)',3,'',9,1),(6,'2025-04-05 16:55:17.146173','5','ghe object (5)',3,'',9,1),(7,'2025-04-05 16:55:28.014138','6','ghe object (6)',1,'[{\"added\": {}}]',9,1),(8,'2025-04-06 16:47:39.411191','9','ghe object (9)',3,'',9,1),(9,'2025-04-06 16:58:31.722543','3','chi_nhanh object (3)',2,'[{\"changed\": {\"fields\": [\"Dia chi\"]}}]',10,1),(10,'2025-04-06 17:11:50.364908','2','lich_chieu object (2)',3,'',16,1),(11,'2025-04-06 17:14:28.188902','4','chi_nhanh object (4)',3,'',10,1),(12,'2025-04-07 15:24:56.169148','6','ve object (6)',3,'',17,1),(13,'2025-04-07 15:24:58.867823','5','ve object (5)',3,'',17,1),(14,'2025-04-07 15:25:01.573327','4','ve object (4)',3,'',17,1),(15,'2025-04-07 15:25:16.877616','2','ve object (2)',3,'',17,1),(16,'2025-04-07 15:25:19.560755','3','ve object (3)',3,'',17,1),(17,'2025-04-07 15:36:44.789223','1','ve object (1)',3,'',17,1),(18,'2025-04-07 15:48:48.577586','9','ve object (9)',3,'',17,1),(19,'2025-04-07 15:48:50.694144','8','ve object (8)',3,'',17,1),(20,'2025-04-07 16:16:53.013064','12','ghe object (12)',3,'',9,1),(21,'2025-04-07 16:16:55.272475','11','ghe object (11)',3,'',9,1),(22,'2025-04-07 16:16:57.618254','10','ghe object (10)',3,'',9,1),(23,'2025-04-07 16:17:00.089487','3','ghe object (3)',3,'',9,1),(24,'2025-04-07 16:17:02.281519','2','ghe object (2)',3,'',9,1),(25,'2025-04-07 16:17:05.142452','1','ghe object (1)',3,'',9,1),(26,'2025-04-07 16:55:34.628261','14','ve object (14)',3,'',17,1),(27,'2025-04-07 17:08:30.810784','15','ve object (15)',3,'',17,1),(28,'2025-04-07 17:11:21.137242','16','ve object (16)',3,'',17,1),(29,'2025-04-08 01:23:01.279299','1','nguoi_dung object (1)',3,'',12,1),(30,'2025-04-08 02:39:08.650504','3','nguoi_dung object (3)',3,'',12,1),(31,'2025-04-08 02:39:12.895392','2','nguoi_dung object (2)',3,'',12,1),(32,'2025-04-08 03:18:25.035172','5','nguoi_dung object (5)',3,'',12,1),(33,'2025-04-08 03:18:27.305065','4','nguoi_dung object (4)',3,'',12,1),(34,'2025-04-08 03:40:23.858528','1','ghe object (1)',3,'',9,1),(35,'2025-04-08 03:40:26.908389','2','ghe object (2)',3,'',9,1),(36,'2025-04-08 03:40:31.191911','3','ghe object (3)',3,'',9,1),(37,'2025-04-08 03:40:33.513660','16','ghe object (16)',3,'',9,1),(38,'2025-04-08 03:40:35.831391','17','ghe object (17)',3,'',9,1),(39,'2025-04-08 03:40:39.891715','18','ghe object (18)',3,'',9,1),(40,'2025-04-08 03:40:42.975333','19','ghe object (19)',3,'',9,1),(41,'2025-04-08 03:40:45.714656','20','ghe object (20)',3,'',9,1),(42,'2025-04-08 03:40:48.008926','21','ghe object (21)',3,'',9,1),(43,'2025-04-08 03:40:50.026857','22','ghe object (22)',3,'',9,1),(44,'2025-04-08 03:40:52.518547','23','ghe object (23)',3,'',9,1),(45,'2025-04-08 03:40:54.649448','24','ghe object (24)',3,'',9,1),(46,'2025-04-08 03:40:57.400612','25','ghe object (25)',3,'',9,1),(47,'2025-04-10 12:16:55.437156','8','phong object (8)',3,'',8,1),(48,'2025-04-10 12:16:58.500528','7','phong object (7)',3,'',8,1),(49,'2025-04-10 12:17:02.032800','6','phong object (6)',3,'',8,1),(50,'2025-04-10 12:17:04.823911','5','phong object (5)',3,'',8,1),(51,'2025-04-10 12:17:10.074876','4','phong object (4)',3,'',8,1),(52,'2025-04-10 12:18:31.838630','38','ghe object (38)',3,'',9,1),(53,'2025-04-10 12:18:34.106823','37','ghe object (37)',3,'',9,1),(54,'2025-04-10 12:18:36.194896','36','ghe object (36)',3,'',9,1),(55,'2025-04-10 12:18:38.310370','35','ghe object (35)',3,'',9,1),(56,'2025-04-10 12:18:40.754136','34','ghe object (34)',3,'',9,1),(57,'2025-04-10 12:18:43.352304','33','ghe object (33)',3,'',9,1),(58,'2025-04-10 12:18:45.515759','32','ghe object (32)',3,'',9,1),(59,'2025-04-10 12:18:47.962590','31','ghe object (31)',3,'',9,1),(60,'2025-04-10 12:18:50.722600','30','ghe object (30)',3,'',9,1),(61,'2025-04-10 12:18:53.172882','29','ghe object (29)',3,'',9,1),(62,'2025-04-10 12:21:12.649336','1','ve object (1)',3,'',17,1),(63,'2025-04-10 12:21:15.982598','2','ve object (2)',3,'',17,1),(64,'2025-04-10 12:21:24.863433','3','ve object (3)',3,'',17,1),(65,'2025-04-12 07:56:43.809836','22','thanh_toan object (22)',3,'',18,1),(66,'2025-04-12 07:56:48.542820','23','thanh_toan object (23)',3,'',18,1),(67,'2025-04-12 07:56:52.665128','25','thanh_toan object (25)',3,'',18,1),(68,'2025-04-12 07:56:56.493472','24','thanh_toan object (24)',3,'',18,1),(69,'2025-04-12 07:57:33.189340','59','ve object (59)',3,'',17,1),(70,'2025-04-12 07:57:36.567845','58','ve object (58)',3,'',17,1),(71,'2025-04-12 07:57:45.824487','57','ve object (57)',3,'',17,1),(72,'2025-04-12 07:59:06.052834','59','ghe object (59)',3,'',9,1),(73,'2025-04-12 07:59:09.619971','58','ghe object (58)',3,'',9,1),(74,'2025-04-12 07:59:12.694872','57','ghe object (57)',3,'',9,1),(75,'2025-04-12 08:00:18.040030','3','phong object (3)',3,'',8,1),(76,'2025-04-13 02:45:32.145587','6','phim object (6)',3,'',7,1),(77,'2025-04-13 02:48:38.109879','70','ve object (70)',3,'',17,1),(78,'2025-04-13 02:48:40.466022','69','ve object (69)',3,'',17,1),(79,'2025-04-13 02:48:42.838453','68','ve object (68)',3,'',17,1),(80,'2025-04-13 02:48:45.433854','67','ve object (67)',3,'',17,1),(81,'2025-04-13 02:48:47.667401','66','ve object (66)',3,'',17,1),(82,'2025-04-13 02:48:50.282663','65','ve object (65)',3,'',17,1),(83,'2025-04-13 02:48:53.265530','64','ve object (64)',3,'',17,1),(84,'2025-04-13 02:48:55.447557','63','ve object (63)',3,'',17,1),(85,'2025-04-13 02:48:57.485181','62','ve object (62)',3,'',17,1),(86,'2025-04-13 02:48:59.632979','61','ve object (61)',3,'',17,1),(87,'2025-04-13 02:49:01.489370','60','ve object (60)',3,'',17,1),(88,'2025-04-13 02:49:03.613344','56','ve object (56)',3,'',17,1),(89,'2025-04-13 02:49:07.565176','55','ve object (55)',3,'',17,1),(90,'2025-04-13 02:49:09.561711','54','ve object (54)',3,'',17,1),(91,'2025-04-13 02:49:11.664685','53','ve object (53)',3,'',17,1),(92,'2025-04-13 02:49:14.487314','52','ve object (52)',3,'',17,1),(93,'2025-04-13 02:49:16.814905','51','ve object (51)',3,'',17,1),(94,'2025-04-13 02:49:18.922770','50','ve object (50)',3,'',17,1),(95,'2025-04-13 02:49:20.996081','49','ve object (49)',3,'',17,1),(96,'2025-04-13 02:49:23.634633','48','ve object (48)',3,'',17,1),(97,'2025-04-13 02:49:26.020052','47','ve object (47)',3,'',17,1),(98,'2025-04-13 02:49:28.039005','46','ve object (46)',3,'',17,1),(99,'2025-04-13 02:49:32.845100','45','ve object (45)',3,'',17,1),(100,'2025-04-13 02:49:35.383467','44','ve object (44)',3,'',17,1),(101,'2025-04-13 02:53:21.176917','3','phim object (3)',3,'',7,1),(102,'2025-04-13 02:53:25.861385','2','phim object (2)',3,'',7,1),(103,'2025-04-13 02:53:29.894942','1','phim object (1)',3,'',7,1),(104,'2025-04-13 02:54:41.954915','9','lich_chieu object (9)',1,'[{\"added\": {}}]',16,1),(105,'2025-04-13 02:56:26.566777','10','lich_chieu object (10)',1,'[{\"added\": {}}]',16,1),(106,'2025-04-13 03:01:35.017027','9','phong object (9)',1,'[{\"added\": {}}]',8,1),(107,'2025-04-13 03:02:01.974855','10','phong object (10)',1,'[{\"added\": {}}]',8,1),(108,'2025-04-13 03:02:16.481523','11','phong object (11)',1,'[{\"added\": {}}]',8,1),(109,'2025-04-13 03:02:31.583999','12','phong object (12)',1,'[{\"added\": {}}]',8,1),(110,'2025-04-13 03:02:47.938491','13','phong object (13)',1,'[{\"added\": {}}]',8,1),(111,'2025-04-13 03:03:01.006734','14','phong object (14)',1,'[{\"added\": {}}]',8,1),(112,'2025-04-13 03:03:13.779286','15','phong object (15)',1,'[{\"added\": {}}]',8,1),(113,'2025-04-13 03:03:48.121108','16','phong object (16)',1,'[{\"added\": {}}]',8,1),(114,'2025-04-13 03:04:00.047345','17','phong object (17)',1,'[{\"added\": {}}]',8,1),(115,'2025-04-13 03:04:12.690645','18','phong object (18)',1,'[{\"added\": {}}]',8,1),(116,'2025-04-13 03:04:26.050771','19','phong object (19)',1,'[{\"added\": {}}]',8,1),(117,'2025-04-13 03:04:39.695352','20','phong object (20)',1,'[{\"added\": {}}]',8,1),(118,'2025-04-13 03:05:42.085200','11','lich_chieu object (11)',1,'[{\"added\": {}}]',16,1),(119,'2025-04-13 03:08:09.849300','8','phim object (8)',2,'[{\"changed\": {\"fields\": [\"Ngay phat hanh\"]}}]',7,1),(120,'2025-04-13 03:08:38.694923','9','phim object (9)',2,'[{\"changed\": {\"fields\": [\"Ngay phat hanh\", \"Gia ve\"]}}]',7,1),(121,'2025-04-13 03:09:16.321097','7','phim object (7)',3,'',7,1),(122,'2025-04-13 03:11:40.405089','8','phim object (8)',2,'[{\"changed\": {\"fields\": [\"Ngay phat hanh\"]}}]',7,1),(123,'2025-04-13 04:00:15.631412','8','phim object (8)',3,'',7,1),(124,'2025-04-13 10:55:22.198846','12','lich_chieu object (12)',1,'[{\"added\": {}}]',16,1),(125,'2025-04-13 11:28:24.059902','11','phim object (11)',3,'',7,1),(126,'2025-04-13 11:32:33.965187','15','phim object (15)',2,'[{\"changed\": {\"fields\": [\"Dao dien\", \"Dien vien\", \"The loai\", \"Danh gia\", \"Trailer\", \"Gia ve\", \"Banner\"]}}]',7,1),(127,'2025-04-13 11:33:13.622682','15','phim object (15)',2,'[{\"changed\": {\"fields\": [\"Duong dan anh\"]}}]',7,1),(128,'2025-04-13 11:33:59.804105','9','phim object (9)',3,'',7,1),(129,'2025-04-13 11:39:42.784234','16','phim object (16)',1,'[{\"added\": {}}]',7,1),(130,'2025-04-13 11:40:18.308823','16','phim object (16)',2,'[{\"changed\": {\"fields\": [\"Ngay phat hanh\", \"Dang chieu\"]}}]',7,1),(131,'2025-04-13 11:41:34.772707','16','phim object (16)',2,'[{\"changed\": {\"fields\": [\"Dang chieu\"]}}]',7,1),(132,'2025-04-13 11:42:54.407973','13','lich_chieu object (13)',1,'[{\"added\": {}}]',16,1),(133,'2025-04-13 11:43:20.420326','14','lich_chieu object (14)',1,'[{\"added\": {}}]',16,1),(134,'2025-04-13 11:48:16.836572','15','lich_chieu object (15)',1,'[{\"added\": {}}]',16,1),(135,'2025-04-13 12:07:44.922098','16','lich_chieu object (16)',1,'[{\"added\": {}}]',16,1),(136,'2025-04-16 04:35:44.376683','17','phim object (17)',1,'[{\"added\": {}}]',7,1),(137,'2025-04-16 04:39:49.283227','21','phong object (21)',1,'[{\"added\": {}}]',8,1),(138,'2025-04-16 04:47:07.054381','22','phong object (22)',2,'[{\"changed\": {\"fields\": [\"Duong dan anh\"]}}]',8,1),(139,'2025-04-16 04:47:34.580452','17','lich_chieu object (17)',1,'[{\"added\": {}}]',16,1),(140,'2025-04-16 04:51:22.109136','10','phim object (10)',3,'',7,1),(141,'2025-04-16 05:05:28.237421','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(142,'2025-04-16 05:06:02.220297','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(143,'2025-04-16 05:07:10.402254','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(144,'2025-04-16 05:07:50.145574','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(145,'2025-04-16 05:08:25.722022','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(146,'2025-04-16 05:09:04.462345','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(147,'2025-04-16 05:10:45.404912','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(148,'2025-04-16 05:12:22.053260','17','phim object (17)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(149,'2025-04-16 05:19:11.097943','18','phim object (18)',1,'[{\"added\": {}}]',7,1),(150,'2025-04-16 05:27:22.456627','19','phim object (19)',1,'[{\"added\": {}}]',7,1),(151,'2025-04-16 05:27:58.908321','19','phim object (19)',2,'[{\"changed\": {\"fields\": [\"Dang chieu\"]}}]',7,1),(152,'2025-04-16 05:32:10.366308','20','phim object (20)',1,'[{\"added\": {}}]',7,1),(153,'2025-04-16 05:37:22.256548','21','phim object (21)',1,'[{\"added\": {}}]',7,1),(154,'2025-04-16 05:43:22.139031','22','phim object (22)',1,'[{\"added\": {}}]',7,1),(155,'2025-04-16 05:45:16.935303','3','bai_viet object (3)',3,'',11,1),(156,'2025-04-16 05:48:37.132374','4','bai_viet object (4)',1,'[{\"added\": {}}]',11,1),(157,'2025-04-16 05:57:19.164114','4','bai_viet object (4)',2,'[{\"changed\": {\"fields\": [\"Tieu de\"]}}]',11,1),(158,'2025-04-16 06:07:54.427855','23','phim object (23)',1,'[{\"added\": {}}]',7,1),(159,'2025-04-16 06:22:41.208429','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Ten\", \"Trailer\", \"Duong dan anh\", \"Banner\"]}}]',7,1),(160,'2025-04-16 06:23:20.472337','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(161,'2025-04-16 06:24:50.402063','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Duong dan anh\"]}}]',7,1),(162,'2025-04-16 06:29:49.418164','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Ten\", \"Dang chieu\", \"Banner\"]}}]',7,1),(163,'2025-04-16 06:30:18.561873','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Duong dan anh\"]}}]',7,1),(164,'2025-04-16 06:34:06.226443','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(165,'2025-04-16 06:38:50.602609','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Banner\"]}}]',7,1),(166,'2025-04-16 06:42:35.753248','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"The loai\", \"Ngon ngu\", \"Danh gia\", \"Ngay phat hanh\", \"Mo ta ngan\", \"Mo ta dai\", \"Duong dan anh\"]}}]',7,1),(167,'2025-04-16 06:43:48.075526','13','phim object (13)',2,'[{\"changed\": {\"fields\": [\"Dao dien\", \"Dien vien\", \"The loai\"]}}]',7,1),(168,'2025-04-16 07:09:15.246757','13','lich_chieu object (13)',2,'[]',16,1),(169,'2025-04-16 07:20:41.011981','17','phong object (17)',2,'[]',8,1),(170,'2025-04-16 07:21:26.273316','13','lich_chieu object (13)',2,'[]',16,1),(171,'2025-04-16 07:33:59.328383','18','lich_chieu object (18)',1,'[{\"added\": {}}]',16,1),(172,'2025-04-16 07:38:31.719811','19','lich_chieu object (19)',1,'[{\"added\": {}}]',16,1),(173,'2025-04-16 07:39:11.768886','20','lich_chieu object (20)',1,'[{\"added\": {}}]',16,1),(174,'2025-04-16 07:39:33.842850','21','lich_chieu object (21)',1,'[{\"added\": {}}]',16,1),(175,'2025-04-16 07:40:59.401465','71','ve object (71)',3,'',17,1),(176,'2025-04-16 07:41:03.795392','72','ve object (72)',3,'',17,1),(177,'2025-04-16 07:41:06.986064','73','ve object (73)',3,'',17,1),(178,'2025-04-16 07:41:09.621837','74','ve object (74)',3,'',17,1),(179,'2025-04-16 07:41:52.893631','75','ve object (75)',3,'',17,1),(180,'2025-04-16 07:41:55.479386','76','ve object (76)',3,'',17,1),(181,'2025-04-16 07:41:57.816233','77','ve object (77)',3,'',17,1),(182,'2025-04-16 07:42:00.253244','78','ve object (78)',3,'',17,1),(183,'2025-04-16 07:42:02.638866','79','ve object (79)',3,'',17,1),(184,'2025-04-16 07:42:05.034374','80','ve object (80)',3,'',17,1),(185,'2025-04-16 07:42:07.295936','81','ve object (81)',3,'',17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'cinema','bai_viet'),(10,'cinema','chi_nhanh'),(9,'cinema','ghe'),(13,'cinema','hoa_don'),(16,'cinema','lich_chieu'),(12,'cinema','nguoi_dung'),(15,'cinema','nguoi_dung_vai_tro'),(19,'cinema','passwordresetcode'),(7,'cinema','phim'),(8,'cinema','phong'),(18,'cinema','thanh_toan'),(14,'cinema','vai_tro'),(17,'cinema','ve'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-01 02:49:13.109145'),(2,'auth','0001_initial','2025-04-01 02:49:13.813582'),(3,'admin','0001_initial','2025-04-01 02:49:13.961769'),(4,'admin','0002_logentry_remove_auto_add','2025-04-01 02:49:13.969757'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-01 02:49:13.976998'),(6,'contenttypes','0002_remove_content_type_name','2025-04-01 02:49:14.062582'),(7,'auth','0002_alter_permission_name_max_length','2025-04-01 02:49:14.133892'),(8,'auth','0003_alter_user_email_max_length','2025-04-01 02:49:14.158708'),(9,'auth','0004_alter_user_username_opts','2025-04-01 02:49:14.169795'),(10,'auth','0005_alter_user_last_login_null','2025-04-01 02:49:14.252435'),(11,'auth','0006_require_contenttypes_0002','2025-04-01 02:49:14.257057'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-01 02:49:14.265853'),(13,'auth','0008_alter_user_username_max_length','2025-04-01 02:49:14.361511'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-01 02:49:14.430037'),(15,'auth','0010_alter_group_name_max_length','2025-04-01 02:49:14.448196'),(16,'auth','0011_update_proxy_permissions','2025-04-01 02:49:14.458431'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-01 02:49:14.526794'),(18,'sessions','0001_initial','2025-04-01 02:49:14.566560'),(19,'cinema','0001_initial','2025-04-01 03:03:10.306422'),(20,'cinema','0002_bai_viet_nguoi_dung_vai_tro_lich_chieu_hoa_don_and_more','2025-04-01 03:30:09.618782'),(21,'cinema','0003_thanh_toan','2025-04-04 15:39:45.748350'),(22,'cinema','0004_remove_thanh_toan_ngay_cap_nhat_and_more','2025-04-08 00:03:49.373113'),(23,'cinema','0005_thanh_toan_ngay_cap_nhat_alter_thanh_toan_trangthai','2025-04-08 01:44:53.909086'),(24,'cinema','0006_alter_thanh_toan_ve','2025-04-08 13:26:46.337886'),(25,'cinema','0007_remove_lich_chieu_gia','2025-04-08 15:12:02.196123'),(26,'cinema','0008_thanh_toan_tong_gia_ve','2025-04-09 17:35:35.543481'),(27,'cinema','0009_passwordresetcode','2025-04-09 17:45:57.730736'),(28,'cinema','0010_remove_thanh_toan_soluong_and_more','2025-04-11 16:56:35.202717'),(29,'cinema','0011_phim_gia_ve','2025-04-12 05:25:27.756055'),(30,'cinema','0012_ve_trang_thai_alter_ve_unique_together','2025-04-12 07:09:20.269639'),(31,'cinema','0013_alter_ve_unique_together_remove_ve_trang_thai','2025-04-12 07:20:49.073126'),(32,'cinema','0014_phim_banner','2025-04-13 03:54:06.582706');
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
INSERT INTO `django_session` VALUES ('eovg0a9og5hwus25ge3c2eclcgr19xj1','.eJxVjDsOwjAQBe_iGlnG3qy9lPQ5g7XrDwmgRIqTCnF3iJQC2jcz76Uib-sQt1aWOGZ1UWd1-t2E06NMO8h3nm6zTvO0LqPoXdEHbbqfc3leD_fvYOA2fGtyTEawEjsDLGBBCC2hdIQl2K5jBAzgxFeDPpcQyFcvziWpYE1V7w_DWjcx:1u3Vj5:uXsaSLHQYVkh-r7OiiW8ebE3f-sopVaQgcoDQ9Y_8aY','2025-04-26 07:56:31.255292'),('ihud6yuahss6kxnfrc7jholxtdnr5od3','.eJxVjDsOwjAQBe_iGlnG3qy9lPQ5g7XrDwmgRIqTCnF3iJQC2jcz76Uib-sQt1aWOGZ1UWd1-t2E06NMO8h3nm6zTvO0LqPoXdEHbbqfc3leD_fvYOA2fGtyTEawEjsDLGBBCC2hdIQl2K5jBAzgxFeDPpcQyFcvziWpYE1V7w_DWjcx:1tzSNW:rkUQqYVxv8fENwMQ_xWs2rmqGlUWnGYJFvN9ApDYqkg','2025-04-15 03:33:30.272913'),('nflq24z4sigukrqeunhri6ma848sqikv','.eJxVjDsOwjAQBe_iGlnG3qy9lPQ5g7XrDwmgRIqTCnF3iJQC2jcz76Uib-sQt1aWOGZ1UWd1-t2E06NMO8h3nm6zTvO0LqPoXdEHbbqfc3leD_fvYOA2fGtyTEawEjsDLGBBCC2hdIQl2K5jBAzgxFeDPpcQyFcvziWpYE1V7w_DWjcx:1u3nLS:5o3uSH9n6iXjtIQh2Z1QJqT8A2nnUWb4uHPIMyK1VSc','2025-04-27 02:45:18.376344'),('ukjoyp9gx0kyhbbbev8ph6iojwq203rl','.eJxVjDsOwjAQBe_iGlnG3qy9lPQ5g7XrDwmgRIqTCnF3iJQC2jcz76Uib-sQt1aWOGZ1UWd1-t2E06NMO8h3nm6zTvO0LqPoXdEHbbqfc3leD_fvYOA2fGtyTEawEjsDLGBBCC2hdIQl2K5jBAzgxFeDPpcQyFcvziWpYE1V7w_DWjcx:1u1T9U:TgD0oX4OcBszgyskF6TavnEbta12oVj8I8vU7A2IoXQ','2025-04-20 16:47:20.649412');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe`
--

DROP TABLE IF EXISTS `ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `loai_ghe` int DEFAULT NULL,
  `phong_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phong_id` (`phong_id`),
  CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`phong_id`) REFERENCES `phong` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `nguoi_dung_id` bigint DEFAULT NULL,
  `id_thanhtoan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `fk_hoadon_thanhtoan_idx` (`id_thanhtoan`),
  CONSTRAINT `fk_hoadon_thanhtoan` FOREIGN KEY (`id_thanhtoan`) REFERENCES `thanh_toan` (`id`),
  CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_chieu`
--

DROP TABLE IF EXISTS `lich_chieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_chieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_tao` varchar(255) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `ngay_bat_dau` date DEFAULT NULL,
  `gio_bat_dau` time DEFAULT NULL,
  `chi_nhanh_id` int DEFAULT NULL,
  `phim_id` int DEFAULT NULL,
  `phong_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_nhanh_id` (`chi_nhanh_id`),
  KEY `phim_id` (`phim_id`),
  KEY `phong_id` (`phong_id`),
  CONSTRAINT `lich_chieu_ibfk_1` FOREIGN KEY (`chi_nhanh_id`) REFERENCES `chi_nhanh` (`id`),
  CONSTRAINT `lich_chieu_ibfk_2` FOREIGN KEY (`phim_id`) REFERENCES `phim` (`id`),
  CONSTRAINT `lich_chieu_ibfk_3` FOREIGN KEY (`phong_id`) REFERENCES `phong` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_chieu`
--

LOCK TABLES `lich_chieu` WRITE;
/*!40000 ALTER TABLE `lich_chieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_chieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_tao` varchar(255) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `duong_dan_anh` varchar(100) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(100) DEFAULT NULL,
  `ten_dang_nhap` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung_vai_tro`
--

DROP TABLE IF EXISTS `nguoi_dung_vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung_vai_tro` (
  `nguoi_dung_id` bigint NOT NULL,
  `vai_tro_id` bigint NOT NULL,
  PRIMARY KEY (`nguoi_dung_id`,`vai_tro_id`),
  KEY `vai_tro_id` (`vai_tro_id`),
  CONSTRAINT `nguoi_dung_vai_tro_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`),
  CONSTRAINT `nguoi_dung_vai_tro_ibfk_2` FOREIGN KEY (`vai_tro_id`) REFERENCES `vai_tro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung_vai_tro`
--

LOCK TABLES `nguoi_dung_vai_tro` WRITE;
/*!40000 ALTER TABLE `nguoi_dung_vai_tro` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoi_dung_vai_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phim`
--

DROP TABLE IF EXISTS `phim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_tao` varchar(255) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `dien_vien` varchar(255) DEFAULT NULL,
  `the_loai` varchar(255) DEFAULT NULL,
  `dao_dien` varchar(255) DEFAULT NULL,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `dang_chieu` int DEFAULT NULL,
  `ngon_ngu` varchar(100) DEFAULT NULL,
  `mo_ta_dai` varchar(1000) DEFAULT NULL,
  `danh_gia` varchar(255) DEFAULT NULL,
  `ngay_phat_hanh` date DEFAULT NULL,
  `mo_ta_ngan` varchar(500) DEFAULT NULL,
  `duong_dan_anh_nho` varchar(1000) DEFAULT NULL,
  `trailer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phim`
--

LOCK TABLES `phim` WRITE;
/*!40000 ALTER TABLE `phim` DISABLE KEYS */;
/*!40000 ALTER TABLE `phim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suc_chua` int DEFAULT NULL,
  `duong_dan_anh` varchar(1000) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `tong_dien_tich` double DEFAULT NULL,
  `chi_nhanh_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_nhanh_id` (`chi_nhanh_id`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`chi_nhanh_id`) REFERENCES `chi_nhanh` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanh_toan`
--

DROP TABLE IF EXISTS `thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanh_toan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nguoidung_id` bigint DEFAULT NULL,
  `ve_id` int DEFAULT NULL,
  `soluong` decimal(10,2) NOT NULL,
  `phuongthucthanhtoan` varchar(50) NOT NULL,
  `trangthai` varchar(20) DEFAULT 'chua thanh toan',
  `ngay_tao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanh_toan`
--

LOCK TABLES `thanh_toan` WRITE;
/*!40000 ALTER TABLE `thanh_toan` DISABLE KEYS */;
/*!40000 ALTER TABLE `thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vai_tro`
--

DROP TABLE IF EXISTS `vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vai_tro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vai_tro`
--

LOCK TABLES `vai_tro` WRITE;
/*!40000 ALTER TABLE `vai_tro` DISABLE KEYS */;
/*!40000 ALTER TABLE `vai_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `nguoi_tao` varchar(255) DEFAULT NULL,
  `nguoi_cap_nhat` varchar(255) DEFAULT NULL,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `lich_chieu_id` int DEFAULT NULL,
  `ghe_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_chieu_id` (`lich_chieu_id`),
  KEY `ghe_id` (`ghe_id`),
  CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`lich_chieu_id`) REFERENCES `lich_chieu` (`id`),
  CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`ghe_id`) REFERENCES `ghe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-16 16:03:22
