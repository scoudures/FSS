Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Web.Security
Imports System.Security.Cryptography
Public Class VendedorNuevo
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
        TratarErrorSinTry("VendedorNuevo")
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
            End If

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorNuevo", ex2)
        End Try
    End Sub

    Private Sub Vendedor_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("VendedorNuevo")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("VendedorNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VendedorNuevo", ex2)
        End Try
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("~/Negocio/Vendedor.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        guardarDatos()
        EnviarMensaje(Panel1, "Se Registró el nuevo Vendedor satisfactoriamente!", True)
        Datos.Visible = False
        btnGuardar.Visible = False
        btnCancel.Text = "Finalizar"
    End Sub
    Private Sub guardarDatos()
        miVendedor = New ent.Vendedor
        miVendedor.login = txtLogin.Text
        miVendedor.DNI = txtDNI.Text
        miVendedor.nombre = txtNombre.Text
        miVendedor.apellido = txtApellido.Text
        miVendedor.email = txtEmail.Text
        miVendedor.pass = txtPass.Text
        VendedorNeg.miVendedor = miVendedor
        VendedorNeg.Nuevo()
        miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se insertó un nuevo Vendedor con DNI " & txtDNI.Text)
    End Sub

    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class