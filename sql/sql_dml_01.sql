select * from film;

-- selection
-- operator comparison : = != <> < <= > >=
select * from film where annee >= 2010;
select * from film where num_film = 5;
select * from film where annee != 2011;
select * from film where annee <> 2011;
select * from film where annee between 1996 and 2004;
-- logical combinator : not and or
select * from film where not (annee between 1996 and 2004);
select * from film where annee < 1996 or annee> 2004;
select * from film where annee < 1970 and genre = 'Western';
-- predicat  with NULL : is NULL, is not NULL
select * from individu where date_naissance is NULL;
select * from individu where date_naissance is not NULL;
-- predicat avec matching de texte
select * from film where titre like 'K%';
select * from film where titre like '_a%';
select * from film where titre ~* '^l.*a[ui]';
-- manipulation de texte
select prenom || ' ' || nom as fullname from individu;
select upper(nom), lower(prenom) from individu;
select *, upper(substr(titre,1,3)) || annee as code from film;
select titre, length(titre) as long_titre from film;
-- calcul numérique : operator + - * / % + arrondis
select * from film where (duree/60.0) between 1 and 2;

select titre, duree /60 as duree_h, duree % 60 as duree_m 
from film 
where duree is not null;

-- temporal 
select * from individu where date_naissance is not NULL;
set DATESTYLE = SQL, DMY;
set LC_TIME = 'fr_FR';
set LC_TIME = 'es_ES';
select * from individu where date_naissance is not NULL;
select prenom, nom, to_char(date_naissance, 'TMday DD TMmonth YYYY') from individu
where date_naissance is not NULL;

select prenom, nom, extract(year from date_naissance) as annee_naissance 
from individu
where date_naissance is not NULL;

select CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP;

select 
	*, 
	extract(year from current_date) - extract(year from date_naissance) as age 
from individu
where date_naissance is not NULL;

-- titre et nombre d'années des films



-- compter
select 
	count(*) as nb_film,
	count(duree) as nb_duree,
	round(avg(duree),2) as avg_duree,
	coalesce(sum(duree),0) as tot_duree
from film
where annee between 1990 and 1999;

select 
	count(*) as nb_film,
	count(duree) as nb_duree,
	round(avg(duree),2) as avg_duree,
	coalesce(sum(duree),0) as tot_duree
from film
where annee between 2020 and 2029;

select
	count(*) as nb_film,
	count(annee) as nb_annee,
	count(distinct annee) as nb_annee_uniq
from film;

select distinct prenom from individu;
select distinct prenom, nom from individu;


select 
	num_real, 
	count(*) as nb_film, 
	min(annee) as annee_first, max(annee) as annee_last, 
	sum(duree) duree_totale
from film
where annee >= 2000
group by num_real 
having count(*) >= 2
order by nb_film desc;

select 
	num_real, 
	count(*) as nb_film, 
	min(annee) as annee_first, max(annee) as annee_last, 
	sum(duree) duree_totale
from film
group by num_real 
order by nb_film desc;


select num_real, count(num_film) as nb_film
from film
group by num_real
having count(num_film) = (
	select max(nb_film) as max_nb_real
	from (select count(num_film) as nb_film
		from film
		group by num_real) nbs);
		
select * from film
where num_real = (
	select num_ind from individu where nom = 'Tarantino');

select * from film
where num_real in (
	select num_ind from individu where nom = 'McQueen');
	
select * from film
where num_real in (
	select num_ind from individu where prenom = 'John');	
	





select 
	num_act,
	count(*) as nb_film
from jouer
group by num_act
order by nb_film desc;

select 
	num_act,
	count(num_film) as nb_film
from jouer
group by num_act
order by nb_film desc;

















