Public Class Domicilio
    Private _desc As String
    Public Property descripcion() As String
        Get
            Return _desc
        End Get
        Set(ByVal value As String)
            _desc = value
        End Set
    End Property
    Private _calle As String
    Public Property calle() As String
        Get
            Return _calle
        End Get
        Set(ByVal value As String)
            _calle = value
        End Set
    End Property
    Private _numero As Integer
    Public Property numero() As Integer
        Get
            Return _numero
        End Get
        Set(ByVal value As Integer)
            _numero = value
        End Set
    End Property
    Private _piso As String
    Public Property piso() As String
        Get
            Return _piso
        End Get
        Set(ByVal value As String)
            _piso = value
        End Set
    End Property
    Private _depto As String
    Public Property departamento() As String
        Get
            Return _depto
        End Get
        Set(ByVal value As String)
            _depto = value
        End Set
    End Property
    Private _localidad As localidad
    Public Property localidad() As Localidad
        Get
            Return _localidad
        End Get
        Set(ByVal value As Localidad)
            _localidad = value
        End Set
    End Property
    Private _provinci As Provincia
    Public Property provincia() As Provincia
        Get
            Return _provinci
        End Get
        Set(ByVal value As Provincia)
            _provinci = value
        End Set
    End Property
    Private cp As CodigoPostal
    Public Property codigoPostal() As CodigoPostal
        Get
            Return cp
        End Get
        Set(ByVal value As CodigoPostal)
            cp = value
        End Set
    End Property
    Sub New()
        Me.localidad = New Localidad
        Me.provincia = New Provincia
        Me.codigoPostal = New CodigoPostal
    End Sub

End Class
