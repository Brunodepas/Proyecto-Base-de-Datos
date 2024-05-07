--Insertamos datos en la tabla Peliculas
insert into proyecto.peliculas (id_p, t_distribucion, t_original, t_español, genero, i_original, año_prod, url, duracion, clasificacion, f_estreno_Arg, resumen)
values
	(1, 'Sony Pictures', 'Spider-Man: Into the Spider-Verse', 'Spider-Man: Un nuevo universo', 'Animación', 'Ingles', 2018, 'https://www.spidermanunmundonuevo.com', '1:57:00', 'ATP', '2018-12-14', 'Miles Morales se convierte en el Spider-Man de su realidad y se une a otros Spider-Men de diferentes dimensiones para detener una amenaza interdimensional.'),
	(2, 'Sony Pictures', 'Spider-Man: Homecoming', 'Spider-Man: De regreso a casa', 'Acción', 'Ingles', 2017, 'https://www.spidermanregresacasa.com', '2:13:00', '+13', '2017-07-07', 'Peter Parker intenta equilibrar su vida como estudiante de secundaria y como el superhéroe Spider-Man mientras enfrenta al Vulture.'),
	(3, 'Sony Pictures', 'Spider-Man: Far From Home', 'Spider-Man: Lejos de casa', 'Acción', 'Ingles', 2019, 'https://www.spidermanlejosdecasa.com', '2:09:00', '+13', '2019-07-02', 'Peter Parker se une a Mysterio para luchar contra las criaturas elementales mientras está de vacaciones en Europa.'),
	(4, 'Sony Pictures', 'Spider-Man', 'Spider-Man', 'Acción', 'Ingles', 2002, 'https://www.spiderman.com', '2:01:00', '+13', '2002-05-03', 'Peter Parker adquiere habilidades de araña después de ser mordido por una araña genéticamente modificada y se convierte en el héroe Spider-Man.'),
	(5, 'Sony Pictures', 'Spider-Man 2', 'Spider-Man 2', 'Acción', 'Ingles', 2004, 'https://www.spiderman2.com', '2:07:00', '+13', '2004-06-30', 'Peter Parker lucha por equilibrar su vida personal y su deber como Spider-Man mientras enfrenta a Doctor Octopus.'),
	(6, 'Sony Pictures', 'Spider-Man 3', 'Spider-Man 3', 'Acción', 'Ingles', 2007, 'https://www.spiderman3.com', '2:19:00', '+13', '2007-05-04', 'Peter Parker lidia con la oscuridad dentro de él cuando se enfrenta a nuevos enemigos, incluido Venom.'),
	(7, 'Marvel Studios', 'Spider-Man: No Way Home', 'Spider-Man: Sin camino a casa', 'Acción', 'Ingles', 2021, 'https://www.spidermannowayhome.com', '2:28:00', '+13', '2021-12-17', 'Peter Parker busca la ayuda del Doctor Strange para deshacer un hechizo que ha expuesto su identidad secreta.');

--Insertamos datos en la tabla Mpais
insert into proyecto.mpais (id_p, pais)
values
	(1, 'Estados Unidos'),
	(2, 'Estados Unidos'),
	(3, 'Estados Unidos'),
	(4, 'Estados Unidos'),
	(5, 'Estados Unidos'),
	(6, 'Estados Unidos'),
	(7, 'Estados Unidos');

--Insertamos datos en la tabla Persona
insert into proyecto.persona (nombre, nacionalidad)
values
	('Tom Holland', 'Inglaterra'),
	('Zendaya', 'Estados Unidos'),
	('Jake Gyllenhaal', 'Estados Unidos'),
	('Tobey Maguire', 'Estados Unidos'),
	('Kirsten Dunst', 'Estados Unidos'),
	('Andrew Garfield', 'Estados Unidos'),
	('Emma Stone', 'Estados Unidos'),
	('Willem Dafoe', 'Estados Unidos'),
	('Alfred Molina', 'Estados Unidos'),
	('Shameik Moore', 'Estados Unidos'),
	('Bob Persichetti', 'Estados Unidos'),
	('Peter Ramsey', 'Estados Unidos'),
	('Rodney Rothman', 'Estados Unidos'),
	('Jon Watts', 'Estados Unidos'),
	('Sam Raimi', 'Estados Unidos'),
	('James Franco', 'Estados Unidos'),
	('Hailee Steinfeld', 'Estados Unidos'),
	('Mahershala Ali', 'Estados Unidos'),
	('Liev Schreiber', 'Estados Unidos');

