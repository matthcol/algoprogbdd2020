-- sous requetes indépendantes
select * from stars 
where name like 'Steven%' 
 and id not in (select id_director from movies);  -- soucis des NULL

select * from stars 
where name like 'Steven%' 
 and id in (select id_actor from play);
 
-- sous requetes dépendantes
select * from stars s
where name like 'Steven%' 
 and exists (select * from movies m where m.id_director = s.id); 

select * from stars s
where name like 'Steven%' 
 and not exists (select * from movies m where m.id_director = s.id); 
 
select * from movies_007; 

select * from stars s
where exists (select * from movies_007 m where m.id_director = s.id)
order by s.name;





select * from stars s
where exists (select * from play p join movies_007 m on p.id_movie = m.id where p.id_actor = s.id)
order by s.name; 

select * from stars s
where exists (select * from play p join movies_007 m on p.id_movie = m.id  where p.id_actor = s.id and p.role like 'James Bond')
order by s.name; 

select s.*, p.role, m.title, m.year  
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
where  p.role like 'James Bond'
order by m.year; 

select s.*, p.role, m.title, m.year  
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
where  p.role  ~ '^['']{0,2}Q['']{0,2}$'   -- like '%Q%' -- 
 or	p.role like '%Boothroyd%'
order by m.year; 

select s.*, p.role, m.title, m.year  
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
where  p.role  like '%Moneypenny%' or p.role = 'Eve'
order by m.year; 

select s.*, p.role, m.id, m.title, m.year  
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
where  p.role  like '%James Bond%' 
order by m.year; 

select count(*) from movies_007;

-- change role name for James Bond stuntman
update play set role = 'James Bond in Underwater Sequences' where id_actor = 184092 and id_movie = 59800;
-- change role name for Roger Moore James Bond in For Your Eyes Only
update play set role = 'James Bond' where id_actor = 549 and id_movie = 82398;

select s.*, p.role, m.id, m.title, m.year  
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
where  p.role  like 'James Bond' 
order by m.year; 

-- que les James Bond
select 
	*, 
	rank() over (order by nb_movies desc) as rank
from (
	select s.*, count(m.id) as nb_movies, string_agg(distinct role, ',') as role,
			min(year) as min_year, max(year) as max_year
	from stars s join play p on p.id_actor = s.id
		join movies_007_all m on p.id_movie = m.id  
	where  p.role  like 'James Bond' 
	group by s.id) stats_actors_007
order by nb_movies desc; 

-- sur tous les acteurs des films 007
select s.*, 
	count(m.id) as nb_movies, 
	string_agg(distinct p.role, ',') as roles, 
	string_agg(m.title,',' order by m.year) as titles
from stars s join play p on p.id_actor = s.id
	join movies_007 m on p.id_movie = m.id  
group by s.id
order by nb_movies desc; 

select id_star, name, birthdate, 
	count(id_movie) as nb_movies, 
	string_agg(distinct role, ',') as roles, 
	string_agg(year_title,',' order by year) as titles
from (select s.id as id_star, s.name, s.birthdate, 
	  		m.id as id_movie, m.year,
	  		m.year || '-' || m.title as year_title,
	  		p.role
	  from stars s join play p on p.id_actor = s.id
			join movies_007 m on p.id_movie = m.id ) actors_007
group by id_star, name, birthdate
order by nb_movies desc; 

-- stars wars : tous / division
select s.*, count(m.id) as nb_movies, string_agg(distinct role, ',') as role, string_agg(m.title,',' order by m.year) as titles
from stars s join play p on p.id_actor = s.id
		join movies_star_wars m on p.id_movie = m.id  
group by s.id
having count(m.id) = (select count(*) as nb_movies_sw from movies_star_wars);

select * from stars s
where not exists (
	select * from movies_star_wars m
	where not exists (
		select * from play p
		where p.id_actor = s.id and p.id_movie = m.id
	)
);

select * from stars s
where not exists (
	select * from movies_007 m
	where m.year between 1990 and 2002 and not exists (
		select * from play p
		where p.id_actor = s.id and p.id_movie = m.id
	)
);

















