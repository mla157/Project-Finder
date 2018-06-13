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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.movie: ~50 rows (approximately)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`idMovie`, `title`, `year`, `Genre`, `description`, `language`, `imageUrl`) VALUES
	(1, 'Avengers: Infinity War', '2018-04-26', 1, 'Avengers: Infinity War: Im ultimativen Marvel-Superhelden-Spektakel treten die Avengers, Doctor Strange und die Guardians of the Galaxy gemeinsam gegen den Über-Bösewicht Thanos an.', 'De-DE', 'Images\\theavengers.jpg'),
	(2, 'Es', '2018-09-28', 2, 'Nachdem in dem Städtchen Derry/Maine Kinder verschwunden sind, müssen sich einige Jugendliche ihren schlimmsten Ängsten stellen, als sie es mit einem Horrorclown namens Pennywise zu tun bekommen - schon seit Jahrhunderten treibt dieser brutale Mörder sein', '', 'Images\\es.jpg'),
	(3, 'Eine umbequeme Wahrheit', '2018-10-12', 3, 'Eine unbequeme Wahrheit ist ein Dokumentarfilm von Davis Guggenheim mit dem ehemaligen US-Vizepräsidenten und Präsidentschaftskandidaten Al Gore über die globale Erwärmung', '', 'Images\\unbequemeWahrheit.jpg'),
	(4, 'Interstellar', '2018-11-06', 4, 'Basierend auf einer Idee des Physikers Kip S. Thorne soll sich die Handlung um eine Reise einiger Forscher durch ein \\"Wurmloch\\" in eine andere Dimension drehen. Der angesehene Wissenschaftler vertritt die Theorie, dass solche Wurmlöcher nicht nur tatsäc', '', 'Images\\interstellar.jpg'),
	(5, 'Avengers: Infinity War 2', '2018-04-26', 1, 'Avengers: Infinity War: Im ultimativen Marvel-Superhelden-Spektakel treten die Avengers, Doctor Strange und die Guardians of the Galaxy gemeinsam gegen den Über-Bösewicht Thanos an.', 'De-DE', 'Images\\avengers2.jpg'),
	(6, 'Deadpool', '2016-02-11', 5, 'Basierend auf Marvels unkonventionellstem Anti-Helden, erzählt DEADPOOL die Geschichte des ehemaligen Special Forces Soldaten und Söldners Wade Wilson, der - nachdem er sich einem skrupellosen Experiment unterzieht - unglaubliche Selbstheilungskräfte erla', '', 'Images\\deadpool.jpg'),
	(7, 'Deadpool 2', '2018-05-17', 5, 'Der mutige Söldner Wade Wilson (alias Deadpool) bringt ein Team mutierter Mutanten zusammen, um einen Jungen mit übernatürlichen Fähigkeiten vor dem brutalen, zeitvertreibenden Cyborg Cable zu beschützen.', '', 'Images\\deadpool2.jpg'),
	(8, 'High School Musical', '2006-09-04', 5, 'Troy und Gabriella - zwei Teenager, die Welten voneinander entfernt sind - treffen sich bei einem Karaoke-Wettbewerb und entdecken ihre gegenseitige Liebe zur Musik.', '', 'Images\\highschoolmusical.jpg'),
	(9, 'Psych: The Movie', '2017-12-07', 5, 'Die alte Bande kommt in den Ferien zusammen, nachdem ein Mystery-Attentäter einen seiner eigenen Ziele erreicht hat.', '', 'Images\\psych.jpg'),
	(10, 'Sharknado 5: Global Swarming', '2017-08-06', 1, 'Da ein Großteil Amerikas in Trümmern liegt, steht der Rest der Welt hinter einem globalen Sharknado; Fin und seine Familie müssen um die Welt reisen, um sie aufzuhalten.', '', 'Images\\sharkonado5.jpg'),
	(11, 'The Secret Life of Snakes', '2016-01-01', 3, 'Dieser Dokumentarfilm zeigt einige der beeindruckendsten Arten Europas, wie die Europäische Natter, die Nashornviper, die Würfelnatter, die Ringelnatter und die Äskulapnatter.', '', 'Images\\snakes.jpg'),
	(12, 'Spielberg', '2017-10-07', 3, 'Eine Dokumentation über das Leben und die Karriere eines der einflussreichsten Regisseure aller Zeiten, Steven Spielberg.', '', 'Images\\spielberg.jpg'),
	(13, 'Strippers', '2014-01-01', 3, 'Ein Dokumentarfilm, der sich auf das Leben von Schoßtänzern in Glasgow, Edinburgh und Aberdeen, den drei größten Städten Schottlands, konzentriert.', '', 'Images\\strippers.jpg'),
	(14, 'Dunkirk', '2004-02-18', 3, 'Eine dramatisierte Dokumentation über die Evakuierung der britischen Expeditionstruppe aus Dünkirchen im Mai 1940.', '', 'Images\\dunkirk.jpg'),
	(15, 'Hamiltons America', '2016-10-21', 3, 'Hamiltons America geht noch tiefer in die Entstehung des Hamilton-Musicals ein und enthüllt Lin-Manuel Mirandas Prozess, Hamiltons epische Geschichte in bahnbrechendes Musiktheater zu integrieren.', '', 'Images\\hamiltons.jpg'),
	(16, 'Ich bin Bruce Lee', '2012-12-27', 3, 'Bruce Lee ist allgemein anerkannt als der Pionier, der Kampfkünste im Film zur Kunstform erhoben hat, und dieser Dokumentarfilm wird enthüllen, warum Bruce Lees Flamme jetzt heller brennt als am Tag ...', '', 'Images\\brucelee.jpg'),
	(17, 'Truth or Dare', '2017-10-08', 2, 'Acht College-Freunde gehen zu Halloween zu einem "Haunted Rental". Aber wenn sie das Spiel wiederholen, das das Haus berüchtigt gemacht hat, erwecken sie einen bösen Geist, der ihre Seelen stehlen will.', '', 'Images\\truthordare.jpg'),
	(18, 'The Twin', '2017-01-01', 2, 'Eine Frau (Brigid Brannagh) tritt in Aktion, nachdem sie entdeckt hat, dass der Zwillingsbruder (Timothy Granaderos) vom Freund ihrer Tochter aus einer psychiatrischen Anstalt flüchtet und einen verdrehten Plan der Rache schlüpft.', '', 'Images\\twin.jpg'),
	(19, 'Carrie', '2002-11-04', 2, 'Carrie White ist eine einsame und schmerzlich schüchterne Teenagerin mit telekinetischen Kräften, die durch häufiges Mobbing sowohl ihrer Klassenkameraden als auch ihrer dominanten, religiösen Mutter langsam an den Rand des Wahnsinns getrieben wird.', '', 'Images\\carrie.jpg'),
	(20, 'The Hollow', '2015-10-24', 2, 'Etwas passiert, wenn Sarah, Marley und Emma ihre Tante Cora besuchen. Eine seltsame Kreatur tötet Menschen nacheinander. Die einzige Möglichkeit, von der Kreatur zu überleben: sich bis zum Morgengrauen zu verstecken.', '', 'Images\\hollow.jpg'),
	(21, 'Bad Ben', '2016-10-05', 2, 'Eine Gruppe von Highschool-Kindern macht sich auf den Weg, um in einem verlassenen Haus einen Halloween-Streich zu spielen, doch sobald sie eintreten, werden sie Opfer einer dämonischen Hexe, die ihnen ihren Zorn auferlegt hat.', '', 'Images\\badben.jpg'),
	(22, 'House of the Witch', '2017-10-07', 2, 'Eine Gruppe von Highschool-Kindern macht sich auf den Weg, um in einem verlassenen Haus einen Halloween-Streich zu spielen, doch sobald sie eintreten, werden sie Opfer einer dämonischen Hexe, die ihnen ihren Zorn auferlegt hat.', '', 'Images\\witch.jpg'),
	(23, 'Frankenstein', '2004-10-10', 2, 'Zweihundert Jahre nach Mary Shelleys Roman hat der geniale, aber verrückte Doktor sein Wesen und sich selbst über zwei Jahrhunderte durch genetische Experimente erhalten. Im heutigen Amerika ...', '', 'Images\\frankenstein.jpg'),
	(24, 'The Night Before Halloween', '2016-10-29', 2, 'In der Nacht vor Halloween werden die 17-jährige Megan und ihre Gruppe von Freunden dazu verleitet, an einem Streich teilzunehmen, bei dem ihre Freundin Beth versehentlich ins Koma fällt. Was Megan und ...', '', 'Images\\nightbeforehalloween.jpg'),
	(25, 'Oasis', '2017-03-17', 4, 'Ein schottischer Kaplan begibt sich auf eine epische Reise durch den Weltraum.', '', 'Images\\oasis.jpg'),
	(26, 'Star Wars: Rogue One', '2016-12-15', 4, 'Die Tochter eines imperialen Wissenschaftlers tritt der Rebellenallianz in einem riskanten Schritt bei, um die Todessternpläne zu stehlen.', '', 'Images\\rogueone.jpg'),
	(27, 'Gefahr aus dem Weltall 2', '2001-09-24', 4, 'Aliens Crashland in der Nähe einer kleinen Wüstenstadt, verstreut seltsame bläulich leuchtende Felsen in der Gegend. Stadtbewohner bemerken, dass etwas nicht stimmt, wenn die Temperaturen zu steigen beginnen, Wasser verschwindet, Kraft ...', '', 'Images\\gefahrweltall2.jpg'),
	(28, 'Zenith', '2010-02-01', 4, 'Ein retro-futuristischer Steam-Punk-Thriller, etwa zwei Männer in zwei Zeitperioden, deren Suche nach der gleichen großen Verschwörung sie dazu bringt, ihre eigene Menschlichkeit in Frage zu stellen.', '', 'Images\\zenith.jpg'),
	(29, 'Pacific Rim 2: Uprising', '2018-03-22', 4, 'Jake Pentecost, Sohn von Stacker Pentecost, trifft wieder auf Mako Mori, um eine neue Generation von Jaeger-Piloten, darunter der Rivale Lambert und der 15-jährige Hacker Amara, gegen eine neue Kaiju-Bedrohung zu führen.', '', 'Images\\pacificrim2.jpg'),
	(30, 'Star Trek: Beyond', '2016-07-21', 4, 'Die Crew der USS Enterprise erkundet die weitesten Bereiche des unerforschten Raumes, wo sie auf einen neuen rücksichtslosen Feind treffen, der sie und alles, wofür die Föderation steht, auf die Probe stellt.', '', 'Images\\beyond.jpg'),
	(31, 'Independence Day', '1996-09-19', 4, 'Die Aliens kommen und ihr Ziel ist es, in die Erde einzudringen und sie zu zerstören. Die beste Waffe der Menschheit ist der Überlebenswille.', '', 'Images\\independenceday.jpg'),
	(32, 'Coco - Lebendiger als das Leben', '2017-11-30', 5, 'Der aufstrebende Musiker Miguel, der mit dem althergebrachten Musikverbot seiner Familie konfrontiert ist, betritt das Land der Toten, um seinen Ururgroßvater, einen legendären Sänger, zu finden.', '', 'Images\\coco.jpg'),
	(33, 'Solo: A Star Wars Story', '2018-05-24', 1, 'Während eines Abenteuers in die kriminelle Unterwelt trifft Han Solo seinen zukünftigen Kopiloten Chewbacca und trifft auf Lando Calrissian Jahre, bevor er sich der Rebellion anschließt.', '', 'Images\\solo.jpg'),
	(34, 'Black Panther', '2018-02-15', 1, 'TChalla, der König von Wakanda, steigt in der isolierten, technologisch fortgeschrittenen afrikanischen Nation auf den Thron, aber seine Behauptung wird von einem rachsüchtigen Außenseiter in Frage gestellt, der ein Kind war, das Opfer von TChallas Vater ', '', 'Images\\blackPanther.jpg'),
	(35, 'Batman Begins', '2005-06-16', 1, 'Nach dem Training mit seinem Mentor beginnt Batman seinen Kampf, um das kriminelle Gotham City von der Korruption zu befreien, die Scarecrow und die League of Shadows ihm angetan haben.', '', 'Images\\batman.jpg'),
	(36, 'Jumanji', '2017-12-21', 5, 'Vier Teenager werden in ein magisches Videospiel hineingezogen, und die einzige Möglichkeit, wie sie entkommen können, besteht darin, zusammenzuarbeiten, um das Spiel zu beenden.', '', 'Images\\jumanji.jpg'),
	(37, 'Spider-Man', '2017-07-13', 1, 'Peter Parker gleicht sein Leben als gewöhnlicher Gymnasiast in Queens mit seinem Superhelden-Alter Ego Spider-Man aus und findet sich auf der Spur einer neuen Bedrohung, die den Himmel von New York City durchstreift.', '', 'Images\\spiderman.jpg'),
	(38, 'Wonder Woman', '2017-06-15', 1, 'Als ein Pilot abstürzt und von Konflikten in der Außenwelt erzählt, verlässt Diana, eine amazonische Kriegerin im Training, die Heimat, um einen Krieg zu führen und ihre vollen Kräfte und ihr wahres Schicksal zu entdecken.', '', 'Images\\wonderwoman.jpg'),
	(39, 'Rampage - Big meets Bigger', '2018-05-10', 1, 'Wenn drei verschiedene Tiere mit einem gefährlichen Krankheitserreger infiziert werden, schließen sich ein Primatologe und ein Genetiker zusammen, um sie davon abzuhalten, Chicago zu zerstören.', '', 'Images\\rampage.jpg'),
	(40, 'Suicide Squad', '2016-08-18', 1, 'Eine geheime Regierungsagentur rekrutiert einige der gefährlichsten eingekerkerten Superschurken, um eine defensive Task Force zu bilden. Ihre erste Mission: rette die Welt vor der Apokalypse.', '', 'Images\\suicidesquad.jpg'),
	(41, 'I Feel Pretty', '2018-05-10', 5, 'Eine Frau, die mit Unsicherheit kämpft, erwacht von einem Sturz und glaubt, dass sie die schönste und fähigste Frau auf dem Planeten ist. Ihr neues Selbstvertrauen gibt ihr die Möglichkeit, furchtlos zu leben, aber was passiert, wenn sie merkt, dass sich ', '', 'Images\\feelpretty.jpg'),
	(42, 'Power Rangers', '2017-03-23', 4, 'Eine Gruppe von Gymnasiasten, die mit einzigartigen Superkräften ausgestattet sind, nutzen ihre Fähigkeiten, um die Welt zu retten.', '', 'Images\\powerrangers.jpg'),
	(43, 'Oceans Eight', '2018-06-21', 5, 'Debbie Ocean versammelt eine rein weibliche Crew, um bei der jährlichen Met Gala in New York City einen unmöglichen Überfall zu versuchen', '', 'Images\\oceans.jpg'),
	(44, 'Book Club', '2018-09-20', 5, 'Vier lebenslange Freunde haben ihr Leben für immer verändert, nachdem sie 50 Shades of Grey in ihrem monatlichen Buchclub gelesen haben.', '', 'Images\\bookclub.jpg'),
	(45, 'How to Party with Mom', '2018-07-05', 5, 'Nachdem ihr Mann abrupt die Scheidung verlangt, kehrt eine Mutter mittleren Alters an die Universität zurück, um ihren Abschluss zu machen.', '', 'Images\\partywithmom.jpg'),
	(46, 'Breaking In', '2018-05-11', 1, 'Eine Frau kämpft, um ihre Familie während einer Hausinvasion zu schützen.', '', 'Images\\breaking.jpg'),
	(47, 'Inception', '2010-07-29', 1, 'Cobb ist der Kopf einer technologisch bestens ausgerüsteten Bande von Dieben, die einen Weg gefunden hat, Träume in den Köpfen von Menschen zu platzieren und zu steuern, indem man sich selbst in ihnen manifestiert. Auf diesem Weg soll der aufstrebende Man', '', 'Images\\inception.jpg'),
	(48, 'Matrix', '1999-06-17', 1, 'Der Hacker Neo wird übers Internet von einer geheimnisvollen Untergrund-Organisation kontaktiert. Der Kopf der Gruppe - der gesuchte Terrorist Morpheus - weiht ihn in ein entsetzliches Geheimnis ein: Die Realität, wie wir sie erleben, ist nur eine Scheinw', '', 'Images\\matrix.jpg'),
	(49, 'Prestige - Die Meister der Magie', '2007-01-11', 4, 'Als sich das zwanzigste Jahrhundert ankündigt, befindet sich das viktorianische England im Aufbruch. Kunst und Unterhaltung stehen hoch im Kurs und damit auch die Magier, die beides in ihren Shows vereinigen. Zwei Zauberkünstler setzen in dieser Zeit neue', '', 'Images\\prestige.jpg'),
	(50, 'Mad Max: Fury Road', '2015-05-14', 1, 'Eine Frau rebelliert im postapokalyptischen Australien auf der Suche nach ihrem Heimatland gegen einen tyrannischen Herrscher mit Hilfe einer Gruppe weiblicher Gefangener, einer psychotischen Verehrerin und eines Mörders namens Max.', '', 'Images\\madmax.jpg');
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

