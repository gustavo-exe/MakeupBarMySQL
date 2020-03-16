-- Creacion de la Base de Datos
CREATE DATABASE MakeUpBar;
USE MakeUpBar;

-- Crear el esquema "Servicio"
CREATE SCHEMA Servicio;

-- Crear la tabla "ServicioDeEntrega"
CREATE TABLE Servicio.ServicioDeEntrega(
IdServicioEntrega int not null auto_increment,
nombreEmpresa varchar(50) not null,
nombreContrato varchar(50) not null,
telefono varchar(8) not null,
correo varchar(30) not null,
primary key (IdServicioEntrega)
)ENGINE=InnoDB;


-- Crear el esquema "Persona"
CREATE SCHEMA Persona;

-- Crear la tabla "Proveedor"
CREATE TABLE Persona.Proveedor(
IdProveedor int not null auto_increment,
nombreEmpresa varchar(50) not null,
nombreDelContrato varchar(50) not null,
telefonoContacto varchar(8) not null,
correo varchar(30) not null,
descripcion varchar(50) not null,
primary key (IdProveedor)
)ENGINE=InnoDB



