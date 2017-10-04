Public Class Leyenda
    
    Private _tag As String
    Public Property tag() As String
        Get
            Return _tag
        End Get
        Set(ByVal value As String)
            _tag = value
        End Set
    End Property

    Private _textoDefault As String
    Public Property textodefault() As String
        Get
            Return _textoDefault
        End Get
        Set(ByVal value As String)
            _textoDefault = value
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

    End Sub
End Class

