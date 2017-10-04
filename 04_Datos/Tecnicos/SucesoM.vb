Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class SucesoM
    Dim acceso As New Acceso
    Public Function listar() As List(Of ent.Suceso)
        Dim lista As New List(Of ent.Suceso)
        Try
            Dim unSuceso As ent.Suceso
            Dim dt As DataTable = Acceso.leer("Suceso_SelectAll")
            For Each fila As DataRow In dt.Rows
                unSuceso = New ent.Suceso
                unSuceso.codigo = fila("codigo")
                unSuceso.descripcion = fila("descripcion").ToString
                lista.Add(unSuceso)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listarBotacora() As List(Of ent.Suceso)
        Dim lista As New List(Of ent.Suceso)
        Try
            Dim unSuceso As ent.Suceso
            Dim dt As DataTable = acceso.leer("Suceso_SelectAllBitacora")
            For Each fila As DataRow In dt.Rows
                unSuceso = New ent.Suceso
                unSuceso.codigo = fila("codigo")
                unSuceso.descripcion = fila("descripcion").ToString
                lista.Add(unSuceso)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
End Class
