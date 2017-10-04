Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class EnvioN

    Private _miMapper As New data.EnvioM
    Public Property miMapper() As data.EnvioM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.EnvioM)
            _miMapper = value
        End Set
    End Property

    Private _miEnvio As New ent.Envio
    Public Property miEnvio() As ent.Envio
        Get
            Return _miEnvio
        End Get
        Set(ByVal value As ent.Envio)
            _miEnvio = value
        End Set
    End Property


    Public Function listarFormas() As List(Of ent.Envio)
        Try
            Return miMapper.listarFormas()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unPedido As ent.Pedido) As Integer
        Try
            Return miMapper.Nuevo(unPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
