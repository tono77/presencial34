Last login: Mon Mar 12 18:49:26 on ttys000
~ % psql
psql (10.1, server 10.3)
Type "help" for help.

edgardo=# create database presencial34;
CREATE DATABASE
edgardo=# \c presencial34
psql (10.1, server 10.3)
You are now connected to database "presencial34" as user "edgardo".
presencial34=# create table conductor (id SERIAL PRIMARY KEY, rut VARCHAR(12), fullname VARCHAR(50);
presencial34(# create database presencial34;^C
presencial34=# |d
presencial34-# \d
Did not find any relations.
presencial34-# create table conductor (id SERIAL PRIMARY KEY, rut VARCHAR(12), fullname VARCHAR(50));
ERROR:  syntax error at or near "|"
LINE 1: |d
        ^
presencial34=# create table conductor (id SERIAL PRIMARY KEY, rut VARCHAR(12), fullname VARCHAR(50));
CREATE TABLE
presencial34=# create table camion (id SERIAL PRIMARY KEY, conductor_id SERIAL REFERENCES conductor (id), patente VARCHAR(15));
CREATE TABLE
presencial34=# create table envio (id SERIAL, conductor_id SERIAL REFERENCES conductor (id), mensaje VARCHAR(130));
CREATE TABLE
presencial34=# create table paquete ( id SERIAL PRIMARY KEY, envio_id SERIAL REFERENCES envio (id), descr VARCHAR(255));
ERROR:  there is no unique constraint matching given keys for referenced table "envio"
presencial34=# create table paquete ( id SERIAL PRIMARY KEY, envio_id SERIAL REFERENCES envio (id), descr VARCHAR(255));
ERROR:  there is no unique constraint matching given keys for referenced table "envio"
presencial34=# \d envio
presencial34=# create table paquete ( id SERIAL PRIMARY KEY, envio_id SERIAL REFERENCES envi^C(id), descr VARCHAR(255));
presencial34=# alter table envio add PRIMARY KEY (id);
ALTER TABLE
presencial34=# create table paquete ( id SERIAL PRIMARY KEY, envio_id SERIAL REFERENCES envio (id), descr VARCHAR(255));
CREATE TABLE
presencial34=# create table ciudad ( id SERIAL PRIMARY KEY, nombre VARCHAR(25));
CREATE TABLE
presencial34=# create table comuna (id SERIAL PRIMARY KEY, ciudad_id SERIAL REFERENCES ciudad (id), nombre VARCHAR(25));
CREATE TABLE
presencial34=# create table cliente (id SERIAL PRIMARY KEY, envio_id SERIAL REFERENCES envio (id), comuna_id SERIAL REFERENCES comuna (id), rut VARCHAR(12), fullname VARCHAR(100));
CREATE TABLE
presencial34=# \d
                   List of relations
 Schema |          Name           |   Type   |  Owner  
--------+-------------------------+----------+---------
 public | camion                  | table    | edgardo
 public | camion_conductor_id_seq | sequence | edgardo
 public | camion_id_seq           | sequence | edgardo
 public | ciudad                  | table    | edgardo
 public | ciudad_id_seq           | sequence | edgardo
 public | cliente                 | table    | edgardo
 public | cliente_comuna_id_seq   | sequence | edgardo
 public | cliente_envio_id_seq    | sequence | edgardo
 public | cliente_id_seq          | sequence | edgardo
 public | comuna                  | table    | edgardo
 public | comuna_ciudad_id_seq    | sequence | edgardo
 public | comuna_id_seq           | sequence | edgardo
 public | conductor               | table    | edgardo
 public | conductor_id_seq        | sequence | edgardo
 public | envio                   | table    | edgardo
 public | envio_conductor_id_seq  | sequence | edgardo
 public | envio_id_seq            | sequence | edgardo
 public | paquete                 | table    | edgardo
 public | paquete_envio_id_seq    | sequence | edgardo
 public | paquete_id_seq          | sequence | edgardo
(20 rows)

presencial34=# \dt
          List of relations
 Schema |   Name    | Type  |  Owner  
--------+-----------+-------+---------
 public | camion    | table | edgardo
 public | ciudad    | table | edgardo
 public | cliente   | table | edgardo
 public | comuna    | table | edgardo
 public | conductor | table | edgardo
 public | envio     | table | edgardo
 public | paquete   | table | edgardo
(7 rows)

presencial34=# create table autor (id SERIAL PRIMARY KEY, fullname VARCHAR(50));
CREATE TABLE
presencial34=# create table categoria (id SERIAL PRIMARY KEY, name VARCHAR(50));
CREATE TABLE
presencial34=# create table formato (id SERIAL PRIMARY KEY, tipo VARCHAR(50));
CREATE TABLE
presencial34=# create table revista (id SERIAL PRIMARY KEY, categoria_id SERIAL REFERENCES categoria (id), name VARCHAR(50), numero integer));
ERROR:  syntax error at or near ")"
LINE 1: ...FERENCES categoria (id), name VARCHAR(50), numero integer));
                                                                     ^
