/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT TOP 1000 [id]
      ,[fecha]
      ,[id_suceso_tipo]
      ,[usuario]
      ,[descripcion]
      ,[Estado]
      ,[DVH]
  FROM [FSS].[dbo].[Suceso]
  order by fecha desc