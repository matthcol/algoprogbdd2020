select title, year, (duration / 60) || 'h' || (duration % 60) as duration_text
from movies 
where year between 1980 and 1989
	and duration > 120;
	
select 
	count(*) as nb_movies,
	min(year) as min_year,
	max(year) as max_year,
	min(duration) as min_duration,
	max(duration) as max_duration,
	max(length(title)) as max_length_title
from movies;

-- duration max
select 	max(duration) as max_duration from movies;

-- movies with duration equals to duration max
select * from movies
where duration = (select max(duration) from movies);

-- movies directed by Clint Eastwood
select * from stars where name = 'Clint Eastwood';

select * from movies 
where id_director = (
	select id from stars where name = 'Clint Eastwood')
order by year desc;

select * from movies 
where id_director in (
	select id from stars where name = 'Steve McQueen')
order by year desc;

-- ANY > equivalent > min
-- ALL > equivalent > max
select * from movies where year > (
	select max(year) from movies where id_director in (
		select id from stars where name = 'James Cameron'));



-- NB : detour by Donald Sutherland
select * from stars where name like '%Sutherland';

--les acteurs d'Invictus
select * from stars
where id in (
	select id_actor from play where id_movie in (
		select id from movies where title = 'Invictus'))
order by name;

-- filmographie de Clint eastwood
select * from movies where id in (
	select id_movie from play where id_actor in (
		select id from stars where name = 'Clint Eastwood'))
order by year desc;







select * from (
select s.name, 
	coalesce(md.title, ma.title)as title, 
	coalesce(md.year, ma.year) as year, 
	case when md.id is not null then 'R' else NULL end as R,
	case when ma.id is not null then 'A' else NULL end as A,
	p.role
from stars s
	left join movies md on s.id = md.id_director
	left join play p on s.id = p.id_actor
	left join movies ma on p.id_movie = ma.id
where s.name = 'Clint Eastwood') filmo
order by year;

select
	m.*, s.name
	-- *
	-- m.title, m.year, s.name
from movies m join stars s on m.id_director = s.id
where m.year between 1980 and 1989;

select
	m.*, s.name
from movies m, stars s 
where 
	m.id_director = s.id -- join condition
	and m.year between 1980 and 1989; -- selection condition



-- films avec leur realisateur tel que le realisateur a au moins 77 ans l'année de sortie du film 
select m.title, m.year, s.name, m.year - extract(year from s.birthdate) as age
from movies m join stars s on m.id_director = s.id
where  m.year - extract(year from s.birthdate) >= 77;

--select m.title, m.year, s.name, s.age
--from movies m join (
--	select *, extract(year from current_date) - extract(year from birthdate) as age
--	from stars 
--	where  extract(year from current_date) - extract(year from birthdate) >= 110
--	) s on m.id_director = s.id;

-- filmographie de clint eastwood : title, year, role


select m.title, m.year, p.role
from  movies m join play p on m.id = p.id_movie
	join stars s on p.id_actor = s.id
where 
	s.name = 'Clint Eastwood'
	and  p.role like '%Harry%'
order by m.year;





-- acteurs de James Cameron (avec film et role)
select sa.name, p.role, m.title, m.year
from stars sa join play p on sa.id = p.id_actor
	join movies m on p.id_movie =  m.id
	join stars sd on m.id_director = sd.id
where sd.name = 'James Cameron'
order by sa.name asc, m.year asc;

select s.id, s.name, 
	count(*) as nb_film,
	min(m.year) as min_year,
	max(m.year) as max_year
from movies m join stars s on m.id_director = s.id
where m.year > 1955
group by s.id, s.name
--having count(*) >= 10
order by nb_film desc, s.name;

-- nb d'acteurs par film des années 80S
select m.id, m.title, count(p.id_actor) as nb_actor  --, count(distinct p.id_actor) as nb_actor one row per role
from movies m join play p on m.id = p.id_movie
where m.year between 1980 and 1989
group by m.id
order by nb_actor desc, m.title;


-- nb de films par acteur né en 1930
select s.*, count(p.id_movie) as nb_movie
from stars s join play p on s.id = p.id_actor
where extract(year from s.birthdate) = 1930
group by s.id
order by nb_movie desc;

-- les stars qui ont joué dans leur propre film (name, title, year)
select s.*, m.title, m.year, p.role
from stars s join movies m on s.id = m.id_director
	join play p on m.id = p.id_movie and p.id_actor = s.id
where p.role <> 'Self'
order by s.id, m.year;

select s.*, m.title, m.year, p.role
from stars s join play p on s.id = p.id_actor
	join movies m on p.id_movie = m.id  and m.id_director = s.id
where p.role <> 'Self'
	and m.year between 1960 and 1970
	and s.name like '%e%'
order by s.id, m.year;

select s.*, count(m.id) as nb_film
from stars s join play p on s.id = p.id_actor
	join movies m on p.id_movie = m.id  and m.id_director = s.id
