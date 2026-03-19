-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 01:34:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa2`
--
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `empresa2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codigo_cli` int(11) NOT NULL,
  `nombre_cli` varchar(30) NOT NULL,
  `nif` varchar(12) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `telefono` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigo_cli`, `nombre_cli`, `nif`, `direccion`, `ciudad`, `telefono`) VALUES
(1, 'badout', '1111111111', 'triunvirato', 'caba', '1111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id_dep` int(11) NOT NULL,
  `nombre_dep` varchar(30) NOT NULL,
  `ciudad_dep` varchar(30) NOT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`Id_dep`, `nombre_dep`, `ciudad_dep`, `telefono`) VALUES
(1, 'ventas', 'caba', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `codigo_empl` int(11) NOT NULL,
  `nombre_empl` varchar(30) DEFAULT NULL,
  `apellido_empl` varchar(30) DEFAULT NULL,
  `sueldo` double DEFAULT NULL CHECK (`sueldo` > 7000),
  `num_proyec` int(11) DEFAULT NULL,
  `Id_dep` int(11) NOT NULL,
  `codigo_proyec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`codigo_empl`, `nombre_empl`, `apellido_empl`, `sueldo`, `num_proyec`, `Id_dep`, `codigo_proyec`) VALUES
(1, 'leo', 'szalk', 1000000, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `codigo_proyec` int(11) NOT NULL,
  `nombre_proyec` char(20) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_prev_fin` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`codigo_proyec`, `nombre_proyec`, `precio`, `fecha_inicio`, `fecha_prev_fin`, `fecha_fin`, `codigo_cliente`) VALUES
(1, 'bbdd', 220000, '2024-06-29', '2024-06-29', '2024-06-29', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo_cli`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Id_dep`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`codigo_empl`),
  ADD KEY `Id_dep` (`Id_dep`),
  ADD KEY `codigo_proyec` (`codigo_proyec`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`codigo_proyec`),
  ADD KEY `codigo_cliente` (`codigo_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`codigo_empl`) REFERENCES `departamentos` (`Id_dep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`codigo_proyec`) REFERENCES `proyectos` (`codigo_proyec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo_cli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
