Public Class Pedido
    Inherits Formulario
    Public misItems As New List(Of Item)

    Private _env As Envio
    Public Property envio() As Envio
        Get
            Return _env
        End Get
        Set(ByVal value As Envio)
            _env = value
        End Set
    End Property

    Private _pago As Pago
    Public Property pago() As Pago
        Get
            Return _pago
        End Get
        Set(ByVal value As Pago)
            _pago = value
        End Set
    End Property
    Private _dom As Domicilio
    Public Property domicilio() As Domicilio
        Get
            Return _dom
        End Get
        Set(ByVal value As Domicilio)
            _dom = value
        End Set
    End Property

    Sub New(ByRef unCliente As Cliente)
        Me.cliente = unCliente
    End Sub
    Sub New()
        Me.cliente = New Cliente
        Me.domicilio = New Domicilio
        Me.envio = New Envio
        Me.pago = New Pago
    End Sub
    
End Class
