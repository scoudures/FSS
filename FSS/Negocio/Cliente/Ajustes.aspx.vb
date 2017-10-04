Imports System.Web.Security
Imports System.Security.Cryptography
Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Ajustes
    Inherits PaginaBase
    Private _clienteNeg As New neg.ClienteN
    Public Property ClienteNeg() As neg.ClienteN
        Get
            Return _clienteNeg
        End Get
        Set(ByVal value As neg.ClienteN)
            _clienteNeg = value
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
    Private Sub Ajustes_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Ajustes")
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                If Me.miCliente Is Nothing Then
                    Dim unCliente As New ent.Cliente
                    unCliente.login = miUsuario.login
                    ClienteNeg.miCliente = unCliente
                    miCliente = ClienteNeg.Mostrar()
                End If
                cargarDatos()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ajustes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ajustes", ex2)
        End Try
    End Sub

    Private Sub Ajustes_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Ajustes")
            ControlarConsistencia("Ajustes")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Ajustes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ajustes", ex2)
        End Try
    End Sub
    Private Sub cargarDatos()
        Dim unCliente As New ent.Cliente
        unCliente.login = miUsuario.login
        ClienteNeg.miCliente = unCliente
        miCliente = ClienteNeg.Mostrar()
        txtDNI.Text = miCliente.DNI.ToString
        txtNombre.Text = miCliente.nombre.ToString
        txtApellido.Text = miCliente.apellido.ToString
        txtLogin.Text = miCliente.login.ToString
        txtEmail.Text = miCliente.email.ToString
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            miCliente.login = miUsuario.login
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
            TratarErrorEnCatch("Ajustes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Ajustes", ex2)
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
        'Implementar Encriptador
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