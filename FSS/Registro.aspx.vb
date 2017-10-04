Imports System.Web.Security
Imports System.Security.Cryptography
Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Registro
    Inherits PaginaBase
    Private _clienteN As New neg.ClienteN
    Public Property miClienteN() As neg.ClienteN
        Get
            Return _clienteN
        End Get
        Set(ByVal value As neg.ClienteN)
            _clienteN = value
        End Set
    End Property

    Private Sub Registro_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Registro")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Registro", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Registro", ex2)
        End Try
    End Sub

    Private Sub Registro_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            If Me.Autenticado = 1 Then
                Response.Redirect("~/Inicio.aspx")
            Else
                ControlarConsistencia("Registro")
            End If

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Registro", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Registro", ex2)
        End Try
    End Sub
    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function

    Protected Sub RegistroBtn_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        'si ingreso todos los datos correctamente
        If Page.IsValid = True Then
            'nuevo cliente
            'Dim miClienteN As New neg.ClienteN
            Dim miCliente As New ent.Cliente
            miCliente.login = Name.Text
            miCliente.email = Email.Text
            miCliente.pass = Password.Text
            miCliente.pregunta = LstPregunta.SelectedItem.Text
            miCliente.respuesta = Encriptar(TxtRespuesta.Text)
            miClienteN.miCliente = miCliente
            Dim Existe_usuario = miClienteN.Existe()
            'controlar si ya existe el nombre de usuario
            If Existe_usuario Then
                EnviarMensaje(Panel1, "El nombre de usuario ya esta en uso", True)
            Else
                Dim resultado As Integer = miClienteN.Nuevo()
                If resultado > -1 Then
                    Response.Redirect("Login.aspx")
                    miMensajero.EscribirBitacora("Registro", miUsuario.login, "El nuevo usuario " + Name.Text + "se registró en el sistema")
                Else
                    EnviarMensaje(Panel1, "Falló la registración", True)
                    miMensajero.EscribirBitacora("Registro", miUsuario.login, "Error al registrar nuevo usuario: " & Name.Text)
                End If

            End If
        End If
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class