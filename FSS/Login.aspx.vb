Imports ent = _03_Entidades
Imports neg = _02_Negocio
Public Class Login
    Inherits PaginaBase
    Private Sub Login_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Login")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CInt(Session("Inconsistente")) = 1 Then
            'EnviarMensaje(Panel1, "El sistema se encuentra inconsistente, sólo puede ingresar el Administrador", True)
            MostrarMensajeModal("msgInconsistente", True)
        Else
            Try
                If Not IsPostBack Then
                    miTraductor.traducirPaginaPara(Me, miUsuario)
                End If
            Catch ex As ent.miClaseExcepcion
                TratarErrorEnCatch("Login", ex)
            Catch ex2 As Exception
                TratarErrorEnCatch("Login", ex2)
            End Try

        End If
    End Sub

    Private Sub Login_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If CInt(Session("Inconsistente")) <> 1 Then
            Try
                ControlarConsistencia("Login")
            Catch ex As ent.miClaseExcepcion
                TratarErrorEnCatch("Login", ex)
            Catch ex2 As Exception
                TratarErrorEnCatch("Login", ex2)
            End Try
        End If
    End Sub
    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click

        If CInt(Session("Inconsistente")) = 1 Then
            'Solo puede ingresar el administrador
            If txtLogin.Value = "Administrador" Then
                'Se crea un objeto User
                Dim usuarioBuscar As New ent.Usuario
                usuarioBuscar.login = txtLogin.Value
                usuarioBuscar.pass = txtPassword.Value
                'Busco el Login
                Dim miLista As List(Of ent.Usuario)
                miLista = miUsuarioN.listar(usuarioBuscar)
                If miLista.Count > 0 Then
                    'El usuario existe
                    If miLista.Item(0).pass = usuarioBuscar.pass Then
                        'la password es correcta
                        Dim unUsuario As New ent.Usuario
                        unUsuario.login = miLista.Item(0).login
                        unUsuario.idioma = miLista.Item(0).idioma
                        miUsuario = unUsuario
                        miMensajero.EscribirBitacora("Login Exitoso", miUsuario.login, "Accedio al sistema el usuario " & miUsuario.login)
                        Me.Autenticado = 1
                        miUsuario.misPermisos = miUsuarioN.BuscarPermisos(miUsuario)
                        Response.Redirect("~/Tecnicos/Integridad.aspx", False)
                    End If
                End If
            Else
                Response.Redirect("~/Sorry.aspx", False)
            End If
        Else
            Try
                If txtLogin.Value <> "" And txtPassword.Value <> "" Then
                    'Se crea un objeto User
                    Dim usuarioBuscar As New ent.Usuario
                    usuarioBuscar.login = txtLogin.Value
                    usuarioBuscar.pass = txtPassword.Value

                    'Busco el Login
                    Dim miLista As List(Of ent.Usuario)
                    miLista = miUsuarioN.listar(usuarioBuscar)
                    If miLista.Count > 0 Then
                        'El usuario existe
                        If miLista.Item(0).pass = usuarioBuscar.pass Then
                            'la password es correcta
                            Dim unUsuario As New ent.Usuario
                            unUsuario.login = miLista.Item(0).login
                            unUsuario.idioma = miLista.Item(0).idioma
                            miUsuario = unUsuario
                            miMensajero.EscribirBitacora("Login Exitoso", miUsuario.login, "Accedio al sistema el usuario " & miUsuario.login)
                            Me.Autenticado = 1
                            'miUsuario.misPermisos = miUsuarioN.PerfilesIN(miUsuario)
                            miUsuario.misPermisos = miUsuarioN.BuscarPermisos(miUsuario)
                            Response.Redirect("~/Bienvenida.aspx", False)
                            'Response.Redirect("~/Catalogo.aspx?Linea=Botas", False)
                            'Response.Redirect("~/Inicio.aspx", False)
                        Else
                            'password incorrecta
                            'EnviarMensaje("msgVerificar")
                            'EnviarMensaje(Panel1, "Los datos ingresados son incorrectos", True)
                            MostrarMensajeModal("msgDatosIncorrectos", True)
                            miMensajero.EscribirBitacora("Intento de Login", miUsuario.login, "Trato de acceder al sistema el usuario " & txtLogin.Value & " con password incorrecta.")
                        End If
                    Else
                        'El usuario no exite
                        'EnviarMensaje("msgVerificar")
                        'EnviarMensaje(Panel1, "Los datos ingresados son incorrectos", True)
                        MostrarMensajeModal("msgDatosIncorrectos", True)
                        miMensajero.EscribirBitacora("Intento de Login", miUsuario.login, "Trato de acceder al sistema el usuario inexistente " & txtLogin.Value)
                    End If
                Else
                    'Pedir datos
                    'EnviarMensaje("msgIngresarDatos")
                    'EnviarMensaje(Panel1, "Debe Ingresar los datos solicitados", True)

                    MostrarMensajeModal("msgDatosLogin", True)
                    miMensajero.EscribirBitacora("Intento de Login", miUsuario.login, "Intento de Login sin datos.")
                End If
            Catch ex As ent.miClaseExcepcion
                TratarErrorEnCatch("Login", ex)
            Catch ex2 As Exception
                TratarErrorEnCatch("Login", ex2)
            End Try
        End If
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Try
            Response.Redirect("~/Inicio.aspx")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Login", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Login", ex2)
        End Try
    End Sub

#Region "Pantalla Modal"

    Private Sub MostrarMensajeModal(Msg As String, simple As Boolean, Optional traducir As Boolean = True)
        'traducir los botones
        OK.InnerText = miTraductor.obtenerLeyenda("OK", miUsuario)
        btnModalSi.InnerText = miTraductor.obtenerLeyenda("btnModalSi", miUsuario)
        btnModalNo.InnerText = miTraductor.obtenerLeyenda("btnModalNo", miUsuario)
        If Not simple Then
            If traducir Then
                Try
                    msgModalSiNo.Text = miTraductor.obtenerLeyenda(Msg, miUsuario)
                Catch ex As ent.miClaseExcepcion
                    TratarErrorEnCatch("Login", ex)
                Catch ex2 As Exception
                    TratarErrorEnCatch("Login", ex2)
                End Try
            Else
                msgModalSiNo.Text = Msg
            End If
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModalSiNo();", True)
        Else
            If traducir Then
                Try
                    msgModal.Text = miTraductor.obtenerLeyenda(Msg, miUsuario)

                Catch ex As ent.miClaseExcepcion
                    TratarErrorEnCatch("Login", ex)
                Catch ex2 As Exception
                    TratarErrorEnCatch("Login", ex2)
                End Try
            Else
                msgModal.Text = Msg
            End If
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModalOk();", True)
        End If

    End Sub

    Private Sub OK_ServerClick(sender As Object, e As EventArgs) Handles OK.ServerClick
        'no hago nada
    End Sub
    Private Sub btnModalSi_ServerClick(sender As Object, e As EventArgs) Handles btnModalSi.ServerClick
        'no hago nada
    End Sub
#End Region
End Class