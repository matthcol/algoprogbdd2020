DROP VIEW if exists film_real;
DROP VIEW if exists film_qt;

create or replace view film_real as 
select 
	f.num_film, f.titre, f.genre, f.annee, f.duree, 
	f.num_real, i.nom, i.prenom 
from film f join individu i on f.num_real = i.num_ind;

create or replace view film_qt as select * from film 
where num_real in 
	(select num_ind from individu where nom = 'Tarantino' and prenom = 'Quentin'); 
	
