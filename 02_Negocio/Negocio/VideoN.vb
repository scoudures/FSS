Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class VideoN
    Private _miMapper As New data.VideoM
    Public Property miMapper() As data.VideoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.VideoM)
            _miMapper = value
        End Set
    End Property
    Private _miVideo As New ent.Video
    Public Property miVideo() As ent.Video
        Get
            Return _miVideo
        End Get
        Set(ByVal value As ent.Video)
            _miVideo = value
        End Set
    End Property
    Public Function getByCodigo(ByRef unVideo As ent.Video) As ent.Video
        Return miMapper.getByCodigo(unVideo)
    End Function

    Public Function listarTodo() As List(Of ent.Video)
        Try
            Return miMapper.listarTodo()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function

    Public Function Nuevo(ByRef unVideo As ent.Video) As Integer
        Try
            Return _miMapper.Nuevo(unVideo)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Modificar(ByRef unVideo As ent.Video) As Integer
        Try
            Return _miMapper.Modificar(unVideo)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Eliminar(ByRef unVideo As ent.Video) As Integer
        Try
            Return _miMapper.Eliminar(unVideo)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function
End Class
