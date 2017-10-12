Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class NoticiaN
    Private _miMapper As New data.NoticiaM
    Public Property miMapper() As data.NoticiaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.NoticiaM)
            _miMapper = value
        End Set
    End Property

    Private _miNoticia As New ent.Noticia
    Public Property miNoticia() As ent.Noticia
        Get
            Return _miNoticia
        End Get
        Set(ByVal value As ent.Noticia)
            _miNoticia = value
        End Set
    End Property

    Public Function getByCodigo(ByRef unaNoticia As ent.Noticia) As ent.Noticia
        Return miMapper.getByCodigo(unaNoticia)
    End Function
    Public Function NoticiaSelect(ByRef unaNoticia As ent.Noticia) As ent.Noticia
        Return miMapper.NoticiaSelect(unaNoticia)
    End Function

    Public Function listarTodo() As List(Of ent.Noticia)
        Try
            Return miMapper.listarTodo()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function

    Public Function Nuevo(ByRef unaNoticia As ent.Noticia) As Integer
        Try
            Return _miMapper.Nuevo(unaNoticia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Modificar(ByRef unaNoticia As ent.Noticia) As Integer
        Try
            Return _miMapper.Modificar(unaNoticia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Eliminar(ByRef unaNoticia As ent.Noticia) As Integer
        Try
            Return _miMapper.Eliminar(unaNoticia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function
    Public Function listarInicio() As List(Of ent.Noticia)
        Try
            Return miMapper.listarInicio
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function
End Class
