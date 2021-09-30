-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-09-2021 a las 20:44:04
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mascolandia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ident_Cliente` int(11) NOT NULL,
  `nombre_Cliente` varchar(100) NOT NULL,
  `telefono_Cliente` int(11) NOT NULL,
  `direccion_Cliente` varchar(100) NOT NULL,
  `email_Cliente` varchar(100) NOT NULL,
  `nota_Mascotas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `producto_Id` varchar(100) NOT NULL,
  `venta_Id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_Factura` date DEFAULT current_timestamp(),
  `descuentos` double NOT NULL,
  `total_Venta` double NOT NULL,
  `efectivo` double NOT NULL,
  `cambio` double NOT NULL,
  `consecutivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_Producto` varchar(20) NOT NULL,
  `seccion` varchar(100) NOT NULL,
  `nombre_Producto` varchar(100) NOT NULL,
  `unidad_Medida` varchar(100) NOT NULL,
  `precio_Compra` double NOT NULL,
  `precio_Venta` double NOT NULL,
  `stock` int(11) NOT NULL,
  `nit_Proveedor` int(11) NOT NULL,
  `impuestos` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nit_Proveedor` int(11) NOT NULL,
  `nombre_Proveedor` varchar(100) NOT NULL,
  `telefono_Proveedor` int(11) NOT NULL,
  `email_Proveedor` varchar(100) NOT NULL,
  `direccion_Proveedor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `nit_Tienda` int(11) NOT NULL,
  `nombre_Tienda` varchar(100) NOT NULL,
  `direccion_Tienda` varchar(100) NOT NULL,
  `email_Tienda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_Usuario` int(11) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `nombre_Usuario` varchar(100) NOT NULL,
  `apellido_Usuario` varchar(100) NOT NULL,
  `indent_Usuario` int(11) NOT NULL,
  `telefono_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_Venrta` int(11) NOT NULL,
  `cliente_Ident` int(11) NOT NULL,
  `tienda_Nit` int(11) NOT NULL,
  `uusuario_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ident_Cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`consecutivo`),
  ADD KEY `producto_Id` (`producto_Id`),
  ADD KEY `venta_Id` (`venta_Id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_Producto`),
  ADD KEY `nit_Proveedor` (`nit_Proveedor`),
  ADD KEY `nit_Proveedor_2` (`nit_Proveedor`),
  ADD KEY `id_Producto` (`id_Producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`nit_Proveedor`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`nit_Tienda`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_Usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_Venrta`),
  ADD KEY `cliente_Ident` (`cliente_Ident`),
  ADD KEY `tienda_Nit` (`tienda_Nit`),
  ADD KEY `uusuario_Id` (`uusuario_Id`),
  ADD KEY `id_Venrta` (`id_Venrta`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ident_Cliente`) REFERENCES `ventas` (`cliente_Ident`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`producto_Id`) REFERENCES `productos` (`id_Producto`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`venta_Id`) REFERENCES `ventas` (`id_Venrta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`nit_Proveedor`) REFERENCES `proveedor` (`nit_Proveedor`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`nit_Tienda`) REFERENCES `ventas` (`tienda_Nit`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `ventas` (`uusuario_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
