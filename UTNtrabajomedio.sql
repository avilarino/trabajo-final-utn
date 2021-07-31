-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2021 a las 00:23:08
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tareagrupal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Vino Tinto', 'Malbec', 0, '2021-06-20 14:55:23', '2021-07-16 15:47:22'),
(2, 'Vino Blanco', 'Chardonnay', 0, '2021-06-22 10:11:49', '2021-06-22 10:14:34'),
(3, 'Vino Rosado', 'Hollejo Tinto', 0, '2021-06-22 10:11:49', '2021-07-09 16:09:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `telefono`, `direccion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(4, 'Javier ', 'Mascherano', 2147483647, 'Argentina', 1, '2021-06-28 15:13:48', '2021-06-28 16:15:00'),
(6, 'Lionel', 'Messi', 2147483647, 'Barcelona', 0, '2021-06-28 15:21:06', '2021-06-28 15:21:06'),
(7, 'Angela', 'Merkel', 2147483647, 'Alemania', 0, '2021-06-28 15:21:37', '2021-06-28 15:21:37'),
(8, 'Elon', 'Musk', 2147483647, 'california', 0, '2021-06-28 15:22:12', '2021-07-10 15:03:40'),
(9, 'agustin', 'sanchez', 3454643, 'Argentina ', 1, '2021-07-10 14:18:03', '2021-07-10 14:18:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_imagenes`
--

CREATE TABLE `empleados_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_imagenes`
--

INSERT INTO `empleados_imagenes` (`id`, `uid`, `id_empleado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(4, 'dce6531a-f018-4168-bfa2-0dd0a2b10bde.jpeg', 4, 0, '2021-06-28 15:13:48', '2021-06-28 15:13:48'),
(6, 'bafdbb72-acf4-4f42-8292-4751717a3b95.png', 6, 0, '2021-06-28 15:21:07', '2021-06-28 15:21:07'),
(7, '55445298-f83a-4fa6-b38f-38a272dd5681.jpeg', 7, 0, '2021-06-28 15:21:37', '2021-06-28 15:21:37'),
(8, 'ef328227-3c32-442d-a749-864a44c95655.jpeg', 8, 0, '2021-06-28 15:22:13', '2021-06-28 15:22:13'),
(9, '400763b2-22fa-4a32-8b08-04f708325c58.jpeg', 9, 1, '2021-07-10 14:18:03', '2021-07-10 14:18:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'avilarino12', 'lic.avilarino@gmail.com', 2147483647, 1500, 1, 1, '2021-06-20 14:57:07', '2021-07-12 16:16:33'),
(2, 'Aves', 'Malbec, Mendoza 2008, Argentina', 1500, 2000, 1, 0, '2021-06-22 10:06:05', '2021-07-08 10:26:00'),
(3, 'Sierras', 'Vino Malbec, San Juan 2007, Argentina', 600, 3500, 1, 0, '2021-06-22 10:08:31', '2021-07-08 10:26:11'),
(4, 'Lago', 'Malbec, San Juan 2005, Argentina', 800, 4500, 1, 0, '2021-06-22 10:10:35', '2021-07-08 10:26:20'),
(5, 'Paisajes', 'Malbec, Mendoza 2003, Argentina', 1200, 4500, 1, 0, '2021-06-22 10:10:35', '2021-07-08 10:26:29'),
(6, 'Alces', 'Chardonnay, San Juans 2003, Argentina', 800, 12000, 2, 0, '2021-06-22 10:17:34', '2021-07-08 10:26:40'),
(7, 'Mar', 'Chardonnay, Mendoza 2003, Argentina', 1200, 10000, 2, 0, '2021-06-22 10:18:29', '2021-07-08 10:27:00'),
(8, 'Atardecer', 'Chardonnay, Mendoza 2003, Argentina', 800, 20000, 3, 0, '2021-06-22 10:20:15', '2021-06-22 10:20:15'),
(9, 'Mañanas', 'Chardonnay, San Juan 2010, Argentina', 900, 10000, 3, 0, '2021-06-22 10:21:32', '2021-06-22 10:21:32'),
(10, 'Desierto', 'Chardonnay, San Juan 2008, Argentina', 1200, 10000, 3, 1, '2021-06-22 10:21:32', '2021-07-15 14:19:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `confirmacionCorreo` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(255) NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `habilitado` tinyint(4) NOT NULL DEFAULT 0,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `pass`, `mail`, `confirmacionCorreo`, `telefono`, `admin`, `habilitado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(6, 'maxi', '59f6fa8328ea0c9abe608b6bd838bafcd4940d87', 'lic.avilarino@gmail.com', '6654b42e-77b5-4b64-8e1b-7043b8238fd1', 1234567, 1, 1, 0, '2021-07-06 13:50:21', '2021-07-19 10:44:41'),
(20, 'juan', 'd96dbce9b3a3a2a2165a9bd59cdd59bc2078cf77', 'psi.agustinvilarino@gmail.com', '77f6ad5e-3be5-4087-9d30-1dd5ac45e924', 1234567, 0, 1, 0, '2021-07-31 19:13:00', '2021-07-31 19:13:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD CONSTRAINT `empleados_imagenes_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
