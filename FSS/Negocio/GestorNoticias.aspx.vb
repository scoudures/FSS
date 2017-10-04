Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class GestorNoticias
    Inherits PaginaBase
    Private _noticiaN As New Negocio.NoticiaN
    Public Property noticiaN() As Negocio.NoticiaN
        Get
            Return _noticiaN
        End Get
        Set(ByVal value As Negocio.NoticiaN)
            _noticiaN = value
        End Set
    End Property

    Private Sub GestorNoticias_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("GestorNoticias")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                enlazar()
            End If

        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("GestorNoticias", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorNoticias", ex2)
        End Try

    End Sub

    Private Sub GestorNoticias_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("GestorNoticias")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("GestorNoticias", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorNoticias", ex2)
        End Try

    End Sub

    Public Sub enlazar()
        GridViewNoticias.DataSource = NoticiaN.listarTodo
        GridViewNoticias.DataBind()
    End Sub
    Private Sub dgvNoticiaes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridViewNoticias.RowCommand

        If e.CommandName = "modificar" Then
            'redirijo a la pagina para modificar, paso codigo por url
            Response.Redirect("~/Negocio/Noticia/NoticiaModificar.aspx?codigoNoticia=" + e.CommandArgument)

        ElseIf e.CommandName = "eliminar" Then
            'obtengo el id desde el campo argumento asociado al boton eliminar.
            Dim codigoNoticia As Integer = e.CommandArgument
            Dim miNoticia As New Entidades.Noticia
            miNoticia.CodigoNoticia = codigoNoticia
            'eliminar registro
            NoticiaN.Eliminar(miNoticia)
            'actualizar grilla
            enlazar()


        ElseIf e.CommandName = "nuevo" Then
            'redirijo a la pagina para insertar un nuevo registro
            Response.Redirect("~/Negocio/Noticia/NoticiaNueva.aspx")
        End If
    End Sub
End Class