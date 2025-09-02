CREATE DATABASE IF NOT EXISTS TP_platforme;
SHOW DATABASES;
USE TP_platforme;

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(150) NOT NULL CHECK (category IN ('Dev','Marketing','Photo','Design','Data')),
    price DECIMAL(8,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed BOOLEAN DEFAULT FALSE,
    completed_at TIMESTAMP DEFAULT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    CONSTRAINT uq_enrollment UNIQUE(user_id, course_id)
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT (500),
    CONSTRAINT fk_user_review FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_course_review FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    CONSTRAINT uq_review UNIQUE(user_id, course_id)
);

-- 1. Script d'insertion des utilisateurs by Petros
INSERT INTO users (name, email) VALUES
('Alice Dupont', 'alice.dupont@example.com'),
('Jean Martin', 'jean.martin@example.com'),
('Sophie Leroy', 'sophie.leroy@example.com'),
('Lucas Bernard', 'lucas.bernard@example.com'),
('Emma Robert', 'emma.robert@example.com'),
('Thomas Petit', 'thomas.petit@example.com'),
('Camille Richard', 'camille.richard@example.com'),
('Hugo Garcia', 'hugo.garcia@example.com'),
('Chloé Moreau', 'chloe.moreau@example.com'),
('Nicolas Laurent', 'nicolas.laurent@example.com'),
('Manon Simon', 'manon.simon@example.com'),
('Antoine Michel', 'antoine.michel@example.com'),
('Léa Dubois', 'lea.dubois@example.com'),
('Julien Fontaine', 'julien.fontaine@example.com'),
('Clara Rousseau', 'clara.rousseau@example.com'),
('Matthieu Blanc', 'matthieu.blanc@example.com'),
('Pauline Faure', 'pauline.faure@example.com'),
('Adrien Lopez', 'adrien.lopez@example.com'),
('Mélanie David', 'melanie.david@example.com'),
('Victor Lefevre', 'victor.lefevre@example.com');

INSERT INTO courses (title, category, price) VALUES
('HTML & CSS pour débutants', 'Dev', 149.99),
('Introduction à JavaScript', 'Dev', 149.99),
('SQL pour débutants', 'Dev', 149.99),
('Python pour la Data Science', 'Dev', 149.99),
('UI-UX Design', 'Design', 185),
('Photoshop avancé', 'Design', 250),
('Excel', 'Data', 249.99),
('PowerPoint efficace', 'Design', 250),
('Marketing Digital', 'Marketing', 149.99),
('Google Analytics', 'Marketing', 449.90),
('Retouche photo', 'Photo', 185),
('BeeKeeper', 'Data', 250),
('Cybersécurité pour débutants', 'Dev', 185),
('Gestion de projet Figma', 'Design', 149.99),
('Shooting de paysage', 'Photo', 185);

