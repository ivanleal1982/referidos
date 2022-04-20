-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-04-2022 a las 09:12:40
-- Versión del servidor: 5.7.37-cll-lve
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bell_cms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--
------------------------------------------------------

--
-- Estructura de tabla para la tabla `ref_descuento`
--

CREATE TABLE `ref_descuento` (
  `id_descuento` int(11) NOT NULL,
  `cedula_descuento` int(20) NOT NULL,
  `porcentaje_descuento` int(2) NOT NULL,
  `montopromedio_descuento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ref_servicio`
--

CREATE TABLE `ref_servicio` (
  `id_servicio` int(10) NOT NULL,
  `cedula_servicio` int(20) NOT NULL,
  `fecha_servicio` date NOT NULL,
  `monto_servicio` int(10) NOT NULL,
  `tipo_servicio` int(5) NOT NULL,
  `vez_servicio` int(5) NOT NULL,
  `usado_servicio` int(1) NOT NULL,
  `porcentajeher_servicio` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ref_servicio`
--

INSERT INTO `ref_servicio` (`id_servicio`, `cedula_servicio`, `fecha_servicio`, `monto_servicio`, `tipo_servicio`, `vez_servicio`, `usado_servicio`, `porcentajeher_servicio`) VALUES
(1, 14774806, '2022-03-16', 100, 1, 1, 0, 5),
(2, 17159226, '2022-03-16', 150, 2, 1, 0, 0),
(7, 14774806, '2022-03-17', 125, 1, 1, 0, 0),
(8, 14774806, '2022-03-17', 125, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ref_tipo_servicio`
--

CREATE TABLE `ref_tipo_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ref_tipo_servicio`
--

INSERT INTO `ref_tipo_servicio` (`id_tipo_servicio`, `nombre_servicio`) VALUES
(1, 'Cejas - Maquillaje Permanente'),
(2, 'Ojos - Maquillaje Permanente'),
(3, 'Labios - Maquillaje Permanente'),
(4, 'Lunar - Maquillaje Permanente'),
(5, 'Limpieza de Cutis'),
(6, 'Ultracavitacion'),
(7, 'Carboxiterapia'),
(8, 'Hidrolipoclasia'),
(9, 'Blefaroplastia'),
(10, 'Hidrofast'),
(11, 'Lipomoldeadora'),
(12, 'Cejas - Microblading'),
(13, 'Ultralift');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ref_usuario`
--

CREATE TABLE `ref_usuario` (
  `id_usuario` int(10) NOT NULL,
  `cedula_usuario` int(20) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `apellido_usuario` varchar(100) NOT NULL,
  `telefono_usuario` varchar(20) NOT NULL,
  `email_usuario` varchar(100) DEFAULT NULL,
  `referidopor_usuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ref_usuario`
--

INSERT INTO `ref_usuario` (`id_usuario`, `cedula_usuario`, `nombre_usuario`, `apellido_usuario`, `telefono_usuario`, `email_usuario`, `referidopor_usuario`) VALUES
(3, 5580019, 'Sofia', 'Gonzalez', '04128022262', 'sofiagonzalezmor@hotmail.com', 17159226),
(4, 6176520, 'Maria', 'Surumay', '04168091820', 'masig.jj.jj@gmail.com', 14774806),
(1, 14774806, 'Ivan', 'Leal', '04242146757', 'ivanleal1982@gmail.com', 0),
(2, 17159226, 'Monica', 'Aponte', '04126155230', 'monicaaponteg@gmail.com', 14774806);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seopos`
--
--
-- Indices de la tabla `ref_descuento`
--
ALTER TABLE `ref_descuento`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `ref_servicio`
--
ALTER TABLE `ref_servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `ref_tipo_servicio`
--
ALTER TABLE `ref_tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `ref_usuario`
--
ALTER TABLE `ref_usuario`
  ADD PRIMARY KEY (`cedula_usuario`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);
--
-- AUTO_INCREMENT de la tabla `ref_descuento`
--
ALTER TABLE `ref_descuento`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ref_servicio`
--
ALTER TABLE `ref_servicio`
  MODIFY `id_servicio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ref_tipo_servicio`
--
ALTER TABLE `ref_tipo_servicio`
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ref_usuario`
--
ALTER TABLE `ref_usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
