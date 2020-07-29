CREATE TABLE franchise
(
    id serial CONSTRAINT pk_franchise PRIMARY KEY,
    name character varying(50) NOT NULL UNIQUE,
    studio character varying(50)
    --CONSTRAINT pk_franchise PRIMARY KEY (id)
);

--sol 1 : colonne suppl dans movies (pb : bcp de null)
--ALTER TABLE movies
--    ADD COLUMN id_franchise integer;
--ALTER TABLE movies
--    ADD CONSTRAINT fk_movies_franchise FOREIGN KEY (id_franchise)
--    REFERENCES franchise (id);

-- sol 2 : table d'association comme une association n,n
create table in_franchise (
	id_franchise integer constraint fk_in_franchise_1 references franchise(id),
	id_movie integer constraint fk_in_franchise_2 references movies(id),
	constraint pk_in_franchise primary key(id_franchise, id_movie)
);
-- add Star Wars movies with sol 2
insert into franchise (name) values ('Star Wars');
insert into franchise (name) values ('James Bond 007');
select * from movies_star_wars;
insert into in_franchise (id_franchise, id_movie) values (1, 76759);
insert into in_franchise (id_franchise, id_movie) values (1, 80684);
select * from movies_007;
insert into in_franchise (id_franchise, id_movie) values (2, 55928);
insert into in_franchise (id_franchise, id_movie) values (2, 57076);

select * from movies where id in (
	select id_movie from in_franchise where id_franchise = (
		select id from franchise where name = 'Star Wars'
	));







