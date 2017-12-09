Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class BackupM
    Dim acceso As New Acceso
    Function listar() As List(Of ent.Backup)
        Dim lista As New List(Of ent.Backup)
        Try
            Dim param(0) As SqlParameter
            param(0) = acceso.constructor("@p1", My.Resources.Base)
            Dim unBKP As ent.Backup
            Dim dt As DataTable = acceso.leer("Backup_SelectAll", param, True)
            For Each fila As DataRow In dt.Rows
                If System.IO.File.Exists(fila("archivo")) Then
                    unBKP = New ent.Backup
                    unBKP.base = fila("base").ToString
                    unBKP.archivo = fila("archivo").ToString
                    unBKP.tamanio = fila("tamanioMB")
                    unBKP.inicio = fila("inicio")
                    unBKP.fin = fila("fin")
                    unBKP.descripcion = fila("descripcion").ToString
                    lista.Add(unBKP)
                End If
                If True Then
                End If
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Public Function HacerBackup() As Integer
        Dim resultado As Integer
        Try
            Dim param(1) As SqlParameter
            param(0) = acceso.constructor("@ruta", My.Resources.RutaBKP)
            param(1) = acceso.constructor("@dbname", My.Resources.Base)

            resultado = acceso.Escribir("HacerBackup", param, True, True, True)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Restaurar(unArchivo As String) As Integer
        Dim resultado As Integer
        Try
            Dim param(1) As SqlParameter
            param(0) = acceso.constructor("@dbname", My.Resources.Base)
            param(1) = acceso.constructor("@file", unArchivo)

            resultado = acceso.Escribir("RestaurarBackup", param, True, True, True)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Function listarCambios() As List(Of ent.Cambio)
        Dim lista As New List(Of ent.Cambio)
        Try
            Dim unCambio As ent.Cambio
            Dim dt As DataTable = acceso.leer("Cambios_SelectAll", Nothing, False)
            For Each fila As DataRow In dt.Rows
                unCambio = New ent.Cambio
                unCambio.fecha = CDate(fila("fecha"))
                unCambio.detalle = fila("detalle").ToString
                lista.Add(unCambio)

                If True Then
                End If
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
End Class
