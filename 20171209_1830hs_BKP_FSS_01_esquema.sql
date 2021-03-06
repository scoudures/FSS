USE [FSS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso] DROP CONSTRAINT [FK_Usuario_FamiliaPermiso_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_PermisoFamilia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso] DROP CONSTRAINT [FK_Usuario_FamiliaPermiso_PermisoFamilia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Leyenda]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion] DROP CONSTRAINT [FK_Traduccion_Leyenda]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Idioma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion] DROP CONSTRAINT [FK_Traduccion_Idioma]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Talle_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Talle]'))
ALTER TABLE [dbo].[Talle] DROP CONSTRAINT [FK_Talle_Linea]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [FK_Suceso_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_SucesoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [FK_Suceso_SucesoTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Recomendacion_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Recomendacion]'))
ALTER TABLE [dbo].[Recomendacion] DROP CONSTRAINT [FK_Recomendacion_Nivel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Participante]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje] DROP CONSTRAINT [FK_Puntaje_Participante]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Competencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje] DROP CONSTRAINT [FK_Puntaje_Competencia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Talle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock] DROP CONSTRAINT [FK_Producto_Stock_Talle]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock] DROP CONSTRAINT [FK_Producto_Stock_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoPrecio_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Precio]'))
ALTER TABLE [dbo].[Producto_Precio] DROP CONSTRAINT [FK_ProductoPrecio_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel] DROP CONSTRAINT [FK_Producto_Nivel_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel] DROP CONSTRAINT [FK_Producto_Nivel_Nivel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Marca]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Linea]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Color]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia] DROP CONSTRAINT [FK_PermisoFamilia_Permiso1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia] DROP CONSTRAINT [FK_PermisoFamilia_Permiso]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PedidoTemporal_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PedidoTemporal]'))
ALTER TABLE [dbo].[PedidoTemporal] DROP CONSTRAINT [FK_PedidoTemporal_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pago_Formulario_CAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pago]'))
ALTER TABLE [dbo].[Pago] DROP CONSTRAINT [FK_Pago_Formulario_CAB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_MedioPagoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago] DROP CONSTRAINT [FK_MedioPago_MedioPagoTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago] DROP CONSTRAINT [FK_MedioPago_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto] DROP CONSTRAINT [FK_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioContacto_MedioContactoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto] DROP CONSTRAINT [FK_MedioContacto_MedioContactoTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET] DROP CONSTRAINT [FK_FormularioDET_Producto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET] DROP CONSTRAINT [FK_FormularioDET_FormularioCAB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_Sucursal]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_FormularioTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioEstado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_FormularioEstado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Empresa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_Empresa]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Emisor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_Emisor]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_FormularioCAB_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Formulario_CAB_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] DROP CONSTRAINT [FK_Formulario_CAB_DomicilioTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio] DROP CONSTRAINT [FK_Envio_FormularioCAB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_EnvioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio] DROP CONSTRAINT [FK_Envio_EnvioTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] DROP CONSTRAINT [FK_ClienteDomicilio_Provincia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] DROP CONSTRAINT [FK_ClienteDomicilio_Localidad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] DROP CONSTRAINT [FK_ClienteDomicilio_DomicilioTipo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_CodigoPostal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] DROP CONSTRAINT [FK_ClienteDomicilio_CodigoPostal]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] DROP CONSTRAINT [FK_ClienteDomicilio_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [FK_Consulta_Nivel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_idTorneo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Competencia]'))
ALTER TABLE [dbo].[Competencia] DROP CONSTRAINT [FK_idTorneo]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_DVH]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [DF_Suceso_DVH]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_Estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [DF_Suceso_Estado]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_descripcion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [DF_Suceso_descripcion]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_usuario]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [DF_Suceso_usuario]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_id_suceso_tipo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] DROP CONSTRAINT [DF_Suceso_id_suceso_tipo]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_MedioContacto_Estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MedioContacto] DROP CONSTRAINT [DF_MedioContacto_Estado]
END

