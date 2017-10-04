Public Class Backup
    Private _base As String
    Public Property base() As String
        Get
            Return _base
        End Get
        Set(ByVal value As String)
            _base = value
        End Set
    End Property

    Private _archivo As String
    Public Property archivo() As String
        Get
            Return _archivo
        End Get
        Set(ByVal value As String)
            _archivo = value
        End Set
    End Property

    Private _tamanio As Double
    Public Property tamanio() As Double
        Get
            Return _tamanio
        End Get
        Set(ByVal value As Double)
            _tamanio = value
        End Set
    End Property

    Private _inicio As Date
    Public Property inicio() As Date
        Get
            Return _inicio
        End Get
        Set(ByVal value As Date)
            _inicio = value
        End Set
    End Property

    Private _fin As Date
    Public Property fin() As Date
        Get
            Return _fin
        End Get
        Set(ByVal value As Date)
            _fin = value
        End Set
    End Property

    Private _descripcion As String
    Public Property descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
