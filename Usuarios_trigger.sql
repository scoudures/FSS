CREATE TRIGGER [dbo].[Usuarios_NoBorrar]
   ON  [dbo].[Usuario]
   AFTER DELETE
AS 
BEGIN
DECLARE @id as integer
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select  @id=[idUsuario] from deleted
    -- Insert statements for trigger here
	if (@id = 4)
	begin
	--administrador
	INSERT [dbo].[Usuario] ([idUsuario], [DNI], [login], [Password], [idioma], [Nombre], [Apellido], [email], [FechaNac], [intentos], [EsCliente], [EsVendedor], [EsSupervisor], [PorcentajeComi], [Pregunta], [Respuesta], [Estado], [DVH]) VALUES (4, N'44555666', N'Administrador', N'5F-A2-85-E1-BE-BE-0A-66-23-E3-3A-FC-04-A1-FB-D5', 1, N'Administrador', N'Administrador', N'admin@fss.com.ar', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 0, 0, 1, CAST(0 AS Decimal(18, 0)), N'Profesor favorito', N'9A-F9-F8-78-D3-C7-39-9D-58-10-8F-44-5C-B0-AD-29', 1, N'15-DD-B9-E4-DE-C9-98-CD-8A-60-FB-6D-CD-D8-0F-F8');
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 99, 502, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 1, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 2, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 3, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 4, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 5, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 6, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 7, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 8, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 9, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 10, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 11, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 12, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 13, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 14, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 15, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 16, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 17, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 18, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 19, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 20, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 101, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 102, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 103, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 104, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 105, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 106, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 107, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 108, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 109, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 110, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 111, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 112, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 113, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 114, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 115, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 117, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 118, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 119, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 120, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 121, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 122, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 123, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 124, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 125, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 126, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 127, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 128, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 129, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 130, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 131, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 132, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 133, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 134, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 135, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 136, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 137, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 138, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 139, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 140, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 141, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 142, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 143, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 144, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 145, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 148, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 149, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 150, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 152, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 153, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 154, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 155, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 156, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 158, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 161, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 162, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 163, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 164, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 170, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 171, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 172, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 173, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 174, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 175, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 176, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 177, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 178, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 179, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 180, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 181, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 182, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 183, 1);
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (4, 502, 184, 1);
	end
	if (@id = 6)
	begin
	--Todos
	INSERT [dbo].[Usuario] ([idUsuario], [DNI], [login], [Password], [idioma], [Nombre], [Apellido], [email], [FechaNac], [intentos], [EsCliente], [EsVendedor], [EsSupervisor], [PorcentajeComi], [Pregunta], [Respuesta], [Estado], [DVH]) VALUES (6, N'99999999', N'Todos', N'123', 1, N'Todos', N'Todos', N'email', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 1, 0, 0, CAST(0 AS Decimal(18, 0)), N'SIN PREGUNTA', N'SIN RESPUESTA', 0, N'41ffa9a59409247e752ea8433e77a06e');
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (6, 99, 501, 1);
	end
	if (@id = 7)
	begin
	--Sistema
	INSERT [dbo].[Usuario] ([idUsuario], [DNI], [login], [Password], [idioma], [Nombre], [Apellido], [email], [FechaNac], [intentos], [EsCliente], [EsVendedor], [EsSupervisor], [PorcentajeComi], [Pregunta], [Respuesta], [Estado], [DVH]) VALUES (7, N'00000000', N'Sistema', N'123', 1, N'Sistema', N'Sistema', N'email', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 0, 1, 1, CAST(0 AS Decimal(18, 0)), N'SIN PREGUNTA', N'SIN RESPUESTA', 0, N'ca69ca5a71d7695c8c19c533549f8a31');
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (7, 99, 501, 1);
	end
	if (@id = 8)
	begin
	--Invitado
	INSERT [dbo].[Usuario] ([idUsuario], [DNI], [login], [Password], [idioma], [Nombre], [Apellido], [email], [FechaNac], [intentos], [EsCliente], [EsVendedor], [EsSupervisor], [PorcentajeComi], [Pregunta], [Respuesta], [Estado], [DVH]) VALUES (8, N'11111111', N'Invitado', N'5F-A2-85-E1-BE-BE-0A-66-23-E3-3A-FC-04-A1-FB-D5', 1, N'Usuario', N'Invitado', N'email', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 1, 0, 0, CAST(0 AS Decimal(18, 0)), N'SIN PREGUNTA', N'SIN RESPUESTA', 0, N'A2-8B-B9-D4-6D-2F-C7-9D-0B-FE-D7-42-AB-E2-DB-F8');
	INSERT [dbo].[Usuario_FamiliaPermiso] ([idUsuario], [CodigoPadre], [CodigoPermiso], [Estado]) VALUES (8, 99, 501, 1);
	end
END
GO
