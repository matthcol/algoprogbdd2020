DROP SCHEMA cinema cascade;
DROP USER if exists cinema;

create user cinema LOGIN password 'password';
create user cinefan LOGIN password 'password';
create user cinemng LOGIN password 'password';
grant cinefan to cinemng;


create schema cinema authorization cinema;

set role cinema;

\i pg_cine_ddl.sql;
\i pg_cine_data_stars.sql;
\i pg_cine_data_stars2.sql;
\i pg_cine_data_movies.sql;
\i pg_cine_data_movies2.sql;
\i pg_cine_data_play.sql;
\i pg_cine_data_play2.sql;
\i pg_cine_views.sql