GO
/****** Object:  View [dbo].[vw_Supervisor]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Supervisor]'))
DROP VIEW [dbo].[vw_Supervisor]
GO
/****** Object:  View [dbo].[vw_SeguridadPermisoSimple]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadPermisoSimple]'))
DROP VIEW [dbo].[vw_SeguridadPermisoSimple]
GO
/****** Object:  View [dbo].[vw_SeguridadPermisoCompuesto]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadPermisoCompuesto]'))
DROP VIEW [dbo].[vw_SeguridadPermisoCompuesto]
GO
/****** Object:  View [dbo].[vw_SeguridadFamilia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadFamilia]'))
DROP VIEW [dbo].[vw_SeguridadFamilia]
GO
/****** Object:  View [dbo].[vw_ProductoNivel]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ProductoNivel]'))
DROP VIEW [dbo].[vw_ProductoNivel]
GO
/****** Object:  View [dbo].[vw_permiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_permiso]'))
DROP VIEW [dbo].[vw_permiso]
GO
/****** Object:  View [dbo].[vw_leyenda]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_leyenda]'))
DROP VIEW [dbo].[vw_leyenda]
GO
/****** Object:  View [dbo].[vw_familia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_familia]'))
DROP VIEW [dbo].[vw_familia]
GO
/****** Object:  View [dbo].[vw_Bitacora]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Bitacora]'))
DROP VIEW [dbo].[vw_Bitacora]
GO
/****** Object:  View [dbo].[vw_Usuario_FamiliaPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Usuario_FamiliaPermiso]'))
DROP VIEW [dbo].[vw_Usuario_FamiliaPermiso]
GO
/****** Object:  View [dbo].[vw_PermisoFamilia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_PermisoFamilia]'))
DROP VIEW [dbo].[vw_PermisoFamilia]
GO
/****** Object:  View [dbo].[vw_FormularioDetalle]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_FormularioDetalle]'))
DROP VIEW [dbo].[vw_FormularioDetalle]
GO
/****** Object:  View [dbo].[vw_Producto]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Producto]'))
DROP VIEW [dbo].[vw_Producto]
GO
/****** Object:  View [dbo].[vw_FormularioCabecera]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_FormularioCabecera]'))
DROP VIEW [dbo].[vw_FormularioCabecera]
GO
/****** Object:  View [dbo].[vw_Vendedor]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Vendedor]'))
DROP VIEW [dbo].[vw_Vendedor]
GO
/****** Object:  View [dbo].[vw_ClienteDomicilio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ClienteDomicilio]'))
DROP VIEW [dbo].[vw_ClienteDomicilio]
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Cliente]'))
DROP VIEW [dbo].[vw_Cliente]
GO
/****** Object:  Table [dbo].[zz_prueba]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zz_prueba]') AND type in (N'U'))
DROP TABLE [dbo].[zz_prueba]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[Usuario_FamiliaPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario_FamiliaPermiso]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Traduccion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion]') AND type in (N'U'))
DROP TABLE [dbo].[Traduccion]
GO
/****** Object:  Table [dbo].[Torneo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Torneo]') AND type in (N'U'))
DROP TABLE [dbo].[Torneo]
GO
/****** Object:  Table [dbo].[Talle]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle]') AND type in (N'U'))
DROP TABLE [dbo].[Talle]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[SucesoTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SucesoTipo]') AND type in (N'U'))
DROP TABLE [dbo].[SucesoTipo]
GO
/****** Object:  Table [dbo].[Suceso_hist]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_hist]') AND type in (N'U'))
DROP TABLE [dbo].[Suceso_hist]
GO
/****** Object:  Table [dbo].[Suceso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso]') AND type in (N'U'))
DROP TABLE [dbo].[Suceso]
GO
/****** Object:  Table [dbo].[Recomendacion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recomendacion]') AND type in (N'U'))
DROP TABLE [dbo].[Recomendacion]
GO
/****** Object:  Table [dbo].[Puntaje]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje]') AND type in (N'U'))
DROP TABLE [dbo].[Puntaje]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[Provincia]
GO
/****** Object:  Table [dbo].[Producto_Stock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Stock]') AND type in (N'U'))
DROP TABLE [dbo].[Producto_Stock]
GO
/****** Object:  Table [dbo].[Producto_Precio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Precio]') AND type in (N'U'))
DROP TABLE [dbo].[Producto_Precio]
GO
/****** Object:  Table [dbo].[Producto_Nivel]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]') AND type in (N'U'))
DROP TABLE [dbo].[Producto_Nivel]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[PermisoFamilia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]') AND type in (N'U'))
DROP TABLE [dbo].[PermisoFamilia]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso]') AND type in (N'U'))
DROP TABLE [dbo].[Permiso]
GO
/****** Object:  Table [dbo].[PedidoTemporal]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal]') AND type in (N'U'))
DROP TABLE [dbo].[PedidoTemporal]
GO
/****** Object:  Table [dbo].[Participante]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participante]') AND type in (N'U'))
DROP TABLE [dbo].[Participante]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pago]') AND type in (N'U'))
DROP TABLE [dbo].[Pago]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
DROP TABLE [dbo].[Noticia]
GO
/****** Object:  Table [dbo].[Nivel]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel]') AND type in (N'U'))
DROP TABLE [dbo].[Nivel]
GO
/****** Object:  Table [dbo].[MedioPagoTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioPagoTipo]') AND type in (N'U'))
DROP TABLE [dbo].[MedioPagoTipo]
GO
/****** Object:  Table [dbo].[MedioPago]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioPago]') AND type in (N'U'))
DROP TABLE [dbo].[MedioPago]
GO
/****** Object:  Table [dbo].[MedioContactoTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioContactoTipo]') AND type in (N'U'))
DROP TABLE [dbo].[MedioContactoTipo]
GO
/****** Object:  Table [dbo].[MedioContacto]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioContacto]') AND type in (N'U'))
DROP TABLE [dbo].[MedioContacto]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
DROP TABLE [dbo].[Marca]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad]') AND type in (N'U'))
DROP TABLE [dbo].[Localidad]
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea]') AND type in (N'U'))
DROP TABLE [dbo].[Linea]
GO
/****** Object:  Table [dbo].[Leyenda]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Leyenda]') AND type in (N'U'))
DROP TABLE [dbo].[Leyenda]
GO
/****** Object:  Table [dbo].[INTERMEDIA2]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INTERMEDIA2]') AND type in (N'U'))
DROP TABLE [dbo].[INTERMEDIA2]
GO
/****** Object:  Table [dbo].[INTERMEDIA]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INTERMEDIA]') AND type in (N'U'))
DROP TABLE [dbo].[INTERMEDIA]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma]') AND type in (N'U'))
DROP TABLE [dbo].[Idioma]
GO
/****** Object:  Table [dbo].[FormularioTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormularioTipo]') AND type in (N'U'))
DROP TABLE [dbo].[FormularioTipo]
GO
/****** Object:  Table [dbo].[FormularioEstado]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormularioEstado]') AND type in (N'U'))
DROP TABLE [dbo].[FormularioEstado]
GO
/****** Object:  Table [dbo].[Formulario_DET]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Formulario_DET]') AND type in (N'U'))
DROP TABLE [dbo].[Formulario_DET]
GO
/****** Object:  Table [dbo].[Formulario_CAB]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]') AND type in (N'U'))
DROP TABLE [dbo].[Formulario_CAB]
GO
/****** Object:  Table [dbo].[EnvioTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnvioTipo]') AND type in (N'U'))
DROP TABLE [dbo].[EnvioTipo]
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Envio]') AND type in (N'U'))
DROP TABLE [dbo].[Envio]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresa]') AND type in (N'U'))
DROP TABLE [dbo].[Empresa]
GO
/****** Object:  Table [dbo].[DomicilioTipo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioTipo]') AND type in (N'U'))
DROP TABLE [dbo].[DomicilioTipo]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domicilio]') AND type in (N'U'))
DROP TABLE [dbo].[Domicilio]
GO
/****** Object:  Table [dbo].[DigitosV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV]') AND type in (N'U'))
DROP TABLE [dbo].[DigitosV]
GO
/****** Object:  Table [dbo].[DICCIONARIO_DATOS]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DICCIONARIO_DATOS]') AND type in (N'U'))
DROP TABLE [dbo].[DICCIONARIO_DATOS]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
DROP TABLE [dbo].[Consulta]
GO
/****** Object:  Table [dbo].[Competencia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Competencia]') AND type in (N'U'))
DROP TABLE [dbo].[Competencia]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Color]') AND type in (N'U'))
DROP TABLE [dbo].[Color]
GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoPostal]') AND type in (N'U'))
DROP TABLE [dbo].[CodigoPostal]
GO
/****** Object:  UserDefinedFunction [dbo].[Producto_CantVendida]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_CantVendida]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Producto_CantVendida]
GO
/****** Object:  StoredProcedure [dbo].[Video_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Video_Update]
GO
/****** Object:  StoredProcedure [dbo].[Video_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Video_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Video_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Video_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Video_GetByCodigo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_GetByCodigo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Video_GetByCodigo]
GO
/****** Object:  StoredProcedure [dbo].[Video_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Video_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Vendedor_Update]
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Vendedor_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Vendedor_Select]
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Vendedor_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Vendedor_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_UpdatePass]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_UpdatePass]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_UpdatePass]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_UpdateDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_UpdateDV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_UpdateDV]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Update]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectPass]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectPass]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_SelectPass]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectDV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_SelectDV]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectAllBitacora]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectAllBitacora]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_SelectAllBitacora]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Select]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Permisos]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Permisos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Permisos]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilNOTIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilNOTIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_PerfilNOTIN]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_PerfilIN]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilDesasignar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilDesasignar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_PerfilDesasignar]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilAsignar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilAsignar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_PerfilAsignar]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Existe]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Existe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Existe]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_EsVendedor]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_EsVendedor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_EsVendedor]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_EsCliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_EsCliente]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_EsCliente]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Usuario_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Traduccion_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Traduccion_Update]
GO
/****** Object:  StoredProcedure [dbo].[Traduccion_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Traduccion_Select]
GO
/****** Object:  StoredProcedure [dbo].[Talle_SelectAllxProducto]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle_SelectAllxProducto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Talle_SelectAllxProducto]
GO
/****** Object:  StoredProcedure [dbo].[Talle_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Talle_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Suceso_SelectAllBitacora]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_SelectAllBitacora]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Suceso_SelectAllBitacora]
GO
/****** Object:  StoredProcedure [dbo].[Suceso_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Suceso_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Suceso_Reset]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_Reset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Suceso_Reset]
GO
/****** Object:  StoredProcedure [dbo].[spGenerateDBDictionary]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGenerateDBDictionary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGenerateDBDictionary]
GO
/****** Object:  StoredProcedure [dbo].[Recomendacion_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recomendacion_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Recomendacion_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Puntaje_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Puntaje_Select]
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Puntaje_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Provincia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Provincia_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update2]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Update2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Update2]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Update]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Talles]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Talles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Talles]
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_SelectByID]
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAllxLinea]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAllxLinea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_SelectAllxLinea]
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAllByNivel]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAllByNivel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_SelectAllByNivel]
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Niveles]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Niveles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Niveles]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Producto_DescontarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_DescontarStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_DescontarStock]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Producto_ConsultarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_ConsultarStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_ConsultarStock]
GO
/****** Object:  StoredProcedure [dbo].[Producto_ActualizarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_ActualizarStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Producto_ActualizarStock]
GO
/****** Object:  StoredProcedure [dbo].[PermisoFamilia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermisoFamilia_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PermisoFamilia_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectNOTIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectNOTIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Permiso_SelectNOTIN]
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectINFamilia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectINFamilia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Permiso_SelectINFamilia]
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Permiso_SelectIN]
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Permiso_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Vaciar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Vaciar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_Vaciar]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_Update]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Total]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Total]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_Total]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_RemoverItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_RemoverItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_RemoverItem]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Listar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Listar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_Listar]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_ContarItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_ContarItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_ContarItem]
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_AgregarItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_AgregarItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoTemporal_AgregarItem]
GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalle_SelectByCabecera]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoDetalle_SelectByCabecera]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoDetalle_SelectByCabecera]
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoCabecera_SelectByID]
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectAllByCliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectAllByCliente]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoCabecera_SelectAllByCliente]
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoCabecera_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_ContarByCliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_ContarByCliente]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PedidoCabecera_ContarByCliente]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Pago]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Pago]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Pago]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_NroFactura]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_NroFactura]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_NroFactura]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Estados]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Estados]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Estados]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Envio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Envio]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Envio]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Cuotas]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Cuotas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_Cuotas]
GO
/****** Object:  StoredProcedure [dbo].[Pedido_CambiarEstado]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_CambiarEstado]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pedido_CambiarEstado]
GO
/****** Object:  StoredProcedure [dbo].[Pago_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pago_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pago_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_Update]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_SelectInicio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_SelectInicio]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_SelectInicio]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_Select]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_GetByCodigo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_GetByCodigo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_GetByCodigo]
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Noticia_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Nivel_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Nivel_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Marca_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Marca_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Localidad_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Localidad_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Linea_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Linea_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_UpdateTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_UpdateTraduccionNoticia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_UpdateTraduccionNoticia]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_UpdateTraduccion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_UpdateTraduccion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_UpdateTraduccion]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectTraduccionNoticia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_SelectTraduccionNoticia]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectTraduccion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectTraduccion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_SelectTraduccion]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectLeyenda]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectLeyenda]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_SelectLeyenda]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_InsertTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_InsertTraduccionNoticia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_InsertTraduccionNoticia]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_DeleteTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_DeleteTraduccionNoticia]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_DeleteTraduccionNoticia]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Idioma_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectNOTIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectNOTIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_SelectNOTIN]
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_SelectIN]
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_SelectByID]
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Familia_QuitarPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_QuitarPermiso]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_QuitarPermiso]
GO
/****** Object:  StoredProcedure [dbo].[Familia_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Familia_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Familia_AsignarPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_AsignarPermiso]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Familia_AsignarPermiso]
GO
/****** Object:  StoredProcedure [dbo].[Factura_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Factura_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EnvioTipo_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnvioTipo_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EnvioTipo_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Envio_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Envio_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Envio_Insert]
GO
/****** Object:  StoredProcedure [dbo].[DomicilioTipo_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioTipo_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DomicilioTipo_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[DigitosV_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DigitosV_Update]
GO
/****** Object:  StoredProcedure [dbo].[DigitosV_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DigitosV_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Consulta_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Color_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Color_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Color_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[CodigoPostal_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoPostal_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CodigoPostal_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_ValidarPregunta]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_ValidarPregunta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_ValidarPregunta]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_UpdatePass]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_UpdatePass]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_UpdatePass]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_Update]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Select2]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Select2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_Select2]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_Select]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cliente_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Cambios_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cambios_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cambios_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_UpdateDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_UpdateDV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bitacora_UpdateDV]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_SelectDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_SelectDV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bitacora_SelectDV]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bitacora_Select]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bitacora_Insert]
GO
/****** Object:  User [fss]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fss')
DROP USER [fss]
GO

USE [FSS]
GO
/****** Object:  User [fss]    Script Date: 09/12/2017 6:42:36 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fss')
CREATE USER [fss] FOR LOGIN [fss] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [fss]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Inserta un suceso
-- ==============================================================

CREATE PROCEDURE [dbo].[Bitacora_Insert] 
@suceso varchar(max), @login varchar(max), @descripcion varchar(max), @dvh varchar(max)
AS
BEGIN TRY
DECLARE @idSucesoTipo int
DECLARE @idUsuario int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
-- TIPO SUCESO
IF NOT EXISTS (select st.id_suceso_tipo from sucesotipo as st where st.descripcion = @suceso)
BEGIN
	print ''Tipo de sucedo desconocido.''
	RETURN
END
ELSE
select @idSucesoTipo = st.id_suceso_tipo from sucesotipo as st where st.descripcion = @suceso
--USUARIO
IF NOT EXISTS (select u.idUsuario from Usuario as u where [Login] = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
select @idUsuario = u.idUsuario from Usuario as u where [Login] = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- INSERT
--***************************************************************************
--INSERT INTO [master].[dbo].[Transacciones] ([Sentencia]) VALUES(''Bitacora_Insert (''+@suceso+'', ''+@login+'', ''+ @descripcion+'', ''+@dvh+'')'')
insert into Suceso values (getdate(),@idSucesoTipo, @idUsuario, @descripcion,1,@dvh)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Sucesos
-- ==============================================================
CREATE PROCEDURE [dbo].[Bitacora_Select] 
@desde as char(8)=null, @hasta as char(8) =null, @suceso as varchar(100) =null, @usuario as varchar(50) =null
AS
BEGIN TRY

--declaro las variables
declare @cmd as nvarchar(max)
declare @cmdFecha as nvarchar(max)
declare @cmdSuceso as nvarchar(max)
declare @cmdUsuario as nvarchar(max)
declare @cmdFecha2 as nvarchar(max)
declare @cmdSuceso2 as nvarchar(max)
declare @cmdUsuario2 as nvarchar(max)
--inicializo las variables
set @cmd = ''''
set @cmdFecha = ''''
set @cmdSuceso = ''''
set @cmdUsuario = ''''
set @cmdFecha2 = ''''
set @cmdSuceso2 = ''''
set @cmdUsuario2 = ''''
if @suceso = '''' set @suceso  = null
if @usuario='''' set @usuario= null
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
--controlo si enviaron las fechas
if @desde is not null and @hasta is not null
begin
set @cmdFecha = ''
AND s.fecha between '''''' + @desde + '' 00:00:00'''' and '''''' + @hasta +'' 23:59:59''''''
set @cmdFecha2 = @cmdFecha 
end 

--controlo si enviaron el suceso
if @suceso is not null
begin
	if @suceso <> ''Todos''
	begin
	set @cmdSuceso = ''
	AND s.id_suceso_tipo in (select st2.id_suceso_tipo from SucesoTipo st2 where st2.descripcion = ''''''+@suceso+'''''' and st2.estado = 1)''
	set @cmdSuceso2 = @cmdSuceso
	end
end
--controlo si enviaron el usuario
if @usuario is not null
begin
	if @usuario <> ''Todos''
	begin
	set @cmdUsuario = ''
	AND s.usuario in (select u2.idUsuario from usuario u2 where u2.login = ''''''+@usuario+'''''' and u2.estado = 1)''
	set @cmdUsuario2 = @cmdUsuario
	end
end
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
set @cmd = ''SELECT s.fecha, st.descripcion as suceso, u.login as usuario, s.descripcion 
from Suceso s
inner join SucesoTipo st on s.id_suceso_tipo = st.id_suceso_tipo 
inner join Usuario u on u.idUsuario = s.usuario
WHERE s.Estado=1'' + @cmdFecha + @cmdSuceso + @cmdUsuario +''
UNION
SELECT s.fecha, st.descripcion as suceso, u.login as usuario, s.descripcion 
from Suceso_hist s
inner join SucesoTipo st on s.id_suceso_tipo = st.id_suceso_tipo 
inner join Usuario u on u.idUsuario = s.usuario
WHERE s.Estado=1'' + @cmdFecha2 + @cmdSuceso2 + @cmdUsuario2 +''
ORDER BY s.fecha DESC''

print @cmd
exec (@cmd)

END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_SelectDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_SelectDV]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Suceso completo para calcular DV
-- ==============================================================
CREATE PROCEDURE [dbo].[Bitacora_SelectDV] 
	AS
BEGIN TRY
	SELECT * FROM Suceso
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_UpdateDV]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora_UpdateDV]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Actualiza DV del suceso
-- ==============================================================
CREATE PROCEDURE [dbo].[Bitacora_UpdateDV] 
@str as nvarchar(max), @id as int
	AS
BEGIN TRY
	UPDATE Suceso
	SET DVH = @str
	WHERE id = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cambios_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cambios_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/11/2017
-- Update date: 23/11/2017
-- Description:	listar los cambios desde el ultimo restore
-- ==============================================================
CREATE PROCEDURE [dbo].[Cambios_SelectAll] 
AS
BEGIN TRY
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT max([fecha]) AS fecha, ''Ultimo Restore'' AS detalle FROM [master].[dbo].[FechaRestore]
	UNION
	SELECT b.fecha, b.descripcion as detalle FROM [dbo].[vw_Bitacora] b WHERE b.fecha > (SELECT max([fecha]) FROM [master].[dbo].[FechaRestore])
	AND b.id_suceso_tipo BETWEEN 14 AND 16 -- INSERT, UPDATE, DELETE
	ORDER BY fecha
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/07/2016
-- Description:	Mostrar un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_Delete] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- BAJA LOGICA
--***************************************************************************
--INSERT INTO [master].[dbo].[Transacciones] ([Sentencia]) VALUES(''Cliente_Delete (''+@login+'')'')	
	UPDATE Usuario
	SET Estado=0
	WHERE idUsuario = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Alta de Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_Insert]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max), @pregunta varchar(max), @respuesta varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int
DECLARE @repetido int
DECLARE @idIdioma int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMAIL int
DECLARE @modificaPREGUNTA int
DECLARE @modificaRESPUESTA int
DECLARE @elidioma as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT max(idUsuario)+1 FROM [dbo].[Usuario])
BEGIN
	-- es el primer usuario
	SET @id = 1
END
ELSE -- le asigno el proximo id
BEGIN
	SELECT @id = max(idUsuario)+1 FROM [dbo].[Usuario]
END
SELECT @idIdioma=ISNULL(IdIdioma,1) FROM Idioma WHERE descIdioma=@idioma
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=0
SELECT @repetido = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=1
--DNI
SELECT @modificaDNI = len(@dni)
--PASS
SELECT @modificaPASS = len(@pass)
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
--email
SELECT @modificaEMAIL = len(@email)
-- PREGUNTA
SELECT @modificaPREGUNTA = len(@pregunta)
--RESPUESTA
SELECT @modificaRESPUESTA = len(@respuesta)
--el idioma
IF (@idioma <1)
BEGIN
	SET @elidioma = 1
END
ELSE
BEGIN
	SET @elidioma = @idioma
END
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- ALTA
--***************************************************************************
IF (@existe = 0 AND @repetido=0) --no existe
	BEGIN
	INSERT INTO [dbo].[Usuario] ([idUsuario],[DNI],[login],[Password],[idioma],[Nombre],[Apellido],[email],[EsCliente],[Pregunta],[Respuesta],[Estado])
    SELECT @id, isnull(@dni, 0), @login, @pass, isnull(@elidioma,1), isnull(@nombre,''Nombre''), isnull(@apellido,''Apellido''),isnull(@email,''email''),1,@pregunta,@respuesta, 1
	END
IF (@existe = 1 AND @repetido=0) --esta deshabilitado
BEGIN
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login
	--LO HABILITO
	UPDATE [dbo].[Usuario]
	SET Estado=1
	WHERE idUsuario = @id
	--DNI
	IF (@modificaDNI >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET DNI = @dni
		WHERE idUsuario = @id
	END
	--PASS
	IF (@modificaPASS >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
	END
	--IDIOMA
	IF (@modificaIDIOMA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET idioma=@elidioma
		WHERE idUsuario = @id
	END
	--NOMBRE
	IF (@modificaNOMBRE >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Nombre=@nombre
		WHERE idUsuario = @id
	END
	--APELLIDO
	IF (@modificaAPELLIDO >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Apellido=@apellido
		WHERE idUsuario = @id
	END
	--email
	IF (@modificaEMAIL >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET email=@email
		WHERE idUsuario = @id
	END
	--PREGUNTA
	IF (@modificaPREGUNTA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET pregunta=@pregunta
		WHERE idUsuario = @id
	END
	--RESPUESTA
	IF (@modificaRESPUESTA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET respuesta=@respuesta
		WHERE idUsuario = @id
	END
	--SACO TODOS LOS PERFILES VIEJOS QUE TENIA
	DELETE FROM [dbo].[Usuario_FamiliaPermiso] WHERE idUsuario = @id
END
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE login = @login
--ES CLIENTE
UPDATE [dbo].[Usuario] SET EsCliente = 1 WHERE idUsuario = @id
-- PERFIL DEFAULT
INSERT INTO [dbo].[Usuario_FamiliaPermiso]([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id, 99,501,1)
-- PERFIL EsCliente
INSERT INTO [dbo].[Usuario_FamiliaPermiso]([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id, 99,509,1)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Mostrar un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_Select] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma, u.Pregunta, u.Respuesta 
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and EsCliente = 1
	and u.idUsuario = @id
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Select2]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Select2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Mostrar un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_Select2] 
@DNI as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE DNI = @DNI)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE DNI = @DNI
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma, u.Pregunta, u.Respuesta 
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and EsCliente = 1
	and u.idUsuario = @id
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	listar los Clientes
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_SelectAll] 
AS
BEGIN TRY
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma, u.Pregunta, u.Respuesta
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and EsCliente = 1
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- Batch submitted through debugger: SQLQuery1.sql|9|0|C:\Users\Sol\AppData\Local\Temp\~vsB42E.sql

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Modificación del Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_Update]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max), @pregunta varchar(max), @respuesta varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int

DECLARE @idIdioma int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMAIL int
DECLARE @modificaPREGUNTA int
DECLARE @modificaRESPUESTA int
DECLARE @elidioma as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
SELECT @idIdioma=ISNULL(IdIdioma,1) FROM Idioma WHERE descIdioma=@idioma
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE login = @login AND Estado=1

--DNI
SELECT @modificaDNI = len(cast(@dni as varchar(max)))
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño DNI ''+ cast(@modificaDNI as varchar(max))  
--PASS
SELECT @modificaPASS = len(replace(@pass,''*'',''''))
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño PASS ''+ cast(@modificaPASS as varchar(max))
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño Idioma ''+ cast(@modificaIDIOMA as varchar(max))
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño Nombre ''+ cast(@modificaNOMBRE as varchar(max))
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño Apellido ''+ cast(@modificaAPELLIDO as varchar(max))
--email
SELECT @modificaEMAIL = len(@email)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño emil ''+ cast(@modificaEMAIL as varchar(max))
-- PREGUNTA
SELECT @modificaPREGUNTA = len(@pregunta)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño pregunta ''+ cast(@modificaPREGUNTA as varchar(max))
--RESPUESTA
SELECT @modificaRESPUESTA = len(@respuesta)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => tamaño respuesta ''+ cast(@modificaRESPUESTA as varchar(max))
--el idioma
IF (@idIdioma <1)
BEGIN
	SET @elidioma = 1
END
ELSE
BEGIN
	SET @elidioma = @idIdioma
END
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- MODIFICACION
--***************************************************************************
IF (@existe = 1)
BEGIN
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE [login] = @login
	--DNI
	select @modificaDNI as modificaDNI
	IF (@modificaDNI > 0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET DNI = @dni
		WHERE idUsuario = @id
	END
	--PASS
	IF (@modificaPASS >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando PASS ''
	END
	--IDIOMA
	IF (@modificaIDIOMA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET idioma=@elidioma
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando Idioma ''
	END
	--NOMBRE
	IF (@modificaNOMBRE >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Nombre=@nombre
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando Nombre ''
	END
	--APELLIDO
	IF (@modificaAPELLIDO >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Apellido=@apellido
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando Apellido ''
	END
	--email
	IF (@modificaEMAIL >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET email=@email
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando email ''
	END
	--PREGUNTA
	IF (@modificaPREGUNTA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET pregunta=@pregunta
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando Pregunta ''
	END
	--RESPUESTA
	IF (@modificaRESPUESTA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET respuesta=@respuesta
		WHERE idUsuario = @id
		PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Modificando Respuesta ''
	END
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_UpdatePass]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_UpdatePass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 20/07/2016
-- Description:	Modifica la constraseña del Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_UpdatePass]
@dni varchar(max), @pass varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int
--***************************************************************************
-- CONTROLES
--***************************************************************************
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND Estado=1
--***************************************************************************
-- MODIFICACION
--***************************************************************************
IF (@existe = 1)
	BEGIN
		SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE DNI = @dni
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_ValidarPregunta]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente_ValidarPregunta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/07/2016
-- Description:	Validar la pregunta de un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Cliente_ValidarPregunta] 
@DNI as varchar(50), @Pregunta as varchar(max), @Respuesta as varchar(max), @Valida as int output
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE DNI = @DNI)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE DNI = @DNI
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT @Valida=count(*)
    FROM Usuario u
	WHERE u.Estado=1 
	and EsCliente = 1
	and u.idUsuario = @id
	and u.Pregunta=@Pregunta
	and u.Respuesta=@Respuesta
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoPostal_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoPostal_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Codigos Postales
-- ==============================================================
CREATE PROCEDURE [dbo].[CodigoPostal_SelectAll]
AS
BEGIN TRY
SELECT CPA FROM CodigoPostal ORDER BY CPA
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Color_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Color_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Color
-- ==============================================================
CREATE PROCEDURE [dbo].[Color_SelectAll]
AS
BEGIN TRY
SELECT Color FROM Color ORDER BY Color
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Consulta_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta una Consulta
-- ==============================================================
CREATE Procedure [dbo].[Consulta_Insert]
(
@email varchar(max),
@Nivel varchar(max),
@Texto varchar(max)
)
As
DECLARE @elNivel as int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @elNivel= Importancia  FROM [dbo].[Nivel] WHERE Descripcion=@Nivel
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
BEGIN TRY
	INSERT INTO [dbo].[Consulta]([email],[Nivel],[Texto]) VALUES
	(@email,@elNivel,@Texto)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[DigitosV_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Digitos Verificadores Verticales
-- ==============================================================
CREATE PROCEDURE [dbo].[DigitosV_SelectAll] 
	AS
BEGIN TRY
	SELECT * FROM DigitosV
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[DigitosV_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Actualizar Digitos Verificardo Vertical
-- ==============================================================
CREATE PROCEDURE [dbo].[DigitosV_Update] 
@str as nvarchar(max), @id as int
	AS
BEGIN TRY
	UPDATE DigitosV
	SET digitoV = @str
	WHERE id = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[DomicilioTipo_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioTipo_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Domicilio Tipo
-- ==============================================================
CREATE PROCEDURE [dbo].[DomicilioTipo_SelectAll]
AS
BEGIN TRY
SELECT DomicilioTipo FROM DomicilioTipo WHERE Estado=1 ORDER BY DomicilioTipo ASC
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Envio_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Envio_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta un Envio nuevo
-- ==============================================================
CREATE Procedure [dbo].[Envio_Insert]
(
@login as varchar(max)
,@sucursal as int
,@numero as int
,@envioTipo as varchar(max)
,@domTipo as varchar(max)
,@domCalle as varchar(max)
,@domNro as int
,@domPiso as varchar(max)
,@domDepto as varchar(max)
,@localidad as varchar(max)
,@provincia as varchar(max)
,@codPostal as varchar(max)
)
As
DECLARE @existe as int
DECLARE @ClienteID as int
DECLARE @CodSucursal as int
DECLARE @EnvTipo as int
DECLARE @CodTipo as int
DECLARE @CodProvincia as int
DECLARE @CodLocalidad as int
DECLARE @CP as int
DECLARE @dom as int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @login
--print ''Cliente: ''+cast(@ClienteID as varchar)
--SELECT TOP 1 @CodSucursal=CodSucursal FROM [dbo].[Sucursal] WHERE CodSucursal=@sucursal 
SET @CodSucursal= 1
SELECT @EnvTipo=CodEnvioTipo FROM EnvioTipo WHERE FormaEnvio=@envioTipo
--print ''Envio Tipo: '' + cast(@EnvTipo as varchar)
SELECT @CodTipo=CodDomicilioTipo FROM [dbo].[DomicilioTipo] WHERE DomicilioTipo=@domTipo
--print ''Domicilio Tipo: '' + cast(@CodTipo as varchar)
SELECT @CodProvincia=CodProvincia FROM Provincia WHERE Provincia=@provincia
--print ''Provincia: '' + cast(@CodProvincia as varchar)
SELECT @CodLocalidad=CodLocalidad FROM Localidad WHERE Localidad=@localidad
--print ''Localidad: '' + cast(@CodLocalidad as varchar)
SELECT @CP=Nro FROM CodigoPostal WHERE CPA = @codPostal
--print ''CP: '' + cast(@CP as varchar)
--controlo que exista el pedido antes de insertar el envio
SELECT @existe = COUNT(*) FROM Formulario_CAB WHERE Tipo=2 AND Sucursal=@CodSucursal and Numero=@numero and Cliente=@ClienteID
--print ''Existe: '' + cast(@existe as varchar)
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
BEGIN TRY
IF (@existe>0)
BEGIN
BEGIN TRANSACTION
--print ''inicia transaccion''
    --INSERTO EL DOMICILIO
	INSERT INTO [dbo].[Domicilio] ([Cliente],[DomicilioTipo],[Domicilio],[Calle],[Nro],[Piso],[Depto],[Localidad],[Provincia],[CodigoPostal],[Estado])
    VALUES (@ClienteID,@CodTipo,@domTipo,@domCalle,@domNro,isnull(@domPiso, 0),isnull(@domDepto, ''''), @CodLocalidad,@CodProvincia,@CP,1)
	print ''Insert Domicilio''
	--Obtengo el id del domicilio
	SELECT @dom=@@IDENTITY 
	--INSERTO EL ENVIO
	INSERT INTO [dbo].[Envio] ([FormularioTipo],[FormularioSucursal],[FormularioNumero],[FormaEnvio],[FecEntrega],[Dias],[Costo],[Observaciones],[Domicilio],[Estado])
	VALUES (2,@CodSucursal,@numero,@EnvTipo,getdate()+10,10,100,'''',@dom,1)
	print ''insert Envio''
COMMIT TRANSACTION
--print ''Commit''
END
END TRY
BEGIN CATCH
ROLLBACK
--print ''rollback''
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[EnvioTipo_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnvioTipo_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Forma de Envio
-- ==============================================================
CREATE PROCEDURE [dbo].[EnvioTipo_SelectAll]
AS
BEGIN TRY
SELECT FormaEnvio FROM EnvioTipo WHERE Estado=1 ORDER BY FormaEnvio ASC
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Factura_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta un Pedido nuevo
-- ==============================================================
CREATE Procedure [dbo].[Factura_Insert]
(
    @Cliente as varchar(max)
	,@numeroPedido as int
)
As
BEGIN TRY
DECLARE @ClienteID int
DECLARE @tipo as int
DECLARE @cant as int
DECLARE @numero as int
DECLARE @existe int
DECLARE @item as int
DECLARE @inventario as int
DECLARE @codTalle as int
DECLARE @cantidad as int
DECLARE @estado as bit
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SET @item = 0
SELECT @tipo=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Factura'' AND Estado=1
SELECT @cant=COUNT(isnull(numero,0)) FROM [dbo].[Formulario_CAB] WHERE tipo =@tipo
--PRINT CAST(@cant as varchar(max))
IF (@cant=0)
BEGIN
	-- es el primer numero
	SET @numero = 1
END
ELSE -- le asigno el proximo
BEGIN
	SELECT @numero=max(isnull(numero,0))+1 FROM [dbo].[Formulario_CAB] WHERE tipo =@tipo
END
--PRINT CAST(@numero as varchar(max))
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
SELECT @existe=isnull(count(*),0) FROM [Formulario_CAB] WHERE tipo=2 AND Sucursal=1 AND Numero=@numeroPedido
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @existe > 0  -- existe el pedido
BEGIN
BEGIN TRANSACTION
    --insertar la cabecera de la factura
	INSERT INTO [dbo].[Formulario_CAB] ([Tipo],[Sucursal],[Numero],[FecEmision],[FecVto],[Cliente],[DomicilioTipo],[Empresa],[EstadoFormulario],[EmitidoPor],[Pedido],[Estado])
    SELECT @tipo,1,@numero,getdate(),getdate()+30,@ClienteID,[DomicilioTipo],[Empresa],[EstadoFormulario],[EmitidoPor],@numeroPedido,[Estado]
	FROM [Formulario_CAB] WHERE tipo=2 AND Sucursal=1 AND Numero=@numeroPedido
    PRINT ''INSERT CABECERA''
	--insertar el detalle de la factura
	DECLARE miCursor CURSOR FOR   
	SELECT Inventario, Talle,cantidad,estado
	FROM [dbo].[Formulario_DET] WHERE tipo=2 AND Sucursal=1 AND NroFormulario=@numeroPedido
    
	OPEN miCursor  
    FETCH NEXT FROM miCursor INTO @Inventario,@codTalle,@cantidad,@estado
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
		SET @item= @item+1
		INSERT INTO [dbo].[Formulario_DET] ([Tipo],[Sucursal],[NroFormulario],[Item],[Inventario],[Talle],[cantidad],[Estado])
		VALUES(@tipo,1,@numero, @item,@Inventario,@codTalle,@cantidad,@estado)
    FETCH NEXT FROM miCursor INTO @Inventario,@codTalle,@cantidad,@estado
    END  
    CLOSE miCursor  
    DEALLOCATE miCursor
	PRINT ''INSERT DETALLE''
COMMIT TRANSACTION
END
ELSE
BEGIN
	PRINT ''NO EXISTE EL PEDIDO''
END
END TRY
BEGIN CATCH
ROLLBACK
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_AsignarPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_AsignarPermiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Agregar Permiso en Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_AsignarPermiso]
@p1 as varchar(1000), @p2 as varchar(1000), @p3 as bit
AS
BEGIN TRY
DECLARE @padre as int
DECLARE @hijo as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
--PADRE
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Familia Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1
--HIJO
IF NOT EXISTS (SELECT DISTINCT p.codigopermiso FROM Permiso p WHERE p.permiso =  @p2 AND p.codigopermiso <> @padre)
BEGIN
	print ''Permiso Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @hijo = p.codigopermiso FROM Permiso p WHERE p.permiso =  @p2 AND p.codigopermiso <> @padre
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
UPDATE [dbo].[PermisoFamilia] 
		SET Estado = 1, Seleccionado=@p3
		WHERE [CodigoPadre]=@padre
		AND [CodigoPermiso]=@hijo
--LO MISMO CON LOS USUARIOS QUE TIENEN EL PERFIL
IF (@padre=99)
BEGIN
	UPDATE [dbo].[Usuario_FamiliaPermiso]
	SET Estado = 1
	WHERE [CodigoPadre]=99
	AND [CodigoPermiso]=@hijo
END
UPDATE [dbo].[PermisoFamilia] 
SET estado=1
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Eliminar una Famila de Permisos
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_Delete]
@p1 as varchar(1000)
AS
BEGIN TRY
DECLARE @permiso as int
DECLARE @admin as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT DISTINCT codigoPermiso FROM Permiso WHERE permiso =  @p1 and [Simple] = 0 AND CodigoPermiso >500)
BEGIN
	print ''Familia Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @permiso = codigoPermiso FROM Permiso WHERE permiso =  @p1 and [Simple] = 0 AND CodigoPermiso > 500
SELECT @admin = count(*) from Permiso WHERE CodigoPermiso=@permiso and upper(Permiso) like ''ADMIN%''
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
IF (@admin=0)-- si no es el perfil administrador, lo doy de baja logica
BEGIN
	UPDATE Usuario_FamiliaPermiso SET Estado=0 WHERE [CodigoPadre]=99 AND [CodigoPermiso]= @permiso; -- Sacarle el permisos a los usuarios que lo tienen
	UPDATE PermisoFamilia SET Estado=0, Seleccionado=0 WHERE [CodigoPadre] = @permiso; -- Actualizar los registros donde es padre
	UPDATE PermisoFamilia SET Estado=0 WHERE [CodigoPermiso] = @permiso AND [CodigoPadre] =99; -- Actualizar los registros donde es hijo
	UPDATE Permiso SET Estado=0 WHERE CodigoPermiso=@permiso AND [Simple]=0 AND CodigoPermiso>500; -- Los permisos Simples son los controles, no se pueden eliminar
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Insertar una Familia de Permisos
-- ==============================================================

CREATE PROCEDURE [dbo].[Familia_Insert]
@p1 as varchar(1000)
AS
DECLARE @existe int
DECLARE @repetido int
DECLARE @padre int
DECLARE @padre2 int
DECLARE @id int
DECLARE @permiso int
DECLARE @estado bit
BEGIN TRY
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
SELECT @existe = COUNT(*) FROM [dbo].[Permiso] WHERE Permiso=@p1 AND Estado=0
SELECT @repetido = COUNT(*) FROM [dbo].[Permiso] WHERE Permiso=@p1 AND Estado=1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--******************************************************************************
--INSERTO PERMISO
--******************************************************************************
IF (@existe = 0 AND @repetido=0) --NO EXISTE
BEGIN
	INSERT INTO [dbo].[Permiso] (Permiso) VALUES (@p1);
	--OBTENGO EL ID DEL PERMISO
	SELECT DISTINCT @padre = p.CodigoPermiso FROM Permiso p WHERE p.permiso =  @p1;
	--inserto la familia en la tabla de familias, dependiendo del sistema
	INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado])
	VALUES(99,@padre,1,1)
	--******************************************************************************
	--INSERTO FAMILIA (LE OTORGO TODOS LOS PERMISOS EN CERO, SIMPLES y COMPUESTOS)
	--******************************************************************************
	INSERT INTO [dbo].[PermisoFamilia] ([CodigoPadre],[CodigoPermiso],[Seleccionado],[Estado])
	SELECT DISTINCT @padre, pf.CodigoPermiso, 0,1
	FROM vw_PermisoFamilia pf, permiso perm
	WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
	AND perm.CodigoPermiso=pf.CodigoPermiso
	AND CodigoPadre<>99 --Excluyo Familias, sólo muestro permisos simples y compuestos
	AND CodigoPadre<500
	ORDER BY pf.CodigoPermiso
END--no existia
IF (@existe = 1 AND @repetido=0) --DESHABILITADO
	BEGIN
	--OBTENGO EL ID DEL PERMISO Y PONGO EL BIT EN 1
	SELECT DISTINCT @padre = p.CodigoPermiso FROM Permiso p WHERE p.permiso =  @p1;
	UPDATE Permiso SET Estado=1 WHERE CodigoPermiso = @padre --revivir el permiso
	UPDATE PermisoFamilia SET Estado=1 WHERE CodigoPermiso = @padre and CodigoPadre=99 --revivir la familia
	UPDATE PermisoFamilia SET Estado=1, Seleccionado = 0 WHERE CodigoPadre = @padre -- revivir a sus hijos
	END--baja logica
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_QuitarPermiso]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_QuitarPermiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Quitar permiso de una familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_QuitarPermiso]
@p1 as varchar(1000), @p2 as varchar(1000)
AS
BEGIN TRY
DECLARE @padre as int
DECLARE @hijo as int
DECLARE @admin as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
--PADRE
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Familia Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1

--HIJO
IF NOT EXISTS (SELECT DISTINCT p.codigopermiso FROM Permiso p WHERE p.permiso =  @p2 AND p.codigopermiso <> @padre)
BEGIN
	print ''Permiso Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @hijo = p.codigopermiso FROM Permiso p WHERE p.permiso =  @p2 AND p.codigopermiso <> @padre
SELECT @admin = count(*) from Permiso WHERE CodigoPermiso=@padre and upper(Permiso) like ''ADMIN%''
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
IF (@admin=0)-- si no es el perfil administrador, le quito el permiso
BEGIN
	UPDATE [dbo].[PermisoFamilia] 
	SET Seleccionado = 0
	WHERE [CodigoPadre]=@padre
	AND [CodigoPermiso]=@hijo;
	--HACER LO MISMO CON LOS USUARIOS QUE TIENEN EL PERFIL
	UPDATE [dbo].[Usuario_FamiliaPermiso]
	SET Estado = 0
	WHERE [CodigoPadre]=@padre
	AND [CodigoPermiso]=@hijo;
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar Familias de Permisos
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_SelectAll]
AS
BEGIN TRY
	--SELECT CodigoPermiso, permiso FROM vw_familia where CodigoPermiso <>0 /*sistema*/ ORDER BY permiso
  SELECT PermisoHijo as permiso, pf.CodigoPermiso, pf.seleccionado
  FROM vw_PermisoFamilia pf, permiso perm
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND perm.CodigoPermiso=pf.CodigoPermiso
  AND CodigoPadre=99 --sólo Familias, MO muestro ni permisos simples ni compuestos
  ORDER BY pf.PermisoHijo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar los permisos de una Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_SelectByID]
