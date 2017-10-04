Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class CodigoPostalM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function listar() As List(Of ent.CodigoPostal)
        Dim miLista As New List(Of ent.CodigoPostal)
        Try
            Dim dt As DataTable = miAcceso.leer("CodigoPostal_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unCP As New ent.CodigoPostal
                unCP.CPA = fila("CPA").ToString
                miLista.Add(unCP)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
End Class
