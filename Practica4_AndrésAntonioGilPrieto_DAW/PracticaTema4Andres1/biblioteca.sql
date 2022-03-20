-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2022 a las 20:26:48
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `apellidos`) VALUES
(1, 'J.R.R ', 'Tolkien'),
(2, 'J.K', 'Rowling'),
(5, 'Carmen ', 'Mola'),
(6, 'Fernando', 'Aramburu'),
(7, 'Eva', 'García Sáenz'),
(8, 'Alice', 'Kellen'),
(9, 'Javier ', 'Cercas'),
(10, 'Luis', 'Landero'),
(11, 'Paloma ', 'Sanchez'),
(12, 'Megan', 'Maxwell');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`id`, `nombre`) VALUES
(1, 'Planeta DeAgostini'),
(2, 'El Barco de Vapor'),
(5, 'Anaya'),
(6, 'Penguin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fk_autor_id` int(11) NOT NULL,
  `fk_editorial_id` int(11) NOT NULL,
  `precio` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `fk_autor_id`, `fk_editorial_id`, `precio`) VALUES
(2, 'El Señor de los Anillos', 1, 1, 20.00),
(4, 'Harry Potter', 2, 2, 15.00),
(5, 'La Bestia', 6, 5, 22.00),
(6, 'Los Vencejos', 6, 2, 15.00),
(7, 'El Silencio de la Ciudad Blanca', 7, 1, 20.00),
(8, 'Atréveme a Retarme', 12, 5, 14.00),
(9, 'Últimos Días en Berlín', 11, 6, 15.00),
(10, '\r\n\r\n\r\nEl Castillo de Barbazul', 9, 6, 14.00),
(11, 'Una Historio Ridícula', 10, 5, 14.00),
(12, 'Test', 9, 6, 55.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ref_id` int(10) NOT NULL,
  `importe` double(10,2) NOT NULL,
  `fk_usuarios_dni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`ref_id`, `importe`, `fk_usuarios_dni`) VALUES
(40, 30.00, '12345678A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_libros`
--

CREATE TABLE `pedidos_libros` (
  `fk_libro_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fk_pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos_libros`
--

INSERT INTO `pedidos_libros` (`fk_libro_id`, `cantidad`, `fk_pedido_id`) VALUES
(4, 1, 40),
(6, 1, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni`, `nombre`, `username`, `password`) VALUES
('12345678A', 'Admin', 'Admin', 'Admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autores_id` (`fk_autor_id`),
  ADD KEY `fk_editoriales_id` (`fk_editorial_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ref_id`),
  ADD KEY `fk_usuarios_dni` (`fk_usuarios_dni`) USING BTREE;

--
-- Indices de la tabla `pedidos_libros`
--
ALTER TABLE `pedidos_libros`
  ADD KEY `fk_libro_id` (`fk_libro_id`),
  ADD KEY `fk_pedido_id` (`fk_pedido_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ref_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_autores_id` FOREIGN KEY (`fk_autor_id`) REFERENCES `autores` (`id`),
  ADD CONSTRAINT `fk_editoriales_id` FOREIGN KEY (`fk_editorial_id`) REFERENCES `editoriales` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_usuarios_dni` FOREIGN KEY (`fk_usuarios_dni`) REFERENCES `usuarios` (`dni`);

--
-- Filtros para la tabla `pedidos_libros`
--
ALTER TABLE `pedidos_libros`
  ADD CONSTRAINT `fk_libro_id` FOREIGN KEY (`fk_libro_id`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`fk_pedido_id`) REFERENCES `pedidos` (`ref_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
