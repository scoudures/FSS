Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class Mensajero

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

    Public Sub EscribirBitacora(ByVal tipoSuceso As String, ByVal usuario As String, ByVal descripcion As String)
        'Try
        Dim miBitacoraE As New ent.Bitacora
        miBitacoraE.suceso = tipoSuceso
        miBitacoraE.usuario = usuario
        miBitacoraE.descripcion = descripcion
        miMapper.guardar(miBitacoraE)
        'Catch ex As ent.miClaseExcepcion
        '    Throw ex
        'Catch ex2 As Exception
        '    Throw ex2
        'End Try
    End Sub
    Public Sub Reset()
        Try
            miMapper.reset()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
End Class