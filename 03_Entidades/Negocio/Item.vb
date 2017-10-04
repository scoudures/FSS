Public Class Item

    Private _num As Integer
    Public Property numero() As Integer
        Get
            Return _num
        End Get
        Set(ByVal value As Integer)
            _num = value
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
    Private _cant As Integer
    Public Property cantidad() As Integer
        Get
            Return _cant
        End Get
        Set(ByVal value As Integer)
            _cant = value
        End Set
    End Property

    Private _prod As Producto
    Public Property producto() As Producto
        Get
            Return _prod
        End Get
        Set(ByVal value As Producto)
            _prod = value
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
        Me.producto = New Producto
        Me.talle = New Talle
    End Sub
    
End Class
