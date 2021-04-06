-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL,
  `comments` longtext NOT NULL,
  `fk_authorid` int(11) NOT NULL,
  `fk_postid` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `key_tousertable_idx` (`fk_authorid`),
  KEY `key_toposttable_idx` (`fk_postid`),
  CONSTRAINT `key_toposttable` FOREIGN KEY (`fk_postid`) REFERENCES `posts` (`id`),
  CONSTRAINT `key_tousertable` FOREIGN KEY (`fk_authorid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users _idx` (`fk_userid`),
  CONSTRAINT `posts to users ` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test title','test test title title 3283328-4043438','images/test.png','images/thumbnails/test.png',0,'2020-12-11 11:40:01',6),(2,'test title1','test test tiwdtle title 3283328-4043438','images/test1.png','images/thumbnails/test1.png',0,'2020-12-11 11:41:40',16),(3,'test title2','test test tiwd2tle title 3283328-4043438','images/test2.png','images/thumbnails/test2.png',0,'2020-12-11 11:41:52',18),(4,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-11 11:42:24',14),(5,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-11 13:30:42',14),(8,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-16 13:56:11',14),(9,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-17 18:55:33',14),(10,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-17 19:09:07',14),(11,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-18 19:54:55',14),(12,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-18 20:53:38',14),(13,'test title3','test test tiwd122tle title 3283328-4043438','images/test3.png','images/thumbnails/test3.png',0,'2020-12-20 22:41:30',14),(14,'bip','bip bip bip','images/bip.png','images/thumbnails/bip.png',0,'2020-12-21 09:53:58',19),(18,'bip','bip bip bip','images/bip.png','images/thumbnails/bip.png',0,'2020-12-21 10:20:35',1),(19,'bip','bip bip bip','images/bip.png','images/thumbnails/bip.png',0,'2020-12-21 22:42:46',1),(20,'aw','aw','public/images/uploads/24c0c0e404cd501b52a89ad8c24d9d3537f5c46c5891.jpeg','public/images/uploads/thumbnail-24c0c0e404cd501b52a89ad8c24d9d3537f5c46c5891.jpeg',0,'2020-12-22 00:03:11',40),(21,'han','han','public/images/uploads/2ab93382b3449384223843729d00061aa7e07bf7949a.jpeg','public/images/uploads/thumbnail-2ab93382b3449384223843729d00061aa7e07bf7949a.jpeg',0,'2020-12-22 00:05:15',40),(22,'beach','sand','public/images/uploads/4c2e22bda02b93ac497f5884520fa79efd7d2468efd0.jpeg','public/images/uploads/thumbnail-4c2e22bda02b93ac497f5884520fa79efd7d2468efd0.jpeg',0,'2020-12-22 00:09:11',40),(23,'aww','aww','public/images/uploads/e156e234332a6be84c22a20ae48a85b27d6050b8a785.jpeg','public/images/uploads/thumbnail-e156e234332a6be84c22a20ae48a85b27d6050b8a785.jpeg',0,'2020-12-22 00:45:47',40),(24,'people','people','public/images/uploads/f321592ea4f329f11241c01a7783a0226b002fd520b0.jpeg','public/images/uploads/thumbnail-f321592ea4f329f11241c01a7783a0226b002fd520b0.jpeg',0,'2020-12-22 01:31:41',46),(25,'b&w','b&w city','public/images/uploads/37442be3b692b4068f817dd0fad2175b64348ce12622.jpeg','public/images/uploads/thumbnail-37442be3b692b4068f817dd0fad2175b64348ce12622.jpeg',0,'2020-12-22 02:57:23',46),(26,'ad','da','public/images/uploads/5e91d72adcd8d8e1809677096c8ec1abe5b3d8c50109.jpeg','public/images/uploads/thumbnail-5e91d72adcd8d8e1809677096c8ec1abe5b3d8c50109.jpeg',0,'2020-12-22 03:27:23',46),(27,'dog','dog','public/images/uploads/63ea40549d47404593ab5a822f910caa3a818f4a7e6d.png','public/images/uploads/thumbnail-63ea40549d47404593ab5a822f910caa3a818f4a7e6d.png',0,'2020-12-22 03:51:43',40),(28,'beach','sandy beach','public/images/uploads/27e237451fc0a1734db22d7264db753da87a55522699.jpeg','public/images/uploads/thumbnail-27e237451fc0a1734db22d7264db753da87a55522699.jpeg',0,'2020-12-22 04:11:48',40),(29,'ssd','ddd','public/images/uploads/667d5506c266cb9e9b099e86223d1befa85cf52ee47e.jpeg','public/images/uploads/thumbnail-667d5506c266cb9e9b099e86223d1befa85cf52ee47e.jpeg',0,'2020-12-22 08:07:44',40),(30,'sdssds','adsdsds','public/images/uploads/6ea23c8b794b3fee4f2d52485d31888ecf7de72c51e0.jpeg','public/images/uploads/thumbnail-6ea23c8b794b3fee4f2d52485d31888ecf7de72c51e0.jpeg',0,'2020-12-22 08:16:00',40),(31,'adds','sdds','public/images/uploads/e07bbfa6d946a2e23471c364203b616f3ee066912a01.jpeg','public/images/uploads/thumbnail-e07bbfa6d946a2e23471c364203b616f3ee066912a01.jpeg',0,'2020-12-22 08:26:54',40),(32,'ffdfdf','fdfdfdf','public/images/uploads/bf97b7b21c3ca0bf1233bd61f6e27f3c0d60bf30eebf.jpeg','public/images/uploads/thumbnail-bf97b7b21c3ca0bf1233bd61f6e27f3c0d60bf30eebf.jpeg',0,'2020-12-22 08:40:43',40),(33,'suds','dsdsd','public/images/uploads/a8ddcb7c0eee5911a6731dd788a05a4276d9044dfea9.jpeg','public/images/uploads/thumbnail-a8ddcb7c0eee5911a6731dd788a05a4276d9044dfea9.jpeg',0,'2020-12-22 08:42:27',40),(34,'ssdsd','dsas','public/images/uploads/508fc813087bfdc2d7b2f0fb22fd61aa736ac8ae1514.jpeg','public/images/uploads/thumbnail-508fc813087bfdc2d7b2f0fb22fd61aa736ac8ae1514.jpeg',0,'2020-12-22 08:45:50',40),(35,'flowers','colors','public/images/uploads/a643676b8b899e2dff95454edfe886fa90045c229035.jpeg','public/images/uploads/thumbnail-a643676b8b899e2dff95454edfe886fa90045c229035.jpeg',0,'2020-12-22 08:48:16',46),(36,'asasas','asasasa','public/images/uploads/b28f0e7da5be55ac671b3ae26da1b2d44188bf41999d.jpeg','public/images/uploads/thumbnail-b28f0e7da5be55ac671b3ae26da1b2d44188bf41999d.jpeg',0,'2020-12-22 08:52:01',46),(37,'aaaaaaa','aaaaa','public/images/uploads/b6d625c071ef6df5bac02d225ab78bc8d324fdfcf01c.jpeg','public/images/uploads/thumbnail-b6d625c071ef6df5bac02d225ab78bc8d324fdfcf01c.jpeg',0,'2020-12-22 08:52:24',40),(38,'jniunn','nmnimio','public/images/uploads/c7db90527f258d280d619a31b0b9d2cfacccf255556d.jpeg','public/images/uploads/thumbnail-c7db90527f258d280d619a31b0b9d2cfacccf255556d.jpeg',0,'2020-12-22 10:02:32',40),(39,'dddfdf','fdfdf','public/images/uploads/979ff9abec8a6d0469384518adafd4812cf143e65aec.png','public/images/uploads/thumbnail-979ff9abec8a6d0469384518adafd4812cf143e65aec.png',0,'2020-12-22 10:30:23',40),(40,'gfgfgirl','ghv','public/images/uploads/0480a3bec313fe580536ff33a94a9a27fb309c85488f.jpeg','public/images/uploads/thumbnail-0480a3bec313fe580536ff33a94a9a27fb309c85488f.jpeg',0,'2020-12-22 13:03:24',40),(41,'beach','sandy  ','public/images/uploads/58e4d454688c1969f30f684e1df30d93c55037c13457.jpeg','public/images/uploads/thumbnail-58e4d454688c1969f30f684e1df30d93c55037c13457.jpeg',0,'2020-12-22 13:15:50',40),(42,'b&w city','picture of city','public/images/uploads/5cbeedf48deaef8502ff4e8dbe24a88c45609ddaf391.jpeg','public/images/uploads/thumbnail-5cbeedf48deaef8502ff4e8dbe24a88c45609ddaf391.jpeg',0,'2020-12-22 13:16:49',40);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test666','test@mail.com','lfgklsjdfs89',0,0,'2020-12-11 10:57:10'),(6,'test6666','fake@mail.com','321lfgklsjdfs89',0,0,'2020-12-11 11:08:08'),(14,'testusers12','fake12@mail.com','122321lfgklsjdfs89',0,0,'2020-12-11 11:19:07'),(16,'testusers3212','fake1322@mail.com','122321232lfgklsjdfs89',0,0,'2020-12-11 11:40:48'),(18,'testusers323212','fake132312@mail.com','12232123212lfgklsjdfs89',0,0,'2020-12-11 11:41:11'),(19,'testusers3cdcdc23212','fake13231cdcdcc2@mail.com','122321232cdcdcd12lfgklsjdfs89',0,0,'2020-12-16 16:52:20'),(20,'testusers3cdcdc23212111','fake13231cdcdcc21@mail.com','122321232cdcdcd121lfgklsjdfs89',0,0,'2020-12-16 16:52:38'),(21,'John','johnsmith@mail.com','abc',0,0,'2020-12-16 19:21:16'),(24,'cdcdcd','cdcddcd@mail.com','cdcdcd',0,0,'2020-12-17 11:35:09'),(25,'ddcdcd','cddcd@mail.com','ddcdcd',0,0,'2020-12-17 11:51:35'),(26,'sam','sam@mail.com','sam',0,0,'2020-12-17 11:59:57'),(27,'bill','bill@mail.com','bill',0,0,'2020-12-17 12:07:15'),(28,'dd','dd@mail.com','dd',0,0,'2020-12-17 19:15:52'),(29,'Charlie','charlie@mail.com','Charlie',0,0,'2020-12-17 19:34:17'),(30,'Madeline','madeline@mail.com','Madeline',0,0,'2020-12-17 20:00:22'),(31,'will','will@mail.com','will',0,0,'2020-12-17 20:07:42'),(32,'ge','ge@mail.com','ge',0,0,'2020-12-17 22:57:27'),(33,'Kiana','kiana@mail.com','Kiana',0,0,'2020-12-18 00:11:48'),(34,'kamelia','ka@mail.com','kamelia',0,0,'2020-12-18 00:20:12'),(35,'kamelia1','kamelia@mail.com','kamelia1',0,0,'2020-12-18 00:20:43'),(36,'vp','vp@mail.com','vp',0,0,'2020-12-18 00:24:48'),(37,'Andrew','a@mail.com','Andrew',0,0,'2020-12-18 00:26:41'),(38,'jimmy','jim@mail.com','$2b$15$91MO.w5KBzcGWYYdhJc11uSfvY4uhJo0WBTkZH92Wf8cvNg/vUP1u',0,0,'2020-12-18 01:04:14'),(39,'ame','ame@mail.com','$2b$15$RHO5UJg6CSIwFIX8cqhFVuSY42/3E7E3g2QAV3xbYnLo850DSd.La',0,0,'2020-12-18 01:11:13'),(40,'aw','aw@mail.com','$2b$15$/F4hLAW7U/ZnURTz8.j.RuLDYSVyqEMxAI2qgbzHgNgS/e5NOXFsO',0,0,'2020-12-18 01:16:40'),(41,'jam1','jam1@mail.com','$2b$15$nots5Gk0eIqIWOVvqG.tHORoNGc8mz2lGY7A7bobBO3ZDOC96/6Cq',0,0,'2020-12-18 02:45:13'),(42,'Amy','amy@mail.com','$2b$15$S.d6CKzhoVCg5r97bwWSF.V.q.jM23aJ5pNIMIpOc7Uo4s17r4CNK',0,0,'2020-12-18 02:46:25'),(43,'william123','william123@mail.com','$2b$15$KbW0/FsmgzvrkmpD4iJg0eQG4owt3dvnz5L27uI/DptHtf7Yoc40K',0,0,'2020-12-18 02:49:29'),(44,'a112312332','a231231231@mail.com','$2b$15$S41kfzDWOYcE6LyGDaXdaOpJPSjaH0fmEcAPeM28ocyNabthlFm/m',0,0,'2020-12-18 19:10:00'),(45,'bobsaget','bobsaget@mail.com','$2b$15$SISvtLA1N2p9nhX.naslrOlv5xYleX7uQ9sktQYhh4mo5g00yrfvi',0,0,'2020-12-18 19:11:13'),(46,'justinbieber','justinbieber@mail.com','$2b$15$xaZb/zj6DQSXV207edGCo.UhomCkTHfJgAAwORaa/Jh/ZVFgNFbrC',0,0,'2020-12-18 19:13:05'),(47,'awscwc','cwcdcw@mail.com','$2b$15$NhBerlOhDyEYsJHkfG8HsOClQVlXAdJ4CyekvBLeeuWgnFY6n5biq',0,0,'2020-12-18 19:24:42'),(48,'bread','b@hotmail.com','$2b$15$JzQ30JeoJNU8CCRkxMtvvuk5TL/nzQ0hS8eZkIY2g.BoqJYI2uHXm',0,0,'2020-12-18 19:50:53'),(49,'ddcdhcud','cbudhcubdcusb@Mail.com','$2b$15$FxLGZywGqa6XAVJDtv4.u.ZKA4qZWDKRbfLfDTYJee9qjfULrAix2',0,0,'2020-12-20 22:24:46'),(50,'rgrvereve','vvevvrve@mail.com','$2b$15$GaEOGv7K.FSp3POzTmV6cOIHtyvfC5whH1un6xWHasxl7bWr6sPC6',0,0,'2020-12-20 23:28:34'),(51,'jimmybob','jbob@mail.com','$2b$15$b31mKA30bS6H8QO21MStbO5vEvsp/Y6K602Ly.wPcmz78UxB65TdS',0,0,'2020-12-21 15:17:38'),(52,'kameliashaharova','kameliashaharova@yahoo.com','$2b$15$NgXGniSt7Tz5Jg8M1xVePefh9fO0LjT1SIxC17kn8c1gL2BUAdIoO',0,0,'2020-12-21 15:51:36'),(53,'ada','ada@mail.com','$2b$15$W2.w7mu32tS0lzb4fPr2WOmbw82jr2SOlZU/Fya7rsic8FYL8qhOu',0,0,'2020-12-21 20:13:15'),(54,'billyrae','billyrae@mail.com','$2b$15$6AQVK616eSpT6kwQCDpzoef93e1vihW880Z5586MYczYyPrPInBYG',0,0,'2020-12-22 01:30:25'),(55,'aw1','aw1@mail.com','$2b$15$Xd64dIlU9tnbb6a6ELynHetijhG2AW03jPyqChQkJWJLH5Y6/Txgi',0,0,'2020-12-22 04:09:52'),(56,'refactorUser','user@mail.com','$2b$15$uBLbuLhbvOej359QuKpmt.B61ZQd/nLpUWVeNXva.QxXu1wgmgxvW',0,0,'2020-12-22 06:30:48'),(57,'kameliadhaharova','sha@mail.com','$2b$15$O3Pfcwv8gL/xqvz7EzO06uJaesiCHDLku1AD1a0TZf0FKu5DcxCdK',0,0,'2020-12-22 06:33:23'),(58,'tester1','tester1@mail.com','$2b$15$IhVcJapdUKcLYQNXxpjXrOja2A1l8nbQA8zR6IbSfYePoZVxg5ixm',0,0,'2020-12-22 06:53:05'),(59,'chelsea11','chelsea11@mail.com','$2b$15$UeoS10FqZIdJNoRLxJNn2OjspLyl0V/UXXd9UUmOJ.w3/AXi/sF7m',0,0,'2020-12-22 06:58:11'),(60,'chelseabaker','cdfjighieruhvuierb@mail.com','$2b$15$W6H4PUjKFM1iJrTzL7Afne54KoxRCxwWPOdtePuL4K5ZVbVqk2oR6',0,0,'2020-12-22 06:58:59'),(61,'bvjfbvf','vjkfnjfnvjf@mail.com','$2b$15$CNcJ8115fAtbONZtWPce5Ojqs2zvB/J0byVWrs9PlKPsZ61.oHphK',0,0,'2020-12-22 08:40:05'),(62,'dsdsdsdt8yt48ty487vty3478 t4','dasdasdasd@mail.com','$2b$15$c9qD7YcojdybCySnz0zDI.enwUgJcG9Lo0socn35983XhU06oicMG',0,0,'2020-12-22 08:47:23'),(63,'ronaldmcdonald','jkjvbdfjkbvfjkbvfdjbvjhfbvjhfdsbvhjdbf@mail.com','$2b$15$Ru/9q.Lk4jPGSYY.75Ac5ODGvP.F1.ZMlTJGLTGyshAvUQbFLVrKi',0,0,'2020-12-22 10:49:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 14:53:18
