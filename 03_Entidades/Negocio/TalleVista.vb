Public Class TalleVista
    Private _inventario As Integer
    Public Property inventario() As Integer
        Get
            Return _inventario
        End Get
        Set(ByVal value As Integer)
            _inventario = value
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
    Private _stock As Integer
    Public Property stock() As Integer
        Get
            Return _stock
        End Get
        Set(ByVal value As Integer)
            _stock = value
        End Set
    End Property

End Class
