Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class PermisoM
    Dim miAcceso As New Acceso
    Public Function Listar() As List(Of ent.Permiso)
        Try
            Dim miLista As New List(Of ent.Permiso)
            Dim dt As DataTable = miAcceso.leer("Permiso_SelectAll")

            For Each fila As DataRow In dt.Rows
                Dim unPermiso As New ent.Permiso
                unPermiso.nombre = fila("permiso").ToString
                miLista.Add(unPermiso)
            Next
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarIN(ByRef unaFamilia As ent.Familia) As List(Of ent.Permiso)
        Try
            Dim miLista As New List(Of ent.Permiso)
            Dim parametros(0) As SqlParameter
            parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
            Dim dt As DataTable = miAcceso.leer("Permiso_SelectIN", parametros)

            For Each fila As DataRow In dt.Rows
                Dim unPermiso As New ent.Permiso
                unPermiso.nombre = fila("permiso").ToString
                miLista.Add(unPermiso)
            Next
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarNOTIN(ByRef unaFamilia As ent.Familia) As List(Of ent.Permiso)
        Try
            Dim miLista As New List(Of ent.Permiso)
            Dim parametros(0) As SqlParameter
            parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
            Dim dt As DataTable = miAcceso.leer("Permiso_SelectNOTIN", parametros)

            For Each fila As DataRow In dt.Rows
                Dim unPermiso As New ent.Permiso
                unPermiso.nombre = fila("permiso").ToString
                miLista.Add(unPermiso)
            Next
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
