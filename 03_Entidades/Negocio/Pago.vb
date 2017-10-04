Public Class Pago
    Private _desc As String
    Public Property descripcion() As String
        Get
            Return _desc
        End Get
        Set(ByVal value As String)
            _desc = value
        End Set
    End Property
    Private _nume As String
    Public Property numero() As String
        Get
            Return _nume
        End Get
        Set(ByVal value As String)
            _nume = value
        End Set
    End Property
    Private vto As String
    Public Property vencimiento() As String
        Get
            Return vto
        End Get
        Set(ByVal value As String)
            vto = value
        End Set
    End Property

    Private _cuotas As Integer
    Public Property cuotas() As Integer
        Get
            Return _cuotas
        End Get
        Set(ByVal value As Integer)
            _cuotas = value
        End Set
    End Property
    Private _rec As Integer
    Public Property porcentRecargo() As Integer
        Get
            Return _rec
        End Get
        Set(ByVal value As Integer)
            _rec = value
        End Set
    End Property

    Private _total As Double
    Public Property total() As Double
        Get
            Return _total
        End Get
        Set(ByVal value As Double)
            _total = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
