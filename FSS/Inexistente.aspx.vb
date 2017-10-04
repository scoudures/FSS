Public Class Inexistente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'deslogueo el usuario
        Response.Cookies.Clear()

        'Elimino todas las variables de sesion
        Session("Idioma") = Nothing
        Session("Autenticado") = 0
        Session("Usuario") = Nothing
        Session.RemoveAll()
        Session.Abandon()
    End Sub

End Class