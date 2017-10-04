Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class MarcaN

    Private _miMapper As New data.MarcaM
    Public Property miMapper() As data.MarcaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.MarcaM)
            _miMapper = value
        End Set
    End Property

    Private _miMarca As New ent.Marca
    Public Property miMarca() As ent.Marca
        Get
            Return _miMarca
        End Get
        Set(ByVal value As ent.Marca)
            _miMarca = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Marca)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function getByCodigo(ByRef unaMarca As ent.Marca) As ent.Marca
        Try
            Return miMapper.getByCodigo(unaMarca)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unaMarca As ent.Marca) As Integer
        Try
            Return miMapper.Nuevo(unaMarca)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unaMarca As ent.Marca) As Integer
        Try
            Return miMapper.Modificar(unaMarca)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unaMarca As ent.Marca) As Integer
        Try
            Return miMapper.Eliminar(unaMarca)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

End Class
