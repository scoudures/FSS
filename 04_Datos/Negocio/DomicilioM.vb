Imports ent = _03_Entidades
Imports System.Data.SqlClient

Public Class DomicilioM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function listarTipos() As List(Of ent.Domicilio)
        Dim miLista As New List(Of ent.Domicilio)
        Try
            Dim dt As DataTable = miAcceso.leer("DomicilioTipo_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unTD As New ent.Domicilio
                unTD.descripcion = fila("DomicilioTipo").ToString
                miLista.Add(unTD)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
End Class
