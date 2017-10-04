Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class LocalidadM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function listar() As List(Of ent.Localidad)
        Dim miLista As New List(Of ent.Localidad)
        Try
            Dim dt As DataTable = miAcceso.leer("Localidad_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaloc As New ent.Localidad
                unaloc.localidad = fila("Localidad").ToString
                miLista.Add(unaloc)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
End Class
