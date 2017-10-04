Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class TalleM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listar() As List(Of ent.Talle)
        Dim lista As New List(Of ent.Talle)
        Try
            Dim dt As DataTable = miAcceso.leer("Talle_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unTalle As New ent.Talle(fila("Talle").ToString)
                lista.Add(unTalle)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar(ByRef unProducto As ent.Producto) As List(Of ent.Talle)
        Dim lista As New List(Of ent.Talle)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            Dim dt As DataTable = miAcceso.leer("Producto_Talles", params)
            For Each fila As DataRow In dt.Rows
                Dim unTalle As New ent.Talle(fila("Talle").ToString)
                unTalle.codigo = CInt(fila("CodTalle"))
                lista.Add(unTalle)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function getByCodigo(ByRef unTalle As ent.Talle) As ent.Talle
        Dim miTalle As New ent.Talle
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miTalle
    End Function
    Public Function Nuevo(ByRef unTalle As ent.Talle) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar(ByRef unTalle As ent.Talle) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unTalle As ent.Talle) As Integer
        Dim resultado As Integer = 0
        Try

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function listarPorLinea(ByRef unProducto As ent.Producto) As List(Of ent.TalleVista)
        Dim lista As New List(Of ent.TalleVista)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            Dim dt As DataTable = miAcceso.leer("Talle_SelectAllxProducto", params)
            For Each fila As DataRow In dt.Rows
                Dim unTalle As New ent.TalleVista
                unTalle.inventario = CInt(fila("Inventario"))
                unTalle.talle = fila("Talle")
                unTalle.stock = CInt(fila("Stock"))
                lista.Add(unTalle)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
End Class
