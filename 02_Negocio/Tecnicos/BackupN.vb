Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class BackupN

    Private _miMapper As New data.BackupM
    Public Property miMapper() As data.BackupM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.BackupM)
            _miMapper = value
        End Set
    End Property

    Private _miBackup As New ent.Backup
    Public Property miBackup() As ent.Backup
        Get
            Return _miBackup
        End Get
        Set(ByVal value As ent.Backup)
            _miBackup = value
        End Set
    End Property

    Public Function Listar() As List(Of ent.Backup)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function HacerBackup() As Integer
        Try
            Return miMapper.HacerBackup()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Restaurar(unArchivo As String) As Integer
        Try
            Return miMapper.Restaurar(unArchivo)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
