Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class ConsultaN
    Private _miMapper As New data.ConsultaM
    Public Property miMapper() As data.ConsultaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.ConsultaM)
            _miMapper = value
        End Set
    End Property

    Private _miConsulta As New ent.Consulta
    Public Property miConsulta() As ent.Consulta
        Get
            Return _miConsulta
        End Get
        Set(ByVal value As ent.Consulta)
            _miConsulta = value
        End Set
    End Property
    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(miConsulta)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
