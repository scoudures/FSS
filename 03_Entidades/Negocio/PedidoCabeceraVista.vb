Public Class PedidoCabeceraVista
    Private _letra As String
    Public Property letra() As String
        Get
            Return _letra
        End Get
        Set(ByVal value As String)
            _letra = value
        End Set
    End Property

    Private codsuc As Integer
    Public Property codigoSucursal() As Integer
        Get
            Return codsuc
        End Get
        Set(ByVal value As Integer)
            codsuc = value
        End Set
    End Property

    Private _sucursal As String
    Public Property sucursal() As String
        Get
            Return _sucursal
        End Get
        Set(ByVal value As String)
            _sucursal = value
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
    Private _pedido As String
    Public Property pedido() As String
        Get
            Return _pedido
        End Get
        Set(ByVal value As String)
            _pedido = value
        End Set
    End Property


    Private fecEmision As Date
    Public Property fechaEmision() As Date
        Get
            Return fecEmision
        End Get
        Set(ByVal value As Date)
            fecEmision = value
        End Set
    End Property
    Private _fecVto As Date
    Public Property fechaVencimiento() As Date
        Get
            Return _fecVto
        End Get
        Set(ByVal value As Date)
            _fecVto = value
        End Set
    End Property
    Private cliDNI As String
    Public Property ClienteDNI() As String
        Get
            Return cliDNI
        End Get
        Set(ByVal value As String)
            cliDNI = value
        End Set
    End Property

    Private _cliente As String
    Public Property cliente() As String
        Get
            Return _cliente
        End Get
        Set(ByVal value As String)
            _cliente = value
        End Set
    End Property
    Private cliLogin As String
    Public Property Usuario() As String
        Get
            Return cliLogin
        End Get
        Set(ByVal value As String)
            cliLogin = value
        End Set
    End Property

    Private cliDomi As String
    Public Property Domicilio() As String
        Get
            Return cliDomi
        End Get
        Set(ByVal value As String)
            cliDomi = value
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
    Private _altura As Integer
    Public Property altura() As Integer
        Get
            Return _altura
        End Get
        Set(ByVal value As Integer)
            _altura = value
        End Set
    End Property
    Private _piso As Integer
    Public Property piso() As Integer
        Get
            Return _piso
        End Get
        Set(ByVal value As Integer)
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
    Private _localidad As String
    Public Property localidad() As String
        Get
            Return _localidad
        End Get
        Set(ByVal value As String)
            _localidad = value
        End Set
    End Property
    Private _provinci As String
    Public Property provincia() As String
        Get
            Return _provinci
        End Get
        Set(ByVal value As String)
            _provinci = value
        End Set
    End Property
    Private cp As String
    Public Property codigoPostal() As String
        Get
            Return cp
        End Get
        Set(ByVal value As String)
            cp = value
        End Set
    End Property
    Private _cuit As String
    Public Property CUIT() As String
        Get
            Return _cuit
        End Get
        Set(ByVal value As String)
            _cuit = value
        End Set
    End Property
    Private _empresa As String
    Public Property Empresa() As String
        Get
            Return _empresa
        End Get
        Set(ByVal value As String)
            _empresa = value
        End Set
    End Property
    Private razon As String
    Public Property razonSocial() As String
        Get
            Return razon
        End Get
        Set(ByVal value As String)
            razon = value
        End Set
    End Property
    Private inicio As Date
    Public Property inicioActividad() As Date
        Get
            Return inicio
        End Get
        Set(ByVal value As Date)
            inicio = value
        End Set
    End Property
    Private inbBrutos As Integer
    Public Property nroIngresosBrutos() As Integer
        Get
            Return inbBrutos
        End Get
        Set(ByVal value As Integer)
            inbBrutos = value
        End Set
    End Property
    Private _resp As Boolean
    Public Property responsableInscripto() As Boolean
        Get
            Return _resp
        End Get
        Set(ByVal value As Boolean)
            _resp = value
        End Set
    End Property
    Private _emisor As Integer
    Public Property emitidoPor() As Integer
        Get
            Return _emisor
        End Get
        Set(ByVal value As Integer)
            _emisor = value
        End Set
    End Property
    Private _vendedor As String
    Public Property vendedor() As String
        Get
            Return _vendedor
        End Get
        Set(ByVal value As String)
            _vendedor = value
        End Set
    End Property
    Private codEstadoForm As Integer
    Public Property CodigoEstadoFormulario() As Integer
        Get
            Return codEstadoForm
        End Get
        Set(ByVal value As Integer)
            codEstadoForm = value
        End Set
    End Property
    Private estForm As String
    Public Property EstadoFormulario() As String
        Get
            Return estForm
        End Get
        Set(ByVal value As String)
            estForm = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
