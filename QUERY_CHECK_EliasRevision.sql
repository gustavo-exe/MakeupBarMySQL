USE makeupbar;

-- - - - - - - 
-- Checks
-- - - - - - -
ALTER TABLE empleado
	add constraint CHK_Empleado_rol
    check( rol = "Administrador" or rol = "Gerente");

/* Restricciones para que los campos no esten vaciós en la tabla Instagram */
ALTER TABLE instagram 
ADD CONSTRAINT CK_IdCliente_instagram_noVacío CHECK ((LENGTH(TRIM(IdCliente)) > 0)),
ADD CONSTRAINT CK_Usuario_noVacío CHECK ((LENGTH(TRIM(Usuario)) > 0)),
ADD CONSTRAINT CK_URL_noVacío CHECK (LENGTH(TRIM(URL)) > 0);

/* Restricciones para que los campos no esten vaciós en la tabla Compra */
ALTER TABLE compra
ADD CONSTRAINT CK_NombreDelProducto_noVacío CHECK (LENGTH(TRIM(NombreDelProducto)) > 0),
ADD CONSTRAINT CK_Cantidad_noVacío CHECK ((Cantidad) > 0),
ADD CONSTRAINT CK_Costo_noVacío CHECK ((Costo) > 0),
ADD CONSTRAINT CK_Descripcion_noVacío CHECK (LENGTH(TRIM(Descripcion)) > 0);

/* Restricción unique para que el nombre del producto sea único */
ALTER TABLE compra
ADD CONSTRAINT UQ_NombredelProducto UNIQUE (NombreDelProducto);

/* Restricciones para que los campos no esten vaciós en la tabla Cliente */
ALTER TABLE cliente 
ADD CONSTRAINT CK_IdCliente_noVacío CHECK (LENGTH(TRIM(IdCliente)) > 0),
ADD CONSTRAINT CK_Nombre_noVacío CHECK (LENGTH(TRIM(Nombre)) > 0),
ADD CONSTRAINT CK_Correo_noVacío CHECK (LENGTH(TRIM(Correo)) > 0),
ADD CONSTRAINT CK_Telefono_noVacío CHECK ((LENGTH(TRIM(Telefono)) > 0)AND(LENGTH(TRIM(Telefono)) < 10)),
ADD CONSTRAINT CK_PerfilInstagram_noVacío CHECK (LENGTH(TRIM(PerfilInstagram)) > 0),
ADD CONSTRAINT CK_Ciudad_noVacío CHECK (LENGTH(TRIM(Ciudad)) > 0),
ADD CONSTRAINT CK_TonoDeBase_noVacío CHECK (LENGTH(TRIM(TonoDeBase)) > 0),
ADD CONSTRAINT CK_TonoDePolvo_noVacío CHECK (LENGTH(TRIM(TonoDePolvo)) > 0),
ADD CONSTRAINT CK_TipoDeCuties_noVacío CHECK (LENGTH(TRIM(TipoDeCuties)) > 0);

/* Máscara para validar el correo*/
ALTER TABLE cliente 
ADD CONSTRAINT CK_validar_Formato_correo CHECK (Correo LIKE '%@%');

/* Restricción unique para que el id del cliente sea único */
ALTER TABLE compra
ADD CONSTRAINT UQ_IdClienteUnico UNIQUE (IdCliente);

	
