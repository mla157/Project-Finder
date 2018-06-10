-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.31-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5278
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for finderdb
CREATE DATABASE IF NOT EXISTS `finderdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `finderdb`;

-- Dumping structure for table finderdb.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `idActor` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(255) DEFAULT NULL,
  `nachname` varchar(255) DEFAULT NULL,
  `zweiterVorname` varchar(255) DEFAULT NULL,
  `geschlecht` varchar(45) DEFAULT NULL,
  `geburtstag` date DEFAULT NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE KEY `idActor_UNIQUE` (`idActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.actor: ~0 rows (approximately)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Dumping structure for table finderdb.genre
CREATE TABLE IF NOT EXISTS `genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `Genre` varchar(50) DEFAULT NULL COMMENT 'Kurze Beschreibung des Genre (z.B. Action, Comedy, usw.)',
  PRIMARY KEY (`idGenre`),
  UNIQUE KEY `idGenre_UNIQUE` (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.genre: ~5 rows (approximately)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`idGenre`, `Genre`) VALUES
	(1, 'Action'),
	(2, 'Horror'),
	(3, 'Documentation'),
	(4, 'Scifi'),
	(5, 'Humor');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Dumping structure for table finderdb.keywords
CREATE TABLE IF NOT EXISTS `keywords` (
  `idKeywords` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`idKeywords`),
  UNIQUE KEY `idKeywords_UNIQUE` (`idKeywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;

