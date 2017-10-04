Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class ProductoDetalle
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

    Private _UsuarioNeg As New neg.UsuarioN
    Public Property UsuarioNeg() As neg.UsuarioN
        Get
            Return _UsuarioNeg
        End Get
        Set(ByVal value As neg.UsuarioN)
            _UsuarioNeg = value
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
    Dim misTalles As New List(Of ent.Talle)
    Dim misNiveles As New List(Of ent.Nivel)
    Private Sub ProductoDetalle_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("DetalleProducto")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Not Request.Params("ProductoID") Is Nothing Then
                    mostrarProducto()
                    mostrarNiveles()
                    mostrarTalles()
                    miProducto.talle.descripcion = lstTalle.Items(0).Value
                    miProducto.cantidadVendida = 1
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("DetalleProducto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("DetalleProducto", ex2)
        End Try
    End Sub

    Private Sub ProductoDetalle_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            'todos pueden acceder a esta página
            'ControlarAutenticacion("DetalleProducto")
            'si hay un usuario logueado muestro "Agregar al pedido"
            Restringir()
            ControlarConsistencia("DetalleProducto")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("PAGINA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("PAGINA", ex2)
        End Try
    End Sub
    Private Sub Restringir()
        If Me.Autenticado = 1 And UsuarioNeg.EsCliente(miUsuario) Then
            PanelVenta.Visible = True
        Else
            PanelVenta.Visible = False
        End If
    End Sub
    'Private Sub Restringir(ByRef parent As Control)
    '    Try
    '        For Each c As Control In parent.Controls
    '            'controles hijos
    '            If Not c.ID Is Nothing And c.Controls.Count = 0 Then
    '                If c.ID = "PanelVenta" Then
    '                    If Me.Autenticado = 1 And UsuarioNeg.EsCliente(miUsuario) Then
    '                        c.Visible = True
    '                    Else
    '                        c.Visible = False
    '                    End If
    '                End If
    '            End If

    '            'control padre
    '            If (c.Controls.Count > 0) Then
    '                'llamada recursiva
    '                Restringir(c)
    '            End If
    '        Next
    '    Catch ex As ent.miClaseExcepcion
    '        TratarErrorEnCatch("Catalogo", ex)
    '    Catch ex2 As Exception
    '        TratarErrorEnCatch("Catalogo", ex2)
    '    End Try
    'End Sub
    Private Sub mostrarProducto()
        Try
            If miProducto Is Nothing Then
                Me.miProducto = New ent.Producto
            End If
            'obtengo el numero del producto para mostrarlo
            Dim parametro As String = Request.Params("ProductoID").ToString
            miProducto.inventario = CInt(parametro)
            miProductoN.miProducto = miProducto
            lstProducto.DataSource = miProductoN.listarUno()
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Catalogo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Catalogo", ex2)
        End Try

    End Sub
    Private Sub mostrarTalles()
        Dim miTalleN As New neg.TalleN
        misTalles = miTalleN.listar(miProducto)
        'Dim listaTalle As New DropDownList
        'listaTalle = lstProducto.FindControl("lstTalle")
        'listaTalle.DataSource = misTalles
        'listaTalle.DataValueField = "Descripcion"
        lstTalle.DataSource = misTalles
        lstTalle.DataValueField = "Descripcion"
        lstTalle.DataBind()
    End Sub
    Private Sub mostrarNiveles()
        Dim miNivelN As New neg.NivelN
        misNiveles = miNivelN.listar(miProducto)
        'Dim grillaNiveles As New DropDownList
        'grillaNiveles = lstProducto.FindControl("grdNiveles")
        'grillaNiveles.DataSource = misNiveles
        grdNiveles.DataSource = misNiveles
        grdNiveles.DataBind()
    End Sub
    Protected Sub lstTalle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstTalle.SelectedIndexChanged
        miProducto.talle.descripcion = lstTalle.SelectedValue
    End Sub

    Protected Sub txtCantidad_TextChanged(sender As Object, e As EventArgs) Handles txtCantidad.TextChanged
        miProducto.cantidadVendida = CInt(txtCantidad.Text)
    End Sub

    Protected Sub Agregaralpedido_Click(sender As Object, e As EventArgs) Handles Agregaralpedido.Click
        Response.Redirect("~/Negocio/Pedido.aspx?ProductoID=" & miProducto.inventario.ToString)
    End Sub
End Class