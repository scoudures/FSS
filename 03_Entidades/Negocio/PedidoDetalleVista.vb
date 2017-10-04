Public Class PedidoDetalleVista
    Private CodSuc As Integer
    Public Property CodigoSucursal() As Integer
        Get
            Return CodSuc
        End Get
        Set(ByVal value As Integer)
            CodSuc = value
        End Set
    End Property
    Private _num As Integer
    Public Property numeroFormulario() As Integer
        Get
            Return _num
        End Get
        Set(ByVal value As Integer)
            _num = value
        End Set
    End Property
    Private _numItem As Integer
    Public Property numeroItem() As Integer
        Get
            Return _numItem
        End Get
        Set(ByVal value As Integer)
            _numItem = value
        End Set
    End Property
    Private _inv As Integer
    Public Property inventario() As Integer
        Get
            Return _inv
        End Get
        Set(ByVal value As Integer)
            _inv = value
        End Set
    End Property
    Private cnat As Integer
    Private _desc As String
    Public Property descripcion() As String
        Get
            Return _desc
        End Get
        Set(ByVal value As String)
            _desc = value
        End Set
    End Property

    Public Property cantidad() As Integer
        Get
            Return cnat
        End Get
        Set(ByVal value As Integer)
            cnat = value
        End Set
    End Property
    Private _SubTotal As Double
    Public Property SubTotal() As Double
        Get
            Return _SubTotal
        End Get
        Set(ByVal value As Double)
            _SubTotal = value
        End Set
    End Property

    Private _stock As Integer
    Public Property stock() As Integer
        Get
            Return _stock
        End Get
        Set(ByVal value As Integer)
            _stock = value
        End Set
    End Property
    Private _cantxPed As Integer
    Public Property cantMaxPedido() As Integer
        Get
            Return _cantxPed
        End Get
        Set(ByVal value As Integer)
            _cantxPed = value
        End Set
    End Property
    Private _img As String
    Public Property imagen() As String
        Get
            Return _img
        End Get
        Set(ByVal value As String)
            _img = value
        End Set
    End Property
    Private _precioU As Double
    Public Property precioUnitario() As Double
        Get
            Return _precioU
        End Get
        Set(ByVal value As Double)
            _precioU = value
        End Set
    End Property
    Private _precioD As Double
    Public Property precioDocena() As Double
        Get
            Return _precioD
        End Get
        Set(ByVal value As Double)
            _precioD = value
        End Set
    End Property
    Private _maxdto As Integer
    Public Property maxDescuento() As String
        Get
            Return _maxdto
        End Get
        Set(ByVal value As String)
            _maxdto = value
        End Set
    End Property
    Private _fecDessde As Date
    Public Property fechaDesde() As Date
        Get
            Return _fecDessde
        End Get
        Set(ByVal value As Date)
            _fecDessde = value
        End Set
    End Property
    Private _talle As String
    Public Property talle() As String
        Get
            Return _talle
        End Get
        Set(ByVal value As String)
            _talle = value
        End Set
    End Property

    Sub New()

    End Sub

End Class
