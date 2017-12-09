Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Restore
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
        TratarErrorSinTry("Restore")
    End Sub

    Private Sub Backup_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                ListarCambios()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Restore", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Restore", ex2)
        End Try
    End Sub

    'PreRender => en el ciclo de vida de la Pagina ASP realiza los últimos cambios sobre la página y sus controles
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Restore")
            ControlarConsistencia("Restore")

            If Session("BKP").ToString.Length > 0 Then
                blbResultado.Text = "Archivo a restaurar: " + Session("BKP").ToString
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Restore", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Restore", ex2)
        End Try
    End Sub

    Protected Sub ListarCambios()
        Try
            Dim miLista As List(Of ent.Cambio) = miBackup.ListarCambios()
            grdCambios.DataSource = miLista
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Restore", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Restore", ex2)
        End Try
    End Sub

    
    
    Protected Sub btnRestoreOK_Click(sender As Object, e As EventArgs) Handles btnRestoreOK.Click
        Try

            If Session("BKP").ToString.Length > 0 Then
                miBackup.Restaurar(Session("BKP").ToString)
                miMensajero.EscribirBitacora("Restore", miUsuario.login, "Se restauro el archivo " & Session("BKP").ToString)

                miUsuario.idioma = "Español"
                miUsuario.login = "Administrador"
                'Response.Redirect("~/Inicio.aspx")
                Response.Redirect("~/Login.aspx")
            Else
                Session("BKP") = ""
                Response.Redirect("~/Tecnicos/Backup.aspx")
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Restore", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Restore", ex2)
        End Try
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Session("BKP") = ""
        Response.Redirect("~/Tecnicos/Backup.aspx")
    End Sub
End Class