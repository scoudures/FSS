Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class FacturaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function Nuevo(ByRef unaFactura As ent.Factura) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unaFactura.cliente.login)
            params(1) = miAcceso.constructor("@numeroPedido", unaFactura.pedido.numero)
            resultado = miAcceso.Escribir("Factura_Insert", params)
            'miVerificador.DigitosPorTabla("Formulario_CAB")
            'miVerificador.DigitosPorTabla("Formulario_DET")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ContarFacturasDe(ByRef unCliente As ent.Cliente) As Integer
        Try
            Dim resultado As Integer
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unCliente.login)
            params(1) = miAcceso.constructor("@Contar", CInt(0))
            params(1).Direction = ParameterDirection.Output
            miAcceso.Escribir("FacturaCabecera_ContarByCliente", params)
            resultado = params(1).Value
            Return resultado
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarFacturasDe(ByRef unCliente As ent.Cliente) As List(Of ent.Factura)
        Dim lista As New List(Of ent.Factura)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Cliente", unCliente.login)
            Dim dt As DataTable = miAcceso.leer("FacturaCabecera_SelectAllByCliente", params)
            For Each fila As DataRow In dt.Rows
                Dim unaFactura As New ent.Factura
                unaFactura.letra = fila("Letra").ToString
                unaFactura.codigoSucursal = CInt(fila("Sucursal"))
                unaFactura.sucursal = fila("SucursalVenta").ToString
                unaFactura.numero = CInt(fila("Numero"))
                unaFactura.fechaEmision = CDate(fila("FecEmision"))
                unaFactura.fechaVencimiento = CDate(fila("FecVto").ToString)
                unaFactura.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unaFactura.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unaFactura.cliente = New ent.Cliente
                unaFactura.cliente.DNI = fila("DNI").ToString
                unaFactura.cliente.apellido = fila("Apellido").ToString
                unaFactura.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unaFactura.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unaFactura.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unaFactura.cliente.domicilio.calle = fila("calle").ToString
                    unaFactura.cliente.domicilio.numero = CInt(fila("nro"))
                    unaFactura.cliente.domicilio.piso = CInt(fila("piso"))
                    unaFactura.cliente.domicilio.departamento = fila("depto").ToString
                    unaFactura.cliente.domicilio.localidad = New ent.Localidad
                    unaFactura.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unaFactura.cliente.domicilio.provincia = New ent.Provincia
                    unaFactura.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unaFactura.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unaFactura.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unaFactura.empresa = New ent.Empresa
                unaFactura.empresa.CUIT = fila("CUIT").ToString
                unaFactura.empresa.nombre = fila("NombreFantasia").ToString
                unaFactura.empresa.razonSocial = fila("RazonSocial").ToString
                unaFactura.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unaFactura.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unaFactura.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unaFactura.vendedor = New ent.Vendedor
                unaFactura.vendedor.codigo = CInt(fila("EmitidoPor"))
                unaFactura.vendedor.login = fila("vendedor").ToString
                lista.Add(unaFactura)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function ListarTodos() As List(Of ent.Factura)
        Dim lista As New List(Of ent.Factura)
        Try
            Dim dt As DataTable = miAcceso.leer("FacturaCabecera_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaFactura As New ent.Factura
                unaFactura.letra = fila("Letra").ToString
                unaFactura.codigoSucursal = CInt(fila("Sucursal"))
                unaFactura.sucursal = fila("SucursalVenta").ToString
                unaFactura.numero = CInt(fila("Numero"))
                unaFactura.fechaEmision = CDate(fila("FecEmision"))
                unaFactura.fechaVencimiento = CDate(fila("FecVto").ToString)
                unaFactura.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unaFactura.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unaFactura.cliente = New ent.Cliente
                unaFactura.cliente.DNI = fila("DNI").ToString
                unaFactura.cliente.apellido = fila("Apellido").ToString
                unaFactura.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unaFactura.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unaFactura.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unaFactura.cliente.domicilio.calle = fila("calle").ToString
                    unaFactura.cliente.domicilio.numero = CInt(fila("nro"))
                    unaFactura.cliente.domicilio.piso = CInt(fila("piso"))
                    unaFactura.cliente.domicilio.departamento = fila("depto").ToString
                    unaFactura.cliente.domicilio.localidad = New ent.Localidad
                    unaFactura.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unaFactura.cliente.domicilio.provincia = New ent.Provincia
                    unaFactura.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unaFactura.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unaFactura.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unaFactura.empresa = New ent.Empresa
                unaFactura.empresa.CUIT = fila("CUIT").ToString
                unaFactura.empresa.nombre = fila("NombreFantasia").ToString
                unaFactura.empresa.razonSocial = fila("RazonSocial").ToString
                unaFactura.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unaFactura.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unaFactura.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unaFactura.vendedor = New ent.Vendedor
                unaFactura.vendedor.codigo = CInt(fila("EmitidoPor"))
                unaFactura.vendedor.login = fila("vendedor").ToString
                lista.Add(unaFactura)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Sub DameEstadoDe(ByRef unaFactura As ent.Factura)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@Pedido", unaFactura.numero)
            Dim dt As DataTable = miAcceso.leer("FacturaCabecera_SelectByID", params)
            For Each fila As DataRow In dt.Rows
                unaFactura.letra = fila("Letra").ToString
                unaFactura.codigoSucursal = CInt(fila("Sucursal"))
                unaFactura.sucursal = fila("SucursalVenta").ToString
                unaFactura.numero = CInt(fila("Numero"))
                unaFactura.fechaEmision = CDate(fila("FecEmision"))
                unaFactura.fechaVencimiento = CDate(fila("FecVto").ToString)
                unaFactura.CodigoEstadoFormulario = CInt(fila("CodEstadoFormulario"))
                unaFactura.EstadoFormulario = fila("EstadoFormulario").ToString
                'cliente
                unaFactura.cliente = New ent.Cliente
                unaFactura.cliente.DNI = fila("DNI").ToString
                unaFactura.cliente.apellido = fila("Apellido").ToString
                unaFactura.cliente.nombre = fila("Nombre").ToString
                'domicilio
                unaFactura.cliente.domicilio = New ent.Domicilio
                If fila("DomicilioTipo").ToString.Length > 0 Then
                    unaFactura.cliente.domicilio.descripcion = fila("DomicilioTipo").ToString
                    unaFactura.cliente.domicilio.calle = fila("calle").ToString
                    unaFactura.cliente.domicilio.numero = CInt(fila("nro"))
                    unaFactura.cliente.domicilio.piso = CInt(fila("piso"))
                    unaFactura.cliente.domicilio.departamento = fila("depto").ToString
                    unaFactura.cliente.domicilio.localidad = New ent.Localidad
                    unaFactura.cliente.domicilio.localidad.localidad = fila("Localidad").ToString
                    unaFactura.cliente.domicilio.provincia = New ent.Provincia
                    unaFactura.cliente.domicilio.provincia.provincia = fila("Provincia").ToString
                    unaFactura.cliente.domicilio.codigoPostal = New ent.CodigoPostal
                    unaFactura.cliente.domicilio.codigoPostal.CPA = fila("CodigoPostal").ToString
                End If
                'empresa
                unaFactura.empresa = New ent.Empresa
                unaFactura.empresa.CUIT = fila("CUIT").ToString
                unaFactura.empresa.nombre = fila("NombreFantasia").ToString
                unaFactura.empresa.razonSocial = fila("RazonSocial").ToString
                unaFactura.empresa.inicioActividad = CDate(fila("InicioActividad"))
                unaFactura.empresa.nroIngresosBrutos = CInt(fila("NroIngresosBrutos"))
                unaFactura.empresa.responsableInscripto = CBool(fila("ResponsableInscripto"))
                'vendedor
                unaFactura.vendedor = New ent.Vendedor
                unaFactura.vendedor.codigo = CInt(fila("EmitidoPor"))
                unaFactura.vendedor.login = fila("vendedor").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
    Public Function ListarDetalleDe(ByRef unaFactura As ent.Factura) As List(Of ent.Item)
        Dim miLista As New List(Of ent.Item)
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@tipo", CInt(2))
            params(1) = miAcceso.constructor("@Sucursal", unaFactura.codigoSucursal)
            params(2) = miAcceso.constructor("@Numero", unaFactura.numero)
            Dim dt As DataTable = miAcceso.leer("FacturaDetalle_SelectByCabecera", params)
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
                unItem.producto.talle.descripcion = fila("Talle").ToString
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
End Class
