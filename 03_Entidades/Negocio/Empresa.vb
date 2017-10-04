Public Class Empresa
    Private _cuit As String
    Public Property CUIT() As String
        Get
            Return _cuit
        End Get
        Set(ByVal value As String)
            _cuit = value
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
    Sub New()

    End Sub
End Class
