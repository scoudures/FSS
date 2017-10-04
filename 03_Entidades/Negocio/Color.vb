Public Class Color
    Private _descripcion As String
    Public Property descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
        End Set
    End Property

    Sub New()

    End Sub
    Sub New(ByVal unaDescripcion As String)
        Me.descripcion = unaDescripcion
    End Sub
    Public Overrides Function ToString() As String
        Return Me.descripcion
    End Function
End Class
