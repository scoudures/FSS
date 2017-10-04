Public Class Usuario

    Public misPermisos As New List(Of PermisoAbs)
    Public misPedidos As New List(Of PedidoCabeceraVista)
    Private _DNI As String
    Public Property DNI() As String
        Get
            Return _DNI
        End Get
        Set(ByVal value As String)
            _DNI = value
        End Set
    End Property
    Private _Nombre As String
    Public Property nombre() As String
        Get
            Return _Nombre
        End Get
        Set(ByVal value As String)
            _Nombre = value
        End Set
    End Property
    Private _Apellido As String
    Public Property apellido() As String
        Get
            Return _Apellido
        End Get
        Set(ByVal value As String)
            _Apellido = value
        End Set
    End Property
    Private _login As String
    Public Property login() As String
        Get
            Return _login
        End Get
        Set(ByVal value As String)
            _login = value
        End Set
    End Property
    Private _pass As String
    Public Property pass() As String
        Get
            Return _pass
        End Get
        Set(ByVal value As String)
            _pass = value
        End Set
    End Property

    Private _idioma As String
    Private _email As String
    Public Property email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property

    Public Property idioma() As String
        Get
            Return _idioma
        End Get
        Set(ByVal value As String)
            _idioma = value
        End Set
    End Property

    Public Sub AgregarPermiso(ByRef unPermiso As Permiso)
        misPermisos.Add(unPermiso)
    End Sub

    Public Sub QuitarPermiso(ByRef unPermiso As Permiso)
        misPermisos.Remove(unPermiso)
    End Sub
    Sub New()

    End Sub
End Class

