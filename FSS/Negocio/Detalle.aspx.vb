Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Detalle
    Inherits PaginaBase

    Private _miPedidoN As New neg.PedidoTemporalN
    Public Property miPedidoN() As neg.PedidoTemporalN
        Get
            Return _miPedidoN
        End Get
        Set(ByVal value As neg.PedidoTemporalN)
            _miPedidoN = value
        End Set
    End Property

    Dim miPedido As New ent.PedidoTemporal
    Private Sub Detalle_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("DetallePedido")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'carga el carrito la primera vez que se carga la pagina
            If Not IsPostBack Then
                ListarItems()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub

    Private Sub Detalle_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("DetallePedido")
            ControlarConsistencia("DetallePedido")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub
    Private Sub ListarItems()
        Try
            'obtener el ID del carrito de compras de cliente
            Dim miCliente As New ent.Cliente
            miCliente.login = miUsuario.login
            If miPedido Is Nothing Then
                miPedido = New ent.PedidoTemporal
            End If
            miPedido.cliente = miCliente
            miPedidoN.miPedidoTmp = miPedido
            Dim cantItems As Integer = miPedidoN.ContarItems()
            'si no items, ocultar los detalles y mostrar un mensaje
            If cantItems = 0 Then
                PanelDetalle.Visible = False
                EnviarMensaje(Panel1, "Usted no ha seleccionado productos.", True)
            Else
                'enlazo la grilla con los datos del carrito
                miPedidoN.miPedidoTmp = miPedido
                grdDetalle.DataSource = miPedidoN.listar()
                grdDetalle.DataBind()
                'actualizo la etiqueta con el monto total
                lblTotal.Text = String.Format("{0:c}", miPedidoN.Total())
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub
    Private Sub ActualizarItems()
        Try
            'obtener el ID del carrito de compras de cliente
            Dim miCliente As New ent.Cliente
            miCliente.login = miUsuario.login
            If miPedido Is Nothing Then
                miPedido = New ent.PedidoTemporal
            End If
            miPedido.cliente = miCliente
            'iterar por todas las filas de la lista de items
            Dim i As Integer
            For i = 0 To grdDetalle.Items.Count - 1

                'obtener referencias de los controlas de las filas
                Dim CantidadTxt As TextBox = CType(grdDetalle.Items(i).FindControl("Cantidad"), TextBox)
                Dim remove As CheckBox = CType(grdDetalle.Items(i).FindControl("Remove"), CheckBox)

                ' 'Se controla errores en caso que alguien introduzca un cantidad invalida
                Dim Cantidad As Integer

                Cantidad = CInt(CantidadTxt.Text)

                ' Si se modifica la cantidad, o se selecciona el checkbox eliminar
                If Cantidad <> CInt(grdDetalle.DataKeys(i)) Or remove.Checked = True Then
                    Dim lblProductoID As Label = CType(grdDetalle.Items(i).FindControl("Inventario"), Label)
                    If Cantidad = 0 Or remove.Checked = True Then
                        Dim unItem As New ent.ItemTemporal
                        unItem.inventario = CInt(lblProductoID.Text)
                        miPedido.misItems.Add(unItem)
                        miPedidoN.miPedidoTmp = miPedido
                        miPedidoN.RemoverItem()
                        miMensajero.EscribirBitacora("Update", miUsuario.login, "Se eliminó un ítem del pedido número " & miPedido.numero.ToString)
                    Else
                        Dim unItem As New ent.ItemTemporal
                        unItem.inventario = CInt(lblProductoID.Text)
                        unItem.cantidad = Cantidad
                        miPedido.misItems.Add(unItem)
                        miPedidoN.miPedidoTmp = miPedido
                        miPedidoN.ActualizarItem()
                        miMensajero.EscribirBitacora("Update", miUsuario.login, "Se modificó un ítem del pedido número " & miPedido.numero.ToString)
                    End If
                End If
            Next
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub
    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        Try
            'Actualiza el carrito, y llena nuevamente la grilla.
            ActualizarItems()
            ListarItems()

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub

    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Try
            'actualizar carrito
            ActualizarItems()
            EnviarMensaje(Panel1, "La modificiación se realizó exitosamente.", True)
            'obtener el ID del cliente
            Dim miCliente As New ent.Cliente
            miCliente.login = miUsuario.login

            If miPedido Is Nothing Then
                miPedido = New ent.PedidoTemporal
            End If
            miPedido.cliente = miCliente
            miPedidoN.miPedidoTmp = miPedido
            'si el pedido temporal tiene items, crear el pedido y redireccionar a la cuenta del cliente
            Dim cantItems As Integer = miPedidoN.ContarItems()
            'si no items, ocultar los detalles y mostrar un mensaje
            If cantItems > 0 Then
                'creo el Pedido 
                Dim nuevoPedido As New ent.Pedido(miCliente)
                Dim pedidoNeg As New neg.PedidoN
                Dim nro As Integer
                pedidoNeg.miPedido = nuevoPedido
                nro = pedidoNeg.Nuevo()
                nuevoPedido.numero = nro
                miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó el pedido número " & nro.ToString)
                'Paso por variable de sesión el número del pedido
                Session("numero") = pedidoNeg.miPedido.numero
                'LO REDIRECCIONO A LA PAGINA DEL ENVIO PARA HACER MAS RAPIDO
                Response.Redirect("~/Negocio/Envio.aspx")
                'lo redirecciono a la pagina donde muestro todos los pedidos del cliente
                'Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
            Else
                EnviarMensaje(Panel1, "Usted no ha seleccionado productos.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetallePedido", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetallePedido", ex2)
        End Try
    End Sub
    Protected Sub btnCatalogo_Click(sender As Object, e As EventArgs) Handles btnCatalogo.Click
        Response.Redirect("~/Catalogo.aspx?Linea=Botas")
    End Sub
End Class