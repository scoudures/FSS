Public MustInherit Class PermisoAbs
    Public misPermisos As New List(Of PermisoAbs)

    Private _codigo As Integer
    Public Property codigo() As Integer
        Get
            Return _codigo
        End Get
        Set(ByVal value As Integer)
            _codigo = value
        End Set
    End Property

    Private _nombre As String
    Public Property nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Private selecc As Boolean
    Public Property seleccionado() As Boolean
        Get
            Return selecc
        End Get
        Set(ByVal value As Boolean)
            selecc = value
        End Set
    End Property

    Private _estado As Boolean
    Public Property estado() As Boolean
        Get
            Return _estado
        End Get
        Set(ByVal value As Boolean)
            _estado = value
        End Set
    End Property
    
    Private _visible As Boolean
    Public Property visible() As Boolean
        Get
            Return _visible
        End Get
        Set(ByVal value As Boolean)
            _visible = value
        End Set
    End Property

    Public MustOverride Function RealizarOperacion() As Integer
    Public MustOverride Function QueSos() As Integer
End Class
