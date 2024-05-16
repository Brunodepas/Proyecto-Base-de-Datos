--Creamos el esquema que usaremos a lo largo del proyecto
drop schema if exists proyecto cascade;
create schema proyecto;

--Creamos el dominio de los enteros positivos
drop domain if exists proyecto.intpositivo cascade;
create domain proyecto.intpositivo as int
	check (value > 0)
	not null;

--Creamos el dominio de las clasificaciones
drop domain if exists proyecto.clasificaciones cascade;
create domain proyecto.clasificaciones as varchar(3)
	check (value in ('ATP', '+13', '+15', '+18'))
	not null;

--Creamos la tabla Peliculas
drop table if exists proyecto.peliculas cascade;
create table proyecto.peliculas (
	id_p			proyecto.intpositivo,
	t_distribucion	varchar(50),
	t_original		varchar(50),
	t_español		varchar(50),
	genero			varchar(50),
	i_original		varchar(50),
	año_prod		proyecto.intpositivo,
	url				varchar(50),
	duracion		interval,
	clasificacion	proyecto.clasificaciones,
	f_estreno_Arg	date,
	resumen			text,

	constraint pkpeliculas primary key (id_p)
);

--Creamos un trigger que ponga los t_original en mayusculas
create or replace function proyecto.titulomayuscula() returns trigger as 
	$$
	begin
		new.t_original = upper(new.t_original);
		return new;
    end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_titulomayuscula"
	before insert on proyecto.peliculas
    for each row
	execute procedure proyecto.titulomayuscula();

--Creamos la tabla Mpais
drop table if exists proyecto.mpais cascade;
create table proyecto.mpais (
	id_p		proyecto.intpositivo,
	pais		varchar(50),

	constraint pkmpais primary key (id_p, pais),
	constraint fkmpais_peliculas foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade
);

--Creamos la tabla Persona
drop table if exists proyecto.persona cascade;
create table proyecto.persona (
	dni				proyecto.intpositivo,
	nombre			text not null,
	nacionalidad	varchar(50),

	constraint pkpersona primary key (dni)
);

--Creamos la tabla Directores
drop table if exists proyecto.directores cascade;
create table proyecto.directores (
	dni			proyecto.intpositivo,
	cant_d		int,

	constraint pkdirectores primary key (dni),
	constraint fkdirectores_persona foreign key (dni) references proyecto.persona on delete cascade on update cascade
);

--Creamos un trigger que ponga cant_d en 0 cuando se inserta un director
create or replace function proyecto.setcant_d() returns trigger as
	$$
	begin
		new.cant_d = 0;
		return new;
	end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_setcant_d"
	before insert on proyecto.directores
    for each row
	execute procedure proyecto.setcant_d();

--Creamos la tabla Actores
drop table if exists proyecto.actores cascade;
create table proyecto.actores (
	dni			proyecto.intpositivo,
	cant_a		int,

	constraint pkactores primary key (dni),
	constraint fkactores_persona foreign key (dni) references proyecto.persona on delete cascade on update cascade
);

--Creamos un trigger que ponga cant_a en 0 cuando se inserta un actor
create or replace function proyecto.setcant_a() returns trigger as
	$$
	begin
		new.cant_a = 0;
		return new;
	end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_setcant_a"
	before insert on proyecto.actores
    for each row
	execute procedure proyecto.setcant_a();

--Creamos la tabla Cine
drop table if exists proyecto.cine cascade;
create table proyecto.cine (
	nom_cine		text not null,
	telefono		varchar(15),
	direccion		text,

	constraint pkcine primary key (nom_cine)
);

--Creamos la tabla Salas
drop table if exists proyecto.salas cascade;
create table proyecto.salas (
	num_sala		proyecto.intpositivo,
	cant_butacas	int,
	nom_cine		varchar(50) not null,

	constraint pksalas primary key (num_sala),
	constraint fksalas_cine foreign key (nom_cine) references proyecto.cine,
	constraint check_butacas check (cant_butacas >= 0)
);

