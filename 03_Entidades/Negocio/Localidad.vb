Public Class Localidad
    Private _cod As Integer
    Public Property codigo() As Integer
        Get
            Return _cod
        End Get
        Set(ByVal value As Integer)
            _cod = value
        End Set
    End Property
    Private _localidad As String
    Public Property localidad() As String
        Get
            Return _localidad
        End Get
        Set(ByVal value As String)
            _localidad = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
