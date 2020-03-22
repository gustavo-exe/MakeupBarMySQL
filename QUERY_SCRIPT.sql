-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema makeuppruebas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema makeuppruebas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `makeuppruebas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `makeuppruebas` ;

-- -----------------------------------------------------
-- Table `makeuppruebas`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`cliente` (
  `IdCliente` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Correo` VARCHAR(50) NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  `PerfilInstagram` VARCHAR(30) NULL DEFAULT NULL,
  `Cumpleaños` DATETIME NULL DEFAULT NULL,
  `Ciudad` VARCHAR(50) NULL DEFAULT NULL,
  `TonoDeBase` VARCHAR(40) NULL DEFAULT NULL,
  `TonoDePolvo` VARCHAR(40) NULL DEFAULT NULL,
  `TipoDeCuties` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`IdCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`proveedor` (
  `IdProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` VARCHAR(50) NOT NULL,
  `nombreDelContacto` VARCHAR(50) NOT NULL,
  `telefonoContacto` VARCHAR(9) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`compra` (
  `IdCompra` INT NOT NULL AUTO_INCREMENT,
  `IDProveedor` INT NOT NULL,
  `NombreDelProducto` VARCHAR(50) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Costo` FLOAT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  INDEX `IDProveedorFK_idx` (`IDProveedor` ASC) VISIBLE,
  CONSTRAINT `FK_IdProveedor(tbCompra)`
    FOREIGN KEY (`IDProveedor`)
    REFERENCES `makeuppruebas`.`proveedor` (`IdProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`empleado` (
  `idEmpleado` INT NOT NULL,
  `Usuario` VARCHAR(50) NOT NULL,
  `Contraseña` VARCHAR(50) NOT NULL,
  `Rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`factura` (
  `IdFactura` INT NOT NULL AUTO_INCREMENT,
  `FechaActual` DATETIME NOT NULL,
  `IdEmpleado` INT NOT NULL,
  `SubTotal` FLOAT NOT NULL,
  `Descuento` FLOAT NOT NULL,
  `SubTotalFactura` FLOAT NOT NULL,
  `IVA` FLOAT NOT NULL,
  `TotalFactura` FLOAT NOT NULL,
  `idCliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`IdFactura`),
  INDEX `idEmpleadoFK_idx` (`IdEmpleado` ASC) VISIBLE,
  INDEX `idClienteFK_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `FK_IdEmpleado(tbcompra)`
    FOREIGN KEY (`IdEmpleado`)
    REFERENCES `makeuppruebas`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idClienteFK`
    FOREIGN KEY (`idCliente`)
    REFERENCES `makeuppruebas`.`cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`productogeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`productogeneral` (
  `idCodigoDeBarra` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(50) NULL DEFAULT NULL,
  `Marca` VARCHAR(50) NULL DEFAULT NULL,
  `PrecioUnitario` INT NULL DEFAULT NULL,
  `Cantidad` INT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`idCodigoDeBarra`),
  UNIQUE INDEX `idCodigoDeBarra_UNIQUE` (`idCodigoDeBarra` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`maquillaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`maquillaje` (
  `idCodigoDeBarra` INT NOT NULL AUTO_INCREMENT,
  `NombreDelProducto` VARCHAR(60) NULL DEFAULT NULL,
  `Marca` VARCHAR(50) NULL DEFAULT NULL,
  `TonoNumero` VARCHAR(50) NULL DEFAULT NULL,
  `FechaDeExpiracion` DATE NULL DEFAULT NULL,
  `PrecioUnitario` INT NULL DEFAULT NULL,
  `Cantidad` INT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`idCodigoDeBarra`),
  UNIQUE INDEX `idCodigoDeBarra_UNIQUE` (`idCodigoDeBarra` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`inventario` (
  `idInventario` INT NOT NULL AUTO_INCREMENT,
  `idCodigoDeBarra` INT NULL DEFAULT NULL,
  `costoTotal` FLOAT NULL DEFAULT NULL,
  `idProveedor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idInventario`),
  INDEX `IdProveedorFK_idx` (`idProveedor` ASC) VISIBLE,
  INDEX `IdCodigodeBarraProductoGeneralFK_idx` (`idCodigoDeBarra` ASC) VISIBLE,
  CONSTRAINT `FK_IdProveedor(tbProveedor)`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `makeuppruebas`.`proveedor` (`IdProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `IdCodigodeBarraProductoGeneralFK`
    FOREIGN KEY (`idCodigoDeBarra`)
    REFERENCES `makeuppruebas`.`productogeneral` (`idCodigoDeBarra`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `IdCodigodeBarraMaquillajeFK`
    FOREIGN KEY (`idCodigoDeBarra`)
    REFERENCES `makeuppruebas`.`maquillaje` (`idCodigoDeBarra`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`detallefactura` (
  `IdDetalleDeFactura` INT NOT NULL AUTO_INCREMENT,
  `IdFactura` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `PrecioUnitario` FLOAT NOT NULL,
  `Cantidad` INT NOT NULL,
  `TotalProducto` FLOAT NOT NULL,
  `IdInventario` INT NOT NULL,
  PRIMARY KEY (`IdDetalleDeFactura`),
  INDEX `IdFacturaFK_idx` (`IdFactura` ASC) VISIBLE,
  INDEX `IdInventarioFK_idx` (`IdInventario` ASC) VISIBLE,
  CONSTRAINT `IdFacturaFK`
    FOREIGN KEY (`IdFactura`)
    REFERENCES `makeuppruebas`.`factura` (`IdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdInventarioFK`
    FOREIGN KEY (`IdInventario`)
    REFERENCES `makeuppruebas`.`inventario` (`idInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`serviciodeentrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`serviciodeentrega` (
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
-- Table `makeuppruebas`.`envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`envio` (
  `idEnvio` INT NOT NULL AUTO_INCREMENT,
  `idCliente` VARCHAR(15) NOT NULL,
  `Direccion` VARCHAR(50) NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  `idServicioDeEntrega` INT NOT NULL,
  PRIMARY KEY (`idEnvio`),
  INDEX `IdClienteFK_idx` (`idCliente` ASC) VISIBLE,
  INDEX `IdServicioEntregaFK_idx` (`idServicioDeEntrega` ASC) VISIBLE,
  CONSTRAINT `FK_IdCliente(tbenvio)`
    FOREIGN KEY (`idCliente`)
    REFERENCES `makeuppruebas`.`cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdServicioEntrega_FK`
    FOREIGN KEY (`idServicioDeEntrega`)
    REFERENCES `makeuppruebas`.`serviciodeentrega` (`IdServicioEntrega`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `makeuppruebas`.`instagram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makeuppruebas`.`instagram` (
  `IdInstagram` INT NOT NULL AUTO_INCREMENT,
  `IdCliente` VARCHAR(15) NOT NULL,
  `Usuario` VARCHAR(50) NULL DEFAULT NULL,
  `URL` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IdInstagram`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `makeuppruebas`;

DELIMITER $$
USE `makeuppruebas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `makeuppruebas`.`cliente_AFTER_INSERT` AFTER INSERT ON `cliente` FOR EACH ROW
BEGIN

insert into instagram(IdCliente, Usuario, URL)
VALUES (new.IdCliente, new.PerfilInstagram, concat('www.instagram.com/', new.PerfilInstagram));

END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
