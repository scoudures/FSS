Public Class Producto
    Private _inv As Integer
    Public Property inventario() As Integer
        Get
            Return _inv
        End Get
        Set(ByVal value As Integer)
            _inv = value
        End Set
    End Property
    Private _desc As String
    Public Property descripcion() As String
        Get
            Return _desc
        End Get
        Set(ByVal value As String)
            _desc = value
        End Set
    End Property


    Private _linea As Linea
    Public Property linea() As Linea
        Get
            Return _linea
        End Get
        Set(ByVal value As Linea)
            _linea = value
        End Set
    End Property
    Private _marca As Marca
    Public Property marca() As Marca
        Get
            Return _marca
        End Get
        Set(ByVal value As Marca)
            _marca = value
        End Set
    End Property
    Private _color As Color
    Public Property color() As Color
        Get
            Return _color
        End Get
        Set(ByVal value As Color)
            _color = value
        End Set
    End Property
    Private _talle As Talle
    Public Property talle() As Talle
        Get
            Return _talle
        End Get
        Set(ByVal value As Talle)
            _talle = value
        End Set
    End Property
    
    Private _cantMaxPorPedido As Integer
    Public Property cantMaxPorPedido() As Integer
        Get
            Return _cantMaxPorPedido
        End Get
        Set(ByVal value As Integer)
            _cantMaxPorPedido = value
        End Set
    End Property
    Private _imagen As String
    Public Property imagen() As String
        Get
            Return _imagen
        End Get
        Set(ByVal value As String)
            _imagen = value
        End Set
    End Property
    Private _precio As Precio
    Public Property precio() As Precio
        Get
            Return _precio
        End Get
        Set(ByVal value As Precio)
            _precio = value
        End Set
    End Property
    Private _nivel As String
    Public Property nivel() As String
        Get
            Return _nivel
        End Get
        Set(ByVal value As String)
            _nivel = value
        End Set
    End Property
    Private cantVendida As Integer
    Public Property cantidadVendida() As Integer
        Get
            Return cantVendida
        End Get
        Set(ByVal value As Integer)
            cantVendida = value
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

    Sub New()
        Me.linea = New Linea
        Me.marca = New Marca
        Me.color = New Color
        Me.talle = New Talle
        Me.precio = New Precio
    End Sub
    Public Overrides Function ToString() As String
        Return Me.inventario.ToString
    End Function
End Class
