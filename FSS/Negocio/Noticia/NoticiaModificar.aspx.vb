Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio


Public Class NoticiaModificar
    Inherits PaginaBase

    Private _noticiaN As New Negocio.NoticiaN
    Public Property NoticiaN() As Negocio.NoticiaN
        Get
            Return _noticiaN
        End Get
        Set(ByVal value As Negocio.NoticiaN)
            _noticiaN = value
        End Set
    End Property

    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("NoticiaModificar")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'esta linea es para evitar que tire un error "UnobstrusiveValidation..." por el uso
            'de los controles de validacion, sino hay que actualizar Jquery.
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None

            If Not IsPostBack Then
                If Not Request.Params("CodigoNoticia") Is Nothing Then
                    Dim miNoticia As New Entidades.Noticia
                    Dim codigoNoticia As Integer = Request.Params("CodigoNoticia")
                    miNoticia.CodigoNoticia = codigoNoticia

                    miNoticia = NoticiaN.getByCodigo(miNoticia)
                    TxtTitulo.Text = miNoticia.Titulo
                    TxtSubtitulo.Text = miNoticia.Subtitulo
                    TxtTexto.Text = miNoticia.Texto
                    txtRuta.Text = miNoticia.RutaImagen
                    Image1.ImageUrl = "~/Imagenes/" + miNoticia.RutaImagen

                End If
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaModificar", ex2)
        End Try
    End Sub
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("NoticiaModificar")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaModificar", ex2)
        End Try
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim resultado As Integer
        If Not Request.Params("CodigoNoticia") Is Nothing Then
            Try
                'creo objeto be y cargo los datos
                Dim miNoticia As New Entidades.Noticia
                'obtengo el codigo del proveedor que me viene por la URL
                miNoticia.CodigoNoticia = Request.Params("CodigoNoticia")
                miNoticia.Titulo = TxtTitulo.Text
                miNoticia.Subtitulo = TxtSubtitulo.Text
                miNoticia.Texto = TxtTexto.Text
                If FileUpload1.HasFile Then
                    miNoticia.RutaImagen = FileUpload1.FileName
                Else
                    miNoticia.RutaImagen = txtRuta.Text
                End If
                'subo la imagen
                subirImagen()

                'actualizo en la BD
                resultado = NoticiaN.Modificar(miNoticia)
            Catch ex As Exception
                TratarErrorEnCatch("NoticiaModificar", ex)
            End Try
            'vuelvo a la página del Gestor
            Response.Redirect("~/Negocio/GestorNoticias.aspx")
        End If
    End Sub
    Private Sub subirImagen()
        Try
            If FileUpload1.HasFile Then
                Dim fileName As String = FileUpload1.FileName
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Imagenes/") & fileName)
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaModificar", ex2)
        End Try
    End Sub


    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/GestorNoticias.aspx")
    End Sub

End Class