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


