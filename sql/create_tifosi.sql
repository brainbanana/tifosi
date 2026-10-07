-- Création de la base de données Tifosi

CREATE DATABASE IF NOT EXISTS tifosi
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tifosi;

-- Suppression des tables si elles existent déjà
-- Les tables d'association sont supprimées en premier
-- afin de respecter les contraintes de clés étrangères.

DROP TABLE IF EXISTS paye;
DROP TABLE IF EXISTS contient;
DROP TABLE IF EXISTS comprend;
DROP TABLE IF EXISTS achete;

DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS client;

-- Création de la table client

CREATE TABLE client (
    id_client INT AUTO_INCREMENT,
    nom_client VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    cp_client VARCHAR(5) NOT NULL,
    PRIMARY KEY (id_client)
) ENGINE=InnoDB;

-- Création de la table focaccia

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT,
    nom_focaccia VARCHAR(45) NOT NULL,
    prix_focaccia DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id_focaccia)
) ENGINE=InnoDB;

-- Création de la table ingredient

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT,
    nom_ingredient VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_ingredient)
) ENGINE=InnoDB;

-- Création de la table marque

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT,
    nom_marque VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_marque)
) ENGINE=InnoDB;

-- Création de la table boisson

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT,
    nom_boisson VARCHAR(45) NOT NULL,
    id_marque INT NOT NULL,
    PRIMARY KEY (id_boisson),
    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
) ENGINE=InnoDB;

-- Création de la table menu

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT,
    nom_menu VARCHAR(45) NOT NULL,
    prix_menu DECIMAL(6,2) NOT NULL,
    id_focaccia INT NOT NULL,
    PRIMARY KEY (id_menu),
    CONSTRAINT fk_menu_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;


-- Création de la table d'association achete

CREATE TABLE achete (
    id_client INT NOT NULL,
    id_focaccia INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_focaccia, jour),
    CONSTRAINT fk_achete_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client),
    CONSTRAINT fk_achete_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;


-- Création de la table d'association comprend

CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprend_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_comprend_ingredient
        FOREIGN KEY (id_ingredient)
        REFERENCES ingredient(id_ingredient)
) ENGINE=InnoDB;


-- Création de la table d'association contient

CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu),
    CONSTRAINT fk_contient_boisson
        FOREIGN KEY (id_boisson)
        REFERENCES boisson(id_boisson)
) ENGINE=InnoDB;


-- Création de la table d'association paye

CREATE TABLE paye (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, jour),
    CONSTRAINT fk_paye_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client),
    CONSTRAINT fk_paye_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
) ENGINE=InnoDB;