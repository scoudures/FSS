Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class ProductoStock
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
    Private _talleNeg As New neg.TalleN
    Public Property talleNeg() As neg.TalleN
        Get
            Return _talleNeg
        End Get
        Set(ByVal value As neg.TalleN)
            _talleNeg = value
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
    Private Sub ProductoStock_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("ProductoStock")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Not Session("Producto") Is Nothing Then
                    productoNeg.miProducto = New ent.Producto
                    productoNeg.miProducto = DirectCast(Session("Producto"), ent.Producto)
                    'funciona OK, veo el inventario
                    'Response.Write("Producto " & productoNeg.miProducto.inventario.ToString)
                    listarTalles()
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoStock", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoStock", ex2)
        End Try
    End Sub

    Private Sub ProductoStock_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("ProductoStock")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoStock", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoStock", ex2)
        End Try
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~\Negocio\Producto.aspx")
    End Sub

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        modificarProducto()
        lblMsg.Text = "Producto fue Modificado satisfactoriamente"
        btnCancelar.Text = "Finalizar"
        btnAceptar.Visible = False
        PanelDatos.Visible = False
    End Sub

    Private Sub listarTalles()
        'en base a la linea del producto de la variable de sesión, listar todos los detalles y mostrar el stock de cada uno
        productoNeg.miProducto = DirectCast(Session("Producto"), ent.Producto)
        grdDetalle.DataSource = talleNeg.listarPorLinea(productoNeg.miProducto)
        grdDetalle.DataBind()
    End Sub

    Private Sub modificarProducto()
        Try
            'iterar por todas las filas de la lista
            Dim i As Integer
            For i = 0 To grdDetalle.Items.Count - 1
                'obtener referencias de las filas
                Dim StockTxt As TextBox = CType(grdDetalle.Items(i).FindControl("Stock"), TextBox)
                Dim Stock As Integer
                Stock = CInt(StockTxt.Text)
                'si el valor nuevo es diferente al anterior, lo modifico
                If Stock <> CInt(grdDetalle.DataKeys(i)) Then
                    Dim lblProductoID As Label = CType(grdDetalle.Items(i).FindControl("Inventario"), Label)
                    Dim lblTalle As Label = CType(grdDetalle.Items(i).FindControl("Talle"), Label)
                    If Stock > -1 Then
                        'modificar el stock del producto
                        productoNeg.miProducto = New ent.Producto
                        productoNeg.miProducto.inventario = CInt(lblProductoID.Text)
                        productoNeg.miProducto.talle = New ent.Talle
                        productoNeg.miProducto.talle.descripcion = lblTalle.Text
                        productoNeg.miProducto.talle.stock = Stock
                        productoNeg.ActualizarStock()
                        miMensajero.EscribirBitacora("Update", miUsuario.login, "Se modificó el stock del producto " & lblProductoID.Text.ToString & " - Talle " & lblTalle.Text)
                        lblMsg.Text = "La modificación se realizó satisfactoriamente!"
                        lblMsg.ForeColor = Drawing.Color.Red
                        lblMsg.Font.Bold = True
                        btnAceptar.Visible = False
                        btnCancelar.Text = "Finalizar"
                    End If
                End If
            Next
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ProductoStock", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ProductoStock", ex2)
        End Try
    End Sub
End Class