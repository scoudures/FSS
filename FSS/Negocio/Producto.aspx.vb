Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.IO

Public Class Producto
    Inherits PaginaBase
    Private _miProductoN As New neg.ProductoN
    Public Property miProductoN() As neg.ProductoN
        Get
            Return _miProductoN
        End Get
        Set(ByVal value As neg.ProductoN)
            _miProductoN = value
        End Set
    End Property

    Dim misProductos As New List(Of ent.ProductoVista)
    Dim misImagenes As New List(Of String)

    'Private Sub Producto_Error(sender As Object, e As EventArgs) Handles Me.Error
    '    TratarErrorSinTry("Producto")
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                listarProductos()
                Session("Producto") = New ent.Producto
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Producto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Producto", ex2)
        End Try
    End Sub

    Private Sub listarProductos()
        Try
            misProductos = miProductoN.listarVista()
            grdProducto.DataSource = misProductos
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Producto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Producto", ex2)
        End Try
    End Sub
    'Private Sub Producto_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
    '    Try
    '        ControlarAutenticacion("Producto")
    '        ControlarConsistencia("Producto")
    '    Catch ex As ent.miClaseExcepcion
    '        TratarErrorEnCatch("Producto", ex)
    '    Catch ex2 As Exception
    '        TratarErrorEnCatch("Producto", ex2)
    '    End Try
    'End Sub


    Protected Sub grdCliente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdProducto.SelectedIndexChanged
        Try
            lblMsg.Text = "Usted ha seleccionado el Producto " & grdProducto.SelectedRow.Cells(1).Text & " indique una acción a realizar: "
            Dim unProducto As New ent.Producto
            unProducto.inventario = grdProducto.SelectedRow.Cells(1).Text
            Session("Producto") = unProducto
            miProductoN.miProducto = unProducto
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Font.Bold = True
            lblMsg.DataBind()
            btnBaja.Visible = True
            btnModificacion.Visible = True
            btnAlta.Visible = False
            btnStock.Visible = True
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Producto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Producto", ex2)
        End Try
    End Sub

    Protected Sub btnAlta_Click(sender As Object, e As EventArgs) Handles btnAlta.Click
        Response.Redirect("~\Negocio\Producto\ProductoAlta.aspx")
    End Sub

    Protected Sub btnModificacion_Click(sender As Object, e As EventArgs) Handles btnModificacion.Click
        Dim unProducto As New ent.Producto
        unProducto.inventario = grdProducto.SelectedRow.Cells(1).Text
        miProductoN.miProducto = unProducto
        Session("Producto") = miProductoN.miProducto
        Response.Redirect("~\Negocio\Producto\ProductoModificacion.aspx")
    End Sub

    Protected Sub btnBaja_Click(sender As Object, e As EventArgs) Handles btnBaja.Click
        'Baja del producto
        Dim unProducto As New ent.Producto
        unProducto.inventario = grdProducto.SelectedRow.Cells(1).Text
        miProductoN.miProducto = unProducto
        miProductoN.Eliminar()
        miMensajero.EscribirBitacora("Delete", miUsuario.login, "Se eliminó el producto: " & miProductoN.miProducto.inventario.ToString)
        'deselecciono la fila
        listarProductos()
        btnBaja.Visible = False
        btnModificacion.Visible = False
        btnStock.Visible = False
        btnAlta.Visible = True
        lblMsg.Text = "Producto fue eliminado satisfactoriamente"
    End Sub

    Protected Sub btnStock_Click(sender As Object, e As EventArgs) Handles btnStock.Click
        Dim unProducto As New ent.Producto
        unProducto.inventario = grdProducto.SelectedRow.Cells(1).Text
        miProductoN.miProducto = unProducto
        Session("Producto") = miProductoN.miProducto
        Response.Redirect("~\Negocio\Producto\ProductoStock.aspx")
    End Sub

End Class