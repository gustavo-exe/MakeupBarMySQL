USE MakeupBar;

CREATE TABLE Envio
(
	idEnvio INT NOT NULL auto_increment,
    idCliente INT,
    Direccion NVARCHAR(50),
    Telefono INT,
    idServicioDeEntrega INT,
    PRIMARY KEY (idEnvio)
)ENGINE = InnoDB;

SELECT * FROM Envio;

CREATE TABLE ProductoGeneral
(
	idCodigoDeBarra INT UNSIGNED NOT NULL,
    NombreProducto NVARCHAR(50),
    Marca NVARCHAR(50),
    PrecioUnitario INT,
    Cantidad INT,
    Descripcion NVARCHAR(100),
    PRIMARY KEY (idCodigoDeBarra)
)ENGINE = InnoDB;

SELECT * FROM ProductoGeneral;

CREATE TABLE Maquillaje
(
	idCodigoDeBarra INT unsigned NOT NULL,
    NombreDelProducto NVARCHAR(60),
    Marca NVARCHAR(50),
    TonoNumero NVARCHAR(50),
    FechaDeExpiracion DATE,
    PrecioUnitario INT,
    Cantidad INT,
    Descripcion NVARCHAR(100),
    PRIMARY KEY (idCodigoDeBarra)
)ENGINE = InnoDB;