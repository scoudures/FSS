Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class ProvinciaN

    Private _miMapper As New data.ProvinciaM
    Public Property miMapper() As data.ProvinciaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.ProvinciaM)
            _miMapper = value
        End Set
    End Property

    Private _miProvincia As New ent.Provincia
    Public Property miProvincia() As ent.Provincia
        Get
            Return _miProvincia
        End Get
        Set(ByVal value As ent.Provincia)
            _miProvincia = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Provincia)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
