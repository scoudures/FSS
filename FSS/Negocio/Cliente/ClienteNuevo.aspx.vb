Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Web.Security
Imports System.Security.Cryptography

Public Class ClienteNuevo
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
        TratarErrorSinTry("ClienteNuevo")
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
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ClienteNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ClienteNuevo", ex2)
        End Try
    End Sub

    Private Sub Cliente_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("ClienteNuevo")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("ClienteNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("ClienteNuevo", ex2)
        End Try

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("~/Negocio/Cliente.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        guardarDatos()
        EnviarMensaje(Panel1, "Se Registró el nuevo cliente satisfactoriamente!", True)
        Datos.Visible = False
        btnGuardar.Visible = False
        btnCancel.Text = "Finalizar"
    End Sub
    Private Sub guardarDatos()
        miCliente.login = txtLogin.Text
        miCliente.DNI = txtDNI.Text
        miCliente.nombre = txtNombre.Text
        miCliente.apellido = txtApellido.Text
        miCliente.email = txtEmail.Text
        miCliente.pass = txtPass.Text
        miCliente.pregunta = LstPregunta.SelectedItem.Text
        miCliente.respuesta = Encriptar(TxtRespuesta.Text)
        ClienteNeg.miCliente = miCliente
        ClienteNeg.Nuevo()
        miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se insertó un nuevo Cliente con DNI " & txtDNI.Text)
    End Sub
    
    Public Shared Function Encriptar(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class