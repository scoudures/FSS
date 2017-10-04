Public Class Mensaje
    Private _titulo As String
    Public Property Titulo() As String
        Get
            Return _titulo
        End Get
        Set(ByVal value As String)
            _titulo = value
        End Set
    End Property

    Private _texto As String
    Public Property texto() As String
        Get
            Return _texto
        End Get
        Set(ByVal value As String)
            _texto = value
        End Set
    End Property
    Sub New()
        texto = ""
    End Sub
    Sub New(ByVal unTexto As String)
        texto = unTexto
    End Sub

    Sub New(ByVal unTexto As String, ByVal unTitulo As String)
        Titulo = unTitulo
        texto = unTexto
    End Sub
    Public Overrides Function ToString() As String
        Return Me.texto
    End Function
End Class
