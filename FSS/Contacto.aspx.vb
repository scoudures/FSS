Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Net.Mail
Public Class Contacto
    Inherits PaginaBase
    Private nivelNeg As New neg.NivelN
    Public Property miNivelN() As neg.NivelN
        Get
            Return nivelNeg
        End Get
        Set(ByVal value As neg.NivelN)
            nivelNeg = value
        End Set
    End Property
    Dim misNiveles As New List(Of ent.Nivel)

    Private _consultaNeg As New neg.ConsultaN
    Public Property consultaNeg() As neg.ConsultaN
        Get
            Return _consultaNeg
        End Get
        Set(ByVal value As neg.ConsultaN)
            _consultaNeg = value
        End Set
    End Property

    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Contacto")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            listarNiveles()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Contacto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Contacto", ex2)
        End Try
    End Sub
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("Contacto")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Contacto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Contacto", ex2)
        End Try

    End Sub
    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            Dim miConsulta As New ent.Consulta
            'insert consulta
            miConsulta.email = Txtemail.Text
            miConsulta.nivel = lstNivel.SelectedValue.ToString
            miConsulta.texto = TxtMensaje.Text
            consultaNeg.miConsulta = miConsulta
            consultaNeg.Nuevo()
            miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó una nueva consulta: " & Txtemail.Text)
            'enviar email (en la UAI no funciona)
            'envioMail()

            'TODO OK
            LblMsg.ForeColor = Drawing.Color.Green
            LblMsg.Text = "Su consulta fue enviada satisfactoriamente! "
            txtAsunto.Text = ""
            Txtemail.Text = ""
            TxtMensaje.Text = ""
            TxtNombre.Text = ""

        Catch ex As SmtpException
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Error al enviar correo: "
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Contacto", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Contacto", ex2)
        End Try
    End Sub
    Private Sub listarNiveles()
        Try
            misNiveles = miNivelN.listar()
            lstNivel.DataSource = misNiveles
            lstNivel.DataValueField = "Descripcion"
            lstNivel.SelectedIndex = 0
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Private Sub envioMail()
        'objeto necesario para conectarse al servidor smtp
        Dim SmtpServer As New SmtpClient()

        'objeto email
        Dim mail As New MailMessage()
        SmtpServer.UseDefaultCredentials = False
        SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network
        SmtpServer.Credentials = New Net.NetworkCredential("contacto.fsskate@gmail.com", "fss123456")
        'SmtpServer.Port = 465
        SmtpServer.EnableSsl = True
        SmtpServer.Port = 587
        SmtpServer.Host = "smtp.gmail.com"

        'armo el email
        mail = New MailMessage()
        mail.From = New MailAddress(Txtemail.Text)
        mail.To.Add("contacto.fsskate@gmail.com")
        mail.Subject = "FSS CONTACTO - " + txtAsunto.Text
        mail.Body = txtAsunto.Text & " de " & Txtemail.Text & " - Mensaje: " & TxtMensaje.Text
        SmtpServer.Send(mail)

    End Sub
End Class