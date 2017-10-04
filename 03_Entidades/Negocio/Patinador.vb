Public Class patinador
    Private _nombre As String
    Public Property nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Sub New(ByVal nombre As String)
        Me.nombre = nombre
    End Sub

    Public Overrides Function tostring() As String
        Return Me.nombre
    End Function
    Sub New()

    End Sub
End Class
