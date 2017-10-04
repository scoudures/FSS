Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class ColorM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listar() As List(Of ent.Color)
        Dim lista As New List(Of ent.Color)
        Try
            Dim dt As DataTable = miAcceso.leer("Color_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unColor As New ent.Color(fila("Color").ToString)
                lista.Add(unColor)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function getByCodigo(ByRef unColor As ent.Color) As ent.Color
        Dim miColor As New ent.Color
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miColor
    End Function
    Public Function Nuevo(ByRef unColor As ent.Color) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar(ByRef unColor As ent.Color) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unColor As ent.Color) As Integer
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
