Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class SucesoN

    Private _miMapper As New data.SucesoM
    Public Property miMapper() As data.SucesoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.SucesoM)
            _miMapper = value
        End Set
    End Property

    Private _miSuceso As New ent.Suceso
    Public Property miSuceso() As ent.Suceso
        Get
            Return _miSuceso
        End Get
        Set(ByVal value As ent.Suceso)
            _miSuceso = value
        End Set
    End Property


    Public Function Listar() As List(Of _03_Entidades.Suceso)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarBitacora() As List(Of _03_Entidades.Suceso)
        Try
            Return miMapper.listarBotacora
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
