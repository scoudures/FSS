Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class FacturaN

    Private _miMapper As New data.FacturaM
    Public Property miMapper() As data.FacturaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.FacturaM)
            _miMapper = value
        End Set
    End Property

    Private _miFactura As New ent.Factura
    Public Property miFactura() As ent.Factura
        Get
            Return _miFactura
        End Get
        Set(ByVal value As ent.Factura)
            _miFactura = value
        End Set
    End Property


    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(Me.miFactura)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unaFactura As ent.Factura) As Integer
        Try
            Return miMapper.Nuevo(unaFactura)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarPedidosDe(ByRef unCliente As ent.Cliente) As List(Of ent.FacturaCabeceraVista)
        Try
            Dim miLista As New List(Of ent.FacturaCabeceraVista)
            Dim Lista As New List(Of ent.Factura)
            Lista = miMapper.ListarFacturasDe(unCliente)
            For Each pedido As ent.Factura In Lista
                Dim unaFactura As New ent.FacturaCabeceraVista
                'datos del encabezado
                unaFactura.letra = pedido.letra
                unaFactura.codigoSucursal = pedido.codigoSucursal
                unaFactura.sucursal = pedido.sucursal
                unaFactura.numero = pedido.numero

                unaFactura.pedido = armarNumero(pedido)
                unaFactura.fechaEmision = pedido.fechaEmision
                unaFactura.fechaVencimiento = pedido.fechaVencimiento
                unaFactura.Empresa = pedido.empresa.nombre
                unaFactura.razonSocial = pedido.empresa.razonSocial
                unaFactura.CUIT = pedido.empresa.CUIT
                unaFactura.inicioActividad = pedido.empresa.inicioActividad
                unaFactura.nroIngresosBrutos = pedido.empresa.nroIngresosBrutos
                unaFactura.responsableInscripto = pedido.empresa.responsableInscripto
                unaFactura.CodigoEstadoFormulario = pedido.CodigoEstadoFormulario
                unaFactura.EstadoFormulario = pedido.EstadoFormulario
                'datos del cliente
                unaFactura.ClienteDNI = pedido.cliente.DNI
                unaFactura.cliente = pedido.cliente.apellido & ", " & pedido.cliente.nombre
                unaFactura.Usuario = pedido.cliente.login
                unaFactura.Domicilio = pedido.cliente.domicilio.descripcion
                unaFactura.calle = pedido.cliente.domicilio.calle
                unaFactura.altura = pedido.cliente.domicilio.numero
                unaFactura.piso = pedido.cliente.domicilio.piso
                unaFactura.departamento = pedido.cliente.domicilio.departamento
                unaFactura.localidad = pedido.cliente.domicilio.localidad.localidad
                unaFactura.provincia = pedido.cliente.domicilio.provincia.provincia
                unaFactura.codigoPostal = pedido.cliente.domicilio.codigoPostal.CPA
                'datos del vendedor
                unaFactura.emitidoPor = pedido.vendedor.codigo
                unaFactura.vendedor = pedido.vendedor.login
                miLista.Add(unaFactura)
            Next
            Return miLista
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ContarPedidosDe(ByRef unCliente As ent.Cliente) As Integer
        Try
            Return miMapper.ContarFacturasDe(unCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function armarNumero() As String
        Dim numero As String = ""
        Dim sucursal As Integer
        Dim nro As Integer
        Try
            sucursal = Me.miFactura.codigoSucursal
            nro = Me.miFactura.numero
            If sucursal < 10 Then
                numero = numero & "000" & sucursal.ToString & "-"
            ElseIf sucursal < 100 Then
                numero = numero & "00" & sucursal.ToString & "-"
            ElseIf sucursal < 1000 Then
                numero = numero & "0" & sucursal.ToString & "-"
            Else
                numero = numero & sucursal.ToString & "-"
            End If
            If nro < 10 Then
                numero = numero & "000" & nro.ToString
            ElseIf nro < 100 Then
                numero = numero & "00" & nro.ToString
            ElseIf nro < 1000 Then
                numero = numero & "0" & nro.ToString
            Else
                numero = numero & nro.ToString
            End If
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return numero
    End Function
    Public Function armarNumero(ByRef unPedido As ent.Factura) As String
        Dim numero As String = ""
        Dim sucursal As Integer
        Dim nro As Integer
        Try
            sucursal = unPedido.codigoSucursal
            nro = unPedido.numero
            If sucursal < 10 Then
                numero = numero & "000" & sucursal.ToString & "-"
            ElseIf sucursal < 100 Then
                numero = numero & "00" & sucursal.ToString & "-"
            ElseIf sucursal < 1000 Then
                numero = numero & "0" & sucursal.ToString & "-"
            Else
                numero = numero & sucursal.ToString & "-"
            End If
            If nro < 10 Then
                numero = numero & "000" & nro.ToString
            ElseIf nro < 100 Then
                numero = numero & "00" & nro.ToString
            ElseIf nro < 1000 Then
                numero = numero & "0" & nro.ToString
            Else
                numero = numero & nro.ToString
            End If
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return numero
    End Function
    Public Function DameEstadoDe(ByRef miPedido As ent.Factura) As ent.FacturaCabeceraVista
        Dim unaFactura As New ent.FacturaCabeceraVista
        Try
            miMapper.DameEstadoDe(miPedido)
            'datos del encabezado
            unaFactura.letra = miPedido.letra
            unaFactura.codigoSucursal = miPedido.codigoSucursal
            unaFactura.sucursal = miPedido.sucursal
            unaFactura.numero = miPedido.numero
            unaFactura.pedido = armarNumero(miPedido)
            unaFactura.fechaEmision = miPedido.fechaEmision
            unaFactura.fechaVencimiento = miPedido.fechaVencimiento
            unaFactura.Empresa = miPedido.empresa.nombre
            unaFactura.razonSocial = miPedido.empresa.razonSocial
            unaFactura.CUIT = miPedido.empresa.CUIT
            unaFactura.inicioActividad = miPedido.empresa.inicioActividad
            unaFactura.nroIngresosBrutos = miPedido.empresa.nroIngresosBrutos
            unaFactura.responsableInscripto = miPedido.empresa.responsableInscripto
            unaFactura.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
            unaFactura.EstadoFormulario = miPedido.EstadoFormulario
            'datos del cliente
            unaFactura.ClienteDNI = miPedido.cliente.DNI
            unaFactura.cliente = miPedido.cliente.apellido & ", " & miPedido.cliente.nombre
            unaFactura.Usuario = miPedido.cliente.login
            unaFactura.Domicilio = miPedido.cliente.domicilio.descripcion
            unaFactura.calle = miPedido.cliente.domicilio.calle
            unaFactura.altura = miPedido.cliente.domicilio.numero
            unaFactura.piso = miPedido.cliente.domicilio.piso
            unaFactura.departamento = miPedido.cliente.domicilio.departamento
            unaFactura.localidad = miPedido.cliente.domicilio.localidad.localidad
            unaFactura.provincia = miPedido.cliente.domicilio.provincia.provincia
            unaFactura.codigoPostal = miPedido.cliente.domicilio.codigoPostal.CPA
            'datos del vendedor
            unaFactura.emitidoPor = miPedido.vendedor.codigo
            unaFactura.vendedor = miPedido.vendedor.login
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return unaFactura
    End Function
    Public Function ListarDetalleDe() As List(Of ent.FacturaDetalleVista)
        Dim miLista As New List(Of ent.FacturaDetalleVista)
        Try
            Dim lista As New List(Of ent.Item)
            lista = miMapper.ListarDetalleDe(Me.miFactura)
            For Each item As ent.Item In lista
                Dim unItem As New ent.FacturaDetalleVista
                'armar el objeto vista
                unItem.numeroItem = item.numero
                unItem.inventario = item.producto.inventario
                unItem.descripcion = item.descripcion
                unItem.cantidad = item.cantidad
                unItem.precioUnitario = item.producto.precio.precioUnitario
                unItem.SubTotal = unItem.cantidad * unItem.precioUnitario
                miLista.Add(unItem)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
    Public Function Total(ByRef lista As List(Of ent.FacturaDetalleVista)) As Double
        Dim resultado As Double
        Try
            For Each item As ent.FacturaDetalleVista In lista
                resultado += item.SubTotal
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ListarTodos() As List(Of ent.FacturaCabeceraVista)
        Try
            Dim miLista As New List(Of ent.FacturaCabeceraVista)
            Dim Lista As New List(Of ent.Factura)
            Lista = miMapper.ListarTodos
            For Each pedido As ent.Factura In Lista
                Dim unaFactura As New ent.FacturaCabeceraVista
                'datos del encabezado
                unaFactura.letra = pedido.letra
                unaFactura.codigoSucursal = pedido.codigoSucursal
                unaFactura.sucursal = pedido.sucursal
                unaFactura.numero = pedido.numero
                unaFactura.pedido = armarNumero(pedido)
                unaFactura.fechaEmision = pedido.fechaEmision
                unaFactura.fechaVencimiento = pedido.fechaVencimiento
                unaFactura.Empresa = pedido.empresa.nombre
                unaFactura.razonSocial = pedido.empresa.razonSocial
                unaFactura.CUIT = pedido.empresa.CUIT
                unaFactura.inicioActividad = pedido.empresa.inicioActividad
                unaFactura.nroIngresosBrutos = pedido.empresa.nroIngresosBrutos
                unaFactura.responsableInscripto = pedido.empresa.responsableInscripto
                unaFactura.CodigoEstadoFormulario = pedido.CodigoEstadoFormulario
                unaFactura.EstadoFormulario = pedido.EstadoFormulario
                'datos del cliente
                unaFactura.ClienteDNI = pedido.cliente.DNI
                unaFactura.cliente = pedido.cliente.apellido & ", " & pedido.cliente.nombre
                unaFactura.Usuario = pedido.cliente.login
                unaFactura.Domicilio = pedido.cliente.domicilio.descripcion
                unaFactura.calle = pedido.cliente.domicilio.calle
                unaFactura.altura = pedido.cliente.domicilio.numero
                unaFactura.piso = pedido.cliente.domicilio.piso
                unaFactura.departamento = pedido.cliente.domicilio.departamento
                unaFactura.localidad = pedido.cliente.domicilio.localidad.localidad
                unaFactura.provincia = pedido.cliente.domicilio.provincia.provincia
                unaFactura.codigoPostal = pedido.cliente.domicilio.codigoPostal.CPA
                'datos del vendedor
                unaFactura.emitidoPor = pedido.vendedor.codigo
                unaFactura.vendedor = pedido.vendedor.login
                miLista.Add(unaFactura)
            Next
            Return miLista
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function


End Class
