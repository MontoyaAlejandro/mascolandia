-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2021 a las 23:59:19
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
-- Base de datos: `sprint2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_clientePk` int(11) NOT NULL,
  `Nombre_cliente` text DEFAULT NULL,
  `Telefono_cliente` int(11) DEFAULT NULL,
  `Direccion_cliente` text DEFAULT NULL,
  `email_cliente` text DEFAULT NULL,
  `nota_mascotas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_productoPk` int(11) NOT NULL,
  `Precio_compra` double NOT NULL,
  `Precio_venta` double NOT NULL,
  `nombre_producto` text NOT NULL,
  `unidad_medida` text NOT NULL,
  `stock` int(11) NOT NULL,
  `Nit_proveedorFk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Nit_proveedorPk` int(11) NOT NULL,
  `Email_proveedor` text DEFAULT NULL,
  `nombre_proveedor` text NOT NULL,
  `telefono_proveedor` int(11) NOT NULL,
  `direccion_proveedor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_productos_ventas`
--

CREATE TABLE `relacion_productos_ventas` (
  `Fecha_venta` date NOT NULL,
  `Efectivo_pago` double NOT NULL,
  `Efectivo_cambio` double NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Id_productoFk` int(11) NOT NULL,
  `Id_ventaFk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `Nit_TiendaPk` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Direccion` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuarioPk` int(11) NOT NULL,
  `contrasena` text DEFAULT NULL,
  `nombre_usuario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Id_ventaPk` int(11) NOT NULL,
  `Nit_TiendaFk` int(11) NOT NULL,
  `id_clienteFk` int(11) NOT NULL,
  `Id_usuarioFk` int(11) NOT NULL,
  `Descuentos` double NOT NULL,
  `Total_venta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_clientePk`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_productoPk`),
  ADD KEY `Nit_proveedorFk` (`Nit_proveedorFk`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Nit_proveedorPk`);

--
-- Indices de la tabla `relacion_productos_ventas`
--
ALTER TABLE `relacion_productos_ventas`
  ADD KEY `Id_productoFk` (`Id_productoFk`),
  ADD KEY `Id_ventaFk` (`Id_ventaFk`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`Nit_TiendaPk`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuarioPk`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Id_ventaPk`),
  ADD KEY `id_clienteFk` (`id_clienteFk`),
  ADD KEY `Nit_TiendaFk` (`Nit_TiendaFk`),
  ADD KEY `Id_usuarioFk` (`Id_usuarioFk`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Nit_proveedorFk`) REFERENCES `proveedor` (`Nit_proveedorPk`);

--
-- Filtros para la tabla `relacion_productos_ventas`
--
ALTER TABLE `relacion_productos_ventas`
  ADD CONSTRAINT `relacion_productos_ventas_ibfk_1` FOREIGN KEY (`Id_productoFk`) REFERENCES `productos` (`Id_productoPk`),
  ADD CONSTRAINT `relacion_productos_ventas_ibfk_2` FOREIGN KEY (`Id_ventaFk`) REFERENCES `ventas` (`Id_ventaPk`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_clienteFk`) REFERENCES `clientes` (`Id_clientePk`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`Nit_TiendaFk`) REFERENCES `tienda` (`Nit_TiendaPk`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`Id_usuarioFk`) REFERENCES `usuario` (`Id_usuarioPk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
