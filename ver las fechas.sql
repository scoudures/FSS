/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT 'select distinct ' + [Attribute] + ' from ' + [Table] + ' union 
'
  FROM [FSS].[dbo].[DICCIONARIO_DATOS]
  where DataType = 'datetime'

/*
select distinct fecha from Suceso union 
select distinct fecha from Suceso_hist union 
select distinct Fecha from Torneo union 
select distinct FechaCreacion from PedidoTemporal union 
select distinct FecEntrega from Envio union 
select distinct InicioActividad from Empresa union 
select distinct FecEmision from Formulario_CAB union 
select distinct FecVto from Formulario_CAB union 
select distinct FechaNac from Usuario union 
select distinct FechaDesde from Producto_Precio union 
select distinct FechaHasta from Producto_Precio
order by 1 desc
*/
--12,11,08,07-01
--1900-01
--tambien ver el create de la tabla medio de contacto, sacar el textimage