Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class PagoN

    Private _miMapper As New data.PagoM
    Public Property miMapper() As data.PagoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.PagoM)
            _miMapper = value
        End Set
    End Property

    Private _miPago As New ent.Pago
    Public Property miPago() As ent.Pago
        Get
            Return _miPago
        End Get
        Set(ByVal value As ent.Pago)
            _miPago = value
        End Set
    End Property

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
