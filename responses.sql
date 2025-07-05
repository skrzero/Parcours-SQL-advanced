-- exo 1
select s.score,s.id_session,j.pseudo from scores as s
join joueurs as j
on j.id = s.id_joueur
where s.id_session = 12;

-- exo 2
select j.* from joueurs as j
left join scores as s 
on j.id = s.id_joueur
where s.id_joueur IS NULL;

-- exo 3
select j.titre,j.id_genre,g.nom from jeux as j
join genres as g
on j.id_genre = g.id;

-- exo 4
select j.pseudo,s.id_joueur,count(distinct s.id_session) as nombre_session from joueurs as j
join scores as s
on j.id = s.id_joueur
group by j.pseudo,s.id_joueur;

-- exo 5
select avg(s.score) as 'moyenne_score',j.id,j.pseudo from scores as s
join joueurs as j
on j.id = s.id_joueur
group by j.pseudo,j.id;

-- exo 6
select j.pseudo,j.id,s.score,s.id_joueur from joueurs as j
join scores as s
on j.id = s.id_joueur
where s.score >= 1400;

-- exo 7
select j.pseudo,j.pays,e.nom,me.id_equipe from joueurs as j
join membres_equipes as me
on j.id = me.id_joueur
join equipes as e
on e.id = me.id_equipe;

-- exo 8
select j.titre,COUNT(s.id) as nombres_sessions
from jeux as j
join sessions as s
on j.id = s.id_jeu
group by j.id, j.titre
having COUNT(s.id) > 3;

-- exo 9
select s.id AS id_session,s.date_session,j.titre,COUNT(DISTINCT sc.id_joueur) AS nombres_joueurs from sessions AS s
join jeux AS j ON j.id = s.id_jeu
join scores AS sc ON sc.id_session = s.id
GROUP BY s.id, s.date_session, j.titre;

-- exo 10
select j.titre, avg(sc.score) as moyenne_score
from scores as sc
join sessions as s on s.id = sc.id_session
join jeux as j on j.id = s.id_jeu
group by j.id, j.titre
order by moyenne_score desc;

 





