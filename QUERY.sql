USE MAKEUPBAR;

CREATE TABLE Empleado(
idEmpleado int ,
Usuario varchar(50) not null,
Contraseña varchar(50) not null,
Rol varchar(50) not null,
primary key(idEmpleado)
)ENGINE=InnoDB;


CREATE TABLE Instagram
(
	IdInstagram int auto_increment,
    IdCliente int not null,
    Usuario varchar(50),
    URL varchar(100),
    primary key(IdInstagram)
)ENGINE = InnoDB;


CREATE TABLE Cliente
(
	IdCliente varchar(15) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Correo VARCHAR(50),
    Telefono VARCHAR(9),
    PerfilInstagram VARCHAR(30),
    Cumpleaños DATETIME,
    Ciudad VARCHAR(50),
    TonoDeBase VARCHAR(40),
    TonoDePolvo VARCHAR(40),
    TipoDeCuties VARCHAR(40),
    PRIMARY KEY (IdCliente)
)ENGINE = InnoDB;

CREATE TABLE Compra
(
	IdCompra INT NOT NULL AUTO_INCREMENT,
    IDProveedor INT NOT NULL,
    NombreDelProducto VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL,
    Costo FLOAT NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (IdCompra)
)ENGINE = InnoDB;

CREATE TABLE ServicioDeEntrega(
	IdServicioEntrega int not null auto_increment,
	nombreEmpresa varchar(50) not null,
	nombreContrato varchar(50) not null,
	telefono varchar(9) not null,
	correo varchar(30),
	primary key (IdServicioEntrega)
)ENGINE=InnoDB;

CREATE TABLE Proveedor(
	IdProveedor int not null auto_increment,
	nombreEmpresa varchar(50) not null,
	nombreDelContrato varchar(50) not null,
	telefonoContacto varchar(8) not null,
	correo varchar(30) not null,
	descripcion varchar(50) not null,
	primary key (IdProveedor)
)ENGINE=InnoDB;

CREATE TABLE Envio
(
	idEnvio INT NOT NULL auto_increment,
    idCliente varchar(15),
    Direccion VARCHAR(50),
    Telefono varchar(9),
    idServicioDeEntrega INT,
    PRIMARY KEY (idEnvio)
)ENGINE = InnoDB;

CREATE TABLE ProductoGeneral
(
	idCodigoDeBarra INT UNSIGNED NOT NULL,
    NombreProducto VARCHAR(50),
    Marca VARCHAR(50),
    PrecioUnitario INT,
    Cantidad INT,
    Descripcion NVARCHAR(100),
    PRIMARY KEY (idCodigoDeBarra)
)ENGINE = InnoDB;

CREATE TABLE Maquillaje
(
	idCodigoDeBarra INT unsigned NOT NULL,
    NombreDelProducto VARCHAR(60),
    Marca VARCHAR(50),
    TonoNumero VARCHAR(50),
    FechaDeExpiracion DATE,
    PrecioUnitario INT,
    Cantidad INT,
    Descripcion NVARCHAR(100),
    PRIMARY KEY (idCodigoDeBarra)
)ENGINE = InnoDB;

CREATE TABLE `factura` (
  `IdFactura` int NOT NULL AUTO_INCREMENT,
  `FechaActual` datetime NOT NULL,
  `IdEmpleado` varchar(45) NOT NULL,
  `SubTotal` float NOT NULL,
  `Descuento` float NOT NULL,
  `SubTotalFactura` float NOT NULL,
  `IVA` float NOT NULL,
  `TotalFactura` float NOT NULL,
  PRIMARY KEY (`IdFactura`)
) ENGINE=InnoDB;


CREATE TABLE `detallefactura` (
  `IdDetalleDeFactura` int NOT NULL AUTO_INCREMENT,
  `IdFactura` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `PrecioUnitario` float NOT NULL,
  `Cantidad` int NOT NULL,
  `TotalProducto` float NOT NULL,
  PRIMARY KEY (`IdDetalleDeFactura`)
) ENGINE=InnoDB;


CREATE TABLE inventario(
	idInventario int auto_increment ,
    idCodigoDeBarra int,
    costoTotal float,
    idProveedor int,
    primary Key(idInventario)
)ENGINE = InnoDB;

CREATE TABLE Envio
(
	idEnvio INT NOT NULL auto_increment,
    idCliente INT,
    Direccion NVARCHAR(50),
    Telefono INT,
    idServicioDeEntrega INT,
    PRIMARY KEY (idEnvio)
)ENGINE = InnoDB;

