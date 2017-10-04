Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class LocalidadN

    Private _miMapper As New data.LocalidadM
    Public Property miMapper() As data.LocalidadM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.LocalidadM)
            _miMapper = value
        End Set
    End Property

    Private _miLocalidad As New ent.Localidad
    Public Property miLocalidad() As ent.Localidad
        Get
            Return _miLocalidad
        End Get
        Set(ByVal value As ent.Localidad)
            _miLocalidad = value
        End Set
    End Property


    Public Function listar() As List(Of ent.Localidad)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
