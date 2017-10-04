Public MustInherit Class Formulario
    Private _letra As String
    Public Property letra() As String
        Get
            Return _letra
        End Get
        Set(ByVal value As String)
            _letra = value
        End Set
    End Property
    Private codSuc As Integer
    Public Property codigoSucursal() As Integer
        Get
            Return codSuc
        End Get
        Set(ByVal value As Integer)
            codSuc = value
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


    Public items As New List(Of Item)

    Private _cliente As Cliente
    Public Property cliente() As Cliente
        Get
            Return _cliente
        End Get
        Set(ByVal value As Cliente)
            _cliente = value
        End Set
    End Property

    Private _empresa As Empresa
    Public Property empresa() As Empresa
        Get
            Return _empresa
        End Get
        Set(ByVal value As Empresa)
            _empresa = value
        End Set
    End Property
    Private _emisor As Vendedor
    Public Property vendedor() As Vendedor
        Get
            Return _emisor
        End Get
        Set(ByVal value As Vendedor)
            _emisor = value
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
