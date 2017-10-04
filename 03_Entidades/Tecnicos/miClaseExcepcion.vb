Public Class miClaseExcepcion
    Inherits System.Exception
    Private _Descripcion As String
    Public Property Descripcion() As String
        Get
            Return _Descripcion
        End Get
        Set(ByVal value As String)
            _Descripcion = value
        End Set
    End Property

    Private _laexcepcion As Exception
    Public Property laexcepcion() As Exception
        Get
            Return _laexcepcion
        End Get
        Set(ByVal value As Exception)
            _laexcepcion = value
        End Set
    End Property

    Sub New()

    End Sub
    Sub New(ByVal unaDescripcion As String, ByRef unaExcepcion As Exception)
        Me.Descripcion = unaDescripcion
        Me.laexcepcion = unaExcepcion
    End Sub

    Public Overrides Function ToString() As String
        Return Me.Descripcion
    End Function

End Class
