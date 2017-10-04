Imports ent = _03_Entidades
Imports data = _04_Datos
Imports System.Text

Public Class VerificadorN

    Private _miMapper As New data.Verificador
    Public Property miMapper() As data.Verificador
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.Verificador)
            _miMapper = value
        End Set
    End Property

    Public Function controlaTablasV(ByRef tablaErr As StringBuilder) As Boolean
        Try
            Return miMapper.controlaTablasV(tablaErr)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function controlaTablasH(ByRef tablaErr As StringBuilder, ByRef filaError As StringBuilder) As Boolean
        Try
            Return miMapper.controlaTablasH(tablaErr, filaError)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Sub generarDigitos()
        Try
            miMapper.generarDigitos()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
End Class
