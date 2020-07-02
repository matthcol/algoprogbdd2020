DROP TABLE if exists jouer;
DROP TABLE if exists film;
DROP TABLE if exists individu;

create table individu(
	num_ind serial constraint pk_individu primary key,
	nom character varying(50) NOT NULL,
	prenom character varying(50) NOT NULL,
	date_naissance date
);

CREATE TABLE film
(
    num_film serial 
			CONSTRAINT pk_film PRIMARY KEY,
    titre character varying(220) NOT NULL,
    annee smallint NOT NULL 
			CONSTRAINT chk_annee_cine CHECK (annee >= 1888),
    genre character varying(15) 
			default 'Drame',      
    duree smallint
		CONSTRAINT chk_duree_cine CHECK (duree >= 0),
    num_real integer 
			NULL	
			CONSTRAINT fk_film_real REFERENCES individu (num_ind)
);

create table jouer(
	num_act integer constraint fk1_jouer references individu(num_ind),
	num_film integer constraint fk2_jouer references film(num_film),
	role character varying(50),
	constraint pk_jouer primary key (num_act,num_film));
