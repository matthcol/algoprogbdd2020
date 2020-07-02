grant usage on schema cinema 
	to cinefan; 
	
grant select on all tables in
	schema cinema to cinefan;
	
grant insert on film_real to cinemng;
grant insert, update(titre,genre,annee,duree) 
	on film_qt to cinemng;
	
grant usage 
	on sequence film_num_film_seq, individu_num_ind_seq
	to cinemng;
 