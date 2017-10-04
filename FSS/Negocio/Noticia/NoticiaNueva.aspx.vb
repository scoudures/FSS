Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class NoticiaNueva
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

    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("NoticiaNueva")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'esta linea es para evitar que tire un error "UnobstrusiveValidation..." por el uso
            'de los controles de validacion, sino hay que actualizar Jquery.
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not Page.IsPostBack Then

            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaNueva", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaNueva", ex2)
        End Try
    End Sub
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("NoticiaNueva")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaNueva", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaNueva", ex2)
        End Try

    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        'vuelvo a la pagina listado de proveedores
        Response.Redirect("~/Negocio/GestorNoticias.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        'creo objeto y cargo los datos desde los textbox
        Dim miNoticia As New Entidades.Noticia
        miNoticia.Titulo = TxtTitulo.Text
        miNoticia.Subtitulo = TxtSubtitulo.Text
        miNoticia.Texto = TxtTexto.Text
        miNoticia.RutaImagen = FileUpload1.FileName

        Try
            'subo la imagen al directorio del servidor
            subirImagen()
            'actualizo la tabla noticia de la bd
            NoticiaN.Nuevo(miNoticia)

        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaNueva", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaNueva", ex2)

        End Try


        'vuelvo a la pagina de proveedor
        Response.Redirect("~/Negocio/GestorNoticias.aspx")
    End Sub

    Private Sub subirImagen()
        Try
            If FileUpload1.HasFile Then
                Dim fileName As String = FileUpload1.FileName
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Imagenes/") & fileName)
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("NoticiaNueva", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoticiaNueva", ex2)

        End Try
    End Sub

End Class