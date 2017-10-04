Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class PedidoM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function Nuevo(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unPedido.cliente.login)
            params(1) = miAcceso.constructor("@nro", CInt(0))
            params(1).Direction = ParameterDirection.Output
            miAcceso.Escribir("Pedido_Insert", params)
            resultado = params(1).Value
            'miVerificador.DigitosPorTabla("Formulario_CAB")
            'miVerificador.DigitosPorTabla("Formulario_DET")
            'miVerificador.DigitosPorTabla("PedidoTemporal")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ContarPedidosDe(ByRef unCliente As ent.Cliente) As Integer
        Try
            Dim resultado As Integer
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unCliente.login)
            params(1) = miAcceso.constructor("@Contar", CInt(0))
            params(1).Direction = ParameterDirection.Output
            miAcceso.Escribir("PedidoCabecera_ContarByCliente", params)
            resultado = params(1).Value
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarPedidosDe(ByRef unCliente As ent.Cliente) As List(Of ent.Pedido)
        Dim lista As New List(Of ent.Pedido)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unCliente.login)
            Dim dt As DataTable = miAcceso.leer("PedidoCabecera_SelectAllByCliente", params)
            For Each fila As DataRow In dt.Rows
                Dim unPedido As New ent.Pedido
                unPedido.letra = fila("Letra").ToString
                unPedido.codigoSucursal = CInt(fila("Sucursal"))
                unPedido.sucursal = fila("SucursalVenta").ToString
                unPedido.numero = CInt(fila("Numero"))
                unPedido.fechaEmision = CDate(fila("FecEmision"))
                unPedido.fechaVencimiento = CDate(fila("FecVto").ToString)
                unPedido.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unPedido.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unPedido.cliente = New ent.Cliente
                unPedido.cliente.DNI = fila("DNI").ToString
                unPedido.cliente.apellido = fila("Apellido").ToString
                unPedido.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unPedido.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unPedido.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unPedido.cliente.domicilio.calle = fila("calle").ToString
                    unPedido.cliente.domicilio.numero = CInt(fila("nro"))
                    unPedido.cliente.domicilio.piso = CInt(fila("piso"))
                    unPedido.cliente.domicilio.departamento = fila("depto").ToString
                    unPedido.cliente.domicilio.localidad = New ent.Localidad
                    unPedido.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unPedido.cliente.domicilio.provincia = New ent.Provincia
                    unPedido.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unPedido.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unPedido.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unPedido.empresa = New ent.Empresa
                unPedido.empresa.CUIT = fila("CUIT").ToString
                unPedido.empresa.nombre = fila("NombreFantasia").ToString
                unPedido.empresa.razonSocial = fila("RazonSocial").ToString
                unPedido.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unPedido.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unPedido.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unPedido.vendedor = New ent.Vendedor
                unPedido.vendedor.codigo = CInt(fila("EmitidoPor"))
                unPedido.vendedor.login = fila("vendedor").ToString
                lista.Add(unPedido)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function ListarTodos() As List(Of ent.Pedido)
        Dim lista As New List(Of ent.Pedido)
        Try
            Dim dt As DataTable = miAcceso.leer("PedidoCabecera_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unPedido As New ent.Pedido
                unPedido.letra = fila("Letra").ToString
                unPedido.codigoSucursal = CInt(fila("Sucursal"))
                unPedido.sucursal = fila("SucursalVenta").ToString
                unPedido.numero = CInt(fila("Numero"))
                unPedido.fechaEmision = CDate(fila("FecEmision"))
                unPedido.fechaVencimiento = CDate(fila("FecVto").ToString)
                unPedido.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unPedido.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unPedido.cliente = New ent.Cliente
                unPedido.cliente.DNI = fila("DNI").ToString
                unPedido.cliente.apellido = fila("Apellido").ToString
                unPedido.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unPedido.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unPedido.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unPedido.cliente.domicilio.calle = fila("calle").ToString
                    unPedido.cliente.domicilio.numero = CInt(fila("nro"))
                    unPedido.cliente.domicilio.piso = CInt(fila("piso"))
                    unPedido.cliente.domicilio.departamento = fila("depto").ToString
                    unPedido.cliente.domicilio.localidad = New ent.Localidad
                    unPedido.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unPedido.cliente.domicilio.provincia = New ent.Provincia
                    unPedido.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unPedido.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unPedido.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unPedido.empresa = New ent.Empresa
                unPedido.empresa.CUIT = fila("CUIT").ToString
                unPedido.empresa.nombre = fila("NombreFantasia").ToString
                unPedido.empresa.razonSocial = fila("RazonSocial").ToString
                unPedido.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unPedido.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unPedido.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unPedido.vendedor = New ent.Vendedor
                unPedido.vendedor.codigo = CInt(fila("EmitidoPor"))
                unPedido.vendedor.login = fila("vendedor").ToString
                lista.Add(unPedido)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Sub DameEstadoDe(ByRef unPedido As ent.Pedido)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unPedido.numero)
            Dim dt As DataTable = miAcceso.leer("PedidoCabecera_SelectByID", params)
            For Each fila As DataRow In dt.Rows
                unPedido.letra = fila("Letra").ToString
                unPedido.codigoSucursal = CInt(fila("Sucursal"))
                unPedido.sucursal = fila("SucursalVenta").ToString
                unPedido.numero = CInt(fila("Numero"))
                unPedido.fechaEmision = CDate(fila("FecEmision"))
                unPedido.fechaVencimiento = CDate(fila("FecVto").ToString)
                unPedido.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unPedido.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unPedido.cliente = New ent.Cliente
                unPedido.cliente.DNI = fila("DNI").ToString
                unPedido.cliente.apellido = fila("Apellido").ToString
                unPedido.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unPedido.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unPedido.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unPedido.cliente.domicilio.calle = fila("calle").ToString
                    unPedido.cliente.domicilio.numero = CInt(fila("nro"))
                    unPedido.cliente.domicilio.piso = CInt(fila("piso"))
                    unPedido.cliente.domicilio.departamento = fila("depto").ToString
                    unPedido.cliente.domicilio.localidad = New ent.Localidad
                    unPedido.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unPedido.cliente.domicilio.provincia = New ent.Provincia
                    unPedido.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unPedido.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unPedido.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unPedido.empresa = New ent.Empresa
                unPedido.empresa.CUIT = fila("CUIT").ToString
                unPedido.empresa.nombre = fila("NombreFantasia").ToString
                unPedido.empresa.razonSocial = fila("RazonSocial").ToString
                unPedido.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unPedido.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unPedido.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unPedido.vendedor = New ent.Vendedor
                unPedido.vendedor.codigo = CInt(fila("EmitidoPor"))
                unPedido.vendedor.login = fila("vendedor").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
    Public Function ListarDetalleDe(ByRef unPedido As ent.Pedido) As List(Of ent.Item)
        Dim miLista As New List(Of ent.Item)
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@tipo", CInt(2))
            params(1) = miAcceso.constructor("@Sucursal", unPedido.codigoSucursal)
            params(2) = miAcceso.constructor("@Numero", unPedido.numero)
            Dim dt As DataTable = miAcceso.leer("PedidoDetalle_SelectByCabecera", params)
            For Each fila As DataRow In dt.Rows
                Dim unItem As New ent.Item
                unItem.numero = CInt(fila("Item"))
                unItem.cantidad = CInt(fila("cantidad"))
                unItem.producto = New ent.Producto
                unItem.producto.inventario = CInt(fila("Inventario"))
                unItem.producto.linea = New ent.Linea
                unItem.producto.linea.descripcion = fila("LineaProducto").ToString
                unItem.producto.marca = New ent.Marca
                unItem.producto.marca.descripcion = fila("Marca").ToString
                unItem.producto.color = New ent.Color
                unItem.producto.color.descripcion = fila("Color").ToString
                unItem.producto.talle = New ent.Talle
                unItem.talle.descripcion = fila("Talle").ToString
                unItem.producto.stock = CInt(fila("Stock"))
                unItem.producto.cantMaxPorPedido = CInt(fila("CantMaxPorPedido"))
                unItem.producto.imagen = fila("ArchivoImagen").ToString
                unItem.producto.precio = New ent.Precio
                unItem.producto.precio.costo = CDbl(fila("costo"))
                unItem.producto.precio.FechaDesde = CDate(fila("FechaDesde"))
                unItem.producto.precio.maxPorcentajeDto = CInt(fila("MaxPorcentajeDto"))
                unItem.producto.precio.precioUnitario = CDbl(fila("precioUnitario"))
                ArmarDescripcion(unItem.producto)
                unItem.descripcion = unItem.producto.descripcion
                miLista.Add(unItem)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
    Private Sub ArmarDescripcion(ByRef unProducto As ent.Producto)
        Dim descripcion As String = ""
        Try
            Dim linea As String = unProducto.linea.descripcion
            Dim marca As String = unProducto.marca.descripcion
            Dim color As String = unProducto.color.descripcion
            Dim talle As String = unProducto.talle.descripcion
            If linea <> "Otro" Then
                descripcion = descripcion & linea
            End If
            If marca <> "Otro" Then
                descripcion = descripcion & " " & marca
            End If
            If color <> "Otro" Then
                descripcion = descripcion & " " & color
            End If
            If talle <> "Otro" Then
                descripcion = descripcion & " " & talle
            End If
            unProducto.descripcion = descripcion
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
    Public Function CambiarEstado(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer
        Try
            Dim params(3) As SqlParameter
            params(0) = miAcceso.constructor("@Tipo", CInt(2))
            params(1) = miAcceso.constructor("@Sucursal", CInt(unPedido.codigoSucursal))
            params(2) = miAcceso.constructor("@Numero", CInt(unPedido.numero))
            params(3) = miAcceso.constructor("@Estado", unPedido.EstadoFormulario.ToString)
            resultado = miAcceso.Escribir("Pedido_CambiarEstado", params)
            'miVerificador.DigitosPorTabla("Formulario_CAB")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@Tipo", CInt(2))
            params(1) = miAcceso.constructor("@Sucursal", CInt(unPedido.codigoSucursal))
            params(2) = miAcceso.constructor("@Numero", CInt(unPedido.numero))
            resultado = miAcceso.Escribir("Pedido_Delete", params)
            'miVerificador.DigitosPorTabla("Formulario_CAB")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DameNroFacturaDe(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unPedido.numero)
            params(1) = miAcceso.constructor("@nroFact", CInt(0))
            params(1).Direction = ParameterDirection.Output
            params(2) = miAcceso.constructor("@fecha", CDate(Now))
            params(2).Direction = ParameterDirection.Output
            miAcceso.Escribir("Pedido_NroFactura", params)
            unPedido.fechaEmision = params(2).Value
            resultado = params(1).Value
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DameCantCuotasDe(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unPedido.numero)
            params(1) = miAcceso.constructor("@cuotas", CInt(0))
            params(1).Direction = ParameterDirection.Output
            params(2) = miAcceso.constructor("@recargo", CInt(0))
            params(2).Direction = ParameterDirection.Output
            miAcceso.Escribir("Pedido_Cuotas", params)
            unPedido.pago.cuotas = params(1).Value
            unPedido.pago.porcentRecargo = params(2).Value
            resultado = params(1).Value
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DamePagoDe(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unPedido.numero)
            Dim dt As DataTable = miAcceso.leer("Pedido_Pago", params)
            For Each fila As DataRow In dt.Rows
                unPedido.pago.numero = CInt(fila("idPago"))
                unPedido.pago.cuotas = fila("cantidadCuotas")
                unPedido.pago.porcentRecargo = fila("Recargo")
            Next
            resultado = 1
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function DameEnvioDe(ByRef unPedido As ent.Pedido) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unPedido.numero)
            Dim dt As DataTable = miAcceso.leer("Pedido_Envio", params)
            For Each fila As DataRow In dt.Rows
                unPedido.envio.numero = CInt(fila("NumeroEnvio"))
                unPedido.domicilio.calle = fila("Calle")
                unPedido.domicilio.numero = CInt(fila("nro"))
                unPedido.domicilio.piso = fila("piso")
                unPedido.domicilio.departamento = fila("Depto")
                unPedido.domicilio.localidad.localidad = fila("Localidad")
                unPedido.domicilio.provincia.provincia = fila("Provincia")
                unPedido.domicilio.codigoPostal.CPA = fila("CPA")
            Next
            resultado = 1
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ListarEstados() As List(Of String)
        Dim lista As New List(Of String)
        Try
            Dim dt As DataTable = miAcceso.leer("Pedido_Estados")
            For Each fila As DataRow In dt.Rows
                Dim estado As String
                estado = fila("FormularioEstado").ToString
                lista.Add(estado)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
End Class
