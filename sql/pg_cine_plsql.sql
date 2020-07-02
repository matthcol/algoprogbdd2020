create or replace function add_film_real() returns trigger as 
$$
declare
	v_num_real integer;
begin
	if NEW.num_real IS NOT NULL then
		v_num_real := NEW.num_real;
	else
		select num_ind INTO v_num_real from individu 
			where nom = NEW.nom and prenom = NEW.prenom;
		if v_num_real is null then
			insert into individu (nom, prenom) values (NEW.nom, NEW.prenom);
			v_num_real := currval('individu_num_ind_seq');
		end if;
	end if;
	insert into film (titre, annee, duree, num_real)
		values (NEW.titre, NEW.annee, NEW.duree, v_num_real);
	return NEW;	
end;
$$ language plpgsql;

create trigger trg_add_film_real
instead of insert on film_real
for each row
execute procedure add_film_real();




