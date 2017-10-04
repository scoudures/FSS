Public Class CodigoPostal
    Private nro As Integer
    Public Property numero() As Integer
        Get
            Return nro
        End Get
        Set(ByVal value As Integer)
            nro = value
        End Set
    End Property
    Private _cpa As String
    Public Property CPA() As String
        Get
            Return _cpa
        End Get
        Set(ByVal value As String)
            _cpa = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