-- Dumping structure for table finderdb.movie
CREATE TABLE IF NOT EXISTS `movie` (
  `idMovie` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` date NOT NULL,
  `Genre` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `language` varchar(60) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMovie`),
  UNIQUE KEY `idMovie_UNIQUE` (`idMovie`),
  KEY `fk_Movie_Genre_idx` (`Genre`),
  CONSTRAINT `fk_Movie_Genre` FOREIGN KEY (`Genre`) REFERENCES `genre` (`idGenre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie: ~6 rows (approximately)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`idMovie`, `title`, `year`, `Genre`, `description`, `language`, `imageUrl`) VALUES
	(1, 'Avengers: Infinity War', '2018-04-26', 1, 'Avengers: Infinity War: Im ultimativen Marvel-Superhelden-Spektakel treten die Avengers, Doctor Strange und die Guardians of the Galaxy gemeinsam gegen den Über-Bösewicht Thanos an.', 'De-DE', 'Images\\theavengers.jpg'),
	(2, 'Es', '2018-09-28', 2, 'Nachdem in dem Städtchen Derry/Maine Kinder verschwunden sind, müssen sich einige Jugendliche ihren schlimmsten Ängsten stellen, als sie es mit einem Horrorclown namens Pennywise zu tun bekommen - schon seit Jahrhunderten treibt dieser brutale Mörder sein', '', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages-eu.ssl-images-amazon.com%2Fimages%2FI%2F41-HMcMgXHL.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.de%2FEs-Roman-Stephen-King-ebook%2Fdp%2FB004P1J4B6&docid=fksarnthtlqo3M&tbnid=JNT319rbbpVmTM%3A&vet=10ahUK'),
	(3, 'Eine umbequeme Wahrheit', '2018-10-12', 3, 'Eine unbequeme Wahrheit ist ein Dokumentarfilm von Davis Guggenheim mit dem ehemaligen US-Vizepräsidenten und Präsidentschaftskandidaten Al Gore über die globale Erwärmung', '', NULL),
	(4, 'Interstellar', '2018-11-06', 4, 'Basierend auf einer Idee des Physikers Kip S. Thorne soll sich die Handlung um eine Reise einiger Forscher durch ein \\"Wurmloch\\" in eine andere Dimension drehen. Der angesehene Wissenschaftler vertritt die Theorie, dass solche Wurmlöcher nicht nur tatsäc', '', NULL),
	(5, 'Lustiger Film 123', '2017-12-12', 5, 'Test Humor', '', NULL),
	(6, 'Avengers: Infinity War 2', '2018-04-26', 1, 'Avengers: Infinity War: Im ultimativen Marvel-Superhelden-Spektakel treten die Avengers, Doctor Strange und die Guardians of the Galaxy gemeinsam gegen den Über-Bösewicht Thanos an.', 'De-DE', NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Dumping structure for table finderdb.movies_keywords_has_keywords
CREATE TABLE IF NOT EXISTS `movies_keywords_has_keywords` (
  `Movies_Keywords_idMovies_Keywords` int(11) NOT NULL,
  `Keywords_idKeywords` int(11) NOT NULL,
  PRIMARY KEY (`Movies_Keywords_idMovies_Keywords`,`Keywords_idKeywords`),
  KEY `fk_Movies_Keywords_has_Keywords_Keywords1_idx` (`Keywords_idKeywords`),
  CONSTRAINT `fk_Movies_Keywords_has_Keywords_Keywords1` FOREIGN KEY (`Keywords_idKeywords`) REFERENCES `keywords` (`idKeywords`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movies_keywords_has_keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `movies_keywords_has_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_keywords_has_keywords` ENABLE KEYS */;

-- Dumping structure for table finderdb.movie_has_actor
CREATE TABLE IF NOT EXISTS `movie_has_actor` (
  `Movie_idMovie` int(11) NOT NULL,
  `Actor_idActor` int(11) NOT NULL,
  `character` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Movie_idMovie`,`Actor_idActor`),
  KEY `fk_Movie_has_Actor_Actor1_idx` (`Actor_idActor`),
  KEY `fk_Movie_has_Actor_Movie1_idx` (`Movie_idMovie`),
  CONSTRAINT `fk_Movie_has_Actor_Actor1` FOREIGN KEY (`Actor_idActor`) REFERENCES `actor` (`idActor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Actor_Movie1` FOREIGN KEY (`Movie_idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie_has_actor: ~0 rows (approximately)
/*!40000 ALTER TABLE `movie_has_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_has_actor` ENABLE KEYS */;

-- Dumping structure for table finderdb.movie_has_keywords
CREATE TABLE IF NOT EXISTS `movie_has_keywords` (
  `Movie_idMovie` int(11) NOT NULL,
  `Keywords_idKeywords` int(11) NOT NULL,
  PRIMARY KEY (`Movie_idMovie`,`Keywords_idKeywords`),
  KEY `fk_Movie_has_Keywords_Movie1_idx` (`Movie_idMovie`),
  CONSTRAINT `fk_Movie_has_Keywords_Movie1` FOREIGN KEY (`Movie_idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie_has_keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `movie_has_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_has_keywords` ENABLE KEYS */;

-- Dumping structure for table finderdb.movie_has_keywords_has_keywords
CREATE TABLE IF NOT EXISTS `movie_has_keywords_has_keywords` (
  `Movie_has_Keywords_Movie_idMovie` int(11) NOT NULL,
  `Movie_has_Keywords_Keywords_idKeywords` int(11) NOT NULL,
  `Keywords_idKeywords` int(11) NOT NULL,
  PRIMARY KEY (`Movie_has_Keywords_Movie_idMovie`,`Movie_has_Keywords_Keywords_idKeywords`,`Keywords_idKeywords`),
  KEY `fk_Movie_has_Keywords_has_Keywords_Keywords1_idx` (`Keywords_idKeywords`),
  KEY `fk_Movie_has_Keywords_has_Keywords_Movie_has_Keywords1_idx` (`Movie_has_Keywords_Movie_idMovie`,`Movie_has_Keywords_Keywords_idKeywords`),
  CONSTRAINT `fk_Movie_has_Keywords_has_Keywords_Keywords1` FOREIGN KEY (`Keywords_idKeywords`) REFERENCES `keywords` (`idKeywords`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Keywords_has_Keywords_Movie_has_Keywords1` FOREIGN KEY (`Movie_has_Keywords_Movie_idMovie`, `Movie_has_Keywords_Keywords_idKeywords`) REFERENCES `movie_has_keywords` (`Movie_idMovie`, `Keywords_idKeywords`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie_has_keywords_has_keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `movie_has_keywords_has_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_has_keywords_has_keywords` ENABLE KEYS */;

-- Dumping structure for table finderdb.movie_has_movies_keywords
CREATE TABLE IF NOT EXISTS `movie_has_movies_keywords` (
  `Movie_idMovie` int(11) NOT NULL,
  `Movies_Keywords_idMovies_Keywords` int(11) NOT NULL,
  PRIMARY KEY (`Movie_idMovie`,`Movies_Keywords_idMovies_Keywords`),
  KEY `fk_Movie_has_Movies_Keywords_Movie1_idx` (`Movie_idMovie`),
  CONSTRAINT `fk_Movie_has_Movies_Keywords_Movie1` FOREIGN KEY (`Movie_idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie_has_movies_keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `movie_has_movies_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_has_movies_keywords` ENABLE KEYS */;

-- Dumping structure for table finderdb.playlist
CREATE TABLE IF NOT EXISTS `playlist` (
  `User_idUser` int(11) NOT NULL,
  `playlistCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`User_idUser`),
  CONSTRAINT `fk_Playlist_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.playlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;

-- Dumping structure for table finderdb.playlist_has_movie
CREATE TABLE IF NOT EXISTS `playlist_has_movie` (
  `Movie_idMovie` int(11) NOT NULL,
  `Playlist_User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`Movie_idMovie`,`Playlist_User_idUser`),
  KEY `fk_Movie_has_Playlist_Playlist1_idx` (`Playlist_User_idUser`),
  KEY `fk_Movie_has_Playlist_Movie1_idx` (`Movie_idMovie`),
  CONSTRAINT `fk_Movie_has_Playlist_Movie1` FOREIGN KEY (`Movie_idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Playlist_Playlist1` FOREIGN KEY (`Playlist_User_idUser`) REFERENCES `playlist` (`User_idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.playlist_has_movie: ~0 rows (approximately)
/*!40000 ALTER TABLE `playlist_has_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_has_movie` ENABLE KEYS */;

-- Dumping structure for table finderdb.user
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Automatisch, numerisch aufsteigende Zahl die von der Datenbank selbst erstellt wird.\n\nPRIMARY KEY',
  `benutzername` varchar(45) NOT NULL COMMENT 'Benutzername. Nicht null und einzigartig, da jeder Benutzer eindeutig identifiziert werden muss.',
  `vorname` varchar(45) NOT NULL COMMENT 'Vorname des Benutzers',
  `nachname` varchar(45) NOT NULL COMMENT 'Nachname des Benutzers',
  `passwort` varchar(100) NOT NULL COMMENT 'Passwort des Benutzers als Hashwert gespeichert.\n\nKEIN PASSWORT IN KLARSCHRIFT ABSPEICHERN!',
  `preference` varchar(100) DEFAULT NULL,
  `userCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `userChanged` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  UNIQUE KEY `Benutzername_UNIQUE` (`benutzername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table finderdb.watchlist
CREATE TABLE IF NOT EXISTS `watchlist` (
  `Movie_idMovie` int(11) NOT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`Movie_idMovie`,`User_idUser`),
  KEY `fk_Movie_has_User_User1_idx` (`User_idUser`),
  KEY `fk_Movie_has_User_Movie1_idx` (`Movie_idMovie`),
  CONSTRAINT `fk_Movie_has_User_Movie1` FOREIGN KEY (`Movie_idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_User_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.watchlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
