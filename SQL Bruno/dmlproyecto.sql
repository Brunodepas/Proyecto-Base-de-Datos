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
	(1, 'Argentina'),
	(1, 'Estados Unidos'),
	(2, 'Estados Unidos'),
	(3, 'Estados Unidos'),
	(4, 'Estados Unidos'),
	(5, 'Estados Unidos'),
	(6, 'Estados Unidos'),
	(7, 'Estados Unidos');

--Insertamos datos en la tabla Persona
insert into proyecto.persona (dni, nombre, nacionalidad)
values
	(1, 'Tom Holland', 'Inglaterra'),
	(2, 'Zendaya', 'Estados Unidos'),
	(3, 'Jake Gyllenhaal', 'Estados Unidos'),
	(4, 'Tobey Maguire', 'Estados Unidos'),
	(5, 'Kirsten Dunst', 'Estados Unidos'),
	(6, 'Andrew Garfield', 'Estados Unidos'),
	(7, 'Emma Stone', 'Estados Unidos'),
	(8, 'Willem Dafoe', 'Estados Unidos'),
	(9, 'Alfred Molina', 'Estados Unidos'),
	(10, 'Shameik Moore', 'Estados Unidos'),
	(11, 'Bob Persichetti', 'Estados Unidos'),
	(12, 'Peter Ramsey', 'Estados Unidos'),
	(13, 'Rodney Rothman', 'Estados Unidos'),
	(14, 'Jon Watts', 'Estados Unidos'),
	(15, 'Sam Raimi', 'Estados Unidos'),
	(16, 'James Franco', 'Estados Unidos'),
	(17, 'Hailee Steinfeld', 'Estados Unidos'),
	(18, 'Mahershala Ali', 'Estados Unidos'),
	(19, 'Liev Schreiber', 'Estados Unidos');

--Insertamos datos en la tabla Actores
insert into proyecto.actores (dni, cant_a)
values
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(16, 0),
	(17, 0),
	(18, 0),
	(19, 0);

--Insertamos datos en la tabla Directores
insert into proyecto.directores (dni, cant_d)
values
	(1, 0),
	(11, 0),
	(12, 0),
	(13, 0),
	(14, 0),
	(15, 0);

--Insertamos datos en la tabla Protagoniza
insert into proyecto.protagoniza (id_p, dni)
values
	(1, 10), -- Shameik Moore
	(2, 1),  -- Tom Holland
	(2, 2),  -- Zendaya
	(3, 1),  -- Tom Holland
	(3, 2),  -- Zendaya
	(3, 3),  -- Jake Gyllenhaal
	(4, 4),  -- Tobey Maguire
	(4, 5),  -- Kirsten Dunst
	(5, 4),  -- Tobey Maguire
	(5, 5),  -- Kirsten Dunst
	(6, 4),  -- Tobey Maguire
	(6, 5),  -- Kirsten Dunst
	(6, 16), -- James Franco
	(7, 1),  -- Tom Holland
	(7, 2),  -- Zendaya
	(7, 9);  -- Alfred Molina

--Insertamos datos en la tabla Dirige
insert into proyecto.dirige (id_p, dni)
values
	(1, 11), -- Bob Persichetti
	(1, 12), -- Peter Ramsey
	(1, 13), -- Rodney Rothman
	(2, 14), -- Jon Watts
	(4, 15), -- Sam Raimi
	(5, 15), -- Sam Raimi
	(6, 15), -- Sam Raimi
	(7, 14); -- Jon Watts

--Insertamos datos en la tabla Reparto
insert into proyecto.reparto (id_p, dni)
values
	(1, 17), -- Hailee Steinfeld
	(1, 18), -- Mahershala Ali
	(1, 19), -- Liev Schreiber
	(2, 2),  -- Zendaya
	(3, 2),  -- Zendaya
	(3, 3),  -- Jake Gyllenhaal
	(4, 8),  -- Willem Dafoe
	(4, 16), -- James Franco
	(5, 9),  -- Alfred Molina
	(5, 16), -- James Franco
	(6, 16), -- James Franco
	(7, 8),  -- Willem Dafoe
	(7, 6),  -- Andrew Garfield
	(7, 4),  -- Tobey Maguire
	(7, 7);  -- Emma Stone

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
