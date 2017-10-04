Public Class Competencia
    Private _competencia As String
    Public Property competencia() As String
        Get
            Return _competencia
        End Get
        Set(ByVal value As String)
            _competencia = value
        End Set
    End Property

    Private _orden As Integer
    Public Property orden() As Integer
        Get
            Return _orden
        End Get
        Set(ByVal value As Integer)
            _orden = value
        End Set
    End Property

    Private _resultado As Integer
    Public Property resultado() As Integer
        Get
            Return _resultado
        End Get
        Set(ByVal value As Integer)
            _resultado = value
        End Set
    End Property

    Private _participante As patinador
    Public Property participante() As patinador
        Get
            Return _participante
        End Get
        Set(ByVal value As patinador)
            _participante = value
        End Set
    End Property

    Public misPuntajes As New List(Of puntaje)


    Public Sub New()
    End Sub

    Public Sub New(ByVal unNombre As String)
        Me._competencia = unNombre
    End Sub

    Public Overrides Function ToString() As String
        Dim cadena As String
        cadena = "Nro " & Me.Orden.ToString & ": "
        cadena &= Me.participante.nombre
        cadena &= " - " & Me.competencia
        Return cadena
    End Function
End Class
