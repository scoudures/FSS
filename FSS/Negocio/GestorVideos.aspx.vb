Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class GestorVideos
    Inherits PaginaBase

    Private _videoN As New Negocio.VideoN
    Public Property videoN() As Negocio.VideoN
        Get
            Return _videoN
        End Get
        Set(ByVal value As Negocio.VideoN)
            _videoN = value
        End Set
    End Property

    Private Sub GestorVideos_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("GestorVideos")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                enlazar()
            End If

        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("GestorVideos", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorVideos", ex2)
        End Try
    End Sub

    Private Sub GestorVideos_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("GestorVideos")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("GestorVideos", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorVideos", ex2)
        End Try
    End Sub

    Public Sub enlazar()
        grdVideos.DataSource = videoN.listarTodo
        grdVideos.DataBind()
    End Sub
    Private Sub dgvVideoes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdVideos.RowCommand

        If e.CommandName = "modificar" Then
            'redirijo a la pagina para modificar, paso codigo por url
            Response.Redirect("~/Negocio/Video/VideoModificar.aspx?codigoVideo=" + e.CommandArgument)

        ElseIf e.CommandName = "eliminar" Then
            'obtengo el id desde el campo argumento asociado al boton eliminar.
            Dim codigoVideo As Integer = e.CommandArgument
            Dim miVideo As New Entidades.Video
            miVideo.CodigoVideo = codigoVideo
            'eliminar registro
            videoN.Eliminar(miVideo)
            'actualizar grilla
            enlazar()
        ElseIf e.CommandName = "nuevo" Then
            'redirijo a la pagina para insertar un nuevo registro
            Response.Redirect("~/Negocio/Video/VideoNuevo.aspx")
        End If
    End Sub
End Class