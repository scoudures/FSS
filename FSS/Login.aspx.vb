Imports ent = _03_Entidades
Imports neg = _02_Negocio
Public Class Login
    Inherits PaginaBase
    Private Sub Login_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Login")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CInt(Session("Inconsistente")) = 1 Then
            EnviarMensaje(Panel1, "El sistema se encuentra inconsistente, sólo puede ingresar el Administrador", True)
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
            If txtLogin.Text = "Administrador" Then
                'Se crea un objeto User
                Dim usuarioBuscar As New ent.Usuario
                usuarioBuscar.login = txtLogin.Text
                usuarioBuscar.pass = txtPassword.Text
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
                Response.Redirect("~/Error.aspx", False)
            End If
        Else
            Try
                If txtLogin.Text <> "" And txtPassword.Text <> "" Then
                    'Se crea un objeto User
                    Dim usuarioBuscar As New ent.Usuario
                    usuarioBuscar.login = txtLogin.Text
                    usuarioBuscar.pass = txtPassword.Text

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
                            EnviarMensaje(Panel1, "Los datos ingresados son incorrectos", True)
                            miMensajero.EscribirBitacora("Intento de Login", miUsuario.login, "Trato de acceder al sistema el usuario " & txtLogin.Text & " con password incorrecta.")
                        End If
                    Else
                        'El usuario no exite
                        'EnviarMensaje("msgVerificar")
                        EnviarMensaje(Panel1, "Los datos ingresados son incorrectos", True)
                        miMensajero.EscribirBitacora("Intento de Login", miUsuario.login, "Trato de acceder al sistema el usuario inexistente " & txtLogin.Text)
                    End If
                Else
                    'Pedir datos
                    'EnviarMensaje("msgIngresarDatos")
                    EnviarMensaje(Panel1, "Debe Ingresar los datos solicitados", True)
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
End Class