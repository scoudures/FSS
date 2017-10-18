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
    Private _miIdioma As New Negocio.IdiomaN
    Public Property miIdioma() As Negocio.IdiomaN
        Get
            Return _miIdioma
        End Get
        Set(ByVal value As Negocio.IdiomaN)
            _miIdioma = value
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
            noticiaN.Nuevo(miNoticia)
            'obtengo el codigo
            miNoticia = noticiaN.NoticiaSelect(miNoticia)
            '*******************************************************
            'TRADUCCION AL ESPAÑOL
            Dim idioma1 As New Entidades.Idioma
            idioma1.nombre = "Español"
            Dim leyendasIdioma1 As New List(Of Entidades.Leyenda)
            'TITULO
            Dim tituloIdioma1 As New Entidades.Leyenda
            tituloIdioma1.tag = "Titulo_" + miNoticia.CodigoNoticia.ToString
            tituloIdioma1.texto = TxtTitulo.Text
            tituloIdioma1.textodefault = TxtTitulo.Text
            leyendasIdioma1.Add(tituloIdioma1)
            'SUBTITULO
            Dim subTituloIdioma1 As New Entidades.Leyenda
            subTituloIdioma1.tag = "Subtitulo_" + miNoticia.CodigoNoticia.ToString
            subTituloIdioma1.texto = TxtSubtitulo.Text
            subTituloIdioma1.textodefault = TxtSubtitulo.Text
            leyendasIdioma1.Add(subTituloIdioma1)
            'TEXTO
            Dim textoIdioma1 As New Entidades.Leyenda
            textoIdioma1.tag = "Texto_" + miNoticia.CodigoNoticia.ToString
            textoIdioma1.texto = TxtTexto.Text
            textoIdioma1.textodefault = TxtTexto.Text
            leyendasIdioma1.Add(textoIdioma1)
            '*******************************************************
            'TRADUCCION AL PORTUGUES
            Dim idioma2 As New Entidades.Idioma
            idioma2.nombre = "Portugues"
            Dim leyendasIdioma2 As New List(Of Entidades.Leyenda)
            'TITULO
            Dim tituloIdioma2 As New Entidades.Leyenda
            tituloIdioma2.tag = "Titulo_" + miNoticia.CodigoNoticia.ToString
            tituloIdioma2.texto = txtTitPort.Text
            tituloIdioma2.textodefault = TxtTitulo.Text
            leyendasIdioma2.Add(tituloIdioma2)
            'SUBTITULO
            Dim subTituloIdioma2 As New Entidades.Leyenda
            subTituloIdioma2.tag = "Subtitulo_" + miNoticia.CodigoNoticia.ToString
            subTituloIdioma2.texto = txtSubTitPort.Text
            subTituloIdioma2.textodefault = TxtSubtitulo.Text
            leyendasIdioma2.Add(subTituloIdioma2)
            'TEXTO
            Dim textoIdioma2 As New Entidades.Leyenda
            textoIdioma2.tag = "Texto_" + miNoticia.CodigoNoticia.ToString
            textoIdioma2.texto = txtTextoPort.Text
            textoIdioma2.textodefault = TxtTexto.Text
            leyendasIdioma2.Add(textoIdioma2)
            '*******************************************************
            'TRADUCCION AL INGLES
            Dim idioma3 As New Entidades.Idioma
            idioma3.nombre = "English"
            Dim leyendasIdioma3 As New List(Of Entidades.Leyenda)
            'TITULO
            Dim tituloIdioma3 As New Entidades.Leyenda
            tituloIdioma3.tag = "Titulo_" + miNoticia.CodigoNoticia.ToString
            tituloIdioma3.texto = txtTitEng.Text
            tituloIdioma3.textodefault = TxtTitulo.Text
            leyendasIdioma3.Add(tituloIdioma3)
            'SUBTITULO
            Dim subTituloIdioma3 As New Entidades.Leyenda
            subTituloIdioma3.tag = "Subtitulo_" + miNoticia.CodigoNoticia.ToString
            subTituloIdioma3.texto = txtSubTitEng.Text
            subTituloIdioma3.textodefault = TxtSubtitulo.Text
            leyendasIdioma3.Add(subTituloIdioma3)
            'TEXTO
            Dim textoIdioma3 As New Entidades.Leyenda
            textoIdioma3.tag = "Texto_" + miNoticia.CodigoNoticia.ToString
            textoIdioma3.texto = txtTextoEng.Text
            textoIdioma3.textodefault = TxtTexto.Text
            leyendasIdioma3.Add(textoIdioma3)
            '**************************************************************************
            'cargo la traduccion al español
            miIdioma.nuevaTraduccionNoticia(idioma1, miNoticia, leyendasIdioma1)
            'cargo la traduccion al portugues
            miIdioma.nuevaTraduccionNoticia(idioma2, miNoticia, leyendasIdioma2)
            'cargo la traduccion al ingles
            miIdioma.nuevaTraduccionNoticia(idioma3, miNoticia, leyendasIdioma3)
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