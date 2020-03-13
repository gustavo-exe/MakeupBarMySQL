use MakeupBar;
CREATE VIEW `Vista_facturas` AS
select   b.IdDetalleDeFactura, p.IdFactura,p.FechaActual,p.IdEmpleado,b.Descripcion,b.PrecioUnitario,
b.Cantidad,b.TotalProducto,p.SubTotal,p.Descuento,
p.SubTotalFactura,p.IVA,p.TotalFactura from factura as p join detallefactura as b on p.IdFactura = b.IdFactura;

select * from makeupbar.vista_facturas;

