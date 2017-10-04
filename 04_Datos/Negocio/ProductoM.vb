Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class ProductoM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listarUno(ByRef miProducto As ent.Producto) As List(Of ent.Producto)
        Dim lista As New List(Of ent.Producto)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", miProducto.inventario)
            Dim dt As DataTable = miAcceso.leer("Producto_SelectByID", params)
            For Each fila As DataRow In dt.Rows
                Dim unProducto As New ent.Producto
                unProducto.inventario = CInt(fila("Inventario"))
                unProducto.linea = New ent.Linea(fila("LineaProducto").ToString)
                unProducto.marca = New ent.Marca(fila("Marca").ToString)
                unProducto.color = New ent.Color(fila("Color").ToString)
                'unProducto.talle = New ent.Talle(fila("Talle").ToString)
                'unProducto.stock = CInt(fila("Stock"))
                'unProducto.cantMaxPorPedido = CInt(fila("CantMaxPorPedido"))
                unProducto.imagen = (fila("ArchivoImagen").ToString)
                Dim unPrecio As New ent.Precio
                unPrecio.costo = CDbl(fila("Costo"))
                unPrecio.precioUnitario = CDbl(fila("PrecioUnitario"))
                'unPrecio.FechaDesde = CDate(fila("FechaDesde"))
                'unPrecio.maxPorcentajeDto = CInt(fila("maxPorcentajeDto"))
                unProducto.precio = unPrecio
                unProducto.descripcion = unProducto.linea.descripcion & " " & unProducto.marca.descripcion & " " & unProducto.color.descripcion
                lista.Add(unProducto)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar() As List(Of ent.Producto)
        Dim lista As New List(Of ent.Producto)
        Try

            Dim dt As DataTable = miAcceso.leer("Producto_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unProducto As New ent.Producto
                unProducto.inventario = CInt(fila("Inventario"))
                unProducto.linea = New ent.Linea(fila("LineaProducto").ToString)
                unProducto.marca = New ent.Marca(fila("Marca").ToString)
                unProducto.color = New ent.Color(fila("Color").ToString)
                'unProducto.talle = New ent.Talle(fila("Talle").ToString)
                'unProducto.stock = CInt(fila("Stock"))
                'unProducto.cantMaxPorPedido = CInt(fila("CantMaxPorPedido"))
                unProducto.imagen = (fila("ArchivoImagen").ToString)
                Dim unPrecio As New ent.Precio
                unPrecio.costo = CDbl(fila("Costo"))
                unPrecio.precioUnitario = CDbl(fila("PrecioUnitario"))
                'unPrecio.FechaDesde = CDate(fila("FechaDesde"))
                'unPrecio.maxPorcentajeDto = CInt(fila("maxPorcentajeDto"))
                unProducto.precio = unPrecio
                unProducto.descripcion = unProducto.linea.descripcion & " " & unProducto.marca.descripcion & " " & unProducto.color.descripcion
                'unProducto.nivel = fila("Nivel").ToString
                'unProducto.cantidadVendida = CInt(fila("cantidadVendida"))
                lista.Add(unProducto)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listarConNiveles() As List(Of ent.Producto)
        Dim lista As New List(Of ent.Producto)
        Try

            Dim dt As DataTable = miAcceso.leer("Producto_SelectAllByNivel")
            For Each fila As DataRow In dt.Rows
                Dim unProducto As New ent.Producto
                unProducto.inventario = CInt(fila("Inventario"))
                unProducto.linea = New ent.Linea(fila("LineaProducto").ToString)
                unProducto.marca = New ent.Marca(fila("Marca").ToString)
                unProducto.color = New ent.Color(fila("Color").ToString)
                'unProducto.talle = New ent.Talle(fila("Talle").ToString)
                'unProducto.stock = CInt(fila("Stock"))
                'unProducto.cantMaxPorPedido = CInt(fila("CantMaxPorPedido"))
                unProducto.imagen = (fila("ArchivoImagen").ToString)
                Dim unPrecio As New ent.Precio
                unPrecio.costo = CDbl(fila("Costo"))
                unPrecio.precioUnitario = CDbl(fila("PrecioUnitario"))
                'unPrecio.FechaDesde = CDate(fila("FechaDesde"))
                'unPrecio.maxPorcentajeDto = CInt(fila("maxPorcentajeDto"))
                unProducto.precio = unPrecio
                unProducto.descripcion = unProducto.linea.descripcion & " " & unProducto.marca.descripcion & " " & unProducto.color.descripcion
                unProducto.nivel = fila("Nivel").ToString
                unProducto.cantidadVendida = CInt(fila("cantidadVendida"))
                lista.Add(unProducto)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar(ByRef unaLinea As ent.Linea) As List(Of ent.Producto)
        Dim lista As New List(Of ent.Producto)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@linea", unaLinea.descripcion)
            Dim dt As DataTable = miAcceso.leer("Producto_SelectAllxLinea", params)
            For Each fila As DataRow In dt.Rows
                Dim unProducto As New ent.Producto
                unProducto.inventario = CInt(fila("Inventario"))
                unProducto.linea = New ent.Linea(fila("LineaProducto").ToString)
                unProducto.marca = New ent.Marca(fila("Marca").ToString)
                unProducto.color = New ent.Color(fila("Color").ToString)
                'unProducto.talle = New ent.Talle(fila("Talle").ToString)
                'unProducto.stock = CInt(fila("Stock"))
                'unProducto.cantMaxPorPedido = CInt(fila("CantMaxPorPedido"))
                unProducto.imagen = (fila("ArchivoImagen").ToString)
                Dim unPrecio As New ent.Precio
                'unPrecio.costo = CDbl(fila("Costo"))
                unPrecio.precioUnitario = CDbl(fila("PrecioUnitario"))
                'unPrecio.FechaDesde = CDate(fila("FechaDesde"))
                'unPrecio.maxPorcentajeDto = CInt(fila("maxPorcentajeDto"))
                unProducto.precio = unPrecio
                unProducto.descripcion = unProducto.linea.descripcion & " " & unProducto.marca.descripcion & " " & unProducto.color.descripcion
                lista.Add(unProducto)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function


    Public Function Nuevo(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(8) As SqlParameter
            params(0) = miAcceso.constructor("@linea", unProducto.linea.descripcion)
            params(1) = miAcceso.constructor("@marca", unProducto.marca.descripcion)
            params(2) = miAcceso.constructor("@color", unProducto.color.descripcion)
            params(3) = miAcceso.constructor("@cantmax", unProducto.cantMaxPorPedido)
            params(4) = miAcceso.constructor("@imagen", unProducto.imagen)
            params(5) = miAcceso.constructor("@costo", unProducto.precio.costo)
            params(6) = miAcceso.constructor("@precio", unProducto.precio.precioUnitario)
            params(7) = miAcceso.constructor("@nivel", unProducto.nivel.ToString)
            params(8) = miAcceso.constructor("@inventario", CInt(0))
            params(8).Direction = ParameterDirection.Output
            resultado = miAcceso.Escribir("Producto_Insert", params)
            unProducto.inventario = params(8).Value
            'miVerificador.DigitosPorTabla("Producto")
            'miVerificador.DigitosPorTabla("Producto_Precio")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(6) As SqlParameter
            params(0) = miAcceso.constructor("@linea", unProducto.linea.descripcion)
            params(1) = miAcceso.constructor("@marca", unProducto.marca.descripcion)
            params(2) = miAcceso.constructor("@color", unProducto.color.descripcion)
            params(3) = miAcceso.constructor("@cantmax", unProducto.cantMaxPorPedido)
            params(4) = miAcceso.constructor("@imagen", unProducto.imagen)
            params(5) = miAcceso.constructor("@costo", unProducto.precio.costo)
            params(6) = miAcceso.constructor("@precio", unProducto.precio.precioUnitario)
            resultado = miAcceso.Escribir("Producto_Update", params)
            'miVerificador.DigitosPorTabla("Producto")
            'miVerificador.DigitosPorTabla("Producto_Precio")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Modificar2(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(7) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            params(1) = miAcceso.constructor("@linea", unProducto.linea.descripcion)
            params(2) = miAcceso.constructor("@marca", unProducto.marca.descripcion)
            params(3) = miAcceso.constructor("@color", unProducto.color.descripcion)
            params(4) = miAcceso.constructor("@cantmax", unProducto.cantMaxPorPedido)
            params(5) = miAcceso.constructor("@imagen", unProducto.imagen)
            params(6) = miAcceso.constructor("@costo", unProducto.precio.costo)
            params(7) = miAcceso.constructor("@precio", unProducto.precio.precioUnitario)
            resultado = miAcceso.Escribir("Producto_Update2", params)
            'miVerificador.DigitosPorTabla("Producto")
            'miVerificador.DigitosPorTabla("Producto_Precio")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            resultado = miAcceso.Escribir("Producto_Delete", params)
            'miVerificador.DigitosPorTabla("Producto")
            'miVerificador.DigitosPorTabla("Producto_Precio")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DameStockDe(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            params(1) = miAcceso.constructor("@talle", unProducto.talle.descripcion)
            params(2) = miAcceso.constructor("@stock", CInt(0))
            params(2).Direction = ParameterDirection.Output
            miAcceso.Escribir("Producto_ConsultarStock", params)
            resultado = params(2).Value
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DescontarStockDe(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(3) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", unProducto.inventario)
            params(1) = miAcceso.constructor("@talle", unProducto.talle.descripcion.ToString)
            params(2) = miAcceso.constructor("@cant", CInt(unProducto.cantMaxPorPedido))
            params(3) = miAcceso.constructor("@stock", CInt(0))
            params(3).Direction = ParameterDirection.Output
            miAcceso.Escribir("Producto_DescontarStock", params)
            resultado = params(3).Value
            'miVerificador.DigitosPorTabla("Producto")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ActualizarStockDe(ByRef unProducto As ent.Producto) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@inventario", CInt(unProducto.inventario))
            params(1) = miAcceso.constructor("@talle", unProducto.talle.descripcion.ToString)
            params(2) = miAcceso.constructor("@stock", CInt(unProducto.talle.stock))
            resultado = miAcceso.Escribir("Producto_ActualizarStock", params)
            'miVerificador.DigitosPorTabla("Producto")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
End Class
