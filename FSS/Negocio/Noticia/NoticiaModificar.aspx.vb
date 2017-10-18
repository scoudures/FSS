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
                    'cargo las traducciones
                    miNoticia = NoticiaN.NoticiaSelect(miNoticia)
                    '*******************************************************
                    'TRADUCCION AL PORTUGUES
                    Dim idioma2 As New Entidades.Idioma
                    idioma2.nombre = "Portugues"
                    'TITULO
                    Dim tituloIdioma2 As New Entidades.Leyenda
                    tituloIdioma2.tag = "Titulo_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma2, tituloIdioma2)
                    txtTitPort.Text = tituloIdioma2.texto
                    'SUBTITULO
                    Dim subTituloIdioma2 As New Entidades.Leyenda
                    subTituloIdioma2.tag = "Subtitulo_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma2, subTituloIdioma2)
                    txtSubTitPort.Text = subTituloIdioma2.texto
                    'TEXTO
                    Dim textoIdioma2 As New Entidades.Leyenda
                    textoIdioma2.tag = "Texto_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma2, textoIdioma2)
                    txtTextoPort.Text = textoIdioma2.texto
                    '*******************************************************
                    'TRADUCCION AL INGLES 
                    Dim idioma3 As New Entidades.Idioma
                    idioma3.nombre = "English"
                    'TITULO
                    Dim tituloIdioma3 As New Entidades.Leyenda
                    tituloIdioma3.tag = "Titulo_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma3, tituloIdioma3)
                    txtTitEng.Text = tituloIdioma3.texto
                    'SUBTITULO
                    Dim subTituloIdioma3 As New Entidades.Leyenda
                    subTituloIdioma3.tag = "Subtitulo_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma3, subTituloIdioma3)
                    txtSubTitEng.Text = subTituloIdioma3.texto
                    'TEXTO
                    Dim textoIdioma3 As New Entidades.Leyenda
                    textoIdioma3.tag = "Texto_" + miNoticia.CodigoNoticia.ToString
                    miIdioma.consultarTraduccionNoticia(idioma3, textoIdioma3)
                    txtTextoEng.Text = textoIdioma3.texto
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
                'obtengo el codigo
                miNoticia = NoticiaN.NoticiaSelect(miNoticia)
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
                miIdioma.modificarTraduccionNoticia(idioma1, miNoticia, leyendasIdioma1)
                'cargo la traduccion al portugues
                miIdioma.modificarTraduccionNoticia(idioma2, miNoticia, leyendasIdioma2)
                'cargo la traduccion al ingles
                miIdioma.modificarTraduccionNoticia(idioma3, miNoticia, leyendasIdioma3)
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