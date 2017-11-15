Imports ent = _03_Entidades
Imports neg = _02_Negocio

Public Class Maestra
    Inherits System.Web.UI.MasterPage

    Private _miIdiomaN As New neg.IdiomaN
    Public Property miIdiomaN() As neg.IdiomaN
        Get
            Return _miIdiomaN
        End Get
        Set(ByVal value As neg.IdiomaN)
            _miIdiomaN = value
        End Set
    End Property

    Private _miUsuarioN As New neg.UsuarioN
    Public Property miUsuarioN() As neg.UsuarioN
        Get
            Return _miUsuarioN
        End Get
        Set(ByVal value As neg.UsuarioN)
            _miUsuarioN = value
        End Set
    End Property

    Private _miVerificador As New neg.VerificadorN
    Public Property miVerificador() As neg.VerificadorN
        Get
            Return _miVerificador
        End Get
        Set(ByVal value As neg.VerificadorN)
            _miVerificador = value
        End Set
    End Property

    Private _miMensajero As New neg.Mensajero
    Public Property miMensajero() As neg.Mensajero
        Get
            Return _miMensajero
        End Get
        Set(ByVal value As neg.Mensajero)
            _miMensajero = value
        End Set
    End Property


    Dim idiomas As New List(Of ent.Idioma)
    Dim miTraductor As New Traductor
    Dim miPresentador As New Presentador

    Public Property miUsuario() As ent.Usuario
        Get
            Return DirectCast(Session("Usuario"), ent.Usuario)
        End Get
        Set(ByVal value As ent.Usuario)
            Session("Usuario") = value
        End Set
    End Property
    Public Property Autenticado() As Integer
        Get
            Return DirectCast(Session("Autenticado"), Integer)
        End Get
        Set(ByVal value As Integer)
            Session("Autenticado") = value
        End Set
    End Property

    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Master")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Threading.Thread.CurrentThread.CurrentCulture = New System.Globalization.CultureInfo("es-AR")
        Threading.Thread.CurrentThread.CurrentUICulture = New System.Globalization.CultureInfo("es-AR")
        If CInt(Session("Inconsistente")) <> 1 Then
            Try
                'en el load me ocupo del estado de los objetos
                If Not IsPostBack Then
                    EnlazarIdiomas()
                End If
                If Me.Autenticado = 1 Then
                    UsuarioLogueado.Text = "[" & miUsuario.login & "]"
                    'ACA HABIA IMPLEMENTADO DV PERO ENTRABA EN LOOP, ASI QUE LO IMPLEMENTE EN LAS PAGINAS QUE QUIERO CONTROLAR
                Else
                    If Me.miUsuario Is Nothing Then
                        Dim unUsuario As New ent.Usuario
                        unUsuario.login = "invitado"
                        miUsuario = unUsuario
                    End If
                End If
                'si no tiene un idioma se lo asigno
                If miUsuario.idioma Is Nothing Then
                    miUsuario.idioma = "Español"
                End If
                'evitar boton back en navegador
                Response.ClearHeaders()
                Response.AddHeader("Cache-Control", "no-cache,no-store,max-age=0,must-revalidate")
                Response.AddHeader("Pragma", "no-cache")
            Catch ex As Exception
                TratarErrorEnCatch("Master", ex)
            End Try
        End If
    End Sub
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        'en el pre-render me ocupo de la visualizacion de la pagina 
        'en base a los estados de los objetos del load
        If CInt(Session("Inconsistente")) = 1 And miUsuario.login.ToUpper = "ADMINISTRADOR" Then
            '************************************************************
            'si hay inconsistencias, descomentar la siguiente linea
            '************************************************************
            'miVerificador.generarDigitos()
            If Session("Integridad") = 1 Then
                'Estoy en la pagina Integridad
            Else
                Response.Redirect("~/Tecnicos/Integridad.aspx")
            End If

        End If
        'Try
        miUsuario.misPermisos = miUsuarioN.BuscarPermisos(miUsuario)
        '************************************************************
        'si no se ven los controles, comentar la siguiente linea
        '************************************************************
        miPresentador.ocultarTodo(Me)
        miPresentador.mostrarPaginaPara(Me, miUsuario)
        miTraductor.traducirPaginaPara(Me, miUsuario)
        If Me.Autenticado = 1 Then
            menuLogin.Visible = False
            menuRegistro.Visible = False
            menuSalir.Visible = True
        Else
            menuLogin.Visible = True
            menuRegistro.Visible = True
            menuSalir.Visible = False
        End If
        'Catch ex As Exception
        '    TratarErrorEnCatch("Master", ex)
        'End Try
    End Sub
    Protected Sub lstIdioma_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstIdioma.SelectedIndexChanged
        Try
            miMensajero.EscribirBitacora("Cambio de Idioma", miUsuario.login, "Se cambia del idioma " & miUsuario.idioma & " al idioma " & lstIdioma.SelectedItem.ToString)
            miUsuario.idioma = lstIdioma.SelectedItem.ToString
            Threading.Thread.CurrentThread.CurrentCulture = New System.Globalization.CultureInfo("es-AR")
            Threading.Thread.CurrentThread.CurrentUICulture = New System.Globalization.CultureInfo("es-AR")
            miTraductor.traducirPaginaPara(Me, miUsuario)
        Catch ex As Exception
            TratarErrorEnCatch("Master", ex)
        End Try
    End Sub
    Private Sub EnlazarIdiomas()
        Try
            idiomas = miIdiomaN.listar
            lstIdioma.DataSource = idiomas
            lstIdioma.DataTextField = "Nombre"
            lstIdioma.DataBind()
        Catch ex As Exception
            TratarErrorEnCatch("Master", ex)
        End Try
    End Sub

    Protected Sub menuSalir_Click(sender As Object, e As EventArgs) Handles menuSalir.Click
        Try
            Me.Autenticado = 0
            miMensajero.EscribirBitacora("Logout", miUsuario.login, "Salio del sistema el usuario " & miUsuario.login)
            Me.miUsuario = Nothing
            menuLogin.Visible = True
            menuSalir.Visible = False
            UsuarioLogueado.Text = ""

            'deslogueo el usuario
            Response.Cookies.Clear()

            'Elimino todas las variables de sesion
            Session("Idioma") = Nothing
            Session("Autenticado") = 0
            Session("Usuario") = Nothing
            Session.RemoveAll()
            Session.Abandon()

            'Vuelvo a la página de inicio
            Response.Redirect("~/Inicio.aspx")
        Catch ex As Exception
            TratarErrorEnCatch("Master", ex)
        End Try
    End Sub

    Protected Sub menuLogin_Click(sender As Object, e As EventArgs) Handles menuLogin.Click
        Response.Redirect("~/Login.aspx")
    End Sub
    Protected Sub menuContacto_Click(sender As Object, e As EventArgs) Handles menuContacto.Click
        Response.Redirect("~/Contacto.aspx")
    End Sub
    Protected Sub LinkRecomendacion_Click(sender As Object, e As EventArgs) Handles LinkRecomendacion.Click
        Response.Redirect("~/Recomendacion.aspx")
    End Sub
    Protected Sub menuBitacora_Click(sender As Object, e As EventArgs) Handles menuBitacora.Click
        Response.Redirect("~/Tecnicos/Bitacora.aspx")
    End Sub

    Protected Sub menuBackup_Click(sender As Object, e As EventArgs) Handles menuBackup.Click
        Response.Redirect("~/Tecnicos/Backup.aspx")
    End Sub
    Protected Sub menuIdioma_Click(sender As Object, e As EventArgs) Handles menuIdioma.Click
        Response.Redirect("~/Tecnicos/Idioma.aspx")
    End Sub
    Protected Sub menuDVV_Click(sender As Object, e As EventArgs) Handles menuDVV.Click
        Response.Redirect("~/Tecnicos/Integridad.aspx")
    End Sub
    Protected Sub menuPerfiles_Click(sender As Object, e As EventArgs) Handles menuPerfiles.Click
        Response.Redirect("~/Tecnicos/Perfil.aspx")
    End Sub

    Protected Sub menuUsuario_Click(sender As Object, e As EventArgs) Handles menuUsuario.Click
        Response.Redirect("~/Tecnicos/Usuario.aspx")
    End Sub
    Protected Sub menuCliente_Click(sender As Object, e As EventArgs) Handles menuCliente.Click
        Response.Redirect("~/Negocio/Cliente.aspx")
    End Sub

    Protected Sub menuVendedor_Click(sender As Object, e As EventArgs) Handles menuVendedor.Click
        Response.Redirect("~/Negocio/Vendedor.aspx")
    End Sub

    Protected Sub menuOrdenes_Click(sender As Object, e As EventArgs) Handles menuOrdenes.Click
        Response.Redirect("~/Negocio/Ordenes.aspx")
    End Sub
    Protected Sub menuProducto_Click(sender As Object, e As EventArgs) Handles menuProducto.Click
        Response.Redirect("~/Negocio/Producto.aspx")
    End Sub
    Protected Sub menuImagenes_Click(sender As Object, e As EventArgs) Handles menuImagenes.Click
        Response.Redirect("~/Negocio/GestorImagenes.aspx")
    End Sub
    Protected Sub menuRegistro_Click(sender As Object, e As EventArgs) Handles menuRegistro.Click
        Response.Redirect("~/Registro.aspx")
    End Sub
    Protected Sub menuAjustes_Click(sender As Object, e As EventArgs) Handles menuAjustes.Click
        Response.Redirect("~/Negocio/Cliente/Ajustes.aspx")
    End Sub

    Protected Sub menuCuenta_Click(sender As Object, e As EventArgs) Handles menuCuenta.Click
        Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
    End Sub

    Protected Sub menuDetalle_Click(sender As Object, e As EventArgs) Handles menuDetalle.Click
        Response.Redirect("~/Negocio/Detalle.aspx")
    End Sub

#Region "Controles"
    Private Sub TratarErrorEnCatch(ByVal miPagina As String, ByRef ex As ent.miClaseExcepcion)
        miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción en la Pagina " & miPagina & " => " & ex.Descripcion & " (" & ex.laexcepcion.Message & ")")
        If ex.Message <> "Subproceso anulado." Then
            Response.Redirect("~/Error.aspx")
        End If
    End Sub
    Private Sub TratarErrorEnCatch(ByVal miPagina As String, ByRef ex As Exception)
        miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción en la Pagina " & miPagina & " => " & ex.HResult.ToString & " (" & ex.Message & ")")
        If ex.Message <> "Subproceso anulado." Then
            Response.Redirect("~/Error.aspx")
        End If
    End Sub
    Private Sub TratarErrorSinTry(ByVal miPagina As String)
        Dim miExcepcion As Exception = Server.GetLastError
        miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción en la Pagina " & miPagina & " => " & miExcepcion.Message)
        Server.ClearError()
        If miExcepcion.Message <> "Subproceso anulado." Then
            Response.Redirect("~/Error.aspx")
        End If
    End Sub
#End Region

End Class