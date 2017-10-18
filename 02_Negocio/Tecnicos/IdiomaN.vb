Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class IdiomaN

    Private _miMapper As New data.IdiomaM
    Public Property miMapper() As data.IdiomaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.IdiomaM)
            _miMapper = value
        End Set
    End Property

    Private _miIdioma As New ent.Idioma
    Public Property miIdioma() As ent.Idioma
        Get
            Return _miIdioma
        End Get
        Set(ByVal value As ent.Idioma)
            _miIdioma = value
        End Set
    End Property

    Function listar() As List(Of ent.Idioma)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2

        End Try
    End Function

    Function listarLeyendas(ByRef unIdioma As ent.Idioma) As List(Of ent.Leyenda)
        Try
            Return miMapper.listarLeyendasDe(unIdioma)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Function guardar(ByRef unIdioma As ent.Idioma) As Integer
        Try
            Return miMapper.guardar(unIdioma)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Function borrar(ByRef unIdioma As ent.Idioma) As Integer
        Try
            Return miMapper.borrar(unIdioma)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Function actualizarTraduccion(ByRef unIdioma As ent.Idioma, ByRef unaLeyenda As ent.Leyenda, ByVal unTexto As String) As Integer
        Try
            Return miMapper.actualizarTraduccion(unIdioma, unaLeyenda, unTexto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function nuevaTraduccionNoticia(ByRef unIdioma As ent.Idioma, ByRef unaNoticia As ent.Noticia, ByVal lasLeyendas As List(Of ent.Leyenda)) As Integer
        Try
            Return miMapper.nuevaTraduccionNoticia(unIdioma, unaNoticia, lasLeyendas)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function modificarTraduccionNoticia(ByRef unIdioma As ent.Idioma, ByRef unaNoticia As ent.Noticia, ByVal lasLeyendas As List(Of ent.Leyenda)) As Integer
        Try
            Return miMapper.modificarTraduccionNoticia(unIdioma, unaNoticia, lasLeyendas)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function eliminarTraduccionNoticia(ByRef unIdioma As ent.Idioma, ByRef unaNoticia As ent.Noticia, ByVal lasLeyendas As List(Of ent.Leyenda)) As Integer
        Try
            Return miMapper.eliminarTraduccionNoticia(unIdioma, unaNoticia, lasLeyendas)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Sub consultarTraduccionNoticia(ByRef unIdioma As ent.Idioma, ByRef unaLeyenda As ent.Leyenda)
        Try
            miMapper.consultarTraduccionNoticia(unIdioma, unaLeyenda)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
End Class
