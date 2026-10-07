# Tifosi - Base de données MySQL

## Présentation

Ce projet a été réalisé dans le cadre de ma formation de Développeur Web et Web Mobile.

L'objectif est de concevoir une base de données MySQL pour **Tifosi**, un restaurant de street-food italien.

La base de données permet de gérer notamment :

- les clients ;
- les focaccias ;
- les ingrédients ;
- les boissons ;
- les marques ;
- les menus ;
- les achats des clients ;
- les différentes relations entre ces données.

## Technologies utilisées

- MySQL 8.4
- phpMyAdmin
- WampServer
- SQL
- Visual Studio Code
- PowerShell

## Structure du projet

```text
tifosi/
├── README.md
└── sql/
    ├── create_tifosi.sql
    ├── insert_test_data.sql
    └── backup_tifosi.sql
```

## Description des scripts SQL

### `create_tifosi.sql`

Ce script permet de créer la base de données `tifosi` ainsi que sa structure.

La base contient 10 tables :

- `client`
- `focaccia`
- `ingredient`
- `marque`
- `boisson`
- `menu`
- `achete`
- `comprend`
- `contient`
- `paye`

Les clés primaires et les clés étrangères permettent de garantir les relations entre les différentes tables.

### `insert_test_data.sql`

Ce script permet d'insérer les données de test dans la base.

Les données concernant les focaccias, ingrédients, marques et boissons proviennent des fichiers Excel fournis avec le sujet.

Des données complémentaires ont été créées pour les clients, les menus et les tables d'association afin de pouvoir tester l'ensemble des relations de la base.

L'ingrédient `Mozarella` a également été ajouté car il est utilisé dans les données des focaccias mais absent du fichier des ingrédients fourni.

### `backup_tifosi.sql`

Ce fichier contient une sauvegarde complète de la base de données `tifosi`.

Il a été généré avec l'utilitaire `mysqldump` de MySQL.

Le backup contient :

- la structure des 10 tables ;
- les clés et contraintes ;
- les données présentes dans les tables.

## Prérequis

Pour utiliser le projet en local, il est nécessaire de disposer de :

- MySQL ;
- phpMyAdmin ou d'un autre client MySQL ;
- un serveur MySQL local, par exemple avec WampServer.

## Installation de la base de données

### 1. Créer la structure

Exécuter en premier :

```text
sql/create_tifosi.sql
```

Ce script crée la base `tifosi` et ses tables.

### 2. Insérer les données de test

Exécuter ensuite :

```text
sql/insert_test_data.sql
```

Ce script alimente les différentes tables avec les données nécessaires aux tests.

### 3. Sauvegarde de la base

Le fichier :

```text
sql/backup_tifosi.sql
```

correspond à une sauvegarde complète de la base après insertion des données.

Il peut notamment être utilisé pour restaurer directement la base dans un environnement MySQL.

## Ordre d'exécution

Pour reconstruire la base à partir des scripts de développement :

```text
1. create_tifosi.sql
2. insert_test_data.sql
```

Le fichier `backup_tifosi.sql` constitue une sauvegarde complète et représente une méthode alternative de restauration.

Il ne doit donc pas être exécuté après les deux scripts précédents sur une base déjà remplie.

## Utilisateur MySQL

La base de données est accessible localement avec l'utilisateur :

```text
tifosi
```

Cet utilisateur possède les droits nécessaires à l'administration de la base de données `tifosi`.

Pour des raisons de sécurité, aucun mot de passe n'est stocké dans ce repository.

## Vérification

Des requêtes SQL utilisant des `JOIN` ont été exécutées afin de vérifier le fonctionnement des relations entre les tables.

Les tests ont notamment permis de récupérer :

- les ingrédients composant une focaccia ;
- la marque associée à chaque boisson ;
- la focaccia associée à chaque menu ;
- les menus achetés par les clients ainsi que leurs boissons et leurs marques.

## Sauvegarde

La sauvegarde a été générée avec `mysqldump` en utilisant l'option `--no-tablespaces`.

Exemple :

```powershell
mysqldump -u tifosi -p --no-tablespaces --databases tifosi --result-file="backup_tifosi.sql"
```

Le mot de passe est demandé directement par MySQL et n'est pas inscrit dans la commande.

## Auteur

Projet réalisé dans le cadre de la préparation au titre professionnel **Développeur Web et Web Mobile (DWWM)**.