@familia as varchar(max)
AS
BEGIN TRY
DECLARE @padre int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
SELECT @padre= isnull(CodigoPermiso,-1) from permiso where estado=1 and permiso like @familia
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--******************************************************************************
IF @padre>0
BEGIN
SELECT pf.*, perm.Simple, pf.Estado
  FROM vw_PermisoFamilia pf, permiso perm
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND perm.CodigoPermiso=pf.CodigoPermiso
  AND CodigoPadre=@padre
  ORDER BY perm.Simple, pf.PermisoHijo
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar Permisos en una Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_SelectIN]
@p1 as varchar(100)
AS
BEGIN TRY
DECLARE @padre as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Familia Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
/*
SELECT DISTINCT p.permiso FROM Permiso p
WHERE p.codigopermiso IN (SELECT fp.codigopermiso FROM PermisoFamilia fp WHERE fp.CodigoPadre=187--@padre 
AND fp.estado=1)
AND p.simple=0
ORDER BY p.Permiso;
*/
select distinct PermisoCompuesto as permiso from [dbo].[vw_SeguridadPermisoCompuesto] 
where [Estado] = 1
and CodigoPadre=@padre
/*
--tengo que analizarlo
UNION
select distinct familia as permiso
from [dbo].[vw_SeguridadFamilia] 
where Estado=1 
and CodigoPadre=@padre
*/
order by permiso
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Familia_SelectNOTIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia_SelectNOTIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar Permisos que NO estan en una Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Familia_SelectNOTIN]
@p1 as varchar(100)
AS
BEGIN TRY
DECLARE @padre as int
DECLARE @cant as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Familia Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1

PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.'' 
--***************************************************************************
-- SELECT
--***************************************************************************
/*
SELECT DISTINCT p.permiso FROM Permiso p
WHERE p.codigopermiso IN (SELECT fp.codigopermiso FROM PermisoFamilia fp WHERE fp.CodigoPadre=@padre AND fp.estado=0)
AND p.simple=0
ORDER BY p.Permiso;
*/
select distinct PermisoCompuesto as permiso from [dbo].[vw_SeguridadPermisoCompuesto] 
where [Estado] = 0
and CodigoPadre=@padre
/*
--lo tengo que analizar
UNION
select distinct familia as permiso
from [dbo].[vw_SeguridadFamilia] 
where Estado=0
and CodigoPadre=@padre
*/
order by permiso
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	idoma nuevo
-- ==============================================================
CREATE PROCEDURE [dbo].[Idioma_Delete] 
@idioma varchar(max)
AS
BEGIN TRY
DECLARE @id as int

SELECT @id=IdIdioma FROM [dbo].[Idioma] WHERE descIdioma = @idioma
IF @id > 0
	BEGIN
	--El idioma existe
	UPDATE [dbo].[Idioma]
	SET Estado = 0
	WHERE IdIdioma=@id

	UPDATE [dbo].[Traduccion]
	SET Estado = 0
	WHERE IdIdioma=@id
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_DeleteTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_DeleteTraduccionNoticia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Actualizar la traduccion de unaleyenda para un idioma
-- Ejecucion: EXECUTE [dbo].[Idioma_DeleteTraduccionNoticia] 27
-- ======================================================================
CREATE PROCEDURE [dbo].[Idioma_DeleteTraduccionNoticia] 
@noticia as int
	AS
BEGIN TRY
DECLARE @Titulo as varchar(max)
DECLARE @SubTitulo as varchar(max)
DECLARE @Texto as varchar(max)
DECLARE @idLeyenda1 as int
DECLARE @idLeyenda2 as int
DECLARE @idLeyenda3 as int
--obtengo los datos
SELECT @Titulo= ''Titulo_''+cast(@noticia as varchar(MAX))
SELECT @Subtitulo= ''Subtitulo_''+cast(@noticia as varchar(MAX)) 
SELECT @TEXTO= ''Texto_''+cast(@noticia as varchar(MAX)) 

SELECT @idLeyenda1=idLeyenda from [Leyenda] where tag like @Titulo
SELECT @idLeyenda2=idLeyenda from [Leyenda] where tag like @SubTitulo
SELECT @idLeyenda3=idLeyenda from [Leyenda] where tag like @Texto

--elimina la traduccion
IF (@idLeyenda1>0 AND @idLeyenda2>0 AND @idLeyenda3>0)
	BEGIN
	delete from [dbo].[Traduccion] 
     where IdLeyenda in (@idLeyenda1,@idLeyenda2,@idLeyenda3);
	 --Elimina la leyenda
	Delete from [dbo].[Leyenda]
	where IdLeyenda in (@idLeyenda1,@idLeyenda2,@idLeyenda3);
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	idoma nuevo
-- ==============================================================
CREATE PROCEDURE [dbo].[Idioma_Insert] 
@idioma varchar(max)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @idLeyenda as int
DECLARE @Texto as varchar(max)

SELECT @id=IdIdioma FROM [dbo].[Idioma] WHERE descIdioma = @idioma
IF @id > 0
	BEGIN
	--El idioma tiene una baja lógica
	UPDATE [dbo].[Idioma]
	SET Estado = 1
	WHERE IdIdioma=@id

	UPDATE [dbo].[Traduccion]
	SET Estado = 1
	WHERE IdIdioma=@id
	END
ELSE
BEGIN
	INSERT INTO [dbo].[Idioma] ([descIdioma]) VALUES (@idioma)
	SELECT @id=IdIdioma FROM [dbo].[Idioma] WHERE descIdioma = @idioma
-- Declarar el cursor
DECLARE micursor CURSOR 
FOR SELECT IdLeyenda, TextoDefault FROM [dbo].[Leyenda]
-- Abrir el cursor
OPEN micursor
-- Leer la primera fila del cursor
FETCH micursor INTO @idLeyenda, @Texto
WHILE (@@FETCH_STATUS = 0 )
	BEGIN
		-- insertar las traducciones default (despues que se editen)
		INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto])
		VALUES (@id,@idLeyenda, @Texto) 
	FETCH micursor INTO @idLeyenda, @Texto
	END
-- Cerrar el cursor
CLOSE micursor
-- Liberar los recursos del cursor
DEALLOCATE micursor
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_InsertTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_InsertTraduccionNoticia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ======================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Actualizar la traduccion de unaleyenda para un idioma
-- ======================================================================
CREATE PROCEDURE [dbo].[Idioma_InsertTraduccionNoticia] 
@idioma as varchar(max), @leyenda as varchar(max), @texto as varchar(max), @textodefault as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
DECLARE @idLeyenda as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @leyenda
IF (@idIdioma is null)
	begin
	return -1;
	end
--Insertar la leyenda
IF (@idLeyenda is null)
	begin
	INSERT INTO [dbo].[Leyenda] ([Tag],[TextoDefault],[Estado])
    VALUES (@leyenda, @textodefault, 1);
	SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @leyenda;
	end
--insertar la traduccion
IF (@idIdioma >0 AND @idLeyenda>0)
	BEGIN
	INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto],[Estado])
     VALUES(@idIdioma, @idLeyenda, @texto, 1);
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar idomas
-- ==============================================================
CREATE PROCEDURE [dbo].[Idioma_SelectAll] 
	AS
BEGIN TRY
	SELECT descIdioma as nombre from Idioma WHERE Estado=1
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectLeyenda]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectLeyenda]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar leyendas de un idioma
-- ==============================================================
CREATE PROCEDURE [dbo].[Idioma_SelectLeyenda] 
@idioma as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
	SELECT * from vw_leyenda WHERE idIdioma = @idIdioma order by etiqueta
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectTraduccion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectTraduccion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar leyendas de un idioma
-- ==============================================================
CREATE PROCEDURE [dbo].[Idioma_SelectTraduccion] 
@idioma as varchar(max), @tag as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
	SELECT * from vw_leyenda WHERE idIdioma = @idIdioma and Etiqueta=@tag
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_SelectTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_SelectTraduccionNoticia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ======================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Actualizar la traduccion de unaleyenda para un idioma
-- ======================================================================
CREATE PROCEDURE [dbo].[Idioma_SelectTraduccionNoticia] 
@idioma as varchar(max), @CodigoNoticia as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
DECLARE @idLeyenda as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @CodigoNoticia
IF (@idIdioma is null)
	begin
	return -1;
	end
--Insertar la leyenda
IF (@idLeyenda is null)
	begin
	return -1;
	end
--insertar la traduccion
IF (@idIdioma >0 AND @idLeyenda>0)
	BEGIN
	SELECT * from vw_leyenda WHERE idIdioma = @idIdioma 
	AND IdLeyenda=@idLeyenda
	order by etiqueta
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_UpdateTraduccion]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_UpdateTraduccion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Actualizar la traduccion de unaleyenda para un idioma
-- ======================================================================
CREATE PROCEDURE [dbo].[Idioma_UpdateTraduccion] 
@idioma as varchar(max), @leyenda as varchar(max), @texto as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
DECLARE @idLeyenda as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @leyenda

IF (@idIdioma >0 AND @idLeyenda>0)
	BEGIN
	UPDATE Traduccion
	SET Texto=@texto
	WHERE IdIdioma=@idIdioma
	AND IdLeyenda=@idLeyenda
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_UpdateTraduccionNoticia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma_UpdateTraduccionNoticia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ======================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Actualizar la traduccion de unaleyenda para un idioma
-- ======================================================================
CREATE PROCEDURE [dbo].[Idioma_UpdateTraduccionNoticia] 
@idioma as varchar(max), @leyenda as varchar(max), @texto as varchar(max), @textodefault as varchar(max)
	AS
BEGIN TRY
DECLARE @idIdioma as int
DECLARE @idLeyenda as int
SELECT @idIdioma = idIdioma FROM Idioma WHERE descIdioma = @idioma
SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @leyenda
IF (@idIdioma is null)
	begin
	return -1;
	end
--Actualiza la leyenda
	Update [dbo].[Leyenda]
	set [TextoDefault] =@textodefault
	where tag=@leyenda;
--actualiza la traduccion
IF (@idIdioma >0 AND @idLeyenda>0)
	BEGIN
	Update [dbo].[Traduccion] 
	set [Texto] = @texto
     where IdIdioma= @idIdioma  and IdLeyenda= @idLeyenda;
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Linea_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Linea
-- ==============================================================
CREATE PROCEDURE [dbo].[Linea_SelectAll]
AS
BEGIN TRY
SELECT LineaProducto as Linea FROM Linea ORDER BY LineaProducto
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Localidad_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Localidades
-- ==============================================================
CREATE PROCEDURE [dbo].[Localidad_SelectAll]
AS
BEGIN TRY
SELECT Localidad FROM Localidad WHERE Estado=1 ORDER BY Localidad
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Marca_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Marca
-- ==============================================================
CREATE PROCEDURE [dbo].[Marca_SelectAll]
AS
BEGIN TRY
SELECT Marca FROM Marca ORDER BY Marca
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Nivel_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Niveles de Competencia
-- ==============================================================
CREATE PROCEDURE [dbo].[Nivel_SelectAll]
AS
BEGIN TRY
SELECT Descripcion FROM Nivel ORDER BY Descripcion
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH







' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Eliminar Noticia
-- ==============================================================
CREATE procedure [dbo].[Noticia_Delete]
@CodigoNoticia int
AS
BEGIN TRY 
delete from Noticia 
where codigoNoticia = @CodigoNoticia
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_GetByCodigo]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_GetByCodigo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Listar una Noticia
-- ==============================================================
CREATE Procedure [dbo].[Noticia_GetByCodigo]
@codigoNoticia int
AS
BEGIN TRY
select titulo,subtitulo,texto,rutaImagen from Noticia
where @codigoNoticia = codigoNoticia
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Insertar Noticia
-- ==============================================================
CREATE procedure [dbo].[Noticia_Insert]
@titulo varchar(MAX),
@subtitulo varchar(Max),
@texto varchar(max),
@RutaImagen varchar(100)
AS
BEGIN TRY
DECLARE @codigonoti as integer
insert into Noticia (titulo,subtitulo,texto,RutaImagen,estado) 
values (@Titulo,@subtitulo,@texto,@RutaImagen,1);
select @codigonoti=CodigoNoticia from Noticia where Titulo=@Titulo and Subtitulo=@subtitulo and Texto=@texto and RutaImagen=@RutaImagen;
return @codigonoti;
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Select]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Mostrar el codigo de una noticia
-- ==============================================================
CREATE procedure [dbo].[Noticia_Select]
@titulo varchar(MAX),
@subtitulo varchar(Max),
@texto varchar(max),
@RutaImagen varchar(100)
AS
BEGIN TRY
DECLARE @codigonoti as integer
select @codigonoti=CodigoNoticia from Noticia where Titulo=@Titulo and Subtitulo=@subtitulo and Texto=@texto and RutaImagen=@RutaImagen;
select @codigonoti as CodigoNoticia;
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Listar Noticias
-- ==============================================================
CREATE PROCEDURE [dbo].[Noticia_SelectAll]
AS

BEGIN TRY
SELECT CodigoNoticia,Titulo,Subtitulo,Texto,RutaImagen FROM Noticia
	where estado = 1 Order by CodigoNoticia desc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_SelectInicio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_SelectInicio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Listar Noticias para pag inicio
-- ==============================================================
CREATE PROCEDURE [dbo].[Noticia_SelectInicio]
AS

BEGIN TRY
SELECT CodigoNoticia,Titulo,Subtitulo,Texto,RutaImagen FROM Noticia
	where estado = 1
	and CodigoNoticia > 11
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Noticia_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Actualizar Noticia
-- ==============================================================
CREATE procedure [dbo].[Noticia_Update]
@CodigoNoticia int,
@titulo varchar(MAX),
@subtitulo varchar(Max),
@texto varchar(max),
@RutaImagen varchar(100)
AS
BEGIN TRY
Update Noticia 
Set titulo    = @Titulo ,
    subtitulo = @subtitulo,
	texto     = @texto,
	RutaImagen= @rutaImagen 

where
codigoNoticia = @CodigoNoticia
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pago_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pago_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta un Pago nuevo
-- ==============================================================
CREATE Procedure [dbo].[Pago_Insert]
(
@login as varchar(max)
,@tipoFormulario as varchar(max)
,@sucursalFormulario as varchar(max)
,@numeroFormulario int
,@pagoTipo as varchar(max)
,@numero as varchar(max)
,@vencimiento as varchar(max)
,@cantCuotas as int
,@subtotal as money
)
As
DECLARE @existe as int
DECLARE @ClienteID as int
DECLARE @CodTipo as int
DECLARE @form as int
DECLARE @recargo as int
DECLARE @total as money
DECLARE @valorrecargo as money
DECLARE @valoriva as money
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @login
--print ''Cliente: ''+cast(@ClienteID as varchar)
--SELECT @CodTipo=CodMedioPagoTipo FROM [dbo].[MedioPagoTipo] WHERE MedioPago=@pagoTipo
SET  @CodTipo=1 --Tarjeta de Credito
--print ''Tipo: '' + cast(@CodTipo as varchar)
--controlo que exista el cliente antes de insertar el medio de pago
SELECT @existe = isnull(COUNT(*),0) FROM Usuario WHERE login = @login
--print ''Existe: '' + cast(@existe as varchar)
--controlo que exista el pedido antes de insertar el envio
SELECT @form = isnull(COUNT(*),0) FROM Formulario_CAB WHERE Tipo=2 AND Sucursal=1 and Numero=@numeroFormulario and Cliente=@ClienteID
--en base a las cuotas, defino el recargo
SELECT @recargo= CASE @cantCuotas 
WHEN 1 THEN 0
WHEN 3 THEN 10
WHEN 6 THEN 12
WHEN 12 THEN 15
END 
print @recargo
--calculo el total
SELECT @valorrecargo = (@subtotal * @recargo)/100
SELECT @valoriva = ((@subtotal + @valorrecargo)*21)/100
SELECT @total= @subtotal + @valorrecargo + @valoriva
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
BEGIN TRY
IF (@existe>0 AND @form>0)
BEGIN
BEGIN TRANSACTION
--print ''inicia transaccion''
	--nuevo medio de pago
    INSERT INTO [dbo].[MedioPago] ([idUsuario],[MedioPagoTipo],[Numero] ,[Vencimiento],[Estado],[DVH])
     VALUES (@ClienteID, @CodTipo, @numero, @vencimiento,1,''0'')
	print ''insert MedioPago''
	--nuevo pago
	INSERT INTO [dbo].[Pago]
           ([idUsuario],[medioPagoTipo],[FormularioTipo],[FormularioSucursal],[FormularioNumero],[cantidadCuotas],[Recargo],[total],[Estado])
     VALUES (@ClienteID,@CodTipo,2,1,@numeroFormulario,@cantCuotas,@recargo,@total,1)
	print ''insert Pago''
COMMIT TRANSACTION
--print ''Commit''
END
END TRY
BEGIN CATCH
ROLLBACK
--print ''rollback''
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_CambiarEstado]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_CambiarEstado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Cambiar el estado de un pedido
-- ==============================================================
CREATE PROCEDURE [dbo].[Pedido_CambiarEstado]
@tipo as int, @Sucursal as int, @Numero as int, @Estado as varchar(max)
AS
BEGIN TRY
DECLARE @NroFormulario as int
DECLARE @CodEstado as int
-- busco el numero
SELECT @NroFormulario=isnull(fc.Numero,0)
FROM [dbo].[vw_FormularioCabecera] fc 
WHERE fc.formulariotipo like ''Pedido'' AND fc.estado=1
AND fc.sucursal=@Sucursal AND fc.Numero=@Numero

--busco el codigo
SELECT @CodEstado=CodEstado FROM [dbo].[FormularioEstado] WHERE FormularioEstado=@Estado

-- Si existen el formulario y el estado, le cambio el estado
IF (@NroFormulario > 0 AND @CodEstado>0)
BEGIN
	UPDATE [dbo].[Formulario_CAB]
	SET EstadoFormulario=@CodEstado
	WHERE Estado=1
	AND tipo=@tipo AND sucursal=@Sucursal AND Numero=@NroFormulario
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Cuotas]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Cuotas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Obtener el nro de cuotas del pago 
-- ==================================================================
CREATE Procedure [dbo].[Pedido_Cuotas]
(
    @Pedido as integer, @cuotas as integer output, @recargo as integer output
)
As
DECLARE @existe int
DECLARE @tipoPed int
DECLARE @pagado int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @tipoPed=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Pedido'' AND Estado=1
SELECT @existe=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoPed AND Sucursal=1 AND Numero=@Pedido
SELECT @pagado=count(*) FROM [FSS].[dbo].[Pago] WHERE FormularioTipo=@tipoPed AND FormularioSucursal=1 AND FormularioNumero=@Pedido
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @existe >0
	BEGIN
		IF @pagado >0
			BEGIN
			SELECT @cuotas=cantidadCuotas, @recargo=Recargo FROM [FSS].[dbo].[Pago] WHERE FormularioTipo=@tipoPed AND FormularioSucursal=1 AND FormularioNumero=@Pedido
			END
		ELSE
			BEGIN
			PRINT ''Pago inexistente''
			END
	END
ELSE
	BEGIN
	PRINT ''Pedido inexistente''
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Eliminar un pedido
-- ==============================================================
CREATE PROCEDURE [dbo].[Pedido_Delete]
@tipo as int, @Sucursal as int, @Numero as int
AS
BEGIN TRY
DECLARE @NroFormulario as int
-- busco el numero
SELECT @NroFormulario=isnull(fc.Numero,0)
FROM [dbo].[vw_FormularioCabecera] fc 
WHERE fc.formulariotipo like ''Pedido'' AND fc.estado=1
AND fc.sucursal=@Sucursal AND fc.Numero=@Numero

-- Si existe el formulario, le pongo el estado en cero
IF (@NroFormulario > 0)
BEGIN
	UPDATE [dbo].[Formulario_CAB]
	SET Estado=0
	WHERE Estado=1
	AND tipo=@tipo AND sucursal=@Sucursal AND Numero=@NroFormulario
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Envio]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Envio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Obtener el pago de un pedido
-- ==================================================================
CREATE Procedure [dbo].[Pedido_Envio]
(
    @Pedido as integer
)
As
DECLARE @existe int
DECLARE @tipoPed int
DECLARE @enviado int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @tipoPed=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Pedido'' AND Estado=1
SELECT @existe=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoPed AND Sucursal=1 AND Numero=@Pedido
SELECT @enviado=count(*) FROM [dbo].[Envio] WHERE FormularioTipo=@tipoPed AND FormularioSucursal=1 AND FormularioNumero=@Pedido
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @existe >0
	BEGIN
		IF @enviado >0
			BEGIN
				SELECT env.NumeroEnvio
				,dom.Calle
				,dom.Nro
				,dom.Piso
				,dom.Depto
				,loc.Localidad
				,prov.Provincia
				,cp.CPA
				FROM [dbo].[Envio] env
				INNER JOIN [dbo].[Domicilio] dom ON env.domicilio = dom.idDomicilio
				INNER JOIN [dbo].[Localidad] loc ON dom.Localidad=loc.CodLocalidad
				INNER JOIN [dbo].[Provincia] prov ON dom.Provincia= prov.CodProvincia
				INNER JOIN [dbo].[CodigoPostal] cp ON dom.CodigoPostal=cp.Nro
				WHERE env.FormularioTipo=@tipoPed AND env.FormularioSucursal=1 AND env.FormularioNumero=@Pedido
			END
		ELSE
			BEGIN
			PRINT ''Envio inexistente''
			END
	END
