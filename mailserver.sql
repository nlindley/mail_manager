-- MySQL dump 10.13  Distrib 5.1.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mailserver
-- ------------------------------------------------------
-- Server version	5.1.61-0+squeeze1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `virtual_aliases`
--

DROP TABLE IF EXISTS `virtual_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_aliases_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_aliases`
--

LOCK TABLES `virtual_aliases` WRITE;
/*!40000 ALTER TABLE `virtual_aliases` DISABLE KEYS */;
INSERT INTO `virtual_aliases` VALUES (1,3,'postmaster@thisoneplace.com','me@thisoneplace.com'),(2,3,'webmaster@thisoneplace.com','me@thisoneplace.com'),(3,3,'mailer-daemon@thisoneplace.com','me@thisoneplace.com'),(4,3,'nick@thisoneplace.com','me@thisoneplace.com'),(5,3,'itunes@thisoneplace.com','me@thisoneplace.com'),(6,5,'brothers@eekkpsi.org','me@thisoneplace.com'),(7,6,'webmaster@fromthemouch.com','me@thisoneplace.com'),(8,7,'webmaster@shortgrasshonorband.org','me@thisoneplace.com'),(9,8,'chase@deadclever.net','cbrooks@deadclever.net'),(10,4,'ervs@ervsquikserv.com','dawn@ervsquikserv.com'),(11,10,'admin@okmusicschools.org','me@thisoneplace.com'),(12,11,'admin@cordellpres.org','me@thisoneplace.com'),(13,7,'webmaster@shortgrasshonorband.org','dewitt.tim@elkcityschools.com'),(14,7,'webmaster@shortgrasshonorband.org','sabj74@yahoo.com'),(15,12,'support@raylongmd.com','clinic@raylongmd.com'),(16,3,'apple@thisoneplace.com','me@thisoneplace.com'),(17,15,'admin@dropamine.com','me@thisoneplace.com'),(18,12,'clinical@raylongmd.com','clinic@raylongmd.com'),(19,12,'nonclinical@raylongmd.com','clinic@raylongmd.com'),(20,12,'billing@raylongmd.com','clinic@raylongmd.com'),(21,17,'webmaster@clintonokband.com','me@thisoneplace.com');
/*!40000 ALTER TABLE `virtual_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_domains`
--

DROP TABLE IF EXISTS `virtual_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_domains`
--

LOCK TABLES `virtual_domains` WRITE;
/*!40000 ALTER TABLE `virtual_domains` DISABLE KEYS */;
INSERT INTO `virtual_domains` VALUES (1,'lindleyinc.com'),(2,'amablespeech.com'),(3,'thisoneplace.com'),(4,'ervsquikserv.com'),(5,'eekkpsi.org'),(6,'fromthemouch.com'),(7,'shortgrasshonorband.org'),(8,'deadclever.net'),(9,'ajstegall.com'),(10,'okmusicschools.org'),(11,'cordellpres.org'),(12,'raylongmd.com'),(13,'cordellcrier.com'),(14,'buyersellerreview.com'),(15,'dropamine.com'),(16,'tuttlebands.com'),(17,'clintonokband.com');
/*!40000 ALTER TABLE `virtual_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_users`
--

DROP TABLE IF EXISTS `virtual_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_users`
--

LOCK TABLES `virtual_users` WRITE;
/*!40000 ALTER TABLE `virtual_users` DISABLE KEYS */;
INSERT INTO `virtual_users` VALUES (1,1,'daf6a75017abd78912eeb97b5c3bbee0','rick@lindleyinc.com'),(2,1,'88e3c1cc468174ec85266d5bdc764ff7','nick@lindleyinc.com'),(3,2,'422dc058e8bbf69cd9d20321f191f2ae','pflores@amablespeech.com'),(4,3,'88e3c1cc468174ec85266d5bdc764ff7','me@thisoneplace.com'),(5,3,'b1006579ddae0855b91080a715b1b71a','rick@thisoneplace.com'),(6,3,'73f85b4580fc84223a9962aae8739686','sue@thisoneplace.com'),(7,3,'bde46c36b491896e90a003c5f441e04b','cbrooks@thisoneplace.com'),(8,3,'282c0e275bc55a64762c63fc4f6ee770','jessica@lindleyinc.com'),(9,8,'bde46c36b491896e90a003c5f441e04b','cbrooks@deadclever.net'),(10,4,'33db8571df4bfd0efcbac6b2dfde65fc','dawn@ervsquikserv.com'),(11,9,'b3dd63d7d61c0c34526f2f923db7c599','aj@ajstegall.com'),(12,12,'ebcac72cd1e65df919e28cd274149c65','clinic@raylongmd.com'),(13,13,'b89b9272efa4295dbe5e6bb9df45ef81','crier@cordellcrier.com'),(14,14,'1347c7c939b1752480538948ad1b7852','webmaster@buyersellerreview.com'),(16,1,'5c0c633342506008ecd7e935fc88f3ef','doug@lindleyinc.com'),(17,16,'8ec93cc2f7840419830775871fa3415e','apowell@tuttlebands.com'),(18,16,'20d0619867afc8c86aae0e360362af09','sboothby@tuttlebands.com'),(19,12,'3e7a402e188bd7c524990f5220a017bc','mckensey.mcdaniel@raylongmd.com'),(20,12,'250fa28db9aadaeb2e4de1ebd4d6d1cf','naomi.goossen@raylongmd.com'),(21,12,'7581e23d4f59d70316d19b8f4930f943','kimberly.long@raylongmd.com'),(22,12,'a6c2dc8df3c9fceb809b04f861f26584','ray.long@raylongmd.com'),(23,12,'2aa9a9e3dde11b2f8335ec7312226d75','wendy.mcsperitt@raylongmd.com'),(24,12,'0799665af3c872fcee8ec4cc6d8682b5','amber.jones@raylongmd.com'),(25,12,'5ca03a1ac2b3886708e503fa32368c33','christina.mcsperitt@raylongmd.com');
/*!40000 ALTER TABLE `virtual_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-10 20:25:43
