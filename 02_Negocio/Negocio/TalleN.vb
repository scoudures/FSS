Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class TalleN

    Private _miMapper As New data.TalleM
    Public Property miMapper() As data.TalleM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.TalleM)
            _miMapper = value
        End Set
    End Property

    Private _miTalle As New ent.Talle
    Public Property miTalle() As ent.Talle
        Get
            Return _miTalle
        End Get
        Set(ByVal value As ent.Talle)
            _miTalle = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Talle)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar(ByRef unproducto As ent.Producto) As List(Of ent.Talle)
        Try
            Return miMapper.listar(unproducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function getByCodigo(ByRef unTalle As ent.Talle) As ent.Talle
        Try
            Return miMapper.getByCodigo(unTalle)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unTalle As ent.Talle) As Integer
        Try
            Return miMapper.Nuevo(unTalle)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unTalle As ent.Talle) As Integer
        Try
            Return miMapper.Modificar(unTalle)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unTalle As ent.Talle) As Integer
        Try
            Return miMapper.Eliminar(unTalle)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listarPorLinea(ByRef unProducto As ent.Producto) As List(Of ent.TalleVista)
        Try
            Return miMapper.listarPorLinea(unProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