--Insertamos datos en la tabla Actores
insert into proyecto.actores (nombre, cant_a)
values
	('Tom Holland', 0),
	('Zendaya', 0),
	('Jake Gyllenhaal', 0),
	('Tobey Maguire', 0),
	('Kirsten Dunst', 0),
	('Andrew Garfield', 0),
	('Emma Stone', 0),
	('Willem Dafoe', 0),
	('Alfred Molina', 0),
	('Shameik Moore', 0),
	('James Franco', 0),
	('Hailee Steinfeld', 0),
	('Mahershala Ali', 0),
	('Liev Schreiber', 0);

--Insertamos datos en la tabla Directores
insert into proyecto.directores (nombre, cant_d)
values
	('Bob Persichetti', 0),
	('Peter Ramsey', 0),
	('Rodney Rothman', 0),
	('Jon Watts', 0),
	('Sam Raimi', 0);

--Insertamos datos en la tabla Protagoniza
insert into proyecto.protagoniza (id_p, nombre)
values
	(1, 'Shameik Moore'),
	(2, 'Tom Holland'),
	(2, 'Zendaya'),
	(3, 'Tom Holland'),
	(3, 'Zendaya'),
	(3, 'Jake Gyllenhaal'),
	(4, 'Tobey Maguire'),
	(4, 'Kirsten Dunst'),
	(5, 'Tobey Maguire'),
	(5, 'Kirsten Dunst'),
	(6, 'Tobey Maguire'),
	(6, 'Kirsten Dunst'),
	(6, 'James Franco'),
	(7, 'Tom Holland'),
	(7, 'Zendaya'),
	(7, 'Alfred Molina');

--Insertamos datos en la tabla Dirige
insert into proyecto.dirige (id_p, nombre)
values
	(1, 'Bob Persichetti'),
	(1, 'Peter Ramsey'),
	(1, 'Rodney Rothman'),
	(2, 'Jon Watts'),
	(4, 'Sam Raimi'),
	(5, 'Sam Raimi'),
	(6, 'Sam Raimi'),
	(7, 'Jon Watts');

--Insertamos datos en la tabla Reparto
insert into proyecto.reparto (id_p, nombre)
values
	(1, 'Hailee Steinfeld'),
	(1, 'Mahershala Ali'),
	(1, 'Liev Schreiber'),
	(2, 'Zendaya'),
	(3, 'Zendaya'),
	(3, 'Jake Gyllenhaal'),
	(4, 'Willem Dafoe'),
	(4, 'James Franco'),
	(5, 'Alfred Molina'),
	(5, 'James Franco'),
	(6, 'James Franco'),
	(7, 'Willem Dafoe'),
	(7, 'Andrew Garfield'),
	(7, 'Tobey Maguire'),
	(7, 'Emma Stone');

--Insertamos datos en la tabla Cine
insert into proyecto.cine (nom_cine, telefono, direccion)
values
	('Cinepolis', '1234567890', 'Calle Principal 123'),
	('AMC Theatres', '0987654321', 'Avenida Central 456'),
	('Regal Cinemas', '1112223333', 'Boulevard Central 789');

--Insertamos datos en la tabla Salas
insert into proyecto.salas (num_sala, cant_butacas, nom_cine)
values
	(1, 150, 'Cinepolis'),
	(2, 200, 'AMC Theatres'),
	(3, 180, 'Cinepolis'),
	(4, 170, 'AMC Theatres'),
	(5, 160, 'Regal Cinemas'),
	(6, 120, 'Regal Cinemas');

--Insertamos datos en la tabla Funciones
insert into proyecto.funciones (cod_fun, fecha, h_comienzo, id_p, num_sala)
values
	(1, '2024-05-05', '14:00:00', 1, 1),
	(2, '2024-05-05', '16:30:00', 2, 2),
	(3, '2024-05-06', '15:00:00', 3, 3),
	(4, '2024-05-06', '18:00:00', 4, 4),
	(5, '2024-05-07', '14:30:00', 5, 5),
	(6, '2024-05-07', '17:30:00', 6, 6),
	(7, '2024-05-08', '16:00:00', 7, 2),
	(8, '2024-05-08', '19:00:00', 1, 4),
	(9, '2024-05-09', '15:30:00', 2, 6),
	(10, '2024-05-09', '18:30:00', 3, 1);
