Public Class Provincia
    Private cod As Integer
    Public Property codigo() As Integer
        Get
            Return cod
        End Get
        Set(ByVal value As Integer)
            cod = value
        End Set
    End Property
    Private prov As String
    Public Property provincia() As String
        Get
            Return prov
        End Get
        Set(ByVal value As String)
            prov = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
