Public Class Nivel
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
