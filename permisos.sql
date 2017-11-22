/************/
SELECT TOP 1000 [CodigoPadre]
      ,[CodigoPermiso]
      ,[Seleccionado]
      ,[Estado]
      ,[DVH]
  FROM [FSS].[dbo].[PermisoFamilia]
  where CodigoPermiso=211
/************/
SELECT TOP 1000 [CodigoPermiso]
      ,[Permiso]
      ,[Simple]
      ,[Estado]
      ,[DVH]
  FROM [FSS].[dbo].[Permiso]
where permiso like '%somos%'
  --where CodigoPermiso>500 --perfiles --1 es master--501 es default
  where CodigoPermiso=211

USE [FSS]
GO

INSERT INTO [dbo].[Permiso] ([Permiso],[Simple],[Estado],[DVH])  VALUES ('menuQuienesSomos',1,1,'0');
--Lo pongo en el Default
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (1,513,1,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (501,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (502,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (503,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (504,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (505,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (506,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (508,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (509,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (510,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (511,513,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (512,513,0,1,'0');



