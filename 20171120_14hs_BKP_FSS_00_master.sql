USE [master]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FechaRestore]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FechaRestore](
	[fecha] [datetime] NOT NULL CONSTRAINT [DF_FechaRestore_fecha]  DEFAULT (getdate()),
	[BKP] [varchar](max) NOT NULL,
 CONSTRAINT [PK_FechaRestore] PRIMARY KEY CLUSTERED 
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[FechaRestore] ([fecha], [BKP]) VALUES (CAST(N'20171208 16:26:00.413' AS DateTime), N'C:\BKP_FSS\20171209_162553_FSS.bak')
GO

/****** Object:  StoredProcedure [dbo].[Backup_SelectAll]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Backup_SelectAll] 
@p1 as nvarchar(200)
	AS
BEGIN
	SELECT TOP 20
--s.server_name,
s.database_name as base,
--s.recovery_model,
m.physical_device_name as archivo,
CAST(CAST(s.backup_size / 1000000 AS INT) AS VARCHAR(14)) AS tamanioMB,
s.backup_start_date as inicio,
s.backup_finish_date as fin,
--CAST(DATEDIFF(second, s.backup_start_date,s.backup_finish_date) AS VARCHAR(4)) + ' ' + 'Seconds' tiempo,
s.description as descripcion
FROM msdb.dbo.backupset s
INNER JOIN msdb.dbo.backupmediafamily m ON s.media_set_id = m.media_set_id
WHERE s.database_name = @p1
ORDER BY backup_start_date DESC
END

GO
/****** Object:  StoredProcedure [dbo].[Cerrar_Conexiones]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Cerrar_Conexiones] 
@dbname as varchar(100)
as
	DECLARE @ProcessId varchar(4)
	DECLARE CurrentProcesses SCROLL CURSOR FOR
	select spid from sysprocesses where dbid = (select dbid from sysdatabases where name = @dbname ) order by spid 
	FOR READ ONLY
OPEN CurrentProcesses
FETCH NEXT FROM CurrentProcesses INTO @ProcessId
WHILE @@FETCH_STATUS <> -1
BEGIN
	--print 'Kill ' + @processid
	Exec ('KILL ' +  @ProcessId)
	--Kill @ProcessId
	FETCH NEXT FROM CurrentProcesses INTO @ProcessId
END
CLOSE CurrentProcesses
DeAllocate CurrentProcesses


GO
/****** Object:  StoredProcedure [dbo].[HacerBackup]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HacerBackup]
@ruta as varchar(max),@dbname as varchar(max)
as
declare @mifecha as char(8)
declare @mihora as varchar(20)
declare @mibkp as varchar(max)
declare @description as varchar(max)
SELECT @mifecha = [master].[dbo].[fn_devuelve_anio] ()+[master].[dbo].[fn_devuelve_mes] ()+[master].[dbo].[fn_devuelve_dia] ()
SELECT @mihora = [master].[dbo].[fn_devuelve_hora] ()+[master].[dbo].[fn_devuelve_min] ()+[master].[dbo].[fn_devuelve_seg] ()
SELECT @mibkp = @ruta+ @mifecha + '_' + @mihora + '_' + @dbname + '.bak'
SELECT @description = 'Backup de la base '+ @dbname + ' el dia ' +@mifecha + ' a las '+@mihora
PRINT @description
PRINT @mibkp
BACKUP DATABASE @dbname  TO  DISK = @mibkp
  WITH INIT, SKIP , DESCRIPTION = @description, NAME = @dbname
EXEC sp_addumpdevice 'disk',@mibkp , @mibkp

GO
/****** Object:  StoredProcedure [dbo].[RestaurarBackup]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[RestaurarBackup]
@dbname as varchar(100), @file as varchar(100)
as
DECLARE @ruta as Nvarchar(max)
DECLARE @pathmdf as Nvarchar(max)
DECLARE @pathldf as Nvarchar(max)

SELECT @ruta= replace(physical_name, 'master.mdf', '') FROM sys.master_files WHERE database_id = 1 and file_id = 1;
SET @pathmdf = @ruta + @dbname + '_data.mdf'
SET @pathldf = @ruta + @dbname + '_tlog.ldf'

declare @mdf varchar(255)
declare @ldf varchar(255)
select @mdf = @dbname
select @ldf = @dbname+'_Log'
INSERT INTO [dbo].[FechaRestore]([BKP]) VALUES (@file);
EXECUTE [master].[dbo].[Cerrar_Conexiones] @dbname
RESTORE DATABASE @dbname
   FROM @file
   WITH REPLACE, FILE = 1, 
MOVE @mdf TO @pathmdf,  
MOVE @ldf TO @pathldf


GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_anio]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_anio]
(
)
RETURNS char(4)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(4)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = DATEPART(year, GETDATE())
	RETURN @ResultVar
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_dia]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_dia] 
(
)
RETURNS char(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = case DATEPART(DAY, GETDATE())
	when 1 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 2 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 3 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 4 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 5 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 6 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 7 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 8 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	when 9 then '0'+CONVERT(char(1),DATEPART(DAY, GETDATE()))
	else CONVERT(char(2),DATEPART(DAY, GETDATE()))
	end 
	RETURN @ResultVar
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_hora]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_hora]
(
)
RETURNS char(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = CASE DATEPART(HOUR, GETDATE())
	when 0 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 1 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 2 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 3 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 4 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 5 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 6 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 7 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 8 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	when 9 then '0'+CONVERT(char(1),DATEPART(HOUR, GETDATE()))
	else CONVERT(char(2),DATEPART(HOUR, GETDATE()))
	end RETURN @ResultVar
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_mes]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_mes] 
(
)
RETURNS char(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = case DATEPART(month, GETDATE())
	when 1 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 2 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 3 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 4 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 5 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 6 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 7 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 8 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	when 9 then '0'+CONVERT(char(1),DATEPART(month, GETDATE()))
	else CONVERT(char(2),DATEPART(month, GETDATE()))
	end 
	RETURN @ResultVar
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_min]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_min]
(
)
RETURNS char(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = CASE DATEPART(MINUTE, GETDATE())
	when 0 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 1 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 2 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 3 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 4 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 5 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 6 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 7 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 8 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	when 9 then '0'+CONVERT(char(1),DATEPART(MINUTE, GETDATE()))
	else CONVERT(char(2),DATEPART(MINUTE, GETDATE()))
	end RETURN @ResultVar
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_devuelve_seg]    Script Date: 11/05/2016 2:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_devuelve_seg]
(
)
RETURNS char(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar as char(2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = CASE DATEPART(SECOND, GETDATE())
	when 0 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 1 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 2 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 3 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 4 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 5 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 6 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 7 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 8 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	when 9 then '0'+CONVERT(char(1),DATEPART(SECOND, GETDATE()))
	else CONVERT(char(2),DATEPART(SECOND, GETDATE()))
	end RETURN @ResultVar
END

GO
