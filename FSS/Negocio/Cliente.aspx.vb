Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Cliente
    Inherits PaginaBase
    Private _ClienteNeg As New neg.ClienteN
    Public Property ClienteNeg() As neg.ClienteN
        Get
            Return _ClienteNeg
        End Get
        Set(ByVal value As neg.ClienteN)
            _ClienteNeg = value
        End Set
    End Property
    Public Property miCliente() As ent.Cliente
        Get
            Return DirectCast(Session("Cliente"), ent.Cliente)
        End Get
        Set(ByVal value As ent.Cliente)
            Session("Cliente") = value
        End Set
    End Property

    Dim misClientes As New List(Of ent.ClienteVista)

    Private Sub Cliente_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Cliente")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                listarClientes()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Cliente", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Cliente", ex2)
        End Try
    End Sub

    Private Sub Cliente_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            'ControlarAutenticacion("Cliente")
            ControlarConsistencia("Cliente")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Cliente", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Cliente", ex2)
        End Try

    End Sub
    Private Sub listarClientes()
        Try
            misClientes = ClienteNeg.Listar
            grdCliente.DataSource = misClientes
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Cliente", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Cliente", ex2)
        End Try
    End Sub

    Protected Sub grdCliente_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            lblMsg.Text = "Usted ha seleccionado el DNI " & grdCliente.SelectedRow.Cells(1).Text & " indique una acción a realizar: "
            Dim unCliente As New ent.Cliente
            unCliente.DNI = grdCliente.SelectedRow.Cells(1).Text
            Session("Cliente") = unCliente
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Font.Bold = True
            lblMsg.DataBind()
            btnEliminar.Visible = True
            btnModificar.Visible = True
            btnNuevo.Visible = False
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Cliente", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Cliente", ex2)
        End Try
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        Response.Redirect("~/Negocio/Cliente/ClienteNuevo.aspx")
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click
        Response.Redirect("~/Negocio/Cliente/ClienteModificar.aspx")
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        ClienteNeg.miCliente = New ent.Cliente
        ClienteNeg.miCliente.login = grdCliente.SelectedRow.Cells(4).Text
        ClienteNeg.Eliminar()
        lblMsg.Text = "Cliente eliminado satisfactoriamente!"
        listarClientes()
        btnModificar.Visible = False
        btnEliminar.Visible = False
        btnNuevo.Visible = True
    End Sub
End Class