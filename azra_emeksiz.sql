-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K. Rowling','UK'),(2,'George R.R. Martin','USA'),(3,'Fyodor Dostoevsky','Russia'),(4,'Leo Tolstoy','Russia'),(5,'Harper Lee','USA'),(6,'Yuval Noah Harari','Israel'),(7,'Robert C. Martin','USA'),(8,'Joshua Bloch','USA'),(9,'Michelle Obama','USA'),(10,'Daniel Kahneman','Israel'),(11,'Eric Ries','USA'),(12,'Paulo Coelho','Brazil'),(13,'F. Scott Fitzgerald','USA');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `PublicationYear` int DEFAULT NULL,
  `PublisherID` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `PublisherID` (`PublisherID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`PublisherID`) REFERENCES `publishers` (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('9780061120084','To Kill a Mockingbird','Fiction',1960,305),('9780062316097','The Alchemist','Fiction',1988,312),('9780132350884','Clean Code','Technology',2008,307),('9780134685991','Effective Java','Technology',2017,308),('9780140447934','Crime and Punishment','Fiction',1866,303),('9780307264939','Sapiens: A Brief History of Humankind','Non-Fiction',2011,306),('9780307279460','21 Lessons for the 21st Century','Non-Fiction',2018,306),('9780307397146','Thinking, Fast and Slow','Psychology',2011,310),('9780439139601','Harry Potter and the Goblet of Fire','Fantasy',2000,301),('9780553573404','A Game of Thrones','Fantasy',1996,302),('9780679783268','War and Peace','Historical',1869,304),('9780743273565','The Great Gatsby','Fiction',1925,313),('9780804139298','The Lean Startup','Business',2011,311),('9781400064168','Becoming','Biography',2018,309);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_authors`
--

DROP TABLE IF EXISTS `books_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_authors` (
  `ISBN` varchar(20) NOT NULL,
  `AuthorID` int NOT NULL,
  PRIMARY KEY (`ISBN`,`AuthorID`),
  KEY `AuthorID` (`AuthorID`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_authors`
--

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;
INSERT INTO `books_authors` VALUES ('9780439139601',1),('9780553573404',2),('9780140447934',3),('9780679783268',4),('9780061120084',5),('9780307264939',6),('9780307279460',6),('9780132350884',7),('9780134685991',8),('9781400064168',9),('9780307397146',10),('9780804139298',11),('9780062316097',12),('9780743273565',13);
/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowing` (
  `BorrowingID` int NOT NULL AUTO_INCREMENT,
  `BorrowDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `MemberID` int DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `LibrarianID` int DEFAULT NULL,
  PRIMARY KEY (`BorrowingID`),
  KEY `MemberID` (`MemberID`),
  KEY `ISBN` (`ISBN`),
  KEY `LibrarianID` (`LibrarianID`),
  CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  CONSTRAINT `borrowing_ibfk_3` FOREIGN KEY (`LibrarianID`) REFERENCES `librarians` (`LibrarianID`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing`
--

LOCK TABLES `borrowing` WRITE;
/*!40000 ALTER TABLE `borrowing` DISABLE KEYS */;
INSERT INTO `borrowing` VALUES (501,'2024-12-01','2024-12-15',101,'9780439139601',201),(502,'2024-12-05','2024-12-19',102,'9780134685991',202),(503,'2024-12-08','2024-12-22',103,'9780307264939',203),(504,'2024-12-02','2024-12-16',104,'9780553573404',201),(505,'2024-12-06','2024-12-20',105,'9780061120084',202),(506,'2024-12-03','2024-12-17',106,'9780679783268',203);
/*!40000 ALTER TABLE `borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarians`
--

DROP TABLE IF EXISTS `librarians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarians` (
  `LibrarianID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `WorkingShift` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LibrarianID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarians`
--

LOCK TABLES `librarians` WRITE;
/*!40000 ALTER TABLE `librarians` DISABLE KEYS */;
INSERT INTO `librarians` VALUES (201,'John Doe','john.doe@library.com','Morning'),(202,'Sarah Miller','sarah.miller@library.com','Night'),(203,'Michael Green','michael.green@library.com','Morning');
/*!40000 ALTER TABLE `librarians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (101,'Alice Johnson','alice@gmail.com','555-1234'),(102,'Bob Smith','bobsmith@yahoo.com','555-5678'),(103,'Charlie Brown','charlie@hotmail.com','555-9101'),(104,'Azra Emeksiz','azra.emeksiz@mail.com','555-1122'),(105,'Emeksiz Okan','emeksiz.okan@mail.com','555-3344'),(106,'David Lee','david.lee@mail.com','555-5566'),(107,'Emma Williams','emma.williams@mail.com','555-7788'),(108,'Frank Turner','frank.turner@mail.com','555-8899'),(109,'Grace Kim','grace.kim@mail.com','555-9900'),(110,'Henry Carter','henry.carter@mail.com','555-1011');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `PublisherID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `ContactDetails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (301,'Bloomsbury Publishing','+44 1234 567890'),(302,'Bantam Books','+1 800 123 4567'),(303,'Penguin Classics','+7 800 555 1234'),(304,'The Russian Library','+7 800 654 3210'),(305,'HarperCollins','+1 800 987 6543'),(306,'Harvill Secker','+972 4 1234567'),(307,'Addison-Wesley','+1 800 234 5678'),(308,'Pearson','+1 800 234 5678'),(309,'Crown Publishing','+1 800 765 4321'),(310,'Farrar, Straus and Giroux','+1 800 123 0987'),(311,'Portfolio Penguin','+1 800 333 4444'),(312,'HarperCollins Brazil','+55 11 33445566'),(313,'Scribner','+1 800 123 4567');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 23:46:12