INSERT INTO enrollments (user_id, course_id, enrolled_at, completed, completed_at)
VALUES
    (14, 6, '2025-06-10 00:00:00', TRUE, '2025-06-15 00:00:00'),
    (16, 5, '2024-11-19 00:00:00', FALSE, NULL),
    (9, 3, '2025-08-31 00:00:00', FALSE, NULL),
    (10, 4, '2025-08-18 00:00:00', FALSE, NULL),
    (16, 4, '2025-03-19 00:00:00', FALSE, NULL),
    (15, 7, '2025-04-18 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (9, 8, '2024-11-04 00:00:00', TRUE, '2025-01-10 00:00:00'),
    (18, 11, '2025-08-19 00:00:00', FALSE, NULL),
    (3, 7, '2025-01-19 00:00:00', FALSE, NULL),
    (14, 10, '2025-05-27 00:00:00', TRUE, '2025-06-30 00:00:00'),
    (4, 15, '2025-01-20 00:00:00', FALSE, NULL),
    (7, 10, '2025-02-07 00:00:00', TRUE, '2025-04-10 00:00:00'),
    (6, 10, '2025-04-10 00:00:00', TRUE, '2025-06-20 00:00:00'),
    (8, 15, '2024-10-28 00:00:00', TRUE, '2024-12-10 00:00:00'),
    (15, 11, '2025-08-27 00:00:00', FALSE, NULL),
    (4, 3, '2024-09-19 00:00:00', FALSE, NULL),
    (11, 7, '2024-10-09 00:00:00', FALSE, NULL),
    (4, 4, '2024-11-21 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (10, 13, '2025-07-15 00:00:00', TRUE, '2025-08-10 00:00:00'),
    (20, 7, '2024-09-12 00:00:00', TRUE, '2025-02-10 00:00:00'),
    (7, 4, '2024-10-25 00:00:00', FALSE, NULL),
    (4, 6, '2024-10-03 00:00:00', FALSE, NULL),
    (10, 8, '2024-10-08 00:00:00', FALSE, NULL),
    (14, 2, '2025-01-16 00:00:00', TRUE, '2025-05-10 00:00:00'),
    (13, 11, '2025-03-26 00:00:00', TRUE, '2025-06-21 00:00:00'),
    (12, 10, '2025-08-11 00:00:00', TRUE, '2025-07-10 00:00:00'),
    (17, 9, '2025-07-21 00:00:00', TRUE, '2025-09-01 00:00:00'),
    (13, 7, '2025-03-25 00:00:00', FALSE, NULL),
    (7, 6, '2024-10-25 00:00:00', FALSE, NULL),
    (16, 14, '2025-07-08 00:00:00', FALSE, NULL),
    (9, 6, '2025-04-12 00:00:00', FALSE, NULL),
    (1, 12, '2025-03-11 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (3, 6, '2025-03-15 00:00:00', FALSE, NULL),
    (16, 2, '2024-11-26 00:00:00', TRUE, '2025-01-10 00:00:00'),
    (12, 12, '2025-05-16 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (13, 1, '2025-01-11 00:00:00', FALSE, NULL),
    (2, 5, '2025-05-10 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (5, 4, '2024-12-08 00:00:00', TRUE, '2025-01-10 00:00:00'),
    (4, 14, '2025-02-12 00:00:00', FALSE, NULL),
    (10, 2, '2025-01-26 00:00:00', FALSE, NULL),
    (9, 15, '2025-04-07 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (14, 14, '2024-11-27 00:00:00', FALSE, NULL),
    (18, 10, '2025-05-28 00:00:00', FALSE, NULL),
    (17, 8, '2025-07-20 00:00:00', TRUE, '2025-06-10 00:00:00'),
    (12, 1, '2025-03-31 00:00:00', FALSE, NULL),
    (6, 8, '2025-01-14 00:00:00', TRUE, '2025-04-10 00:00:00'),
    (4, 10, '2024-10-11 00:00:00', FALSE, NULL),
    (8, 3, '2024-09-28 00:00:00', FALSE, NULL),
    (1, 4, '2025-05-11 00:00:00', FALSE, NULL),
    (16, 7, '2025-01-09 00:00:00', TRUE, '2025-05-10 00:00:00');

    INSERT INTO reviews (user_id, course_id, rating, comment) VALUES
-- Notes excellentes (5)
(1, 1, 5, 'Ce cours est une pépite ! J’ai tout compris, même les trucs compliqués. Merci ! Je vais enfin pouvoir impressionner ma belle-mère.'),
(6, 2, 5, 'Si ce cours était un film, ce serait un Oscar. Si c’était un repas, ce serait un 3 étoiles. Bref, c’est du grand art.'),
(11, 3, 5, 'Presque parfait ! J’ai failli pleurer de joie en voyant mes progrès. Juste un détail : le prof a une voix un peu trop enjouée à 6h du matin.'),
(16, 4, 5, 'Très bon cours ! J’ai enfin compris pourquoi j’avais payé. Maintenant, je peux dire que mon argent n’a pas été volé, mais investi.'),

-- Notes bonnes (4)
(2, 1, 4, 'Super cours ! J’ai presque l’impression d’être devenu un expert… ou presque. En tout cas, j’ai appris des trucs.'),
(7, 2, 4, 'J’ai adoré ! Le seul problème, c’est que maintenant je veux suivre tous les cours de ce prof. Mon portefeuille va pleurer.'),
(12, 3, 4, 'Très bon cours, j’ai adoré les exemples concrets ! Par contre, la partie sur les exercices pratiques m’a fait pleurer. Mais dans le bon sens.'),
(17, 4, 4, 'Sympa ! J’ai appris des choses, mais il manque un chapitre sur "comment ne pas procrastiner avant de commencer le cours".'),

-- Notes moyennes (3)
(3, 1, 3, 'Pas mal ! J’ai au moins réussi à ne pas m’endormir. Mais je ne suis pas sûr d’avoir tout retenu. Peut-être que je devrais le refaire… ou pas.'),
(8, 2, 3, 'C’était… un cours. Ni génial, ni catastrophique. Comme un café moyen : ça réveille, mais pas assez.'),
(13, 3, 3, 'Le cours est bien, mais j’ai l’impression que le prof a oublié de mentionner quelques détails importants. Ou alors c’est moi qui ai zappé.'),
(18, 4, 3, 'Moyen. J’ai appris des trucs, mais j’ai aussi passé 2 heures à chercher comment télécharger les ressources. Spoiler : c’était écrit en petit.'),

-- Notes mauvaises (2)
(4, 1, 2, 'Bof… J’ai cru que ce serait plus captivant. Dommage. J’ai l’impression d’avoir regardé une vidéo YouTube en 2x.'),
(9, 2, 2, 'Le cours est aussi passionnant qu’un manuel d’instructions pour un grille-pain. Et encore, le grille-pain, au moins, il grille.'),
(14, 3, 2, 'J’ai appris une chose : je déteste ce sujet. Merci pour la révélation.'),
(19, 4, 2, 'J’ai payé pour ça ? Sérieusement ? J’aurais dû acheter un livre à la place. Au moins, je pourrais l’utiliser comme presse-papier.'),

-- Notes catastrophiques (1)
(5, 1, 1, 'Je veux un remboursement. Sérieusement. J’ai appris plus de choses en regardant des vidéos TikTok.'),
(10, 2, 1, 'Ce cours est une arnaque. Le seul truc que j’ai appris, c’est à ne plus jamais acheter de cours en ligne.'),
(15, 3, 1, 'J’ai cru que c’était un cours, mais en fait c’est une punition déguisée. Merci pour le traumatisme.'),
(20, 4, 1, 'Si je pouvais donner une note négative, je le ferais. Ce cours est une insulte à l’intelligence humaine.');

select c.category, COUNT(c.category) as 'nombre de cours par category' from courses as c
GROUP BY c.category;
select avg(c.price) as 'moyenne_tarif',c.category from courses as c 
group by c.category;

select c.category, max(c.price) as 'cours le plus cher' FROM courses as c
GROUP BY c.category
ORDER BY max(c.price) DESC;

SELECT c.title, COUNT(e.course_id) AS 'nombre d\'inscriptions' FROM enrollments AS e
join courses AS c ON c.id = e.course_id 
GROUP BY e.course_id
ORDER BY COUNT(e.course_id) DESC;










