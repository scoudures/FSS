Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Backup
    Inherits PaginaBase

    Private _miBackup As New neg.BackupN
    Public Property miBackup() As neg.BackupN
        Get
            Return _miBackup
        End Get
        Set(ByVal value As neg.BackupN)
            _miBackup = value
        End Set
    End Property

    Dim Archivo As String = ""
    
    Private Sub Backup_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Backup")
    End Sub

    Private Sub Backup_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                ListarBackup()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try
    End Sub

    'PreRender => en el ciclo de vida de la Pagina ASP realiza los últimos cambios sobre la página y sus controles
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Backup")
            ControlarConsistencia("Backup")
            If Not Archivo Is Nothing Then
                txtArchivo.Text = Archivo
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try
    End Sub

    Protected Sub ListarBackup()
        Try
            Dim miLista As List(Of ent.Backup) = miBackup.Listar()
            lstBKP.DataSource = miLista
            lstBKP.DataTextField = "archivo"
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try
    End Sub

    Protected Sub btnBackup_Click(sender As Object, e As EventArgs) Handles btnBackup.Click
        Try
            miBackup.HacerBackup()
            miMensajero.EscribirBitacora("Backup", miUsuario.login, "Se hizo una copia de seguridad.")
            ListarBackup()
            EnviarMensaje(Panel1, "Backup realizado", True)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try

    End Sub

    Protected Sub btnRestore_Click(sender As Object, e As EventArgs) Handles btnRestore.Click
        Try
            If txtArchivo.Text.Length > 0 Then
                miBackup.Restaurar(txtArchivo.Text)
                miMensajero.EscribirBitacora("Restore", miUsuario.login, "Se restauro el archivo " & txtArchivo.Text)

                miUsuario.idioma = "Español"
                miUsuario.login = "Administrador"
                'Response.Redirect("~/Inicio.aspx")
                Response.Redirect("~/Login.aspx")
            Else
                EnviarMensaje(Panel1, "Debe seleccionar una Copia de Seguridad.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try
    End Sub

    Protected Sub lstBKP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstBKP.SelectedIndexChanged
        Try
            Archivo = lstBKP.Items(lstBKP.SelectedIndex).ToString
            lblMensajeRestore.Visible = False
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Backup", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Backup", ex2)
        End Try
    End Sub

End Class