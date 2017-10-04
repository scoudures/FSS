Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class RecomendacionM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function Nuevo(ByRef unaRecomendacion As ent.Recomendacion) As Integer
        Dim resultado As Integer
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@email", unaRecomendacion.email.ToString)
            params(1) = miAcceso.constructor("@Nivel", unaRecomendacion.nivel.ToString)

            resultado = miAcceso.Escribir("Recomendacion_Insert", params)
            'miVerificador.DigitosPorTabla("Recomendacion")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
End Class
