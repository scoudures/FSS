Public Class Video
    Private _codigoVideo As String
    Public Property CodigoVideo() As String
        Get
            Return _codigoVideo
        End Get
        Set(ByVal value As String)
            _codigoVideo = value
        End Set
    End Property


    Private _Titulo As String
    Public Property Titulo() As String
        Get
            Return _Titulo
        End Get
        Set(ByVal value As String)
            _Titulo = value
        End Set
    End Property

    Private _Archivo As String
    Public Property Archivo() As String
        Get
            Return _Archivo
        End Get
        Set(ByVal value As String)
            _Archivo = value
        End Set
    End Property


    Public Sub New(ByVal Titulo As String)
        Me.Titulo = Titulo
    End Sub

    Public Sub New(ByVal Titulo As String, ByVal Archivo As String)
        Me.Titulo = Titulo
        Me.Archivo = Archivo
    End Sub

    Sub New()

    End Sub

    Public Overrides Function ToString() As String
        Return Me.Titulo
    End Function

End Class
