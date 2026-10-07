-- Données de test de la base Tifosi

USE tifosi;


-- Insertion des ingrédients
-- Les ingrédients 1 à 24 proviennent de ingredient.xlsx.
-- Mozarella (id 25) est ajoutée car elle est utilisée dans
-- focaccia.xlsx mais absente de ingredient.xlsx.

INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES  
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- Insertion des marques

INSERT INTO marque (id_marque, nom_marque) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- Insertion des focaccias

INSERT INTO focaccia (id_focaccia, nom_focaccia, prix_focaccia) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);


-- Insertion des boissons

INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- =========================================================
-- Données de test complémentaires
-- Ces données ne sont pas fournies dans les fichiers Excel.
-- Elles sont créées afin de tester les relations de la base.
-- =========================================================

-- Insertion des clients

INSERT INTO client (id_client, nom_client, age, cp_client) VALUES
(1, 'Dupont', 28, '75001'),
(2, 'Martin', 35, '69002'),
(3, 'Bernard', 42, '13001'),
(4, 'Petit', 23, '31000'),
(5, 'Robert', 31, '06000');


-- Insertion des menus

INSERT INTO menu (id_menu, nom_menu, prix_menu, id_focaccia) VALUES
(1, 'Menu Mozaccia', 13.90, 1),
(2, 'Menu Gorgonzollaccia', 14.90, 2),
(3, 'Menu Raclaccia', 12.90, 3),
(4, 'Menu Tradizione', 12.90, 5),
(5, 'Menu Paysanne', 16.90, 8);


-- Association des focaccias avec leurs ingrédients

INSERT INTO comprend (id_focaccia, id_ingredient) VALUES

-- Mozaccia
(1, 5),   -- Base Tomate
(1, 25),  -- Mozarella
(1, 9),   -- Cresson
(1, 13),  -- Jambon fumé
(1, 1),   -- Ail
(1, 3),   -- Artichaut
(1, 7),   -- Champignon
(1, 18),  -- Parmesan
(1, 20),  -- Poivre
(1, 16),  -- Olive noire

-- Gorgonzollaccia
(2, 5),   -- Base Tomate
(2, 11),  -- Gorgonzola
(2, 9),   -- Cresson
(2, 1),   -- Ail
(2, 7),   -- Champignon
(2, 18),  -- Parmesan
(2, 20),  -- Poivre
(2, 16),  -- Olive noire

-- Raclaccia
(3, 5),   -- Base Tomate
(3, 22),  -- Raclette
(3, 9),   -- Cresson
(3, 1),   -- Ail
(3, 7),   -- Champignon
(3, 18),  -- Parmesan
(3, 20),  -- Poivre

-- Emmentalaccia
(4, 6),   -- Base crème
(4, 10),  -- Emmental
(4, 9),   -- Cresson
(4, 7),   -- Champignon
(4, 18),  -- Parmesan
(4, 20),  -- Poivre
(4, 15),  -- Oignon

-- Tradizione
(5, 5),   -- Base Tomate
(5, 25),  -- Mozarella
(5, 9),   -- Cresson
(5, 12),  -- Jambon cuit
(5, 7),   -- Champignon
(5, 18),  -- Parmesan
(5, 20),  -- Poivre
(5, 16),  -- Olive noire
(5, 17),  -- Olive verte

-- Hawaienne
(6, 5),   -- Base Tomate
(6, 25),  -- Mozarella
(6, 9),   -- Cresson
(6, 4),   -- Bacon
(6, 2),   -- Ananas
(6, 19),  -- Piment
(6, 18),  -- Parmesan
(6, 20),  -- Poivre
(6, 16),  -- Olive noire

-- Américaine
(7, 5),   -- Base Tomate
(7, 25),  -- Mozarella
(7, 9),   -- Cresson
(7, 4),   -- Bacon
(7, 21),  -- Pomme de terre
(7, 18),  -- Parmesan
(7, 20),  -- Poivre
(7, 16),  -- Olive noire

-- Paysanne
(8, 6),   -- Base crème
(8, 8),   -- Chevre
(8, 9),   -- Cresson
(8, 21),  -- Pomme de terre
(8, 13),  -- Jambon fumé
(8, 1),   -- Ail
(8, 3),   -- Artichaut
(8, 7),   -- Champignon
(8, 18),  -- Parmesan
(8, 20),  -- Poivre
(8, 16),  -- Olive noire
(8, 14);  -- Oeuf


-- Association des menus avec les boissons

INSERT INTO contient (id_menu, id_boisson) VALUES
(1, 1),
(1, 12),
(2, 2),
(2, 10),
(3, 6),
(3, 12),
(4, 4),
(4, 9),
(5, 7),
(5, 11);


-- Achats de focaccias par les clients

INSERT INTO achete (id_client, id_focaccia, jour) VALUES
(1, 1, '2026-09-01'),
(1, 5, '2026-09-15'),
(2, 2, '2026-09-03'),
(2, 7, '2026-09-20'),
(3, 3, '2026-09-05'),
(3, 8, '2026-09-22'),
(4, 4, '2026-09-10'),
(5, 6, '2026-09-12');


-- Paiement des menus par les clients

INSERT INTO paye (id_client, id_menu, jour) VALUES
(1, 1, '2026-09-02'),
(1, 4, '2026-09-18'),
(2, 2, '2026-09-06'),
(3, 5, '2026-09-11'),
(4, 3, '2026-09-16'),
(5, 1, '2026-09-25');