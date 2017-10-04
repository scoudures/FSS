Public Class PedidoTemporal
    Inherits Formulario
    Public misItems As New List(Of ItemTemporal)

    Sub New(ByRef unCliente As Cliente)
        Me.cliente = unCliente
    End Sub

    Private registro As Integer
    Public Property RegistroID() As Integer
        Get
            Return registro
        End Get
        Set(ByVal value As Integer)
            registro = value
        End Set
    End Property

    Private pedidoNro As Integer
    Public Property PedidoTemporalID() As Integer
        Get
            Return pedidoNro
        End Get
        Set(ByVal value As Integer)
            pedidoNro = value
        End Set
    End Property
    Private cant As Integer
    Public Property Cantidad() As Integer
        Get
            Return cant
        End Get
        Set(ByVal value As Integer)
            cant = value
        End Set
    End Property
    Private producto As Integer
    Public Property ProductoID() As Integer
        Get
            Return producto
        End Get
        Set(ByVal value As Integer)
            producto = value
        End Set
    End Property
    Private fech As Date
    Public Property FechaCreacion() As Date
        Get
            Return fech
        End Get
        Set(ByVal value As Date)
            fech = value
        End Set
    End Property
    Sub New()

    End Sub

End Class
