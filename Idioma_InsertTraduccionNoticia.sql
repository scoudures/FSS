USE [FSS]
GO

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
	INSERT INTO [dbo].[Leyenda] ([Tag],[TextoDefault],[Estado],[DVH])
    VALUES (@leyenda, @textodefault, 1, '0');
	SELECT @idLeyenda = IdLeyenda FROM Leyenda WHERE tag= @leyenda;
	end
--insertar la traduccion
IF (@idIdioma >0 AND @idLeyenda>0)
	BEGIN
	INSERT INTO [dbo].[Traduccion] ([IdIdioma],[IdLeyenda],[Texto],[Estado],[DVH])
     VALUES(@idIdioma, @idLeyenda, @texto, 1 , '0');
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


GO


