Public Class Consulta
    Private _email As String
    Public Property email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property
    Private _nivel As String
    Public Property nivel() As String
        Get
            Return _nivel
        End Get
        Set(ByVal value As String)
            _nivel = value
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

End Class