--Creamos la tabla Funciones
drop table if exists proyecto.funciones cascade;
create table proyecto.funciones (
	cod_fun			proyecto.intpositivo,
	fecha			date,
	h_comienzo 		time,
	id_p			proyecto.intpositivo,
	num_sala		proyecto.intpositivo,

	constraint pkfunciones primary key (cod_fun),
	constraint fkfunciones_peliculas foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade,
	constraint fkfunciones_salas foreign key (num_sala) references proyecto.salas on delete cascade on update cascade
);

--Creamos la tabla Dirige
drop table if exists proyecto.dirige cascade;
create table proyecto.dirige (
	id_p		proyecto.intpositivo,
	dni			proyecto.intpositivo,

	constraint pkdirige primary key (id_p, dni),
	constraint fkdirige_peliculas foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade,
	constraint fkdirige_directores foreign key (dni) references proyecto.directores on delete cascade on update cascade
);

--Creamos la tabla Protagoniza
drop table if exists proyecto.protagoniza cascade;
create table proyecto.protagoniza (
	id_p		proyecto.intpositivo,
	dni			proyecto.intpositivo,

	constraint pkprotagoniza primary key (id_p, dni),
	constraint fkprotagoniza_peliculas foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade,
	constraint fkprotagoniza_actores foreign key (dni) references proyecto.actores on delete cascade on update cascade
);

--Creamos la tabla Reparto
drop table if exists proyecto.reparto cascade;
create table proyecto.reparto (
	id_p		proyecto.intpositivo,
	dni			proyecto.intpositivo,

	constraint pkreparto primary key (id_p, dni),
	constraint fkreparto_peliculasrep foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade,
	constraint fkreparto_actoresrep foreign key (dni) references proyecto.actores on delete cascade on update cascade
);

--Creamos un trigger que cuente la cantidad de veces que una persona dirigio una pelicula
create or replace function proyecto.peliculasdirigidas() returns trigger as 
	$$
	declare
		contador int;
	begin
		select count(*) into contador from proyecto.dirige where dni = new.dni;
		update proyecto.directores set cant_d = contador where dni = new.dni;
		return new;
    end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_cantpeliculasdirigidas"
	after insert  or delete or update on proyecto.dirige
    for each row
	execute procedure proyecto.peliculasdirigidas();

--Creamos dos triggers que cuenten la cantidad de veces que una persona actuo(protagonista o de reparto) en una pelicula
create or replace function proyecto.peliculasactuadas() returns trigger as 
	$$
	declare
		contador int;
	begin
		select count(*) into contador from 
			(select dni from proyecto.protagoniza where dni = new.dni
			union all 
			select dni from proyecto.reparto where dni = new.dni) as actuaciones;
		update proyecto.actores set cant_a = contador where dni = new.dni;
		return new;
    end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_cantpeliculasactuadasprotagonista"
	after insert  or delete or update on proyecto.protagoniza
    for each row
	execute procedure proyecto.peliculasactuadas();

create trigger "proyecto.trigger_cantpeliculasactuadasreparto"
	after insert  or delete or update on proyecto.reparto
    for each row
	execute procedure proyecto.peliculasactuadas();

--Creamos la tabla Auditoria
drop table if exists proyecto.auditoria;
create table proyecto.auditoria (
	id_p	proyecto.intpositivo,
   	fecha_realizacion date,
	hora_realizacion time,
	f_estreno	date,
	usuario text,

	constraint pkauditoria primary key (id_p, fecha_realizacion, hora_realizacion),
	constraint fkauditoria_peliculas foreign key (id_p) references proyecto.peliculas on delete cascade on update cascade
);

--Creamos un trigger para guardar informacion en la tabla Auditoria cuando se cambie la fecha de estreno de una pelicula
create or replace function proyecto.infoauditoria() returns trigger as
	$$
	    begin
			if (new.f_estreno_Arg != old.f_estreno_Arg) then
				insert into proyecto.auditoria (id_p, fecha_realizacion, hora_realizacion, f_estreno, usuario) 
				values (old.id_p, now(), now(), new.f_estreno_Arg, current_user);
			end if;
			return new;
    	end;
	$$
	language plpgsql;

create trigger "proyecto.trigger_infoauditoria"
	after update on proyecto.peliculas
    for each row
	execute procedure proyecto.infoauditoria();
