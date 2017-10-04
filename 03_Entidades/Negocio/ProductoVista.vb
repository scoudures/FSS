Public Class ProductoVista
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


End Class
