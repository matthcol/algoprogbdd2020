set DATESTYLE = SQL, DMY;
-- Individu 1 to 11
insert into individu (nom,prenom) values('Kidman','Nicole');
insert into individu (nom,prenom) values('Bettany','Paul');
insert into individu (nom,prenom) values('Watson','Emily'); 
insert into individu (nom,prenom) values('Skarsgard','Stellan'); 
insert into individu (nom,prenom) values('Travolta','John'); 
insert into individu (nom,prenom) values('L. Jackson','Samuel'); 
insert into individu (nom,prenom) values('Willis','Bruce');
insert into individu (nom,prenom) values('Irons','Jeremy');
insert into individu (nom,prenom) values('Spader','James');
insert into individu (nom,prenom) values('Hunter','Holly'); 
insert into individu (nom,prenom) values('Arquette','Rosanna'); 
-- 12: John Wayne + film Alamo
insert into individu (nom,prenom,date_naissance) 
	values('Wayne', 'John', '26/05/1907');
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Alamo','Western',1960, 162);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'),
		'Col. Davy Crockett');

-- 13 : Lars von Trier + 2 films/acteurs
insert into individu (nom,prenom) values('von Trier','Lars'); 
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Dogville','Drame',2002, 178);
insert into jouer values(01,currval('film_num_film_seq'),'Grace');
insert into jouer values(02,currval('film_num_film_seq'),'Tom Edison');
insert into jouer values(04,currval('film_num_film_seq'),'Chuck'); 
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Breaking the waves','Drame',1996, 159);
insert into jouer values(03,currval('film_num_film_seq'),'Bess');
insert into jouer values(04,currval('film_num_film_seq'),'Jan');

-- 14 : Tarantino + 9 films
insert into individu (nom,prenom,date_naissance) 
	values('Tarantino','Quentin','27/03/1963'); 
-- Films de QT
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'),'Pulp Fiction','Policier',1994,154);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Jimmie Dimmick');
insert into jouer values(05,currval('film_num_film_seq'),'Vincent Vega');
insert into jouer values(06,currval('film_num_film_seq'),'Jules Winnfield');
insert into jouer values(07,currval('film_num_film_seq'),'Butch Coolidge');

insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Kill Bill: Volume 1', 'Action', 2003,111);
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Kill Bill: Volume 2', 'Action', 2004,137 );
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Director''s Voice');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Django Unchained', 'Western', 2012,165);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Robert (Bag Head) / LeQuint Dickey Mining Employee');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Inglourious Basterds', 'Guerre', 2009,153);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'American Soldier / First Scalped Nazi');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Death Proof', 'Thriller', 2007,113);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Warren');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'),'Jackie Brown', 'Thriller', 1997,154);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Answering Machine Voice');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Reservoir Dogs', 'Thriller', 1992,99);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Mr Brown');
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'Une Nuit en Enfer', 'Horror', 1996,NULL);
insert into jouer (num_act, num_film, role) 
	values(currval('individu_num_ind_seq'),currval('film_num_film_seq'), 'Richard Gecko');

-- 15 : David Cronenberg + 2 films/acteurs	
insert into individu (nom,prenom) values('Cronenberg','David'); 
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Faux-Semblants','Epouvante',1988, 116);
insert into jouer values(08,currval('film_num_film_seq'),'Beverly "&" Elliot Mantle');
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Crash','Drame',1996, 112);
insert into jouer values(09,currval('film_num_film_seq'),'James Ballard');
insert into jouer values(10,currval('film_num_film_seq'),'Helen Remington');
insert into jouer values(11,currval('film_num_film_seq'),'Gabrielle');

-- 16/17
insert into individu (nom,prenom) values('Mazursky','Paul'); 
insert into individu (nom,prenom) values('Jones','Grace');

-- 18
insert into individu (nom,prenom) values('Glen','John');
insert into film (num_real, titre, genre, annee, duree) values(currval('individu_num_ind_seq'),'Dangereusement votre','Espionnage',1985, 131);
insert into jouer values(18,currval('film_num_film_seq'),'May Day');

-- 19 : Alfred Hitchcock + 2 films
insert into individu (nom,prenom) values('Hitchcock','Alfred'); 
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'), 'L''Homme qui en savait trop', 'Thriller', 1934,NULL);
insert into film (num_real, titre, genre, annee, duree) values
	(currval('individu_num_ind_seq'),'L''Homme qui en savait trop', 'Thriller', 1956,NULL);

-- 20-23 : acteurs de QT
insert into individu (nom,prenom) values('Thurman','Uma');
insert into individu (nom,prenom) values('Carradine','David');
insert into individu (nom,prenom) values('Foxx','Jaimie');
insert into individu (nom,prenom) values('Waltz','Cristoph');

-- Uma Thurman dans les films de QT
insert into jouer (num_act, num_film, role) values (20,4, 'Mia Wallace');
insert into jouer (num_act, num_film, role) values (20,5, 'The Bride');
insert into jouer (num_act, num_film, role) values (20,6, 'The Bride');
-- Samuel L Jackson dans les films de QT
insert into jouer (num_act, num_film, role) values (6,7, 'Stephen');
insert into jouer (num_act, num_film, role) values (6,10, 'Ordell Robbie');
insert into jouer (num_act, num_film, role) values (6,6, 'Rufus');
-- autres acteurs dans les films de QT
insert into jouer (num_act, num_film, role) values (22,7, 'Django');
insert into jouer (num_act, num_film, role) values (23,7, 'Dr. King Schultz');
insert into jouer (num_act, num_film, role) values (23,8, 'Col. Hans Landa');
-- Rosanna Arquette joue dans 1 film dramatique (Crash) et dans un non dramatique Pulp F
insert into jouer (num_act, num_film, role) values (11,4, 'Jody');

-- 24-25 : 2 Steve McQueen
-- l'acteur
insert into individu (nom,prenom, date_naissance) 
	values('McQueen','Steve','24/03/1930');
-- Le realisateur
insert into individu (nom,prenom, date_naissance) 
	values('McQueen','Steve','09/10/1969');
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Shame', 'Drame', 2011, 101);
insert into film (num_real, titre, genre, annee, duree) 
	values(currval('individu_num_ind_seq'),'Hunger', 'Drame', 2008, 96);
commit;
