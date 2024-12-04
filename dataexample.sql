-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `tbl_count`
--

DROP TABLE IF EXISTS `tbl_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_count` (
  `scholar_id` int DEFAULT NULL,
  `paper_amt` int DEFAULT NULL,
  `DID` int DEFAULT NULL,
  KEY `scholar_id` (`scholar_id`),
  CONSTRAINT `tbl_count_ibfk_1` FOREIGN KEY (`scholar_id`) REFERENCES `tbl_scholar` (`scholar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_count`
--

LOCK TABLES `tbl_count` WRITE;
/*!40000 ALTER TABLE `tbl_count` DISABLE KEYS */;
INSERT INTO `tbl_count` VALUES (1,18,10),(2,15,10);
/*!40000 ALTER TABLE `tbl_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dep_count`
--

DROP TABLE IF EXISTS `tbl_dep_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_dep_count` (
  `DID` int DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `paper_amt` int DEFAULT NULL,
  `hindex` int DEFAULT NULL,
  KEY `DID` (`DID`),
  CONSTRAINT `tbl_dep_count_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `tbl_department` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dep_count`
--

LOCK TABLES `tbl_dep_count` WRITE;
/*!40000 ALTER TABLE `tbl_dep_count` DISABLE KEYS */;
INSERT INTO `tbl_dep_count` VALUES (10,'Department of Computer Science and Engineering',33,NULL);
/*!40000 ALTER TABLE `tbl_dep_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_department` (
  `DID` int NOT NULL AUTO_INCREMENT,
  `Dept` varchar(255) DEFAULT NULL,
  `SID` int DEFAULT NULL,
  PRIMARY KEY (`DID`),
  KEY `SID` (`SID`),
  CONSTRAINT `tbl_department_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `tbl_school` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'Department of Biotechnology',1),(2,'Department of Environmental Science and Engineering',1),(3,'Department of Life Sciences',1),(4,'Department of Mathematics',1),(5,'Department of Pharmacy',1),(6,'Department of Physics',1),(7,'Department of Architecture',2),(8,'Department of Chemical Science and Engineering',2),(9,'Department of Civil Engineering',2),(10,'Department of Computer Science and Engineering',2),(11,'Department of Electrical and Electronics Engineering',2),(12,'Department of Geomatics Engineering',2),(13,'Department of Mechanical Engineering',2);
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paper`
--

DROP TABLE IF EXISTS `tbl_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_paper` (
  `paper_id` int NOT NULL AUTO_INCREMENT,
  `paper_title` varchar(255) DEFAULT NULL,
  `citation` int DEFAULT NULL,
  `p_year` int DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `p_type` varchar(255) DEFAULT NULL,
  `URl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paper`
--

LOCK TABLES `tbl_paper` WRITE;
/*!40000 ALTER TABLE `tbl_paper` DISABLE KEYS */;
INSERT INTO `tbl_paper` VALUES (1,'An optimized feature selection method using ensemble classifiers in software defect prediction for healthcare systems',15,2022,'0','Wireless Communications and Mobile Computing 2022 (1), 1028175, 2022','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:WF5omc3nYNoC'),(2,'Awareness of MOOC among college students: A study of far western region of Nepal',14,2016,'0','International Conference on IT4D, 2016','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:d1gkVwhDpl0C'),(3,'Euclidean distance based loss function for eye-gaze estimation',9,2020,'IEEE','2020 IEEE Sensors Applications Symposium (SAS), 1-5, 2020','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:YsMSGLbcyi4C'),(4,'Reinforcement learning approach for multi-period inventory with stochastic demand',7,2022,'Springer International Publishing','IFIP International Conference on Artificial Intelligence Applications and …, 2022','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:ufrVoPGSRksC'),(5,'A Deep Reinforcement Learning Approach for Inventory Control under Stochastic Lead Time and Demand',6,2022,'IEEE','2022 IEEE Symposium Series on Computational Intelligence (SSCI), 760-766, 2022','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:roLk4NBRz8UC'),(6,'Flipped Class: New e-learning Object in Nepal and Perspective of Teachers.',4,2016,'0','Third International Conference IT4D, 2016','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:zYLM7Y9cAGgC'),(7,'Role of conext clue sentences as dictionary examples',3,2017,'0','Journal of University Grants Commission 6 (1), 132-140, 2017','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:_FxGoFyzp5QC'),(8,'Cloud technology in higher education: A review',2,2015,'0','International Conference on Software, Knowledge, Information Management and …, 2015','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:u-x6o8ySG0sC'),(9,'Impact of Tree Cover Loss on Carbon Emission: A Learning‐Based Analysis',1,2023,'0','Computational Intelligence and Neuroscience 2023 (1), 8585839, 2023','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:Se3iqnhoufwC'),(10,'MOOCs for Higher Education in Nepal',1,2018,'0','Foundation for Information Technology Education and Development, Inc., 2018','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:IjCSPb-OGe4C'),(11,'Reflections on First MOOC of Nepal: From Learner\'s Perspectives',1,2017,'0','International Conference on Open and Innovative Education, 2017','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:2osOgNQ5qMEC'),(12,'Deep reinforcement learning solutions for multi-period inventory replenishment optimization',0,2024,'0','Nanyang Technological University, 2024','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:KlAtU1dfN6UC'),(13,'Learning Computer Programming through Nepal’s First MOOC: Learners\' Experiences',0,2019,'0','eLearning forum Asia 2019, 2019','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:Y0pCki6q_DkC'),(14,'Learning Styles in Educational Technology',0,2018,'0','HUSOC Symposium 1 (1), 2018','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:Zph67rFs4hoC'),(15,'Teacher Perceptions of E-learning for Teaching in Science and Engineering',0,2018,'0','1st HUSOC Symposium, 2018','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:W7OEmFMy1HYC'),(16,'Design and development of flipped classes video lectures for secondary level education of Nepal',0,2017,'0','','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:hqOjcs7Dif8C'),(17,'Blended Learning in DWIT College: From Learners Perspective',0,2017,'0','4th International Conference on Information Technology for Development, 2017','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:Tyk-4Ss8FVUC'),(18,'Load Balancing for High Traffic Web Server in Cloud',0,2015,'0','9th International Conference on Software, Knowledge, Information Management …, 2015','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=CMzC8p4AAAAJ&citation_for_view=CMzC8p4AAAAJ:u5HHmVD_uO8C'),(19,'Educational data mining in moodle data',26,2021,'0','International Journal of Informatics and Communication Technology (IJ-ICT …, 2021','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:jtI9f0ekYq0C'),(20,'Machine Learning algorithm in educational data',26,2019,'0','2019 Artificial Intelligence for Transforming Business and Society (AITB) 1 …, 2019','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:kzcSZmkxUKAC'),(21,'Determining learning style preferences of learners',7,2021,'0','Journal of Computer Science Research 3 (1), 33-43, 2021','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:rbm3iO8VlycC'),(22,'Data mining applications used in education sector',7,2020,'0','Journal of Education and Research 10 (2), 27-51, 2020','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:W2uZP3ddy8sC'),(23,'Comparative analysis between Moodle and self-made Learning Management System',5,2007,'0','','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:wUn16MOA3RoC'),(24,'Role of semantic graph in web page content visualization',2,2012,'0','Athmandu University Journal of Science, Engineering And Technology 8 (1 …, 2012','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:X5YyAB84Iw4C'),(25,'Integration of Gamified Elements and Learning Style Data in Online Learning System',1,2023,'0','Journal of Educational Technology Systems, 2023','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:wBLCggQE-ToC'),(26,'Analysis of Stock Market using Data Mining Techniques',1,0,'0','Journal of Network Security and Data Mining 4 (2), 0','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:SpPTWFSNUtQC'),(27,'Exploring the user’s preference of different adaptation policies in adaptive menu design',0,2023,'0','Trends Comput Sci Inf Technol 8, no. 1 (2023): 005-011, 2023','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:ShjGdcaqzI0C'),(28,'Adaptive menu: A review of adaptive user interface',0,2023,'0','Trends in Computer Science and Information Technology, 2023','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:K4-iKlO5MD4C'),(29,'User Engagement in Gamified Online Learning System',0,2021,'0','World Journal of Educational Research 8 (5), 2021','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:cSdaV2aYdYsC'),(30,'School Leaders’ Views and Challenges Associated with Inclusion in Government Schools in Nepal',0,0,'0','','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:DquSII9TDu4C'),(31,'Analysis of Factors Influencing Airfare of Domestic Airlines: Data from Local Ticket Booking Agency',0,0,'0','Journal of Network Security and Data Mining 4 (2), 0','https://scholar.google.com/citations?view_op=view_citation&hl=en&user=98wuyCUAAAAJ&citation_for_view=98wuyCUAAAAJ:43bX7VzcjpAC');
/*!40000 ALTER TABLE `tbl_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paper_author`
--

DROP TABLE IF EXISTS `tbl_paper_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_paper_author` (
  `author_id` int NOT NULL,
  `paper_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`paper_id`),
  KEY `paper_id` (`paper_id`),
  CONSTRAINT `tbl_paper_author_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `tbl_scholar` (`scholar_id`),
  CONSTRAINT `tbl_paper_author_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `tbl_paper` (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paper_author`
--

LOCK TABLES `tbl_paper_author` WRITE;
/*!40000 ALTER TABLE `tbl_paper_author` DISABLE KEYS */;
INSERT INTO `tbl_paper_author` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,10),(1,11),(2,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31);
/*!40000 ALTER TABLE `tbl_paper_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_scholar`
--

DROP TABLE IF EXISTS `tbl_scholar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_scholar` (
  `level` varchar(30) DEFAULT NULL,
  `scholar_id` int NOT NULL AUTO_INCREMENT,
  `scholar` varchar(255) DEFAULT NULL,
  `h_index` int DEFAULT NULL,
  `DID` int DEFAULT NULL,
  `p_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scholar_id`),
  KEY `DID` (`DID`),
  CONSTRAINT `tbl_scholar_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `tbl_department` (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_scholar`
--

LOCK TABLES `tbl_scholar` WRITE;
/*!40000 ALTER TABLE `tbl_scholar` DISABLE KEYS */;
INSERT INTO `tbl_scholar` VALUES ('Professor',1,'Manoj Shakya',5,10,'https://scholar.google.com/citations?user=CMzC8p4AAAAJ&hl=en&oi=ao'),('Professor',2,'Sushil Shrestha',5,10,'https://scholar.google.com/citations?hl=en&user=98wuyCUAAAAJ');
/*!40000 ALTER TABLE `tbl_scholar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_school`
--

DROP TABLE IF EXISTS `tbl_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_school` (
  `SID` int NOT NULL AUTO_INCREMENT,
  `School` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_school`
--

LOCK TABLES `tbl_school` WRITE;
/*!40000 ALTER TABLE `tbl_school` DISABLE KEYS */;
INSERT INTO `tbl_school` VALUES (1,'School of Science'),(2,'School of Engineering'),(3,'School of Arts');
/*!40000 ALTER TABLE `tbl_school` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 13:28:09
