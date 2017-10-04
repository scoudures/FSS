Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class VideoModificar
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

    Private Sub VideoModificar_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("VideoModificar")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'esta linea es para evitar que tire un error "UnobstrusiveValidation..." por el uso
            'de los controles de validacion, sino hay que actualizar Jquery.
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None

            If Not IsPostBack Then
                If Not Request.Params("CodigoVideo") Is Nothing Then
                    Dim miVideo As New Entidades.Video
                    Dim codigoVideo As Integer = Request.Params("CodigoVideo")
                    miVideo.CodigoVideo = codigoVideo

                    miVideo = videoN.getByCodigo(miVideo)
                    TxtTitulo.Text = miVideo.Titulo
                    txtRuta.Text = miVideo.Archivo
                End If
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoModificar", ex2)
        End Try

    End Sub

    Private Sub VideoModificar_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("VideoModificar")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoModificar", ex2)
        End Try
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim resultado As Integer
        If Not Request.Params("CodigoVideo") Is Nothing Then
            Try
                'creo objeto be y cargo los datos
                Dim miVideo As New Entidades.Video
                'obtengo el codigo del proveedor que me viene por la URL
                miVideo.CodigoVideo = Request.Params("CodigoVideo")
                miVideo.Titulo = TxtTitulo.Text

                If FileUpload1.HasFile Then
                    miVideo.Archivo = FileUpload1.FileName
                Else
                    miVideo.Archivo = txtRuta.Text
                End If
                'subo la imagen
                subirArchivo()

                'actualizo en la BD
                resultado = VideoN.Modificar(miVideo)
            Catch ex As Exception
                TratarErrorEnCatch("VideoModificar", ex)
            End Try
            'vuelvo a la página del Gestor
            Response.Redirect("~/Negocio/GestorVideos.aspx")
        End If
    End Sub
    Private Sub subirArchivo()
        Try
            If FileUpload1.HasFile Then
                Dim fileName As String = FileUpload1.FileName
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Videos/") & fileName)
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoModificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoModificar", ex2)
        End Try
    End Sub


    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Negocio/GestorVideos.aspx")
    End Sub

End Class