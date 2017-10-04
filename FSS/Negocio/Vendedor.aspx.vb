Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Vendedor
    Inherits PaginaBase
    Private _VendedorNeg As New neg.VendedorN
    Public Property VendedorNeg() As neg.VendedorN
        Get
            Return _VendedorNeg
        End Get
        Set(ByVal value As neg.VendedorN)
            _VendedorNeg = value
        End Set
    End Property
    Public Property miVendedor() As ent.Vendedor
        Get
            Return DirectCast(Session("Vendedor"), ent.Vendedor)
        End Get
        Set(ByVal value As ent.Vendedor)
            Session("Vendedor") = value
        End Set
    End Property
    Dim misVendedores As New List(Of ent.VendedorVista)
    Private Sub Vendedor_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Vendedor")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                listarVendedores()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Vendedor", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Vendedor", ex2)
        End Try
    End Sub

    Private Sub Vendedor_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            'ControlarAutenticacion("Vendedor")
            ControlarConsistencia("Vendedor")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Vendedor", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Vendedor", ex2)
        End Try
    End Sub

    Private Sub listarVendedores()
        Try
            misVendedores = VendedorNeg.Listar
            grdVendedor.DataSource = misVendedores
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Vendedor", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Vendedor", ex2)
        End Try
    End Sub
    Protected Sub grdVendedor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdVendedor.SelectedIndexChanged
        Try
            lblMsg.Text = "Usted ha seleccionado el DNI " & grdVendedor.SelectedRow.Cells(1).Text & " indique una acción a realizar: "
            Dim unVendedor As New ent.Vendedor
            unVendedor.DNI = grdVendedor.SelectedRow.Cells(1).Text
            Session("Vendedor") = unVendedor
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Font.Bold = True
            lblMsg.DataBind()
            btnEliminar.Visible = True
            btnModificar.Visible = True
            btnNuevo.Visible = False
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Vendedor", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Vendedor", ex2)
        End Try
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        Response.Redirect("~/Negocio/Vendedor/VendedorNuevo.aspx")
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click
        Response.Redirect("~/Negocio/Vendedor/VendedorModificar.aspx")
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        VendedorNeg.miVendedor = New ent.Vendedor
        VendedorNeg.miVendedor.login = grdVendedor.SelectedRow.Cells(4).Text
        VendedorNeg.Eliminar()
        lblMsg.Text = "Vendedor eliminado satisfactoriamente!"
        listarVendedores()
        btnModificar.Visible = False
        btnEliminar.Visible = False
        btnNuevo.Visible = True
    End Sub
End Class