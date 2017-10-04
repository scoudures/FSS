Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Pago
    Inherits PaginaBase

    Private _PedidoNeg As New neg.PedidoN
    Public Property PedidoNeg() As neg.PedidoN
        Get
            Return _PedidoNeg
        End Get
        Set(ByVal value As neg.PedidoN)
            _PedidoNeg = value
        End Set
    End Property

    Dim unPedido As New ent.Pedido
    Dim miPedido As New ent.PedidoCabeceraVista
    Dim listaDetalle As New List(Of ent.PedidoDetalleVista)
    Dim pagoNeg As New neg.PagoN
    Private Sub Pago_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Pago")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no falle el codigo de los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Session("numero") IsNot Nothing Then
                    unPedido.numero = CInt(Session("numero"))
                    'mostrar Pedido
                    mostrarDetalle()
                    cargarDatos()
                    TxtNroTarjeta.Text = "4444555566667777"
                Else
                    Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub

    Private Sub Pago_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Pago")
            ControlarConsistencia("Pago")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub
    Private Sub cambiarEstado(ByVal unEstadoAnterior As String, ByVal unEstado As String)
        Try
            unPedido.numero = CInt(Session("numero"))
            PedidoNeg.miPedido = unPedido
            'Obtengo la cabecera del pedido
            miPedido = PedidoNeg.DameEstadoDe()
            'permitir agregar envio si el estado es "Nuevo"
            If miPedido.EstadoFormulario = unEstadoAnterior Then
                'actualizo el pedido que tengo en memoria
                unPedido.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
                unPedido.EstadoFormulario = miPedido.EstadoFormulario
                unPedido.codigoSucursal = miPedido.codigoSucursal
                unPedido.EstadoFormulario = unEstado
                PedidoNeg.miPedido = unPedido
                'actualizo el estado
                PedidoNeg.CambiarEstado()
                miMensajero.EscribirBitacora("Update", miUsuario.login, "Se cambió el estado del pedido número " & PedidoNeg.miPedido.numero.ToString & " de '" & unEstadoAnterior & "' a '" & unEstado & "'.")
            Else
                Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub
    Private Sub mostrarDetalle()
        PanelDetalle.Visible = True
        PedidoNeg.miPedido = unPedido
        miPedido = PedidoNeg.DameEstadoDe()
        'obtengo el detalle del pedido
        unPedido.numero = miPedido.numero
        unPedido.codigoSucursal = miPedido.codigoSucursal
        PedidoNeg.miPedido = unPedido
        listaDetalle = PedidoNeg.ListarDetalleDe()
        grdDetalle.DataSource = listaDetalle
        grdDetalle.DataBind()
        'actualizo la etiqueta con el monto total
        lblTotal.Text = String.Format("{0:c}", PedidoNeg.Total(listaDetalle))
        lblPedido.Text = PedidoNeg.armarNumero(unPedido)
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
    End Sub
    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Try
            'Primero controlo el stock
            If controlarStock() Then
                'Si el stock está bien, simulo la validacion de la tarjeta de credito
                System.Threading.Thread.Sleep(4000)
                'Descuento el stock
                If descontarStock() Then
                    'Al confirmar el pago, cambiar el estado del Formulario
                    guardarPago()
                    miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó un pago en el pedido número " & unPedido.numero.ToString)
                    btnConfirmar.Visible = False
                    lblMsg.Text = "Su Pago ha sido procesado exitosamente!!! GRACIAS POR SU COMPRA"
                    lblMsg.DataBind()
                    System.Threading.Thread.Sleep(4000)
                    facturar()
                    miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó la factura del pedido número " & unPedido.numero.ToString)
                    lblMsg.Text = "Su Pago ha sido procesado exitosamente y <br/>su Factura se encuentra disponible.<br/>GRACIAS POR SU COMPRA!!!"
                    lblMsg.DataBind()
                    btnCancelar.Text = "Finalizar"
                Else
                    btnConfirmar.Visible = False
                    btnCancelar.Text = "Finalizar"
                    lblMsg.Text = "No se pudo procesar su Pago, por favor póngase en contacto con un vendedor."
                    lblMsg.DataBind()
                End If
            Else
                btnConfirmar.Visible = False
                btnCancelar.Text = "Finalizar"
                lblMsg.Text = "No se pudo procesar su Pago, por favor póngase en contacto con un vendedor."
                lblMsg.DataBind()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Envio", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Envio", ex2)
        End Try
    End Sub
    Private Sub cargarDatos()
        Try
            'Response.Write("Pedido" & unPedido.numero.ToString)
            unPedido.numero = CInt(Session("numero"))
            unPedido.codigoSucursal = miPedido.codigoSucursal
            unPedido.cliente.login = miUsuario.login
            TxtCodigoTarjeta.Text = ""
            TxtNroTarjeta.Text = ""
            lblTotalPago.Visible = False
            lstMes.SelectedIndex = 0
            lstAnio.SelectedIndex = 0
            lstCuotas.SelectedIndex = 0
            actualizarTotal()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub
    Private Sub guardarPago()
        Try
            Dim usuarioNeg As New neg.UsuarioN
            If usuarioNeg.EsCliente(miUsuario) Then
                unPedido.numero = CInt(Session("numero"))
                PedidoNeg.miPedido = unPedido
                miPedido = PedidoNeg.DameEstadoDe()
                unPedido.codigoSucursal = miPedido.codigoSucursal
                unPedido.sucursal = miPedido.sucursal
                unPedido.numero = miPedido.numero
                unPedido.cliente.login = miUsuario.login
                unPedido.pago.descripcion = "Tarjeta de Credito"
                unPedido.pago.numero = TxtNroTarjeta.Text
                unPedido.pago.vencimiento = lstMes.SelectedItem.Value.ToString & lstAnio.SelectedItem.Value.ToString
                unPedido.pago.cuotas = CInt(lstCuotas.SelectedItem.Value)
                If lblTotalPago.Text.Length > 0 Then
                    unPedido.pago.total = CDbl(lblTotalPago.Text)
                End If
                '***********************************************************************
                'cargo el Pago y cambio el estado del pedido
                '***********************************************************************
                pagoNeg.Nuevo(unPedido)
                cambiarEstado("En Suspenso", "Aprobado")
                'preparo la pantalla
                mostrarDetalle()
                cargarDatos()
                PanelPago.Visible = False
            Else
                EnviarMensaje(Panel1, "Solo el Cliente puede ingresar el Pago", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub

    Protected Sub lstCuotas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstCuotas.SelectedIndexChanged
        lblTotalPago.Visible = True
        actualizarTotal()
        Dim cant As Integer
        cant = CInt(lstCuotas.SelectedItem.Value)
        If cant > 0 Then
            Dim subtotal As Double = CDbl(lblTotal.Text)
            Dim recargo As Integer = 0
            Dim valorrecargo As Double = 0
            Dim valoriva As Double = 0
            Dim eltotal As Double
            Select Case cant
                Case 1
                    recargo = 0
                Case 3
                    recargo = 10
                Case 6
                    recargo = 12
                Case 12
                    recargo = 15
                Case Else
                    recargo = 10
            End Select
            valorrecargo = (subtotal * recargo) / 100
            valoriva = ((subtotal + valorrecargo) * 21) / 100
            eltotal = subtotal + valorrecargo + valoriva

            lblRecargo.Text = String.Format("{0:c}", valorrecargo)
            lblIva.Text = String.Format("{0:c}", valoriva)
            lblTotalPago.Text = String.Format("{0:c}", eltotal)
            If cant > 1 Then
                lblCantCuotas.Text = cant.ToString & " cuotas de "
                Dim aPagar As Double = eltotal / cant
                lblValorCuota.Text = String.Format("{0:c}", aPagar)
            End If
        End If
    End Sub
    Private Sub actualizarTotal()
        unPedido.numero = CInt(Session("numero"))
        unPedido.codigoSucursal = miPedido.codigoSucursal
        unPedido.cliente.login = miUsuario.login
        PedidoNeg.miPedido = unPedido
        miPedido = PedidoNeg.DameEstadoDe()
        listaDetalle = PedidoNeg.ListarDetalleDe()
        'actualizo la etiqueta con el monto total
        lblTotal.Text = String.Format("{0:c}", PedidoNeg.Total(listaDetalle))
    End Sub
    Private Sub facturar()
        Try
            'insertar la factura y cambiar el estado del pedido a facturado
            If Session("numero") IsNot Nothing Then
                'crear la factura
                Dim miCliente As New ent.Cliente
                miCliente.login = miUsuario.login
                Dim facturaNeg As New neg.FacturaN
                Dim miFactura As New ent.Factura(miCliente)
                miFactura.pedido = New ent.Pedido
                miFactura.pedido.numero = CInt(Session("numero"))
                facturaNeg.Nuevo(miFactura)
                'una ve generada la factura, le cambio el estado
                cambiarEstado("Aprobado", "Facturado")
                'si termina todo ok, redirecciono a la cuenta
                'Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
    End Sub
    Private Function controlarStock() As Boolean
        Dim resultado As Boolean = False
        Try
            If Session("numero") IsNot Nothing Then
                unPedido.numero = CInt(Session("numero"))
                'Obtengo el detalle del pedido
                PedidoNeg.miPedido = unPedido
                miPedido = PedidoNeg.DameEstadoDe()
                unPedido.numero = miPedido.numero
                unPedido.codigoSucursal = miPedido.codigoSucursal
                PedidoNeg.miPedido = unPedido
                listaDetalle = PedidoNeg.ListarDetalleDe()
                'Pregunto el stock
                Dim prodN As New neg.ProductoN
                For Each prod As ent.PedidoDetalleVista In listaDetalle
                    Dim unProducto As New ent.Producto
                    unProducto.inventario = prod.inventario
                    'unProducto.cantMaxPorPedido = prod.cantidad
                    unProducto.talle.descripcion = prod.talle
                    If prodN.DameStockDe(unProducto) <= prod.cantidad Then
                        resultado = False
                    Else
                        resultado = True
                    End If
                Next
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
        Return resultado
    End Function
    Private Function descontarStock() As Boolean
        Dim resultado As Boolean = False
        Try
            If Session("numero") IsNot Nothing Then
                unPedido.numero = CInt(Session("numero"))
                'Obtengo el detalle del pedido
                PedidoNeg.miPedido = unPedido
                miPedido = PedidoNeg.DameEstadoDe()
                unPedido.numero = miPedido.numero
                unPedido.codigoSucursal = miPedido.codigoSucursal
                PedidoNeg.miPedido = unPedido
                listaDetalle = PedidoNeg.ListarDetalleDe()
                'Descuento el stock
                Dim prodN As New neg.ProductoN
                For Each prod As ent.PedidoDetalleVista In listaDetalle
                    Dim unProducto As New ent.Producto
                    unProducto.inventario = prod.inventario
                    unProducto.cantMaxPorPedido = prod.cantidad
                    unProducto.talle.descripcion = prod.talle
                    If prodN.DescontarStockDe(unProducto) >= 0 Then
                        resultado = True
                    End If
                Next
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Pago", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Pago", ex2)
        End Try
        Return resultado
    End Function

  
End Class