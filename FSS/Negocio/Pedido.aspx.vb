Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio

Public Class Pedido
    Inherits PaginaBase

    Private _miPedidoTemporalN As New Negocio.PedidoTemporalN
    Public Property miPedidoTemporalN() As Negocio.PedidoTemporalN
        Get
            Return _miPedidoTemporalN
        End Get
        Set(ByVal value As Negocio.PedidoTemporalN)
            _miPedidoTemporalN = value
        End Set
    End Property
    Public Property miProducto() As Entidades.Producto
        Get
            Return DirectCast(Session("Producto"), Entidades.Producto)
        End Get
        Set(ByVal value As Entidades.Producto)
            Session("Producto") = value
        End Set
    End Property

    Dim miPedido As New Entidades.PedidoTemporal
    Private Sub Pedido_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Pedido")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '*******************************************************
        ' El evento Page_Load en esta pagina se usa para agregar
        ' el producto identificado al pedido de un cliente, y luego
        ' redireccionar a la pagina del catalogo
        '(esto evita que el usario refresque la pagina y  
        ' agregue por accidente otro producto)  
        '    
        ' El producto que se va a agregar se especifica usando
        ' un argumento por querystring de la pagina.
        '*******************************************************
        Try
            ControlarAutenticacion("Pedido")
            ControlarConsistencia("Pedido")
            If Not Request.Params("ProductoID") Is Nothing Then
                'obtener el ID del cliente
                Dim miCliente As New Entidades.Cliente
                miCliente.login = miUsuario.login
                If miPedido Is Nothing Then
                    miPedido = New Entidades.PedidoTemporal
                End If
                miPedido.cliente = miCliente
                Dim unItem As New Entidades.ItemTemporal
                Dim parametro As String = Request.Params("ProductoID").ToString
                If Not miProducto Is Nothing Then
                    unItem.cantidad = miProducto.cantidadVendida
                    unItem.inventario = miProducto.inventario
                    unItem.talle.descripcion = miProducto.talle.descripcion
                    miPedido.misItems.Add(unItem)
                    miPedidoTemporalN.miPedidoTmp = miPedido
                    miPedidoTemporalN.AgregarItem()
                End If
            End If
            Response.Redirect("~/Negocio/Detalle.aspx")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("Pedido", ex)
            'Catch ex2 As Exception
            'TratarErrorEnCatch("Pedido", ex2)
            'comento esto porque pedido no puede llamar a detalle
        End Try
    End Sub

End Class