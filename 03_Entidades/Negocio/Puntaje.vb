Public Class puntaje
    Private _idPuntaje As Integer
    Public Property idPuntaje() As Integer
        Get
            Return _idPuntaje
        End Get
        Set(ByVal value As Integer)
            _idPuntaje = value
        End Set
    End Property


    Private _valorA As Double
    Public Property valorA() As Double
        Get
            Return _valorA
        End Get
        Set(ByVal value As Double)
            _valorA = value
        End Set
    End Property

    Private _valorB As Double
    Public Property valorB() As Double
        Get
            Return _valorB
        End Get
        Set(ByVal value As Double)
            _valorB = value
        End Set
    End Property

    Private _patinador As patinador
    Public Property patinador() As patinador
        Get
            Return _patinador
        End Get
        Set(ByVal value As patinador)
            _patinador = value
        End Set
    End Property

    Private _juez As Juez
    Public Property juez() As Juez
        Get
            Return _juez
        End Get
        Set(ByVal value As Juez)
            _juez = value
        End Set
    End Property

    Public misvalores As New List(Of Valor)
    Sub New()

    End Sub
    Public Sub New(ByVal valorA As Double, ByVal valorB As Double, ByRef patinador As patinador, ByRef juez As juez)
        Me.valorA = valorA
        Me.valorB = valorB
        Me.patinador = patinador
        Me.juez = juez
    End Sub
    Public Function SumaValores() As Double
        Return CDbl(Me.valorA + Me.valorB)
    End Function
    Public Function dameTuJuez() As juez
        Return Me.juez
    End Function
    Public Function dameTuPatinador() As patinador
        Return Me.patinador
    End Function
    Public Overrides Function ToString() As String
        Return Me.SumaValores.ToString
    End Function
End Class