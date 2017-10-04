Public Class Cliente
    Inherits Usuario
    Private preg As String
    Public Property pregunta() As String
        Get
            Return preg
        End Get
        Set(ByVal value As String)
            preg = value
        End Set
    End Property
    Private rta As String
    Public Property respuesta() As String
        Get
            Return rta
        End Get
        Set(ByVal value As String)
            rta = value
        End Set
    End Property

    Private _domicilio As Domicilio
    Public Property domicilio() As Domicilio
        Get
            Return _domicilio
        End Get
        Set(ByVal value As Domicilio)
            _domicilio = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