ELSE
	BEGIN
	PRINT ''Pedido inexistente''
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Estados]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Estados]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 21/07/2016
-- Description:	Obtener los posibles estado de un pedido
-- ==================================================================
CREATE Procedure [dbo].[Pedido_Estados]
As
SELECT ''Todos'' as [FormularioEstado]
UNION
SELECT [FormularioEstado] FROM [dbo].[FormularioEstado] WHERE [CodEstado] < 7 
ORDER BY [FormularioEstado] ASC

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta un Pedido nuevo
-- ==============================================================
CREATE Procedure [dbo].[Pedido_Insert]
(
    @Cliente as varchar(max), @nro as integer output
)
As
DECLARE @cant as int
DECLARE @ClienteID int
DECLARE @CountItems int
DECLARE @tipo int
DECLARE @sucursal int
DECLARE	@numero as int
DECLARE @dom as int
DECLARE @cuit as bigint
DECLARE @estado as int
DECLARE @emisor as int
DECLARE @item as int
DECLARE @cabOK as int
DECLARE @detOK as int
DECLARE @prod as int
DECLARE @codTalle as int
DECLARE @cantprod as int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @tipo=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Pedido'' AND Estado=1
SELECT @cant=COUNT(isnull(numero,0)) FROM [dbo].[Formulario_CAB] WHERE tipo =@tipo
--PRINT CAST(@cant as varchar(max))
IF (@cant=0)
BEGIN
	-- es el primer numero
	SET @numero = 1
END
ELSE -- le asigno el proximo
BEGIN
	SELECT @numero=max(isnull(numero,0))+1 FROM [dbo].[Formulario_CAB] WHERE tipo =@tipo
END
--PRINT CAST(@numero as varchar(max))
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
SELECT @CountItems = Count(ProductoID) FROM PedidoTemporal WHERE PedidoTemporalID = @ClienteID
SELECT TOP 1 @sucursal=CodSucursal FROM [dbo].[Sucursal]
SELECT @dom=CodDomicilioTipo FROM [dbo].[DomicilioTipo] WHERE DomicilioTipo=''Sin Domicilio''
SELECT TOP 1 @cuit=CUIT FROM [dbo].[Empresa]
SELECT @estado = CodEstado FROM [dbo].[FormularioEstado] WHERE FormularioEstado=''Nuevo''
SELECT @emisor=idUsuario FROM [dbo].[Usuario] WHERE login = ''Sistema''
SET @item=0
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @CountItems > 0  -- existen items => crear el pedido
BEGIN
    --insertar la cabecera del pedido
	INSERT INTO [dbo].[Formulario_CAB] ([Tipo],[Sucursal],[Numero],[FecEmision],[FecVto],[Cliente],[DomicilioTipo],[Empresa],[EstadoFormulario],[EmitidoPor],[Estado])
    VALUES (@tipo,@sucursal,@numero,getdate(),getdate()+30,@ClienteID,@dom,@cuit,@estado,@emisor,1)
    PRINT ''INSERT CABECERA''
	--insertar el detalle del pedido
	DECLARE miCursor CURSOR FOR   
	SELECT [ProductoID],[Talle],[Cantidad] FROM [dbo].[PedidoTemporal] WHERE [PedidoTemporalID]=@ClienteID
    
	OPEN miCursor  
    FETCH NEXT FROM miCursor INTO @prod,@codTalle,@cantprod
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
		SET @item= @item+1
		INSERT INTO [dbo].[Formulario_DET] ([Tipo],[Sucursal],[NroFormulario],[Item],[Inventario],[Talle],[cantidad],[Estado])
		VALUES(@tipo,@sucursal,@numero, @item,@prod,@codTalle,@cantprod,1)
    FETCH NEXT FROM miCursor INTO @prod,@codTalle,@cantprod
    END  
    CLOSE miCursor  
    DEALLOCATE miCursor
	PRINT ''INSERT DETALLE''
END
ELSE
BEGIN
	PRINT ''NO TIENE ITEMS''
END
SELECT @cabOK=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo = @tipo AND Sucursal= @sucursal AND Numero= @numero
SELECT @detOK=count(*) FROM [dbo].[Formulario_DET] WHERE Tipo = @tipo AND Sucursal= @sucursal AND NroFormulario= @numero
--PRINT ''CABECERA: ''+CAST(@cabOK as varchar(max))+'' - DETALLE: ''+CAST(@detOK as varchar(max))
IF (@cabOK>0 AND @detOK>0)
BEGIN
	--eliminar el pedido temporal
	DELETE FROM [dbo].[PedidoTemporal] WHERE [PedidoTemporalID]=@ClienteID
	PRINT ''DELETE TEMPORAL''
	SET @nro=@numero
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_NroFactura]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_NroFactura]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Obtener el nro de factura que corresponde al pedido
-- ==================================================================
CREATE Procedure [dbo].[Pedido_NroFactura]
(
    @Pedido as integer, @nroFact as integer output, @fecha as datetime output
)
As
DECLARE @existe int
DECLARE @tipoPed int
DECLARE @tipoFact int
DECLARE @facturado int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @tipoPed=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Pedido'' AND Estado=1
SELECT @tipoFact=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Factura'' AND Estado=1
SELECT @existe=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoPed AND Sucursal=1 AND Numero=@Pedido
SELECT @facturado=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoFact AND Sucursal=1 AND Pedido=@Pedido
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @existe >0
	BEGIN
		IF @facturado >0
			BEGIN
			SELECT @nroFact=Numero, @fecha=FecEmision FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoFact AND Sucursal=1 AND Pedido=@Pedido
			END
		ELSE
			BEGIN
			PRINT ''Factura inexistente''
			END
	END
ELSE
	BEGIN
	PRINT ''Pedido inexistente''
	END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Pago]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido_Pago]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Obtener el pago de un pedido
-- ==================================================================
CREATE Procedure [dbo].[Pedido_Pago]
(
    @Pedido as integer
)
As
DECLARE @existe int
DECLARE @tipoPed int
DECLARE @pagado int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @tipoPed=Tipo FROM [dbo].[FormularioTipo] WHERE Descripcion=''Pedido'' AND Estado=1
SELECT @existe=count(*) FROM [dbo].[Formulario_CAB] WHERE Tipo=@tipoPed AND Sucursal=1 AND Numero=@Pedido
SELECT @pagado=count(*) FROM [FSS].[dbo].[Pago] WHERE FormularioTipo=@tipoPed AND FormularioSucursal=1 AND FormularioNumero=@Pedido
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
IF @existe >0
	BEGIN
		IF @pagado >0
			BEGIN
			SELECT * FROM [FSS].[dbo].[Pago] WHERE FormularioTipo=@tipoPed AND FormularioSucursal=1 AND FormularioNumero=@Pedido
			END
		ELSE
			BEGIN
			PRINT ''Pago inexistente''
			END
	END
ELSE
	BEGIN
	PRINT ''Pedido inexistente''
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_ContarByCliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_ContarByCliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 01/07/2016
-- Description:	Contar los Pedidos de un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[PedidoCabecera_ContarByCliente]
@Cliente as varchar(max),
@Contar int OUTPUT
AS
DECLARE @ClienteID int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
--************************************************************************************************************************
-- SELECT
--************************************************************************************************************************
BEGIN TRY
SELECT @Contar=count(*) FROM [dbo].[vw_FormularioCabecera] WHERE formulariotipo like ''Pedido'' AND estado=1 AND Cliente=@ClienteID
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 01/07/2016
-- Description:	Listar las Cabeceras de Pedidos
-- ==============================================================
CREATE PROCEDURE [dbo].[PedidoCabecera_SelectAll]
AS
BEGIN TRY
SELECT * FROM [dbo].[vw_FormularioCabecera] WHERE formulariotipo like ''Pedido'' AND estado=1
order by Numero desc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectAllByCliente]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectAllByCliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 01/07/2016
-- Description:	Listar las Cabeceras de los Pedidos de un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[PedidoCabecera_SelectAllByCliente]
@Cliente as varchar(max)
AS
DECLARE @ClienteID int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
--************************************************************************************************************************
-- SELECT
--************************************************************************************************************************
BEGIN TRY
SELECT * FROM [dbo].[vw_FormularioCabecera] WHERE formulariotipo like ''Pedido'' AND estado=1 AND Cliente=@ClienteID
order by Numero desc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoCabecera_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoCabecera_SelectByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 01/07/2016
-- Description:	Listar la Cabecera de un Pedido
-- ==============================================================
CREATE PROCEDURE [dbo].[PedidoCabecera_SelectByID]
@Pedido as int
AS
BEGIN TRY
SELECT * FROM [dbo].[vw_FormularioCabecera] WHERE formulariotipo like ''Pedido'' AND estado=1 AND Numero=@Pedido
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalle_SelectByCabecera]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoDetalle_SelectByCabecera]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 01/07/2016
-- Description:	Listar las Cabeceras de Pedidos
-- ==============================================================
CREATE PROCEDURE [dbo].[PedidoDetalle_SelectByCabecera]
@tipo as int, @Sucursal as int, @Numero as int
AS
BEGIN TRY
DECLARE @NroFormulario as int
-- Primero busco la cabecera
SELECT @NroFormulario=isnull(fc.Numero,0)
FROM [dbo].[vw_FormularioCabecera] fc 
WHERE fc.formulariotipo like ''Pedido'' AND fc.estado=1
AND fc.sucursal=@Sucursal AND fc.Numero=@Numero
-- Si existe, busco el detalle
IF @NroFormulario > 0
BEGIN
	SELECT * FROM [dbo].[vw_FormularioDetalle] fd
	WHERE fd.Estado=1
	AND fd.tipo=@tipo AND fd.sucursal=@Sucursal AND fd.NroFormulario=@NroFormulario
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_AgregarItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_AgregarItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Agregar un item al Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_AgregarItem]
(
    @Cliente as varchar(max),
    @Producto int,
	@talle as varchar(max),
    @Cantidad int
)
As
DECLARE @ClienteID int
DECLARE @CountItems int
DECLARE @linea int
DECLARE @CodTalle as int

SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
SELECT @CountItems = Count(ProductoID) FROM PedidoTemporal WHERE ProductoID = @Producto AND PedidoTemporalID = @ClienteID
SELECT @linea = linea from Producto where Inventario= @Producto
SELECT @CodTalle=CodTalle FROM talle where talle= @talle and Linea=@linea

IF @CountItems > 0  -- existen items - actualizar la cantidad
BEGIN
    UPDATE PedidoTemporal
    SET Cantidad = (@Cantidad + PedidoTemporal.Cantidad)
    WHERE  ProductoID = @Producto
	AND Talle = @CodTalle
    AND PedidoTemporalID = @ClienteID
END
ELSE  --agregar nuevo registro al pedido
BEGIN
    INSERT INTO PedidoTemporal (PedidoTemporalID,Cantidad,ProductoID, Talle)
    VALUES (@ClienteID,@Cantidad,@Producto, @CodTalle)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_ContarItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_ContarItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Contar items del Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_ContarItem]
(
    @Cliente varchar(max),
    @ItemCount int OUTPUT
)
AS
DECLARE @ClienteID int
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
SELECT @ItemCount = Count(ProductoID) FROM PedidoTemporal WHERE PedidoTemporalID = @ClienteID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Listar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Listar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Listar items del Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_Listar]
(
    @Cliente varchar(max)
)
AS
DECLARE @ClienteID int
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente
SELECT 
    Producto.Inventario, 
    REPLACE(Producto.LineaProducto,''Otro'','''') + '' '' + REPLACE(Producto.Marca,''Otro'','''') + '' '' + REPLACE(Producto.Color,''Otro'','''') + '' '' + REPLACE(Talle.Talle,''Otro'','''') as Producto,
    PedidoTemporal.Cantidad,
    Producto.PrecioUnitario,
    Cast((Producto.PrecioUnitario * PedidoTemporal.Cantidad) as money) as SubTotal,
	Talle.Talle
FROM 
    vw_Producto Producto
    INNER JOIN PedidoTemporal ON Producto.Inventario = PedidoTemporal.ProductoID
	INNER JOIN Talle ON Talle.Talle = Producto.Talle AND PedidoTemporal.Talle=Talle.CodTalle
WHERE 
      PedidoTemporal.PedidoTemporalID = @ClienteID
ORDER BY 
    Producto.LineaProducto,
    Producto.Marca,
	Producto.Color,
	Producto.Talle


' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_RemoverItem]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_RemoverItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Eliminar un item del Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_RemoverItem]
(
    @Cliente as varchar(max),
    @Producto int
)
AS
DECLARE @ClienteID int
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente

DELETE FROM PedidoTemporal
WHERE PedidoTemporalID = @ClienteID
AND  ProductoID = @Producto
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Total]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Total]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Calcular el total del Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_Total]
(
   @Cliente varchar(max),
   @Total money OUTPUT
)
AS
DECLARE @ClienteID int
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente

SELECT @Total = SUM(Producto.PrecioUnitario * PedidoTemporal.Cantidad)
FROM vw_Producto Producto
    INNER JOIN PedidoTemporal ON Producto.Inventario = PedidoTemporal.ProductoID
	INNER JOIN Talle ON Talle.Talle = Producto.Talle AND PedidoTemporal.Talle=Talle.CodTalle
WHERE 
    PedidoTemporal.PedidoTemporalID = @ClienteID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Modificar Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_Update]
(
    @Cliente as varchar(max),
    @Producto int,
    @Cantidad int
)
AS
DECLARE @ClienteID int
SELECT @ClienteID = idUsuario FROM Usuario WHERE login = @Cliente

UPDATE PedidoTemporal
SET Cantidad = @Cantidad
WHERE PedidoTemporalID = @ClienteID 
AND ProductoID = @Producto
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoTemporal_Vaciar]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal_Vaciar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Eliminar todos los items del Pedido Temporal
-- ==============================================================
CREATE Procedure [dbo].[PedidoTemporal_Vaciar]
(
    @PedidoTemporalID nvarchar(50)
)
AS

DELETE FROM PedidoTemporal

WHERE 
    PedidoTemporalID = @PedidoTemporalID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Permiso
-- ==============================================================
CREATE PROCEDURE [dbo].[Permiso_SelectAll]
AS
BEGIN TRY
SELECT DISTINCT p.permiso AS permiso
  FROM Permiso p 
  WHERE p.codigopermiso NOT IN (SELECT DISTINCT CodigoPadre FROM PermisoFamilia)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Permiso en Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Permiso_SelectIN]
@p1 as varchar(100)
AS
BEGIN TRY
DECLARE @padre as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Permiso Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
/*
SELECT DISTINCT p.permiso FROM Permiso p 
WHERE p.codigopermiso IN (SELECT fp.codigopermiso FROM PermisoFamilia fp WHERE fp.CodigoPadre = @padre AND fp.estado=1)
AND p.Simple=1
ORDER BY p.Permiso;
*/
select distinct sps.PermisoSimple as permiso 
from [dbo].[vw_SeguridadPermisoSimple] sps
where sps.[Estado] = 1 
and sps.CodigoPadre = @padre
and sps.CodigoPermiso in (select p.codigopermiso from permiso p where p.simple = 1 and p.estado = 1)
order by permiso
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectINFamilia]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectINFamilia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar las Familias que tienen un permiso
-- ==============================================================
CREATE PROCEDURE [dbo].[Permiso_SelectINFamilia]
@p1 as varchar(100)
AS
BEGIN TRY
DECLARE @hijo as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT DISTINCT f.CodigoPermiso FROM PermisoFamilia f INNER JOIN Permiso p ON f.CodigoPermiso = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Permiso Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @hijo = f.CodigoPermiso FROM PermisoFamilia f INNER JOIN Permiso p ON f.CodigoPermiso = p.codigopermiso AND p.permiso =  @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
SELECT DISTINCT p.permiso FROM Permiso p 
WHERE p.codigopermiso IN (SELECT fp.CodigoPadre FROM PermisoFamilia fp WHERE fp.CodigoPermiso = @hijo AND fp.estado=1)
AND p.Simple=0
AND p.Estado=1
ORDER BY p.Permiso;
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_SelectNOTIN]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_SelectNOTIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar Permiso que no esta en Familia
-- ==============================================================
CREATE PROCEDURE [dbo].[Permiso_SelectNOTIN]
@p1 as varchar(100)
AS
BEGIN TRY
DECLARE @padre as int
DECLARE @cant as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...'' 
IF NOT EXISTS (SELECT DISTINCT f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1)
BEGIN
	print ''Permiso Inexistente.''
	RETURN
END
ELSE
SELECT DISTINCT @padre = f.codigopadre FROM PermisoFamilia f INNER JOIN Permiso p ON f.codigopadre = p.codigopermiso AND p.permiso =  @p1

PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
/*
SELECT DISTINCT p.permiso FROM Permiso p 
WHERE p.codigopermiso IN (SELECT fp.codigopermiso FROM PermisoFamilia fp WHERE fp.CodigoPadre = @padre AND fp.estado=0)
AND p.Simple=1
ORDER BY p.Permiso;
*/
select distinct sps.PermisoSimple as permiso 
from [dbo].[vw_SeguridadPermisoSimple] sps
where sps.[Estado] = 0 
and sps.CodigoPadre = @padre
and sps.CodigoPermiso in (select p.codigopermiso from permiso p where p.simple = 1 and p.estado = 1)
order by permiso
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PermisoFamilia_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermisoFamilia_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/06/2016
-- Description:	Listar todos los Permisos (simples y compuestos)
-- ==============================================================
CREATE PROCEDURE [dbo].[PermisoFamilia_SelectAll]
AS
BEGIN TRY
SELECT pf.*, perm.Simple
  FROM vw_PermisoFamilia pf, permiso perm
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND perm.CodigoPermiso=pf.CodigoPermiso
  AND CodigoPadre<>99 --Excluyo Familias, sólo muestro permisos simples y compuestos
  AND CodigoPadre<500
  ORDER BY pf.PermisoHijo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH










' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_ActualizarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_ActualizarStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 27/07/2016
-- Update date: 29/07/2016
-- Description:	Devolver el stock de un Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_ActualizarStock]
@inventario as int, @talle as varchar(max), @stock as int output
AS
BEGIN TRY
--************************************************************************************
DECLARE @linea integer
DECLARE @codTalle integer
SELECT @linea=CodLinea FROM vw_Producto WHERE inventario = @inventario AND estado=1
SELECT @codTalle = t.CodTalle FROM [dbo].[Producto_Stock] ps
	INNER JOIN [dbo].[Talle] t ON ps.linea = t.Linea AND ps.talle = t.CodTalle
WHERE ps.Linea=@linea and ps.Estado=1 and t.Talle=@talle
--************************************************************************************
-- Actualizar el stock
--************************************************************************************
IF @codTalle >0
	BEGIN
	UPDATE [dbo].[Producto_Stock]
	SET Stock = @stock
	WHERE inventario=@inventario AND Linea=@linea AND talle=@codTalle
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_ConsultarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_ConsultarStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Devolver el stock de un Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_ConsultarStock]
@inventario as int, @talle as varchar(max), @stock as int output
AS
BEGIN TRY
DECLARE @linea integer
DECLARE @codTalle integer
SELECT @linea=CodLinea FROM vw_Producto WHERE inventario = @inventario AND estado=1
SELECT @codTalle = t.CodTalle FROM [dbo].[Producto_Stock] ps
	INNER JOIN [dbo].[Talle] t ON ps.linea = t.Linea AND ps.talle = t.CodTalle
WHERE ps.Linea=@linea and ps.Estado=1 and t.Talle=@talle

IF @codTalle >0
BEGIN
SELECT @stock = Stock FROM [dbo].[Producto_Stock] ps
WHERE ps.inventario=@inventario AND ps.Linea=@linea AND ps.talle=@codTalle AND ps.Estado=1
END

END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Delete]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	eliminar producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Delete] 
@inventario as int
AS
BEGIN TRY
DECLARE @id as int
SELECT @id=Inventario FROM [dbo].[Producto] WHERE Inventario = @inventario

--***************************************************************************************************************************
IF @id > 0
	BEGIN
	--El producto existe
	UPDATE [dbo].[Producto]
	SET Estado = 0
	WHERE Inventario = @id

--	UPDATE [dbo].[Producto_Precio]
--	SET Estado=0
--	WHERE Inventario = @id
--no le cambio e el estado al ultimo precio porque en las facturas viejas lo necesito aunque el producto este deshabilitado
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_DescontarStock]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_DescontarStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Devolver el stock de un Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_DescontarStock]
@inventario as int, @talle as varchar(max), @cant as int, @stock as int output
AS
BEGIN TRY
--************************************************************************************
-- Consultar el stock
--************************************************************************************
DECLARE @linea integer
DECLARE @codTalle integer
SELECT @linea=CodLinea FROM vw_Producto WHERE inventario = @inventario AND estado=1
SELECT @codTalle = t.CodTalle FROM [dbo].[Producto_Stock] ps
	INNER JOIN [dbo].[Talle] t ON ps.linea = t.Linea AND ps.talle = t.CodTalle
WHERE ps.Linea=@linea and ps.Estado=1 and t.Talle=@talle

IF @codTalle >0
	BEGIN
	SELECT @stock = Stock FROM [dbo].[Producto_Stock] ps
	WHERE ps.inventario=@inventario AND ps.Linea=@linea AND ps.talle=@codTalle AND ps.Estado=1
	END
ELSE
	BEGIN
	SET @stock =0
	END
PRINT @stock
--************************************************************************************
-- Si la cantidad es menor o igual al stock, realizo la venta
--************************************************************************************
IF @stock >= @cant
BEGIN
UPDATE [dbo].[Producto_Stock]
SET Stock = stock - @cant
WHERE inventario=@inventario AND Linea=@linea AND talle=@codTalle AND Estado=1
END
--************************************************************************************
-- Devolver el stock después de la venta
--************************************************************************************
SELECT @stock = Stock FROM [dbo].[Producto_Stock] ps
WHERE ps.inventario=@inventario AND ps.Linea=@linea AND ps.talle=@codTalle AND ps.Estado=1
PRINT @stock
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Insert]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	producto nuevo
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Insert] 
@linea varchar(max), @marca varchar(max), @color varchar(max),@nivel varchar(max), @cantmax int, @imagen varchar(max), @costo money, @precio money, @inventario int output
AS
BEGIN TRY
DECLARE @id as int
DECLARE @nextid as int
DECLARE @idLinea as int
DECLARE @idMarca as int
DECLARE @idColor as int
DECLARE @idNivel as int
DECLARE @idTalle as int

