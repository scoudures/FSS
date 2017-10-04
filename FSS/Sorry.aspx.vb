Public Class Sorry
    Inherits System.Web.UI.Page

    Private Sub Sorry_Error(sender As Object, e As EventArgs) Handles Me.Error
        Try

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'deslogueo el usuario
            Response.Cookies.Clear()

            'Elimino todas las variables de sesion
            Session("Idioma") = Nothing
            Session("Autenticado") = 0
            Session("Usuario") = Nothing
            Session.RemoveAll()
            Session.Abandon()

        Catch ex As Exception

        End Try
    End Sub

End Class