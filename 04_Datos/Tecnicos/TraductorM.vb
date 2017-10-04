Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class TraductorM
    Dim acceso As New Acceso
    Public Function ObtenerLeyendaBD(idControl As String, ByRef unUsuario As ent.Usuario) As String
        Dim leyenda As String = ""
        Try
            Dim param(1) As SqlParameter
            param(0) = Acceso.constructor("@p1", idControl)
            param(1) = Acceso.constructor("@p2", unUsuario.idioma)
            Dim dt As DataTable = Acceso.leer("Traduccion_Select", param)
            For Each fila As DataRow In dt.Rows
                'obtener la unica fila
                leyenda = fila("Texto").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return leyenda
    End Function
End Class
