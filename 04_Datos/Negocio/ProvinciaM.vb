Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class ProvinciaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function listar() As List(Of ent.Provincia)
        Dim miLista As New List(Of ent.Provincia)
        Try
            Dim dt As DataTable = miAcceso.leer("Provincia_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaProv As New ent.Provincia
                unaProv.provincia = fila("Provincia").ToString
                miLista.Add(unaProv)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
End Class
