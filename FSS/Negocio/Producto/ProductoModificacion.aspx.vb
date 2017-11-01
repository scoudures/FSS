Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class ProductoModificacion
    Inherits PaginaBase

    Private _productoNeg As New neg.ProductoN
    Public Property productoNeg() As neg.ProductoN
        Get
            Return _productoNeg
        End Get
        Set(ByVal value As neg.ProductoN)
            _productoNeg = value
        End Set
    End Property
    Private _elprod As New ent.Producto
    Public Property elProducto() As ent.Producto
        Get
            Return _elprod
        End Get
        Set(ByVal value As ent.Producto)
            _elprod = value
        End Set
    End Property

    Private Sub ProductoAlta_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("ProductoModificacion")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                listarCombos()
                If Not Session("Producto") Is Nothing Then
                    productoNeg.miProducto = DirectCast(Session("Producto"), ent.Producto)
                    'funciona OK, veo el inventario
                    'Response.Write("Producto " & productoNeg.miProducto.inventario.ToString)
                    elProducto = productoNeg.listarUno().Item(0)
                    mostrar(elProducto)
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoModificacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoModificacion", ex2)
        End Try
    End Sub

    Private Sub ProductoAlta_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("ProductoModificacion")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoModificacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoModificacion", ex2)
        End Try
    End Sub
    Private Sub mostrar(ByRef unProducto As ent.Producto)
        txtInventario.Text = unProducto.inventario.ToString
        listaLinea.Items().FindByText(unProducto.linea.descripcion).Selected = True
        listaMarca.Items.FindByText(unProducto.marca.descripcion).Selected = True
        listaColor.Items.FindByText(unProducto.color.descripcion).Selected = True
        listaImagen.Items.FindByText(unProducto.imagen.ToString).Selected = True
        txtCosto.Text = unProducto.precio.costo
        txtPrecio.Text = unProducto.precio.precioUnitario

    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~\Negocio\Producto.aspx")
    End Sub

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        'Modificación del producto
        Dim miProducto As New ent.Producto
        miProducto.inventario = CInt(txtInventario.Text)
        miProducto.linea.descripcion = listaLinea.SelectedValue
        miProducto.marca.descripcion = listaMarca.SelectedValue
        miProducto.color.descripcion = listaColor.SelectedValue
        miProducto.imagen = listaImagen.SelectedValue
        miProducto.precio.costo = CDbl(txtCosto.Text)
        miProducto.precio.precioUnitario = CDbl(txtPrecio.Text)
        productoNeg.miProducto = miProducto
        productoNeg.Modificar2()
        miMensajero.EscribirBitacora("Update", miUsuario.login, "Se modificó el producto: " & productoNeg.miProducto.inventario.ToString)

        lblMsg.Text = "Producto fue Modificado satisfactoriamente"
        btnCancelar.Text = "Finalizar"
        btnAceptar.Visible = False
        PanelDatos.Visible = False
    End Sub
    Private Sub listarCombos()
        Try
            Dim miLineaN As New neg.LineaN
            listaLinea.DataSource = miLineaN.listar
            listaLinea.DataTextField = "descripcion"
            listaLinea.DataBind()

            Dim miMarcaN As New neg.MarcaN
            listaMarca.DataSource = miMarcaN.listar
            listaMarca.DataTextField = "descripcion"
            listaMarca.DataBind()

            Dim miColorN As New neg.ColorN
            listaColor.DataSource = miColorN.listar
            listaColor.DataTextField = "descripcion"
            listaColor.DataBind()

            Dim files As IEnumerable(Of String)
            files = System.IO.Directory.EnumerateFiles(Server.MapPath("~/Negocio/ImagenesProductos/"), "*.jpg", IO.SearchOption.AllDirectories)
            listaImagen.Items.Clear()
            For Each Path As String In files
                Dim Seccion() As String = Path.Split("\\")
                Dim filename As String = Seccion(Seccion.Length - 1)
                listaImagen.Items.Add("/Negocio/ImagenesProductos/" & filename)
            Next

            'Dim miNivelN As New neg.NivelN
            'listaNivel.DataSource = miNivelN.listar
            'listaNivel.DataTextField = "descripcion"
            'listaNivel.DataBind()

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoModificacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoModificacion", ex2)
        End Try
    End Sub


End Class