SELECT @idLinea = CodLinea FROM [dbo].[Linea] WHERE lineaProducto = @linea
SELECT @idMarca = CodMarca FROM [dbo].[Marca] WHERE Marca= @marca
SELECT @idColor = CodColor FROM [dbo].[Color] WHERE Color = @color
SELECT @idNivel = Importancia FROM [dbo].[Nivel] WHERE Descripcion = @nivel
SELECT @id=Inventario FROM [dbo].[Producto] WHERE linea = @idLinea AND Marca=@idMarca AND Color=@idColor  and ArchivoImagen=@imagen
SELECT @nextid=max(Inventario)+1 FROM [dbo].[Producto] WHERE linea = @idLinea
--***************************************************************************************************************************
IF @id > 0
	BEGIN
	--El producto tiene una baja lógica
	UPDATE [dbo].[Producto]
	SET Estado = 1
	WHERE Inventario = @id

	UPDATE [dbo].[Producto_Precio]
	SET Estado=1
	WHERE Inventario = @id
	
	SET @inventario = @id
	END
ELSE
BEGIN
	INSERT INTO [dbo].[Producto] ([Inventario],[Linea],[Marca],[Color],[CantMaxPorPedido],[ArchivoImagen],[Estado])
    VALUES (@nextid, @idLinea, @idMarca, @idColor, ISNULL(@cantmax, 0), ISNULL(@imagen, ''D:\Imagenes\ProductoSinImagen.jpg''),1)

	INSERT INTO [dbo].[Producto_Precio] ([Inventario],[FechaDesde],[FechaHasta],[costo],[precioUnitario],[precioDocena],[MaxPorcentajeDto],[EsOferta],[Estado])
    VALUES (@nextid, GETDATE(), NULL, ISNULL(@costo,0), ISNULL(@precio,0),ISNULL(@precio*12,0),0,0,1)

	INSERT INTO [dbo].[Producto_Nivel] ([Inventario],[Importancia],[Estado])
     VALUES (@nextid, @idNivel, 1)
	
	SET @inventario=@nextid

	DECLARE talle_cursor CURSOR FOR   
    SELECT CodTalle  FROM dbo.Talle   WHERE Linea=@idLinea
      
    OPEN talle_cursor  
    FETCH NEXT FROM talle_cursor INTO @idTalle
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
  
		INSERT INTO [dbo].[Producto_Stock] ([Inventario],[Linea],[Talle],[Stock],[Estado])
		VALUES(@nextid, @idLinea,@idTalle, 0,1)
	    
	FETCH NEXT FROM talle_cursor INTO @idTalle  
    END  
  
    CLOSE talle_cursor  
    DEALLOCATE talle_cursor  
	 
    END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Niveles]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Niveles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar los Niveles Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Niveles]
@inventario as int
AS
BEGIN TRY
SELECT DISTINCT nivel FROM vw_ProductoNivel WHERE inventario = @inventario AND estado=1
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH







' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAll]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_SelectAll]
AS
BEGIN TRY
SELECT DISTINCT Inventario, LineaProducto, Marca, Color, ArchivoImagen, costo, precioUnitario FROM vw_Producto WHERE estado=1 ORDER BY inventario
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAllByNivel]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAllByNivel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar los Productos con sus niveles
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_SelectAllByNivel]
AS
BEGIN TRY
--SELECT * FROM vw_Producto WHERE estado=1 ORDER BY inventario
SELECT [Inventario]
      ,[CodLinea]
      ,[LineaProducto]
      ,[CodMarca]
      ,[Marca]
      ,[CodColor]
      ,[Color]
      ,[ArchivoImagen]
      ,[costo]
      ,[precioUnitario]
      ,[Nivel]
      ,sum([cantidadVendida]) [cantidadVendida]
  FROM [FSS].[dbo].[vw_ProductoNivel]
  GROUP BY [Inventario]
      ,[CodLinea]
      ,[LineaProducto]
      ,[CodMarca]
      ,[Marca]
      ,[CodColor]
      ,[Color]
      ,[ArchivoImagen]
      ,[costo]
      ,[precioUnitario]
      ,[Nivel]
ORDER BY LineaProducto, Marca, Color, precioUnitario, Inventario
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectAllxLinea]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectAllxLinea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Producto por Linea
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_SelectAllxLinea]
@linea as varchar(max)
AS
BEGIN TRY
--SELECT * FROM vw_Producto WHERE LineaProducto= @linea AND Estado =1 ORDER BY inventario
SELECT p.Inventario, l.LineaProducto, m.Marca, c.Color, p.ArchivoImagen, pp.precioUnitario 
FROM Producto p 
INNER JOIN [dbo].[Linea] l ON p.Linea=l.CodLinea
INNER JOIN [dbo].[Marca] m ON p.Marca= m.CodMarca
INNER JOIN [dbo].[Color] c ON p.Color = c.CodColor
INNER JOIN [dbo].[Producto_Precio] pp ON p.Inventario= pp.Inventario
WHERE l.LineaProducto= @linea AND p.Estado =1 ORDER BY l.LineaProducto, m.Marca, c.Color, pp.precioUnitario, p.Inventario

END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_SelectByID]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_SelectByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar un Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_SelectByID]
@inventario as int
AS
BEGIN TRY
--SELECT * FROM vw_Producto WHERE inventario = @inventario AND estado=1
SELECT DISTINCT Inventario, LineaProducto, Marca, Color, ArchivoImagen, costo, precioUnitario FROM vw_Producto WHERE inventario = @inventario AND estado=1
ORDER BY LineaProducto, Marca, Color, precioUnitario, Inventario
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH








' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Talles]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Talles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar los Talles de un Producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Talles]
@inventario as int
AS
BEGIN TRY
DECLARE @linea integer
SELECT @linea=CodLinea FROM vw_Producto WHERE inventario = @inventario AND estado=1

SELECT t.CodTalle ,t.Talle
FROM [dbo].[Producto_Stock] ps
	INNER JOIN [dbo].[Talle] t ON ps.linea = t.Linea AND ps.talle = t.CodTalle
WHERE ps.Linea=@linea and ps.Estado=1 and ps.inventario=@inventario
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH









' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update]    Script Date: 09/12/2017 6:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	modificar producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Update] 
@linea varchar(max), @marca varchar(max), @color varchar(max), @cantmax int, @imagen varchar(max), @costo money, @precio money
AS
BEGIN TRY
DECLARE @id as int
DECLARE @idLinea as int
DECLARE @idMarca as int
DECLARE @idColor as int

SELECT @idLinea = CodLinea FROM [dbo].[Linea] WHERE lineaProducto = @linea
SELECT @idMarca = CodMarca FROM [dbo].[Marca] WHERE Marca= @marca
SELECT @idColor = CodColor FROM [dbo].[Color] WHERE Color = @color

SELECT @id=Inventario FROM [dbo].[Producto] WHERE linea = @idLinea AND Marca=@idMarca AND Color=@idColor

--***************************************************************************************************************************
IF @id > 0 	--El producto existe
	BEGIN
    if (@cantmax > -1)
		BEGIN
		UPDATE [dbo].[Producto]
		SET CantMaxPorPedido =@cantmax
		WHERE Inventario = @id
		END
	if (len(@imagen) > 0)
		BEGIN
		UPDATE [dbo].[Producto]
		SET ArchivoImagen=@imagen
		WHERE Inventario = @id
		END
	if (@costo>0 AND @precio>0)
		BEGIN
		UPDATE [dbo].[Producto_Precio]
		SET FechaHasta=getdate()
		WHERE Inventario = @id
		AND FechaHasta is null
		INSERT INTO [dbo].[Producto_Precio] ([Inventario],[FechaDesde],[FechaHasta],[costo],[precioUnitario],[precioDocena],[MaxPorcentajeDto],[EsOferta],[Estado])
		VALUES (@id, GETDATE(), NULL, ISNULL(@costo,0), ISNULL(@precio,0),ISNULL(@precio*12,0),0,0,1)
		END
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update2]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Update2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	modificar producto
-- ==============================================================
CREATE PROCEDURE [dbo].[Producto_Update2] 
@inventario int, @linea varchar(max), @marca varchar(max), @color varchar(max), @cantmax int, @imagen varchar(max), @costo money, @precio money
AS
BEGIN TRY
DECLARE @id as int
DECLARE @idLinea as int
DECLARE @idMarca as int
DECLARE @idColor as int

SELECT @idLinea = CodLinea FROM [dbo].[Linea] WHERE lineaProducto = @linea
SELECT @idMarca = CodMarca FROM [dbo].[Marca] WHERE Marca= @marca
SELECT @idColor = CodColor FROM [dbo].[Color] WHERE Color = @color

SELECT @id=@Inventario

--***************************************************************************************************************************
IF @id > 0 	--El producto existe
	BEGIN
    if (@cantmax > -1)
		BEGIN
		UPDATE [dbo].[Producto]
		SET CantMaxPorPedido =@cantmax
		WHERE Inventario = @id
		END
	if (len(@imagen) > 0)
		BEGIN
		UPDATE [dbo].[Producto]
		SET ArchivoImagen=@imagen
		WHERE Inventario = @id
		END
	if (@costo>0 AND @precio>0)
		BEGIN
		UPDATE [dbo].[Producto_Precio]
		SET FechaHasta=getdate()
		WHERE Inventario = @id
		AND FechaHasta is null
		INSERT INTO [dbo].[Producto_Precio] ([Inventario],[FechaDesde],[FechaHasta],[costo],[precioUnitario],[precioDocena],[MaxPorcentajeDto],[EsOferta],[Estado])
		VALUES (@id, GETDATE(), NULL, ISNULL(@costo,0), ISNULL(@precio,0),ISNULL(@precio*12,0),0,0,1)
		END
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Provincia_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Provincia
-- ==============================================================
CREATE PROCEDURE [dbo].[Provincia_SelectAll]
AS
BEGIN TRY
SELECT Provincia FROM Provincia WHERE Estado=1 ORDER BY Provincia
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_Insert]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Puntaje_Insert] 
@competencia varchar(max), @participante varchar(max), 
@puntaje2 varchar(5) = null, @puntaje3 varchar(5) = null, 
@puntaje4 varchar(5) = null, @puntaje5 varchar(5) = null, 
@puntaje6 varchar(5) = null, @puntaje7 varchar(5) = null, 
@puntaje8 varchar(5) = null, @puntaje9 varchar(5) = null, 
@puntaje10 varchar(5) = null, @puntaje11 varchar(5) = null
AS
BEGIN
DELETE FROM Puntaje 
WHERE competencia = @competencia 
AND patinador = @participante

INSERT INTO Puntaje ([Competencia],[Patinador],[J1valorA],[J1valorB],[J2valorA],[J2valorB],[J3valorA],[J3valorB],[J4valorA],[J4valorB],[J5valorA],[J5valorB],[Estado])
values (@competencia, @participante,
@puntaje2, @puntaje3,
@puntaje4, @puntaje5,
@puntaje6, @puntaje7,
@puntaje8, @puntaje9,
@puntaje10, @puntaje11,
1)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_Select]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[Puntaje_Select] 
@competencia as varchar(max), @patinador as varchar(max)
AS
BEGIN
	SELECT * FROM Puntaje
	WHERE ESTADO =1
	--AND patinador = @patinador
	AND competencia =@competencia
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Puntaje_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Puntaje_SelectAll] 
AS
BEGIN
	SELECT * FROM Puntaje
	WHERE ESTADO =1
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Recomendacion_Insert]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recomendacion_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 03/07/2016
-- Description:	Inserta una Recomendacion
-- ==============================================================
CREATE Procedure [dbo].[Recomendacion_Insert]
(
@email varchar(max),
@Nivel varchar(max)
)
As
DECLARE @elNivel as int
--************************************************************************************************************************
-- CONTROLES
--************************************************************************************************************************
SELECT @elNivel= Importancia  FROM [dbo].[Nivel] WHERE Descripcion=@Nivel
--************************************************************************************************************************
-- INSERT
--************************************************************************************************************************
BEGIN TRY
	INSERT INTO [dbo].[Recomendacion] ([email],[Nivel]) VALUES
	(@email,@elNivel)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateDBDictionary]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGenerateDBDictionary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[spGenerateDBDictionary] 
AS
BEGIN
TRUNCATE TABLE DICCIONARIO_DATOS;
INSERT INTO DICCIONARIO_DATOS
select a.name [Table],b.name [Attribute],c.name [DataType],b.isnullable [Allow Nulls?],CASE WHEN 
d.name is null THEN 0 ELSE 1 END [PKey?],
CASE WHEN e.parent_object_id is null THEN 0 ELSE 1 END [FKey?],CASE WHEN e.parent_object_id 
is null THEN ''-'' ELSE g.name  END [Ref Table],
CASE WHEN h.value is null THEN ''-'' ELSE h.value END [Description] 
from sysobjects as a
join syscolumns as b on a.id = b.id
join systypes as c on b.xtype = c.xtype 
left join (SELECT  so.id,sc.colid,sc.name 
      FROM    syscolumns sc
      JOIN sysobjects so ON so.id = sc.id
      JOIN sysindexkeys si ON so.id = si.id 
                    and sc.colid = si.colid
      WHERE si.indid = 1) d on a.id = d.id and b.colid = d.colid
left join sys.foreign_key_columns as e on a.id = e.parent_object_id and b.colid = e.parent_column_id    
left join sys.objects as g on e.referenced_object_id = g.object_id  
left join sys.extended_properties as h on a.id = h.major_id and b.colid = h.minor_id
where a.type = ''U'' 
and a.name not in(''DICCIONARIO_DATOS'', ''INTERMEDIA'', ''INTERMEDIA2'', ''sysdiagrams'')
order by a.name asc;

END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Suceso_Reset]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_Reset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Liberar tabla de suceso
-- ==============================================================
CREATE PROCEDURE [dbo].[Suceso_Reset]
AS
BEGIN TRY
INSERT INTO [dbo].[Suceso_hist]
SELECT [fecha],[id_suceso_tipo],[usuario],[descripcion],[Estado],[DVH] FROM [dbo].[Suceso]

TRUNCATE TABLE [dbo].[Suceso]
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Suceso_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Sucesos
-- ==============================================================
CREATE PROCEDURE [dbo].[Suceso_SelectAll] 
	AS
BEGIN TRY
	SELECT id_suceso_tipo as codigo, descripcion 
	FROM SucesoTipo WHERE Estado=1 and id_suceso_tipo > 0
	ORDER BY Descripcion asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Suceso_SelectAllBitacora]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_SelectAllBitacora]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Sucesos de la bitacora
-- ==============================================================
CREATE PROCEDURE [dbo].[Suceso_SelectAllBitacora] 
	AS
BEGIN TRY
	SELECT id_suceso_tipo as codigo, descripcion 
	FROM SucesoTipo	WHERE id_suceso_tipo = 9999
	UNION
	SELECT id_suceso_tipo as codigo, descripcion 
	FROM SucesoTipo WHERE Estado=1 and id_suceso_tipo > 0
	AND (id_suceso_tipo IN (SELECT DISTINCT s.id_suceso_tipo	FROM Suceso s)
	OR id_suceso_tipo IN (SELECT DISTINCT sh.id_suceso_tipo	FROM Suceso_hist sh))
	ORDER BY Descripcion asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Talle_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Talle
-- ==============================================================
CREATE PROCEDURE [dbo].[Talle_SelectAll]
AS
BEGIN TRY
SELECT Talle FROM Talle ORDER BY Talle
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Talle_SelectAllxProducto]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle_SelectAllxProducto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 27/07/2016
-- Update date: 29/07/2016
-- Description:	Listar Producto por Linea
-- ==============================================================
CREATE PROCEDURE [dbo].[Talle_SelectAllxProducto]
@inventario as int
AS
BEGIN TRY
--****************************************************************************
	DECLARE @linea as int
	SELECT @linea= Linea from producto where Inventario = @inventario
--****************************************************************************
SELECT ps.[Inventario]
      ,t.Talle
      ,ps.[Stock]
  FROM [FSS].[dbo].[Producto_Stock] ps
  inner join Talle t on t.Linea= ps.Linea and t.CodTalle = ps.Talle
  WHERE t.estado=1 and ps.Linea = @linea and ps.Inventario=@inventario
  order by t.Talle
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Traduccion_Select]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Traduccion
-- ==============================================================
CREATE PROCEDURE [dbo].[Traduccion_Select] 
@p1 as varchar(max), @p2 as varchar(max)
	AS
BEGIN TRY
DECLARE @idioma as integer
DECLARE @leyenda as integer
DECLARE @existe as integer
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
--IDIOMA
IF NOT EXISTS (SELECT IdIdioma from Idioma	WHERE descIdioma=@p2)
BEGIN
	print ''Idioma Inexistente.''
	RETURN
END
ELSE
SELECT @idioma=IdIdioma from Idioma	WHERE descIdioma=@p2
--LEYENDA
IF NOT EXISTS (SELECT idleyenda from Leyenda	WHERE tag=@p1)
BEGIN
	print ''Traduccion Inexistente.''
	RETURN
END
ELSE
SELECT @leyenda=idleyenda from Leyenda	WHERE tag=@p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
SELECT @existe= count(*) from Traduccion WHERE Estado=1 AND idIdioma=@idioma AND idleyenda=@leyenda;
IF @existe > 0
	begin
	SELECT texto from Traduccion WHERE Estado=1 AND idIdioma=@idioma AND idleyenda=@leyenda;
	end
ELSE
	begin
	SELECT [TextoDefault] as texto FROM [dbo].[Leyenda] WHERE Estado=1 AND idleyenda=@leyenda;
	end

END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Traduccion_Update]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 15/05/2016
-- Description:	Modificar Traduccion
-- ==============================================================
CREATE PROCEDURE [dbo].[Traduccion_Update] 
@p1 as varchar(max), @p2 as varchar(max), @p3 as varchar(max)
	AS
BEGIN TRY
DECLARE @idioma as integer
DECLARE @leyenda as integer
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
--IDIOMA
IF NOT EXISTS (SELECT IdIdioma from Idioma	WHERE descIdioma=@p2)
BEGIN
	print ''Idioma Inexistente.''
	RETURN
END
ELSE
SELECT @idioma=IdIdioma from Idioma	WHERE descIdioma=@p2
--LEYENDA
IF NOT EXISTS (SELECT idleyenda from Leyenda	WHERE tag=@p1)
BEGIN
	print ''Traduccion Inexistente.''
	RETURN
END
ELSE
SELECT @leyenda=idleyenda from Leyenda	WHERE tag=@p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
UPDATE Traduccion
SET texto = @p3
WHERE Estado=1 AND idIdioma=@idioma AND idleyenda=@leyenda;
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Delete]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Dar de baja un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Delete]
@p1 varchar(max)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @admin as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT idUsuario from Usuario WHERE Login =@p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE Login =@p1
SELECT @admin = count(*) from Usuario WHERE idUsuario=@id and upper(login) like ''ADMIN%''
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- BAJA LOGICA
--***************************************************************************
--si no es el administrador
IF (@admin = 0)
BEGIN
	--Le saco los permisos
	DELETE FROM [dbo].[Usuario_FamiliaPermiso]
	WHERE idUsuario=@id
	/* BAJA LOGICA */
	UPDATE [dbo].[Usuario]
	SET Estado = 0
	WHERE idUsuario = @id
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_EsCliente]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_EsCliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Informar si un Usuario es cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_EsCliente] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT EsCliente 
    FROM Usuario u
	WHERE u.Estado=1 
	and u.idUsuario = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_EsVendedor]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_EsVendedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Informar si un Usuario es cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_EsVendedor] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT EsVendedor
    FROM Usuario u
	WHERE u.Estado=1 
	and u.idUsuario = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Existe]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Existe]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Mostrar un Usuario con Password
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Existe] 
@login as varchar(max)
	AS
BEGIN TRY
DECLARE @id as int
SELECT @id = isnull(idUsuario,0) from Usuario WHERE login  = @login
IF @id > 0
	BEGIN
		SELECT 1 as existe
	END
ELSE
	BEGIN
		SELECT 0 as existe
	END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Insert]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Alta de Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Insert]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int
DECLARE @repetido int
DECLARE @idIdioma int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMAIL int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT max(idUsuario)+1 FROM [dbo].[Usuario])
BEGIN
	-- es el primer usuario
	SET @id = 1
END
ELSE -- le asigno el proximo id
BEGIN
	SELECT @id = max(idUsuario)+1 FROM [dbo].[Usuario]
