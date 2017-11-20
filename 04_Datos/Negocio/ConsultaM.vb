Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class ConsultaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function Nuevo(ByRef unaConsulta As ent.Consulta) As Integer
        Dim resultado As Integer
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@email", unaConsulta.email.ToString)
            params(1) = miAcceso.constructor("@Nivel", unaConsulta.nivel.ToString)
            params(2) = miAcceso.constructor("@Texto", unaConsulta.texto.ToString)
            resultado = miAcceso.Escribir("Consulta_Insert", params)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

End Class
