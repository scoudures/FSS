Public Class Idioma
    Private _Nombre As String
    Public Property nombre() As String
        Get
            Return _Nombre
        End Get
        Set(ByVal value As String)
            _Nombre = value
        End Set
    End Property
    Sub New()

    End Sub
    Sub New(ByVal unNombre As String)
        Me.nombre = unNombre
    End Sub
End Class
