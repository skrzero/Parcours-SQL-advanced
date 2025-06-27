CREATE DATABASE IF NOT EXISTS gameworld;
USE gameworld;

-- Nettoyage préalable
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS membres_equipes;
DROP TABLE IF EXISTS equipes;
DROP TABLE IF EXISTS joueurs;
DROP TABLE IF EXISTS jeux;
DROP TABLE IF EXISTS genres;

-- Genres de jeux
CREATE TABLE genres (
  id INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL
);

INSERT INTO genres (id, nom) VALUES
(1, 'FPS'),
(2, 'RPG'),
(3, 'Stratégie'),
(4, 'Plateforme');

-- Jeux
CREATE TABLE jeux (
  id INT PRIMARY KEY,
  titre VARCHAR(100) NOT NULL,
  annee_sortie INT NOT NULL,
  id_genre INT,
  FOREIGN KEY (id_genre) REFERENCES genres(id)
);

INSERT INTO jeux (id, titre, annee_sortie, id_genre) VALUES
(1, 'Warzone 3000', 2021, 1),
(2, 'Elven Quest', 2019, 2),
(3, 'Galaxy Tactics', 2020, 3),
(4, 'JumpMaster', 2018, 4),
(5, 'CyberStrike', 2022, 1),
(6, 'Dungeon Souls', 2020, 2),
(7, 'Battle Chess', 2023, 3),
(8, 'Sky Jumper', 2017, 4);

-- Joueurs
CREATE TABLE joueurs (
  id INT PRIMARY KEY,
  pseudo VARCHAR(50) NOT NULL,
  pays VARCHAR(50)
);

INSERT INTO joueurs (id, pseudo, pays) VALUES
(1, 'ShadowKiller', 'France'),
(2, 'Elfae', 'Canada'),
(3, 'NoobMaster69', 'USA'),
(4, 'Z3r0Cool', 'Allemagne'),
(5, 'PixelPro', 'France'),
(6, 'MissClick', 'Espagne'),
(7, 'LagWizard', 'Italie'),
(8, 'Headshotz', 'France'),
(9, 'ManaQueen', 'Brésil'),
(10, 'StunLock', 'France'),
(11, 'AltF4', 'Belgique'),
(12, 'AFKLord', 'Suède');

-- Equipes
CREATE TABLE equipes (
  id INT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL
);

INSERT INTO equipes (id, nom) VALUES
(1, 'RedDragons'),
(2, 'NightOwls'),
(3, 'SoloSquad');

-- Membres d’équipes
CREATE TABLE membres_equipes (
  id_equipe INT,
  id_joueur INT,
  PRIMARY KEY (id_equipe, id_joueur),
  FOREIGN KEY (id_equipe) REFERENCES equipes(id),
  FOREIGN KEY (id_joueur) REFERENCES joueurs(id)
);

INSERT INTO membres_equipes (id_equipe, id_joueur) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 8),
(3, 5),
(3, 6);

-- Sessions
CREATE TABLE sessions (
  id INT PRIMARY KEY,
  id_jeu INT,
  date_session DATE,
  FOREIGN KEY (id_jeu) REFERENCES jeux(id)
);

INSERT INTO sessions (id, id_jeu, date_session) VALUES
(1, 1, '2024-01-10'),
(2, 1, '2024-02-15'),
(3, 2, '2024-01-20'),
(4, 3, '2024-03-12'),
(5, 4, '2024-01-28'),
(6, 5, '2024-04-03'),
(7, 6, '2024-04-15'),
(8, 7, '2024-05-01'),
(9, 8, '2024-05-10'),
(10, 2, '2024-05-20'),
(11, 3, '2024-06-01'),
(12, 5, '2024-06-10');

-- Scores
CREATE TABLE scores (
  id_session INT,
  id_joueur INT,
  score INT,
  PRIMARY KEY (id_session, id_joueur),
  FOREIGN KEY (id_session) REFERENCES sessions(id),
  FOREIGN KEY (id_joueur) REFERENCES joueurs(id)
);

INSERT INTO scores (id_session, id_joueur, score) VALUES
(1, 1, 1200),
(1, 2, 950),
(2, 1, 1300),
(2, 3, 800),
(3, 2, 1500),
(3, 4, 1100),
(4, 3, 1250),
(4, 5, 1400),
(5, 6, 1600),
(6, 1, 1550),
(6, 7, 1333),
(6, 8, 999),
(7, 2, 1432),
(7, 5, 1200),
(7, 10, 800),
(8, 9, 1450),
(8, 3, 1220),
(9, 6, 1100),
(9, 11, 920),
(10, 2, 1490),
(10, 1, 1350),
(10, 12, 1050),
(11, 4, 870),
(11, 5, 900),
(11, 8, 1240),
(12, 1, 1600),
(12, 2, 1200),
(12, 7, 1100),
(12, 9, 1170),
(12, 10, 1250);