presencial34=# create table revista (id SERIAL PRIMARY KEY, categoria_id SERIAL REFERENCES categoria (id), name VARCHAR(50), numero integer);
CREATE TABLE
presencial34=# create table rev_form (revista_id SERIAL REFERENCES revista (id), formato_id SERIAL REFERENCES formato (id));
CREATE TABLE
presencial34=# \dt
          List of relations
 Schema |   Name    | Type  |  Owner  
--------+-----------+-------+---------
 public | autor     | table | edgardo
 public | camion    | table | edgardo
 public | categoria | table | edgardo
 public | ciudad    | table | edgardo
 public | cliente   | table | edgardo
 public | comuna    | table | edgardo
 public | conductor | table | edgardo
 public | envio     | table | edgardo
 public | formato   | table | edgardo
 public | paquete   | table | edgardo
 public | rev_form  | table | edgardo
 public | revista   | table | edgardo
(12 rows)

presencial34=# create table articulo (id SERIAL PRIMARY KEY, revista_id SERIAL REFERENCES revista (id), title varchar(50), content text);
CREATE TABLE
presencial34=# create table colabora (autor_id SERIAL REFERENCES autor (id), articulo_id SERIAL articulo (id));
ERROR:  syntax error at or near "articulo"
LINE 1: ... SERIAL REFERENCES autor (id), articulo_id SERIAL articulo (...
                                                             ^
presencial34=# create table colabora (autor_id SERIAL REFERENCES autor (id), articulo_id SERIAL REFERENCES articulo (id));
CREATE TABLE
presencial34=# \dt
          List of relations
 Schema |   Name    | Type  |  Owner  
--------+-----------+-------+---------
 public | articulo  | table | edgardo
 public | autor     | table | edgardo
 public | camion    | table | edgardo
 public | categoria | table | edgardo
 public | ciudad    | table | edgardo
 public | cliente   | table | edgardo
 public | colabora  | table | edgardo
 public | comuna    | table | edgardo
 public | conductor | table | edgardo
 public | envio     | table | edgardo
 public | formato   | table | edgardo
 public | paquete   | table | edgardo
 public | rev_form  | table | edgardo
 public | revista   | table | edgardo
(14 rows)

presencial34=# create table curso (id SERIAL, nivel VARCHAR(3), letra VARCHAR(1));
CREATE TABLE
presencial34=# alter table curso add primary key id
presencial34-# ;
ERROR:  syntax error at or near "id"
LINE 1: alter table curso add primary key id
                                          ^
presencial34=# alter table curso add primary key (id)
;
ALTER TABLE
presencial34=# create table alumno (id SERIAL PRIMARY KEY, curso_id SERIAL REFERENCES curso (id), name VARCHAR(100));
CREATE TABLE
presencial34=# create table aula (id SERIAL PRIMARY KEY, name VARCHAR(100));
CREATE TABLE
presencial34=# create table profe (id SERIAL PRIMARY KEY, name VARCHAR(100));
CREATE TABLE
presencial34=# create table contrato (id SERIAL PRIMARY KEY, profe_id SERIAL REFERENCES profe (id), tipo VARCHAR(25));
CREATE TABLE
presencial34=# create table asignatura (id SERIAL PRIMARY KEY, aula_id SERIAL REFERENCES aula (id), profe_id SERIAL REFERENCES profe (id), name VARCHAR(100));
CREATE TABLE
presencial34=# create table cur_asi (curso_id SERIAL REFERENCES curso (id), asignatura_id SERIAL REFERENCES asignatura (id));
CREATE TABLE
presencial34=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner  
--------+------------+-------+---------
 public | alumno     | table | edgardo
 public | articulo   | table | edgardo
 public | asignatura | table | edgardo
 public | aula       | table | edgardo
 public | autor      | table | edgardo
 public | camion     | table | edgardo
 public | categoria  | table | edgardo
 public | ciudad     | table | edgardo
 public | cliente    | table | edgardo
 public | colabora   | table | edgardo
 public | comuna     | table | edgardo
 public | conductor  | table | edgardo
 public | contrato   | table | edgardo
 public | cur_asi    | table | edgardo
 public | curso      | table | edgardo
 public | envio      | table | edgardo
 public | formato    | table | edgardo
 public | paquete    | table | edgardo
 public | profe      | table | edgardo
 public | rev_form   | table | edgardo
 public | revista    | table | edgardo
(21 rows)

presencial34=# 
