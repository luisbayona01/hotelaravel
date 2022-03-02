-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-07-2019 a las 18:21:08
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hoteles`
--

create  database  hoteles;

use hoteles;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acomodacion`
--



DROP TABLE IF EXISTS `acomodacion`;
CREATE TABLE IF NOT EXISTS `acomodacion` (
  `idacomodacion` int(11) NOT NULL AUTO_INCREMENT,
  `acomodacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idacomodacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acomodacion`
--

INSERT INTO `acomodacion` (`idacomodacion`, `acomodacion`) VALUES
(1, 'Sencilla'),
(2, 'Doble'),
(3, 'Triple'),
(4, 'Cuadruple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
CREATE TABLE IF NOT EXISTS `habitacion` (
  `idhabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `Hotel` int(11) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `idacomodacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idhabitacion`),
  KEY `idhotel_idx` (`Hotel`),
  KEY `tipohabitacion_idx` (`Tipo`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `idacomodacion_idx` (`idacomodacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `habitacionhotel`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `habitacionhotel`;
CREATE TABLE IF NOT EXISTS `habitacionhotel` (
`nombre` varchar(45)
,`cantidadhabitaciones` varchar(45)
,`tipohabitacion` varchar(45)
,`acomodacion` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `idhotel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cantidadhabitaciones` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idhotel`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `login`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
`idtipousuario` int(11)
,`idusuarios` int(11)
,`email` varchar(45)
,`nombres` varchar(45)
,`paswoord` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitacion`
--

DROP TABLE IF EXISTS `tipohabitacion`;
CREATE TABLE IF NOT EXISTS `tipohabitacion` (
  `idhabitaciontipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idhabitaciontipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipohabitacion`
--

INSERT INTO `tipohabitacion` (`idhabitaciontipo`, `tipo`) VALUES
(4, ' Estandar'),
(5, 'Junior'),
(6, 'Suite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitacion_acomodacion`
--

DROP TABLE IF EXISTS `tipohabitacion_acomodacion`;
CREATE TABLE IF NOT EXISTS `tipohabitacion_acomodacion` (
  `idtipohabitacion` int(11) DEFAULT NULL,
  `idacomodaciontipo` int(11) DEFAULT NULL,
  KEY `idacomodacion_idx` (`idacomodaciontipo`),
  KEY `idtipohabitacion` (`idtipohabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipohabitacion_acomodacion`
--

INSERT INTO `tipohabitacion_acomodacion` (`idtipohabitacion`, `idacomodaciontipo`) VALUES
(4, 1),
(4, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tipohabitacion_acomodaciones`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `tipohabitacion_acomodaciones`;
CREATE TABLE IF NOT EXISTS `tipohabitacion_acomodaciones` (
`idtipohabitacion` int(11)
,`idacomodaciontipo` int(11)
,`idhabitaciontipo` int(11)
,`tipo` varchar(45)
,`idacomodacion` int(11)
,`acomodacion` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipousuario`, `perfil`) VALUES
(1, 'Gerente-admin'),
(2, 'usuario-cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `paswoord` varchar(45) DEFAULT NULL,
  `tipousuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `Tipousuario_idx` (`tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombres`, `apellidos`, `email`, `identificacion`, `paswoord`, `tipousuario`) VALUES
(2, 'luis', 'bayona', 'astaroth1988bayona3@gmail.com', 1024482240, '123456', 1),
(13, 'camila', 'pulido', 'camilapulido1991@gmail.com', 1019066211, '123456', 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `habitacionhotel`
--
DROP TABLE IF EXISTS `habitacionhotel`;

CREATE  VIEW `habitacionhotel`  AS  select `h`.`nombre` AS `nombre`,`h`.`cantidadhabitaciones` AS `cantidadhabitaciones`,`tp`.`tipo` AS `tipohabitacion`,`a`.`acomodacion` AS `acomodacion` from (((`habitacion` `ha` join `tipohabitacion` `tp` on((`tp`.`idhabitaciontipo` = `ha`.`Tipo`))) join `hotel` `h` on((`h`.`idhotel` = `ha`.`Hotel`))) join `acomodacion` `a` on((`ha`.`idacomodacion` = `a`.`idacomodacion`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `login`
--
DROP TABLE IF EXISTS `login`;

CREATE  VIEW `login`  AS  select `t`.`idtipousuario` AS `idtipousuario`,`u`.`idusuarios` AS `idusuarios`,`u`.`email` AS `email`,`u`.`nombres` AS `nombres`,`u`.`paswoord` AS `paswoord` from (`usuarios` `u` join `tipousuario` `t`) where (`t`.`idtipousuario` = `u`.`tipousuario`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tipohabitacion_acomodaciones`
--
DROP TABLE IF EXISTS `tipohabitacion_acomodaciones`;

CREATE  VIEW `tipohabitacion_acomodaciones`  AS  select `tph`.`idtipohabitacion` AS `idtipohabitacion`,`tph`.`idacomodaciontipo` AS `idacomodaciontipo`,`tpa`.`idhabitaciontipo` AS `idhabitaciontipo`,`tpa`.`tipo` AS `tipo`,`a`.`idacomodacion` AS `idacomodacion`,`a`.`acomodacion` AS `acomodacion` from ((`tipohabitacion_acomodacion` `tph` join `tipohabitacion` `tpa` on((`tpa`.`idhabitaciontipo` = `tph`.`idtipohabitacion`))) join `acomodacion` `a` on((`a`.`idacomodacion` = `tph`.`idacomodaciontipo`))) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idacomodacionHabitacion` FOREIGN KEY (`idacomodacion`) REFERENCES `acomodacion` (`idacomodacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idhotel` FOREIGN KEY (`Hotel`) REFERENCES `hotel` (`idhotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipohabitacion` FOREIGN KEY (`Tipo`) REFERENCES `tipohabitacion` (`idhabitaciontipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipohabitacion_acomodacion`
--
ALTER TABLE `tipohabitacion_acomodacion`
  ADD CONSTRAINT `idacomodacion` FOREIGN KEY (`idacomodaciontipo`) REFERENCES `acomodacion` (`idacomodacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idtipohabitacion` FOREIGN KEY (`idtipohabitacion`) REFERENCES `tipohabitacion` (`idhabitaciontipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Tipousuario` FOREIGN KEY (`tipousuario`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
