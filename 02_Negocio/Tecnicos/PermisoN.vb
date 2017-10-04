Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class PermisoN

    Private _miMapper As New data.PermisoM
    Public Property miMapper() As data.PermisoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.PermisoM)
            _miMapper = value
        End Set
    End Property

    Private _miPermiso As New ent.Permiso
    Public Property miPermiso() As ent.Permiso
        Get
            Return _miPermiso
        End Get
        Set(ByVal value As ent.Permiso)
            _miPermiso = value
        End Set
    End Property

    Public Function Listar() As List(Of ent.Permiso)
        Try
            Return miMapper.Listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarIN(ByRef unaFamilia As ent.Familia) As List(Of ent.Permiso)
        Try
            Return miMapper.ListarIN(unaFamilia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarNOTIN(ByRef unaFamilia As ent.Familia) As List(Of ent.Permiso)
        Try
            Return miMapper.ListarNOTIN(unaFamilia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
