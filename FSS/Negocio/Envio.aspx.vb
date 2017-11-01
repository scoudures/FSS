Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Envio
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

    Private _unPedido As New ent.Pedido
    Public Property unPedido() As ent.Pedido
        Get
            Return _unPedido
        End Get
        Set(ByVal value As ent.Pedido)
            _unPedido = value
        End Set
    End Property

    Private _envioNeg As New neg.EnvioN
    Public Property envioNeg() As neg.EnvioN
        Get
            Return _envioNeg
        End Get
        Set(ByVal value As neg.EnvioN)
            _envioNeg = value
        End Set
    End Property

    Dim miPedido As New ent.PedidoCabeceraVista


    Private Sub Envio_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Envio")
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
                Else
                    Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Envio", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Envio", ex2)
        End Try
    End Sub

    Private Sub Envio_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Envio")
            ControlarConsistencia("Envio")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Envio", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Envio", ex2)
        End Try

    End Sub
    Private Sub cambiarEstado()
        Try
            unPedido.numero = CInt(Session("numero"))
            PedidoNeg.miPedido = unPedido
            'Obtengo la cabecera del pedido
            miPedido = PedidoNeg.DameEstadoDe()
            'permitir agregar envio si el estado es "Nuevo"
            If miPedido.EstadoFormulario = "Nuevo" Then
                'actualizo el pedido que tengo en memoria
                unPedido.CodigoEstadoFormulario = miPedido.CodigoEstadoFormulario
                unPedido.EstadoFormulario = miPedido.EstadoFormulario
                unPedido.codigoSucursal = miPedido.codigoSucursal
                unPedido.EstadoFormulario = "En Suspenso"
                PedidoNeg.miPedido = unPedido
                'actualizo el estado
                PedidoNeg.CambiarEstado()
                miMensajero.EscribirBitacora("Update", miUsuario.login, "Se cambió el estado del pedido número " & PedidoNeg.miPedido.numero.ToString & " a 'En Suspenso'.")
            Else
                Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Envio", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Envio", ex2)
        End Try
    End Sub
    Private Sub mostrarDetalle()
        PanelDetalle.Visible = True
        PedidoNeg.miPedido = unPedido
        miPedido = PedidoNeg.DameEstadoDe()
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
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
    End Sub

    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Try
            'Al confirmar el envio, cambiar el estado del Formulario
            guardarEnvio()
            'Response.Write("Pedido" & unPedido.numero.ToString)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Envio", ex)
            'Catch ex2 As Exception
            '    TratarErrorEnCatch("Envio", ex2)
        End Try
    End Sub
    Private Sub cargarDatos()
        'Forma de envio
        lstFormaEnvio.DataSource = envioNeg.listarFormas
        lstFormaEnvio.DataTextField = "descripcion"
        'lstFormaEnvio.SelectedIndex = 0
        'Tipo de Domicilio del Cliente
        Dim DomicilioNeg As New neg.DomicilioN
        lstTipoDomicilio.DataSource = DomicilioNeg.listarTipos
        lstTipoDomicilio.DataTextField = "descripcion"
        lstTipoDomicilio.SelectedIndex = 2
        'Localidad
        Dim localidadNeg As New neg.LocalidadN
        lstLocalidad.DataSource = localidadNeg.listar
        lstLocalidad.DataTextField = "Localidad"
        lstLocalidad.SelectedIndex = 0
        'Provincia
        Dim provinciaNeg As New neg.ProvinciaN
        lstProvincia.DataSource = provinciaNeg.listar
        lstProvincia.DataTextField = "provincia"
        lstProvincia.SelectedIndex = 1
        'Codigo Postal
        Dim codigoNeg As New neg.CodigoPostalN
        lstCodigoPostal.DataSource = codigoNeg.listar
        lstCodigoPostal.DataTextField = "CPA"
        lstCodigoPostal.SelectedIndex = 0
        'limpio los textbox
        txtCalle.Text = ""
        txtDepto.Text = ""
        txtNumero.Text = ""
        txtPiso.Text = ""
        DataBind()
    End Sub
    Private Sub guardarEnvio()
        Dim usuarioNeg As New neg.UsuarioN
        If usuarioNeg.EsCliente(miUsuario) Then
            unPedido.numero = CInt(Session("numero"))
            unPedido.codigoSucursal = miPedido.codigoSucursal
            unPedido.cliente.login = miUsuario.login
            'Forma de envio
            unPedido.envio.descripcion = lstFormaEnvio.SelectedItem.Value
            'Tipo de Domicilio del Cliente
            unPedido.domicilio.descripcion = lstTipoDomicilio.SelectedItem.Value
            unPedido.domicilio.calle = txtCalle.Text
            If txtNumero.Text.Length > 0 Then
                unPedido.domicilio.numero = CInt(txtNumero.Text)
            Else
                unPedido.domicilio.numero = 0
            End If

            If txtPiso.Text.Length > 0 Then
                unPedido.domicilio.piso = txtPiso.Text
            Else
                unPedido.domicilio.piso = 0
            End If
            If txtDepto.Text.Length > 0 Then
                unPedido.domicilio.departamento = txtDepto.Text
            Else
                unPedido.domicilio.departamento = ""
            End If
            'Localidad
            unPedido.domicilio.localidad.localidad = lstLocalidad.SelectedItem.Value
            'Provincia
            unPedido.domicilio.provincia.provincia = lstProvincia.SelectedItem.Value
            'Codigo Postal
            unPedido.domicilio.codigoPostal.CPA = lstCodigoPostal.SelectedItem.Value
            '***********************************************************************
            'cargo el envio y cambio el estado del pedido
            '***********************************************************************
            envioNeg.Nuevo(unPedido)
            miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó un envío en el pedido número " & unPedido.numero.ToString)
            cambiarEstado()
            'preparo la pantalla
            PanelDireccion.Visible = False
            btnConfirmar.Visible = False
            btnCancelar.Visible = False
            mostrarDetalle()
            cargarDatos()
            EnviarMensaje(Panel1, "El Envío fue registrado con exito.", True)
            Response.Redirect("~/Negocio/Pago.aspx")
        Else
            EnviarMensaje(Panel1, "Solo el Cliente puede ingresar los datos de envio", True)
        End If
    End Sub
End Class