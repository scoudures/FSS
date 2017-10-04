Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class NivelN
    Private _miMapper As New data.NivelM
    Public Property miMapper() As data.NivelM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.NivelM)
            _miMapper = value
        End Set
    End Property

    Private _miNivel As New ent.Nivel
    Public Property miNivel() As ent.Nivel
        Get
            Return _miNivel
        End Get
        Set(ByVal value As ent.Nivel)
            _miNivel = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Nivel)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar(ByRef unproducto As ent.Producto) As List(Of ent.Nivel)
        Try
            Return miMapper.listar(unproducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function getByCodigo(ByRef unNivel As ent.Nivel) As ent.Nivel
        Try
            Return miMapper.getByCodigo(unNivel)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unNivel As ent.Nivel) As Integer
        Try
            Return miMapper.Nuevo(unNivel)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unNivel As ent.Nivel) As Integer
        Try
            Return miMapper.Modificar(unNivel)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unNivel As ent.Nivel) As Integer
        Try
            Return miMapper.Eliminar(unNivel)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

End Class
