Public Class Envio
    Private _numero As Integer
    Public Property numero() As Integer
        Get
            Return _numero
        End Get
        Set(ByVal value As Integer)
            _numero = value
        End Set
    End Property
    Private descrip As String
    Public Property descripcion() As String
        Get
            Return descrip
        End Get
        Set(ByVal value As String)
            descrip = value
        End Set
    End Property
    Private fecEntrega As Date
    Public Property fechaEntrega() As Date
        Get
            Return fecEntrega
        End Get
        Set(ByVal value As Date)
            fecEntrega = value
        End Set
    End Property
    Private _costo As Double
    Public Property costo() As Double
        Get
            Return _costo
        End Get
        Set(ByVal value As Double)
            _costo = value
        End Set
    End Property
    Private _obs As String
    Public Property observaciones() As String
        Get
            Return _obs
        End Get
        Set(ByVal value As String)
            _obs = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
