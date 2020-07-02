-- films de Steve McQueen acteur
DO
$$
declare
	steveid integer;
begin
	select num_ind into steveid from individu 
		where nom like 'McQueen' 
			and extract(year from date_naissance) = 1930;
	insert into film_real (titre, genre, annee, nom, prenom) 
		values ('La Tour Infernale', 'Thriller', 1974, 'Guillermin','John' );
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Chief Mike O''Hallorhan');

	insert into film_real (titre, genre, annee, nom, prenom)
		values ('Papillon', 'Drame', 1973,'Schaffner','Franklin J.');
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Henri ''Papillon'' Charriere');

	insert into film_real (titre, genre, annee, nom, prenom)
		values ('Guet Apens', 'Thriller', 1972,'Peckinpah','Sam');
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Doc McCoy');

	insert into film_real (titre, genre, annee, nom, prenom)
		values ('L''Affaire Thomas Crown', 'Drame', 1968,'Norman Jewison','Norman');
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Thomas Crown');

	insert into film_real (titre, genre, annee, nom, prenom)
		values ('Bullit', 'Action', 1968,'Yates','Peter');
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Frank Bullitt');

	insert into film_real (titre, genre, annee, nom, prenom)
		values ('La Grande Evasion', 'Drame', 1963,'Sturges','John');
	insert into jouer (num_act, num_film, role) values (steveid,currval('film_num_film_seq'), 'Hilts ''The Cooler King''');
end;
$$
language 'plpgsql';

insert into film_real (titre, genre, annee, nom, prenom)
		values ('Night of the Day of the Dawn of the Son of the Bride of the Return of the Revenge of the Terror of the Attack of the Evil Mutant Hellbound Flesh Eating Crawling Alien Zombified Subhumanoid Living Dead, Part 5',
		'Comedie', 2011,'Riffel','James');

commit;








