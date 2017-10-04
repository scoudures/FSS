Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class NivelM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listar() As List(Of ent.Nivel)
        Dim lista As New List(Of ent.Nivel)
        Try
            Dim dt As DataTable = miAcceso.leer("Nivel_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unNivel As New ent.Nivel
                unNivel.descripcion = fila("Descripcion").ToString
                lista.Add(unNivel)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar(ByRef unProducto As ent.Producto) As List(Of ent.Nivel)
        Dim lista As New List(Of ent.Nivel)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            Dim dt As DataTable = miAcceso.leer("Producto_Niveles", params)
            For Each fila As DataRow In dt.Rows
                Dim unNivel As New ent.Nivel
                unNivel.descripcion = fila("Nivel").ToString
                lista.Add(unNivel)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function getByCodigo(ByRef unNivel As ent.Nivel) As ent.Nivel
        Dim miNivel As New ent.Nivel
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miNivel
    End Function
    Public Function Nuevo(ByRef unNivel As ent.Nivel) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar(ByRef unNivel As ent.Nivel) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unNivel As ent.Nivel) As Integer
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
