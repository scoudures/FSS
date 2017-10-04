Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Usuario
    Inherits PaginaBase
    Dim misUsuarios As List(Of ent.Usuario)
    Dim miPerfilIN As List(Of ent.PermisoAbs)
    Dim miPerfilNOTIN As List(Of ent.PermisoAbs)

    Private Sub Usuario_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Usuario")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                enlazarUsuario()
                enlazarPerfil()
                EnlazarIdiomas()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub
    Private Sub Usuario_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Usuario")
            ControlarConsistencia("Usuario")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try

    End Sub
    Private Sub enlazarUsuario()
        Try
            misUsuarios = miUsuarioN.Todos
            lstUsuario.DataSource = misUsuarios
            lstUsuario.DataTextField = "login"
            txtDNI.Text = ""
            txtNombre.Text = ""
            txtApellido.Text = ""
            txtLogin.Text = ""
            txtPass.Text = ""
            DataBind()
            lstUsuario.Items(0).Selected = True
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Private Sub enlazarPerfil()
        Try
            Dim miUsuarioE As New ent.Usuario
            miUsuarioE.login = txtLogin.Text

            miPerfilIN = miUsuarioN.PerfilesIN(miUsuarioE)
            lstPerfilAsig.DataSource = miPerfilIN
            lstPerfilAsig.DataTextField = "nombre"
            lstPerfilAsig.DataBind()
            miUsuario.misPermisos = miPerfilIN
            miPerfilNOTIN = miUsuarioN.PerfilesNOTIN(miUsuarioE)
            lstPerfilDisp.DataSource = miPerfilNOTIN
            lstPerfilDisp.DataTextField = "nombre"
            lstPerfilDisp.DataBind()
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub
    Private Sub EnlazarIdiomas()
        Try
            Dim idiomas As New List(Of ent.Idioma)
            Dim idiomaNeg As New neg.IdiomaN
            idiomas = idiomaNeg.listar
            lstIdiomaUsuario.DataSource = idiomas
            lstIdiomaUsuario.DataTextField = "Nombre"
            lstIdiomaUsuario.DataBind()
            lstUsuario.SelectedIndex = 0
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub
    Private Sub enlazarUno()
        Try
            Dim miUsuarioE As New ent.Usuario
            miUsuarioE.login = txtLogin.Text
            grdUsuarios.DataSource = miUsuarioN.Uno(miUsuarioE)
            grdUsuarios.DataBind()
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub lstUsuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstUsuario.SelectedIndexChanged
        Try
            txtLogin.Text = lstUsuario.SelectedItem.Text
            Dim miUsuarioE As New ent.Usuario
            miUsuarioE.login = txtLogin.Text
            Dim elUsuario As New ent.Usuario
            elUsuario = miUsuarioN.Uno(miUsuarioE).Item(0)
            txtApellido.Text = elUsuario.apellido
            txtDNI.Text = elUsuario.DNI.ToString
            txtLogin.Text = elUsuario.login
            txtNombre.Text = elUsuario.nombre
            txtEmail.Text = elUsuario.email
            enlazarUno()
            enlazarPerfil()
            PanelDetalle.Visible = True
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        Try
            Dim resultado As Integer = 0
            Dim elUsuario As New ent.Usuario
            elUsuario.DNI = CInt(txtDNI.Text)
            elUsuario.nombre = txtNombre.Text
            elUsuario.idioma = lstIdiomaUsuario.SelectedItem.ToString
            elUsuario.apellido = txtApellido.Text
            elUsuario.login = txtLogin.Text
            elUsuario.pass = txtPass.Text
            elUsuario.email = txtEmail.Text
            resultado = miUsuarioN.Nuevo(elUsuario)
            'If resultado = -1 Then
            '    EnviarMensaje(Panel1, "Error", True)
            'Else
            '    EnviarMensaje(Panel1, "OK", True)
            'End If
            miMensajero.EscribirBitacora("ABM Usuario", miUsuario.login, "Alta del usuario " & elUsuario.login & ".")
            enlazarUsuario()
            PanelDetalle.Visible = False
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click
        Try
            If lstUsuario.SelectedIndex > -1 Then
                Dim resultado As Integer = 0
                Dim elUsuario As New ent.Usuario
                elUsuario.DNI = txtDNI.Text
                elUsuario.nombre = txtNombre.Text
                elUsuario.apellido = txtApellido.Text
                elUsuario.login = txtLogin.Text
                elUsuario.pass = txtPass.Text
                elUsuario.email = txtEmail.Text
                If lstIdiomaUsuario.SelectedIndex > -1 Then
                    elUsuario.idioma = lstIdiomaUsuario.SelectedItem.ToString
                Else
                    elUsuario.idioma = ""
                End If

                resultado = miUsuarioN.Modificar(elUsuario)
                'If resultado = -1 Then
                '    EnviarMensaje(Panel1, "Error", True)
                'Else
                '    EnviarMensaje(Panel1, "OK", True)
                'End If
                miMensajero.EscribirBitacora("ABM Usuario", miUsuario.login, "Modificacion del usuario " & elUsuario.login & ".")
                enlazarUsuario()
                PanelDetalle.Visible = False
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Usuario.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Try
            If lstUsuario.SelectedIndex > 0 Then
                Dim resultado As Integer = 0
                Dim elUsuario As New ent.Usuario
                If txtLogin.Text.Length > 0 Then
                    elUsuario.login = txtLogin.Text
                    If elUsuario.login.ToUpper = "ADMINISTRADOR" Or elUsuario.login.ToUpper = "INVITADO" Or elUsuario.login.ToUpper = "SISTEMA" Or elUsuario.login.ToUpper = "TODOS" Then
                        EnviarMensaje(Panel1, "El usuario " & elUsuario.login & " no puede ser eliminado.", True)
                    Else
                        resultado = miUsuarioN.Eliminar(elUsuario)
                        'If resultado = -1 Then
                        '    EnviarMensaje(Panel1, "Error", True)
                        'Else
                        '    EnviarMensaje(Panel1, "OK", True)
                        'End If
                    End If
                    miMensajero.EscribirBitacora("ABM Usuario", miUsuario.login, "Baja del usuario " & elUsuario.login & ".")
                    enlazarUsuario()
                    PanelDetalle.Visible = False
                End If
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Usuario.", True)
            End If

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnDisp_Click(sender As Object, e As EventArgs) Handles btnDisp.Click
        Try
            If lstUsuario.SelectedIndex > -1 And lstPerfilAsig.SelectedIndex > -1 Then
                'De asignados a disponibles
                Dim resultado As Integer = 0
                Dim elUsuario As New ent.Usuario
                elUsuario.login = txtLogin.Text
                Dim elPerfil As New ent.Permiso
                elPerfil.nombre = lstPerfilAsig.SelectedItem.Text

                If elUsuario.login.ToUpper = "ADMINISTRADOR" And elPerfil.nombre.ToUpper = "ADMINISTRADOR" Then
                    EnviarMensaje(Panel1, "El perfil " & elPerfil.nombre & " no puede ser quitado al usuario " & elUsuario.login & ".", True)
                ElseIf elPerfil.nombre.ToUpper = "DEFAULT" Then
                    EnviarMensaje(Panel1, "El perfil " & elPerfil.nombre & " no puede ser quitado a los usuarios.", True)
                ElseIf elUsuario.login.ToUpper = miUsuario.login.ToUpper And elUsuario.login.ToUpper <> "ADMINISTRADOR" Then
                    EnviarMensaje(Panel1, "No puede quitarle permisos al usuario autenticado.", True)
                Else
                    resultado = miUsuarioN.PerfilDesasignar(elUsuario, elPerfil)
                    'If resultado = -1 Then
                    '    EnviarMensaje(Panel1, "Error", True)
                    'Else
                    '    EnviarMensaje(Panel1, "OK", True)
                    'End If
                End If
                miMensajero.EscribirBitacora("ABM Usuario", miUsuario.login, "Al usuario " & elUsuario.login & " se le asigna el perfil " & elPerfil.nombre & ".")
                enlazarPerfil()
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Usuario y un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnAsig_Click(sender As Object, e As EventArgs) Handles btnAsig.Click
        Try
            If lstUsuario.SelectedIndex > -1 And lstPerfilDisp.SelectedIndex > -1 Then
                'De disponibles a Asignados
                Dim resultado As Integer = 0
                Dim elUsuario As New ent.Usuario
                elUsuario.login = txtLogin.Text
                Dim elPerfil As New ent.Permiso
                elPerfil.nombre = lstPerfilDisp.SelectedItem.Text
                resultado = miUsuarioN.PerfilAsignar(elUsuario, elPerfil)
                'If resultado = -1 Then
                '    EnviarMensaje(Panel1, "Error", True)
                'Else
                '    EnviarMensaje(Panel1, "OK", True)
                'End If
                miMensajero.EscribirBitacora("ABM Usuario", miUsuario.login, "Al usuario " & elUsuario.login & " se le quita el perfil " & elPerfil.nombre & ".")
                enlazarPerfil()
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Usuario y un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Usuario", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Usuario", ex2)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs) Handles btnLimpiar.Click
        limpiar()
    End Sub

    Protected Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        PanelDetalle.Visible = True
        limpiar()
    End Sub
    Private Sub limpiar()
        txtEmail.Text = ""
        txtDNI.Text = ""
        txtNombre.Text = ""
        txtApellido.Text = ""
        txtLogin.Text = ""
        txtPass.Text = ""
        lstUsuario.SelectedIndex = Nothing
    End Sub
End Class