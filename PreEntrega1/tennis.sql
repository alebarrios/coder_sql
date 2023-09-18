-- Creacion de Schema tennis

CREATE DATABASE `tennis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Creacion de Tablas

CREATE TABLE `tennis`.`sede` (
  `id_sede` smallint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`tipo_partido` (
  `id_tipo_partido` smallint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `single_doble` tinyint(1) NOT NULL,
  `genero` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`jugador` (
  `id_jugador` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` tinyint(1) NOT NULL,
  `telefono_particular` varchar(20) NOT NULL,
  `lugar_residencia` varchar(50) DEFAULT NULL,
  `ocupacion` varchar(30) DEFAULT NULL,
  `mano_habil` tinyint(1) DEFAULT NULL,
  `tipo_reves` tinyint(1) DEFAULT NULL,
  `peso` smallint DEFAULT NULL,
  `altura` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`equipo` (
  `id_equipo` int NOT NULL,
  `id_tipo_partido` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`jugador_equipo` (
  `id_jugador` int NOT NULL,
  `id_equipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`categoria` (
  `id_categoria` smallint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_tipo_partido` smallint NOT NULL,
  `cantidad_equipos` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`equipo_categoria` (
  `id_equipo` int NOT NULL,
  `id_categoria` smallint NOT NULL,
  `fecha_desde` date NOT NULL,
  `puntos` smallint DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`partido` (
  `id_partido` int NOT NULL,
  `id_sede` smallint NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_tipo_partido` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`resultado_partido_equipo` (
  `id_partido` int NOT NULL,
  `id_equipo` int NOT NULL,
  `ganado_perdido` tinyint(1) NOT NULL,
  `resultado` int NOT NULL,
  `dif_sets` smallint DEFAULT NULL,
  `dif_games` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`torneo` (
  `id_torneo` int NOT NULL,
  `id_categoria` smallint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `cant_partidos` smallint DEFAULT NULL,
  `tipo_torneo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`torneo_sede` (
  `id_torneo` int NOT NULL,
  `id_sede` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tennis`.`partido_torneo` (
  `id_partido` int NOT NULL,
  `id_torneo` int NOT NULL,
  `fase` varchar(30) DEFAULT NULL,
  `nro_partido` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- primary keys y foreign keys

ALTER TABLE `tennis`.`sede` 
CHANGE COLUMN `id_sede` `id_sede` SMALLINT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_sede`);

ALTER TABLE `tennis`.`tipo_partido` 
CHANGE COLUMN `id_tipo_partido` `id_tipo_partido` SMALLINT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_tipo_partido`);

ALTER TABLE `tennis`.`jugador` 
CHANGE COLUMN `id_jugador` `id_jugador` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_jugador`);

ALTER TABLE `tennis`.`equipo` 
CHANGE COLUMN `id_equipo` `id_equipo` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_equipo`),
ADD INDEX `id_tipo_partido_idx` (`id_tipo_partido` ASC) VISIBLE;

ALTER TABLE `tennis`.`equipo` 
ADD CONSTRAINT `id_tipo_partido`
  FOREIGN KEY (`id_tipo_partido`)
  REFERENCES `tennis`.`tipo_partido` (`id_tipo_partido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`jugador_equipo` 
ADD PRIMARY KEY (`id_jugador`, `id_equipo`),
ADD INDEX `id_equipo_idx` (`id_equipo` ASC) VISIBLE;

ALTER TABLE `tennis`.`jugador_equipo` 
ADD CONSTRAINT `id_jugador`
  FOREIGN KEY (`id_jugador`)
  REFERENCES `tennis`.`jugador` (`id_jugador`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_equipo`
  FOREIGN KEY (`id_equipo`)
  REFERENCES `tennis`.`equipo` (`id_equipo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`categoria` 
CHANGE COLUMN `id_categoria` `id_categoria` SMALLINT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_categoria`),
ADD INDEX `id_tipo_partido_2_idx` (`id_tipo_partido` ASC) VISIBLE;

ALTER TABLE `tennis`.`categoria` 
ADD CONSTRAINT `id_tipo_partido_2`
  FOREIGN KEY (`id_tipo_partido`)
  REFERENCES `tennis`.`tipo_partido` (`id_tipo_partido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`equipo_categoria` 
ADD PRIMARY KEY (`id_equipo`, `id_categoria`),
ADD INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE;

ALTER TABLE `tennis`.`equipo_categoria` 
ADD CONSTRAINT `id_equipo_2`
  FOREIGN KEY (`id_equipo`)
  REFERENCES `tennis`.`equipo` (`id_equipo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_categoria`
  FOREIGN KEY (`id_categoria`)
  REFERENCES `tennis`.`categoria` (`id_categoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`partido` 
CHANGE COLUMN `id_partido` `id_partido` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_partido`),
ADD INDEX `id_sede_idx` (`id_sede` ASC) VISIBLE,
ADD INDEX `id_tipo_partido_idx` (`id_tipo_partido` ASC) VISIBLE;

ALTER TABLE `tennis`.`partido` 
ADD CONSTRAINT `id_sede`
  FOREIGN KEY (`id_sede`)
  REFERENCES `tennis`.`sede` (`id_sede`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_tipo_partido_3`
  FOREIGN KEY (`id_tipo_partido`)
  REFERENCES `tennis`.`tipo_partido` (`id_tipo_partido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`resultado_partido_equipo` 
ADD PRIMARY KEY (`id_partido`, `id_equipo`),
ADD INDEX `id_equipo_3_idx` (`id_equipo` ASC) VISIBLE;

ALTER TABLE `tennis`.`resultado_partido_equipo` 
ADD CONSTRAINT `id_partido`
  FOREIGN KEY (`id_partido`)
  REFERENCES `tennis`.`partido` (`id_partido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_equipo_3`
  FOREIGN KEY (`id_equipo`)
  REFERENCES `tennis`.`equipo` (`id_equipo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`torneo` 
CHANGE COLUMN `id_torneo` `id_torneo` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id_torneo`),
ADD INDEX `id_categoria_2_idx` (`id_categoria` ASC) VISIBLE;

ALTER TABLE `tennis`.`torneo` 
ADD CONSTRAINT `id_categoria_2`
  FOREIGN KEY (`id_categoria`)
  REFERENCES `tennis`.`categoria` (`id_categoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`torneo_sede` 
ADD PRIMARY KEY (`id_torneo`, `id_sede`),
ADD INDEX `id_sede_2_idx` (`id_sede` ASC) VISIBLE;

ALTER TABLE `tennis`.`torneo_sede` 
ADD CONSTRAINT `id_torneo`
  FOREIGN KEY (`id_torneo`)
  REFERENCES `tennis`.`torneo` (`id_torneo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_sede_2`
  FOREIGN KEY (`id_sede`)
  REFERENCES `tennis`.`sede` (`id_sede`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tennis`.`partido_torneo` 
ADD PRIMARY KEY (`id_partido`, `id_torneo`),
ADD INDEX `id_torneo_2_idx` (`id_torneo` ASC) VISIBLE;

ALTER TABLE `tennis`.`partido_torneo` 
ADD CONSTRAINT `id_partido_2`
  FOREIGN KEY (`id_partido`)
  REFERENCES `tennis`.`partido` (`id_partido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_torneo_2`
  FOREIGN KEY (`id_torneo`)
  REFERENCES `tennis`.`torneo` (`id_torneo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- fin
