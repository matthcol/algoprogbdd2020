DROP TABLE if exists play;
DROP TABLE if exists movies;
DROP TABLE if exists stars;

create table stars(
	id serial constraint pk_stars primary key,
	name character varying(150) NOT NULL,
	birthdate date
);

CREATE TABLE movies
(
    id serial 
			CONSTRAINT pk_movies PRIMARY KEY,
    title character varying(250) NOT NULL,
    year smallint NOT NULL 
			CONSTRAINT chk_year CHECK (year >= 1888),
    genres character varying(200) 
			default 'Drama',      
    duration smallint
		CONSTRAINT chk_duration CHECK (duration >= 0),
    id_director integer 
			NULL	
			CONSTRAINT fk_film_real REFERENCES stars (id)
);

create table play(
	id_actor integer constraint fk1_play references stars(id),
	id_movie integer constraint fk2_play references movies(id),
	role character varying(100),
	constraint pk_play primary key (id_actor,id_movie));
