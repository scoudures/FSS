Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class LineaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listar() As List(Of ent.Linea)
        Dim lista As New List(Of ent.Linea)
        Try
            Dim dt As DataTable = miAcceso.leer("Linea_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaLinea As New ent.Linea(fila("Linea").ToString)
                lista.Add(unaLinea)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function getByCodigo(ByRef unaLinea As ent.Linea) As ent.Linea
        Dim miLinea As New ent.Linea
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLinea
    End Function
    Public Function Nuevo(ByRef unaLinea As ent.Linea) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar(ByRef unaLinea As ent.Linea) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unaLinea As ent.Linea) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

End Class
