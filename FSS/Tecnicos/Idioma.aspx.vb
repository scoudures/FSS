Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Idioma
    Inherits PaginaBase

    Private _miIdioma As New neg.IdiomaN
    Public Property miIdioma() As neg.IdiomaN
        Get
            Return _miIdioma
        End Get
        Set(ByVal value As neg.IdiomaN)
            _miIdioma = value
        End Set
    End Property

    Dim idiomas As New List(Of ent.Idioma)

    Private Sub Idioma_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Idioma")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            ControlarAutenticacion("Idioma")
            ControlarConsistencia("Idioma")
            If Not IsPostBack Then
                EnlazarIdiomas()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        Try
            Dim nuevoIdioma As New ent.Idioma(txtIdioma.Text)
            miIdioma.guardar(nuevoIdioma)
            miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se ingresó un nuevo idioma: " & nuevoIdioma.nombre)
            EnlazarIdiomas()
            txtIdioma.Text = ""
            grdIdioma.Visible = True
            ListarLeyendasDe(nuevoIdioma)
            Response.Redirect("~/Tecnicos/Idioma.aspx")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub
    
    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Try
            Dim unIdioma As New ent.Idioma(listaIdioma2.SelectedItem.Value)
            miIdioma.borrar(unIdioma)
            miMensajero.EscribirBitacora("Delete", miUsuario.login, "Se eliminó el idioma: " & unIdioma.nombre)
            grdIdioma.Visible = False
            EnviarMensaje(Panel1, "Idioma Eliminado", True)
            EnlazarIdiomas()
            Response.Redirect("~/Tecnicos/Idioma.aspx")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub
    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            grdIdioma.Visible = True
            Dim unIdioma As New ent.Idioma(listaIdioma.SelectedItem.Value)
            ListarLeyendasDe(unIdioma)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try

    End Sub

    Private Sub EnlazarIdiomas()
        Try
            idiomas = miIdioma.listar
            listaIdioma.DataSource = idiomas
            listaIdioma.DataTextField = "Nombre"
            listaIdioma.DataBind()
            listaIdioma2.DataSource = idiomas
            listaIdioma2.DataTextField = "Nombre"
            listaIdioma2.DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        End Try
    End Sub
    Private Sub ListarLeyendasDe(ByRef unIdioma As ent.Idioma)
        Try
            grdIdioma.DataSource = miIdioma.listarLeyendas(unIdioma)
            grdIdioma.DataBind()
            'miMensajero.EscribirBitacora("Consulta Leyendas", miUsuario.login, "Listando leyendas.")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub

    Protected Sub grdIdioma_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles grdIdioma.PageIndexChanging
        Try
            Dim unIdioma As New ent.Idioma(listaIdioma.SelectedItem.Value)
            grdIdioma.PageIndex = e.NewPageIndex
            ListarLeyendasDe(unIdioma)
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub

    Private Sub grdIdioma_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles grdIdioma.RowCancelingEdit
        Try
            grdIdioma.EditIndex = -1
            enlazar()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try

    End Sub


    Private Sub grdIdioma_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grdIdioma.RowEditing
        Try
            grdIdioma.EditIndex = e.NewEditIndex
            enlazar()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try

    End Sub


    Private Sub grdIdioma_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles grdIdioma.RowUpdating
        Try
            Dim unIdioma As New ent.Idioma(listaIdioma.SelectedItem.Value)
            Dim unaLeyenda As New ent.Leyenda
            unaLeyenda.tag = CType(grdIdioma.Rows(e.RowIndex).FindControl("LblEtiqueta"), Label).Text
            Dim texto As String = CType(grdIdioma.Rows(e.RowIndex).FindControl("txtTexto"), TextBox).Text
            miIdioma.actualizarTraduccion(unIdioma, unaLeyenda, texto)
            miMensajero.EscribirBitacora("Update", miUsuario.login, "Se modificó una leyenda del idioma: " & unIdioma.nombre & " - " & unaLeyenda.tag.ToString)
            'para  finalizar la edicion y que el boton actualizar vuelva a ser editar
            grdIdioma.EditIndex = -1
            enlazar()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try

    End Sub
    Private Sub enlazar()
        Try
            grdIdioma.Visible = True
            Dim unIdioma As New ent.Idioma(listaIdioma.SelectedItem.Value)
            ListarLeyendasDe(unIdioma)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Idioma", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Idioma", ex2)
        End Try
    End Sub

End Class
