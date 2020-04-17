-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-04-2020 a las 19:14:05
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rentavideodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bono`
--

CREATE TABLE `bono` (
  `BONO` int(11) NOT NULL,
  `MEMBRESIA` int(11) NOT NULL,
  `MONTO` int(11) NOT NULL,
  `FECHA_BONO` int(11) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CATEGORIA` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `MEMBRESIA` int(11) NOT NULL,
  `DPI` int(11) NOT NULL,
  `NOMBRES` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `SEXO` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `EMPLEADO` int(11) NOT NULL,
  `NOMBRES` varchar(30) NOT NULL,
  `APELLIDOS` varchar(30) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `MATERIAL` int(11) NOT NULL,
  `NOMBRE` varchar(90) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `CATEGORIA` int(11) NOT NULL,
  `GENERO` varchar(50) NOT NULL,
  `AUTOR` varchar(50) NOT NULL,
  `PRECIO` decimal(10,0) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mora`
--

CREATE TABLE `mora` (
  `MORA` int(11) NOT NULL,
  `MEMBRESIA` int(11) NOT NULL,
  `MONTO` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renta_detalle`
--

CREATE TABLE `renta_detalle` (
  `ID_DETALLE` int(11) NOT NULL,
  `ID_ENCABEZADO` int(11) NOT NULL,
  `MATERIAL` int(11) NOT NULL,
  `PRECIO_UNIDAD` decimal(10,0) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renta_encabezado`
--

CREATE TABLE `renta_encabezado` (
  `ID_ENCABEZADO` int(11) NOT NULL,
  `MEMBRESIA` int(11) NOT NULL,
  `EMPLEADO` int(11) NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL,
  `DEVOLUCION` tinyint(1) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bono`
--
ALTER TABLE `bono`
  ADD PRIMARY KEY (`BONO`),
  ADD KEY `clii` (`MEMBRESIA`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CATEGORIA`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`MEMBRESIA`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`EMPLEADO`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`MATERIAL`),
  ADD KEY `cat` (`CATEGORIA`);

--
-- Indices de la tabla `mora`
--
ALTER TABLE `mora`
  ADD PRIMARY KEY (`MORA`),
  ADD KEY `cli` (`MEMBRESIA`);

--
-- Indices de la tabla `renta_detalle`
--
ALTER TABLE `renta_detalle`
  ADD PRIMARY KEY (`ID_DETALLE`),
  ADD KEY `enc` (`ID_ENCABEZADO`),
  ADD KEY `mat` (`MATERIAL`);

--
-- Indices de la tabla `renta_encabezado`
--
ALTER TABLE `renta_encabezado`
  ADD PRIMARY KEY (`ID_ENCABEZADO`),
  ADD KEY `em` (`EMPLEADO`),
  ADD KEY `men` (`MEMBRESIA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bono`
--
ALTER TABLE `bono`
  MODIFY `BONO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CATEGORIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `MEMBRESIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `MATERIAL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mora`
--
ALTER TABLE `mora`
  MODIFY `MORA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `renta_detalle`
--
ALTER TABLE `renta_detalle`
  MODIFY `ID_DETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `renta_encabezado`
--
ALTER TABLE `renta_encabezado`
  MODIFY `ID_ENCABEZADO` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bono`
--
ALTER TABLE `bono`
  ADD CONSTRAINT `clii` FOREIGN KEY (`MEMBRESIA`) REFERENCES `cliente` (`MEMBRESIA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `cat` FOREIGN KEY (`CATEGORIA`) REFERENCES `categoria` (`CATEGORIA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mora`
--
ALTER TABLE `mora`
  ADD CONSTRAINT `cli` FOREIGN KEY (`MEMBRESIA`) REFERENCES `cliente` (`MEMBRESIA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `renta_detalle`
--
ALTER TABLE `renta_detalle`
  ADD CONSTRAINT `enc` FOREIGN KEY (`ID_ENCABEZADO`) REFERENCES `renta_encabezado` (`ID_ENCABEZADO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mat` FOREIGN KEY (`MATERIAL`) REFERENCES `material` (`MATERIAL`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `renta_encabezado`
--
ALTER TABLE `renta_encabezado`
  ADD CONSTRAINT `em` FOREIGN KEY (`EMPLEADO`) REFERENCES `empleado` (`EMPLEADO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `men` FOREIGN KEY (`MEMBRESIA`) REFERENCES `cliente` (`MEMBRESIA`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
