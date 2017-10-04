Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class ProductoAlta
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

    Public Property miProducto() As ent.Producto
        Get
            Return DirectCast(Session("Producto"), ent.Producto)
        End Get
        Set(ByVal value As ent.Producto)
            Session("Producto") = value
        End Set
    End Property
    Private Sub ProductoAlta_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("ProductoAlta")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Me.miProducto Is Nothing Then
                    miProducto = New ent.Producto
                End If
                listarCombos()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoAlta", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoAlta", ex2)
        End Try
    End Sub

    Private Sub ProductoAlta_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("ProductoAlta")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoAlta", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoAlta", ex2)
        End Try
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~\Negocio\Producto.aspx")
    End Sub

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        'alta del producto
        Dim miProducto As New ent.Producto
        miProducto.linea.descripcion = listaLinea.SelectedValue
        miProducto.marca.descripcion = listaMarca.SelectedValue
        miProducto.color.descripcion = listaColor.SelectedValue
        miProducto.imagen = listaImagen.SelectedValue
        miProducto.nivel = listaNivel.SelectedValue
        miProducto.cantMaxPorPedido = CInt(txtCantMax.Text)
        miProducto.precio.costo = CDbl(txtCosto.Text)
        miProducto.precio.precioUnitario = CDbl(txtPrecio.Text)
        productoNeg.miProducto = miProducto
        productoNeg.Nuevo()
        miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó un producto nuevo: " & productoNeg.miProducto.inventario.ToString)
        lblMsg.Text = "Producto Insertado satisfactoriamente"
        Session("Producto") = productoNeg.miProducto
        Response.Redirect("~\Negocio\Producto\ProductoStock.aspx")
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

            Dim miNivelN As New neg.NivelN
            listaNivel.DataSource = miNivelN.listar
            listaNivel.DataTextField = "descripcion"
            listaNivel.DataBind()

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoAlta", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoAlta", ex2)
        End Try
    End Sub

End Class