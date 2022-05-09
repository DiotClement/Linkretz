
CREATE DATABASE bd_gesagence_slam;
USE bd_gesagence_slam;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_gesagence_slam`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande_info`
--

DROP TABLE IF EXISTS `demande_info`;
CREATE TABLE IF NOT EXISTS `demande_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rencontre` char(1) DEFAULT NULL,
  `remarque` varchar(120) DEFAULT NULL,
  `id_origine` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Demande_info_id_origine` (`id_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demande_info`
--

INSERT INTO `demande_info` (`id`, `nom`, `email`, `telephone`, `date`, `rencontre`, `remarque`, `id_origine`) VALUES
(1, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(2, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(3, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(4, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(5, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(6, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(7, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(8, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(9, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(10, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(11, 'joel', 'joel@gmail.com', '0145879632', '2021-02-12', 'O', 'je ', 3),
(12, 'f', 's', '0685748574', '2006-03-30', 'N', 'yo', 2);

-- --------------------------------------------------------

--
-- Structure de la table `demande_info_loisir`
--

DROP TABLE IF EXISTS `demande_info_loisir`;
CREATE TABLE IF NOT EXISTS `demande_info_loisir` (
  `id_Demande_info` int(11) NOT NULL,
  `id_loisir` int(11) NOT NULL,
  PRIMARY KEY (`id_Demande_info`,`id_loisir`),
  KEY `FK_demande_info_loisir_id_loisir` (`id_loisir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demande_info_loisir`
--

INSERT INTO `demande_info_loisir` (`id_Demande_info`, `id_loisir`) VALUES
(11, 102);

-- --------------------------------------------------------

--
-- Structure de la table `demande_info_mode_contact`
--

DROP TABLE IF EXISTS `demande_info_mode_contact`;
CREATE TABLE IF NOT EXISTS `demande_info_mode_contact` (
  `id_Demande_info` int(11) NOT NULL,
  `id_mode_contact` int(11) NOT NULL,
  PRIMARY KEY (`id_Demande_info`,`id_mode_contact`),
  KEY `FK_demande_info_mode_contact_id_mode_contact` (`id_mode_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `idfonction` int(11) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `profil` varchar(50) NOT NULL,
  `identifiant` varchar(150) NOT NULL,
  `mot_de_passe` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employe_idfonction` (`idfonction`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `idfonction`, `telephone`, `profil`, `identifiant`, `mot_de_passe`) VALUES
(5, 'Mjouid', 'Perrine', 1, '+33617736680', '', '', ''),
(6, 'Foulinos', 'Romain', 2, '+33665432700', '', '', ''),
(7, 'Lebos', 'Agnès', 3, '+33730734545', '', '', ''),
(8, 'Pratt', 'Gary', 3, '+33633224521', '', '', ''),
(14, 'Gobert', 'Jean', 1, '0145789650', 'employe', 'gobertj', 'cd300ccee3f30660df33e000958cc3f55af1aa38');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `libelle`) VALUES
(1, 'Responsable de l\'agence'),
(2, 'Comptable'),
(3, 'Commercial');

-- --------------------------------------------------------

--
-- Structure de la table `horaire_ouverture`
--

DROP TABLE IF EXISTS `horaire_ouverture`;
CREATE TABLE IF NOT EXISTS `horaire_ouverture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jour` varchar(30) DEFAULT NULL,
  `matin` varchar(30) DEFAULT NULL,
  `apres_midi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `horaire_ouverture`
--

INSERT INTO `horaire_ouverture` (`id`, `jour`, `matin`, `apres_midi`) VALUES
(1, 'Lundi', '10h30 à 12h30', '14h00 à 18h30'),
(2, 'Mardi', '8h30 à 12h30', '14h00 à 18h30'),
(3, 'Mercredi', '10h30 à 12h30', '13h30 à 20h00'),
(4, 'Jeudi', '10h30 à 12h30', '13h30 à 19h00'),
(5, 'Vendredi', '9h00 à 12h30', '13h30 à 20h00'),
(6, 'Samedi', '9h00 à 12h30', '13h30 à 20h00');

-- --------------------------------------------------------

--
-- Structure de la table `loisir`
--

