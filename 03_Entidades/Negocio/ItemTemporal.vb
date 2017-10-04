Public Class ItemTemporal
    Private num As Integer
    Public Property numero() As Integer
        Get
            Return NUM
        End Get
        Set(ByVal value As Integer)
            NUM = value
        End Set
    End Property

    Private inv As Integer
    Public Property inventario() As Integer
        Get
            Return inv
        End Get
        Set(ByVal value As Integer)
            inv = value
        End Set
    End Property
    Private prod As String
    Public Property producto() As String
        Get
            Return prod
        End Get
        Set(ByVal value As String)
            prod = value
        End Set
    End Property
    Private cant As Integer
    Public Property cantidad() As Integer
        Get
            Return cant
        End Get
        Set(ByVal value As Integer)
            cant = value
        End Set
    End Property
    Private precio As Double
    Public Property precioUnitario() As Double
        Get
            Return precio
        End Get
        Set(ByVal value As Double)
            precio = value
        End Set
    End Property
    Private subtot As Double
    Public Property subTotal() As Double
        Get
            Return subtot
        End Get
        Set(ByVal value As Double)
            subtot = value
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
    Sub New()
        Me.talle = New Talle
    End Sub
End Class