END
SELECT @idIdioma=ISNULL(IdIdioma,1) FROM Idioma WHERE descIdioma=@idioma
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=0
SELECT @repetido = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=1
--DNI
SELECT @modificaDNI = len(@dni)
--PASS
SELECT @modificaPASS = len(@pass)
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
--EMAIL
SELECT @modificaEMAIL = len(@email)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- ALTA
--***************************************************************************
IF (@existe = 0 AND @repetido=0) --no existe
	BEGIN
	INSERT INTO [dbo].[Usuario] ([idUsuario],[DNI],[login],[Password],[Nombre],[Apellido],[email],[idioma],[Estado],[DVH])
    VALUES (@id, @dni, @login, @pass, @nombre, @apellido,@email, @idIdioma, 1, ''0'')
	-- perfil default
	INSERT INTO [dbo].[Usuario_FamiliaPermiso] ([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id,99,501,1)
	END
IF (@existe = 1 AND @repetido=0) --esta deshabilitado
BEGIN
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login
	--LO HABILITO
	UPDATE [dbo].[Usuario]
	SET Estado=1
	WHERE idUsuario = @id
	--DNI
	IF (@modificaDNI >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET DNI = @dni
		WHERE idUsuario = @id
	END
	--PASS
	IF (@modificaPASS >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
	END
	--IDIOMA
	IF (@modificaIDIOMA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET idioma=@idIdioma
		WHERE idUsuario = @id
	END
	--NOMBRE
	IF (@modificaNOMBRE >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Nombre=@nombre
		WHERE idUsuario = @id
	END
	--APELLIDO
	IF (@modificaAPELLIDO >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Apellido=@apellido
		WHERE idUsuario = @id
	END
	--EMAIL
	IF (@modificaEMAIL >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET email=@email
		WHERE idUsuario = @id
	END
--le saco todos los perfiles viejos
DELETE FROM [dbo].[Usuario_FamiliaPermiso] WHERE idUsuario = @id
-- perfil default
INSERT INTO [dbo].[Usuario_FamiliaPermiso] ([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id,99,501,1)
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilAsignar]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilAsignar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Asignar un perfil al Usuario
-- ==============================================================

CREATE PROCEDURE [dbo].[Usuario_PerfilAsignar]
@p1 as varchar(50), @p2 as varchar(1000)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @permiso as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login = @p1
IF NOT EXISTS (select codigopermiso from permiso where permiso = @p2)
BEGIN
	print ''Perfil Inexistente.''
	RETURN
END
ELSE
SELECT @permiso = codigopermiso from permiso where permiso = @p2
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  

--***************************************************************************
-- ASIGNAR
--***************************************************************************
INSERT INTO [dbo].[Usuario_FamiliaPermiso] ([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id,99,@permiso,1)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilDesasignar]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilDesasignar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Desasignar un perfil al Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_PerfilDesasignar]
@p1 as varchar(50), @p2 as varchar(1000)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @permiso as int
DECLARE @admin as int
DECLARE @administrador as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login = @p1
IF NOT EXISTS (select codigopermiso from permiso where permiso = @p2)
BEGIN
	print ''Perfil Inexistente.''
	RETURN
END
ELSE
SELECT @permiso = codigopermiso from permiso where permiso = @p2
--SELECT @admin = count(*) from Permiso WHERE CodigoPermiso=@permiso and upper(Permiso) like ''ADMIN%''
SELECT @administrador = count(*) from Usuario WHERE idUsuario=@id and upper(login) like ''ADMIN%''
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- DESASIGNAR
--***************************************************************************
IF (@administrador=0)-- si no es el administrador, le quito el permiso
BEGIN
	DELETE FROM [dbo].[Usuario_FamiliaPermiso] 
	WHERE [idUsuario]=@id
	AND [CodigoPadre]=99
	AND [CodigoPermiso]=@permiso
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilIN]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Listar perfiles de un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_PerfilIN]
@p1 as varchar(50)
AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login = @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
SELECT DISTINCT PermisoHijo as permiso
  FROM vw_PermisoFamilia pf
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND pf.CodigoPadre=99 --sólo Familias, NO muestro ni permisos simples ni compuestos
  AND pf.CodigoPermiso IN (SELECT ufp.CodigoPermiso FROM Usuario_FamiliaPermiso ufp WHERE ufp.Estado=1 AND ufp.idUsuario=@id)
  ORDER BY PermisoHijo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_PerfilNOTIN]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_PerfilNOTIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Listar perfiles que no tiene un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_PerfilNOTIN]
@p1 as varchar(max)
AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login = @p1
--***************************************************************************
-- SELECT
--***************************************************************************
  SELECT DISTINCT PermisoHijo as permiso
  FROM vw_PermisoFamilia pf
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND pf.CodigoPadre=99 --sólo Familias, NO muestro ni permisos simples ni compuestos
  AND pf.CodigoPermiso NOT IN (SELECT ufp.CodigoPermiso FROM Usuario_FamiliaPermiso ufp WHERE ufp.Estado=1 AND ufp.idUsuario=@id)
  ORDER BY PermisoHijo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Permisos]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Permisos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 28/06/2016
-- Description:	Listar permisos de un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Permisos]
@p1 as varchar(50)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @perfil int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login = @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- TABLA TEMPORAL PARA ALOJAR LOS PERMISOS COMPUESTOS QUE SUMAN
--***************************************************************************
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[INTERMEDIA]'') AND type in (N''U''))
DROP TABLE [dbo].[INTERMEDIA]

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[INTERMEDIA]'') AND type in (N''U''))
BEGIN
CREATE TABLE [dbo].[INTERMEDIA](
	[CodigoPadre] [int] NOT NULL,
	[PermisoPadre] [varchar](1000) NULL,
	[CodigoPermiso] [int] NOT NULL,
	[PermisoHijo] [varchar](1000) NULL,
	[seleccionado] [bit] NULL,
	[Estado] [bit] NOT NULL,
	[Simple] [int] NOT NULL
) ON [PRIMARY]
END
--***************************************************************************
-- TABLA TEMPORAL PARA ALOJAR LOS PERMISOS SIMPLES QUE RESTAN
--***************************************************************************
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[INTERMEDIA2]'') AND type in (N''U''))
DROP TABLE [dbo].[INTERMEDIA2]

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[INTERMEDIA2]'') AND type in (N''U''))
BEGIN
CREATE TABLE [dbo].[INTERMEDIA2](
	[CodigoPadre] [int] NOT NULL,
	[PermisoPadre] [varchar](1000) NULL,
	[CodigoPermiso] [int] NOT NULL,
	[PermisoHijo] [varchar](1000) NULL,
	[seleccionado] [bit] NULL,
	[Estado] [bit] NOT NULL,
	[Simple] [int] NOT NULL
) ON [PRIMARY]
END
/*
--***************************************************************************
-- OBTENER PERMISOS COMPUESTOS Y PERMISOS SIMPLES NEGADOS
--***************************************************************************
--FAMILIAS
INSERT INTO [dbo].[INTERMEDIA] ([CodigoPadre],[PermisoPadre],[CodigoPermiso],[PermisoHijo],[seleccionado],[Estado],[Simple])
SELECT DISTINCT pf.*, 0 as Simple
  FROM vw_PermisoFamilia pf
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND pf.CodigoPadre=99 --sólo Familias, NO muestro ni permisos simples ni compuestos
  AND pf.CodigoPermiso IN (SELECT ufp.CodigoPermiso FROM Usuario_FamiliaPermiso ufp WHERE ufp.Estado=1 AND ufp.idUsuario=@id)
--PERMISOS COMPUESTOS Y SIMPLES
INSERT INTO [dbo].[INTERMEDIA]([CodigoPadre],[PermisoPadre],[CodigoPermiso],[PermisoHijo],[seleccionado],[Estado],[Simple])
SELECT DISTINCT pf.*, perm.Simple as Simple
  FROM vw_PermisoFamilia pf, permiso perm
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND perm.CodigoPermiso=pf.CodigoPermiso
  AND CodigoPadre IN (SELECT ufp.CodigoPermiso FROM Usuario_FamiliaPermiso ufp WHERE ufp.Estado=1 AND ufp.idUsuario=@id)
ORDER BY Simple, pf.CodigoPadre, pf.PermisoHijo
--***************************************************************************
-- OBTENER PERMISOS SIMPLES
--***************************************************************************
SELECT DISTINCT pf.*, perm.Simple as Simple
INTO INTERMEDIA2
  FROM vw_PermisoFamilia pf, permiso perm
  WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE Estado=0)
  AND perm.CodigoPermiso=pf.CodigoPermiso
  AND CodigoPadre IN (SELECT CodigoPermiso FROM [dbo].[INTERMEDIA] WHERE estado = 1 AND codigoPermiso <100)
ORDER BY Simple, pf.CodigoPadre, pf.PermisoHijo
--***************************************************************************
-- LISTAR PERMISOS
--***************************************************************************
SELECT [CodigoPadre]
      ,[PermisoPadre]
      ,[CodigoPermiso]
      ,[PermisoHijo]
      ,[seleccionado]
      ,[Estado]
      ,[Simple]
	  ,CASE
	  WHEN seleccionado=1 AND CodigoPermiso <100 THEN 1
	  WHEN seleccionado=0 AND CodigoPermiso <100 THEN 0
	  WHEN seleccionado=0 AND CodigoPermiso >100 THEN 1
	  WHEN seleccionado=1 AND CodigoPermiso >100 THEN 0
	  END as Mostrar
FROM [dbo].[INTERMEDIA]
WHERE estado = 1 AND codigoPadre >500
UNION
SELECT [CodigoPadre]
      ,[PermisoPadre]
      ,[CodigoPermiso]
      ,[PermisoHijo]
      ,[seleccionado]
      ,[Estado]
      ,[Simple]
	  ,1 as Mostrar
FROM [dbo].[INTERMEDIA2]
ORDER BY Mostrar DESC
*/
--***************************************************************************
-- OBETENER PERMISOS QUE SUMAN Y RESTAN
--***************************************************************************
DECLARE cursor_perfiles CURSOR FOR   
SELECT ufp.CodigoPermiso FROM Usuario_FamiliaPermiso ufp WHERE ufp.Estado=1 AND ufp.idUsuario=@id AND ufp.CodigoPermiso>500 AND ufp.CodigoPadre=99  ORDER BY ufp.CodigoPermiso
    OPEN cursor_perfiles  
    FETCH NEXT FROM cursor_perfiles INTO @perfil
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
		--permisos compuestos que suman
		INSERT INTO [dbo].[INTERMEDIA] ([CodigoPadre],[PermisoPadre],[CodigoPermiso],[PermisoHijo],[seleccionado],[Estado],[Simple])
		SELECT vpf.* FROM vw_PermisoFamilia vpf WHERE vpf.CodigoPadre IN (SELECT distinct pf.CodigoPermiso FROM [PermisoFamilia] pf WHERE pf.CodigoPadre=@perfil and pf.Seleccionado=1)
		--permisos simples que restan
		INSERT INTO [dbo].[INTERMEDIA2] ([CodigoPadre],[PermisoPadre],[CodigoPermiso],[PermisoHijo],[seleccionado],[Estado],[Simple])
		SELECT vpf2.* FROM vw_PermisoFamilia vpf2 WHERE vpf2.CodigoPadre=@perfil and vpf2.seleccionado =1 and vpf2.CodigoPermiso between 100 and 500  
    FETCH NEXT FROM cursor_perfiles INTO @perfil
    END  
  
    CLOSE cursor_perfiles  
    DEALLOCATE cursor_perfiles
--***************************************************************************
-- PERMISOS A MOSTRAR
--***************************************************************************
SELECT vpf.*, vpf.seleccionado as Mostrar FROM vw_PermisoFamilia vpf WHERE vpf.CodigoPadre=99 AND vpf.CodigoPermiso=@perfil
UNION
SELECT vpf.*, vpf.seleccionado as Mostrar FROM vw_PermisoFamilia vpf WHERE vpf.CodigoPadre=@perfil and vpf.seleccionado =1 and vpf.CodigoPermiso<100--permisos compuestos
UNION
SELECT DISTINCT vpf.*, vpf.seleccionado as Mostrar FROM [dbo].[INTERMEDIA] vpf --permisos simples que suman
WHERE vpf.codigoPermiso NOT IN (SELECT DISTINCT pf2.CodigoPermiso FROM [dbo].[INTERMEDIA2] pf2) --permisos simples que restan
ORDER BY vpf.Simple, vpf.CodigoPadre, vpf.PermisoHijo
/*
SELECT DISTINCT * FROM [dbo].[INTERMEDIA]
SELECT DISTINCT * FROM [dbo].[INTERMEDIA2]
*/
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Select]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Mostrar un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Select] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma 
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and u.idUsuario = @id
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Usuarios
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_SelectAll] 
	AS
BEGIN TRY
	SELECT u.[idUsuario] as codigo,u.[DNI], u.email, u.[login], u.[Password],i.[descIdioma] as idioma
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectAllBitacora]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectAllBitacora]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Usuarios
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_SelectAllBitacora] 
	AS
BEGIN TRY
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login]
    FROM Usuario u WHERE upper(u.login) IN (''TODOS'', ''SISTEMA'')
	UNION
	SELECT DISTINCT s.[Usuario] as codigo,u.[DNI], u.[login]
	FROM Suceso s, Usuario u
	WHERE s.usuario=u.idUsuario
	UNION
	SELECT DISTINCT s.[Usuario] as codigo,u.[DNI], u.[login]
	FROM Suceso_hist s, Usuario u
	WHERE s.usuario=u.idUsuario
	ORDER BY u.login
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectDV]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectDV]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Listar Usuarios para calcular DV
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_SelectDV] 
	AS
BEGIN TRY
	SELECT [idUsuario] as id
      ,[DNI]
      ,[login]
      ,[Password]
      ,[idioma]
      ,[Estado]
      ,[DVH] FROM Usuario
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_SelectPass]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_SelectPass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Mostrar un Usuario con Password
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_SelectPass] 
@login as varchar(max)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************

	SELECT [idUsuario] as codigo,[DNI], [login], Password,(select descIdioma from idioma where IdIdioma= [idioma]) as [idioma] 
    FROM Usuario WHERE Estado=1 and idUsuario = @id
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 30/06/2016
-- Description:	Modificar un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_Update]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max)
AS
BEGIN TRY
DECLARE @id as int
DECLARE @idIdioma as int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMIAL int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login
--DNI
SELECT @modificaDNI = len(@dni)
--PASS
SELECT @modificaPASS = len(@pass)
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
--EMAIL
SELECT @modificaEMIAL = len(@email)
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
--DNI
IF (@modificaDNI >0)
BEGIN
	UPDATE [dbo].[Usuario]
    SET DNI = @dni
    WHERE idUsuario = @id
END
--PASS
IF (@modificaPASS >0)
BEGIN
	UPDATE [dbo].[Usuario]
    SET [Password] = @pass 
    WHERE idUsuario = @id
END
--IDIOMA
IF (@modificaIDIOMA >0)
BEGIN
	SELECT @idIdioma=IdIdioma FROM Idioma WHERE descIdioma=@idioma
	UPDATE [dbo].[Usuario]
    SET idioma=@idIdioma
    WHERE idUsuario = @id
END
--NOMBRE
IF (@modificaNOMBRE >0)
BEGIN
	UPDATE [dbo].[Usuario]
    SET Nombre=@nombre
    WHERE idUsuario = @id
END
--APELLIDO
IF (@modificaAPELLIDO >0)
BEGIN
	UPDATE [dbo].[Usuario]
    SET Apellido=@apellido
    WHERE idUsuario = @id
END
--EMAIL
IF (@modificaEMIAL >0)
BEGIN
	UPDATE [dbo].[Usuario]
    SET email=@email
    WHERE idUsuario = @id
END

END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_UpdateDV]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_UpdateDV]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Modificar DV en Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_UpdateDV] 
@str as nvarchar(max), @id as int
	AS
BEGIN TRY
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE idUsuario=@id)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
	UPDATE Usuario
	SET DVH = @str
	WHERE idUsuario = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_UpdatePass]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_UpdatePass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 23/10/2015
-- Update date: 26/04/2016
-- Description:	Modificar un Usuario
-- ==============================================================
CREATE PROCEDURE [dbo].[Usuario_UpdatePass]
@p1 varchar(max), @p2 varchar(max)
AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @p1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @p1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- UPDATE
--***************************************************************************
	-- implementar mas parametros
	UPDATE [dbo].[Usuario]
    SET [Password] = @p2 
    WHERE idUsuario = @id
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Delete]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/07/2016
-- Update date: 26/07/2016
-- Description:	Mostrar un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Vendedor_Delete] 
@login as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE login = @login AND EsVendedor = 1)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE login  = @login AND EsVendedor = 1
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- BAJA LOGICA
--***************************************************************************
	UPDATE Usuario
	SET Estado=0
	WHERE idUsuario = @id
	AND EsVendedor = 1
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Insert]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/07/2016
-- Update date: 20/07/2016
-- Description:	Alta de Vendedor
-- ==============================================================
CREATE PROCEDURE [dbo].[Vendedor_Insert]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int
DECLARE @repetido int
DECLARE @idIdioma int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMAIL int
DECLARE @elidioma as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT max(idUsuario)+1 FROM [dbo].[Usuario])
BEGIN
	-- es el primer usuario
	SET @id = 1
END
ELSE -- le asigno el proximo id
BEGIN
	SELECT @id = max(idUsuario)+1 FROM [dbo].[Usuario]
END
SELECT @idIdioma=ISNULL(IdIdioma,1) FROM Idioma WHERE descIdioma=@idioma
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=0
SELECT @repetido = COUNT(*) FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login AND Estado=1
--DNI
SELECT @modificaDNI = len(@dni)
--PASS
SELECT @modificaPASS = len(@pass)
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
--email
SELECT @modificaEMAIL = len(@email)
--el idioma
IF (@idioma <1)
BEGIN
	SET @elidioma = 1
END
ELSE
BEGIN
	SET @elidioma = @idioma
END
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- ALTA
--***************************************************************************
IF (@existe = 0 AND @repetido=0) --no existe
	BEGIN
	INSERT INTO [dbo].[Usuario] ([idUsuario],[DNI],[login],[Password],[idioma],[Nombre],[Apellido],[email],[EsCliente],[EsVendedor],[Estado],[DVH])
    SELECT @id, isnull(@dni, 0), @login, @pass, isnull(@elidioma,1), isnull(@nombre,''Nombre''), isnull(@apellido,''Apellido''),isnull(@email,''email''), 0,1, 1, ''0''
	END
