use makeupbar;

-- - - - - - - 
-- Checks
-- - - - - - -
ALTER TABLE empleado
	add constraint CHK_Empleado_rol
    check( rol = "Administrador" or rol = "Gerente");

alter table inventario
	add constraint CHK_Inventario_costoTotal
    check(costoTotal > 0 );
    
    
	
