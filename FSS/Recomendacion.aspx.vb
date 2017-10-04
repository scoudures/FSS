Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.Net.Mail

Public Class Recomendacion
    Inherits PaginaBase
    Private prodNeg As New neg.ProductoN
    Public Property miProductoN() As neg.ProductoN
        Get
            Return prodNeg
        End Get
        Set(ByVal value As neg.ProductoN)
            prodNeg = value
        End Set
    End Property
    Private _RecomendacionNeg As New neg.RecomendacionN
    Public Property RecomendacionNeg() As neg.RecomendacionN
        Get
            Return _RecomendacionNeg
        End Get
        Set(ByVal value As neg.RecomendacionN)
            _RecomendacionNeg = value
        End Set
    End Property


    Private nivelNeg As New neg.NivelN
    Public Property miNivelN() As neg.NivelN
        Get
            Return nivelNeg
        End Get
        Set(ByVal value As neg.NivelN)
            nivelNeg = value
        End Set
    End Property

    Dim misProductos As New List(Of ent.Producto)
    Dim losRecomendados As New List(Of ent.Recomendado)
    Dim misNiveles As New List(Of ent.Nivel)
    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Recomendacion")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                listarNiveles()
                SoyCliente()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub

    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            'Cualquiera puede acceder a esta página, no voy a controlar autenticación
            'ControlarAutenticacion("Recomendacion")
            ControlarConsistencia("Recomendacion")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            Dim unNivel As New ent.Nivel
            unNivel.descripcion = lstNivel.SelectedValue
            recomendame(unNivel)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Private Sub recomendame(ByRef unNivel As ent.Nivel)
        Try
            listarProductos()
            If misProductos.Count > 0 Then
                'muestro los productos del nivel seleccionado
                For Each producto As ent.Producto In misProductos
                    If producto.nivel = unNivel.descripcion Then
                        Dim unRecomendado As New ent.Recomendado(producto)
                        losRecomendados.Add(unRecomendado)
                    End If
                Next
                'ordeno la lista para que se vea el más vendido primero
                losRecomendados.Sort(New ent.Recomendado)
                Dim UsuarioNeg As New neg.UsuarioN
                If Me.Autenticado <> 1 And Not UsuarioNeg.EsCliente(miUsuario) Then
                    'Si no es cliente, necesito registrarlo
                    RecomendacionNeg.miRecomendacion.email = Txtemail.Text.ToString
                    RecomendacionNeg.miRecomendacion.nivel = unNivel.descripcion
                    RecomendacionNeg.Nuevo()
                    miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó una nueva solicitud de recomendación: " & Txtemail.Text)
                    'enviar email (en la UAI no funciona)
                    'enviarEmail(unNivel)
                End If
                'lblMsg.ForeColor = Drawing.Color.Green
                'lblMsg.Text = "Hemos recibido su solicitud de recomendación, un vendedor se pondrá en contacto con usted a la brevedad! "
                lblMsg.Text = "Recomendamos para el Nivel " & unNivel.descripcion & " los siguientes productos:"
                Txtemail.Text = ""
                TxtNombre.Text = ""
                panelDatos.Visible = False
                panelNiveles.Visible = False
                panelRecomendacion.Visible = True
                lstProducto.DataSource = losRecomendados
                DataBind()
            Else
                lblMsg.Text = "No se encontraron productos para el nivel seleccionado"
            End If
        Catch ex As SmtpException
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Text = "Error al enviar correo."
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Private Sub listarProductos()
        Try
            misProductos = miProductoN.listarConNiveles()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Private Sub listarNiveles()
        Try
            misNiveles = miNivelN.listar()
            lstNivel.DataSource = misNiveles
            lstNivel.DataValueField = "Descripcion"
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Recomendacion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Recomendacion", ex2)
        End Try
    End Sub
    Private Sub SoyCliente()
        Dim UsuarioNeg As New neg.UsuarioN
        If Me.Autenticado = 1 And UsuarioNeg.EsCliente(miUsuario) Then
            panelDatos.Visible = False
        End If
    End Sub
    Private Sub enviarEmail(ByRef unNivel As ent.Nivel)
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
        mail.Subject = "FSS CONTACTO - Solicitud de Recomendación"
        mail.Body = "Recomendacion para " & Txtemail.Text & " - Nivel: " & unNivel.descripcion
        SmtpServer.Send(mail)
    End Sub
End Class