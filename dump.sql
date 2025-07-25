-- MySQL dump 10.13  Distrib 8.0.43, for Linux (aarch64)
--
-- Host: localhost    Database: moviz-db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Christopher','Nolan'),(2,'Lana','Wachowski'),(3,'Lilly','Wachowski'),(4,'Gareth','Edwards');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20250627170838','2025-06-27 17:09:09',19),('DoctrineMigrations\\Version20250628150028','2025-06-28 15:00:51',16),('DoctrineMigrations\\Version20250628161301','2025-06-28 16:13:16',126),('DoctrineMigrations\\Version20250706170630','2025-07-06 17:07:00',27),('DoctrineMigrations\\Version20250707152356','2025-07-07 15:24:12',18),('DoctrineMigrations\\Version20250713063606','2025-07-13 06:36:27',43);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Policier'),(2,'Action'),(3,'Horreur'),(4,'Science-fiction'),(5,'Thriller');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  `synopsis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `duration` time DEFAULT NULL,
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Interstellar','2014-11-05','<div>Le film raconte les aventures d’un groupe d’explorateurs qui utilisent une faille récemment découverte dans l’<strong>espace-temps</strong> afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un<strong> voyage interstellaire</strong>.&nbsp;</div>','02:49:00','interstellar-65525dac66cac461033198-686be7f0a9c75577884813.jpg',271108,'2025-07-07 15:29:52'),(2,'Inception','2010-07-21','<div>Dom Cobb est un voleur expérimenté – le meilleur qui soit dans l’art périlleux de l’extraction : sa spécialité consiste à s’approprier les secrets les plus précieux d’un individu, enfouis au plus profond de son subconscient, pendant qu’il rêve et que son esprit est particulièrement vulnérable. Très recherché pour ses talents dans l’univers trouble de l’espionnage industriel, Cobb est aussi devenu un fugitif traqué dans le monde entier qui a perdu tout ce qui lui est cher. Mais une ultime mission pourrait lui permettre de retrouver sa vie d’avant – à condition qu’il puisse accomplir l’impossible : l’inception. Au lieu de subtiliser un rêve, Cobb et son équipe doivent faire l’inverse : implanter une idée dans l’esprit d’un individu. S’ils y parviennent, il pourrait s’agir du crime parfait. Et pourtant, aussi méthodiques et doués soient-ils, rien n’aurait pu préparer Cobb et ses partenaires à un ennemi redoutable qui semble avoir systématiquement un coup d’avance sur eux. Un ennemi dont seul Cobb aurait pu soupçonner l’existence.</div>','02:28:00','inception-686bf6a4e7607842284580.jpg',432223,'2025-07-07 16:32:36'),(3,'Matrix','1999-06-23','<div>Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l\'un des pirates les plus recherchés du cyber-espace. A cheval entre deux mondes, Neo est assailli par d\'étranges songes et des messages cryptés provenant d\'un certain Morpheus. Celui-ci l\'exhorte à aller au-delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu\'est-ce que la Matrice ? Nul ne le sait, et aucun homme n\'est encore parvenu à en percer les defenses. Mais Morpheus est persuadé que Neo est l\'Elu, le libérateur mythique de l\'humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents...</div>','02:15:00','matrix-686bf6b215054536135190.jpg',162730,'2025-07-07 16:32:50'),(4,'Jurassic World: Renaissance','2025-07-04','<div>Cinq ans après JURASSIC WORLD : LE MONDE D’APRÈS, l’environnement de la planète s’est révélé hostile pour la plupart des dinosaures. Ceux qui subsistent vivent dans des zones équatoriales isolées, aux conditions proches de celles de leur ère d’origine. Parmi ces créatures terrifiantes, trois spécimens renferment peut-être la clé d’un remède capable de changer le destin de l’humanité.</div>','02:13:00',NULL,NULL,NULL),(5,'Dragons','2025-06-06','Sur l\'île accidentée de Berk, où Vikings et dragons se vouent une haine viscérale depuis des générations, Harold fait figure d\'exception. Fils inventif mais négligé du chef Stoïck la Brute, il bouscule les traditions en se liant d\'amitié avec Krokmou, une Furie nocturne. Leur duo improbable va révéler la vraie nature des dragons et bouleverser les fondements de la société viking. Avec la forte et ambitieuse Astrid et l\'excentrique forgeron du village Gueulfor à ses côtés, Harold fait face à un monde déchiré par la peur et l\'incompréhension. Lorsqu\'une ancienne menace refait surface et met en péril les Vikings autant que les dragons, l\'amitié entre Harold et Krokmou devient la clé de l\'élaboration d\'un avenir meilleur. Ensemble, ils doivent trouver la voie menant à la paix, s\'envolant au-delà des frontières de leurs mondes pour redéfinir la véritable nature d\'un héros et d\'un chef.',NULL,'36ayHS6mrm7CdaiRq53eNNDrZeD.jpg',NULL,NULL),(6,'M3GAN 2.0','2025-06-25','Deux ans ont passé depuis la destruction de M3GAN, le prototype à la pointe de l’intelligence artificielle devenu incontrôlable lors d’un carnage aussi sanglant qu’impeccablement chorégraphié. Sa créatrice Gemma aujourd’hui auteure de renom milite pour l’encadrement drastique des I.A. par le gouvernement, alors que Cady, sa nièce de 14 ans entre dans l’adolescence et se rebelle contre les règles trop strictes de sa tante. Cependant, à l’insu de tous, la technique de pointe mise au point pour M3GAN a été volée et détournée pour créer une arme militaire connue sous le nom d\'AM3LIA.',NULL,'jRbw7bt9ftolX0GNcCvJdoHKdUq.jpg',NULL,NULL),(7,'Lilo & Stitch','2025-05-17','Sur l\'île d\'Hawaï, une petite fille espiègle nommée Lilo adopte ce qu\'elle croit être un chien étrange, qu\'elle prénomme Stitch. Mais Stitch est en réalité une créature extraterrestre créée pour semer le chaos. Malgré son tempérament destructeur, il découvre peu à peu les valeurs de l’amitié, de l’amour et de la famille. Ensemble, Lilo et Stitch vont prouver qu’une vraie famille peut naître là où on s’y attend le moins.\r 🌺 Un mélange d’humour, d’émotion et d’action dans cette réinvention en prises de vues réelles du classique animé de Disney.',NULL,'71IjwRa88OJMYJBntId7nn0eFHy.jpg',NULL,NULL),(8,'Demon Slayer: Kimetsu no Yaiba - La Forteresse Infinie','2025-07-18','',NULL,'lQOLDiImSw68qGiB7hwwAIrJjhz.jpg',NULL,NULL),(9,'L\'Amnésique','2025-01-13','Un homme se réveille dans une ville inconnue. Il ignore qui il est et doit percer des mystères pour découvrir son identité. Lors des recherches concernant son passé, il se retrouve confronté à un puissant ennemi. Leur affrontement final scellera son sort et lui permettra de découvrir son identité.',NULL,'aSUp3dZpiEeWw0LQEN9zcdbI27r.jpg',NULL,NULL),(10,'Karate Kid : Legends','2025-05-08','Li Fong, un adolescent qui fréquente l\'école de kung-fu de M. Han en Chine, doit déménager à New York avec sa mère. Celle-ci souhaite que son fils intègre une école prestigieuse et qu\'il mette de côté son sport de combat. À son arrivée dans sa nouvelle ville, Li rencontre Mia, une camarade de classe, ainsi que le père de celle-ci avec lesquels il se lie d\'amitié. Li se retrouve ensuite entraîné dans une compétition d\'arts martiaux où il doit affronter un redoutable champion de karaté.',NULL,'n4ZPnouW3jpUnkSEpU3sFG9SCEs.jpg',NULL,NULL),(11,'Superman','2025-07-09','Superman doit trouver l’équilibre entre ses racines kryptoniennes et son identité humaine, sous les traits de Clark Kent, originaire de Smallville, dans le Kansas. Il est l’incarnation de la vérité, de la justice et des valeurs américaines et il est animé par une véritable bienveillance dans un monde qui considère cette qualité comme obsolète.',NULL,'bL1U8TDb2ZiThIBFAdKHOfpv8lk.jpg',NULL,NULL),(12,'Ice Road: Vengeance','2025-06-27','Mike va au Népal pour amener les cendres de son frère sur le mont Everest. Lorsque Mike et son guide de montagne tombent sur un tas de mercenaires dans un bus touristique, ils sont obligés de se battre pour sauver leur vie et celle des passagers.',NULL,'cQN9rZj06rXMVkk76UF1DfBAico.jpg',NULL,NULL),(13,'Bride Hard','2025-06-19','Lorsqu\'un groupe de mercenaires prend en otage un somptueux mariage, ils n\'ont aucune idée de ce qui les attend. La demoiselle d\'honneur est en fait un agent secret prêt à faire pleuvoir le feu de l\'enfer sur tous ceux qui voudraient ruiner le mariage de sa meilleure amie.',NULL,'3mExdWLSxAiUCb4NMcYmxSkO7n4.jpg',NULL,NULL),(14,'Les 4 Fantastiques : Premiers pas','2025-07-23','Dans le contexte vibrant d’un monde rétro-futuriste inspiré des années 60, le film présente la première famille de Marvel : Reed Richards/Mister Fantastic, Sue Storm/La Femme Invisible, Johnny Storm/La Torche Humaine et Ben Grimm/La Chose  alors qu’ils font face à leur défi le plus redoutable à ce jour. Contraints d’équilibrer leur rôle de héros avec la force de leur lien familial, ils doivent défendre la Terre contre un dieu spatial vorace appelé Galactus et son énigmatique héraut, le Surfeur d’Argent. Et comme si le plan de Galactus de dévorer la planète entière et tous ses habitants n’était pas déjà assez mauvais, cela devient soudainement très personnel.',NULL,'2REHnvEBsPA121X4Fi8dvGaYJ4o.jpg',NULL,NULL),(15,'Ballerina','2025-06-04','Enfant, Eve Macarro a assisté impuissante au meurtre de son père par une bande de tueurs à gages. Devenue adulte, elle consacre sa vie au ballet et… au combat. Formée selon les traditions ancestrales de la Ruska Roma, Eve est devenue une redoutable combattante - l\'égale ou presque du légendaire John Wick, qu’elle croise parfois dans les couloirs de l’Hôtel Continental, à New York. Quand la Directrice la juge enfin prête pour une mission, Eve voit l\'occasion de régler ses comptes avec les meurtriers de son père. Quitte à devoir affronter, au passage, John Wick lui-même.',NULL,'e7zUVzux574daVsOlbcvmqEieyn.jpg',NULL,NULL),(16,'Jurassic World : Renaissance','2025-07-01','Une nouvelle ère voit le jour. Une équipe visite le lieu le plus risqué sur terre, une île sur laquelle vivent des dinosaures trop dangereux pour le Parc Jurassique original. Leur mission: recueillir l\'ADN de trois dinosaures gigantesques pour créer un médicament aux bienfaits miraculeux. Dans cette contrée truffée de périls, ils découvrent un secret dissimulé du monde entier depuis des décennies.',NULL,'uNHxkEWfcKFFZO6QDMXyFi8JF08.jpg',NULL,NULL),(17,'Almost Cops','2025-07-10','Lorsqu\'un agent de quartier un peu trop zélé est obligé de faire équipe avec un ex-inspecteur casse-cou, le chaos déferle dans les rues de Rotterdam.',NULL,'upzsNh9Ue3DmFlGnUlxwXtnEpQc.jpg',NULL,NULL),(18,'KPop Demon Hunters','2025-06-20','Quand elles ne remplissent pas les stades, Rumi, Mira et Zoey, superstars de la K-pop, utilisent leurs pouvoirs secrets pour protéger leurs fans de menaces surnaturelles.',NULL,'22AouvwlhlXbe3nrFcjzL24bvWH.jpg',NULL,NULL),(19,'Thunderbolts*','2025-04-30','Yelena Belova, Bucky Barnes, Red Guardian, Le Fantôme, Taskmaster et John Walker sont les Thunderbolts. Tombés dans un piège redoutable tendu par Valentina Allegra de Fontaine, ces laissés pour compte complètement désabusés doivent participer à une mission à haut risque qui les forcera à se confronter aux recoins les plus sombres de leur passé. Ce groupe dysfonctionnel se déchirera-t-il ou trouvera-t-il sa rédemption en s’unissant avant qu’il ne soit trop tard ?',NULL,'zctISSBEZRgVQPG178HqRJMnc4x.jpg',NULL,NULL),(20,'Destination finale : Bloodlines','2025-05-14','Stefani, 18 ans, fait d’affreux cauchemars. Dans ceux-ci, elle voit sa grand-mère échapper à la mort dans un accident qui aurait dû la tuer il y a 50 ans. Son ancêtre a réussi alors à esquiver le décès jusqu’à l’âge de 80 ans ou elle meurt de façon naturelle. À cause de ce miracle, toute sa descendance doit quelque chose à la mort.',NULL,'4uI8C2zcfLWRhZDBgd0oTlZjV9j.jpg',NULL,NULL),(21,'Angels Fallen: Warriors of Peace','2024-07-09','',NULL,'dKdKUSGQ9E0G73WPr9xIHrofpkT.jpg',NULL,NULL),(22,'The Old Guard 2','2025-07-01','Andy et son équipe de guerriers immortels retrouvent motivation et vigueur en affrontant un nouvel ennemi puissant qui met en péril leur mission de protection de l\'humanité.',NULL,'koVsfXXlQBsyAXET2N8AFP1oS8w.jpg',NULL,NULL),(23,'Heads of State','2025-07-02','Le Premier ministre britannique et le président des États-Unis ont une rivalité publique qui menace l\'alliance entre leurs pays. Mais lorsqu\'ils deviennent les cibles d\'un ennemi puissant, ils sont contraints de compter l\'un sur l\'autre et se lancent dans une folle course multinationale. Alliés à Noel, une brillante agente du MI6, ils doivent trouver un moyen de déjouer une conspiration qui menace le monde libre.',NULL,'wJRDtcknNEvpLI5rBqskAqCpC0T.jpg',NULL,NULL),(24,'性教育ママ','1973-11-20','',NULL,'xghWMg0pkBOdLHCTESyeyHU68wl.jpg',NULL,NULL),(25,'F1® Le Film','2025-06-25','Sonny Hayes était le prodige de la F1 des années 90 jusqu’à son terrible accident. Trente ans plus tard, devenu un pilote indépendant, il est contacté par Ruben Cervantes, patron d’une écurie en faillite qui le convainc de revenir pour sauver l’équipe et prouver qu’il est toujours le meilleur. Aux côtés de Joshua Pearce, diamant brut prêt à devenir le numéro 1, Sonny réalise vite qu\'en F1, son coéquipier est aussi son plus grand rival, que le danger est partout et qu\'il risque de tout perdre.',NULL,'lWCPcMevGaTWR9MawrPkMpJGTsz.jpg',NULL,NULL),(26,'Kaiju No. 8: Mission Recon','2025-03-28','Le Japon est infesté de kaiju, et le travail de Kafka Hibino consiste à se débarrasser de leurs carcasses. Pendant ce temps, son amie d’enfance, Mina Ashiro, grimpe les échelons dans les Forces de Défense anti-kaiju. Kafka avait abandonné l’idée de les intégrer, mais décide finalement de retenter sa chance pour se rapprocher de Mina. Un seul bémol : il devient subitement le puissant Kaiju No. 8 ! Avec la complicité de Reno Ichikawa, son jeune collègue, Kafka dissimule sa transformation et passe le concours d’entrée des Forces, dans le but de réaliser son rêve de petit garçon et de se tenir aux côtés de Mina. Lorsqu’un mystérieux kaiju doté de raison attaque la base où a lieu l’épreuve, il va devoir faire un choix cornélien dans une situation critique…',NULL,'7rqntwn4D6TIrw8TOcxAG6IMKsI.jpg',NULL,NULL),(27,'xXx','2002-08-09','Après une série de tests, Xander Cage dit « xXx », un spécialiste des sports extrêmes couvert de tatouages, est recruté par Augustus Gibbons, un agent de la National Security Agency (NSA), pour s’infiltrer dans une organisation criminelle et mettre fin à ses agissements. Dirigée par un certain Yorgi, celle‐ci se fait appeler « Anarchie 99 » et son siège se situe à Prague, en République tchèque. Gibbons est persuadé que Xander Cage réussira là où les espions conventionnels ont échoué.Ce dernier insiste toutefois pour accomplir cette mission à sa façon. Il se présente alors directement à Yorgi et se lie rapidement d’amitié avec lui, l’occasion pour Xander Cage de découvrir les terribles desseins de l’organisation.',NULL,'4nLTMNCGQ4rKsrlPVMPG4YnxV0k.jpg',NULL,NULL),(28,'The Cellar','2024-09-08','',NULL,'tNUzN0zqewZEmvnmyFSiGUKUS82.jpg',NULL,NULL),(29,'Ziam','2025-07-09','Confronté à une terrifiante armée de zombies, un ancien combattant de muay thaï doit faire preuve d\'adresse, de rapidité et de courage pour sauver sa petite amie.',NULL,'rE5Bf1ejCUuHxmQGIJTZ7W7M13p.jpg',NULL,NULL),(30,'Diplodocus','2024-10-04','Le petit dinosaure Diplodocus rêve de vivre une grande aventure. Malheureusement, ses parents surprotecteurs ne le laissent pas explorer le monde magnifique mais dangereux au-delà du mur qu\'ils ont construit pour protéger leur foyer dans la jungle. Diplo ne sait pas encore que son univers fait en réalité partie d\'une bande dessinée créée par Ted, un artiste rêvant de succès.',NULL,'4Mo8g0h7IPoN6LxQuinKNQxmk9C.jpg',NULL,NULL),(31,'Ne Zha','2019-07-26','Nezha, un jeune garçon, est né d\'une perle céleste du Seigneur du ciel (en). Doté de pouvoirs uniques, il se retrouve comme un paria, détesté et craint. Destiné par la prophétie à détruire le monde, il doit choisir entre le bien et le mal afin de briser les chaînes du destin et devenir un héros.',NULL,'ztWc4QvzEatqhGnQT98FsICc8rD.jpg',NULL,NULL),(32,'Materialists','2025-06-12','À l\'emploi d\'une agence de rencontre new-yorkaise, Lucy a pour tâche de dénicher le meilleur parti possible pour des clientes aux nombreuses exigences. Après de nombreuses années sans attache, elle se décide enfin à fréquenter Harry, héritier d\'une grande fortune rencontré au mariage d\'une cliente. Au même moment, John, son ancien amoureux, un acteur de théâtre sans le sou, reparaît dans sa vie.',NULL,'ycS4AydmXRWL4uj2vCwJOdfrcVt.jpg',NULL,NULL),(33,'Nudus','2024-04-11','',NULL,'e3E3V7TJkB2znDC2LLJuy1Um45Z.jpg',NULL,NULL),(34,'戏台','2025-07-12','',NULL,'wSFGtkoz8SW6yIgu1Xvxs584QQt.jpg',NULL,NULL),(35,'Dangerous Animals','2025-06-05','Lorsque Zephyr, une surfeuse libre d\'esprit, est enlevée par un tueur en série obsédé par les requins et retenue captive sur son bateau, elle doit trouver un moyen de s\'échapper avant qu\'il ne commette l\'irréparable.',NULL,'mbSjo72II8l7TeDFLhDKqJfweIw.jpg',NULL,NULL),(36,'女高生トリオ 性感試験','1977-02-23','',NULL,'9GSLrU0aoR6Pi2FQ0ttXV2thSxJ.jpg',NULL,NULL),(37,'Substitution - Bring Her Back','2025-05-28','À la mort accidentelle de son père, Andy réclame la garde de Piper, sa demi-soeur malvoyante, mais il lui manque trois mois pour atteindre les 18 ans réglementaires. En attendant, les services sociaux placent Piper chez Laura, une conseillère habituée de ce genre de cas. Mais le protecteur Andy refuse de se séparer de sa demi-soeur et s\'impose chez Laura, qui habite une grande maison à la campagne. Très vite, l\'adolescent remarque le comportement étrange et intrusif de leur hôtesse, qui héberge déjà Oliver, un petit garçon muet et plutôt inquiétant. Il appert que la conseillère faussement affable poursuit un rêve: éveiller l\'esprit de sa propre fille morte noyée.',NULL,'lNwjWspvbwd9wQYpVKXaZm9LfK9.jpg',NULL,NULL),(38,'Dora à la recherche du Sol Dorado','2025-07-02','Dora, agée de 16 ans, se lance dans l\'aventure la plus extraordinaire qu\'elle ait vécue, dans ce film familial en prises de vue réelles. Accompagnée de son cousin Diego et de son inséparable Babouche, elle part à la recherche du Sol Dorado, une étoile légendaire qui aurait le pouvoir d\'exaucer un seul et unique vœu. Elle fera la connaissance de nouveaux amis, Naiya et Sonny, qui l\'accompagneront dans cette périlleuse aventure au milieu de créatures sauvages, de pièges mortels et de ruines mystérieuses. Face au risque que cet inestimable trésor tombe entre de mauvaises mains, Dora et Diego devront se montrer plus solidaires que jamais. Pour relever son plus grand défi, Dora affrontera la jungle la plus sauvage qu\'elle ait jamais connue et découvrira la véritable force qui est en elle.',NULL,'47Kj29kuGj1wNWQ0h9zYZhqbpkA.jpg',NULL,NULL),(39,'84 m²','2025-07-17','Un homme qui a tout investi dans un nouvel appartement découvre que ses quatre murs renferment des bruits dérangeants, des voisins hostiles et des secrets troublants.',NULL,'hcyWZZ6cfrxLmdFsA5NMsg0gAgS.jpg',NULL,NULL),(40,'Hotel Leikeu','2020-04-29','',NULL,'hCr1FiejbRJBUjFZyZF5c8O9HGp.jpg',NULL,NULL),(41,'室町無頼','2025-01-17','',NULL,'5sb7yYbvB7IstubeGqmS8x3gV2d.jpg',NULL,NULL),(42,'Spirit in the Blood','2024-11-07','Après qu\'une jeune fille a été retrouvée morte dans une communauté religieuse isolée dans les montagnes, un groupe d\'adolescentes décide de lutter contre les esprits maléfiques qui, selon elles, l\'ont tuée en embrassant leur propre nature sombre.',NULL,'lu30MO2c6NPUL0XnK5rWLuRq9LO.jpg',NULL,NULL),(43,'Minecraft, le film','2025-03-31','Quatre mésadaptés traversent soudainement un portail mystérieux menant à la Surface : un étrange univers cubique qui évolue grâce à l’imagination. Pour rentrer chez eux, ils se lancent dans une quête magique avec Steve, un surprenant fabricateur expert. L’aventure les poussera à faire preuve d’audace et à renouer avec les qualités qui donnent à chacun une créativité unique.',NULL,'cq9z69AyIXeL2H14bqHE5ukm3M9.jpg',NULL,NULL),(44,'Mission : Impossible - The Final Reckoning','2025-05-17','Ethan Hunt se rend à Londres avec son équipe dans l\'espoir de remonter la piste du mystérieux Gabriel, qu\'il a affronté deux mois auparavant à bort de l\'Orient-Express et qui détient la clé contrôlant l’intelligence artificielle toute puissante surnommée l\'Entité. Adulée par les uns, redoutée par les autres, l’Entité se distingue par sa capacité à prédire toutes les éventualités possibles. Elle connaît parfaitement les forces et faiblesses d’Ethan et de son équipe. Gabriel compte l\'utiliser pour mettre en œuvre son plan ultime : annihiler Ethan et son équipe, s’emparer de tous les systèmes de défense planétaires et déclencher la Troisième Guerre mondiale.',NULL,'AozMgdALZuR1hDPZt2a1aXiWmL4.jpg',NULL,NULL),(45,'Juegos de Seducción','2025-07-18','',NULL,'s91PuVwq8jwDtrCWjkpF63rZgyX.jpg',NULL,NULL),(46,'The Amateur','2025-04-09','Charlie Heller est un cryptographe génial mais introverti. Il travaille pour la CIA, dans le sous-sol de son quartier général à Langley. Sa vie est bouleversée quand sa femme est tuée lors d\'une attaque terroriste à Londres. Ses superviseurs refusent d\'agir. Il décide donc de prendre les choses en main et parcourt le monde à la recherche des responsables de l\'attentat. Son intelligence est son arme ultime, elle lui permet d\'échapper à ses poursuivants et d\'accomplir sa vengeance.',NULL,'sEcRImVuoGtVWTj5uYCq3dLPNFu.jpg',NULL,NULL),(47,'सैयारा','2025-07-18','',NULL,'hQBIsi3ZfBYEayMc3GhcEmJVkss.jpg',NULL,NULL),(48,'Zombies 4 : L\'aube des vampires','2025-07-10','Le couple de Zombie et Cheerleader, Zed et Addison, part en road trip estival qui prend un tournant inattendu et les entraîne au cœur d’une rivalité entre monstres : les Demi-Vampires contre les Vampires. Les tensions s’accentuent tandis que Zed et Addison jouent les moniteurs d’un camp de vacances réunissant les deux factions surnaturelles. Avec l’aide de leurs amies Eliza et Willa, ils doivent convaincre deux ennemis jurés, Nova, une flamboyante Demi-Vampire, et Victor, un Vampire ténébreux,d’unir leurs peuples en guerre avant qu’une menace plus grande ne les mette tous en danger.',NULL,'i7WDBUUzGchrsIclzfhKHolZqqs.jpg',NULL,NULL),(49,'The Ritual – L’Exorcisme d’Emma Schmidt','2025-04-18','En 1928, Emma Schmidt est admise dans un couvent reculé du Midwest américain. Très vite, les phénomènes inexpliqués se multiplient. Le prêtre fait alors appel à un exorciste reconnu, Theophilus Riesinger. Ce qu’ils vont découvrir dépasse l’imagination. Ce dossier, basé sur une histoire vraie, a été longtemps tenu secret par l’Église. C’est le cas de possession démoniaque le mieux documenté de l’histoire des États-Unis.',NULL,'neEmMy5Y5Uysp9t4r0zN8KXHfgF.jpg',NULL,NULL),(50,'Sinners','2025-04-16','Alors qu’ils cherchent à s’affranchir d’un lourd passé, deux frères jumeaux reviennent dans leur ville natale pour repartir à zéro. Mais ils comprennent qu’une puissance maléfique bien plus redoutable guette leur retour avec impatience.',NULL,'9ZmdDOIbiFCZOvRXBQ7muWUu32l.jpg',NULL,NULL),(51,'Long Distance','2024-07-12','Un mineur d\'astéroïde qui, après avoir crashé sur une planète étrangère, doit se frayer un chemin à travers un terrain hostile, à court d\'oxygène, chassé par d\'étranges créatures, jusqu\'à l\'unique autre survivant.',NULL,'m5NKltgQqqyoWJNuK18IqEGRG7J.jpg',NULL,NULL),(52,'లైలా','2025-02-14','',NULL,'l4gsNxFPGpzbq0D6QK1a8vO1lBz.jpg',NULL,NULL),(53,'Sneaks','2025-04-17','Ty, un créateur de baskets unique et malavisé, ne connaît pas la vie en dehors du confort de sa boîte à chaussures doublée de velours. Après que sa sœur a été volée par un collectionneur louche, Ty doit s\'aventurer à New York pour la retrouver et la sauver. Au cours de son aventure, Ty rencontre un groupe hétéroclite d\'amis passionnés de chaussures, venus de tous horizons, qui l\'aident à trouver le courage de sortir de sa boîte à chaussures et de trouver son âme sœur.',NULL,'3SipvmtH9VOyLmII9JLs34qFfil.jpg',NULL,NULL),(54,'Intimité','2001-01-20','Claire vient chez Jay, l\'après-midi. Ils font l\'amour. Ils ne se parlent pas, mais il doit se passer quelque chose entre eux parce qu\'ils se lèvent ensemble et se couchent à côté de la table, sans un mot. La semaine suivante, à la même heure, elle est à la porte. Ils se déshabillent immédiatement. Si le sexe est un moyen de rencontrer et de connaître les gens, que sait-il d\'elle ?',NULL,'aEWt17Xk5zsEtGLve103XtUw4kh.jpg',NULL,NULL),(55,'Souviens-toi… l\'été dernier','2025-07-16','Une nouvelle version du film d\'horreur \"Souviens-toi l\'été dernier\".',NULL,'5VXJE1Kzkwz0783Vo3T8h3aRMfi.jpg',NULL,NULL),(56,'새엄마의 욕망','2020-05-29','',NULL,'rYC6UyML4CU4zYiZVbDMrwnGyWW.jpg',NULL,NULL),(57,'The Hangman','2024-05-30','',NULL,'rij9Eh4RVXyPet8A1BNU8pDvtmu.jpg',NULL,NULL),(58,'28 Ans plus tard','2025-06-18','Cela fait près de trente ans que le Virus de la Fureur s’est échappé d’un laboratoire d’armement biologique. Alors qu’un confinement très strict a été mis en place, certains ont trouvé le moyen de survivre parmi les personnes infectées. C’est ainsi qu’une communauté de rescapés s’est réfugiée sur une petite île seulement reliée au continent par une route, placée sous haute protection. Lorsque l’un des habitants de l’île est envoyé en mission sur le continent, il découvre que non seulement les infectés ont muté, mais que d’autres survivants aussi, dans un contexte à la fois mystérieux et terrifiant…',NULL,'3ACUg2j2ZsgrwT1RnaBmni8mOuI.jpg',NULL,NULL),(59,'Brick','2025-07-09','Quand un mystérieux mur noir enferme soudain leur immeuble pendant la nuit, Tim et Olivia doivent faire équipe avec des voisins méfiants pour s\'en sortir vivants.',NULL,'73VFU1frjqS2XmSD8FCvADADf7M.jpg',NULL,NULL),(60,'Kuang Bao Ju Xi','2024-03-27','',NULL,'9TFaFsSXedaALXTzba349euDeoY.jpg',NULL,NULL),(61,'Mamá Reinventada','2025-05-08','',NULL,'vUZSqIesoLoX9Z8ByHwm8xUCaTg.jpg',NULL,NULL),(62,'À contre-sens','2023-06-08','Noah doit quitter sa ville, son petit ami et ses amis pour emménager dans le manoir de William Leister, le nouveau et riche mari de sa mère. Âgée de dix-sept ans, fière et indépendante, Noah rencontre Nick, son nouveau demi-frère, et leurs fortes personnalités s’entrechoquent dès le début. Noah découvre bientôt que derrière l\'image d\'un fils modèle, Nick cache une vie de bagarre, de jeu et de courses automobiles illégales. Malgré l\'abîme qui les sépare, tous deux commencent à ressentir une attirance irrésistible qui se transformera bientôt en feu et en folle passion. Ni la rivalité permanente, ni l\'opposition de leur entourage ne peuvent les empêcher de tomber secrètement et follement amoureux. Mais le présent turbulent de Nick et le passé orageux de Noah mettront à l\'épreuve leur vie et leur amour interdit.',NULL,'3ZCfSSxZ2e4Kiwu3Y9dvfT5n1m6.jpg',NULL,NULL),(63,'Belyas','2025-02-07','',NULL,'5oJ6eMfI7B73cWh0VXaa5MzhfBW.jpg',NULL,NULL),(64,'In Vitro','2025-03-27','Dans un futur proche, Layla et son mari Jack expérimentent la biotechnologie dans l’espoir de sauver leur élevage au bord de la faillite. Lorsqu’une série d\'événements étranges se produisent, Layla soupçonne son mari d’inquiétantes expériences scientifiques qui pourraient bien la menacer...',NULL,'ue9vIO3Q8QbIOymRXM1t5QzLy1y.jpg',NULL,NULL),(65,'Vaiana 2','2024-11-21','Après avoir reçu une invitation inattendue de ses ancêtres, Vaiana entreprend un périple qui la conduira jusqu’aux eaux dangereuses situées aux confins des mers des îles du Pacifique. Elle y vivra des péripéties comme jamais vécues auparavant.',NULL,'usdwoEwm68cdeMOvGFPwSk9nLTr.jpg',NULL,NULL),(66,'The Twisters','2024-06-28','Des dizaines de tornades mortelles convergent vers le Midwest, fusionnant en une méga-tornade prête à tout anéantir sur des centaines de kilomètres.',NULL,'9xjSHm0R9tII8JCWHS1VdbftFk1.jpg',NULL,NULL),(67,'A Working Man','2025-03-26','Levon Cade a quitté une carrière militaire prestigieuse dans les forces spéciales pour mener une vie simple dans la construction. Cependant, lorsque la fille de son patron, qu\'il considère comme sa propre famille, est enlevée par des trafiquants d\'êtres humains, sa quête pour la ramener chez elle le plonge dans un monde de corruption bien plus vaste qu\'il n\'aurait jamais pu imaginer.',NULL,'oldKO0tV1OdJc0ohterwomhExDq.jpg',NULL,NULL),(68,'Des jours plus belles que la nuit','2009-10-10','Wim et Floor, un jeune couple en chair et en os, passent un après-midi dans les pièces ensoleillées d\'une maison en ruine en Belgique. Ce documentaire artistique érotique est monté presque en temps réel. Dans la lenteur, nous obtenons la construction, la douceur et la sexualité. Oubliez les montages rapides qui claquent des doigts. C\'est vers la lenteur qu\'il faut aller.',NULL,'uCkANtG6ezb7hjRKVudY3PUcbvn.jpg',NULL,NULL),(69,'爱上她的理由 番外 约定的未来','2024-02-13','',NULL,'hvY6vP4mRu5NPe2x02ft7mXBeS5.jpg',NULL,NULL),(70,'Predator : Killer of Killers','2025-06-05','Cette anthologie d\'animation suit trois des guerriers les plus féroces de l\'histoire de l\'humanité : une Viking guidant son jeune fils dans une quête de vengeance sanglante, un ninja du Japon féodal s\'opposant à son frère samouraï pour la succession et un pilote de la Seconde Guerre mondiale enquêtant sur une menace de la cause alliée en plein ciel.',NULL,'ff8DS4oiZttqBppDriGUal49lmw.jpg',NULL,NULL),(71,'Influencer','2023-05-18','Lors d’une excursion solitaire en Thaïlande, l’influenceuse Madison rencontre CW, qui lui montre une façon de voyager beaucoup plus désinhibée. Mais l’intérêt de CW pour elle va prendre une tournure plus sombre.',NULL,'2WtYeSkiewtNAF3kmybF6rC6NfJ.jpg',NULL,NULL),(72,'Playboy Playmate Workout','1983-01-01','',NULL,'zNvrtwwOB1imM58d1Y4u3TQxKYW.jpg',NULL,NULL),(73,'Madea : Mariage exotique','2025-07-10','Brian et son ex-femme Debrah sont stupéfaits d\'apprendre que leur fille Tiffany est fiancée à un rappeur qu\'elle a rencontré sur un yacht — et que leur mariage a lieu dans deux semaines. Et voici Madea et sa bande parties aux Bahamas, bien décidées à semer le chaos et à s\'amuser !',NULL,'qrFw9QEJkoUb9tSGLx0IAAqp7wS.jpg',NULL,NULL),(74,'Mr Wolff 2','2025-04-23','Christian Wolff est doué pour résoudre les problèmes. Quand une vieille connaissance est tuée en laissant un message énigmatique disant de \"trouver le comptable\", Wolff doit recruter son dangereux frère Brax pour élucider l\'affaire. En partenariat avec la directrice adjointe du Trésor américain, Medina, ils découvrent une conspiration mortelle et deviennent les cibles d\'un réseau de tueurs.',NULL,'kgzWQPNZp3byMamRr6Mm1KdgzUl.jpg',NULL,NULL),(75,'First Shift','2024-08-30','Mike, un inspecteur chevronné de la police de New York, et Angela, une nouvelle recrue, s\'attaquent à une journée pleine d\'enjeux dans les rues les plus difficiles de New York, avec des courses-poursuites pleines d\'adrénaline et des menaces inattendues. Au cœur du chaos, des épreuves intenses tissent des liens indéfectibles.',NULL,'ajsGI4JYaciPIe3gPgiJ3Vw5Vre.jpg',NULL,NULL),(76,'鬼吹灯：献王虫谷','2023-09-22','',NULL,'7Hk1qxAvZi9H9cfBb4iHkoGjapH.jpg',NULL,NULL),(77,'La Nuit des Clowns','2025-05-08','En quête d\'un nouveau départ, Quinn et son père s\'installent dans une petite ville du Midwest. Ils apprennent rapidement que la communauté fracturée traverse une période difficile après la perte d\'une précieuse usine dans un incendie. Alors que les habitants se chamaillent et que la tension monte, un clown sinistre et souriant surgit des champs de maïs pour débarrasser la ville de son fardeau, une victime sanglante à la fois.',NULL,'c54MjZXxOLV7M8GNk8iV22J1235.jpg',NULL,NULL),(78,'Female Teacher, In Front of the Students','1982-04-09','La charmante Reiko a accepté un nouveau poste d\'enseignante dans un vieux lycée effrayant. C\'est une femme extrêmement attirante et les jeunes élèves de sa classe sont tombés amoureux d\'elle. Une nuit, après un entraînement de tennis, elle est brutalement agressée dans la douche du vestiaire par un homme avec un bas sur le visage. Laissée au sol nue et en état de choc, elle découvre une pièce de puzzle laissée par l\'agresseur. Quelques jours plus tard, deux étudiants font subir une vengeance sexuelle perverse sur Reiko pour avoir expulsé quelqu\'un de l\'équipe de tennis. L\'un de ces étudiants pourrait-il être l\'homme qui l\'a brutalisée dans le vestiaire ? A qui appartient l\'étrange pièce du puzzle ? Alors que le mystère se dévoile, Reiko doit accepter ses propres pulsions sexuelles et son destin.',NULL,'rwGW7zhFKaojtJiSMnoLyVkKZnx.jpg',NULL,NULL),(79,'Papa ne comprend pas','2025-07-17','Lors d\'un voyage à Bariloche empreint de chauvinisme et de rivalité, un père brésilien rencontre un adversaire à sa hauteur dans la belle-famille argentine de sa fille.',NULL,'a6FyZJtKF2U8BPGoTvmTjNQ6VaX.jpg',NULL,NULL),(80,'Les Schtroumpfs','2025-07-05','Lorsque le Grand Schtroumpf est mystérieusement kidnappé par les vilains sorciers : Razamel et Gargamel, la Schtroumpfette et son meilleur ami Le Schtroumpf Sans-Nom partent en mission pour le retrouver ! Commence alors une aventure délirante où nos héros bleus vont croiser la route de nouveaux amis hauts en couleur comme Mama Poot et ses petits. Les Schtroumpfs doivent prendre en main leur destin pour sauver celui du monde entier !',NULL,'ex1fEEZMulsJzqijF077J2ICYdR.jpg',NULL,NULL),(81,'Captain America : Brave New World','2025-02-12','Après avoir rencontré le président américain nouvellement élu Thaddeus Ross, Sam se retrouve au milieu d’un incident international. Il doit découvrir la raison derrière un complot mondial infâme avant que le véritable cerveau de l’opération ne fasse voir rouge au monde entier.',NULL,'wDRXmiAEJdhNIcuetM4016fOCx8.jpg',NULL,NULL),(82,'The Gorge','2025-02-13','Deux agents hautement entraînés se rapprochent malgré la distance lorsqu\'ils sont envoyés garder deux côtés opposés d\'une mystérieuse gorge. Quand un mal surgit des profondeurs, ils doivent faire équipe pour survivre à ce qui est tapi sous la surface.',NULL,'1Np511QIqSs0s3iDpWXPbuY4o5o.jpg',NULL,NULL),(83,'Diablo','2025-06-13','Sorti de prison et afin de tenir une promesse, Kris Chaney kidnappe Elisa, la fille d\'un puissant gangster. Son père, Vincent, lance un appel à toute la pègre pour la ramener vivante. El Corvo, un tueur psychopathe, se joint à la chasse à l\'homme.',NULL,'uFQduVyYIinJy3eLjozgfl6Xtcn.jpg',NULL,NULL),(84,'Jurassic World : Le Monde d’après','2022-06-01','Quatre ans après la destruction de Isla Nublar, les dinosaures font désormais partie du quotidien de l’humanité. Maintenant qu’elle doit partager son espace vital avec les créatures les plus féroces que l’histoire ait jamais connues, un fragile équilibre va remettre en question sa domination.',NULL,'lfx3ilYMmvtnsSXikHGoJcSkUTs.jpg',NULL,NULL),(85,'The Net','2024-07-25','Dans une Sardaigne froide et sombre, le crime d\'une très jeune fille cache une réalité choquante.  Sante Moras, un ancien policier devenu gardien de prison, est accusé d\'un meurtre qu\'il n\'a pas commis : un homme, coupable d\'avoir torturé et tué une jeune fille, est retrouvé mort pendant sa garde à vue.  Contraint de fuir et poursuivi par le commissaire Tommaso Lago, Sante décide que la seule façon de se sauver est d\'aller jusqu\'au bout et de chercher la vérité.  Grâce à l\'aide de Fabiana Lai, une journaliste qui suit l\'affaire, il va découvrir des vérités déconcertantes : Sante n\'est pas le seul à être en danger, et il doit agir avant que d\'autres jeunes filles innocentes ne soient tuées.',NULL,'lc59jGDtB8KVnsZk76C7RwZnWkJ.jpg',NULL,NULL),(86,'Sonic 3, le film','2024-12-19','Sonic, Knuckles et Tails sont à nouveau réunis face à un puissant nouvel adversaire, Shadow, un mystérieux vilain doté de pouvoirs comme ils n\'en ont encore jamais vu. Leurs habiletés étant toutes surclassées, l\'Équipe Sonic doit tenter une alliance improbable dans l\'espoir d\'arrêter Shadow et de protéger la planète.',NULL,'gERwLGTa6JGN4qXjkip13eDaxy1.jpg',NULL,NULL),(87,'Blanche Neige','2025-03-12','Furieuse d\'entendre son miroir magique déclarer que sa belle-fille Blanche-Neige la surpasse en beauté, la reine maléfique donne ordre à son chasseur de la tuer, à la faveur d\'une cueillette de pommes dans la forêt près du château. Mais ce dernier, attendri par la bonté naturelle de la jeune princesse, la laisse s’enfuir. Guidée par les animaux de la forêt, celle-ci trouve refuge chez sept nains, qui triment dur dans une mine de diamants. Aux côtés de ceux-ci et de Jonathan, un rebelle à la tête d\'une bande de voleurs fidèles au défunt roi, Blanche-Neige mène la révolte contre sa puissante belle-mère.',NULL,'kpkd46yxRcg4jVIXaIWkBgHwgKm.jpg',NULL,NULL),(88,'À contre-sens 2','2024-12-26','La relation entre Noah et Nick semble plus forte que jamais, malgré la volonté de leurs parents de les séparer. Mais avec son travail et son entrée à la fac, de nouvelles perspectives amoureuses feront trembler les fondations de leur relation et celles des Leister. Si tout le monde est prêt à détruire une relation, aura-t-on droit à une fin heureuse ?',NULL,'bn4qZZO5nSN48D5pXVypf4MF2wg.jpg',NULL,NULL),(89,'Vice-versa 2','2024-06-11','Riley, adolescente depuis peu, au moment où le Quartier Cérébral doit être démoli pour faire place à un événement totalement inattendu : de nouvelles Émotions ! Joie, Tristesse, Colère, Peur et Dégoût, qui ont longtemps su contrôler les choses avec succès, ne savent pas comment réagir à l\'arrivée d\'Anxiété. Et il semblerait qu\'elle ne soit pas seule. Elle est venue accompagnée d\'Embarras, Envie et Ennui.',NULL,'9Jic8z9NEeCEmSJFgFHZF1lWMFo.jpg',NULL,NULL),(90,'Dragons','2010-03-18','L’histoire d’Harold, jeune Viking peu à son aise dans sa tribu où combattre les dragons est le sport national. Sa vie va être bouleversée par sa rencontre avec un dragon qui va peu à peu amener Harold et les siens à voir le monde d’un point de vue totalement différent.',NULL,'a2xXAG8QuFZYt4ElbDrUd0IC3Ge.jpg',NULL,NULL),(91,'Warfare','2025-04-09','2006 pendant la Guerre d’Irak. Un peloton de Navy SEALs américains est en planque dans la maison d’une famille irakienne pour une mission dangereuse à Ramadi. Avec des snipers, les militaires surveillent tous les mouvements de « l’ennemi » dans les moindres détails mais ils ne peuvent empêcher une embuscade. Une pluie de balles va causer de graves blessures et la mission se retrouve complètement bouleversée. Tandis que les militaires mettent tout en œuvre pour sauver les blessés en attendant désespérément d’être secourus, leur situation est de plus en plus désespérée. Combien de temps pourront-ils encore tenir ?',NULL,'yNGwVuIuhTAKIYr3hj0ZzZWknH0.jpg',NULL,NULL),(92,'Deadpool & Wolverine','2024-07-24','Un Wade Wilson désabusé s\'abrutit de travail dans le civil. Sa vie de mercenaire moralement flexible, Deadpool, est derrière lui. Mais quand son monde est menacé d\'anéantissement, il accepte à contrecœur de reprendre le flambeau, et de convaincre un Wolverine non moins contre-cœureux... contre-cordial ? Contre-cardiaque ? Il doit le convaincre de... ah, laisse tomber, va voir le film. Un synopsis, c\'est débile. Mais entends l\'avertissement : des flashs lumineux dans l\'image pourraient affecter les spectateurs photosensibles.',NULL,'hw3Gfp8xLpoVewMbFyFVRsqyGlK.jpg',NULL,NULL),(93,'365 jours : Au lendemain','2022-04-26','On retrouve Laura et Massimo dans une histoire plus torride que jamais. Mais leur nouvelle vie va être chamboulée par les liens familiaux de Massimo et l\'irruption d\'un mystérieux étranger déterminé à conquérir le cœur de Laura et à gagner sa confiance, quel que soit le prix à payer.',NULL,'usZb5iHQLt2JPnynffGPOOnq3t2.jpg',NULL,NULL),(94,'Squid Game : Le making-of de la saison 2','2025-01-02','Des interviews exclusives des acteurs et du réalisateur dévoilent ce qui a donné vie à la saison 2 de la série la plus regardée au monde, des décors à l\'arc narratif des personnages.',NULL,'yQGaui0bQ5Ai3KIFBB45nTeIqad.jpg',NULL,NULL),(95,'Marriage Unplugged','2024-10-28','',NULL,'3H99Wl52sBPRqXZ3LJjgODOLfwX.jpg',NULL,NULL),(96,'Dragons 2','2014-06-05','Tandis qu’Astrid, Rustik et le reste de la bande se défient durant des courses sportives de dragons devenues populaires sur l’île, notre duo désormais inséparable parcourt les cieux, à la découverte de territoires inconnus et de nouveaux mondes. Au cours de l’une de leurs aventures, ils découvrent une grotte secrète qui abrite des centaines de dragons sauvages, dont le mystérieux Dragon Rider. Les deux amis se retrouvent alors au centre d’une lutte visant à maintenir la paix. Harold et Krokmou vont se battre pour défendre leurs valeurs et préserver le destin des hommes et des dragons.',NULL,'q6UtQBNwyfRa5WDQqQOnvwsPOB2.jpg',NULL,NULL),(97,'Sorority','2025-06-20','',NULL,'jm4CYBED9I5e8Cp7zlj8cDifUVB.jpg',NULL,NULL),(98,'Interstellar','2014-11-05','Dans un futur proche, face à une Terre exsangue, un groupe d’explorateurs utilise un vaisseau interstellaire pour franchir un trou de ver permettant de parcourir des distances jusque‐là infranchissables. Leur but : trouver un nouveau foyer pour l’humanité.',NULL,'1pnigkWWy8W032o9TKDneBa3eVK.jpg',NULL,NULL),(99,'Kayara','2025-01-02','Une jeune femme inca rêve de s\'introduire dans le groupe masculin des messagers inca de Chasqui.',NULL,'tpZdjnoJ6Z3NsSxI6HjAIggrcEv.jpg',NULL,NULL),(100,'Moi, moche et méchant 4','2024-06-20','Gru, Lucy et les filles, Margo, Édith et Agnès accueillent le petit dernier de la famille, Gru Junior, qui semble n’avoir qu’une passion : faire tourner son père en bourrique. Mais Gru est confronté à un nouvel ennemi, Maxime Le Mal, qui avec l’aide de sa petite amie, la fatale Valentina, va obliger toute la famille à fuir.',NULL,'bYovCvLV1RxB0zAR5cXu699P9P7.jpg',NULL,NULL),(101,'Deep Cover','2025-06-12','À Londres, trois acteurs spécialisés dans l\'improvisation sont recrutés par la police pour participer à des opérations sous couverture visant à piéger des criminels. Leur capacité à improviser et à rester constamment dans leur personnage les entraîne rapidement dans les profondeurs de la pègre londonienne, les exposant à des situations de plus en plus périlleuses et absurdes. ​',NULL,'8O7Z46oJyOvbeCKn7hw4jcxpen6.jpg',NULL,NULL),(102,'The Roundup: Punishment','2024-04-24','Le détective Ma Seok Do travaille sur une affaire de trafique de drogue impliquant l\'utilisation d\'une application de livraison.  Baek Chang Ki est le nouveau criminel que Ma Seok Do doit arrêter mais celui-ci se trouve aux Philippines et pour couronner le tout, ce dernier a un complice qui est à Séoul.',NULL,'jucHQwnRSma1O9V2bM007e4eSd7.jpg',NULL,NULL),(103,'Vanished Out of Sight','2025-06-19','',NULL,'9pdyAX2AzpbRVptTehqp2UMuMKD.jpg',NULL,NULL),(104,'M3GAN','2022-12-28','M3GAN est une merveille d\'intelligence artificielle, une poupée réaliste qui est programmée pour être la meilleure compagne d\'un enfant et la meilleure alliée d\'un parent. Conçue par Gemma, une brillante roboticienne, M3GAN peut écouter, regarder et apprendre, car elle joue le rôle d\'amie et d\'enseignante, de compagne de jeu et de protectrice.',NULL,'xBl5AGw7HXZcv1nNXPlzGgO4Cfo.jpg',NULL,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_director` (
  `movie_id` int NOT NULL,
  `director_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `IDX_C266487D8F93B6FC` (`movie_id`),
  KEY `IDX_C266487D899FB366` (`director_id`),
  CONSTRAINT `FK_C266487D899FB366` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C266487D8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (1,1),(2,1),(3,2),(3,3),(4,4);
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `IDX_FD1229648F93B6FC` (`movie_id`),
  KEY `IDX_FD1229644296D31F` (`genre_id`),
  CONSTRAINT `FK_FD1229644296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FD1229648F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,2),(1,4),(2,4),(2,5),(3,2),(3,4),(4,2),(4,4);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_account_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `rate` smallint NOT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_794381C68F93B6FC` (`movie_id`),
  KEY `IDX_794381C63C0C9956` (`user_account_id`),
  CONSTRAINT `FK_794381C63C0C9956` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_794381C68F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,1,'test',1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_253B48AEE7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,'admin@test.com','[\"ROLE_ADMIN\"]','$2y$13$WbXeq5.oVs40xjb/zly05.GDrKqXjfSUGPigt3mi6b32oAbfuAVnm','admin');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-25 12:55:15
