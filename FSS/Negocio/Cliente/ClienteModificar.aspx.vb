Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Web.Security
Imports System.Security.Cryptography
Public Class ClienteModificar
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
    Private Sub Cliente_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("ClienteModificar")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Not Session("Cliente") Is Nothing Then
                    miCliente = DirectCast(Session("Cliente"), ent.Cliente)
                    ClienteNeg.miCliente = miCliente
                    miCliente = ClienteNeg.Mostrar2()
                Else
                    miCliente = New ent.Cliente
                End If
                cargarDatos()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ClienteModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ClienteModificar", ex2)
        End Try
    End Sub

    Private Sub Cliente_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("ClienteModificar")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ClienteModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ClienteModificar", ex2)
        End Try

    End Sub
    Private Sub cargarDatos()
        Try
            txtDNI.Text = miCliente.DNI.ToString
            txtNombre.Text = miCliente.nombre.ToString
            txtApellido.Text = miCliente.apellido.ToString
            txtLogin.Text = miCliente.login.ToString
            txtEmail.Text = miCliente.email.ToString
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Cliente", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Cliente", ex2)
        End Try
    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/Cliente.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            miCliente.login = txtLogin.Text
            miCliente.DNI = txtDNI.Text
            miCliente.nombre = txtNombre.Text
            miCliente.apellido = txtApellido.Text
            miCliente.email = txtEmail.Text
            ClienteNeg.miCliente = miCliente
            ClienteNeg.Modificar()
            cargarDatos()
            miMensajero.EscribirBitacora("Update", miUsuario.login, "Realizó cambios en sus datos personales.")
            EnviarMensaje(Panel1, "La modificiación se realizó exitosamente.", True)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ClienteModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ClienteModificar", ex2)
        End Try
    End Sub

    Protected Sub btnPass_Click(sender As Object, e As EventArgs) Handles btnPass.Click
        PanelPass.Visible = True
    End Sub

    Protected Sub btnPreg_Click(sender As Object, e As EventArgs) Handles btnPreg.Click
        PanelPregunta.Visible = True
    End Sub

    Protected Sub btnGuardarPass_Click(sender As Object, e As EventArgs) Handles btnGuardarPass.Click
        miCliente.DNI = txtDNI.Text
        miCliente.nombre = txtNombre.Text
        miCliente.apellido = txtApellido.Text
        miCliente.email = txtEmail.Text
        miCliente.pass = txtPass.Text
        ClienteNeg.miCliente = miCliente
        ClienteNeg.Modificar()
        miMensajero.EscribirBitacora("Update", miUsuario.login, "Modificó su contraseña.")
        cargarDatos()
        PanelPass.Visible = False
        EnviarMensaje(Panel1, "Se modificó la contraseña.", True)
    End Sub

    Protected Sub btnCancelPass_Click(sender As Object, e As EventArgs) Handles btnCancelPass.Click
        PanelPass.Visible = False
    End Sub

    Protected Sub btnGuardarPreg_Click(sender As Object, e As EventArgs) Handles btnGuardarPreg.Click
        miCliente.DNI = txtDNI.Text
        miCliente.nombre = txtNombre.Text
        miCliente.apellido = txtApellido.Text
        miCliente.email = txtEmail.Text
        miCliente.pregunta = LstPregunta.SelectedItem.Text
        miCliente.respuesta = Encriptar(TxtRespuesta.Text)
        ClienteNeg.miCliente = miCliente
        ClienteNeg.Modificar()
        miMensajero.EscribirBitacora("Update", miUsuario.login, "Modificó su pregunta secreta.")
        cargarDatos()
        PanelPregunta.Visible = False
        EnviarMensaje(Panel1, "Se modificó la pregunta secreta.", True)
    End Sub

    Protected Sub btnCancelPreg_Click(sender As Object, e As EventArgs) Handles btnCancelPreg.Click
        PanelPregunta.Visible = False
    End Sub
    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class