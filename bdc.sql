CREATE TABLE `deals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bdcid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT 'UNDEFINED',
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `state` enum('devis','commande','paiement') COLLATE latin1_general_ci NOT NULL DEFAULT 'devis',
  `creator` int(11) NOT NULL,
  `validator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bdcid` (`bdcid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `devis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `issuer` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `date_proceed` datetime DEFAULT NULL,
  `state` enum('pending','accepted','refused') COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `factures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `issuer` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `date_proceed` datetime DEFAULT NULL,
  `state` enum('pending','payed','refused') COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `fullname` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
