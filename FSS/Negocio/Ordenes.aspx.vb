Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Ordenes
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
    Dim misEstados As New List(Of String)
    Private Sub Ordenes_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Ordenes")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                listarEstados()
                listarPedidos("Todos")
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try

    End Sub

    Private Sub Ordenes_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Ordenes")
            ControlarConsistencia("Ordenes")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub
    Private Sub listarPedidos(ByVal unEstado As String)
        Try
            'obtener todos los pedidos
            miUsuario.misPedidos.Clear()
            Dim todos As New List(Of ent.PedidoCabeceraVista)
            todos = PedidoNeg.ListarTodos()
            Dim cantidad As Integer = todos.Count
            If cantidad > 0 Then
                PanelPedidos.Visible = True
                If unEstado = "Todos" Then
                    miUsuario.misPedidos = todos
                Else
                    For Each ped As ent.PedidoCabeceraVista In todos
                        If ped.EstadoFormulario = unEstado Then
                            miUsuario.misPedidos.Add(ped)
                        End If
                    Next
                End If
                grdPedidos.DataSource = miUsuario.misPedidos
                grdPedidos.DataBind()
            Else
                EnviarMensaje(Panel1, "No hay pedidos.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub

    Private Sub grdPedidos_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles grdPedidos.PageIndexChanging
        Try
            grdPedidos.PageIndex = e.NewPageIndex
            listarPedidos(lstEstadoPedido.SelectedItem.ToString)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub
    Private Sub grdPedidos_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdPedidos.RowCommand
        Try
            If e.CommandName = "Detalle" Then
                Dim nro As Integer = e.CommandArgument
                PanelDetalle.Visible = True
                unPedido.numero = nro
                PedidoNeg.miPedido = unPedido
                miPedido = PedidoNeg.DameEstadoDe()
                'dependiendo del estado del pedido, muestro las opciones disponibles
                ManejarBotonesPara(miPedido)
                'obtengo el detalle del pedido
                unPedido.numero = miPedido.numero
                unPedido.codigoSucursal = miPedido.codigoSucursal
                Dim listaDetalle As New List(Of ent.PedidoDetalleVista)
                PedidoNeg.miPedido = unPedido
                listaDetalle = PedidoNeg.ListarDetalleDe()
                grdDetalle.DataSource = listaDetalle
                grdDetalle.DataBind()
                'actualizo la etiqueta con el monto total
                lblTotal.Text = String.Format("{0:c}", PedidoNeg.Total(listaDetalle))
                lblPedido.Text = PedidoNeg.armarNumero(unPedido)
                Session("numero") = unPedido.numero.ToString
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub
    Private Sub ManejarBotonesPara(ByRef miPedido As ent.PedidoCabeceraVista)
        Try
            Dim UsuarioNeg As New neg.UsuarioN
            Dim cliente As Boolean = UsuarioNeg.EsCliente(miUsuario)
            btnEnvio.Visible = False
            btnPago.Visible = False
            btnFactura.Visible = False
            btnEliminar.Visible = False
            'btnRectificar.Visible = False
            btnDespachar.Visible = False
            btnEntregar.Visible = False
            Select Case miPedido.EstadoFormulario
                Case "Nuevo"
                    btnEnvio.Visible = True
                    btnEliminar.Visible = True
                Case "En Suspenso"
                    btnPago.Visible = True
                    btnEliminar.Visible = True
                Case "Aprobado"
                    btnFactura.Visible = True
                    If Not cliente Then
                        'btnRectificar.Visible = True
                    End If
                Case "Facturado"
                    If Not cliente Then
                        btnDespachar.Visible = True
                    End If
                Case "Despachado"
                    If Not cliente Then
                        btnEntregar.Visible = True
                    End If
            End Select
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub

    Protected Sub btnEnvio_Click(sender As Object, e As EventArgs) Handles btnEnvio.Click
        Response.Redirect("~/Negocio/Envio.aspx")
    End Sub

    Protected Sub btnPago_Click(sender As Object, e As EventArgs) Handles btnPago.Click
        Response.Redirect("~/Negocio/Pago.aspx")
    End Sub

    Protected Sub btnFactura_Click(sender As Object, e As EventArgs) Handles btnFactura.Click
        Try
            'crear un PDF y cambiar el estado a facturado
            If Session("numero") IsNot Nothing Then
                'crear el pdf
                cambiarEstado("Facturado")
                listarPedidos(lstEstadoPedido.SelectedItem.ToString)
                PanelDetalle.Visible = False
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        'eliminar el pedido
        Try
            unPedido.numero = CInt(Session("numero"))
            PedidoNeg.miPedido = unPedido
            'Obtengo la cabecera del pedido
            miPedido = PedidoNeg.DameEstadoDe()
            'actualizo el pedido que tengo en memoria
            unPedido.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
            unPedido.EstadoFormulario = miPedido.EstadoFormulario
            unPedido.codigoSucursal = miPedido.codigoSucursal
            PedidoNeg.miPedido = unPedido
            'actualizo el estado
            PedidoNeg.Eliminar()
            listarPedidos(lstEstadoPedido.SelectedItem.ToString)
            PanelDetalle.Visible = False
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub

    Protected Sub btnRectificar_Click(sender As Object, e As EventArgs) Handles btnRectificar.Click
        'modificar cantidades
        PanelDetalle.Visible = False
        listarPedidos(lstEstadoPedido.SelectedItem.ToString)
    End Sub

    Protected Sub btnDespachar_Click(sender As Object, e As EventArgs) Handles btnDespachar.Click
        'cambiar el estado a Despachado
        Try
            'crear un PDF y cambiar el estado a facturado
            If Session("numero") IsNot Nothing Then
                'crear el pdf
                cambiarEstado("Despachado")
                listarPedidos(lstEstadoPedido.SelectedItem.ToString)
                PanelDetalle.Visible = False
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub

    Protected Sub btnEntregar_Click(sender As Object, e As EventArgs) Handles btnEntregar.Click
        'cambiar el estado a Entregado
        Try
            'crear un PDF y cambiar el estado a facturado
            If Session("numero") IsNot Nothing Then
                'crear el pdf
                cambiarEstado("Entregado")
                listarPedidos(lstEstadoPedido.SelectedItem.ToString)
                PanelDetalle.Visible = False
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub
    Private Sub cambiarEstado(ByVal unEstado As String)
        Try
            unPedido.numero = CInt(Session("numero"))
            PedidoNeg.miPedido = unPedido
            'Obtengo la cabecera del pedido
            miPedido = PedidoNeg.DameEstadoDe()
            'actualizo el pedido que tengo en memoria
            unPedido.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
            unPedido.EstadoFormulario = miPedido.EstadoFormulario
            unPedido.codigoSucursal = miPedido.codigoSucursal
            unPedido.EstadoFormulario = unEstado
            PedidoNeg.miPedido = unPedido
            'actualizo el estado
            PedidoNeg.CambiarEstado()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ordenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ordenes", ex2)
        End Try
    End Sub
    Private Sub listarEstados()
        Try
            misEstados = PedidoNeg.ListarEstados
            lstEstadoPedido.DataSource = misEstados
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Protected Sub lstEstadoPedido_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstEstadoPedido.SelectedIndexChanged
        listarPedidos(lstEstadoPedido.SelectedItem.ToString)
        grdPedidos.DataBind()
    End Sub
End Class