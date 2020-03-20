
use MakeupBar;
##################     TABLA DETALLE DE FACTURA   ##########
-- Constraint para que la descripcion  no quede en blanco
alter table detallefactura add constraint espacio_vacio 
check (length(TRIM(Descripcion)) > 0);

-- Constraint para que el precio unitario sea mayor a 0
alter table detallefactura add constraint mayor_0
check (PrecioUnitario > 0);

-- Constraint para que la cantidad sea mayor a 0
alter table detallefactura add constraint mayor_01
check (Cantidad > 0);

-- Constraint para que el total de producto sea mayor a 0
alter table detallefactura add constraint mayor_02
check (TotalProducto > 0);

#################################     TABLA DE FACTURA  ###############################
-- Constraint para que la fecha sea igual ala fecha actual
alter table factura add constraint fecha_actual
check (length(TRIM(FechaActual)) > 0);

-- Constraint para que la fecha sea igual ala fecha actual
alter table factura add constraint espacio_vacio1
check (length(TRIM(IdEmpleado)) > 0);

-- Constraint para que el subtotal sea mayor a 0
alter table factura add constraint mayor_0
check (SubTotal > 0);

-- Constraint para que el descuento sea mayor o igual a 0
alter table factura add constraint mayor_1
check (Descuento >= 0);

-- Constraint para que el subtotal Factura sea mayor a 0
alter table factura add constraint mayor_2
check (SubTotalFactura > 0);

-- Constraint para que el IVVA( impuesto sobre el valor añadido) sea mayor a 0
alter table factura add constraint mayor_3
check (IVA >= 0);

-- Constraint para que el totalfactura  sea mayor a 0
alter table factura add constraint mayor_4
check (TotalFactura > 0);

################################CONSTRAINT DE LA TABLA SERVICIO DE ENTREGA###################################

-- Constraint para que el nombre de la empresa no quede en blanco
alter table ServicioDeEntrega add constraint espacio_vacio 
check (length(TRIM(nombreEmpresa)) > 0);

-- constraint para que el nombre del contacto no este vacio
alter table ServicioDeEntrega add constraint espacio_vacioN 
check (length(TRIM(nombreContacto)) > 0);

-- Constraint para validar el formato del telefono
alter table ServicioDeEntrega add constraint validar_Formato 
check (telefono LIKE '[8-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
OR  telefono LIKE '[3-3][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
OR telefono LIKE '[2-2][7-7][0-9][0-9]-[0-9][0-9][0-9][0-9]');


##############################TABLA DE PROVEEDOR#######################################
-- Constraint para que el nombre de la empresa no quede en blanco
alter table Proveedor add constraint espacio
check (length(TRIM(nombreEmpresa)) > 0);

-- Constraint para que el nombre del contacto no este en blanco
alter table Proveedor add constraint espacio_nombre
check (length(TRIM(nombreDelContacto)) > 0);

alter table Proveedor add constraint validar_Formato 
check (telefono LIKE '[8-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
OR  telefono LIKE '[3-3][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
OR telefono LIKE '[2-2][7-7][0-9][0-9]-[0-9][0-9][0-9][0-9]');

alter table Proveedor add constraint espacio_correo
check (length(TRIM(correo)) > 0);


###################TABLA DE ENVIO ##########################
ALTER TABLE envio
ADD CONSTRAINT chk_telefono CHECK (length(trim(telefono)) > 0),
ADD CONSTRAINT chk_direccion CHECK (length(trim(direccion))> 0),
ADD CONSTRAINT chk_telefono_formato 
CHECK (telefono like '[8-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
	   telefono like '[3-3][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR 
       telefono like '[2-2][7-7][0-9][0-9]-[0-9][0-9][0-9][0-9]'); 

#######################TABLA DE MAQUILLAJE ####################################

ALTER TABLE maquillaje
ADD CONSTRAINT chk_NomPro_NoVacio CHECK (length(trim(nombredelprodcuto))>0),
ADD CONSTRAINT chk_Marca_NoVacio CHECK (length(trim(marca))>0),
ADD CONSTRAINT chk_TonoNum_NoVacio CHECK (length(trim(tononumero))>0),
ADD CONSTRAINT chk_FechaExp_NoVacio CHECK (length(trim(fechadeexpiracion))>0),
ADD CONSTRAINT chk_PrecioUni_NoVacio CHECK (length(trim(preciounitario))>0),
ADD CONSTRAINT chk_Cantidad_NoVacio CHECK (length(trim(nombredelprodcuto))>0)
;

#######################TABLA DE PRODUCTO###############################
ALTER TABLE producto
ADD CONSTRAINT chk_CodiBar_NoVacio CHECK (length(trim(codigobarra))>0),
ADD CONSTRAINT chk_Marca_NoVacio CHECK (length(trim(marca))>0),
ADD CONSTRAINT chk_Tono_NoVacio CHECK (length(trim(tono))>0),
ADD CONSTRAINT chk_Num_NoVacio CHECK (length(trim(numero))>0),
ADD CONSTRAINT chk_fechaExp_NoVacio CHECK (length(trim(fechadeexpiracion))>0),
ADD CONSTRAINT chk_Costo_NoVacio CHECK (length(trim(costo))>0)
;

#####################TABLA DE PRODUCTO GENERAL#############################

ALTER TABLE productogeneral
ADD CONSTRAINT chk_idcoddebarr_NoVacio CHECK (length(trim(idcodigodebarra))>0),
ADD CONSTRAINT chk_nompro_NoVacio CHECK (length(trim(nombreproducto))>0),
ADD CONSTRAINT chk_marca_NoVacio CHECK (length(trim(marca))>0),
ADD CONSTRAINT chk_precuni_NoVacio CHECK (length(trim(preciounitario))>0),
ADD CONSTRAINT chk_cant_NoVacio CHECK (length(trim(cantidad))>0),
ADD CONSTRAINT chk_desc_NoVacio CHECK (length(trim(descripcion))>0)
;









