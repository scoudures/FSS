/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT TOP 1000 [IdLeyenda]
      ,[Tag]
      ,[TextoDefault]
      ,[Estado]
      ,[DVH]
  FROM [FSS].[dbo].[Leyenda]
  --WHERE TextoDefault like '%%'
 WHERE tag like '%%'
 order by [IdLeyenda] desc
  
/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT TOP 1000 [IdIdioma]
      ,[IdLeyenda]
      ,[Texto]
      ,[Estado]
      ,[DVH]
  FROM [FSS].[dbo].[Traduccion]
  --WHERE texto like '%%'
  WHERE IdLeyenda=147

/*****************************/
USE [FSS]
GO
DECLARE @id int
INSERT INTO [dbo].[Leyenda] ([Tag],[TextoDefault],[Estado],[DVH]) VALUES ('Otros','Otros',1,'0');
select @id=@@IDENTITY
INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto],[Estado],[DVH]) VALUES (1,@id,'Otros',1,'0');
INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto],[Estado],[DVH]) VALUES (2,@id,'Others',1,'0');
INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto],[Estado],[DVH]) VALUES (3,@id,'Outros',1,'0');

