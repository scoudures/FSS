Imports data = _04_Datos
Imports ent = _03_Entidades
Public Class TraductorN

    Private _miMapper As New data.TraductorM
    Public Property miMapper() As data.TraductorM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.TraductorM)
            _miMapper = value
        End Set
    End Property

    Public Function ObtenerLeyendaBD(idControl As String, ByRef unUsuario As ent.Usuario) As String
        Try
            Return miMapper.ObtenerLeyendaBD(idControl, unUsuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