DROP TABLE IF EXISTS `loisir`;
CREATE TABLE IF NOT EXISTS `loisir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `loisir`
--

INSERT INTO `loisir` (`id`, `libelle`) VALUES
(10, '102'),
(11, '102'),
(101, 'cyclisme'),
(102, 'alpinisme'),
(103, 'équitation'),
(104, 'sports de combat'),
(105, 'lecture');

-- --------------------------------------------------------

--
-- Structure de la table `mode_contact`
--

DROP TABLE IF EXISTS `mode_contact`;
CREATE TABLE IF NOT EXISTS `mode_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mode_contact`
--

INSERT INTO `mode_contact` (`id`, `libelle`) VALUES
(1, 'recevoir la newsletter de Linkretz'),
(2, 'être rappelé(e)'),
(3, 'obtenir un rendez-vous');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

DROP TABLE IF EXISTS `origine`;
CREATE TABLE IF NOT EXISTS `origine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id`, `libelle`) VALUES
(1, 'En surfant sur Internet'),
(2, 'Par un ami'),
(3, 'Par un autre site'),
(4, 'Par hasard'),
(5, 'autrement');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id`, `libelle`) VALUES
(1, 'Séjours scandinaves'),
(2, 'Séjours en Asie'),
(3, 'Séjours dans le bassin méditerranéen'),
(4, 'Séjours en Italie');

-- --------------------------------------------------------

--
-- Structure de la table `tour_operateur`
--

DROP TABLE IF EXISTS `tour_operateur`;
CREATE TABLE IF NOT EXISTS `tour_operateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_immat` varchar(11) NOT NULL,
  `nom` varchar(75) NOT NULL,
  `description` varchar(400) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_specialite` (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tour_operateur`
--

INSERT INTO `tour_operateur` (`id`, `num_immat`, `nom`, `description`, `id_specialite`) VALUES
(1, 'M2356437843', 'Benett Voyages', 'Spécialiste des séjours scandinaves (Suède, Finlande, Laponie...), Benett Voyages a pour but de partager sa passion des cultures nordiques. Pour cela, le tour opérateur propose un large choix de circuits, de croisières, de séjours ou encore de week-ends.', 1),
(2, 'M2353447820', 'Climats du Monde', 'Spécialiste de l\'Asie, le voyagiste Climats du Monde offre une large gamme de circuits et de séjours aux meilleurs tarifs, ainsi que de nombreux voyages thématiques (sport, culture, zen). Avec Climats du Monde, la Thaïlande, le Vietnam ou encore le Népal sont à portée de main.', 2),
(3, 'M2311117866', 'Donatello', 'Spécialiste de l\'Italie, le voyagiste Donatello propose un large choix de séjours, de week-ends, de circuits ou de voyages personnalisés vers de nombreuses destinations, à l\'instar de l\'Italie et ses îles la Sicile et la Sardaigne, mais aussi le Portugal, Malte ou encore le Kenya.', 4),
(4, 'M2312232211', 'Visiteurs en Asie', 'Avec des destinations phares comme la Thaïlande, l\'Indonésie ou encore le Vietnam, Visiteurs en Asie permet de voyager vers plus de 30 destinations. Sélectionnés avec soin, les séjours et circuits de Visiteurs en Asie répondent aux attentes des voyageurs.', 2),
(5, 'M2356227844', 'Marmara', 'Spécialiste des voyages dans le bassin méditerranéen, Marmara propose à ses clients une large gamme de circuits, de séjours et de croisières et à la particularité de posséder plusieurs clubs. Parmi ses destinations phares citons la Grèce, la Turquie ou encore l\'Egypte.', 3),
(6, 'M2356000860', 'Italowcost', 'Leader des courts séjours à prix dégriffés vers l\'Italie, et plus précisément vers Venise, Italowcost propose des prestations tout compris vers Venise, Rome et Prague. Italowcost est la marque de référence pour les séjours en logement 3 ou 4 étoiles à bas prix en Italie.', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande_info`
--
ALTER TABLE `demande_info`
  ADD CONSTRAINT `FK_Demande_info_id_origine` FOREIGN KEY (`id_origine`) REFERENCES `origine` (`id`);

--
-- Contraintes pour la table `demande_info_loisir`
--
ALTER TABLE `demande_info_loisir`
  ADD CONSTRAINT `FK_demande_info_loisir_id_demande_info` FOREIGN KEY (`id_Demande_info`) REFERENCES `demande_info` (`id`),
  ADD CONSTRAINT `FK_demande_info_loisir_id_loisir` FOREIGN KEY (`id_loisir`) REFERENCES `loisir` (`id`);

--
-- Contraintes pour la table `demande_info_mode_contact`
--
ALTER TABLE `demande_info_mode_contact`
  ADD CONSTRAINT `FK_demande_info_mode_contact_id_demande_info` FOREIGN KEY (`id_Demande_info`) REFERENCES `demande_info` (`id`),
  ADD CONSTRAINT `FK_demande_info_mode_contact_id_mode_contact` FOREIGN KEY (`id_mode_contact`) REFERENCES `mode_contact` (`id`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `FK_employe_idfonction` FOREIGN KEY (`idfonction`) REFERENCES `fonction` (`id`);

--
-- Contraintes pour la table `tour_operateur`
--
ALTER TABLE `tour_operateur`
  ADD CONSTRAINT `FK_id_specialite` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
