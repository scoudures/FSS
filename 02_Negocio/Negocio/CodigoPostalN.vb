Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class CodigoPostalN
    Private _miMapper As New data.CodigoPostalM
    Public Property miMapper() As data.CodigoPostalM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.CodigoPostalM)
            _miMapper = value
        End Set
    End Property
    Private _miCodigoPostal As New ent.CodigoPostal
    Public Property miCodigoPostal() As ent.CodigoPostal
        Get
            Return _miCodigoPostal
        End Get
        Set(ByVal value As ent.CodigoPostal)
            _miCodigoPostal = value
        End Set
    End Property


    Public Function listar() As List(Of ent.CodigoPostal)
        Try
            Return miMapper.listar()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
