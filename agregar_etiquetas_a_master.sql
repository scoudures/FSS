USE [FSS]
GO
--agrego etiquetas a master (pagina de inicio)
DECLARE @permiso as int
SET @permiso = 213
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (1,@permiso,1,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (501,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (502,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (503,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (504,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (505,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (506,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (508,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (509,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (510,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (511,@permiso,0,1,'0');
INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado],[DVH]) VALUES (512,@permiso,0,1,'0');