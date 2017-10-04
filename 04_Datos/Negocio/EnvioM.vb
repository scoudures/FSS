Imports ent = _03_Entidades
Imports System.Data.SqlClient
Public Class EnvioM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function listarFormas() As List(Of ent.Envio)
        Dim miLista As New List(Of ent.Envio)
        Try
            Dim dt As DataTable = miAcceso.leer("EnvioTipo_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaFE As New ent.Envio
                unaFE.descripcion = fila("FormaEnvio").ToString
                miLista.Add(unaFE)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
    Public Function Nuevo(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer
            Try
            Dim params(11) As SqlParameter
            params(0) = miAcceso.constructor("@login", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@sucursal", CInt(unPedido.codigoSucursal))
            params(2) = miAcceso.constructor("@numero", unPedido.numero)
            params(3) = miAcceso.constructor("@envioTipo", unPedido.envio.descripcion)
            params(4) = miAcceso.constructor("@domTipo", unPedido.domicilio.descripcion)
            params(5) = miAcceso.constructor("@domCalle", unPedido.domicilio.calle)
            params(6) = miAcceso.constructor("@domNro", CInt(unPedido.domicilio.numero))
            params(7) = miAcceso.constructor("@domPiso", unPedido.domicilio.piso.ToString)
            params(8) = miAcceso.constructor("@domDepto", unPedido.domicilio.departamento)
            params(9) = miAcceso.constructor("@localidad", unPedido.domicilio.localidad.localidad)
            params(10) = miAcceso.constructor("@provincia", unPedido.domicilio.provincia.provincia)
            params(11) = miAcceso.constructor("@codPostal", unPedido.domicilio.codigoPostal.CPA)
            resultado = miAcceso.Escribir("Envio_Insert", params)
            'miVerificador.DigitosPorTabla("Envio")
            'miVerificador.DigitosPorTabla("Domicilio")
            Catch ex As ent.miClaseExcepcion
                Throw ex
            Catch ex2 As Exception
                Throw ex2
            End Try
            Return resultado
    End Function
End Class
