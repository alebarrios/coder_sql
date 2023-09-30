USE tennis;
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE torneo_sede;
TRUNCATE partido_torneo;
TRUNCATE resultado_partido_equipo;
TRUNCATE jugador_equipo;
TRUNCATE equipo_categoria;
TRUNCATE categoria;
TRUNCATE jugador;
TRUNCATE tipo_partido;
TRUNCATE equipo;
TRUNCATE partido;
TRUNCATE torneo;
TRUNCATE sede;
SET FOREIGN_KEY_CHECKS=1;

-- Insert en tabla `sede`

INSERT INTO `sede` (`id_sede`,`nombre`,`direccion`,`localidad`,`provincia`) VALUES (1,'El Abierto','Galvan 3920','Capital Federal','CABA');
INSERT INTO `sede` (`id_sede`,`nombre`,`direccion`,`localidad`,`provincia`) VALUES (2,'El Tennis','Fragata La Victoria 4300','Pinamar','Buenos Aires');
INSERT INTO `sede` (`id_sede`,`nombre`,`direccion`,`localidad`,`provincia`) VALUES (3,'Carilo','Casuarina y Perdíz','Carilo','Buenos Aires');
INSERT INTO `sede` (`id_sede`,`nombre`,`direccion`,`localidad`,`provincia`) VALUES (4,'Buenavista','Uruguay y Panamericana','San Isdro','Buenos Aires');

-- Insert en tabla `jugador`

INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (1,'gfranco@gmail.com','Gaston','Franco','1990-12-05',0,'12345678','Buenos Aires','Empleado',0,0,85,170);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (2,'mrandazzo@hotmail.com','Martin','Randazzo','1996-02-27',0,'11111111','Pinamar','Estudiante',0,1,75,172);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (3,'Smaddoni@gmail.com','Sebastian','Maddonni','1987-03-05',0,'22222222','Buenos Aires','Empleado',1,1,84,180);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (4,'ddigna@hotmail.com','Danilo','Dignani','1991-11-21',0,'55555555','Buenos Aires','Medico',0,0,80,175);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (5,'spujo@gmail.com','Sacha','Pujo','1980-04-20',0,'12343215','Buenos Aires','Abogado',1,0,78,178);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (6,'merep@hotmail.com','Maria Elisa','Repetto','1995-10-15',1,'78946541','Buenos Aires','Psicologa',0,1,55,160);
INSERT INTO `jugador` (`id_jugador`,`email`,`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`telefono_particular`,`lugar_residencia`,`ocupacion`,`mano_habil`,`tipo_reves`,`peso`,`altura`) VALUES (7,'ggarcia2@hotmail.com','Geraldine','Garcia','1999-01-26',1,'14586564','Buenos Aires','Maestra',0,0,60,163);

-- Insert en tabla `tipo_partido`

INSERT INTO `tipo_partido` (`id_tipo_partido`,`nombre`,`single_doble`,`genero`) VALUES (1,'single caballeros',0,0);
INSERT INTO `tipo_partido` (`id_tipo_partido`,`nombre`,`single_doble`,`genero`) VALUES (2,'dobles caballeros',1,0);
INSERT INTO `tipo_partido` (`id_tipo_partido`,`nombre`,`single_doble`,`genero`) VALUES (3,'single damas',0,1);
INSERT INTO `tipo_partido` (`id_tipo_partido`,`nombre`,`single_doble`,`genero`) VALUES (4,'dobles damas',1,1);
INSERT INTO `tipo_partido` (`id_tipo_partido`,`nombre`,`single_doble`,`genero`) VALUES (5,'dobles mixto',1,2);

-- Insert en tabla `equipo`

INSERT INTO `equipo` (`id_equipo`,`id_tipo_partido`) VALUES (3,1);
INSERT INTO `equipo` (`id_equipo`,`id_tipo_partido`) VALUES (1,2);
INSERT INTO `equipo` (`id_equipo`,`id_tipo_partido`) VALUES (2,2);
INSERT INTO `equipo` (`id_equipo`,`id_tipo_partido`) VALUES (4,3);
INSERT INTO `equipo` (`id_equipo`,`id_tipo_partido`) VALUES (5,3);

-- Insert en tabla `jugador_equipo`

INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (1,1);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (2,1);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (3,2);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (4,2);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (5,3);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (6,4);
INSERT INTO `jugador_equipo` (`id_jugador`,`id_equipo`) VALUES (7,5);

-- Insert en tabla `categoria`

INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (1,'2a',1,20);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (2,'A1',3,10);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (3,'B1',2,15);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (4,'1a',1,20);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (5,'3a',1,18);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (6,'4a',1,20);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (7,'A2',3,10);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (8,'A1',2,10);
INSERT INTO `categoria` (`id_categoria`,`nombre`,`id_tipo_partido`,`cantidad_equipos`) VALUES (9,'A2',2,10);

-- Insert en tabla `equipo_categoria`

INSERT INTO `equipo_categoria` (`id_equipo`,`id_categoria`,`fecha_desde`,`puntos`,`estado`) VALUES (1,3,'2015-10-09',750,1);
INSERT INTO `equipo_categoria` (`id_equipo`,`id_categoria`,`fecha_desde`,`puntos`,`estado`) VALUES (2,3,'2019-01-11',210,1);
INSERT INTO `equipo_categoria` (`id_equipo`,`id_categoria`,`fecha_desde`,`puntos`,`estado`) VALUES (3,1,'2018-05-04',100,0);
INSERT INTO `equipo_categoria` (`id_equipo`,`id_categoria`,`fecha_desde`,`puntos`,`estado`) VALUES (4,2,'2016-12-01',500,1);
INSERT INTO `equipo_categoria` (`id_equipo`,`id_categoria`,`fecha_desde`,`puntos`,`estado`) VALUES (5,2,'2020-07-02',420,1);

-- Insert en tabla `torneo`

INSERT INTO `torneo` (`id_torneo`,`id_categoria`,`nombre`,`fecha_inicio`,`fecha_fin`,`cant_partidos`,`tipo_torneo`) VALUES (1,3,'Madrid 2023','2023-04-01',NULL,8,'Grupos');
INSERT INTO `torneo` (`id_torneo`,`id_categoria`,`nombre`,`fecha_inicio`,`fecha_fin`,`cant_partidos`,`tipo_torneo`) VALUES (2,2,'Shangai F 2023','2023-05-02',NULL,10,'Playoffs');
INSERT INTO `torneo` (`id_torneo`,`id_categoria`,`nombre`,`fecha_inicio`,`fecha_fin`,`cant_partidos`,`tipo_torneo`) VALUES (3,1,'Hamburgo 2022','2022-07-25','2022-09-24',8,'Playoffs');

-- Insert en tabla `torneo_sede` 

INSERT INTO `torneo_sede` (`id_torneo`,`id_sede`) VALUES (3,1);
INSERT INTO `torneo_sede` (`id_torneo`,`id_sede`) VALUES (2,2);
INSERT INTO `torneo_sede` (`id_torneo`,`id_sede`) VALUES (1,3);

-- Insert en tabla `partido`

INSERT INTO `partido` (`id_partido`,`id_sede`,`fecha`,`hora`,`id_tipo_partido`) VALUES (1,1,'2017-01-02','19:00:00',3);
INSERT INTO `partido` (`id_partido`,`id_sede`,`fecha`,`hora`,`id_tipo_partido`) VALUES (2,1,'2017-04-22','20:00:00',3);
INSERT INTO `partido` (`id_partido`,`id_sede`,`fecha`,`hora`,`id_tipo_partido`) VALUES (3,1,'2018-11-02','14:00:00',2);
INSERT INTO `partido` (`id_partido`,`id_sede`,`fecha`,`hora`,`id_tipo_partido`) VALUES (4,2,'2023-05-05','17:00:00',2);
INSERT INTO `partido` (`id_partido`,`id_sede`,`fecha`,`hora`,`id_tipo_partido`) VALUES (5,2,'2023-04-29','09:00:00',2);

-- Insert en tabla `resultado_partido_equipo`

INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (1,4,0,6263,2,7);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (1,5,1,2636,-2,-7);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (2,4,1,67546,-1,-6);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (2,5,0,605764,1,6);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (3,1,0,7576,2,3);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (3,2,1,5767,-2,-3);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (4,1,0,6162,2,9);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (4,2,1,1626,-2,-9);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (5,1,0,644660,1,6);
INSERT INTO `resultado_partido_equipo` (`id_partido`,`id_equipo`,`ganado_perdido`,`resultado`,`dif_sets`,`dif_games`) VALUES (5,2,1,466406,-1,-6);

-- Insert en tabla `partido_torneo`

INSERT INTO `partido_torneo` (`id_partido`,`id_torneo`,`fase`,`nro_partido`) VALUES (4,2,'8vos',1);
INSERT INTO `partido_torneo` (`id_partido`,`id_torneo`,`fase`,`nro_partido`) VALUES (5,2,'8vos',2);

-- Fin