Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class BitacoraN

    Private _miMapper As New data.BitacoraM
    Public Property miMapper() As data.BitacoraM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.BitacoraM)
            _miMapper = value
        End Set
    End Property

    Private _miBitacora As New ent.Bitacora
    Public Property miBitacora() As ent.Bitacora
        Get
            Return _miBitacora
        End Get
        Set(ByVal value As ent.Bitacora)
            _miBitacora = value
        End Set
    End Property

    Public Function Listar(ByVal fechaDesde As String, ByVal fechaHasta As String, ByVal suceso As String, ByVal usuario As String) As List(Of ent.Bitacora)
        Try
            Return miMapper.listar(fechaDesde, fechaHasta, suceso, usuario)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Listar() As List(Of ent.Bitacora)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
