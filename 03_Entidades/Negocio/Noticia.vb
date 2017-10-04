Public Class Noticia

    Private _codigoNoticia As String
    Public Property CodigoNoticia() As String
        Get
            Return _codigoNoticia
        End Get
        Set(ByVal value As String)
            _codigoNoticia = value
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

    Private _Subtitulo As String
    Public Property Subtitulo() As String
        Get
            Return _Subtitulo
        End Get
        Set(ByVal value As String)
            _Subtitulo = value
        End Set
    End Property

    Private _Texto As String
    Public Property Texto() As String
        Get
            Return _Texto
        End Get
        Set(ByVal value As String)
            _Texto = value
        End Set
    End Property

    Private _RutaImagen As String
    Public Property RutaImagen() As String
        Get
            Return _RutaImagen
        End Get
        Set(ByVal value As String)
            _RutaImagen = value
        End Set
    End Property


    Public Sub New(ByVal Titulo As String, ByVal subtitulo As String, ByVal Texto As String)
        Me.Titulo = Titulo
        Me.Subtitulo = subtitulo
        Me.Texto = Texto

    End Sub

    Public Sub New(ByVal Titulo As String, ByVal subtitulo As String, ByVal Texto As String, ByVal RutaImagen As String)
        Me.Titulo = Titulo
        Me.Subtitulo = subtitulo
        Me.Texto = Texto
        Me.RutaImagen = RutaImagen
    End Sub

    Sub New()

    End Sub

    Public Overrides Function ToString() As String
        Return Me.Titulo
    End Function



End Class

