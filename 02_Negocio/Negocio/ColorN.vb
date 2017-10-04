Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class ColorN

    Private _miMapper As New data.ColorM
    Public Property miMapper() As data.ColorM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.ColorM)
            _miMapper = value
        End Set
    End Property

    Private _miColor As New ent.Color
    Public Property miColor() As ent.Color
        Get
            Return _miColor
        End Get
        Set(ByVal value As ent.Color)
            _miColor = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Color)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function getByCodigo(ByRef unColor As ent.Color) As ent.Color
        Try
            Return miMapper.getByCodigo(unColor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unColor As ent.Color) As Integer
        Try
            Return miMapper.Nuevo(unColor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unColor As ent.Color) As Integer
        Try
            Return miMapper.Modificar(unColor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unColor As ent.Color) As Integer
        Try
            Return miMapper.Eliminar(unColor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
