Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Catalogo
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

    Dim misProductos As New List(Of ent.Producto)
    Dim misLineas As New List(Of ent.Linea)

    Private Sub Catalogo_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Catalogo")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Dim miLineaN As New neg.LineaN
                misLineas = miLineaN.listar
                RepeaterLinea.DataSource = misLineas
                RepeaterLinea.DataBind()
                Dim lineaProducto As New ent.Linea
                If Request.Params("linea") IsNot Nothing Then
                    lineaProducto.descripcion = Request.Params("linea").ToString
                    listarProductos(lineaProducto)
                End If
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Catalogo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Catalogo", ex2)
        End Try
    End Sub

    Private Sub Catalogo_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("Catalogo")
            'si hay un usuario logueado muestro "Agregar al pedido"
            'Restringir(Me)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Catalogo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Catalogo", ex2)
        End Try
    End Sub

    'Private Sub Restringir(ByRef parent As Control)
    '    Try
    '        For Each c As Control In parent.Controls
    '            'controles hijos
    '            If Not c.ID Is Nothing And c.Controls.Count = 0 Then
    '                If c.ID = "Agregaralpedido" Then
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

    Private Sub listarProductos(ByRef unaLinea As ent.Linea)
        Try
            misProductos = miProductoN.listar(unaLinea)
            lstProducto.DataSource = misProductos
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Catalogo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Catalogo", ex2)
        End Try

    End Sub

End Class