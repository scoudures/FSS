Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Security.Cryptography
Public Class RecuperarCuenta
    Inherits PaginaBase
    Private _miCliente As New ent.Cliente
    Public Property miCliente() As ent.Cliente
        Get
            Return _miCliente
        End Get
        Set(ByVal value As ent.Cliente)
            _miCliente = value
        End Set
    End Property
    Private _clienteNeg As New neg.ClienteN
    Public Property clienteNeg() As neg.ClienteN
        Get
            Return _clienteNeg
        End Get
        Set(ByVal value As neg.ClienteN)
            _clienteNeg = value
        End Set
    End Property

    Private Sub RecuperarCuenta_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("RecuperarCuenta")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("PAGINA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("PAGINA", ex2)
        End Try
    End Sub

    Private Sub RecuperarCuenta_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("PAGINA")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("PAGINA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("PAGINA", ex2)
        End Try
    End Sub

    Protected Sub btnCancelPass_Click(sender As Object, e As EventArgs) Handles btnCancelPass.Click
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub btnGuardarPass_Click(sender As Object, e As EventArgs) Handles btnGuardarPass.Click
        miCliente.DNI = txtDNI.Text
        miCliente.pregunta = LstPregunta.SelectedItem.Text
        miCliente.respuesta = Encriptar(TxtRespuesta.Text)
        miCliente.pass = txtPass.Text
        clienteNeg.miCliente = miCliente
        If validarPregunta() Then
            modificarContrasenia()
        End If
    End Sub
    Private Function validarPregunta() As Boolean
        Dim resultado As Boolean = False
        If clienteNeg.ValidarPregunta() Then
            EnviarMensaje(Panel1, "La respuesta es correcta.", True)
            resultado = True
        Else
            EnviarMensaje(Panel1, "Los datos ingresados no son válidos.", True)
        End If
        Return resultado
    End Function
    
    Private Sub modificarContrasenia()
        clienteNeg.ModificarPass()
        PanelPass.Visible = False
        PanelPregunta.Visible = False
        btnGuardarPass.Visible = False
        btnCancelPass.Visible = False
        miMensajero.EscribirBitacora("Update", miUsuario.login, "El cliente con DNI " & txtDNI.Text & " recuperó su cuenta y modificó su contraseña.")
        EnviarMensaje(Panel1, "Su contraseña fue modificada satisfactoriamente.", True)
    End Sub
    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class