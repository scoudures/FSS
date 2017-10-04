Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class PagoM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function Nuevo(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer
        Try
            Dim params(8) As SqlParameter
            params(0) = miAcceso.constructor("@login", unPedido.cliente.login.ToString)
            params(1) = miAcceso.constructor("@tipoFormulario", "Pedido")
            params(2) = miAcceso.constructor("@sucursalFormulario", unPedido.sucursal)
            params(3) = miAcceso.constructor("@numeroFormulario", unPedido.numero)
            params(4) = miAcceso.constructor("@pagoTipo", unPedido.pago.descripcion.ToString)
            params(5) = miAcceso.constructor("@numero", unPedido.pago.numero.ToString)
            params(6) = miAcceso.constructor("@vencimiento", unPedido.pago.vencimiento.ToString)
            params(7) = miAcceso.constructor("@cantCuotas", CInt(unPedido.pago.cuotas))
            params(8) = miAcceso.constructor("@subtotal", CDbl(unPedido.pago.total))
            resultado = miAcceso.Escribir("Pago_Insert", params)
            'miVerificador.DigitosPorTabla("MedioPago")
            'miVerificador.DigitosPorTabla("Pago")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

End Class
