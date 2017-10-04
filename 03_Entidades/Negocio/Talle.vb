Public Class Talle
    Private _descripcion As String
    Private cod As Integer
    Public Property codigo() As Integer
        Get
            Return cod
        End Get
        Set(ByVal value As Integer)
            cod = value
        End Set
    End Property

    Public Property descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
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

    End Sub
    Sub New(ByVal unaDescripcion As String)
        Me.descripcion = unaDescripcion
    End Sub
    Public Overrides Function ToString() As String
        Return Me.descripcion
    End Function

End Class
