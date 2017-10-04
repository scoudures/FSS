Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class RecomendacionN
    Private _miMapper As New data.RecomendacionM
    Public Property miMapper() As data.RecomendacionM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.RecomendacionM)
            _miMapper = value
        End Set
    End Property
    Private _miRecomendacion As New ent.Recomendacion
    Public Property miRecomendacion() As ent.Recomendacion
        Get
            Return _miRecomendacion
        End Get
        Set(ByVal value As ent.Recomendacion)
            _miRecomendacion = value
        End Set
    End Property
    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(miRecomendacion)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