IF (@existe = 1 AND @repetido=0) --esta deshabilitado
BEGIN
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE DNI = @dni AND login = @login
	--LO HABILITO
	UPDATE [dbo].[Usuario]
	SET Estado=1
	WHERE idUsuario = @id
	--DNI
	IF (@modificaDNI >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET DNI = @dni
		WHERE idUsuario = @id
	END
	--PASS
	IF (@modificaPASS >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
	END
	--IDIOMA
	IF (@modificaIDIOMA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET idioma=@elidioma
		WHERE idUsuario = @id
	END
	--NOMBRE
	IF (@modificaNOMBRE >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Nombre=@nombre
		WHERE idUsuario = @id
	END
	--APELLIDO
	IF (@modificaAPELLIDO >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Apellido=@apellido
		WHERE idUsuario = @id
	END
	--email
	IF (@modificaEMAIL >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET email=@email
		WHERE idUsuario = @id
	END
	
	--SACO TODOS LOS PERFILES VIEJOS QUE TENIA
	DELETE FROM [dbo].[Usuario_FamiliaPermiso] WHERE idUsuario = @id
END
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE login = @login
--ES VENDEDOR
UPDATE [dbo].[Usuario] SET EsVendedor = 1 WHERE idUsuario = @id
-- PERFIL DEFAULT
INSERT INTO [dbo].[Usuario_FamiliaPermiso]([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id, 99,501,1)
-- PERFIL EsVendedor
INSERT INTO [dbo].[Usuario_FamiliaPermiso]([idUsuario],[CodigoPadre],[CodigoPermiso],[Estado]) VALUES (@id, 99,510,1)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Select]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/07/2016
-- Update date: 26/07/2016
-- Description:	Mostrar un Cliente
-- ==============================================================
CREATE PROCEDURE [dbo].[Vendedor_Select] 
@DNI as varchar(50)
	AS
BEGIN TRY
DECLARE @id as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (select idUsuario from Usuario WHERE DNI = @DNI)
BEGIN
	print ''Usuario Inexistente.''
	RETURN
END
ELSE
SELECT @id = idUsuario from Usuario WHERE DNI = @DNI
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and EsVendedor = 1
	and u.idUsuario = @id
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/07/2016
-- Update date: 26/07/2016
-- Description:	listar los Vendedores
-- ==============================================================
CREATE PROCEDURE [dbo].[Vendedor_SelectAll] 
AS
BEGIN TRY
--***************************************************************************
-- SELECT
--***************************************************************************
	SELECT u.[idUsuario] as codigo,u.[DNI], u.[login], Nombre,Apellido,email, ''*******'' as password,i.[descIdioma] as idioma
    FROM Usuario u
		INNER JOIN Idioma i ON u.idioma = i.IdIdioma
	WHERE u.Estado=1 
	and EsVendedor = 1
    order by login asc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Update]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 02/07/2016
-- Description:	Modificación del Vendedor
-- ==============================================================
CREATE PROCEDURE [dbo].[Vendedor_Update]
@login varchar(max), @dni varchar(max), @pass varchar(max),@idioma varchar(max), @nombre varchar(max), @apellido varchar(max), @email varchar(max)
AS
BEGIN TRY
DECLARE @id int
DECLARE @existe int

DECLARE @idIdioma int
DECLARE @modificaDNI int
DECLARE @modificaPASS int
DECLARE @modificaIDIOMA int
DECLARE @modificaNOMBRE int
DECLARE @modificaAPELLIDO int
DECLARE @modificaEMAIL int
DECLARE @elidioma as int
--***************************************************************************
-- CONTROLES
--***************************************************************************
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Realizando controles...''  
IF NOT EXISTS (SELECT max(idUsuario)+1 FROM [dbo].[Usuario])
BEGIN
	-- es el primer usuario
	SET @id = 1
END
ELSE -- le asigno el proximo id
BEGIN
	SELECT @id = max(idUsuario)+1 FROM [dbo].[Usuario]
END
SELECT @idIdioma=ISNULL(IdIdioma,1) FROM Idioma WHERE descIdioma=@idioma
SELECT @existe = COUNT(*) FROM [dbo].[Usuario] WHERE login = @login AND Estado=1 and EsVendedor=1
--DNI
SELECT @modificaDNI = len(@dni)
--PASS
SELECT @modificaPASS = len(replace(@pass,''*'',''''))
--IDIOMA
SELECT @modificaIDIOMA = len(@idioma)
--NOMBRE
SELECT @modificaNOMBRE = len(@nombre)
--APELLIDO
SELECT @modificaAPELLIDO = len(@apellido)
--email
SELECT @modificaEMAIL = len(@email)
--el idioma
IF (@idIdioma <1)
BEGIN
	SET @elidioma = 1
END
ELSE
BEGIN
	SET @elidioma = @idIdioma
END
PRINT (CONVERT( VARCHAR(24), GETDATE(), 121)) + '' => Fin de los controles.''  
--***************************************************************************
-- MODIFICACION
--***************************************************************************
IF (@existe = 1)
BEGIN
SELECT @id = idUsuario FROM [dbo].[Usuario] WHERE [login] = @login and EsVendedor=1
	--DNI
	IF (@modificaDNI >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET DNI = @dni
		WHERE idUsuario = @id
	END
	--PASS
	IF (@modificaPASS >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET [Password] = @pass 
		WHERE idUsuario = @id
	END
	--IDIOMA
	IF (@modificaIDIOMA >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET idioma=@elidioma
		WHERE idUsuario = @id
	END
	--NOMBRE
	IF (@modificaNOMBRE >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Nombre=@nombre
		WHERE idUsuario = @id
	END
	--APELLIDO
	IF (@modificaAPELLIDO >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET Apellido=@apellido
		WHERE idUsuario = @id
	END
	--email
	IF (@modificaEMAIL >0)
	BEGIN
		UPDATE [dbo].[Usuario]
		SET email=@email
		WHERE idUsuario = @id
	END
END
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Video_Delete]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Eliminar Video
-- ==============================================================
CREATE procedure [dbo].[Video_Delete]
@CodigoVideo int
AS
BEGIN TRY 
update Video 
set estado= 0
where codigoVideo = @CodigoVideo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Video_GetByCodigo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_GetByCodigo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Listar una Video
-- ==============================================================
CREATE Procedure [dbo].[Video_GetByCodigo]
@codigoVideo int
AS
BEGIN TRY
select titulo,archivo from Video
where @codigoVideo = codigoVideo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Video_Insert]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Insertar Video
-- ==============================================================
CREATE procedure [dbo].[Video_Insert]
@titulo varchar(MAX),
@Archivo varchar(100)
AS
BEGIN TRY
insert into Video (titulo,Archivo,estado) 
values (@Titulo,@Archivo,1)
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Video_SelectAll]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Listar Videos
-- ==============================================================
CREATE PROCEDURE [dbo].[Video_SelectAll]
AS

BEGIN TRY
SELECT CodigoVideo,Titulo,Archivo FROM Video
	where estado = 1 Order by CodigoVideo desc
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Video_Update]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 25/07/2016
-- Description:	Actualizar Video
-- ==============================================================
CREATE procedure [dbo].[Video_Update]
@CodigoVideo int,
@titulo varchar(MAX),
@Archivo varchar(100)
AS
BEGIN TRY
Update Video 
Set titulo    = @Titulo ,
    Archivo= @Archivo

where
codigoVideo = @CodigoVideo
END TRY
BEGIN CATCH
SELECT   ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Producto_CantVendida]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_CantVendida]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

-- ==============================================================
-- Author:		Soledad Coudures
-- Create date: 01/06/2016
-- Update date: 12/06/2016
-- Description:	Listar Producto
-- ==============================================================

CREATE FUNCTION [dbo].[Producto_CantVendida] 
(
	@inventario as integer, @talle as integer
)
RETURNS integer
AS
BEGIN
	DECLARE @cantVendida as integer

	SELECT @cantVendida=isnull(sum(fd.cantidad),0) FROM Formulario_DET fd
	WHERE fd.Tipo in (3,4)
	and fd.Inventario =@inventario and fd.Talle=@talle

	RETURN @cantVendida
END

' 
END

GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CodigoPostal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CodigoPostal](
	[Nro] [int] NOT NULL,
	[CPA] [varchar](8) NULL,
 CONSTRAINT [PK_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[Nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Color]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Color](
	[CodColor] [int] NOT NULL,
	[Color] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Color_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[CodColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Competencia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Competencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Competencia](
	[idCompetencia] [int] NOT NULL,
	[idTorneo] [int] NOT NULL,
	[Competencia] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Competencia_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Competencia] PRIMARY KEY CLUSTERED 
(
	[idCompetencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consulta](
	[idConsulta] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](max) NOT NULL CONSTRAINT [DF_Consulta_email]  DEFAULT ('email@gmail.com'),
	[Nivel] [int] NOT NULL CONSTRAINT [DF_Consulta_Nivel]  DEFAULT ((1)),
	[Texto] [varchar](max) NOT NULL CONSTRAINT [DF_Consulta_Texto]  DEFAULT (''),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Consulta_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[idConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DICCIONARIO_DATOS]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DICCIONARIO_DATOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DICCIONARIO_DATOS](
	[Table] [sysname] NOT NULL,
	[Attribute] [nvarchar](128) NULL,
	[DataType] [sysname] NOT NULL,
	[Allow Nulls?] [int] NULL,
	[PKey?] [int] NOT NULL,
	[FKey?] [int] NOT NULL,
	[Ref Table] [nvarchar](128) NULL,
	[Description] [sql_variant] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DigitosV]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitosV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DigitosV](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[digitoV] [nvarchar](max) NOT NULL CONSTRAINT [DF_DigitosV_digitoV]  DEFAULT ('0'),
	[NombreTabla] [varchar](max) NOT NULL CONSTRAINT [DF_DigitosV_NombreTabla]  DEFAULT ('')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domicilio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Domicilio](
	[idDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [int] NOT NULL,
	[DomicilioTipo] [int] NOT NULL,
	[Domicilio] [varchar](50) NOT NULL,
	[Calle] [varchar](1000) NOT NULL,
	[Nro] [int] NOT NULL,
	[Piso] [varchar](100) NOT NULL CONSTRAINT [DF_Domicilio_Piso]  DEFAULT ((0)),
	[Depto] [varchar](50) NOT NULL CONSTRAINT [DF_Domicilio_Depto]  DEFAULT (' '),
	[Localidad] [int] NOT NULL,
	[Provincia] [int] NOT NULL,
	[CodigoPostal] [int] NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Domicilio_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_ClienteDomicilio] PRIMARY KEY CLUSTERED 
(
	[idDomicilio] ASC,
	[Cliente] ASC,
	[DomicilioTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DomicilioTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DomicilioTipo](
	[CodDomicilioTipo] [int] NOT NULL,
	[DomicilioTipo] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_DomicilioTipo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_DomicilioTipo] PRIMARY KEY CLUSTERED 
(
	[CodDomicilioTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empresa](
	[CUIT] [bigint] NOT NULL,
	[NombreFantasia] [varchar](1000) NULL,
	[RazonSocial] [varchar](1000) NOT NULL,
	[ResponsableInscripto] [bit] NOT NULL CONSTRAINT [DF_Empresa_ResponsableInscripto]  DEFAULT ((1)),
	[NroIngresosBrutos] [int] NOT NULL,
	[InicioActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Envio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Envio](
	[NumeroEnvio] [int] IDENTITY(1,1) NOT NULL,
	[FormularioTipo] [int] NOT NULL,
	[FormularioSucursal] [int] NOT NULL,
	[FormularioNumero] [int] NOT NULL,
	[FormaEnvio] [int] NOT NULL,
	[FecEntrega] [datetime] NULL,
	[Dias] [int] NOT NULL,
	[Costo] [money] NOT NULL,
	[Observaciones] [varchar](1000) NULL,
	[Domicilio] [int] NOT NULL CONSTRAINT [DF_Envio_Domicilio]  DEFAULT ((1)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_FormaEnvio_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Envio_1] PRIMARY KEY CLUSTERED 
(
	[NumeroEnvio] ASC,
	[FormularioTipo] ASC,
	[FormularioSucursal] ASC,
	[FormularioNumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnvioTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnvioTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EnvioTipo](
	[CodEnvioTipo] [int] NOT NULL,
	[FormaEnvio] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_EnvioTipo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_EnvioTipo] PRIMARY KEY CLUSTERED 
(
	[CodEnvioTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formulario_CAB]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Formulario_CAB](
	[Tipo] [int] NOT NULL CONSTRAINT [DF_FormularioCAB_Tipo]  DEFAULT ((2)),
	[Sucursal] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[FecEmision] [datetime] NOT NULL,
	[FecVto] [datetime] NOT NULL,
	[Cliente] [int] NOT NULL,
	[DomicilioTipo] [int] NOT NULL,
	[Empresa] [bigint] NOT NULL,
	[EstadoFormulario] [int] NOT NULL,
	[EmitidoPor] [int] NOT NULL,
	[Pedido] [int] NULL CONSTRAINT [DF_Formulario_CAB_Pedido]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Formulario_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC,
	[Sucursal] ASC,
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Formulario_DET]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Formulario_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Formulario_DET](
	[Tipo] [int] NOT NULL,
	[Sucursal] [int] NOT NULL,
	[NroFormulario] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[Inventario] [int] NOT NULL,
	[Talle] [int] NULL,
	[cantidad] [int] NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_FormularioDET_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_FormularioDET] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC,
	[Sucursal] ASC,
	[NroFormulario] ASC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormularioEstado]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormularioEstado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormularioEstado](
	[CodEstado] [int] NOT NULL,
	[FormularioEstado] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_FormularioEstado_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_FormularioEstado] PRIMARY KEY CLUSTERED 
(
	[CodEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormularioTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormularioTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormularioTipo](
	[Tipo] [int] NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Letra] [varchar](2) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_FormularioTipo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_FormularioTipo] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Idioma](
	[IdIdioma] [int] IDENTITY(1,1) NOT NULL,
	[descIdioma] [varchar](50) NOT NULL CONSTRAINT [DF_Idioma_descIdioma]  DEFAULT (''),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Idioma_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idIdioma] PRIMARY KEY CLUSTERED 
(
	[IdIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INTERMEDIA]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INTERMEDIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[INTERMEDIA](
	[CodigoPadre] [int] NOT NULL,
	[PermisoPadre] [varchar](1000) NULL,
	[CodigoPermiso] [int] NOT NULL,
	[PermisoHijo] [varchar](1000) NULL,
	[seleccionado] [bit] NULL,
	[Estado] [bit] NOT NULL,
	[Simple] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INTERMEDIA2]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INTERMEDIA2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[INTERMEDIA2](
	[CodigoPadre] [int] NOT NULL,
	[PermisoPadre] [varchar](1000) NULL,
	[CodigoPermiso] [int] NOT NULL,
	[PermisoHijo] [varchar](1000) NULL,
	[seleccionado] [bit] NULL,
	[Estado] [bit] NOT NULL,
	[Simple] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Leyenda]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Leyenda]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Leyenda](
	[IdLeyenda] [int] IDENTITY(1,1) NOT NULL,
	[Tag] [varchar](100) NOT NULL,
	[TextoDefault] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Leyenda_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Leyenda] PRIMARY KEY CLUSTERED 
(
	[IdLeyenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Linea](
	[CodLinea] [int] NOT NULL,
	[LineaProducto] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Linea_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[CodLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Localidad](
	[CodLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[Localidad] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Localidad_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[CodLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Marca](
	[CodMarca] [int] NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Marca_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[CodMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedioContacto]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioContacto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedioContacto](
	[IdUsuario] [int] NOT NULL,
	[MedioContactoTipo] [int] NOT NULL,
	[Valor] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_MedioContacto] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[MedioContactoTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedioContactoTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioContactoTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedioContactoTipo](
	[CodMedioContactoTipo] [int] NOT NULL,
	[MedioContacto] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_MedioContactoTipo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_MedioContactoTipo] PRIMARY KEY CLUSTERED 
(
	[CodMedioContactoTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedioPago]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioPago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedioPago](
	[idMedioPago] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[MedioPagoTipo] [int] NOT NULL,
	[Numero] [varchar](max) NULL,
	[Vencimiento] [varchar](6) NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_MPago_Estado]  DEFAULT ((1)),
	[DVH] [varchar](max) NOT NULL CONSTRAINT [DF_MedioPago_DVH]  DEFAULT ('0'),
 CONSTRAINT [PK_MedioPago] PRIMARY KEY CLUSTERED 
(
	[idMedioPago] ASC,
	[idUsuario] ASC,
	[MedioPagoTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedioPagoTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedioPagoTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedioPagoTipo](
	[CodMedioPagoTipo] [int] NOT NULL,
	[MedioPago] [varchar](100) NULL,
	[PorcentajeRecargo] [decimal](18, 0) NOT NULL CONSTRAINT [DF_MedioPagoTipo_Recargo]  DEFAULT ((0)),
	[PorcentajeDescuento] [decimal](18, 0) NOT NULL CONSTRAINT [DF_MedioPagoTipo_Descuento]  DEFAULT ((0)),
	[CantMaxCuotas] [int] NOT NULL CONSTRAINT [DF_MedioPagoTipo_CantMaxCuotas]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_MedioPago_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idMedioPago] PRIMARY KEY CLUSTERED 
(
	[CodMedioPagoTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nivel]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nivel](
	[Importancia] [int] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Nivel_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Nivel] PRIMARY KEY CLUSTERED 
(
	[Importancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Noticia](
	[CodigoNoticia] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](max) NULL,
	[Subtitulo] [varchar](max) NULL,
	[Texto] [varchar](max) NULL,
	[RutaImagen] [varchar](100) NULL,
	[estado] [bit] NOT NULL CONSTRAINT [DF_Noticia_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[CodigoNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[medioPagoTipo] [int] NOT NULL,
	[FormularioTipo] [int] NOT NULL,
	[FormularioSucursal] [int] NOT NULL,
	[FormularioNumero] [int] NOT NULL,
	[cantidadCuotas] [int] NOT NULL CONSTRAINT [DF_Pago_cantidadCuotas]  DEFAULT ((1)),
	[Recargo] [int] NOT NULL CONSTRAINT [DF_Pago_Recargo]  DEFAULT ((10)),
	[total] [money] NOT NULL CONSTRAINT [DF_Pago_total]  DEFAULT ((100)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Pago_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Participante]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participante]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Participante](
	[idParticipante] [int] NOT NULL,
	[Participante] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Persona_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idParticipante] PRIMARY KEY CLUSTERED 
(
	[idParticipante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoTemporal]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoTemporal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PedidoTemporal](
	[RegistroID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoTemporalID] [nvarchar](50) NULL,
	[Cantidad] [int] NOT NULL CONSTRAINT [DF_PedidoTemporal_Cantidad]  DEFAULT ((1)),
	[ProductoID] [int] NOT NULL,
	[Talle] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL CONSTRAINT [DF_PedidoTemporal_FechaCreacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_PedidoTemporal] PRIMARY KEY NONCLUSTERED 
(
	[RegistroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permiso](
	[CodigoPermiso] [int] IDENTITY(1,1) NOT NULL,
	[Permiso] [varchar](1000) NOT NULL,
	[Simple] [bit] NOT NULL CONSTRAINT [DF_Permiso_Simple]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Permiso_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[CodigoPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermisoFamilia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PermisoFamilia](
	[CodigoPadre] [int] NOT NULL,
	[CodigoPermiso] [int] NOT NULL,
	[Seleccionado] [bit] NULL CONSTRAINT [DF_PermisoFamilia_Seleccionado]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_PermisoFamilia_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_PermisoFamilia] PRIMARY KEY CLUSTERED 
(
	[CodigoPadre] ASC,
	[CodigoPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[Inventario] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[Color] [int] NULL,
	[CantMaxPorPedido] [int] NOT NULL CONSTRAINT [DF_Producto_CantMaxPorPedido]  DEFAULT ((1)),
	[ArchivoImagen] [varchar](max) NOT NULL CONSTRAINT [DF_Producto_ArchivoImagen]  DEFAULT ('~/Negocio/ImagenesProductos/ProductoSinImagen.jpg'),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Producto_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto_Nivel]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto_Nivel](
	[Inventario] [int] NOT NULL,
	[Importancia] [int] NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Producto_Nivel_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Producto_Nivel] PRIMARY KEY CLUSTERED 
(
	[Inventario] ASC,
	[Importancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto_Precio]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Precio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto_Precio](
	[Inventario] [int] NOT NULL,
	[FechaDesde] [datetime] NOT NULL,
	[FechaHasta] [datetime] NULL,
	[costo] [money] NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[precioDocena] [money] NOT NULL,
	[MaxPorcentajeDto] [int] NOT NULL,
	[EsOferta] [bit] NOT NULL CONSTRAINT [DF_ProductoPrecio_EsOferta]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_ProductoPrecio_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_ProductoPrecio] PRIMARY KEY CLUSTERED 
(
	[Inventario] ASC,
	[FechaDesde] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto_Stock]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto_Stock](
	[Inventario] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[Talle] [int] NOT NULL,
	[Stock] [int] NOT NULL CONSTRAINT [DF_Producto_Stock_Stock]  DEFAULT ((0)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Producto_Stock_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Producto_Stock] PRIMARY KEY CLUSTERED 
(
	[Inventario] ASC,
	[Linea] ASC,
	[Talle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Provincia](
	[CodProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Provincia] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Provincia_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[CodProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puntaje]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puntaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Puntaje](
	[idPuntaje] [int] IDENTITY(1,1) NOT NULL,
	[idCompetencia] [int] NOT NULL CONSTRAINT [DF_Puntaje_idCompetencia]  DEFAULT ((0)),
	[Competencia] [varchar](max) NULL,
	[idParticipante] [int] NOT NULL CONSTRAINT [DF_Puntaje_idParticipante]  DEFAULT ((0)),
	[Patinador] [varchar](max) NULL,
	[J1valorA] [varchar](5) NOT NULL,
	[J1valorB] [varchar](5) NOT NULL,
	[J2valorA] [varchar](5) NOT NULL,
	[J2valorB] [varchar](5) NOT NULL,
	[J3valorA] [varchar](5) NOT NULL,
	[J3valorB] [varchar](5) NOT NULL,
	[J4valorA] [varchar](5) NULL CONSTRAINT [DF_Puntaje_J4valorA]  DEFAULT ('00.00'),
	[J4valorB] [varchar](5) NULL CONSTRAINT [DF_Puntaje_J4valorB]  DEFAULT ('00.00'),
	[J5valorA] [varchar](5) NULL CONSTRAINT [DF_Puntaje_J5valorA]  DEFAULT ('00.00'),
	[J5valorB] [varchar](5) NULL CONSTRAINT [DF_Puntaje_J5valorB]  DEFAULT ('00.00'),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Puntaje_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Puntaje] PRIMARY KEY CLUSTERED 
(
	[idPuntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recomendacion]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recomendacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Recomendacion](
	[idRecomendacion] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](max) NULL CONSTRAINT [DF_Recomendacion_email]  DEFAULT ('email@gmail.com'),
	[Nivel] [int] NOT NULL CONSTRAINT [DF_Recomendacion_Nivel]  DEFAULT ((1)),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Recomendacion_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Recomendacion] PRIMARY KEY CLUSTERED 
(
	[idRecomendacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suceso]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suceso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_suceso_tipo] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL,
	[DVH] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Fecha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suceso_hist]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suceso_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suceso_hist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_suceso_tipo] [int] NOT NULL CONSTRAINT [DF_Suceso_hist_id_suceso_tipo]  DEFAULT ((0)),
	[usuario] [int] NOT NULL CONSTRAINT [DF_Suceso_hist_usuario]  DEFAULT ((15)),
	[descripcion] [varchar](max) NOT NULL CONSTRAINT [DF_Suceso_hist_descripcion]  DEFAULT ('Sin Descripcion'),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Suceso_hist_Estado]  DEFAULT ((1)),
	[DVH] [nvarchar](max) NOT NULL CONSTRAINT [DF_Suceso_hist_DVH]  DEFAULT ((0)),
 CONSTRAINT [PK_Fecha_hist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SucesoTipo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SucesoTipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SucesoTipo](
	[id_suceso_tipo] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL CONSTRAINT [DF_SucesoTipo_Descripcion]  DEFAULT (''),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_SucesoTipo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idSucesoTipo] PRIMARY KEY CLUSTERED 
(
	[id_suceso_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[CodSucursal] [int] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Sucursal_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[CodSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Talle]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Talle](
	[Linea] [int] NOT NULL,
	[CodTalle] [int] NOT NULL,
	[Talle] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Talle_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Talle] PRIMARY KEY CLUSTERED 
(
	[Linea] ASC,
	[CodTalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Torneo]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Torneo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Torneo](
	[idTorneo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Torneo] [varchar](max) NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Torneo_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idTorneo] PRIMARY KEY CLUSTERED 
(
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Traduccion]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traduccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Traduccion](
	[IdIdioma] [int] NOT NULL,
	[IdLeyenda] [int] NOT NULL,
	[Texto] [varchar](max) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Traduccion_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_idIdioma_Tag] PRIMARY KEY CLUSTERED 
(
	[IdIdioma] ASC,
	[IdLeyenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] NOT NULL,
	[DNI] [varchar](50) NOT NULL CONSTRAINT [DF_Usuario_DNI]  DEFAULT ('0'),
	[login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL CONSTRAINT [DF_Usuario_Password]  DEFAULT ('123'),
	[idioma] [int] NOT NULL CONSTRAINT [DF_Usuario_idioma]  DEFAULT ((1)),
	[Nombre] [varchar](50) NOT NULL CONSTRAINT [DF_Usuario_Nombre]  DEFAULT ('Nombre'),
	[Apellido] [varchar](50) NOT NULL CONSTRAINT [DF_Usuario_Apellido]  DEFAULT ('Apellido'),
	[email] [varchar](max) NOT NULL CONSTRAINT [DF_Usuario_email]  DEFAULT ('email'),
	[FechaNac] [datetime] NOT NULL CONSTRAINT [DF_Usuario_FechaNac]  DEFAULT (getdate()),
	[EsCliente] [bit] NOT NULL CONSTRAINT [DF_Usuario_EsCliente]  DEFAULT ((1)),
	[EsVendedor] [bit] NOT NULL CONSTRAINT [DF_Usuario_EsVendedor]  DEFAULT ((0)),
	[EsSupervisor] [bit] NOT NULL CONSTRAINT [DF_Usuario_EsSupervisor]  DEFAULT ((0)),
	[PorcentajeComi] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Usuario_PorcentajeComi]  DEFAULT ((0)),
	[Pregunta] [varchar](max) NOT NULL CONSTRAINT [DF_Usuario_Pregunta]  DEFAULT ('SIN PREGUNTA'),
	[Respuesta] [varchar](max) NOT NULL CONSTRAINT [DF_Usuario_Respuesta]  DEFAULT ('SIN RESPUESTA'),
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Usuario_Estado]  DEFAULT ((1)),
	[DVH] [nvarchar](max) NOT NULL CONSTRAINT [DF_Usuario_DVH]  DEFAULT ((0)),
 CONSTRAINT [PK_idUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Usuario] UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario_FamiliaPermiso]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario_FamiliaPermiso](
	[idUsuario] [int] NOT NULL,
	[CodigoPadre] [int] NOT NULL,
	[CodigoPermiso] [int] NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Usuario_FamiliaPermiso_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Usuario_FamiliaPermiso] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[CodigoPadre] ASC,
	[CodigoPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Video]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Video](
	[CodigoVideo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](max) NULL,
	[Archivo] [varchar](100) NULL,
	[estado] [bit] NOT NULL CONSTRAINT [DF_Video_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[CodigoVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zz_prueba]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zz_prueba]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[zz_prueba](
	[zxzx] [nchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Cliente]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Cliente] AS
SELECT *
FROM [dbo].[Usuario] cli
WHERE cli.EsCliente=1
--no pregunto el estado porque en las facturas viejas necesito el nombre aunque este deshabilitado
' 
GO
/****** Object:  View [dbo].[vw_ClienteDomicilio]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ClienteDomicilio]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_ClienteDomicilio] AS
SELECT dom.[Cliente]
      ,dom.[DomicilioTipo] as CodDomicilioTipo
	  ,domtipo.DomicilioTipo
      ,dom.[Domicilio]
      ,dom.[Calle]
      ,dom.[Nro]
      ,dom.[Piso]
      ,dom.[Depto]
      ,dom.[Localidad] as CodLocalidad
	  ,loc.Localidad
      ,dom.[Provincia] as CodProvincia
	  ,prov.Provincia
      ,cp.CPA as CodigoPostal
      ,dom.[Estado]
FROM [dbo].[Domicilio] dom
INNER JOIN [dbo].[DomicilioTipo] domtipo ON dom.DomicilioTipo = domtipo.CodDomicilioTipo
INNER JOIN [dbo].[Localidad] loc ON dom.localidad = loc.CodLocalidad
INNER JOIN [dbo].[Provincia] prov ON dom.Provincia = prov.CodProvincia
INNER JOIN [dbo].[CodigoPostal] cp ON dom.CodigoPostal=cp.Nro
--order by dom.Cliente, dom.DomicilioTipo

' 
GO
/****** Object:  View [dbo].[vw_Vendedor]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Vendedor]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Vendedor] AS
SELECT *
FROM [dbo].[Usuario] vend
WHERE vend.EsVendedor=1
--no pregunto el estado porque en las facturas viejas necesito el nombre aunque este deshabilitado
' 
GO
/****** Object:  View [dbo].[vw_FormularioCabecera]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_FormularioCabecera]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_FormularioCabecera] AS
SELECT fc.[Tipo]
	  ,ft.Descripcion as FormularioTipo
	  ,ft.Letra
      ,fc.[Sucursal]
      ,fc.[Numero]
      ,fc.[FecEmision]
      ,fc.[FecVto]
      ,fc.[Cliente]
	  ,cli.DNI
	  ,cli.Apellido
	  ,cli.Nombre
      ,fc.[DomicilioTipo] as CodDomicilioTipo
	  ,dom.DomicilioTipo
	  ,dom.domicilio
	  ,dom.calle
	  ,dom.nro
	  ,dom.piso
	  ,dom.depto
	  ,dom.Localidad
	  ,dom.Provincia
	  ,dom.CodigoPostal
      ,fc.[Empresa]
	  ,emp.CUIT
	  ,emp.NombreFantasia
	  ,emp.RazonSocial
	  ,emp.InicioActividad
	  ,emp.NroIngresosBrutos
	  ,emp.ResponsableInscripto
      ,fc.[EstadoFormulario] as CodEstadoFormulario
	  ,fe.FormularioEstado as EstadoFormulario
      ,fc.[EmitidoPor]
	  ,vend.login as vendedor
      ,fc.[Estado]
	  ,suc.Descripcion as SucursalVenta
FROM [dbo].[Formulario_CAB] fc
INNER JOIN [dbo].[FormularioTipo] ft ON fc.Tipo = ft.Tipo
INNER JOIN [dbo].[FormularioEstado] fe ON fc.EstadoFormulario = fe.CodEstado
INNER JOIN [dbo].[vw_Cliente] cli ON fc.Cliente=cli.idUsuario
LEFT JOIN [dbo].[vw_ClienteDomicilio] dom ON cli.idUsuario=dom.cliente AND fc.DomicilioTipo=dom.CodDomicilioTipo
INNER JOIN [dbo].[Empresa] emp ON fc.Empresa=emp.CUIT
INNER JOIN [dbo].[vw_Vendedor] vend ON fc.EmitidoPor=vend.idUsuario
INNER JOIN [dbo].[Sucursal] suc ON fc.Sucursal=CodSucursal
--ORDER BY fc.Numero
--no pregunto el estado del producto porque en las facturas viejas necesito el nombre aunque este deshabilitado


' 
GO
/****** Object:  View [dbo].[vw_Producto]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Producto]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_Producto] AS 
SELECT prod.[Inventario]
      ,lin.CodLinea
	  ,lin.LineaProducto
      ,mar.CodMarca
	  ,mar.Marca
      ,col.CodColor
	  ,col.Color
      ,tal.CodTalle
	  ,tal.Talle
      ,stock.[Stock]
      ,prod.[CantMaxPorPedido]
      ,prod.[ArchivoImagen]
	  ,prod.Estado
	  ,prec.costo
	  ,prec.precioUnitario
	  ,prec.precioDocena
	  ,prec.MaxPorcentajeDto
	  ,prec.EsOferta
	  ,prec.FechaDesde
	  ,isnull(dbo.Producto_CantVendida(prod.Inventario,tal.CodTalle),0) as cantidadVendida
FROM [dbo].[Producto] prod
INNER JOIN [dbo].[Linea] lin ON prod.Linea=lin.CodLinea
INNER JOIN [dbo].[Marca] mar ON prod.Marca= mar.CodMarca
INNER JOIN [dbo].[Color] col ON prod.Color = col.CodColor
INNER JOIN [dbo].[Producto_Precio] prec ON prod.Inventario= prec.Inventario
INNER JOIN [dbo].[Producto_Stock] stock ON prod.Inventario=stock.inventario
INNER JOIN [dbo].[Talle] tal ON stock.Linea=tal.Linea AND stock.Talle = tal.CodTalle 
WHERE prec.Estado =1
AND prec.FechaHasta is null
--no pregunto el estado del producto porque en las facturas viejas necesito el nombre aunque este deshabilitado









' 
GO
/****** Object:  View [dbo].[vw_FormularioDetalle]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_FormularioDetalle]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_FormularioDetalle] AS
SELECT fd.[Tipo]
      ,fd.[Sucursal]
      ,fd.[NroFormulario]
      ,fd.[Item]
      ,fd.[Inventario]
      ,fd.[cantidad]
	  ,prod.[LineaProducto]
      ,prod.[Marca]
      ,prod.[Color]
      ,prod.[Talle]
      ,prod.[Stock]
      ,prod.[CantMaxPorPedido]
      ,prod.[ArchivoImagen]
      ,prod.[costo]
      ,prod.[precioUnitario]
      ,prod.[precioDocena]
      ,prod.[MaxPorcentajeDto]
      ,prod.[EsOferta]
      ,prod.[FechaDesde]
      ,fd.[Estado]
FROM [dbo].[Formulario_DET] fd
INNER JOIN  [dbo].[vw_Producto] prod ON fd.Inventario= prod.Inventario AND fd.[Talle]=prod.CodTalle
--ORDER BY fd.Tipo,fd.Sucursal,fd.NroFormulario,fd.Item
--no pregunto el estado del producto porque en las facturas viejas necesito el nombre aunque este deshabilitado


' 
GO
/****** Object:  View [dbo].[vw_PermisoFamilia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_PermisoFamilia]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_PermisoFamilia] AS
SELECT pf.[CodigoPadre]
	  , (SELECT pe.Permiso FROM Permiso pe WHERE pe.CodigoPermiso = pf.[CodigoPadre]) as PermisoPadre 
      ,pf.[CodigoPermiso]
	  , (SELECT pe2.Permiso FROM Permiso pe2 WHERE pe2.CodigoPermiso = pf.[CodigoPermiso]) as PermisoHijo 
	  ,pf.seleccionado
	  ,pf.[Estado]
	  ,perm.Simple as Simple
FROM [dbo].[PermisoFamilia] pf, permiso perm
WHERE pf.codigopermiso NOT IN (SELECT DISTINCT p.CodigoPermiso FROM Permiso p WHERE p.Estado=0)
AND perm.CodigoPermiso=pf.CodigoPermiso
' 
GO
/****** Object:  View [dbo].[vw_Usuario_FamiliaPermiso]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Usuario_FamiliaPermiso]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_Usuario_FamiliaPermiso] AS
SELECT u.idUsuario
,u.login
,pf.codigoPadre
,pf.PermisoPadre
,pf.CodigoPermiso
,pf.PermisoHijo
FROM [dbo].[Usuario_FamiliaPermiso] ufp
  INNER JOIN [dbo].[vw_PermisoFamilia] pf ON ufp.[CodigoPadre] = pf.[CodigoPadre] AND ufp.[CodigoPermiso]=pf.[CodigoPermiso]
  INNER JOIN [dbo].[Usuario] u  ON ufp.[idUsuario] = u.[idUsuario]
WHERE ufp.[Estado] = 1

' 
GO
/****** Object:  View [dbo].[vw_Bitacora]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Bitacora]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_Bitacora] AS
SELECT *
FROM [FSS].[dbo].[Suceso_hist]
UNION
SELECT *
FROM [FSS].[dbo].[Suceso]
' 
GO
/****** Object:  View [dbo].[vw_familia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_familia]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_familia] AS
--SELECT * FROM Permiso p WHERE p.simple = 0
select * from [dbo].[Permiso] where simple=0 and estado=1 --order by permiso
' 
GO
/****** Object:  View [dbo].[vw_leyenda]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_leyenda]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_leyenda] AS
SELECT tr.IdIdioma
	,id.descIdioma as Idioma
	,tr.IdLeyenda
	,ly.Tag as Etiqueta
	,ly.TextoDefault
    ,tr.Texto
FROM [FSS].[dbo].[Traduccion] tr
  INNER JOIN [FSS].[dbo].[Leyenda] ly ON ly.IdLeyenda = tr.IdLeyenda
  INNER JOIN [FSS].[dbo].[Idioma] id ON id.IdIdioma = tr.IdIdioma
WHERE tr.Estado = 1
AND ly.Estado=1
AND id.Estado=1


' 
GO
/****** Object:  View [dbo].[vw_permiso]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_permiso]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_permiso] AS
SELECT * FROM Permiso p WHERE p.simple = 1


' 
GO
/****** Object:  View [dbo].[vw_ProductoNivel]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ProductoNivel]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_ProductoNivel] AS 
SELECT prod.[Inventario]
      ,lin.CodLinea
	  ,lin.LineaProducto
      ,mar.CodMarca
	  ,mar.Marca
      ,col.CodColor
	  ,col.Color
      ,tal.CodTalle
	  ,tal.Talle
      ,stock.[Stock]
      ,prod.[CantMaxPorPedido]
      ,prod.[ArchivoImagen]
	  ,prod.Estado
	  ,prec.costo
	  ,prec.precioUnitario
	  ,prec.precioDocena
	  ,prec.MaxPorcentajeDto
	  ,prec.EsOferta
	  ,prec.FechaDesde	  ,nivel.Descripcion as Nivel
	  ,isnull(dbo.Producto_CantVendida(prod.Inventario,tal.CodTalle),0) as cantidadVendida
FROM [dbo].[Producto] prod
INNER JOIN [dbo].[Linea] lin ON prod.Linea=lin.CodLinea
INNER JOIN [dbo].[Marca] mar ON prod.Marca= mar.CodMarca
INNER JOIN [dbo].[Color] col ON prod.Color = col.CodColor
INNER JOIN [dbo].[Producto_Precio] prec ON prod.Inventario= prec.Inventario
INNER JOIN [dbo].[Producto_Stock] stock ON prod.Inventario=stock.inventario
INNER JOIN [dbo].[Talle] tal ON stock.Linea=tal.Linea AND stock.Talle = tal.CodTalle 
INNER JOIN [dbo].[Producto_Nivel] pnivel ON prod.Inventario=pnivel.Inventario
INNER JOIN [dbo].[Nivel] nivel ON pnivel.Importancia=nivel.Importancia
WHERE prec.Estado =1
AND prec.FechaHasta is null
--no pregunto el estado del producto porque en las facturas viejas necesito el nombre aunque este deshabilitado








' 
GO
/****** Object:  View [dbo].[vw_SeguridadFamilia]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadFamilia]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_SeguridadFamilia] AS
SELECT pf.[CodigoPadre]
	  , (SELECT pe.Permiso FROM Permiso pe WHERE pe.CodigoPermiso = pf.[CodigoPadre]) as Familia
      ,pf.[CodigoPermiso]
	  , (SELECT pe2.Permiso FROM Permiso pe2 WHERE pe2.CodigoPermiso = pf.[CodigoPermiso]) as PermisoHijo
	  ,pf.Estado
FROM [dbo].[PermisoFamilia] pf
WHERE pf.CodigoPadre NOT IN (SELECT DISTINCT pf2.CodigoPermiso FROM [dbo].[PermisoFamilia] pf2 WHERE pf2.Estado=1)
--AND pf.[Estado] = 1
--ORDER BY Familia
' 
GO
/****** Object:  View [dbo].[vw_SeguridadPermisoCompuesto]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadPermisoCompuesto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_SeguridadPermisoCompuesto] AS
SELECT pf.[CodigoPadre]
	  , (SELECT pe.Permiso FROM Permiso pe WHERE pe.CodigoPermiso = pf.[CodigoPadre]) as PermisoPadre 
      ,pf.[CodigoPermiso]
	  , (SELECT pe2.Permiso FROM Permiso pe2 WHERE pe2.CodigoPermiso = pf.[CodigoPermiso]) as PermisoCompuesto
	  ,pf.Estado
FROM [dbo].[PermisoFamilia] pf
WHERE pf.CodigoPermiso IN (SELECT DISTINCT pf2.CodigoPadre FROM [dbo].[PermisoFamilia] pf2 WHERE pf2.Estado=1)
--AND pf.[Estado] = 1
--ORDER BY PermisoCompuesto
' 
GO
/****** Object:  View [dbo].[vw_SeguridadPermisoSimple]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SeguridadPermisoSimple]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_SeguridadPermisoSimple] AS
SELECT pf.[CodigoPadre]
	  , (SELECT pe.Permiso FROM Permiso pe WHERE pe.CodigoPermiso = pf.[CodigoPadre]) as PermisoPadre 
      ,pf.[CodigoPermiso]
	  , (SELECT pe2.Permiso FROM Permiso pe2 WHERE pe2.CodigoPermiso = pf.[CodigoPermiso]) as PermisoSimple 
	  ,pf.Estado
FROM [dbo].[PermisoFamilia] pf
WHERE pf.CodigoPermiso NOT IN (SELECT DISTINCT pf2.CodigoPadre FROM [dbo].[PermisoFamilia] pf2 WHERE pf2.Estado=1)
--AND pf.[Estado] = 1
--ORDER BY PermisoSimple
' 
GO
/****** Object:  View [dbo].[vw_Supervisor]    Script Date: 09/12/2017 6:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Supervisor]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Supervisor] AS
SELECT *
FROM [dbo].[Usuario] sup
WHERE sup.EsSupervisor=1' 
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_MedioContacto_Estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MedioContacto] ADD  CONSTRAINT [DF_MedioContacto_Estado]  DEFAULT ((1)) FOR [Estado]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_id_suceso_tipo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] ADD  CONSTRAINT [DF_Suceso_id_suceso_tipo]  DEFAULT ((0)) FOR [id_suceso_tipo]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_usuario]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] ADD  CONSTRAINT [DF_Suceso_usuario]  DEFAULT ((15)) FOR [usuario]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_descripcion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] ADD  CONSTRAINT [DF_Suceso_descripcion]  DEFAULT ('Sin Descripcion') FOR [descripcion]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_Estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] ADD  CONSTRAINT [DF_Suceso_Estado]  DEFAULT ((1)) FOR [Estado]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Suceso_DVH]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Suceso] ADD  CONSTRAINT [DF_Suceso_DVH]  DEFAULT ((0)) FOR [DVH]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_idTorneo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Competencia]'))
ALTER TABLE [dbo].[Competencia]  WITH CHECK ADD  CONSTRAINT [FK_idTorneo] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneo] ([idTorneo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_idTorneo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Competencia]'))
ALTER TABLE [dbo].[Competencia] CHECK CONSTRAINT [FK_idTorneo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Nivel] FOREIGN KEY([Nivel])
REFERENCES [dbo].[Nivel] ([Importancia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Nivel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDomicilio_Cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ClienteDomicilio_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_CodigoPostal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDomicilio_CodigoPostal] FOREIGN KEY([CodigoPostal])
REFERENCES [dbo].[CodigoPostal] ([Nro])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_CodigoPostal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ClienteDomicilio_CodigoPostal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDomicilio_DomicilioTipo] FOREIGN KEY([DomicilioTipo])
REFERENCES [dbo].[DomicilioTipo] ([CodDomicilioTipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ClienteDomicilio_DomicilioTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDomicilio_Localidad] FOREIGN KEY([Localidad])
REFERENCES [dbo].[Localidad] ([CodLocalidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Localidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ClienteDomicilio_Localidad]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDomicilio_Provincia] FOREIGN KEY([Provincia])
REFERENCES [dbo].[Provincia] ([CodProvincia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClienteDomicilio_Provincia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ClienteDomicilio_Provincia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_EnvioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_Envio_EnvioTipo] FOREIGN KEY([FormaEnvio])
REFERENCES [dbo].[EnvioTipo] ([CodEnvioTipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_EnvioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_Envio_EnvioTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_Envio_FormularioCAB] FOREIGN KEY([FormularioTipo], [FormularioSucursal], [FormularioNumero])
REFERENCES [dbo].[Formulario_CAB] ([Tipo], [Sucursal], [Numero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Envio_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Envio]'))
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_Envio_FormularioCAB]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Formulario_CAB_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_CAB_DomicilioTipo] FOREIGN KEY([DomicilioTipo])
REFERENCES [dbo].[DomicilioTipo] ([CodDomicilioTipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Formulario_CAB_DomicilioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_Formulario_CAB_DomicilioTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_Cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Emisor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_Emisor] FOREIGN KEY([EmitidoPor])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Emisor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_Emisor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Empresa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_Empresa] FOREIGN KEY([Empresa])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Empresa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_Empresa]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioEstado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_FormularioEstado] FOREIGN KEY([EstadoFormulario])
REFERENCES [dbo].[FormularioEstado] ([CodEstado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioEstado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_FormularioEstado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_FormularioTipo] FOREIGN KEY([Tipo])
REFERENCES [dbo].[FormularioTipo] ([Tipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_FormularioTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_FormularioTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCAB_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursal] ([CodSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioCAB_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_CAB]'))
ALTER TABLE [dbo].[Formulario_CAB] CHECK CONSTRAINT [FK_FormularioCAB_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET]  WITH CHECK ADD  CONSTRAINT [FK_FormularioDET_FormularioCAB] FOREIGN KEY([Tipo], [Sucursal], [NroFormulario])
REFERENCES [dbo].[Formulario_CAB] ([Tipo], [Sucursal], [Numero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_FormularioCAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET] CHECK CONSTRAINT [FK_FormularioDET_FormularioCAB]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET]  WITH CHECK ADD  CONSTRAINT [FK_FormularioDET_Producto] FOREIGN KEY([Inventario])
REFERENCES [dbo].[Producto] ([Inventario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormularioDET_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Formulario_DET]'))
ALTER TABLE [dbo].[Formulario_DET] CHECK CONSTRAINT [FK_FormularioDET_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioContacto_MedioContactoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto]  WITH CHECK ADD  CONSTRAINT [FK_MedioContacto_MedioContactoTipo] FOREIGN KEY([MedioContactoTipo])
REFERENCES [dbo].[MedioContactoTipo] ([CodMedioContactoTipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioContacto_MedioContactoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto] CHECK CONSTRAINT [FK_MedioContacto_MedioContactoTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto]  WITH CHECK ADD  CONSTRAINT [FK_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioContacto]'))
ALTER TABLE [dbo].[MedioContacto] CHECK CONSTRAINT [FK_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago]  WITH CHECK ADD  CONSTRAINT [FK_MedioPago_Cliente] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago] CHECK CONSTRAINT [FK_MedioPago_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_MedioPagoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago]  WITH CHECK ADD  CONSTRAINT [FK_MedioPago_MedioPagoTipo] FOREIGN KEY([MedioPagoTipo])
REFERENCES [dbo].[MedioPagoTipo] ([CodMedioPagoTipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedioPago_MedioPagoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedioPago]'))
ALTER TABLE [dbo].[MedioPago] CHECK CONSTRAINT [FK_MedioPago_MedioPagoTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pago_Formulario_CAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pago]'))
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Formulario_CAB] FOREIGN KEY([FormularioTipo], [FormularioSucursal], [FormularioNumero])
REFERENCES [dbo].[Formulario_CAB] ([Tipo], [Sucursal], [Numero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pago_Formulario_CAB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pago]'))
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Formulario_CAB]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PedidoTemporal_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PedidoTemporal]'))
ALTER TABLE [dbo].[PedidoTemporal]  WITH CHECK ADD  CONSTRAINT [FK_PedidoTemporal_Producto] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Producto] ([Inventario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PedidoTemporal_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PedidoTemporal]'))
ALTER TABLE [dbo].[PedidoTemporal] CHECK CONSTRAINT [FK_PedidoTemporal_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PermisoFamilia_Permiso] FOREIGN KEY([CodigoPadre])
REFERENCES [dbo].[Permiso] ([CodigoPermiso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia] CHECK CONSTRAINT [FK_PermisoFamilia_Permiso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PermisoFamilia_Permiso1] FOREIGN KEY([CodigoPermiso])
REFERENCES [dbo].[Permiso] ([CodigoPermiso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoFamilia_Permiso1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoFamilia]'))
ALTER TABLE [dbo].[PermisoFamilia] CHECK CONSTRAINT [FK_PermisoFamilia_Permiso1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Color] FOREIGN KEY([Color])
REFERENCES [dbo].[Color] ([CodColor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Color]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Linea] FOREIGN KEY([Linea])
REFERENCES [dbo].[Linea] ([CodLinea])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Linea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([Marca])
REFERENCES [dbo].[Marca] ([CodMarca])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Nivel_Nivel] FOREIGN KEY([Importancia])
REFERENCES [dbo].[Nivel] ([Importancia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel] CHECK CONSTRAINT [FK_Producto_Nivel_Nivel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Nivel_Producto] FOREIGN KEY([Inventario])
REFERENCES [dbo].[Producto] ([Inventario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Nivel_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Nivel]'))
ALTER TABLE [dbo].[Producto_Nivel] CHECK CONSTRAINT [FK_Producto_Nivel_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoPrecio_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Precio]'))
ALTER TABLE [dbo].[Producto_Precio]  WITH CHECK ADD  CONSTRAINT [FK_ProductoPrecio_Producto] FOREIGN KEY([Inventario])
REFERENCES [dbo].[Producto] ([Inventario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoPrecio_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Precio]'))
ALTER TABLE [dbo].[Producto_Precio] CHECK CONSTRAINT [FK_ProductoPrecio_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Stock_Producto] FOREIGN KEY([Inventario])
REFERENCES [dbo].[Producto] ([Inventario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock] CHECK CONSTRAINT [FK_Producto_Stock_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Talle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Stock_Talle] FOREIGN KEY([Linea], [Talle])
REFERENCES [dbo].[Talle] ([Linea], [CodTalle])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Stock_Talle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto_Stock]'))
ALTER TABLE [dbo].[Producto_Stock] CHECK CONSTRAINT [FK_Producto_Stock_Talle]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Competencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje]  WITH CHECK ADD  CONSTRAINT [FK_Puntaje_Competencia] FOREIGN KEY([idCompetencia])
REFERENCES [dbo].[Competencia] ([idCompetencia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Competencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje] CHECK CONSTRAINT [FK_Puntaje_Competencia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Participante]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje]  WITH CHECK ADD  CONSTRAINT [FK_Puntaje_Participante] FOREIGN KEY([idParticipante])
REFERENCES [dbo].[Participante] ([idParticipante])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Puntaje_Participante]') AND parent_object_id = OBJECT_ID(N'[dbo].[Puntaje]'))
ALTER TABLE [dbo].[Puntaje] CHECK CONSTRAINT [FK_Puntaje_Participante]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Recomendacion_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Recomendacion]'))
ALTER TABLE [dbo].[Recomendacion]  WITH CHECK ADD  CONSTRAINT [FK_Recomendacion_Nivel] FOREIGN KEY([Nivel])
REFERENCES [dbo].[Nivel] ([Importancia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Recomendacion_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Recomendacion]'))
ALTER TABLE [dbo].[Recomendacion] CHECK CONSTRAINT [FK_Recomendacion_Nivel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_SucesoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso]  WITH CHECK ADD  CONSTRAINT [FK_Suceso_SucesoTipo] FOREIGN KEY([id_suceso_tipo])
REFERENCES [dbo].[SucesoTipo] ([id_suceso_tipo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_SucesoTipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso] CHECK CONSTRAINT [FK_Suceso_SucesoTipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso]  WITH CHECK ADD  CONSTRAINT [FK_Suceso_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suceso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suceso]'))
ALTER TABLE [dbo].[Suceso] CHECK CONSTRAINT [FK_Suceso_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Talle_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Talle]'))
ALTER TABLE [dbo].[Talle]  WITH CHECK ADD  CONSTRAINT [FK_Talle_Linea] FOREIGN KEY([Linea])
REFERENCES [dbo].[Linea] ([CodLinea])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Talle_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Talle]'))
ALTER TABLE [dbo].[Talle] CHECK CONSTRAINT [FK_Talle_Linea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Idioma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Idioma] FOREIGN KEY([IdIdioma])
REFERENCES [dbo].[Idioma] ([IdIdioma])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Idioma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Idioma]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Leyenda]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Leyenda] FOREIGN KEY([IdLeyenda])
REFERENCES [dbo].[Leyenda] ([IdLeyenda])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Traduccion_Leyenda]') AND parent_object_id = OBJECT_ID(N'[dbo].[Traduccion]'))
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Leyenda]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_PermisoFamilia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_FamiliaPermiso_PermisoFamilia] FOREIGN KEY([CodigoPadre], [CodigoPermiso])
REFERENCES [dbo].[PermisoFamilia] ([CodigoPadre], [CodigoPermiso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_PermisoFamilia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso] CHECK CONSTRAINT [FK_Usuario_FamiliaPermiso_PermisoFamilia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_FamiliaPermiso_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_FamiliaPermiso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_FamiliaPermiso]'))
ALTER TABLE [dbo].[Usuario_FamiliaPermiso] CHECK CONSTRAINT [FK_Usuario_FamiliaPermiso_Usuario]
GO
USE [master]
GO
ALTER DATABASE [FSS] SET  READ_WRITE 
GO