-- Dumping data for table finderdb.playlist: ~4 rows (approximately)
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` (`User_idUser`, `playlistCreated`) VALUES
	(10, NULL),
	(11, NULL),
	(12, NULL),
	(13, NULL);
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

-- Dumping data for table finderdb.playlist_has_movie: ~18 rows (approximately)
/*!40000 ALTER TABLE `playlist_has_movie` DISABLE KEYS */;
INSERT INTO `playlist_has_movie` (`Movie_idMovie`, `Playlist_User_idUser`) VALUES
	(41, 10),
	(42, 10),
	(42, 11),
	(43, 11),
	(44, 11),
	(45, 11),
	(46, 10),
	(46, 11),
	(47, 11),
	(48, 10),
	(48, 11),
	(49, 10),
	(49, 11),
	(50, 10),
	(50, 11);
/*!40000 ALTER TABLE `playlist_has_movie` ENABLE KEYS */;

-- Dumping structure for table finderdb.user
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Automatisch, numerisch aufsteigende Zahl die von der Datenbank selbst erstellt wird.\n\nPRIMARY KEY',
  `benutzername` varchar(45) NOT NULL COMMENT 'Benutzername. Nicht null und einzigartig, da jeder Benutzer eindeutig identifiziert werden muss.',
  `vorname` varchar(45) NOT NULL COMMENT 'Vorname des Benutzers',
  `nachname` varchar(45) NOT NULL COMMENT 'Nachname des Benutzers',
  `geburtsdatum` date NOT NULL COMMENT 'Geburtsdatum - Pflichtfeld da gewisse Filme erst ab 18 einsichtbar sind.',
  `passwort` varchar(100) NOT NULL COMMENT 'Passwort des Benutzers als Hashwert gespeichert.\n\nKEIN PASSWORT IN KLARSCHRIFT ABSPEICHERN!',
  `preference` varchar(100) DEFAULT NULL,
  `userCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `userChanged` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  UNIQUE KEY `Benutzername_UNIQUE` (`benutzername`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table finderdb.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`idUser`, `benutzername`, `vorname`, `nachname`, `geburtsdatum`, `passwort`, `preference`, `userCreated`, `userChanged`) VALUES
	(10, 'test', 'Max', 'Herr', '0000-00-00', 'test', NULL, '2018-06-12 08:35:58', '2018-06-12 08:35:58'),
	(11, 'bjoern', 'Bjoern', 'Bullmann', '0000-00-00', '1234', '1', '2018-06-12 08:37:29', '2018-06-12 08:37:29'),
	(12, 'test1', 'test1234', 'Test', '0000-00-00', 'test', NULL, '2018-06-12 08:40:17', '2018-06-12 08:40:17'),
	(13, 'maxb', 'max', 'leon', '0000-00-00', '1234', NULL, '2018-06-12 08:41:00', '2018-06-12 08:41:00');
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
