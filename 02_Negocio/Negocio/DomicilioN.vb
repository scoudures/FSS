Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class DomicilioN

    Private _miMapper As New data.DomicilioM
    Public Property miMapper() As data.DomicilioM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.DomicilioM)
            _miMapper = value
        End Set
    End Property

    Private _miDomicilio As New ent.Domicilio
    Public Property miDomicilio() As ent.Domicilio
        Get
            Return _miDomicilio
        End Get
        Set(ByVal value As ent.Domicilio)
            _miDomicilio = value
        End Set
    End Property

    Public Function listarTipos() As List(Of ent.Domicilio)
        Try
            Return miMapper.listarTipos
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