where p.role <> 'Self'
group by s.id
order by nb_film desc;

select count(*) from movies;
select count(id_director) from movies;
select * from movies where id_director is null;

select * from stars s 
where name like '%Caprio'
	and not exists (select * from movies m where m.id_director = s.id);
	
select * from stars s 
where name like '%Caprio'
	and s.id not in (select id_director from movies where id_director is not null);
	
select * from movies m  left outer join stars s on m.id_director = s.id
where m.duration >= 180;

insert into movies (title, year, duration) values ('Once Upon a Time in America', 1984, 229);

-- nb de réalisations par star
select 
	s.*, 
	count(m.id) as nb_film, -- et pas count(*)=>1
	min(m.year) as min_year,
	max(m.year) as max_year,
	coalesce(sum(m.duration),0) as total_duration
from stars s left join movies m on s.id = m.id_director
where s.name in ('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 'Leonardo DiCaprio', 'Clint Eastwood',
				  'Steve McQueen', 'Ridley Scott')
group by s.id
order by nb_film desc;

-- stats by actors (include not actor)
select 
	s.*, 
	count(p.id_movie) as nb_film,
	count(distinct p.role) as nb_role,
	min(m.year) as min_year,
	max(m.year) as max_year,
	coalesce(sum(m.duration),0) as total_duration
from 
	stars s left join play p on s.id = p.id_actor
	left join movies m on p.id_movie = m.id
where s.name in 
	('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 
	 'Leonardo DiCaprio', 'Clint Eastwood', 'Steve McQueen', 'Ridley Scott')
group by s.id
order by nb_film desc;


select s.name, nullif(s.birthdate, '1946-01-01') as birthdate
from stars s
where s.name in ('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 'Leonardo DiCaprio', 'Clint Eastwood');


select 
	s.name, 
	case 
		when extract(month from s.birthdate) = 1 and extract(day from s.birthdate) = 1 then NULL 
		else s.birthdate
	end as birthdate  
from stars s
where s.name in ('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 'Leonardo DiCaprio', 'Clint Eastwood');










	
select * from movies where id_director = 138;





-- acteurs ayant joué pour tous ces réalisateurs 
-- Tarantino, Eastwood et Cameron, Christopher Nolan, Martin Scorcese, Ridley Scott, Steven Spielberg, Danny Boyle
-- Sam Raimi
select * from stars sa where not exists (
	select * from stars sd  where sd.name in ('James Cameron', 'Clint Eastwood', 'Quentin Tarantino')
	and not exists (
			select * from play p 
			where p.id_actor = sa.id 
			and exists (select * from movies m where p.id_movie = m.id and m.id_director = sd.id)));
			
-- classer top acteurs de ces réalisteurs

-- acteurs qui ont joué dans tous les star wars (y compris spin off)
-- top acteurs

-- acteurs qui ont joué dans tous les james bond (jusqu'à...)
-- top acteurs
-- 86006, 2305700
select string_agg(id::varchar, ',' order by year asc) from (select distinct m.id, m.year --, m.title, m.year
from stars s join play p on s.id = p.id_actor
	join movies m on p.id_movie = m.id 
where role like '%James Bond%') ids007;
--order by year asc;

select string_agg(id::varchar, ',' order by year asc) from (select distinct m.id, m.year from movies m
where title like 'Star Wars%' 
	and title not like '%Deleted Scenes') movies_sw;
				  
create or replace view movies_007 as select * from movies where id in 
(55928,57076,58150,59800,62512,64757,66995,70328,71807,76752,79574,82398,86034,90264,93428,97742,113189,120347,143145,246460,381061,830515,1074638,2379713);				  

create or replace view movies_007_all as select * from movies where id in 
(55928,57076,58150,59800,62512,64757,66995,70328,71807,76752,79574,82398,86006,86034,90264,93428,97742,113189,120347,143145,246460,381061,830515,1074638,2379713);	

create or replace view movies_star_wars as select * from movies where id in 
(76759,80684,86190,2488496,2527338);

select * from movies_star_wars;


select * 
from movies_007 m join play p on m.id = p.id_movie--and role like 'Q';
	join stars s on p.id_actor = s.id
where s.name like 'Desmond Llewelyn'
order by m.year;

select s.*, p.role, m.title, m.year 
from movies_007 m join play p on m.id = p.id_movie
	join stars s on p.id_actor = s.id
where p.role ~ 'Boothroyd'
order by m.year;


select * 
from stars sa join play p on sa.id = p.id_actor 
join movies m on p.id_movie = m.id
join stars sd on m.id_director = sd.id
where sa.name = 'Leonardo DiCaprio' and sd.name in ('James Cameron', 'Clint Eastwood', 'Quentin Tarantino');

select sa.* 
from stars sa join play p on sa.id = p.id_actor 
join movies m on p.id_movie = m.id
where m.title like 'Django%';










	