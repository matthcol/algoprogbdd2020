select * from 
	(select 
		s.*, 
		count(m.id) as nb_film_d, -- et pas count(*)=>1
		min(m.year) as min_year_d,
		max(m.year) as max_year_d,
		coalesce(sum(m.duration),0) as total_duration_d
	from stars s left join movies m on s.id = m.id_director
	where s.name in ('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 
		 'Leonardo DiCaprio', 'Clint Eastwood', 'Steve McQueen', 'Ridley Scott')
	group by s.id) stats_d
inner join
	(select 
		s.id, 
		count(p.id_movie) as nb_film_p,
		count(distinct p.role) as nb_role,
		min(m.year) as min_year_p,
		max(m.year) as max_year_p,
		coalesce(sum(m.duration),0) as total_duration_p
	from 
		stars s left join play p on s.id = p.id_actor
		left join movies m on p.id_movie = m.id
	where s.name in 
		('James Cameron', 'Steven Spielberg', 'Arnold Schwarzenegger', 
		 'Leonardo DiCaprio', 'Clint Eastwood', 'Steve McQueen', 'Ridley Scott')
	group by s.id) stats_a
on stats_d.id = stats_a.id
order by name;