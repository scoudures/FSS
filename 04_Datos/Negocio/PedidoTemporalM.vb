Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class PedidoTemporalM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function Listar(ByVal unPedido As ent.PedidoTemporal) As List(Of ent.ItemTemporal)
        Dim lista As New List(Of ent.ItemTemporal)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            Dim dt As DataTable = miAcceso.leer("PedidoTemporal_Listar", params)
            For Each fila As DataRow In dt.Rows
                Dim unItem As New ent.ItemTemporal
                unItem.inventario = CInt(fila("Inventario"))
                unItem.producto = fila("Producto").ToString
                unItem.cantidad = CInt(fila("Cantidad"))
                unItem.precioUnitario = CDbl(fila("PrecioUnitario"))
                unItem.subTotal = CDbl(fila("SubTotal"))
                unItem.talle.descripcion = fila("Talle").ToString
                lista.Add(unItem)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function AgregarItem(ByRef unPedido As ent.PedidoTemporal) As Integer
        Try
            Dim resultado As Integer
            Dim params(3) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login.ToString)
            params(1) = miAcceso.constructor("@Producto", CInt(unPedido.misItems(0).inventario))
            params(2) = miAcceso.constructor("@talle", unPedido.misItems(0).talle.descripcion.ToString)
            params(3) = miAcceso.constructor("@Cantidad", CInt(unPedido.misItems(0).cantidad))
            resultado = miAcceso.Escribir("PedidoTemporal_AgregarItem", params)
            'miVerificador.DigitosPorTabla("PedidoTemporal")
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function RemoverItem(ByRef unPedido As ent.PedidoTemporal) As Integer
        Try
            Dim resultado As Integer
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@Producto", CInt(unPedido.misItems(0).inventario))
            resultado = miAcceso.Escribir("PedidoTemporal_RemoverItem", params)
            'miVerificador.DigitosPorTabla("PedidoTemporal")
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ActualizarItem(ByRef unPedido As ent.PedidoTemporal) As Integer
        Try
            Dim resultado As Integer
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@Producto", CInt(unPedido.misItems(0).inventario))
            params(2) = miAcceso.constructor("@Cantidad", CInt(unPedido.misItems(0).cantidad))
            resultado = miAcceso.Escribir("PedidoTemporal_Update", params)
            'miVerificador.DigitosPorTabla("PedidoTemporal")
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function ContarItems(ByRef unPedido As ent.PedidoTemporal) As Integer
        Try
            Dim resultado As Integer
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@ItemCount", CInt(0))
            params(1).Direction = ParameterDirection.Output
            miAcceso.Escribir("PedidoTemporal_ContarItem", params)
            resultado = params(1).Value
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Total(ByRef unPedido As ent.PedidoTemporal) As Double
        Try
            Dim resultado As Integer
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@Total", CDbl(0.0))
            params(1).Direction = ParameterDirection.Output
            miAcceso.Escribir("PedidoTemporal_Total", params)
            resultado = params(1).Value
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

End Class
