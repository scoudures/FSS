/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT 'EXECUTE [dbo].[Idioma_InsertTraduccionNoticia] ''Español'', ''Texto_' + cast([CodigoNoticia] as varchar(max)) + ''', '''+ Texto + ''', '''+ Texto +''';'
      --,[Subtitulo]
      --,[Texto]
  FROM [FSS].[dbo].[Noticia]