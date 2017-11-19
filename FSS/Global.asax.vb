Imports System.Web.SessionState
Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Global_asax
    Inherits System.Web.HttpApplication
    Dim miMensajero As New neg.Mensajero
    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la sesión
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Try
            ' Se desencadena cuando se produce un error
            Dim miExcepcion As Exception = Server.GetLastError
            TratarError("(Global.asax)", miExcepcion)
            Server.ClearError()
        Catch ex As Exception
            miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción GLOBAL => " & ex.Source & " (" & ex.Message & ")")
        End Try
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la sesión
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub
    Private Sub TratarError(ByVal miPagina As String, ByRef ex As Exception)
            miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción en la PAGINA " & miPagina & " => " & ex.HResult.ToString & " (" & ex.Message & ")")
        If ex.Message <> "Subproceso anulado." Then
            If ex.Message.Contains("no existe") Then
                Response.Redirect("~/Inexistente.aspx")
            Else
                Response.Redirect("~/Sorry.aspx")
            End If

        End If
    End Sub
End Class