Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class MarcaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listar() As List(Of ent.Marca)
        Dim lista As New List(Of ent.Marca)
        Try
            Dim dt As DataTable = miAcceso.leer("Marca_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaMarca As New ent.Marca(fila("Marca").ToString)
                lista.Add(unaMarca)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function getByCodigo(ByRef unaMarca As ent.Marca) As ent.Marca
        Dim miMarca As New ent.Marca
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miMarca
    End Function
    Public Function Nuevo(ByRef unaMarca As ent.Marca) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar(ByRef unaMarca As ent.Marca) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unaMarca As ent.Marca) As Integer
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
