Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class PedidoN

    Private _miMapper As New data.PedidoM
    Public Property miMapper() As data.PedidoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.PedidoM)
            _miMapper = value
        End Set
    End Property

    Private _miPedido As New ent.Pedido
    Public Property miPedido() As ent.Pedido
        Get
            Return _miPedido
        End Get
        Set(ByVal value As ent.Pedido)
            _miPedido = value
        End Set
    End Property

    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(Me.miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarPedidosDe(ByRef unCliente As ent.Cliente) As List(Of ent.PedidoCabeceraVista)
        Try
            Dim miLista As New List(Of ent.PedidoCabeceraVista)
            Dim Lista As New List(Of ent.Pedido)
            Lista = miMapper.ListarPedidosDe(unCliente)
            For Each pedido As ent.Pedido In Lista
                Dim unPedido As New ent.PedidoCabeceraVista
                'datos del encabezado
                unPedido.letra = pedido.letra
                unPedido.codigoSucursal = pedido.codigoSucursal
                unPedido.sucursal = pedido.sucursal
                unPedido.numero = pedido.numero
                unPedido.pedido = armarNumero(pedido)
                unPedido.fechaEmision = pedido.fechaEmision.ToString("dd/MM/yyyy")
                unPedido.fechaVencimiento = pedido.fechaVencimiento
                unPedido.Empresa = pedido.empresa.nombre
                unPedido.razonSocial = pedido.empresa.razonSocial
                unPedido.CUIT = pedido.empresa.CUIT
                unPedido.inicioActividad = pedido.empresa.inicioActividad
                unPedido.nroIngresosBrutos = pedido.empresa.nroIngresosBrutos
                unPedido.responsableInscripto = pedido.empresa.responsableInscripto
                unPedido.CodigoEstadoFormulario = pedido.CodigoEstadoFormulario
                unPedido.EstadoFormulario = pedido.EstadoFormulario
                'datos del cliente
                unPedido.ClienteDNI = pedido.cliente.DNI
                unPedido.cliente = pedido.cliente.apellido & ", " & pedido.cliente.nombre
                unPedido.Usuario = pedido.cliente.login
                unPedido.Domicilio = pedido.cliente.domicilio.descripcion
                unPedido.calle = pedido.cliente.domicilio.calle
                unPedido.altura = pedido.cliente.domicilio.numero
                unPedido.piso = pedido.cliente.domicilio.piso
                unPedido.departamento = pedido.cliente.domicilio.departamento
                unPedido.localidad = pedido.cliente.domicilio.localidad.localidad
                unPedido.provincia = pedido.cliente.domicilio.provincia.provincia
                unPedido.codigoPostal = pedido.cliente.domicilio.codigoPostal.CPA
                'datos del vendedor
                unPedido.emitidoPor = pedido.vendedor.codigo
                unPedido.vendedor = pedido.vendedor.login
                miLista.Add(unPedido)
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
            Return miMapper.ContarPedidosDe(unCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function armarNumero(ByRef unPedido As ent.Pedido) As String
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

    Public Function DameEstadoDe() As ent.PedidoCabeceraVista
        Dim unPedido As New ent.PedidoCabeceraVista
        Try
            miMapper.DameEstadoDe(miPedido)
            'datos del encabezado
            unPedido.letra = miPedido.letra
            unPedido.codigoSucursal = miPedido.codigoSucursal
            unPedido.sucursal = miPedido.sucursal
            unPedido.numero = miPedido.numero
            unPedido.pedido = armarNumero(miPedido)
            unPedido.fechaEmision = miPedido.fechaEmision.ToString("dd/MM/yyyy")
            unPedido.fechaVencimiento = miPedido.fechaVencimiento
            unPedido.Empresa = miPedido.empresa.nombre
            unPedido.razonSocial = miPedido.empresa.razonSocial
            unPedido.CUIT = miPedido.empresa.CUIT
            unPedido.inicioActividad = miPedido.empresa.inicioActividad
            unPedido.nroIngresosBrutos = miPedido.empresa.nroIngresosBrutos
            unPedido.responsableInscripto = miPedido.empresa.responsableInscripto
            unPedido.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
            unPedido.EstadoFormulario = miPedido.EstadoFormulario
            'datos del cliente
            unPedido.ClienteDNI = miPedido.cliente.DNI
            unPedido.cliente = miPedido.cliente.apellido & ", " & miPedido.cliente.nombre
            unPedido.Usuario = miPedido.cliente.login
            unPedido.Domicilio = miPedido.cliente.domicilio.descripcion
            unPedido.calle = miPedido.cliente.domicilio.calle
            unPedido.altura = miPedido.cliente.domicilio.numero
            unPedido.piso = miPedido.cliente.domicilio.piso
            unPedido.departamento = miPedido.cliente.domicilio.departamento
            unPedido.localidad = miPedido.cliente.domicilio.localidad.localidad
            unPedido.provincia = miPedido.cliente.domicilio.provincia.provincia
            unPedido.codigoPostal = miPedido.cliente.domicilio.codigoPostal.CPA
            'datos del vendedor
            unPedido.emitidoPor = miPedido.vendedor.codigo
            unPedido.vendedor = miPedido.vendedor.login
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return unPedido
    End Function
    Public Function ListarDetalleDe() As List(Of ent.PedidoDetalleVista)
        Dim miLista As New List(Of ent.PedidoDetalleVista)
        Try
            Dim lista As New List(Of ent.Item)
            lista = miMapper.ListarDetalleDe(miPedido)
            For Each item As ent.Item In lista
                Dim unItem As New ent.PedidoDetalleVista
                'armar el objeto vista
                unItem.numeroItem = item.numero
                unItem.inventario = item.producto.inventario
                unItem.descripcion = item.descripcion
                unItem.cantidad = item.cantidad
                unItem.precioUnitario = item.producto.precio.precioUnitario
                unItem.SubTotal = unItem.cantidad * unItem.precioUnitario
                unItem.talle = item.talle.descripcion
                miLista.Add(unItem)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function
    Public Function Total(ByRef lista As List(Of ent.PedidoDetalleVista)) As Double
        Dim resultado As Double
        Try
            For Each item As ent.PedidoDetalleVista In lista
                resultado += item.SubTotal
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function CambiarEstado() As Integer
        Try
            Return miMapper.CambiarEstado(miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar() As Integer
        Try
            Return miMapper.Eliminar(miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarTodos() As List(Of ent.PedidoCabeceraVista)
        Try
            Dim miLista As New List(Of ent.PedidoCabeceraVista)
            Dim Lista As New List(Of ent.Pedido)
            Lista = miMapper.ListarTodos
            For Each pedido As ent.Pedido In Lista
                Dim unPedido As New ent.PedidoCabeceraVista
                'datos del encabezado
                unPedido.letra = pedido.letra
                unPedido.codigoSucursal = pedido.codigoSucursal
                unPedido.sucursal = pedido.sucursal
                unPedido.numero = pedido.numero
                unPedido.pedido = armarNumero(pedido)
                unPedido.fechaEmision = pedido.fechaEmision.ToShortDateString
                unPedido.fechaVencimiento = pedido.fechaVencimiento
                unPedido.Empresa = pedido.empresa.nombre
                unPedido.razonSocial = pedido.empresa.razonSocial
                unPedido.CUIT = pedido.empresa.CUIT
                unPedido.inicioActividad = pedido.empresa.inicioActividad
                unPedido.nroIngresosBrutos = pedido.empresa.nroIngresosBrutos
                unPedido.responsableInscripto = pedido.empresa.responsableInscripto
                unPedido.CodigoEstadoFormulario = pedido.CodigoEstadoFormulario
                unPedido.EstadoFormulario = pedido.EstadoFormulario
                'datos del cliente
                unPedido.ClienteDNI = pedido.cliente.DNI
                unPedido.cliente = pedido.cliente.apellido & ", " & pedido.cliente.nombre
                unPedido.Usuario = pedido.cliente.login
                unPedido.Domicilio = pedido.cliente.domicilio.descripcion
                unPedido.calle = pedido.cliente.domicilio.calle
                unPedido.altura = pedido.cliente.domicilio.numero
                unPedido.piso = pedido.cliente.domicilio.piso
                unPedido.departamento = pedido.cliente.domicilio.departamento
                unPedido.localidad = pedido.cliente.domicilio.localidad.localidad
                unPedido.provincia = pedido.cliente.domicilio.provincia.provincia
                unPedido.codigoPostal = pedido.cliente.domicilio.codigoPostal.CPA
                'datos del vendedor
                unPedido.emitidoPor = pedido.vendedor.codigo
                unPedido.vendedor = pedido.vendedor.login
                miLista.Add(unPedido)
            Next
            Return miLista
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function DameNroFactura() As Integer
        Try
            Return miMapper.DameNroFacturaDe(Me.miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function armarNumeroFactura() As String
        Dim numero As String = ""
        Dim sucursal As Integer
        Dim nro As Integer
        Try
            sucursal = miPedido.codigoSucursal
            nro = DameNroFactura()
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
    Public Function DameCantCuotasDe() As Integer
        Try
            Return miMapper.DameCantCuotasDe(Me.miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function DamePago() As Integer
        Try
            Return miMapper.DamePagoDe(Me.miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function DameEnvio() As Integer
        Try
            Return miMapper.DameEnvioDe(Me.miPedido)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarEstados() As List(Of String)
        Try
            Return miMapper.ListarEstados
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
