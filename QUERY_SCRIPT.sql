-- MySQL Script generated by MySQL Workbench
-- Tue Mar 31 15:03:52 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema makeupbar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema makeupbar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `makeupbar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `makeupbar` ;

-- -----------------------------------------------------
-- Table `makeupbar`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`cliente` (
  `IdCliente` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Correo` VARCHAR(50) NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  `PerfilInstagram` VARCHAR(30) NULL DEFAULT NULL,
  `Cumpleaños` DATE NULL DEFAULT NULL,
  `Ciudad` VARCHAR(50) NULL DEFAULT NULL,
  `TonoDeBase` VARCHAR(40) NULL DEFAULT NULL,
  `TonoDePolvo` VARCHAR(40) NULL DEFAULT NULL,
  `TipoDeCuties` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`IdCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`proveedor` (
  `IdProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` VARCHAR(50) NOT NULL,
  `nombreDelContrato` VARCHAR(50) NOT NULL,
  `telefonoContacto` VARCHAR(9) NOT NULL,
  `correo` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`compra` (
  `IdCompra` INT NOT NULL AUTO_INCREMENT,
  `IDProveedor` INT NOT NULL,
  `NombreDelProducto` VARCHAR(50) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Costo` FLOAT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  INDEX `IDProveedorFK_idx` (`IDProveedor` ASC) VISIBLE,
  CONSTRAINT `IDProveedorFK`
    FOREIGN KEY (`IDProveedor`)
    REFERENCES `makeupbar`.`proveedor` (`IdProveedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`empleado` (
  `idEmpleado` VARCHAR(15) NOT NULL,
  `Usuario` VARCHAR(50) NOT NULL,
  `Contraseña` VARCHAR(50) NOT NULL,
  `Rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO empleado (idEmpleado, Usuario, Contraseña, Rol) VALUE ('9999-9999-9999','admin','admin','Administrador');

-- -----------------------------------------------------
-- Table `makeupbar`.`serviciodeentrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`serviciodeentrega` (
  `IdServicioEntrega` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` VARCHAR(50) NOT NULL,
  `nombreContrato` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(9) NOT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`IdServicioEntrega`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`envio` (
  `idEnvio` INT NOT NULL AUTO_INCREMENT,
  `idCliente` VARCHAR(15) NOT NULL,
  `Direccion` VARCHAR(50) NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  `idServicioDeEntrega` INT NOT NULL,
  PRIMARY KEY (`idEnvio`),
  INDEX `IdClienteFK_idx` (`idCliente` ASC) VISIBLE,
  INDEX `IdServicioEntregaFK_idx` (`idServicioDeEntrega` ASC) VISIBLE,
  CONSTRAINT `IdClienteFK`
    FOREIGN KEY (`idCliente`)
    REFERENCES `makeupbar`.`cliente` (`IdCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `IdServicioEntregaFK`
    FOREIGN KEY (`idServicioDeEntrega`)
    REFERENCES `makeupbar`.`serviciodeentrega` (`IdServicioEntrega`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`Factura` (
  `IdFactura` INT NOT NULL AUTO_INCREMENT,
  `FechaActual` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `IdEmpleado` VARCHAR(15) NOT NULL,
  `idCliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`IdFactura`),
  INDEX `idEmpleadoFK_idx` (`IdEmpleado` ASC) VISIBLE,
  INDEX `idClienteFK_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `FK_Factura_idEmpeado_Empelado`
    FOREIGN KEY (`IdEmpleado`)
    REFERENCES `makeupbar`.`empleado` (`idEmpleado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Factura_idCliente_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `makeupbar`.`cliente` (`IdCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`instagram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`instagram` (
  `IdInstagram` INT NOT NULL,
  `IdCliente` VARCHAR(15) NOT NULL,
  `Usuario` VARCHAR(50) NULL DEFAULT NULL,
  `URL` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IdInstagram`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`inventario` (
  `idInventario` INT NOT NULL AUTO_INCREMENT,
  `precio` FLOAT NULL,
  `idCodigoDeBarra` INT NULL,
  `Cantidad` INT NULL,
  PRIMARY KEY (`idInventario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeupbar`.`maquillaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`maquillaje` (
  `idCodigoDeBarra` INT NOT NULL AUTO_INCREMENT,
  `NombreDelProducto` VARCHAR(60) NULL DEFAULT NULL,
  `Marca` VARCHAR(50) NULL DEFAULT NULL,
  `TonoNumero` VARCHAR(50) NULL DEFAULT NULL,
  `FechaDeExpiracion` DATE NULL DEFAULT NULL,
  `PrecioUnitario` INT NULL DEFAULT NULL,
  `Cantidad` INT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idProveedor` INT NULL,
  PRIMARY KEY (`idCodigoDeBarra`),
  UNIQUE INDEX `idCodigoDeBarra_UNIQUE` (`idCodigoDeBarra` ASC) VISIBLE,
  INDEX `FK_Maquillaje_IdProveedor_Proveedor_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `FK_Maquillaje_IdProveedor_Proveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `makeupbar`.`proveedor` (`IdProveedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `makeupbar`.`maquillaje` auto_increment = 1001000000000;

-- -----------------------------------------------------
-- Table `makeupbar`.`productogeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`productogeneral` (
  `idCodigoDeBarra` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(50) NULL DEFAULT NULL,
  `Marca` VARCHAR(50) NULL DEFAULT NULL,
  `PrecioUnitario` INT NULL DEFAULT NULL,
  `Cantidad` INT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idProveedor` INT NULL,
  PRIMARY KEY (`idCodigoDeBarra`),
  UNIQUE INDEX `idCodigoDeBarra_UNIQUE` (`idCodigoDeBarra` ASC) VISIBLE,
  INDEX `FK_ProductoGeneral_IdProveedor_Proveedot_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `FK_ProductoGeneral_IdProveedor_Proveedot`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `makeupbar`.`proveedor` (`IdProveedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `makeupbar`.`productogeneral` auto_increment = 2001000000000;

-- -----------------------------------------------------
-- Table `makeupbar`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`Venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `idCliente` VARCHAR(15) NULL,
  `idEmpleado` VARCHAR(15) NULL,
  `Fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  INDEX `idVenta` USING BTREE (`idVenta`) VISIBLE,
  PRIMARY KEY (`idVenta`),
  UNIQUE INDEX `idVenta_UNIQUE` (`idVenta` ASC) VISIBLE,
  INDEX `FK_Venta_idCliene_Cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `FK_Venta_idEmpleado_Empleado_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `FK_Venta_idCliene_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `makeupbar`.`cliente` (`IdCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Venta_idEmpleado_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `makeupbar`.`empleado` (`idEmpleado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `makeupbar`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `CodigoDeBarra` INT NULL,
  `NombreDelProducto` VARCHAR(30) NULL,
  `Precio` FLOAT NULL,
  `Cantidad` INT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `makeupbar`.`DetalleDeVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeupbar`.`DetalleDeVenta` (
  `idDetalleDeVenta` INT NOT NULL AUTO_INCREMENT,
  `idVenta` INT NULL,
  `idFactura` INT NULL,
  `idProducto` INT NULL,
  `precio` FLOAT NULL,
  `Cantidad` INT NULL,
  `Descuento` INT NULL,
  PRIMARY KEY (`idDetalleDeVenta`),
  INDEX `FK_DetalleDeVenta_idVenta_Venta_idx` (`idVenta` ASC) VISIBLE,
  INDEX `FK_DetallaDeVenta_idFactura_Factura_idx` (`idFactura` ASC) VISIBLE,
  INDEX `fk_DetalleDeVenta_idProducto_Producto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `FK_DetalleDeVenta_idVenta_Venta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `makeupbar`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DetallaDeVenta_idFactura_Factura`
    FOREIGN KEY (`idFactura`)
    REFERENCES `makeupbar`.`factura` (`IdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DetalleDeVenta_idProducto_Producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `makeupbar`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `makeupbar`;

DELIMITER $$
USE `makeupbar`$$
CREATE DEFINER = CURRENT_USER TRIGGER `makeupbar`.`maquillaje_AFTER_INSERT_	Inventario` AFTER INSERT ON `maquillaje` FOR EACH ROW
BEGIN
insert into inventario(idCodigoDeBara, costoTotal, idProveedor)
values (new.idCodigoDeBarra, new.PrecioUnitario, new.idProveedor);
END$$

USE `makeupbar`$$
CREATE DEFINER = CURRENT_USER TRIGGER `makeupbar`.`maquillaje_AFTER_INSERT_	Producto` AFTER INSERT ON `maquillaje` FOR EACH ROW
BEGIN
insert into Producto(CodigoDeBara, NombreDelProducto, Precio, Cantidad)
values (new.idCodigoDeBarra, NombreDelProducto, new.PrecioUnitario, new.Cantidad);
END$$

USE `makeupbar`$$
CREATE DEFINER = CURRENT_USER TRIGGER `makeupbar`.`productogeneral_AFTER_INSERT_Inventario` AFTER INSERT ON `productogeneral` FOR EACH ROW
BEGIN
insert into inventario(idCodigoDeBara, Precio, Cantidad)
values (new.idCodigoDeBarra, new.PrecioUnitario, new.idProveedor);
END$$

USE `makeupbar`$$
CREATE DEFINER = CURRENT_USER TRIGGER `makeupbar`.`productogeneral_AFTER_INSERT_Producto` AFTER INSERT ON `productogeneral` FOR EACH ROW
BEGIN
insert into Producto(CodigoDeBara, NombreDelProducto, Precio, Cantidad)
values (new.idCodigoDeBarra, NombreDelProducto, new.PrecioUnitario, new.Cantidad);
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
