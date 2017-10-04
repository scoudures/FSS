Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Web.Security
Imports System.Security.Cryptography

Public Class VendedorModificar
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


    Private Sub Vendedor_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("VendedorModificar")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Not Session("Vendedor") Is Nothing Then
                    miVendedor = DirectCast(Session("Vendedor"), ent.Vendedor)
                    VendedorNeg.miVendedor = miVendedor
                    miVendedor = VendedorNeg.Mostrar2()
                Else
                    miVendedor = New ent.Vendedor
                End If
                cargarDatos()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorModificar", ex2)
        End Try
    End Sub

    Private Sub Vendedor_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("VendedorModificar")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorModificar", ex2)
        End Try
    End Sub
    Private Sub cargarDatos()
        Try
            txtDNI.Text = miVendedor.DNI.ToString
            txtNombre.Text = miVendedor.nombre.ToString
            txtApellido.Text = miVendedor.apellido.ToString
            txtLogin.Text = miVendedor.login.ToString
            txtEmail.Text = miVendedor.email.ToString
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorModificar", ex2)
        End Try
    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/Vendedor.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            miVendedor.login = txtLogin.Text
            miVendedor.DNI = txtDNI.Text
            miVendedor.nombre = txtNombre.Text
            miVendedor.apellido = txtApellido.Text
            miVendedor.email = txtEmail.Text
            VendedorNeg.miVendedor = miVendedor
            VendedorNeg.Modificar()
            cargarDatos()
            miMensajero.EscribirBitacora("Update", miUsuario.login, "Realizó cambios en sus datos personales.")
            EnviarMensaje(Panel1, "La modificiación se realizó exitosamente.", True)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorModificar", ex2)
        End Try
    End Sub

    Protected Sub btnPass_Click(sender As Object, e As EventArgs) Handles btnPass.Click
        PanelPass.Visible = True
    End Sub

    Protected Sub btnGuardarPass_Click(sender As Object, e As EventArgs) Handles btnGuardarPass.Click
        miVendedor.DNI = txtDNI.Text
        miVendedor.nombre = txtNombre.Text
        miVendedor.apellido = txtApellido.Text
        miVendedor.email = txtEmail.Text
        miVendedor.pass = txtPass.Text
        VendedorNeg.miVendedor = miVendedor
        VendedorNeg.Modificar()
        miMensajero.EscribirBitacora("Update", miUsuario.login, "Modificó su contraseña.")
        cargarDatos()
        PanelPass.Visible = False
        EnviarMensaje(Panel1, "Se modificó la contraseña.", True)
    End Sub

    Protected Sub btnCancelPass_Click(sender As Object, e As EventArgs) Handles btnCancelPass.Click
        PanelPass.Visible = False
    End Sub

    
    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class