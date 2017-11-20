Imports ent = _03_Entidades
Imports neg = _02_Negocio

Public Class PaginaBase
    Inherits System.Web.UI.Page
#Region "Propiedades"
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
    Private miUsuNeg As New neg.UsuarioN
    Public Property miUsuarioN() As neg.UsuarioN
        Get
            Return miUsuNeg
        End Get
        Set(ByVal value As neg.UsuarioN)
            miUsuNeg = value
        End Set
    End Property
    Private miTrad As New Traductor
    Public Property miTraductor() As Traductor
        Get
            Return miTrad
        End Get
        Set(ByVal value As Traductor)
            miTrad = value
        End Set
    End Property
    Private miMens As New neg.Mensajero
    Public Property miMensajero() As neg.Mensajero
        Get
            Return miMens
        End Get
        Set(ByVal value As neg.Mensajero)
            miMens = value
        End Set
    End Property

    Private miVerific As New neg.VerificadorN
    Public Property miVerificador() As neg.VerificadorN
        Get
            Return miVerific
        End Get
        Set(ByVal value As neg.VerificadorN)
            miVerific = value
        End Set
    End Property
#End Region
#Region "Controles"
    Public Sub EnviarMensaje(ByRef unPanel As Panel, ByVal unMensaje As String, ByVal sinTraducir As Boolean)
        Dim divControl As New HtmlGenericControl("div")
        divControl.Visible = True
        divControl.InnerHtml = "<br />"
        unPanel.Controls.Add(divControl)
        If sinTraducir Then
            Dim lblError As New Label
            lblError.ID = "msgAlUsuario"
            lblError.Text = unMensaje
            lblError.ForeColor = Drawing.Color.Red
            lblError.CssClass = "subtitulo"
            unPanel.Controls.Add(lblError)
        Else
            Dim lblError As New miEtiqueta
            lblError.ID = unMensaje
            miTraductor.traducirPara(lblError, miUsuario)
            lblError.ForeColor = Drawing.Color.Red
            unPanel.Controls.Add(lblError)
        End If
    End Sub
    Public Sub TratarErrorEnCatch(ByVal miPagina As String, ByRef ex As ent.miClaseExcepcion)
        Try
        If Me.miUsuario Is Nothing Then
            Dim unUsuario As New ent.Usuario
            unUsuario.login = "invitado"
            miUsuario = unUsuario
        End If
        miMensajero.EscribirBitacora("Excepcion", miUsuario.login, "Ocurrió una excepción en la Pagina " & miPagina & " => " & ex.Descripcion & " (" & ex.laexcepcion.Message & ")")
        Finally
            Response.Redirect("~/Sorry.aspx")
        End Try
    End Sub

    Public Sub TratarErrorEnCatch(ByVal miPagina As String, ByRef ex As Exception)
        Try
            If Me.miUsuario Is Nothing Then
                Dim unUsuario As New ent.Usuario
                unUsuario.login = "invitado"
                miUsuario = unUsuario
            End If
            miMensajero.EscribirBitacora("Excepcion", miUsuario.login, "Ocurrió una excepción GENERAL en la Pagina " & miPagina & " => " & ex.HResult.ToString & " (" & ex.Message & ")")
            If ex.Message <> "Subproceso anulado." Then
                Response.Redirect("~/Sorry.aspx")
            End If
        Finally
            'Response.Redirect("~/Sorry.aspx")
            Response.Redirect("~/Login.aspx")
        End Try
    End Sub
    Public Sub TratarErrorSinTry(ByVal miPagina As String)
        Try
            Dim miExcepcion As Exception = Server.GetLastError
            miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción DE ERROR en la Pagina " & miPagina & " => " & miExcepcion.Message)
            Server.ClearError()
        Finally
            Response.Redirect("~/Sorry.aspx")
        End Try
    End Sub
    Public Sub ControlarConsistencia(ByVal miPagina As String)
        If Not Session("Inconsistente") Is Nothing And Session("Inconsistente") = 1 Then
            Response.Redirect("~/Sorry.aspx")
        Else
            If Not IsPostBack Then
                'DIGITO VERIFICADOR
                Dim tablaErrores As New StringBuilder
                Dim FilaErrores As New StringBuilder

                If Not miVerificador.controlaTablasH(tablaErrores, FilaErrores) Then
                    'el control no dio bien
                    miMensajero.EscribirBitacora("Inconsistencias", "Sistema", "Inconsistencias => Tabla " & tablaErrores.ToString & " - Registro: " & FilaErrores.ToString)
                    Session("Inconsistente") = 1
                    If miUsuario Is Nothing Then
                        Response.Redirect("~/Sorry.aspx")
                    Else
                        If miUsuario.login = "Administrador" Then
                            Response.Redirect("~/Tecnicos/Integridad.aspx")
                        Else
                            Response.Redirect("~/Login.aspx")
                        End If
                    End If

                Else
                    miMensajero.EscribirBitacora("Consistencia OK", "Sistema", "Consistencia OK - " & miPagina)
                End If
            End If
        End If
    End Sub
    Public Sub ControlarAutenticacion(ByVal miPagina As String)
        If Me.Autenticado = 0 Then
            miMensajero.EscribirBitacora("NoAutenticado", miUsuario.login, "El usuario " & miUsuario.login & " intentó acceder a contenido restringido en " & miPagina & ".")
            Response.Redirect("~/NoAutenticado.aspx", False)
        End If
        If Not UsuarioTienePermisoPara(miPagina) Then
            miMensajero.EscribirBitacora("SinPermiso", miUsuario.login, "El usuario " & miUsuario.login & " intentó acceder a contenido restringido en " & miPagina & ".")
            Response.Redirect("~/NoAutenticado.aspx", False)
        End If
    End Sub
    Private Function UsuarioTienePermisoPara(ByVal miPagina As String) As Boolean
        Dim resultado As Boolean = False
        Dim usuarioNeg As New neg.UsuarioN
        miUsuario.misPermisos = usuarioNeg.BuscarPermisos(miUsuario)
        For Each permiso As ent.Permiso In miUsuario.misPermisos
            'SI EL NOMBRE DEL PERMISO ES IGUAL AL DE MI PAGINA
            If permiso.nombre = miPagina Then
                'SI ES UN PERMISO COMPUESTO (NO FAMILIA) Y SU ESTADO ES 1
                If permiso.codigo < 100 And permiso.seleccionado Then
                    resultado = True
                    'Response.Write(permiso.codigo.ToString & "-" & permiso.nombre.ToString & "-" & permiso.seleccionado.ToString)
                End If
            End If
        Next
        Return resultado
    End Function
#End Region
End Class
