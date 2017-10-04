Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class VideoNuevo
    Inherits PaginaBase

    Private _viedoN As New Negocio.VideoN
    Public Property videoN() As Negocio.VideoN
        Get
            Return _viedoN
        End Get
        Set(ByVal value As Negocio.VideoN)
            _viedoN = value
        End Set
    End Property

    Private Sub VideoNuevo_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("VideoNuevo")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'esta linea es para evitar que tire un error "UnobstrusiveValidation..." por el uso
            'de los controles de validacion, sino hay que actualizar Jquery.
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not Page.IsPostBack Then

            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoNuevo", ex2)
        End Try
    End Sub

    Private Sub VideoNuevo_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("VideoNuevo")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoNuevo", ex2)
        End Try

    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        'vuelvo a la pagina listado de proveedores
        Response.Redirect("~/Negocio/GestorVideos.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        'creo objeto y cargo los datos desde los textbox
        Dim miVideo As New Entidades.Video
        miVideo.Titulo = TxtTitulo.Text
        miVideo.Archivo = FileUpload1.FileName

        Try
            'subo la imagen al directorio del servidor
            subirImagen()
            'actualizo la tabla Video de la bd
            VideoN.Nuevo(miVideo)
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoNuevo", ex2)
        End Try
        'vuelvo a la pagina de proveedor
        Response.Redirect("~/Negocio/GestorVideos.aspx")
    End Sub

    Private Sub subirImagen()
        Try
            If FileUpload1.HasFile Then
                Dim fileName As String = FileUpload1.FileName
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Videos/") & fileName)
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("VideoNuevo", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("VideoNuevo", ex2)
        End Try
    End Sub
End Class