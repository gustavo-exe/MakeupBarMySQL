CREATE SCHEMA Web;

CREATE TABLE Web.Instagram
(
	IdInstagram INT NOT NULL AUTO_INCREMENT,
    IDCliente INT NOT NULL,
    Usuario NVARCHAR(50),
    URL NVARCHAR(100),
    PRIMARY KEY (IdInstagram)
)ENGINE = InnoDB;

CREATE SCHEMA Persona;

CREATE TABLE Persona.Cliente
(
	IdCliente INT NOT NULL AUTO_INCREMENT,
    Nombre NVARCHAR(50) NOT NULL,
    Correo NVARCHAR(50),
    Telefono NVARCHAR(100),
    PerfilInstagram NVARCHAR(50),
    Cumpleaños DATETIME,
    Ciudad NVARCHAR(50),
    TonoDeBase NVARCHAR(40),
    TonoDePolvo NVARCHAR(40),
    TipoDeCuties NVARCHAR(40),
    PRIMARY KEY (IdCliente)
)ENGINE = InnoDB;

