Public Class Vendedor
    Inherits Usuario
    Private _codigo As Integer
    Public Property codigo() As Integer
        Get
            Return _codigo
        End Get
        Set(ByVal value As Integer)
            _codigo = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
