Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class UsuarioN

    Private _miMapper As New data.UsuarioM
    Public Property miMapper() As data.UsuarioM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.UsuarioM)
            _miMapper = value
        End Set
    End Property

    Private _miUsuario As New ent.Usuario
    Public Property miUsuario() As ent.Usuario
        Get
            Return _miUsuario
        End Get
        Set(ByVal value As ent.Usuario)
            _miUsuario = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Usuario)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar2() As List(Of ent.Usuario)
        Try
            Return miMapper.listar2
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar(ByRef miUsuario As ent.Usuario) As List(Of ent.Usuario)
        Try
            Return miMapper.listar(miUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Todos() As List(Of ent.Usuario)
        Try
            Return miMapper.Todos()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function PerfilesIN(ByRef unUsuario As _03_Entidades.Usuario) As List(Of ent.PermisoAbs)
        Try
            Return miMapper.PerfilesIN(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function PerfilesNOTIN(ByRef unUsuario As _03_Entidades.Usuario) As List(Of ent.PermisoAbs)
        Try
            Return miMapper.PerfilesNOTIN(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Uno(ByRef unUsuario As ent.Usuario) As List(Of ent.Usuario)
        Try
            Return miMapper.Uno(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unUsuario As ent.Usuario) As Integer
        Try
            Return miMapper.Nuevo(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unUsuario As ent.Usuario) As Integer
        Try
            Return miMapper.Modificar(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unUsuario As ent.Usuario) As Integer
        Try
            Return miMapper.Eliminar(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function PerfilDesasignar(ByRef unUsuario As ent.Usuario, ByRef unPerfil As ent.Permiso) As Integer
        Try
            Return miMapper.PerfilDesasignar(unUsuario, unPerfil)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function PerfilAsignar(ByRef unUsuario As ent.Usuario, ByRef unPerfil As ent.Permiso) As Integer
        Try
            Return miMapper.PerfilAsignar(unUsuario, unPerfil)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function BuscarPermisos(ByRef unUsuario As ent.Usuario) As List(Of ent.PermisoAbs)
        Try
            Return miMapper.BuscarPermisos(unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function EsCliente(ByRef miUsuario As ent.Usuario) As Boolean
        Try
            Return miMapper.EsCliente(miUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function EsVendedor(ByRef miUsuario As ent.Usuario) As Boolean
        Try
            Return miMapper.EsVendedor(miUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
